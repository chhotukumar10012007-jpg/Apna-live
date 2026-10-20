# Apna Live — शुरुआती डेमो

यह एक शुरुआती Flutter UI डेमो है। अभी इसमें असली लॉगिन, वीडियो अपलोड, लाइव स्ट्रीमिंग या हैकिंग निगरानी चालू नहीं है।

## Android मोबाइल से आगे कैसे बढ़ें
1. ZIP को डाउनलोड करें।
2. GitHub पर नया repository बनाएं और ZIP की फाइलें अपलोड/Extract करें। GitHub मोबाइल वेबसाइट पर यह प्रक्रिया थोड़ी कठिन हो सकती है।
3. किसी cloud development environment में Flutter SDK वाला workspace खोलें।
4. टर्मिनल में चलाएं:
   - `flutter pub get`
   - `flutter run` (emulator/device उपलब्ध हो तो)
   - APK के लिए `flutter build apk --release`
5. Firebase प्रोजेक्ट जोड़ने के बाद ही Authentication, App Check और database नियम सेट करें।

## सुरक्षा चेतावनी
- API secrets, passwords, OTP या streaming stream keys को Flutter ऐप में कभी न रखें।
- असली Live के लिए trusted backend से short-lived stream credentials बनें।
- iPhone build के लिए सामान्यतः macOS/Xcode या समर्थित cloud build सेवा चाहिए।
- रिलीज़ से पहले Firestore Rules, App Check, moderation, rate limits, backups और security testing अनिवार्य हैं।
