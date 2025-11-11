**Nguyen Thi Hoai Ha -22IT073**
# 📊 Expense Tracker - Flutter App

A beautiful and feature-rich expense tracking application built with Flutter, featuring local data storage, interactive charts, and intuitive expense management.

## ✨ Features

### 💰 Core Functionality
- **Add Expenses** - Track expenses with title, amount, category, date, and notes
- **Edit & Delete** - Modify or remove existing expenses
- **Categorization** - 7 predefined categories with unique colors and icons
- **Local Storage** - Data persistence using Hive database

### 📊 Analytics & Visualization
- **Pie Charts** - Visual breakdown of spending by category
- **Bar Charts** - Weekly spending trends
- **Statistics Screen** - Detailed category-wise analysis
- **Real-time Updates** - Live data synchronization

### 🎨 User Experience
- **Beautiful UI** - Material Design 3 with custom color scheme
- **Responsive Design** - Adapts to different screen sizes
- **Intuitive Navigation** - Easy-to-use interface
- **Search & Filter** - Quick expense lookup

## 🛠️ Technical Stack

- **Framework**: Flutter 3.19+
- **Language**: Dart 2.19+
- **State Management**: Provider 6.1+
- **Local Database**: Hive 2.2+
- **Charts**: fl_chart 0.66+
- **Dependency Injection**: Provider


## 🚀 Installation & Setup

### Prerequisites
- Flutter SDK 3.19.0 or higher
- Dart SDK 2.19.0 or higher
- Android Studio/VSCode with Flutter extension

### Steps to Run

1. **Clone the repository**
   ```bash
   git clone https://github.com/hanth0509/expense_tracker.git
   cd expense_tracker
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Generate Hive adapters**
   ```bash
   flutter packages pub run build_runner build --delete-conflicting-outputs
   ```

4. **Run the application**
   ```bash
   flutter run
   ```

## 📊 Expense Categories

The app supports 7 expense categories:
- 🍔 **Food** - Restaurants, groceries, coffee
- 🚗 **Transportation** - Fuel, tickets, rideshare
- 🛍️ **Shopping** - Clothes, electronics, gifts
- 🎬 **Entertainment** - Movies, concerts, hobbies
- 📄 **Bills** - Utilities, subscriptions, rent
- 🏥 **Healthcare** - Medical, pharmacy, fitness
- 📦 **Other** - Miscellaneous expenses

## 🔧 Key Features Implementation

### State Management with Provider
```dart
class ExpenseProvider with ChangeNotifier {
  List<Expense> get expenses => _expenses;
  double get totalExpenses => _calculateTotal();
  // ... other business logic
}
```

### Local Storage with Hive
```dart
@HiveType(typeId: 1)
class Expense {
  @HiveField(0) final String id;
  @HiveField(1) final String title;
  @HiveField(2) final double amount;
  // ... other fields
}
```

### Interactive Charts with fl_chart
```dart
PieChart(
  PieChartData(
    sections: _buildSections(),
    centerSpaceRadius: 40,
  ),
)
```

## 🎯 Learning Outcomes

This project demonstrates:
- ✅ **Advanced State Management** with Provider pattern
- ✅ **Local Data Persistence** using Hive database
- ✅ **Data Visualization** with interactive charts
- ✅ **Clean Architecture** with separation of concerns
- ✅ **Material Design 3** implementation
- ✅ **Responsive UI** design principles

## 📈 Performance Features

- **Optimized Rebuilds** - Selective widget updates
- **Efficient Data Handling** - Lazy loading and caching
- **Smooth Animations** - 60fps chart animations
- **Memory Management** - Proper disposal of controllers

## 📄 Screenshot
/assets
