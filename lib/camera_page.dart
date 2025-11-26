import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:permission_handler/permission_handler.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  CameraController? _controller;
  List<CameraDescription>? cameras;
  bool _isCameraInitialized = false;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    // Request camera permission
    var status = await Permission.camera.request();
    if (status.isGranted) {
      // Get available cameras
      cameras = await availableCameras();
      if (cameras != null && cameras!.isNotEmpty) {
        // Use the first camera (usually back camera)
        _controller = CameraController(cameras![0], ResolutionPreset.medium);
        await _controller!.initialize();
        setState(() {
          _isCameraInitialized = true;
        });
      }
    } else {
      // Handle permission denied
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Camera permission denied')));
    }
  }

  Future<void> _takePicture() async {
    if (_controller != null && _controller!.value.isInitialized) {
      try {
        final image = await _controller!.takePicture();
        // Here you can process the image for attendance
        // For now, just show a message
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Photo taken: ${image.path}')));
        // You can add logic to save the image or send to server for face recognition
      } catch (e) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error taking picture: $e')));
      }
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Presensi Kamera')),
      body: _isCameraInitialized && _controller != null
          ? Stack(
              children: [
                CameraPreview(_controller!),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: FloatingActionButton(
                      onPressed: _takePicture,
                      child: const Icon(Icons.camera),
                    ),
                  ),
                ),
              ],
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
