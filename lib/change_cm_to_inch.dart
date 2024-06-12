class ChangeCmToInch extends StatefulWidget {
  const ChangeCmToInch({super.key});

  @override
  State<ChangeCmToInch> createState() => _ChangeCmToInchState();
}

class _ChangeCmToInchState extends State<ChangeCmToInch> {
  TextEditingController txtCm = TextEditingController();
  TextEditingController txtInch = TextEditingController();
  List<String> dskq = [];

  void chuyenDoiCm() {
    double cm = double.parse(txtInch.text);
    double ketQuaCm = cm * 2.54;
    setState(() {
      txtCm.text = ketQuaCm.toString() as String;
    });
  }

  void chuyenDoiInch() {
    double inch = double.parse(txtCm.text);
    double ketQuaInch = inch / 2.54;
    setState(() {
      txtInch.text = ketQuaInch.toString() as String;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Phạm Hữu Lộc'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: txtCm,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Chiều dài (cm)",
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      onPressed: chuyenDoiCm, child: Icon(Icons.arrow_upward)),
                  ElevatedButton(
                      onPressed: chuyenDoiInch,
                      child: Icon(Icons.arrow_downward))
                ],
              ),
            ),
            TextField(
              controller: txtInch,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Chiều dài (inch)",
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Kết quả chuyển đổi:",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("${txtInch.text}inch = ${txtCm.text}cm"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
