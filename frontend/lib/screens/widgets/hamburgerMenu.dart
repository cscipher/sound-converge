import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:soundconverge/theme/colors.dart';

class Hamburger extends StatelessWidget {
  const Hamburger({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return Drawer(
      
      child: Container(
        color: theme.backgroundColor,
        child: Column(
          children: [
            SizedBox(height: size.height * 0.22),
            Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    height: 200,
                    width: 200,
                    child: LottieBuilder.network(
                        'https://assets2.lottiefiles.com/packages/lf20_b8ofyxmg.json'),
                  ),
                ),
                Positioned(
                  left: 92,
                  top: 40,
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage('https://picsum.photos/300'),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              'Sound Converge',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Copyright © Parallel Devs • 2021',
              style: TextStyle(fontSize: 10),
            ),
            Text(
              'harsh.here17@gmail.com',
              style: TextStyle(fontSize: 10),
            ),
            Text(
              'gautamanand022@gmail.com',
              style: TextStyle(fontSize: 10),
            ),
            Spacer(),
            SizedBox(
              height: 200,
              width: 200,
              child: LottieBuilder.network(
                  'https://assets5.lottiefiles.com/packages/lf20_bp1bwvhv.json'),
            )
          ],
        ),
      ),
    );
  }
}
