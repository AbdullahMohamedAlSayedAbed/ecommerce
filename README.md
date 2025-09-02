# E-Commerce App

A robust, full-featured Flutter e-commerce application built with Clean Architecture, Cubit state management, and Firebase integration. This app delivers a complete shopping experience, including an admin dashboard for product and order management, secure authentication, payment processing, and a responsive UI—all adhering to SOLID principles and clean code practices for scalability and maintainability.

## Features

- **Authentication**: Secure registration and login via Firebase, forgot/reset password, change password, and logout functionality.
- **E-Commerce Core**: Product listing with details, search and sorting, favorites for saving liked items, cart management (add/remove/update quantities), and a seamless checkout process.
- **Payment Integration**: Secure payment handling during checkout (supports PayPal simulation or real integration).
- **Admin Dashboard**: Add new products, view all orders and details, upload product images for efficient management.
- **UX/UI Enhancements**: Clean, responsive design adaptive to all devices, shimmer loading effects, and pull-to-refresh support for a polished user experience.

## Tech Stack

- **Framework**: Flutter
- **Architecture**: Clean Architecture (Data, Domain, Presentation layers)
- **State Management**: Cubit (from Bloc library)
- **Backend**: Firebase for authentication, storage, and real-time data
- **Other**: SOLID principles, RESTful APIs (if applicable), responsive UI, animations/shimmers

## Screenshots

Here are some screenshots showcasing the app's UI and features:

| | | | |
|-|-|-|-|
| <img width="200" alt="Screenshot_1746788921" src="https://github.com/user-attachments/assets/959015fb-8ed2-4767-b7c1-005dfcedea0e" /> | <img width="200" alt="Screenshot_1746788918" src="https://github.com/user-attachments/assets/88b35fd3-edfb-4d5d-82ad-4dad71a0e1b0" /> | <img width="200" alt="Screenshot_1746788909" src="https://github.com/user-attachments/assets/626ef6dd-3d9b-4558-b377-e994c3a92ada" /> | <img width="200" alt="Screenshot_1746788896" src="https://github.com/user-attachments/assets/20633c9c-55e0-469b-b620-3b6090df17e9" /> |
| <img width="200" alt="Screenshot_1746788892" src="https://github.com/user-attachments/assets/44cb4e52-090e-4ee3-b52b-0c341f68041c" /> | <img width="200" alt="Screenshot_1746788765" src="https://github.com/user-attachments/assets/b0a8962b-6379-4ec3-82bd-8cdb428e822f" /> | <img width="200" alt="Screenshot_1746788758" src="https://github.com/user-attachments/assets/89b79651-86ae-4948-889a-ad13257318f5" /> | <img width="200" alt="Screenshot_1746788735" src="https://github.com/user-attachments/assets/d2f402c0-7baf-4e0d-9872-9a84ccc3a551" /> |
| <img width="200" alt="Screenshot_1746788730" src="https://github.com/user-attachments/assets/73cfce8b-792c-4396-b7bb-f107455af5f0" /> | <img width="200" alt="Screenshot_1746787709" src="https://github.com/user-attachments/assets/ab438005-ef33-4e7b-8bc4-3783a08b0fd6" /> | <img width="200" alt="Screenshot_1746862960" src="https://github.com/user-attachments/assets/570bbc1f-1215-4a73-b52f-8394a48986b5" /> | <img width="200" alt="Screenshot_1746862954" src="https://github.com/user-attachments/assets/9137c6a4-389b-48fb-9dca-3b233a165d47" /> |
| <img width="200" alt="Screenshot_1746862948" src="https://github.com/user-attachments/assets/d1c20ac6-dee3-430c-bd66-f09ed90b916d" /> | <img width="200" alt="Screenshot_1746789606" src="https://github.com/user-attachments/assets/ddd99d49-e424-4d53-a093-d88846d9d855" /> | <img width="200" alt="Screenshot_1746789603" src="https://github.com/user-attachments/assets/6a9347b2-2c18-4be4-8352-d7c052ab4899" /> | <img width="200" alt="Screenshot_1746789588" src="https://github.com/user-attachments/assets/29780efe-50d1-402f-826a-8162157769fe" /> |
| <img width="200" alt="Screenshot_1746789585" src="https://github.com/user-attachments/assets/12c9b5ae-ac35-4e99-acd6-7cfe6a7e7f5d" /> | <img width="200" alt="Screenshot_1746789114" src="https://github.com/user-attachments/assets/f94fe350-92c2-488e-bcf5-a3b71a3bf3e2" /> | <img width="200" alt="Screenshot_1746789109" src="https://github.com/user-attachments/assets/5821bd71-addd-416a-949b-5aa2493c1f43" /> | <img width="200" alt="Screenshot_1746862856" src="https://github.com/user-attachments/assets/25c18470-374c-4cc0-b615-68403bbb8e79" /> |
| <img width="200" alt="Screenshot_1746788930" src="https://github.com/user-attachments/assets/ba42fc9a-ae88-4cfe-8085-c260d9c12d98" /> | <img width="200" alt="Screenshot_1746788925" src="https://github.com/user-attachments/assets/cbf07268-54cb-41a8-8704-1a4e503ae048" /> | | |

## Getting Started

Follow these steps to set up and run the project on your local machine.

### Prerequisites

- Flutter SDK (version 3.0 or higher recommended)
- Dart SDK
- Firebase account (for authentication and backend services)
- Android Studio or Xcode for emulators/simulators

### Installation

1. Clone the repository:
   ```
   git clone https://github.com/AbdullahMohamedAlSayedAbed/ecommerce.git
   cd e-commerce-app
   ```

2. Install dependencies:
   ```
   flutter pub get
   ```

3. Configure Firebase:
   - Set up a Firebase project and download the configuration files (google-services.json for Android, GoogleService-Info.plist for iOS).
   - Add payment API keys (e.g., Stripe/PayPal) in the relevant service files.

4. Run the app:
   ```
   flutter run
   ```

For more on Flutter development:
- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)
- [Online documentation](https://docs.flutter.dev/) for tutorials, samples, and API reference.

## Contributing

Contributions are welcome! Please fork the repository and submit a pull request for improvements or bug fixes. For major changes, open an issue first to discuss.

## Contact

For questions or feedback, reach out via [AbdullahMohamedAlSayedAbed] or open an issue on GitHub.
