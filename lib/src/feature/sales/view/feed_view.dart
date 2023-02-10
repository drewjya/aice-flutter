import 'package:aice/src/src.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FeedView extends HookConsumerWidget {
  const FeedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    useEffect(() {
      Future.microtask(
          () => ref.read(salesHistoryTodayProvider.notifier).load());
      return null;
    }, [ref.watch(authProvider)]);
    ref.listen(salesHistoryTodayProvider, (previous, ProviderValue next) {
      next.maybeWhen(
        orElse: () {},
        error: (error) {
          if (error.status == ApiFailure.unauthorized) {
            navigatorKey.currentState?.pushNamedAndRemoveUntil(
                LoginView.routeName, (route) => false);
          }
        },
      );
    });
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(
            top: 5.height(context),
          ),
          width: 100.width(context),
          child: Consumer(builder: (context, ref, child) {
            final auth = ref.watch(authProvider).asData?.value;
            if (auth == null) {
              return const SizedBox.shrink();
            }
            return CartWidget(auth: auth);
          }),
        ),
        Expanded(child: Consumer(
          builder: (context, ref, child) {
            return ref.watch(authProvider).when(
              data: (data) {
                if (data.jenisAkun == "SPG") {
                  return Column(
                    children: const [
                      FeedTitle.spg(),
                      FeedHeader.spg(),
                      Expanded(child: FeedBody.spg()),
                    ],
                  );
                } else {
                  return Column(
                    children: const [
                      FeedTitle(),
                      Expanded(child: FeedBody()),
                    ],
                  );
                }
              },
              error: (error) {
                return Text(error.message);
              },
              loading: () {
                return const CircularProgressIndicator();
              },
            );
          },
        )),
      ],
    );
  }
}
