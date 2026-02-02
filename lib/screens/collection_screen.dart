import 'package:faym/collections_list.dart';
import 'package:faym/models/collection_model.dart';
import 'package:faym/widgets/collection_card.dart';
import 'package:flutter/material.dart';



class CollectionScreen extends StatefulWidget {
  const CollectionScreen({super.key});

  @override
  State<CollectionScreen> createState() => _CollectionScreenState();
}

class _CollectionScreenState extends State<CollectionScreen> {

   int? _expandedIndex;

  late final List<Collection> _collections;

   @override
    void initState() {
      super.initState();
      _collections = mockCollections();
    }

   
    void _onCardTap(int index) {
      setState(() {
        if (_expandedIndex == index) {
          _expandedIndex = null;
        } else {
          _expandedIndex = index;
        }
      });
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Collections',
        style: TextStyle(
          fontWeight: .w600 ,
        ),
        ),
        centerTitle: true,
        leading:IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
         separatorBuilder: (context, index) => SizedBox(height: 12),
          itemCount: _collections.length,
          itemBuilder: (context, index) {
             return CollectionCard(
               collection: _collections[index],
                isExpanded: _expandedIndex == index,
                onTap: () => _onCardTap(index),
             );
          },
          ),
      
    );
  }
}