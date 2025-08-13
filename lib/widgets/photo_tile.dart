import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/photo.dart';

class PhotoTile extends StatelessWidget {
  final Photo photo;
  const PhotoTile({super.key, required this.photo});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final imageHeight = screenWidth * (photo.height / photo.width);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CachedNetworkImage(
            imageUrl: photo.downloadUrl,
            width: screenWidth,
            height: imageHeight,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 8),
          Text(
            photo.author,
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            "ID: ${photo.id} • ${photo.width}x${photo.height}",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w400,
              fontSize: 13,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}
