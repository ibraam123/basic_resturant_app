# 🍽️ Restaurant App - Flutter & Firebase

A modern restaurant app with authentication, menu browsing, and cart functionality, built for the RecoGenie internship technical task.

## ✨ Features

- **Firebase Authentication**  
  Secure email/password login with form validation
- **Interactive Menu**  
  Browse food items with images, prices, and descriptions
- **Smart Cart System**  
  - Add/remove items with quantity adjustment
  - Real-time total calculation
  - Checkout confirmation
- **Responsive UI**  
  Adapts to different screen sizes using `flutter_screenutil`
- **State Management**  
  Efficient app state handling with **GetX**

## 🛠️ Technical Stack

- **Flutter** (Dart) - Frontend framework
- **Firebase** - Authentication backend
- **GetX** - State management & dependency injection
- **flutter_screenutil** - Responsive design

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (>=3.0.0)
- Firebase project setup

### Installation
1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/restaurant-app.git
   ```
2. Install dependencies:
   ```bash
   flutter pub get
   ```
3. Add Firebase configuration:
   - Add `google-services.json` (Android)
   - Add `GoogleService-Info.plist` (iOS)

4. Run the app:
   ```bash
   flutter run
   ```

## 🏗️ Project Structure

```
lib/
├── controllers/         # GetX controllers
│   ├── auth_controller.dart
│   └── items_controller.dart
├── models/              # Data models
│   └── food_item_model.dart
├── pages/               # App screens
│   ├── login_page.dart
│   ├── home_page.dart
│   └── cart_page.dart
├── services/            # Business logic
│   └── auth_service.dart
├── widgets/             # Reusable components
│   ├── custom_button.dart
│   ├── custom_text_field.dart
│   └── food_item_card.dart
└── main.dart            # App entry point
```

## 🎯 Task Requirements Checklist

| Requirement | Status |
|-------------|--------|
| Firebase Authentication | ✅ Implemented |
| Menu Page with Items | ✅ Implemented |
| Add-to-Cart Functionality | ✅ Implemented |
| Clean Navigation | ✅ Using GetX |
| Well-structured Codebase | ✅ Modular Architecture |
| Bonus: CI/CD Setup | ⬜️ (Optional) |
| Bonus: User-friendly UI | ✅ Implemented |

## 📝 Notes

- This project was developed as part of the RecoGenie internship technical assessment
- Implements all core requirements plus additional features like:
  - Quantity adjustment in cart
  - Responsive design
  - Clean state management

## 🤝 Contributing

While this is an assessment project, suggestions are welcome! Please open an issue first to discuss changes.

## 📄 License

This project is open-source and available under the [MIT License](LICENSE).

---

**Developed by Ibraam Magdy** for RecoGenie Internship  
📧 Contact: ibraam.software@gmail.com
```


To use this README:
1. Copy the content to a `README.md` file in your project root
2. Replace placeholder text with your actual information
3. Add real screenshots and demo video link
4. Commit and push to GitHub

This will give recruiters a comprehensive view of your work and make your submission stand out!
