import 'package:go_router/go_router.dart';

import '../features/dashboard/dashboard_page.dart';
import '../features/developer/developer_page.dart';
import '../features/inspection/inspection_page.dart';
import '../features/trees/tree_detail_page.dart';
import '../features/trees/tree_list_page.dart';

GoRouter buildRouter() => GoRouter(
      initialLocation: '/',
      routes: [
        GoRoute(path: '/', builder: (_, __) => const DashboardPage()),
        GoRoute(path: '/trees', builder: (_, __) => const TreeListPage()),
        GoRoute(
          path: '/trees/:treeId',
          builder: (_, state) => TreeDetailPage(
              treeId: int.parse(state.pathParameters['treeId']!)),
        ),
        GoRoute(
          path: '/trees/:treeId/inspection',
          builder: (_, state) => InspectionPage(
              treeId: int.parse(state.pathParameters['treeId']!)),
        ),
        GoRoute(path: '/developer', builder: (_, __) => const DeveloperPage()),
      ],
    );
