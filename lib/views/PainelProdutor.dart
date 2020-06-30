import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PainelProdutor extends StatefulWidget {
  @override
  _PainelProdutorState createState() => _PainelProdutorState();
}

class _PainelProdutorState extends State<PainelProdutor> {

  _telaConfig(){
    Navigator.pushReplacementNamed(context, "/painel-produtor-config");
  }

  final String url =
      'https://www.speedrun.com/themes/miner_ultra_adventures/cover-256.png?version=';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: Text("Fornecedor"),
        backgroundColor: Colors.orange[800],
        elevation: 0,


      ),*/
      body: SingleChildScrollView(
        child:  Column(


          children: <Widget>[

            Container(
              padding: EdgeInsets.only(top: 26),
              width: MediaQuery.of(context).size.width,
              height: 380,
              decoration: BoxDecoration(
                  color: Colors.orange[800],
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(25),
                      bottomLeft: Radius.circular(25))),
              //child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: Column(
                          children: <Widget>[
                            Text(
                              "fornecedor",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "000",
                              style: TextStyle(
                                color: Colors.white,
                                height: 2,
                              ),
                            )
                          ],
                        ),
                      ),
                      ClipOval(
                          child: Image(
                            width: 120,
                            height: 120,
                            image: NetworkImage(url),
                          )),
                      Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: Column(children: <Widget>[
                          Text(
                            "seguidores",
                            style: TextStyle(color: Colors.white),
                          ),
                          Text("200", style: TextStyle(color: Colors.white, height: 2))
                        ]),
                      )
                    ],
                  ),
                  Text(
                    "ID: 14552566",
                    style: TextStyle(color: Colors.white70, height: 3),
                  ),
                  Text("Anderson Mineirinho",
                      style: TextStyle(
                          color: Colors.white, fontSize: 24, height: 2)),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16, top: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Icon(Icons.group_add, color: Colors.white),
                            Text(
                              "amigos",
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Icon(Icons.group, color: Colors.white),
                            Text(
                              "Grupos",
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Icon(Icons.settings, color: Colors.white),
                            GestureDetector(
                              child: Text(
                                "iiiiii",
                                style: TextStyle(color: Colors.white),
                              ),
                              onTap: (){
                                Navigator.pushNamed(context, "/painel-produtor-config");
                              },
                            ),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            IconButton(
                                icon: Icon(Icons.settings, color: Colors.white),
                                onPressed: (){
                                  _telaConfig;
                                }),
                            Text(
                              "Configurações",
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),


            Container(
              height: 260,
              padding:EdgeInsets.all(42),
              child: Column(
                  children: <Widget>[

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Icon(
                              Icons.table_chart,
                              color: Colors.black54,
                            ),
                            Text("tabelas",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold
                              ),)
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Icon(
                              Icons.insert_chart,
                              color: Colors.black54,
                            ),
                            Text("vendas",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold
                              ),)
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Icon(
                              Icons.card_giftcard,
                              color: Colors.black54,
                            ),
                            Text("promoções",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold
                              ),)
                          ],
                        ),
                      ],
                    ),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Icon(Icons.code, color: Colors.grey,),
                            Text(" Qr code ", style: TextStyle(color: Colors.black54),
                            )
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Icon(Icons.blur_circular, color: Colors.grey,),
                            Text("  Bonus  ", style: TextStyle(color: Colors.black54),
                            )
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Icon(Icons.visibility, color: Colors.grey,),
                            Text("Visitas", style: TextStyle(color: Colors.black54),
                            )
                          ],
                        )
                      ],
                    )
                  ]),


            )
          ],

        ),
      ),
    );
  }
  /*Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Painel Produtor"),
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: _escolhaMenuItem,
            itemBuilder: (context){

              return itensMenu.map((String item){

                return PopupMenuItem<String>(
                  value: item,
                  child: Text(item),
                );
              }).toList();

            },
          )
        ],
      ),
      body: Container( ),
    );
  }*/
}
