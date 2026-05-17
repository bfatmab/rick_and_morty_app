import 'package:flutter/material.dart';
import 'package:rickandmorty_app/models/characters_model.dart';

class CharacterCardview extends StatelessWidget {
  final CharacterModel characterModel;

  const CharacterCardview({
    super.key,
    required this.characterModel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7,horizontal: 7),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Container(
            height: 100,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Image.network(
                   characterModel.image,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  // 🔥 önemli
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 5),
                      Text(characterModel.name, overflow: TextOverflow.ellipsis),
                      _infosWidget(type: 'Origin', value: characterModel.origin.name),
                      _infosWidget(type: 'Species', value: '${characterModel.status} - ${characterModel.status}'),
                    ],
                  ),
                ),
              ],
            ),
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.bookmark_border)),
        ],
      ),
    );
  }

  Column _infosWidget({required String type, required String value}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          type,
          style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w300),
        ),
        Text(
          value,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
