import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/photos/photos_bloc.dart';
import '../blocs/photos/photos_event.dart';
import '../blocs/photos/photos_state.dart';
import '../widgets/photo_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<PhotosBloc>().add(FetchPhotos());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
      body: BlocBuilder<PhotosBloc, PhotosState>(
        builder: (context, state) {
          if (state is PhotosLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is PhotosLoaded) {
            return ListView.builder(
              itemCount: state.photos.length,
              itemBuilder: (context, index) {
                return PhotoTile(photo: state.photos[index]);
              },
            );
          } else if (state is PhotosError) {
            return Center(child: Text(state.message));
          }
          return const SizedBox();
        },
      ),
    );
  }
}
