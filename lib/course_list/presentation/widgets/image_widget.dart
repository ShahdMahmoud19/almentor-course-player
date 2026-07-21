import 'package:flutter/material.dart' ;

class ImageWidget extends StatelessWidget {
  final String imageUrl;

  const ImageWidget({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                imageUrl,
                                width: double.infinity,
                                height: 200,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Container(
                                    width: double.infinity,
                                    height: 200,
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade800,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: const Center(
                                      child: Icon(
                                        Icons.broken_image,
                                        color: Colors.white,
                                        size: 50,
                                      ),
                                    ),
                                  );
                                },
                                loadingBuilder:
                                    (context, child, loadingProgress) {
                                      if (loadingProgress == null) {
                                        return child;
                                      }
                                      return Container(
                                        width: double.infinity,
                                        height: 200,
                                        decoration: BoxDecoration(
                                          color: Colors.grey.shade800,
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                        ),
                                        child: const Center(
                                          child: CircularProgressIndicator(
                                            color: Colors.red,
                                          ),
                                        ),
                                      );
                                      
                                    },
                              ),
                            );
  }
}