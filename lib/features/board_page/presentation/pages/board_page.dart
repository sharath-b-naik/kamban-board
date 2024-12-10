// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boardview/board_item.dart';
import 'package:flutter_boardview/board_list.dart';
import 'package:flutter_boardview/boardview.dart';
import 'package:flutter_boardview/boardview_controller.dart';
import 'package:kamban/core/translations/translations.dart';
import 'package:kamban/core/utils/extensions.dart';
import 'package:kamban/features/board_page/domain/entities/section.dart';
import 'package:kamban/features/board_page/domain/entities/task.dart';
import 'package:kamban/features/board_page/presentation/cubits/tasks_cubit.dart';
import 'package:kamban/features/board_page/presentation/pages/widgets/add_task_sheet.dart';
import 'package:size_config/size_config.dart';

import 'widgets/update_task_sheet.dart';

class BoardPage extends StatelessWidget {
  static String route({String? id}) => "/board/details/${id ?? ':id'}";

  const BoardPage({super.key, required this.projectID});
  final String projectID;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TasksCubit()..loadSectionsAndTasks(projectID),
      child: Scaffold(
        appBar: AppBar(
          title: Text(context.tr(AppLocalizations.kanbanBoard)),
        ),
        body: BlocBuilder<TasksCubit, TaskCubitState>(
          builder: (context, state) {
            return state.when(
              initial: () => Center(child: Text(context.tr(AppLocalizations.noTasksLoaded))),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (message) => Center(child: Text(message)),
              loaded: (value) {
                final sections = value.sections;
                Map<String?, List<Task>> groupedTasks = value.tasks.groupBy((task) => task.sectionId);
                return KambanBoardView(sections: sections, groupedTasks: groupedTasks);
              },
            );
          },
        ),
        floatingActionButton: Builder(builder: (context) {
          final enable = context.watch<TasksCubit>().isSectionsLoaded;
          return FloatingActionButton.extended(
            onPressed: !enable ? null : () => showAddTaskModalSheet(context),
            icon: const Icon(Icons.add),
            label: Text(context.tr(AppLocalizations.addTask)),
          );
        }),
      ),
    );
  }
}

class KambanBoardView extends StatefulWidget {
  const KambanBoardView({
    super.key,
    required this.sections,
    required this.groupedTasks,
  });

  final List<Section> sections;
  final Map<String?, List<Task>> groupedTasks;

  @override
  State<KambanBoardView> createState() => _KambanBoardViewState();
}

class _KambanBoardViewState extends State<KambanBoardView> {
  final BoardViewController boardViewController = BoardViewController();

  void _handleDropItem(int listIndex, int oldItemIndex, Task task) {
    final tasksCubit = context.read<TasksCubit>();
    final sectionId = widget.sections[listIndex].id;
    final newSectionType = _getSectionTypeFromListIndex(listIndex);
    tasksCubit.moveTask(task.copyWith(sectionType: newSectionType, sectionId: sectionId));
  }

  SectionType _getSectionTypeFromListIndex(int? listIndex) {
    switch (listIndex) {
      case 0:
        return SectionType.toDo;
      case 1:
        return SectionType.inProgress;
      case 2:
        return SectionType.done;
      default:
        throw Exception('Unknown list index: $listIndex');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BoardView(
      boardViewController: boardViewController,
      lists: widget.sections.map(
        (section) {
          final tasks = widget.groupedTasks[section.id];

          return BoardList(
            draggable: false,
            headerBackgroundColor: Colors.teal,
            header: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  section.name,
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge
                      ?.copyWith(fontSize: 16.sp, fontWeight: FontWeight.normal, color: Colors.white),
                ),
              ),
            ],
            items: [
              ...(tasks ?? []).map(
                (task) {
                  return BoardItem(
                    onDropItem: (listIndex, itemIndex, oldListIndex, oldItemIndex, state) {
                      if (listIndex == null || oldItemIndex == null) return;
                      _handleDropItem(listIndex, oldItemIndex, task);
                    },
                    onTapItem: (listIndex, itemIndex, state) {
                      showUpdateTaskModalSheet(context, task);
                    },
                    item: BoardItemWIdget(task: task),
                  );
                },
              )
            ],
          );
        },
      ).toList(),
    );
  }
}

class BoardItemWIdget extends StatefulWidget {
  final Task task;
  const BoardItemWIdget({
    super.key,
    required this.task,
  });

  @override
  State<BoardItemWIdget> createState() => _BoardItemWIdgetState();
}

class _BoardItemWIdgetState extends State<BoardItemWIdget> {
  late Stopwatch _stopwatch;

  @override
  void initState() {
    super.initState();
    _stopwatch = Stopwatch();
    if (widget.task.isTiming) {
      _stopwatch.start();
    }
  }

  Stream<int> _stopwatchStream() async* {
    int initialTime = widget.task.timeSpent;
    yield initialTime;
    while (_stopwatch.isRunning) {
      await Future.delayed(const Duration(seconds: 1));
      yield initialTime + _stopwatch.elapsed.inSeconds;
    }
  }

  void onStartTimerTap() {
    if (widget.task.isTiming) {
      setState(() {
        _stopwatch.stop();
      });
      context.read<TasksCubit>().stopTimer(widget.task.id, _stopwatch.elapsed.inSeconds);
      _stopwatch.reset();
    } else {
      setState(() {
        _stopwatch.start();
      });
      context.read<TasksCubit>().startTimer(widget.task.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(8),
          color: Theme.of(context).colorScheme.secondary,
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  widget.task.content,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.normal,
                      ),
                ),
              ),
              const SizedBox(width: 5),
              IconButton(
                onPressed: () => context.read<TasksCubit>().deleteTask(widget.task.id),
                icon: const Icon(
                  Icons.delete,
                ),
              ),
              const SizedBox(width: 5),
              IconButton(
                icon: widget.task.isTiming ? const Icon(Icons.stop) : const Icon(Icons.play_arrow),
                onPressed: onStartTimerTap,
              ),
              if (widget.task.isTiming) ...[
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: StreamBuilder<int>(
                    stream: _stopwatchStream(),
                    builder: (context, snapshot) {
                      return Text(
                        '${((snapshot.data ?? widget.task.timeSpent) / 60).toStringAsFixed(2)} min',
                        style: const TextStyle(fontSize: 14),
                      );
                    },
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
