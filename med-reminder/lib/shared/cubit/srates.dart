abstract class MedRemindStates
{

}
class InitaialStates extends MedRemindStates{}
class ChangeNavBarState extends MedRemindStates{}
class CreateDataBase extends MedRemindStates{}
class GetFromDataBase extends MedRemindStates{}
class InsertToDataBase extends MedRemindStates{}
class InsertToProfileDataBase extends MedRemindStates{}
class CheckLogInInfo extends MedRemindStates{}
class CreateProfileDataBase extends MedRemindStates{}
class LoadingDataNews extends MedRemindStates{}
class SuccefulGetHealthData extends MedRemindStates{}
class Updatedata extends MedRemindStates{}
class ErrorGetHealthData extends MedRemindStates {
  final String error;

  ErrorGetHealthData({
    required this.error,
  });
}
class DeleteFromDataBase extends MedRemindStates{}

