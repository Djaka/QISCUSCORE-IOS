#!/bin/bash

# Script untuk mengintegrasikan QiscusCore SPM ke MyBluebird

echo "🚀 Mengintegrasikan QiscusCore SPM ke MyBluebird"
echo "==============================================="

QISCUS_PATH="/Users/user/Documents/XcodeProject/Carthage16/Carthage/Checkouts/QiscusCore-iOS"
MYBLUEBIRD_PATH="/Users/user/Documents/XcodeProject/MyBluebird"

# Verify paths
if [ ! -d "$QISCUS_PATH" ]; then
    echo "❌ Error: QiscusCore path tidak ditemukan!"
    exit 1
fi

if [ ! -d "$MYBLUEBIRD_PATH" ]; then
    echo "❌ Error: MyBluebird path tidak ditemukan!"
    exit 1
fi

echo "✅ Path verified"
echo ""

# Instructions
echo "📋 Langkah-langkah integrasi:"
echo ""
echo "1. Buka MyBluebird di Xcode:"
echo "   open '$MYBLUEBIRD_PATH/My Blue Bird.xcworkspace'"
echo ""
echo "2. Di Xcode:"
echo "   - File → Add Package Dependencies"
echo "   - Klik 'Add Local...'"
echo "   - Navigate ke: $QISCUS_PATH"
echo "   - Klik 'Add Package'"
echo ""
echo "3. Remove Carthage Framework:"
echo "   - Select target 'My Blue Bird'"
echo "   - Tab 'General'"
echo "   - Di 'Frameworks, Libraries, and Embedded Content'"
echo "   - Remove 'QiscusCore.framework'"
echo ""
echo "4. Clean & Build:"
echo "   - Clean Build Folder: ⌘ + Shift + K"
echo "   - Build: ⌘ + B"
echo ""
echo "5. Jika ada error QiscusRealtime:"
echo "   - QiscusRealtime juga perlu dikonversi ke SPM"
echo "   - Atau gunakan sebagai binary framework"
echo ""
echo "📦 QiscusCore SPM sudah siap digunakan!"
echo "Path: $QISCUS_PATH"
