
import 'package:flutter/material.dart';
import 'package:flutter_application_rick_morty/models/character.dart';
import 'package:flutter_application_rick_morty/viewmodel/character_list_view_model.dart';
import 'package:provider/provider.dart';
class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();

    final vm = context.read<CharacterListViewmodel>();
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<CharacterListViewmodel>();

    return Column(
      children: [
        ListView.builder(
          itemCount: vm.characters.length + 1,
          itemBuilder: (context, index) {
            Character character = vm.characters[index];
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(character.image),
              ), title: Text(character.name), subtitle: Text('${character.species} - ${character.status}'),
            );
          },
        ),
      ],
    );
  }
}
