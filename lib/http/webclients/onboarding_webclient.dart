import 'dart:convert';
import 'package:http/http.dart';
import 'package:http_interceptor/http/intercepted_client.dart';
import '../../models/onboarding.dart';
import '../../models/onboarding_result.dart';
import '../interceptors/logging-interceptor.dart';

final Client client =
    InterceptedClient.build(interceptors: [LoggingInterceptor()]);

const String baseUrl = 'onboarding-acquisition.qa.guideinvestimentos.com.br';
const String baseUrlEndpoint = 'acquisition';

class OnboardingWebClient {
  Future<OnboardingResult> save(Onboarding transaction) async {
    final String teste = _populateFromJson(transaction.cpf);

    final String transactionJson = _populateFromJson(transaction.cpf);

    final Response response = await client.post(
      Uri.https(baseUrl, baseUrlEndpoint),
      headers: {
        'Content-type': 'application/json',
        'projectHash': '4001f984-a630-4645-b810-00cc66f1b108',
        'Authorization':
            'Bearer eyJraWQiOiJEWDlONSs5dXJwMjBpSFRxa2ZBMURBckF5YTUzQU16Y1ByVkMwZ3A1S0RBPSIsImFsZyI6IlJTMjU2In0.eyJzdWIiOiIyZzVtY2Foa3Vzc2dwYmgzZHNpZDQzMmJtaSIsInRva2VuX3VzZSI6ImFjY2VzcyIsInNjb3BlIjoiZ3VpZGVcL3ZhbGVtb2JpLnJlYWQgZ3VpZGVcL3ZhbGVtb2JpLndyaXRlIiwiYXV0aF90aW1lIjoxNjU2MzY5ODc2LCJpc3MiOiJodHRwczpcL1wvY29nbml0by1pZHAuc2EtZWFzdC0xLmFtYXpvbmF3cy5jb21cL3NhLWVhc3QtMV9zd3pMRGhTYTciLCJleHAiOjE2NTYzNzM0NzYsImlhdCI6MTY1NjM2OTg3NiwidmVyc2lvbiI6MiwianRpIjoiMWRhMDI1N2UtMThkNC00ZDJkLThlMzgtNTE4ZDEyNGY5MmNjIiwiY2xpZW50X2lkIjoiMmc1bWNhaGt1c3NncGJoM2RzaWQ0MzJibWkifQ.YxzebqVTOsKEZzkg9s0f3S1TXD4vvuAki_-PxNTWtmSSnlLUUv7gZhghKH9YzTVpxxW7yov_36Jn-XEopmJaDsVIePjqfsP4S1l5Es5mVXzpk9E9vXeuU__MQTHfFOD9hhFJky6P1GIntNhC38S1APS-1U938je3Qqv18J15XdN73AbPuCdmAc0dnjGHQTigWICBhlHeNFDpcZnkD3SN_5jYPg3-DqLjcXLh66YQB2hU7Kv8ywHtxXJdSNZhvXIo2mLj4CRehl2Xfl335XkdL04yR-JQNuJpKo6LWTMbpfGJO_LHxRIV3wHWHs39HNAEbkeFG3dV-0NnbkMr6pT4uQ',
      },
      body: transactionJson,
    );

    final onboardingResult = OnboardingResult("Success");
    return onboardingResult;
  }

  String _populateFromJson(String? cpf) {
    return '''{
"cpf": "$cpf",
"fullName": "Thiago Acquisition Primeiro",
"birthDate": "2002-05-26T15:06:21.231Z",
"genderId": 1,
"address": {
"address": "rua teste",
"number": "10",
"address2": "",
"neighborhood": "vila maua",
"cityId": 3550308,
"federativeUnitId": 2,
"zipCode": "09453636",
"countryId": 33,
"isMain": true
},
"nationality": {
"id": 1,
"cityId": 3550308,
"federativeId": 2,
"countryId": 33
},
"educationLevelId": 7,
"marital": {
"maritalStatusId": 1,
"partnerCpf": "",
"partnerName": ""
},
"parents": {
"fatherName": "Pessoinha Linda",
"motherName": "nome da mae"
},
"professionalActivityId": 24,
"document": {
"typeId": 1,
"number": "1212121",
"federativeUnitId": 2,
"documentTypeIssuingAgencieId": 15
},
"banks": [
{
"bankId": 1,
"bankTypeId": 1,
"branch": "1000",
"number": "1",
"digit": "1",
"isMain": true
}
],
"email": {
"address": "f.flauzino@guide.com"
},
"phone": {
"mobilePhone": "11999999999"
},
"occupation": {
"professionalActivityId": 24,
"workplace": "teste",
"workplaceCnpj": ""
},
"financialStatus": {
"moneyOriginId": 1,
"originDescription": "",
"monthlyIncome": 60000,
"amountInvested": 60000,
"totalAssets": 60000
},
"declarationAnswers": {
"qualifiedInvestor": false,
"qualifiedInvestorId": 0,
"professionalInvestor": false,
"professionalInvestorId": 0,
"politicallyExposed": false,
"linkedToGuide": false,
"taxResidenceInAnotherCountry": false,
"taxResidenceCountryId": 0
},
"terms": [
{
"id": 4,
"version": 1
},
{
"id": 5,
"version": 1
},
{
"id": 6,
"version": 1
},
{
"id": 7,
"version": 1
},
{
"id": 8,
"version": 1
},
{
"id": 16,
"version": 1
},
{
"id": 66,
"version": 5
},
{
"id": 82,
"version": 8
},
{
"id": 84,
"version": 1
},
{
"id": 85,
"version": 1
}
],
"contracts": [
{
"id": 10,
"version": 1
},
{
"id": 11,
"version": 1
}
]
}''';
  }
}
