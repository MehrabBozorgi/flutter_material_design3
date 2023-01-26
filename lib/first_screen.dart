import 'package:flutter/material.dart';

enum Sizes { extraSmall, small, medium, large, extraLarge }

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  Set<Sizes> selection = <Sizes>{Sizes.large, Sizes.extraLarge};
  bool isChecked = false;
  double _currentSliderValue = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Material Design 3')),
      drawer: const Drawer(),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Row(
          children: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.home)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.category)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.favorite)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),
            const Badge(
              label: Text('5', style: TextStyle(fontSize: 16)),
              child: Icon(Icons.shopping_cart),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FilledButton(
                  onPressed: () {},
                  child: const Text('FilledButton'),
                ),
                FilledButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.add),
                  label: const Text('FilledButton.icon'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FilledButton.tonalIcon(
                  onPressed: () {},
                  icon: const Icon(Icons.add),
                  label: const Text('FilledButton.tonalIcon'),
                ),
                FilledButton.tonal(
                  onPressed: () {},
                  child: const Text(' FilledButton.tonal'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 75,
              child: SegmentedButton<Sizes>(
                segments: const <ButtonSegment<Sizes>>[
                  ButtonSegment<Sizes>(
                      value: Sizes.extraSmall, label: Text('XS')),
                  ButtonSegment<Sizes>(value: Sizes.small, label: Text('S')),
                  ButtonSegment<Sizes>(value: Sizes.medium, label: Text('M')),
                  ButtonSegment<Sizes>(
                    value: Sizes.large,
                    label: Text('L'),
                  ),
                  ButtonSegment<Sizes>(
                      value: Sizes.extraLarge, label: Text('XL')),
                ],
                selected: selection,
                onSelectionChanged: (Set<Sizes> newSelection) {
                  setState(() {
                    selection = newSelection;
                  });
                },
                multiSelectionEnabled: true,
              ),
            ),
            const SizedBox(height: 20),
            Checkbox(
              checkColor: Colors.white,
              value: isChecked,
              onChanged: (bool? value) {
                setState(() {
                  isChecked = value!;
                });
              },
            ),
            const Divider(thickness: 2),
            const SizedBox(height: 20),
            const MenuBarWidget(),
            const SizedBox(height: 20),
            const CircularProgressIndicator(),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Radio(value: true, groupValue: true, onChanged: (value) {}),
                Radio(value: false, groupValue: false, onChanged: (value) {}),
              ],
            ),
            const SizedBox(height: 20),
            Slider(
              value: _currentSliderValue,
              max: 100,
              divisions: 5,
              label: _currentSliderValue.round().toString(),
              onChanged: (double value) {
                setState(() {
                  _currentSliderValue = value;
                });
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text('Show Snackbar'),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text('Awesome Snackbar!'),
                    action: SnackBarAction(
                      label: 'Action',
                      onPressed: () {},
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
              ),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}

class MenuBarWidget extends StatefulWidget {
  const MenuBarWidget({Key? key}) : super(key: key);

  @override
  State<MenuBarWidget> createState() => _MenuBarWidgetState();
}

class _MenuBarWidgetState extends State<MenuBarWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 75,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Expanded(
                child: MenuBar(
                  children: <Widget>[
                    SubmenuButton(
                      menuChildren: <Widget>[
                        MenuItemButton(
                          onPressed: () {
                            showAboutDialog(
                              context: context,
                              applicationName: 'MenuBar Sample',
                              applicationVersion: '1.0.0',
                            );
                          },
                          child: const MenuAcceleratorLabel('&About'),
                        ),
                        MenuItemButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Saved!'),
                              ),
                            );
                          },
                          child: const MenuAcceleratorLabel('&Save'),
                        ),
                        MenuItemButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Quit!'),
                              ),
                            );
                          },
                          child: const MenuAcceleratorLabel('&Quit'),
                        ),
                      ],
                      child: const MenuAcceleratorLabel('&File'),
                    ),
                    SubmenuButton(
                      menuChildren: <Widget>[
                        MenuItemButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Magnify!'),
                              ),
                            );
                          },
                          child: const MenuAcceleratorLabel('&Magnify'),
                        ),
                        MenuItemButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Minify!'),
                              ),
                            );
                          },
                          child: const MenuAcceleratorLabel('Mi&nify'),
                        ),
                      ],
                      child: const MenuAcceleratorLabel('&View'),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            child: FlutterLogo(
              size: MediaQuery.of(context).size.shortestSide * 0.5,
            ),
          ),
        ],
      ),
    );
  }
}
