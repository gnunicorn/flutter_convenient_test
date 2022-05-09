import 'package:convenient_test_manager_dart/services/convenient_test_manager_service.dart';
import 'package:convenient_test_manager_dart/services/fs_service.dart';
import 'package:convenient_test_manager_dart/services/misc_dart_service.dart';
import 'package:convenient_test_manager_dart/services/report_handler_service.dart';
import 'package:convenient_test_manager_dart/services/report_saver_service.dart';
import 'package:convenient_test_manager_dart/services/screen_video_recorder_service.dart';
import 'package:convenient_test_manager_dart/services/vm_service_wrapper_service.dart';
import 'package:convenient_test_manager_dart/stores/highlight_store.dart';
import 'package:convenient_test_manager_dart/stores/log_store.dart';
import 'package:convenient_test_manager_dart/stores/raw_log_store.dart';
import 'package:convenient_test_manager_dart/stores/suite_info_store.dart';
import 'package:convenient_test_manager_dart/stores/video_player_store.dart';
import 'package:convenient_test_manager_dart/stores/video_recorder_store.dart';
import 'package:convenient_test_manager_dart/stores/worker_super_run_store.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup({
  bool registerMiscDartService = true,
  bool registerFsService = true,
  bool registerHighlightStoreBase = true,
  bool registerVideoPlayerStoreBase = true,
}) {
  getIt.registerSingleton<LogStore>(LogStore());
  getIt.registerSingleton<SuiteInfoStore>(SuiteInfoStore());
  getIt.registerSingleton<RawLogStore>(RawLogStore());
  getIt.registerSingleton<WorkerSuperRunStore>(WorkerSuperRunStore());
  getIt.registerSingleton<VideoRecorderStore>(VideoRecorderStore());
  getIt.registerSingleton<ConvenientTestManagerService>(ConvenientTestManagerService());
  getIt.registerSingleton<VmServiceWrapperService>(VmServiceWrapperService());
  getIt.registerSingleton<ReportHandlerService>(ReportHandlerService());
  getIt.registerSingleton<ReportSaverService>(ReportSaverService());
  getIt.registerSingleton<ScreenVideoRecorderService>(ScreenVideoRecorderService.create());

  if (registerMiscDartService) getIt.registerSingleton<MiscDartService>(MiscDartService());
  if (registerFsService) getIt.registerSingleton<FsService>(FsServiceDart());
  if (registerHighlightStoreBase) getIt.registerSingleton<HighlightStoreBase>(HighlightStoreDummy());
  if (registerVideoPlayerStoreBase) getIt.registerSingleton<VideoPlayerStoreBase>(VideoPlayerStoreDummy());

  GetIt.I.get<ConvenientTestManagerService>().serve();
}