# QiscusCore Swift Package Manager

QiscusCore telah dikonversi untuk mendukung Swift Package Manager (SPM).

## Instalasi

### 1. Menggunakan Xcode

1. Buka project MyBluebird di Xcode
2. Pilih File → Add Package Dependencies
3. Klik "Add Local..."
4. Navigate ke `/Users/user/Documents/XcodeProject/Carthage16/Carthage/Checkouts/QiscusCore-iOS`
5. Klik "Add Package"
6. Pilih target yang membutuhkan QiscusCore

### 2. Menggunakan Package.swift

Jika project Anda menggunakan SPM, tambahkan di dependencies:

```swift
dependencies: [
    .package(path: "../Carthage16/Carthage/Checkouts/QiscusCore-iOS"),
    // dependencies lainnya...
]
```

Dan di target dependencies:

```swift
.target(
    name: "MyBluebird",
    dependencies: [
        "QiscusCore",
        // dependencies lainnya...
    ]
)
```

## Migrasi dari Carthage

1. **Remove Carthage Framework**
   - Buka target settings → General
   - Remove `QiscusCore.framework` dari "Frameworks, Libraries, and Embedded Content"
   - Remove script phase untuk Carthage copy-frameworks jika ada

2. **Clean Build**
   ```bash
   rm -rf ~/Library/Developer/Xcode/DerivedData/*
   ```

3. **Build Project**
   - Clean build folder: ⌘ + Shift + K
   - Build: ⌘ + B

## Troubleshooting

### Module Not Found
Jika mendapat error "No such module 'QiscusCore'":
1. Clean build folder (⌘ + Shift + K)
2. Reset package caches: File → Packages → Reset Package Caches
3. Build ulang

### Missing QiscusRealtime
QiscusRealtime perlu dikonversi ke SPM juga atau di-embed sebagai binary framework.

## Catatan Penting

- QiscusCore memerlukan iOS 12.0+
- Beberapa dependencies (QiscusRealtime) mungkin perlu penanganan khusus
- Resources bundle akan otomatis ter-include

## Support

Jika ada masalah, silakan check:
1. Package.swift configuration
2. Source file paths
3. Resource bundle inclusion
