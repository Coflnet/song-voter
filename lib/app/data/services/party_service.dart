import 'package:song_voter/app/data/models/party.dart';
import 'package:song_voter/app/data/provider/api_party_provider.dart';
import 'package:song_voter/app/data/provider/local_party_provider.dart';

import 'base_service.dart';

class PartyService extends BaseService {
  static final PartyService instance = PartyService._init();

  PartyService._init();

  final ApiPartyProvider _apiPartyProvider = ApiPartyProvider.instance;
  final LocalPartyProvider _localPartyProvider = LocalPartyProvider.instance;

  Future<List<Party>> readLocalParties() async =>
      _localPartyProvider.readAllParties();

  Future<List<Party>> readApiParties() async {
    final apiResponse = await _apiPartyProvider.readAllParties();

    print(apiResponse);

    return [];
  }

  Future<List<Party>> allParties() async {
    final privateParties = readLocalParties();
    final publicParties = readApiParties();

    final merged = [
      ...await privateParties,
      ...await publicParties,
    ];

    return merged;
  }

  Future<Party?> saveParty(String name, bool private) async {
    final party = Party(
      name: name,
      createdAt: DateTime.now(),
      private: private,
    );

    if (party.private) {}
  }
}
