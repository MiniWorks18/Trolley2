import 'package:flutter/material.dart';
import 'package:trolley/colours.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(color: Colours.primary, padding:
        const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 5),
            child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  color: Colours.secondary,
                ),
                child: Row(mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: IconButton(color: Colours.textPrimary,
                            onPressed: () { Scaffold.of(context).openDrawer(); },
                            icon: const Icon(Icons.menu))),
                    // TODO: Give button standard effect when pressed
                    SizedBox(width: MediaQuery.of(context).size.width*0.6,
                        child: TextFormField(
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Search",
                              hintStyle: TextStyle(color: Colours.textPrimary)
                          ),
                        )
                    )
                  ],
                )
            )
        )
    );
  }

}