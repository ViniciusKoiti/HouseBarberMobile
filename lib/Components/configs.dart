import 'package:flutter/material.dart';
import 'package:housebarber/Pages/Dashboards/ListaCliente.dart';
import 'package:housebarber/Pages/Perfil/HistoricoDeAvalia%C3%A7%C3%B5es.dart';
import 'package:housebarber/Pages/Perfil/PerfilBarbeiro.dart';

class Configs extends StatelessWidget {
  const Configs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      color: Colors.grey[400],
      child: ListView(
        children: [
          SizedBox(height: 10),
          CircleAvatar(
            radius: 50,
            backgroundColor: Colors.black87,
            child: Icon(
              Icons.person,
              size: 50,
            ),
          ),
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
              side: BorderSide(color: Colors.grey.shade400, width: 1),
            ),
            child: ListTile(
              title: Text('Perfil'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BarberProfilePage()),
                );
              },
            ),
          ),
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
              side: BorderSide(color: Colors.grey.shade400, width: 1),
            ),
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
              title: Text('Historico Barbeiro'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HistoricoBarbeiros()),
                );
              },
            ),
          ),
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
              side: BorderSide(color: Colors.grey.shade400, width: 1),
            ),
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
              title: Text('Lista de Clientes'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TelaListaClientes()),
                );
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
