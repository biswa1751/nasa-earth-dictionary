import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ViewPhoto extends StatefulWidget {
  final String text;

  const ViewPhoto({super.key, required this.text});

  @override
  ViewPhotoState createState() => ViewPhotoState();
}

class ViewPhotoState extends State<ViewPhoto> {
  String? imageUrl;
  String? errorMessage;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchNasaImage();
  }

  Future<void> _fetchNasaImage() async {
    try {
      setState(() {
        isLoading = true;
        errorMessage = null;
      });

      // Search for images from NASA API
      final searchResponse = await Dio().get(
        'https://images-api.nasa.gov/search',
        queryParameters: {
          'q': widget.text,
          'media_type': 'image',
        },
      );

      final items = searchResponse.data['collection']['items'] as List?;

      if (items == null || items.isEmpty) {
        setState(() {
          errorMessage = 'No images found for "${widget.text}"';
          isLoading = false;
        });
        return;
      }

      // Get the first available item's href
      final imageCollectionUrl = items[0]['href'] as String?;

      if (imageCollectionUrl == null) {
        setState(() {
          errorMessage = 'Invalid image data received';
          isLoading = false;
        });
        return;
      }

      // Fetch the actual image URLs from the collection
      final imageResponse = await Dio().get(imageCollectionUrl);
      final imageUrls = imageResponse.data as List?;

      if (imageUrls == null || imageUrls.isEmpty) {
        setState(() {
          errorMessage = 'No image URLs available';
          isLoading = false;
        });
        return;
      }

      // Get the first image URL (usually the largest/original)
      setState(() {
        imageUrl = imageUrls[0] as String;
        isLoading = false;
      });
    } on DioException catch (e) {
      setState(() {
        errorMessage = 'Network error: ${e.message}';
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        errorMessage = 'An unexpected error occurred: $e';
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.text),
        actions: [
          if (!isLoading)
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: _fetchNasaImage,
              tooltip: 'Refresh',
            ),
        ],
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (errorMessage != null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.error_outline,
                size: 64,
                color: Colors.red,
              ),
              const SizedBox(height: 16),
              Text(
                errorMessage!,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 24),
              ElevatedButton.icon(
                onPressed: _fetchNasaImage,
                icon: const Icon(Icons.refresh),
                label: const Text('Retry'),
              ),
            ],
          ),
        ),
      );
    }

    if (imageUrl != null) {
      return Center(
        child: CachedNetworkImage(
          imageUrl: imageUrl!,
          fit: BoxFit.contain,
          placeholder: (context, url) => const CircularProgressIndicator(),
          errorWidget: (context, url, error) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.broken_image, size: 64, color: Colors.grey),
              const SizedBox(height: 8),
              Text('Failed to load image',
                  style: TextStyle(color: Colors.grey[600])),
            ],
          ),
        ),
      );
    }

    return const Center(
      child: Text('No image available'),
    );
  }
}
