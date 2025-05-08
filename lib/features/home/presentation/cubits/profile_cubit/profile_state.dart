part of 'profile_cubit.dart';

enum UploadStatus { initial, loading, success, error }

class ProfileState extends Equatable {
  final File? image;
  final String? imageUrl;
  final UploadStatus uploadStatus;
  final String? errorMessage;

  const ProfileState({
    this.image,
    this.imageUrl,
    this.uploadStatus = UploadStatus.initial,
    this.errorMessage,
  });

  ProfileState copyWith({
    File? image,
    String? imageUrl,
    UploadStatus? uploadStatus,
    String? errorMessage,
  }) {
    return ProfileState(
      image: image ?? this.image,
      imageUrl: imageUrl ?? this.imageUrl,
      uploadStatus: uploadStatus ?? this.uploadStatus,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [image, imageUrl, uploadStatus, errorMessage];
}