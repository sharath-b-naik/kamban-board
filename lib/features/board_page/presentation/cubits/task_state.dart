part of 'tasks_cubit.dart';

@freezed
class TaskCubitState with _$TaskCubitState {
  const factory TaskCubitState.initial() = _Initial;
  const factory TaskCubitState.loading() = _Loading;
  const factory TaskCubitState.loaded(TaskState data) = _Loaded;
  const factory TaskCubitState.error(String message) = _Error;
}

@freezed
class TaskState with _$TaskState {
  const factory TaskState({
    @Default([]) List<Section> sections,
    @Default([]) List<Task> tasks,
  }) = _TaskState;
}
