import 'package:cardanimal/u.dart';
import 'package:flutter/material.dart';
import 'data/animals_data.dart';
import 'data/plants_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.tColor3),
        useMaterial3: true,
      ),
      // home: const AnimalListPage(title: '動物図鑑'),
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs:[
                Tab(icon: Icon(Icons.pets,color: AppColors.tColor2,)),
                Tab(icon: Icon(Icons.local_florist,color: AppColors.tColor2)),
              ]
            ),
            title:  Text('Illustrated encyclopedia of living things', style: AppFonts.quicksand(size: 16),),
          ),
          body: const TabBarView(
            children: [
              AnimalListPage(),
              PlantListPage(),
            ]
          )
        )
      )
    );
  }
}

class AnimalListPage extends StatefulWidget {
  const AnimalListPage({super.key});

  @override
  State<AnimalListPage> createState() => _AnimalListPageState();
}

class PlantListPage extends StatefulWidget {
  const PlantListPage({super.key});

  @override
  State<PlantListPage> createState() => _PlantListPageState();
}

class _AnimalListPageState extends State<AnimalListPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 8,
            crossAxisSpacing:16,
            crossAxisCount: 2,
            childAspectRatio: 0.8,

          ),
          scrollDirection: Axis.vertical,
          primary:false,
          padding: const EdgeInsets.all(32.0),
          itemCount: animals.length,
          itemBuilder: (context, index) {
            Map<String, dynamic> animal = animals[index];
            return _buildAnimalColumn(animal, context);
          },
        )
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _buildAnimalColumn(Map<String, dynamic> animal, BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AnimalDetailPage(animal: animal),
          ),
        );
      },
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                child: Image.asset(
                  animal['image'],
                  fit: BoxFit.cover,
                  height: 120,
                ),
              ),
              // Image.asset(animal['image']),
              Text(animal['name'],style:AppFonts.quicksand(size: 15)),
              Text(
                animal['description'],
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style:AppFonts.quicksand(size: 12,weight: FontWeight.w600)
              )
            ]
        ),
      ),
    );
  }

}

class _PlantListPageState extends State<PlantListPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 8,
            crossAxisSpacing:16,
            crossAxisCount: 2,
            childAspectRatio: 0.8,

          ),
          scrollDirection: Axis.vertical,
          primary:false,
          padding: const EdgeInsets.all(32.0),
          itemCount: plants.length,
          itemBuilder: (context, index) {
            Map<String, dynamic> plant = plants[index];
            return _buildPlantColumn(plant, context);
          },
        )
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _buildPlantColumn(Map<String, dynamic> plant, BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PlantDetailPage(plant: plant),
          ),
        );
      },
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
            children: [
              // ClipRRect(
              //   borderRadius: const BorderRadius.only(
              //     topLeft: Radius.circular(10),
              //     topRight: Radius.circular(10),
              //   ),
              //   child: ,
              // ),
              Image.asset(
                  plant['image'],
                  fit: BoxFit.contain,
                  height: 120,
                ),
              // Image.asset(animal['image']),
              Text(plant['name'],style:AppFonts.quicksand(size: 15)),
              Text(
                plant['description'],
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style:AppFonts.quicksand(size: 12,weight: FontWeight.w600)
              )
            ]
        ),
      ),
    );
  }

}



class AnimalDetailPage extends StatelessWidget {
  final Map<String, dynamic> animal;

  const AnimalDetailPage({Key? key, required this.animal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(animal['name'],style:AppFonts.quicksand(size: 25)), // 動物の名前をタイトルとして使用
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Image.asset(animal['image']),
              const SizedBox(height:18),// 画像
               Text('description', style:AppFonts.quicksand(size: 17)),
              Text(animal['description'],style:AppFonts.quicksand(size: 15,weight: FontWeight.w700)), // 説明
              const SizedBox(height:18),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                        children:[
                          const Icon(Icons.book, color:Colors.green),
                           Text('type', style:AppFonts.quicksand(size: 17)),
                          Text(animal['type'],style:AppFonts.quicksand(size: 15,weight: FontWeight.w700))
                        ]
                    ),
                    Column(
                        children:[
                          const Icon(Icons.map, color:Colors.green),
                           Text('origin', style:AppFonts.quicksand(size: 17)),
                          Text(animal['origin'],style:AppFonts.quicksand(size: 15,weight: FontWeight.w700)),
                        ]
                    ),
                    Column(
                        children:[
                          const Icon(Icons.height, color:Colors.green),
                           Text('size', style:AppFonts.quicksand(size: 17)),
                          Text(animal['size'],style:AppFonts.quicksand(size: 15,weight: FontWeight.w700)),
                        ]
                    )
                  ]
              )
            ],
          ),
        ),
      ),
    );
  }
}

class PlantDetailPage extends StatelessWidget {
  final Map<String, dynamic> plant;

  const PlantDetailPage({Key? key, required this.plant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(plant['name'],style:AppFonts.quicksand(size: 25)), // 動物の名前をタイトルとして使用
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Image.asset(plant['image']),
              const SizedBox(height:18),// 画像
               Text('description', style:AppFonts.quicksand(size: 17)),
              Text(plant['description'],style:AppFonts.quicksand(size: 15,weight: FontWeight.w700)), // 説明
              const SizedBox(height:18),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                        children:[
                          const Icon(Icons.book, color:Colors.green),
                           Text('season', style:AppFonts.quicksand(size: 17)),
                          Text(plant['season'],style:AppFonts.quicksand(size: 15,weight: FontWeight.w700))
                        ]
                    ),
                    Column(
                        children:[
                          const Icon(Icons.map, color:Colors.green),
                           Text('size', style:AppFonts.quicksand(size: 17)),
                          Text(plant['size'],style:AppFonts.quicksand(size: 15,weight: FontWeight.w700)),
                        ]
                    ),
                 
                  ]
              )
            ],
          ),
        ),
      ),
    );
  }
}




