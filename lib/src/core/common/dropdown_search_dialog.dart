// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:aice/src/src.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

showDropdownSearchDialog<T>({
  required List<T> item,
  required Function(T) onTap,
  required String Function(T) toName,
  required BuildContext context,
}) {
  showDialog(
    context: context,
    builder: (context) =>
        DropdownSearchDialog(item: item, onTap: onTap, toName: toName),
  );
}

class DropdownSearchDialog<T> extends HookWidget {
  final List<T> item;
  final Function(T) onTap;
  final String Function(T) toName;
  const DropdownSearchDialog({
    Key? key,
    required this.item,
    required this.onTap,
    required this.toName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final searchController = useTextEditingController();
    final listDisplayed = useState<List<T>>([]);
    useEffect(() {
      dPrint(listDisplayed.value);
      listDisplayed.value = item;
      return null;
    }, [""]);
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: searchController,
              decoration: const InputDecoration(hintText: "Cari Produk..."),
              onChanged: (value) {
                if (value.isEmpty) {
                  listDisplayed.value = item;
                  return;
                }
                var list = <T>[];
                dPrint(value);
                for (var element in item) {
                  final name = toName(element).toLowerCase();
                  // dPrint(name)
                  if (name.toLowerCase().contains(value)) {
                    list = [...list, element];
                  }
                }
                dPrint(list);
                listDisplayed.value = list;
                // listDisplayed.value =
              },
            ),
            Expanded(
                child: ListView.builder(
              itemCount: listDisplayed.value.length,
              itemBuilder: (context, index) {
                final name = toName(listDisplayed.value[index]);
                return ListTile(
                  title: Text(name),
                  onTap: () {
                    onTap(listDisplayed.value[index]);
                    Navigator.pop(context);
                  },
                );
              },
            ))
          ],
        ),
      ),
    );
  }
}
