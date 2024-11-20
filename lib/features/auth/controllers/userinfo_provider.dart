import 'package:image_picker/image_picker.dart';
import 'package:petetco/commons/dto/userchangepassword_dto.dart';
import 'package:petetco/commons/models/userinfo_model.dart';
import 'package:petetco/commons/services/auth_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'userinfo_provider.g.dart';

@riverpod
class UserInfoState extends _$UserInfoState {
  @override
  UserInfo build() {
    // Initialize with an empty UserInfo object
    return UserInfo();
  }

  /// Fetch user info asynchronously and update state
  Future<UserInfo> userInfo() async {
    try {
      final user = await AuthService().userInfo();
      state = user; // Update state
      return user;
    } catch (e) {
      // Handle any errors and log them if necessary
      return state; // Return the existing state on failure
    }
  }

  /// Update avatar and optionally refresh user info
  Future<bool> updateAvatar(XFile avatar) async {
    try {
      final result = await AuthService().updateAvatar(avatar);
      if (result) {
        // Refresh user info after successful update
        await userInfo();
      }
      return result;
    } catch (e) {
      // Handle any errors and log them if necessary
      return false; // Return failure status
    }
  }

  /// Logout the user and reset the state
  Future<bool> logoutProfile() async {
    try {
      await AuthService().Logout();
      state = UserInfo(); // Reset to initial state
      return true;
    } catch (e) {
      // Handle any errors and log them if necessary
      return false; // Return failure status
    }
  }

  Future<bool> updatePassword(UserChangePasswordDto model) async {
      var result  = await AuthService().updatePassword(model);
      return result;
  }
}