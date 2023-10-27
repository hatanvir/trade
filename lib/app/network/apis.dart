class Apis{
  static var liveUrl = 'https://peanut.ifxdb.com';
  static var baseUrl = '$liveUrl/api';

  static get login => '$baseUrl/ClientCabinetBasic/IsAccountCredentialsCorrect';
  static get getCampaign => '$baseUrl/ClientCabinetBasic/IsAccountCredentialsCorrect';
  static get getProfileData => '$baseUrl/ClientCabinetBasic/GetAccountInformation';
  static get getPhoneNum => '$baseUrl/ClientCabinetBasic/GetLastFourNumbersPhone';
  static get getTrades => '$baseUrl/ClientCabinetBasic/GetOpenTrades';


}