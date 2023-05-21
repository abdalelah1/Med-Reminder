import 'package:flutter/material.dart';
import 'package:try_app2/shared/cubit/Cubit.dart';
Widget defultButton({
  Color color = Colors.blue,
  double width = double.infinity,
  required VoidCallback function,
  required String text,
  bool isUpper = true,
  double radius = 0.0,
}) =>
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: color,
      ),
      width: width,
      child: MaterialButton(
        // ignore: sort_child_properties_last
        child: Text(
          isUpper ? text.toUpperCase() : text,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        onPressed: function,
      ),
    );

NetworkImage Test(article) {
  if (article['urlToImage'] == null) {
    return NetworkImage(
        'https://upload.wikimedia.org/wikipedia/commons/thumb/1/11/Test-Logo.svg/1566px-Test-Logo.svg.png');
  } else
    return NetworkImage('${article['urlToImage']}');
}

Widget defultformfiel({
  required TextEditingController controller,
  required TextInputType type,
  String labelname = '',
  required Widget prefix,
  GestureTapCallback? onTap,
  FormFieldValidator? validate,
  ValueChanged<String>? onChange,
}) =>
    TextFormField(
      validator: validate,
      controller: controller,
      onTap: onTap,
      onChanged: onChange,
      keyboardType: type,
      decoration: InputDecoration(
        prefixIcon: prefix,
        border: OutlineInputBorder(),
        labelText: labelname.toString(),
      ),
    );

NavigateTo(Widget, context) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => Widget));

Widget Data(Map map, context) => Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 40.0,
            backgroundColor: Colors.blue,
            backgroundImage: AssetImage('lib/assets/images/icon.png'),
          ),
          const SizedBox(
            width: 15.0,
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ' ${map['medname']}',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
                Row(
                  children: [
                    Text(
                      "Start:${map['startday']}",
                      style:
                          const TextStyle(color: Colors.grey, fontSize: 15.0),
                    ),
                    const SizedBox(width: 10),
                    Flexible(
                      child: Text(
                        "Ended:${map['endday']}",
                        style:
                            const TextStyle(color: Colors.grey, fontSize: 15.0),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 15.0,
          ),
        ],
      ),
    );

Widget buildMedInfo(Map map, context) => Container(
      height: 250,
      width: 300,
      child: Card(
        color: Color.fromARGB(255, 129, 115, 188),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              '${map['medname']}',
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            children: [
              const Text(
                'Count Of Drugs :',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.normal),
              ),
              Text(
                '   ${map["medcount"]}',
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const Text(
                'Drug Per Day     :',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.normal),
              ),
              Text(
                '  ${map["medcountperday"]}',
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const Text(
                'Every        :',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.normal),
              ),
              Text(
                '   ${map["medcountperday"]} Hours',
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const Text(
                'End Date  :',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.normal),
              ),
              Text(
                '   ${map["endday"]}',
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text('Delete Medicine'),
                      content:
                          Text("are you sure for delete ; ${map['medname']}"),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context, 'Cancel');
                          },
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context, 'OK');
                            MedRemindCubit.get(context)
                                .DeleteDatabase(id: map['id']);
                          },
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  );
                },
                icon: const Icon(
                  Icons.delete_forever,
                  size: 30,
                ),
              ),
              const SizedBox(
                width: 120,
              ),
              IconButton(
                  onPressed: () {
                    TextEditingController controller = TextEditingController();
                    showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text('Delete Medicine'),
                        content: defultformfiel(
                            controller: controller,
                            type: TextInputType.number,
                            prefix: Icon(Icons.numbers)),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context, 'Cancel');
                            },
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () {
                              int x = int.parse(map['medcount']);
                              int y = int.parse(controller.text);
                              Navigator.pop(context, 'OK');
                              MedRemindCubit.get(context)
                                ..UpdateMedicine(
                                    id: map['id'], medcount: x - y);
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                    );
                  },
                  icon: Icon(Icons.check))
            ],
          )
        ]),
      ),
    );

// Widget TestUrl(article) {
//   if (article['url'] == null) {
//     print('null url');
//     return web_view('');
    
//   } else
//     print('not null url');
//   return web_view(article['url']);
// }

Widget BuildArticleItem(article, context) {
  return InkWell(
    onTap: () {
      var testurl =
          'https://www.skynewsarabia.com/technology/1577798-%D8%AF%D9%88%D8%A7%D8%A1-%D8%AA%D8%AE%D9%81%D9%8A%D9%81-%D8%A7%D9%84%D9%88%D8%B2%D9%86-%D8%A7%D9%84%D8%B3%D8%AD%D8%B1%D9%8A-%D9%85%D8%B4%D8%A7%D9%87%D9%8A%D8%B1-%D9%8A%D8%B5%D9%84%D9%88%D9%86-%D8%B3%D8%B1-%D8%B3%D9%8A%D9%85%D8%A7%D8%BA%D9%84%D9%88%D8%AA%D9%8A%D8%AF';
      var url1 = article['url'].toString();
      print("urrrrrl" + url1);
      if (url1 == null) url1 = testurl;
      // Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => web_view( article['url'])));
     
    },
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Container(
              width: 140.0,
              height: 140.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                image: DecorationImage(image: Test(article)),
              )

              // image: NetworkImage('${article['urlToImage']}') ==null ?  Image.asset('test.png')  fit: BoxFit.cover))
              // ,
              ),
          const SizedBox(
            width: 20.0,
          ),
          Expanded(
            child: Container(
              height: 120.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: Text(
                      '${article['title']}',
                      style: Theme.of(context).textTheme.bodyText1,
                      //     TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    '${article['publishedAt']}',
                    style: Theme.of(context).textTheme.bodyText2,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    ),
  );
}
