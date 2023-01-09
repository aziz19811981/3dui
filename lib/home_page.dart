import 'package:flutter/material.dart';
import 'package:flutter_cube/flutter_cube.dart';

class galaxy extends StatefulWidget {
  @override
  State<galaxy> createState() => _galaxyState();
}
//نعتذر هذا ما توفر لدينا من رسومات 3
class _galaxyState extends State<galaxy> {
  Object? sun;
  Object? earth;
  @override
  void initState() {
    sun = Object(
      fileName: 'assets/sun/model.obj',
    );
    earth = Object(
      fileName: 'assets/earth/earth_ball.obj',
    );
    earth?.position.setValues(0, 0, 5);
    earth?.updateTransform();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title:const Center(
            child: Text(
              'Galaxy',
            ),
          ),
        ),
        body: Container(
          child: Column(
            children: [
              Expanded(
                child: Cube(
                  onSceneCreated: (Scene scene) {
                    scene.world.add(earth!);
                    scene.camera.zoom * 50;
                  },
                ),
              ),
              Expanded(
                child: Cube(
                  onSceneCreated: (Scene scene) {
                    scene.world.add(sun!);
                    scene.camera.zoom * 50;
                  },
                ),
              ),
            ],
          ),
          
        ),
      ),
    );
  }
}
