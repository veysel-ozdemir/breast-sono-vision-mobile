import 'package:get/get.dart';

class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        // English translations
        'en': {
          'german': 'German',
          'english': 'English',
          'french': 'French',
          'italian': 'Italian',
          'spanish': 'Spanish',
          'portuguese': 'Portuguese',
          'russian': 'Russian',
          'turkish': 'Turkish',
          'landing_page_tagline': 'Early Diagnosis,\nSaves Lives.',
          'landing_page_description':
              'Breast ultrasound analysis made easy — powered by AI, designed to support your health journey.',
          'get_started': 'Get Started',
          'onboarding_title_1': 'Your Body Speaks,\nWe Help You Understand.',
          'onboarding_description_1':
              "We interpret your ultrasound image to give you clearer insight into what's going on inside.",
          'onboarding_title_2': 'Upload, Analyze, and\nVisualize.',
          'onboarding_description_2':
              "Upload your image, and receive AI-segmented results that highlight potential concerns in seconds.",
          'your_ultrasound': 'Your Ultrasound',
          'our_result': 'Our Result',
          'onboarding_title_3': 'Clear Results,\nConfident Next Steps.',
          'onboarding_description_3':
              "Visual segmentation helps you better understand your scan and what it may reveal.",
          'continue': 'Continue',
          'schedule_daily_reminder': 'Schedule Daily Reminder',
          'language': 'Language',
          'home_page_description_1':
              'Ready to see the result? Let AI analyze your image — or tap below to choose a different one.',
          'home_page_description_2':
              "Let's select your breast ultrasound. Ensure that all permissions are granted for the app to work properly.",
          'upload_image': 'Upload Image',
          'upload_again': 'Upload Again',
          'analyzing': 'Analyzing...',
          'analyze': 'Analyze',
          'no_image_selected': 'No Image Selected',
          'no_image_selected_description': 'Please select an image to upload.',
          'converting_jpg_file': 'Converting JPG File...',
          'select_from_files': 'Select from Files',
          'select_from_gallery': 'Select from Gallery',
          'home_info_card_title': 'Information',
          'home_info_card_text_1':
              'For the most accurate results, upload your ultrasound as a ',
          'home_info_card_text_2': ' file with a resolution around ',
          'home_info_card_text_3': ' pixels. \n\n',
          'home_info_card_text_4': ' and ',
          'home_info_card_text_5':
              ' files are also accepted but will be converted to PNG to maintain quality for AI analysis.',
          'result_info_card_title': 'Understanding Your Result',
          'result_info_card_text_1':
              'This image shows the segmented regions detected by our AI system:\n🟥 ',
          'red': 'Red',
          'result_info_card_text_2': ' areas may indicate potentially ',
          'malignant': 'malignant',
          'result_info_card_text_3': ' (cancerous) tissue.\n🟩 ',
          'green': 'Green',
          'result_info_card_text_4': ' areas may suggest ',
          'benign': 'benign',
          'result_info_card_text_5': ' (non-cancerous) findings.\n✅ If ',
          'result_info_card_text_6': 'no colored regions',
          'result_info_card_text_7':
              ' appear, no notable tissue was detected — which is often a ',
          'result_info_card_text_8': 'good sign',
          'result_page_description':
              'Curious to compare? View your original next to the result — or go home to try another scan.',
          'compare': 'Compare',
          'share_the_image': 'Share the Image',
          'save_to_gallery': 'Save to Gallery',
          'api_error': 'API Error',
          'image_conversion_failed': 'Image Conversion Failed',
          'image_conversion_failed_description':
              'Error occurred while converting your JPG file',
          'file_selection_error': 'File Selection Error',
          'unsupported_format': 'Unsupported Format',
          'unsupported_format_description': 'Please select a PNG image',
          'image_selection_error': 'Image Selection Error',
          'share_successful': 'Share Successful',
          'share_successful_description':
              'Image shared according to the selected action',
          'save_failed': 'Save Failed',
          'save_failed_description':
              'Failed to save image at selected location due to folder access restriction',
          'save_failed_description_gallery': 'Failed to save image to gallery',
          'share_failed': 'Share Failed',
          'share_failed_description': 'Failed to share image',
          'save_successful': 'Save Successful',
          'save_successful_description': 'Image saved to your gallery',
          'disclaimer_dialog_title': 'Disclaimer',
          'disclaimer_dialog_text_1':
              'This result is generated by an AI model and is ',
          'disclaimer_dialog_text_2': 'not a medical diagnosis',
          'disclaimer_dialog_text_3':
              '.\n\nPlease consult a healthcare professional for a full evaluation and proper medical advice.',
          'disclaimer_dialog_text_4': '\n\nCaution: ',
          'disclaimer_dialog_text_5':
              'If you feel that you have a lump or a hard spot on your breast, contact your doctor.',
          'understood': 'Understood',
          'permission_dialog_title': 'Permission Required',
          'permission_dialog_text':
              'The permissions are not granted. Please visit the settings.',
          'open_settings': 'Open Settings',
          'hour': 'Hour',
          'minute': 'Minute',
          'cancel': 'Cancel',
          'confirm': 'Confirm',
          'scheduled_notifications': 'Scheduled Notifications',
          'error_loading_notifications': 'Error loading notifications',
          'no_scheduled_notifications': 'No scheduled notifications',
          'cancel_all': 'Cancel All',
          'scheduled_notification_title':
              '🕒 Time for Your Breast Health Check!',
          'scheduled_notification_description':
              'Stay proactive—open BreastSonoVision and review your latest ultrasound results today.',
          'notification_successfully_set': 'Notification Successfully Set',
          'notification_successfully_set_description':
              'The daily reminder has been set at ',
          'new': 'New',
          'select_language': 'Select Language',
          'language_changed': 'Language Changed',
          'language_changed_description':
              'The app language has been changed to ',
          'apply': 'Apply',
        },
        // German translations
        'de': {
          'german': 'Deutsch',
          'english': 'Englisch',
          'french': 'Französisch',
          'italian': 'Italienisch',
          'spanish': 'Spanisch',
          'portuguese': 'Portugiesisch',
          'russian': 'Russisch',
          'turkish': 'Türkisch',
          'landing_page_tagline': 'Frühzeitige Diagnose,\nrettet Leben.',
          'landing_page_description':
              'Brustultraschallanalyse leicht gemacht — angetrieben von KI, entwickelt zur Unterstützung Ihrer Gesundheitsreise.',
          'get_started': 'Loslegen',
          'onboarding_title_1':
              'Ihr Körper spricht,\nWir helfen Ihnen zu verstehen.',
          'onboarding_description_1':
              "Wir interpretieren Ihr Ultraschallbild, um Ihnen einen klareren Einblick in das zu geben, was im Inneren vor sich geht.",
          'onboarding_title_2': 'Hochladen, Analysieren\nund Visualisieren.',
          'onboarding_description_2':
              "Laden Sie Ihr Bild hoch und erhalten Sie KI-segmentierte Ergebnisse, die potenzielle Probleme in Sekunden hervorheben.",
          'your_ultrasound': 'Ihr Ultraschall',
          'our_result': 'Unser Ergebnis',
          'onboarding_title_3': 'Klare Ergebnisse,\nSichere nächste Schritte.',
          'onboarding_description_3':
              "Visuelle Segmentierung hilft Ihnen, Ihren Scan und was er möglicherweise zeigt, besser zu verstehen.",
          'continue': 'Weiter',
          'schedule_daily_reminder': 'Tägliche Erinnerung planen',
          'language': 'Sprache',
          'home_page_description_1':
              'Bereit, das Ergebnis zu sehen? Lassen Sie KI Ihr Bild analysieren — oder tippen Sie unten, um ein anderes auszuwählen.',
          'home_page_description_2':
              "Lassen Sie uns Ihren Brustultraschall auswählen. Stellen Sie sicher, dass alle Berechtigungen für die ordnungsgemäße Funktionsweise der App erteilt wurden.",
          'upload_image': 'Bild hochladen',
          'upload_again': 'Erneut hochladen',
          'analyzing': 'Analysiere...',
          'analyze': 'Analysieren',
          'no_image_selected': 'Kein Bild ausgewählt',
          'no_image_selected_description':
              'Bitte wählen Sie ein Bild zum Hochladen aus.',
          'converting_jpg_file': 'Konvertiere JPG-Datei...',
          'select_from_files': 'Aus Dateien auswählen',
          'select_from_gallery': 'Aus Galerie auswählen',
          'home_info_card_title': 'Information',
          'home_info_card_text_1':
              'Für die genauesten Ergebnisse laden Sie Ihren Ultraschall als ',
          'home_info_card_text_2': '-Datei mit einer Auflösung von etwa ',
          'home_info_card_text_3': ' Pixeln hoch. \n\n',
          'home_info_card_text_4': ' und ',
          'home_info_card_text_5':
              '-Dateien werden ebenfalls akzeptiert, werden aber in PNG konvertiert, um die Qualität für die KI-Analyse zu erhalten.',
          'result_info_card_title': 'Ihr Ergebnis verstehen',
          'result_info_card_text_1':
              'Dieses Bild zeigt die von unserem KI-System erkannten segmentierten Regionen:\n🟥 ',
          'red': 'Rote',
          'result_info_card_text_2': ' Bereiche können auf potenziell ',
          'malignant': 'bösartiges',
          'result_info_card_text_3': ' (krebsartiges) Gewebe hinweisen.\n🟩 ',
          'green': 'Grüne',
          'result_info_card_text_4': ' Bereiche könnten auf ',
          'benign': 'gutartige',
          'result_info_card_text_5':
              ' (nicht krebsartige) Befunde hindeuten.\n✅ Wenn ',
          'result_info_card_text_6': 'keine farbigen Regionen',
          'result_info_card_text_7':
              ' erscheinen, wurde kein bemerkenswertes Gewebe erkannt — was oft ein ',
          'result_info_card_text_8': 'gutes Zeichen ist',
          'result_page_description':
              'Neugierig auf einen Vergleich? Sehen Sie Ihr Original neben dem Ergebnis — oder gehen Sie zurück, um einen anderen Scan zu versuchen.',
          'compare': 'Vergleichen',
          'share_the_image': 'Bild teilen',
          'save_to_gallery': 'In Galerie speichern',
          'api_error': 'API-Fehler',
          'image_conversion_failed': 'Bildkonvertierung fehlgeschlagen',
          'image_conversion_failed_description':
              'Fehler beim Konvertieren Ihrer JPG-Datei',
          'file_selection_error': 'Dateiauswahlfehler',
          'unsupported_format': 'Nicht unterstütztes Format',
          'unsupported_format_description': 'Bitte wählen Sie ein PNG-Bild',
          'image_selection_error': 'Bildauswahlfehler',
          'share_successful': 'Erfolgreich geteilt',
          'share_successful_description':
              'Bild gemäß der ausgewählten Aktion geteilt',
          'save_failed': 'Speichern fehlgeschlagen',
          'save_failed_description':
              'Fehler beim Speichern des Bildes am ausgewählten Ort aufgrund von Zugriffseinschränkungen',
          'save_failed_description_gallery':
              'Fehler beim Speichern des Bildes in der Galerie',
          'share_failed': 'Teilen fehlgeschlagen',
          'share_failed_description': 'Fehler beim Teilen des Bildes',
          'save_successful': 'Erfolgreich gespeichert',
          'save_successful_description':
              'Bild wurde in Ihrer Galerie gespeichert',
          'disclaimer_dialog_title': 'Haftungsausschluss',
          'disclaimer_dialog_text_1':
              'Dieses Ergebnis wurde von einem KI-Modell generiert und ist ',
          'disclaimer_dialog_text_2': 'keine medizinische Diagnose',
          'disclaimer_dialog_text_3':
              '.\n\nBitte konsultieren Sie einen Arzt für eine vollständige Bewertung und angemessene medizinische Beratung.',
          'disclaimer_dialog_text_4': '\n\nAchtung: ',
          'disclaimer_dialog_text_5':
              'Wenn Sie einen Knoten oder eine verhärtete Stelle an Ihrer Brust bemerken, kontaktieren Sie Ihren Arzt.',
          'understood': 'Verstanden',
          'permission_dialog_title': 'Berechtigung erforderlich',
          'permission_dialog_text':
              'Die Berechtigungen wurden nicht erteilt. Bitte besuchen Sie die Einstellungen.',
          'open_settings': 'Einstellungen öffnen',
          'hour': 'Stunde',
          'minute': 'Minute',
          'cancel': 'Abbrechen',
          'confirm': 'Bestätigen',
          'scheduled_notifications': 'Geplante Benachrichtigungen',
          'error_loading_notifications':
              'Fehler beim Laden der Benachrichtigungen',
          'no_scheduled_notifications': 'Keine geplanten Benachrichtigungen',
          'cancel_all': 'Alle abbrechen',
          'scheduled_notification_title':
              '🕒 Zeit für Ihre Brustgesundheitskontrolle!',
          'scheduled_notification_description':
              'Bleiben Sie proaktiv—öffnen Sie BreastSonoVision und überprüfen Sie noch heute Ihre neuesten Ultraschallergebnisse.',
          'notification_successfully_set':
              'Benachrichtigung erfolgreich eingestellt',
          'notification_successfully_set_description':
              'Die tägliche Erinnerung wurde eingestellt für ',
          'new': 'Neu',
          'select_language': 'Sprache auswählen',
          'language_changed': 'Sprache geändert',
          'language_changed_description': 'Die App-Sprache wurde geändert auf ',
          'apply': 'Anwenden',
        },
        // Turkish translations
        'tr': {
          'german': 'Almanca',
          'english': 'İngilizce',
          'french': 'Fransızca',
          'italian': 'İtalyanca',
          'spanish': 'İspanyolca',
          'portuguese': 'Portekizce',
          'russian': 'Rusça',
          'turkish': 'Türkçe',
          'landing_page_tagline': 'Erken Teşhis,\nHayat Kurtarır.',
          'landing_page_description':
              'Meme ultrason analizi artık çok kolay — Yapay zeka tarafından desteklenen, sağlık yolculuğunuzu desteklemek için tasarlanmış.',
          'get_started': 'Başlayın',
          'onboarding_title_1':
              'Vücudunuz Konuşur,\nBiz Anlamanıza Yardımcı Oluruz.',
          'onboarding_description_1':
              "Ultrason görüntünüzü yorumlayarak içeride ne olduğuna dair daha net bir fikir edinmenizi sağlarız.",
          'onboarding_title_2': 'Yükleyin, Analiz Edin\nve Görselleştirin.',
          'onboarding_description_2':
              "Görüntünüzü yükleyin ve saniyeler içinde potansiyel endişeleri vurgulayan yapay zeka segmentasyon sonuçlarını alın.",
          'your_ultrasound': 'Ultrasonunuz',
          'our_result': 'Sonucumuz',
          'onboarding_title_3': 'Net Sonuçlar,\nGüvenli Sonraki Adımlar.',
          'onboarding_description_3':
              "Görsel segmentasyon, taramanızı ve olası sonuçlarını daha iyi anlamanıza yardımcı olur.",
          'continue': 'Devam Et',
          'schedule_daily_reminder': 'Günlük Hatırlatma Planla',
          'language': 'Dil',
          'home_page_description_1':
              'Sonucu görmeye hazır mısınız? Yapay zekanın görüntünüzü analiz etmesine izin verin — veya farklı bir görüntü seçmek için aşağıya dokunun.',
          'home_page_description_2':
              "Meme ultrasonunuzu seçelim. Uygulamanın düzgün çalışması için tüm izinlerin verildiğinden emin olun.",
          'upload_image': 'Görüntü Yükle',
          'upload_again': 'Tekrar Yükle',
          'analyzing': 'Analiz Ediliyor...',
          'analyze': 'Analiz Et',
          'no_image_selected': 'Görüntü Seçilmedi',
          'no_image_selected_description':
              'Lütfen yüklemek için bir görüntü seçin.',
          'converting_jpg_file': 'JPG Dosyası Dönüştürülüyor...',
          'select_from_files': 'Dosyalardan Seç',
          'select_from_gallery': 'Galeriden Seç',
          'home_info_card_title': 'Bilgi',
          'home_info_card_text_1': 'En doğru sonuçlar için, ultrasonunuzu ',
          'home_info_card_text_2': ' dosyası olarak yaklaşık ',
          'home_info_card_text_3': ' piksel çözünürlüğünde yükleyin. \n\n',
          'home_info_card_text_4': ' ve ',
          'home_info_card_text_5':
              ' dosyaları da kabul edilir ancak yapay zeka analizi için kaliteyi korumak amacıyla PNG\'ye dönüştürülecektir.',
          'result_info_card_title': 'Sonucunuzu Anlamak',
          'result_info_card_text_1':
              'Bu görüntü, yapay zeka sistemimiz tarafından tespit edilen segmentli bölgeleri gösterir:\n🟥 ',
          'red': 'Kırmızı',
          'result_info_card_text_2': ' alanlar potansiyel olarak ',
          'malignant': 'kötü huylu',
          'result_info_card_text_3': ' (kanserli) doku belirtebilir.\n🟩 ',
          'green': 'Yeşil',
          'result_info_card_text_4': ' alanlar ',
          'benign': 'iyi huylu',
          'result_info_card_text_5':
              ' (kanserli olmayan) bulgulara işaret edebilir.\n✅ Eğer ',
          'result_info_card_text_6': 'renkli bölgeler',
          'result_info_card_text_7':
              ' görünmüyorsa, dikkate değer bir doku tespit edilmemiştir — bu genellikle ',
          'result_info_card_text_8': 'iyi bir işarettir',
          'result_page_description':
              'Karşılaştırmak ister misiniz? Orijinal görüntünüzü sonucun yanında görün — veya başka bir tarama denemek için ana sayfaya dönün.',
          'compare': 'Karşılaştır',
          'share_the_image': 'Görüntüyü Paylaş',
          'save_to_gallery': 'Galeriye Kaydet',
          'api_error': 'API Hatası',
          'image_conversion_failed': 'Görüntü Dönüştürme Başarısız',
          'image_conversion_failed_description':
              'JPG dosyanızı dönüştürürken hata oluştu',
          'file_selection_error': 'Dosya Seçim Hatası',
          'unsupported_format': 'Desteklenmeyen Format',
          'unsupported_format_description': 'Lütfen bir PNG görüntü seçin',
          'image_selection_error': 'Görüntü Seçim Hatası',
          'share_successful': 'Paylaşma Başarılı',
          'share_successful_description':
              'Görüntü seçilen eyleme göre paylaşıldı',
          'save_failed': 'Kaydetme Başarısız',
          'save_failed_description':
              'Klasör erişim kısıtlaması nedeniyle görüntü seçilen konuma kaydedilemedi',
          'save_failed_description_gallery': 'Görüntü galeriye kaydedilemedi',
          'share_failed': 'Paylaşma Başarısız',
          'share_failed_description': 'Görüntü paylaşılamadı',
          'save_successful': 'Kaydetme Başarılı',
          'save_successful_description': 'Görüntü galerinize kaydedildi',
          'disclaimer_dialog_title': 'Feragatname',
          'disclaimer_dialog_text_1':
              'Bu sonuç bir yapay zeka modeli tarafından oluşturulmuştur ve ',
          'disclaimer_dialog_text_2': 'tıbbi bir teşhis değildir',
          'disclaimer_dialog_text_3':
              '.\n\nLütfen tam bir değerlendirme ve uygun tıbbi tavsiye için bir sağlık uzmanına danışın.',
          'disclaimer_dialog_text_4': '\n\nUyarı: ',
          'disclaimer_dialog_text_5':
              'Eğer memede bir kitle veya sert bir nokta hissediyorsanız, doktorunuzla iletişime geçin.',
          'understood': 'Anladım',
          'permission_dialog_title': 'İzin Gerekli',
          'permission_dialog_text':
              'İzinler verilmedi. Lütfen ayarları ziyaret edin.',
          'open_settings': 'Ayarları Aç',
          'hour': 'Saat',
          'minute': 'Dakika',
          'cancel': 'İptal',
          'confirm': 'Onayla',
          'scheduled_notifications': 'Planlanmış Bildirimler',
          'error_loading_notifications': 'Bildirimleri yükleme hatası',
          'no_scheduled_notifications': 'Planlanmış bildirim yok',
          'cancel_all': 'Tümünü İptal Et',
          'scheduled_notification_title':
              '🕒 Meme Sağlığı Kontrolünüzün Zamanı Geldi!',
          'scheduled_notification_description':
              'Proaktif kalın—BreastSonoVision\'ı açın ve en son ultrason sonuçlarınızı bugün inceleyin.',
          'notification_successfully_set': 'Bildirim Başarıyla Ayarlandı',
          'notification_successfully_set_description':
              'Günlük hatırlatıcı şu saate ayarlandı: ',
          'new': 'Yeni',
          'select_language': 'Dil Seçin',
          'language_changed': 'Dil Değiştirildi',
          'language_changed_description':
              'Uygulama dili şu dile değiştirildi: ',
          'apply': 'Uygula',
        },
        // French translations
        'fr': {
          'german': 'Allemand',
          'english': 'Anglais',
          'french': 'Français',
          'italian': 'Italien',
          'spanish': 'Espagnol',
          'portuguese': 'Portugais',
          'russian': 'Russe',
          'turkish': 'Turc',
          'landing_page_tagline': 'Diagnostic précoce,\nSauve des vies.',
          'landing_page_description':
              'Analyse d\'échographie mammaire simplifiée — propulsée par l\'IA, conçue pour soutenir votre parcours de santé.',
          'get_started': 'Commencer',
          'onboarding_title_1':
              'Votre Corps Parle,\nNous Vous Aidons à Comprendre.',
          'onboarding_description_1':
              "Nous interprétons votre image échographique pour vous donner un aperçu plus clair de ce qui se passe à l'intérieur.",
          'onboarding_title_2': 'Téléchargez, Analysez et\nVisualisez.',
          'onboarding_description_2':
              "Téléchargez votre image et recevez des résultats segmentés par l'IA qui mettent en évidence les préoccupations potentielles en quelques secondes.",
          'your_ultrasound': 'Votre Échographie',
          'our_result': 'Notre Résultat',
          'onboarding_title_3':
              'Résultats Clairs,\nProchaines Étapes en Confiance.',
          'onboarding_description_3':
              "La segmentation visuelle vous aide à mieux comprendre votre scan et ce qu'il peut révéler.",
          'continue': 'Continuer',
          'schedule_daily_reminder': 'Planifier un Rappel Quotidien',
          'language': 'Langue',
          'home_page_description_1':
              'Prêt à voir le résultat ? Laissez l\'IA analyser votre image — ou appuyez ci-dessous pour en choisir une autre.',
          'home_page_description_2':
              "Sélectionnons votre échographie mammaire. Assurez-vous que toutes les autorisations sont accordées pour que l'application fonctionne correctement.",
          'upload_image': 'Télécharger l\'Image',
          'upload_again': 'Re-télécharger',
          'analyzing': 'Analyse en cours...',
          'analyze': 'Analyser',
          'no_image_selected': 'Aucune Image Sélectionnée',
          'no_image_selected_description':
              'Veuillez sélectionner une image à télécharger.',
          'converting_jpg_file': 'Conversion du Fichier JPG...',
          'select_from_files': 'Sélectionner depuis les Fichiers',
          'select_from_gallery': 'Sélectionner depuis la Galerie',
          'home_info_card_title': 'Information',
          'home_info_card_text_1':
              'Pour les résultats les plus précis, téléchargez votre échographie sous forme de fichier ',
          'home_info_card_text_2': ' avec une résolution d\'environ ',
          'home_info_card_text_3': ' pixels. \n\n',
          'home_info_card_text_4': ' et ',
          'home_info_card_text_5':
              ' sont également acceptés mais seront convertis en PNG pour maintenir la qualité pour l\'analyse par IA.',
          'result_info_card_title': 'Comprendre Votre Résultat',
          'result_info_card_text_1':
              'Cette image montre les régions segmentées détectées par notre système d\'IA:\n🟥 ',
          'red': 'Rouges',
          'result_info_card_text_2':
              ' les zones peuvent indiquer un tissu potentiellement ',
          'malignant': 'malin',
          'result_info_card_text_3': ' (cancéreux).\n🟩 ',
          'green': 'Vertes',
          'result_info_card_text_4':
              ' les zones peuvent suggérer des résultats ',
          'benign': 'bénins',
          'result_info_card_text_5': ' (non cancéreux).\n✅ Si ',
          'result_info_card_text_6': 'aucune région colorée',
          'result_info_card_text_7':
              ' n\'apparaît, aucun tissu notable n\'a été détecté — ce qui est souvent un ',
          'result_info_card_text_8': 'bon signe',
          'result_page_description':
              'Curieux de comparer ? Visualisez votre original à côté du résultat — ou retournez à l\'accueil pour essayer un autre scan.',
          'compare': 'Comparer',
          'share_the_image': 'Partager l\'Image',
          'save_to_gallery': 'Enregistrer dans la Galerie',
          'api_error': 'Erreur API',
          'image_conversion_failed': 'Échec de la Conversion d\'Image',
          'image_conversion_failed_description':
              'Une erreur s\'est produite lors de la conversion de votre fichier JPG',
          'file_selection_error': 'Erreur de Sélection de Fichier',
          'unsupported_format': 'Format Non Pris en Charge',
          'unsupported_format_description':
              'Veuillez sélectionner une image PNG',
          'image_selection_error': 'Erreur de Sélection d\'Image',
          'share_successful': 'Partage Réussi',
          'share_successful_description':
              'Image partagée selon l\'action sélectionnée',
          'save_failed': 'Échec de l\'Enregistrement',
          'save_failed_description':
              'Impossible d\'enregistrer l\'image à l\'emplacement sélectionné en raison d\'une restriction d\'accès au dossier',
          'save_failed_description_gallery':
              'Impossible d\'enregistrer l\'image dans la galerie',
          'share_failed': 'Échec du Partage',
          'share_failed_description': 'Impossible de partager l\'image',
          'save_successful': 'Enregistrement Réussi',
          'save_successful_description': 'Image enregistrée dans votre galerie',
          'disclaimer_dialog_title': 'Avertissement',
          'disclaimer_dialog_text_1':
              'Ce résultat est généré par un modèle d\'IA et n\'est ',
          'disclaimer_dialog_text_2': 'pas un diagnostic médical',
          'disclaimer_dialog_text_3':
              '.\n\nVeuillez consulter un professionnel de la santé pour une évaluation complète et des conseils médicaux appropriés.',
          'disclaimer_dialog_text_4': '\n\nAttention: ',
          'disclaimer_dialog_text_5':
              'Si vous sentez une bosse ou un point dur sur votre sein, contactez votre médecin.',
          'understood': 'Compris',
          'permission_dialog_title': 'Autorisation Requise',
          'permission_dialog_text':
              'Les autorisations ne sont pas accordées. Veuillez visiter les paramètres.',
          'open_settings': 'Ouvrir les Paramètres',
          'hour': 'Heure',
          'minute': 'Minute',
          'cancel': 'Annuler',
          'confirm': 'Confirmer',
          'scheduled_notifications': 'Notifications Programmées',
          'error_loading_notifications':
              'Erreur de chargement des notifications',
          'no_scheduled_notifications': 'Aucune notification programmée',
          'cancel_all': 'Tout Annuler',
          'scheduled_notification_title':
              '🕒 C\'est l\'heure de votre examen de santé mammaire !',
          'scheduled_notification_description':
              'Restez proactive—ouvrez BreastSonoVision et examinez vos derniers résultats d\'échographie aujourd\'hui.',
          'notification_successfully_set': 'Notification Définie Avec Succès',
          'notification_successfully_set_description':
              'Le rappel quotidien a été défini à ',
          'new': 'Nouveau',
          'select_language': 'Sélectionner la Langue',
          'language_changed': 'Langue Modifiée',
          'language_changed_description':
              'La langue de l\'application a été changée en ',
          'apply': 'Appliquer',
        },
        // Spanish translations
        'es': {
          'german': 'Alemán',
          'english': 'Inglés',
          'french': 'Francés',
          'italian': 'Italiano',
          'spanish': 'Español',
          'portuguese': 'Portugués',
          'russian': 'Ruso',
          'turkish': 'Turco',
          'landing_page_tagline': 'Diagnóstico Temprano,\nSalva Vidas.',
          'landing_page_description':
              'Análisis de ultrasonido de mama simplificado — impulsado por IA, diseñado para apoyar tu camino hacia la salud.',
          'get_started': 'Comenzar',
          'onboarding_title_1': 'Tu Cuerpo Habla,\nTe Ayudamos a Entenderlo.',
          'onboarding_description_1':
              "Interpretamos tu imagen de ultrasonido para darte una visión más clara de lo que sucede en tu interior.",
          'onboarding_title_2': 'Sube, Analiza y\nVisualiza.',
          'onboarding_description_2':
              "Sube tu imagen y recibe resultados segmentados por IA que destacan posibles preocupaciones en segundos.",
          'your_ultrasound': 'Tu Ultrasonido',
          'our_result': 'Nuestro Resultado',
          'onboarding_title_3':
              'Resultados Claros,\nPróximos Pasos con Confianza.',
          'onboarding_description_3':
              "La segmentación visual te ayuda a entender mejor tu exploración y lo que puede revelar.",
          'continue': 'Continuar',
          'schedule_daily_reminder': 'Programar Recordatorio Diario',
          'language': 'Idioma',
          'home_page_description_1':
              '¿Listo para ver el resultado? Deja que la IA analice tu imagen — o pulsa abajo para elegir una diferente.',
          'home_page_description_2':
              "Seleccionemos tu ultrasonido de mama. Asegúrate de que todos los permisos estén concedidos para que la aplicación funcione correctamente.",
          'upload_image': 'Subir Imagen',
          'upload_again': 'Subir de Nuevo',
          'analyzing': 'Analizando...',
          'analyze': 'Analizar',
          'no_image_selected': 'Ninguna Imagen Seleccionada',
          'no_image_selected_description':
              'Por favor, selecciona una imagen para subir.',
          'converting_jpg_file': 'Convirtiendo Archivo JPG...',
          'select_from_files': 'Seleccionar de Archivos',
          'select_from_gallery': 'Seleccionar de la Galería',
          'home_info_card_title': 'Información',
          'home_info_card_text_1':
              'Para obtener los resultados más precisos, sube tu ultrasonido como un archivo ',
          'home_info_card_text_2': ' con una resolución de alrededor de ',
          'home_info_card_text_3': ' píxeles. \n\n',
          'home_info_card_text_4': ' y ',
          'home_info_card_text_5':
              ' también se aceptan archivos pero se convertirán a PNG para mantener la calidad para el análisis de IA.',
          'result_info_card_title': 'Entendiendo Tu Resultado',
          'result_info_card_text_1':
              'Esta imagen muestra las regiones segmentadas detectadas por nuestro sistema de IA:\n🟥 ',
          'red': 'Rojas',
          'result_info_card_text_2':
              ' las áreas pueden indicar tejido potencialmente ',
          'malignant': 'maligno',
          'result_info_card_text_3': ' (canceroso).\n🟩 ',
          'green': 'Verdes',
          'result_info_card_text_4': ' las áreas pueden sugerir hallazgos ',
          'benign': 'benignos',
          'result_info_card_text_5': ' (no cancerosos).\n✅ Si ',
          'result_info_card_text_6': 'no aparecen regiones coloreadas',
          'result_info_card_text_7':
              ', no se detectó tejido notable — lo que a menudo es una ',
          'result_info_card_text_8': 'buena señal',
          'result_page_description':
              '¿Curioso por comparar? Ve tu original junto al resultado — o vuelve al inicio para probar otro escaneo.',
          'compare': 'Comparar',
          'share_the_image': 'Compartir la Imagen',
          'save_to_gallery': 'Guardar en la Galería',
          'api_error': 'Error de API',
          'image_conversion_failed': 'Error en la Conversión de Imagen',
          'image_conversion_failed_description':
              'Ocurrió un error al convertir tu archivo JPG',
          'file_selection_error': 'Error de Selección de Archivo',
          'unsupported_format': 'Formato No Compatible',
          'unsupported_format_description':
              'Por favor, selecciona una imagen PNG',
          'image_selection_error': 'Error de Selección de Imagen',
          'share_successful': 'Compartido Exitosamente',
          'share_successful_description':
              'Imagen compartida según la acción seleccionada',
          'save_failed': 'Error al Guardar',
          'save_failed_description':
              'No se pudo guardar la imagen en la ubicación seleccionada debido a restricciones de acceso a carpetas',
          'save_failed_description_gallery':
              'No se pudo guardar la imagen en la galería',
          'share_failed': 'Error al Compartir',
          'share_failed_description': 'No se pudo compartir la imagen',
          'save_successful': 'Guardado Exitoso',
          'save_successful_description': 'Imagen guardada en tu galería',
          'disclaimer_dialog_title': 'Aviso Legal',
          'disclaimer_dialog_text_1':
              'Este resultado es generado por un modelo de IA y ',
          'disclaimer_dialog_text_2': 'no es un diagnóstico médico',
          'disclaimer_dialog_text_3':
              '.\n\nPor favor, consulta a un profesional de la salud para una evaluación completa y asesoramiento médico adecuado.',
          'disclaimer_dialog_text_4': '\n\nPrecaución: ',
          'disclaimer_dialog_text_5':
              'Si sientes que tienes un bulto o una zona dura en tu pecho, contacta a tu médico.',
          'understood': 'Entendido',
          'permission_dialog_title': 'Permiso Requerido',
          'permission_dialog_text':
              'Los permisos no han sido concedidos. Por favor, visita la configuración.',
          'open_settings': 'Abrir Configuración',
          'hour': 'Hora',
          'minute': 'Minuto',
          'cancel': 'Cancelar',
          'confirm': 'Confirmar',
          'scheduled_notifications': 'Notificaciones Programadas',
          'error_loading_notifications': 'Error al cargar notificaciones',
          'no_scheduled_notifications': 'No hay notificaciones programadas',
          'cancel_all': 'Cancelar Todo',
          'scheduled_notification_title':
              '🕒 ¡Hora de tu control de salud mamaria!',
          'scheduled_notification_description':
              'Mantente proactiva—abre BreastSonoVision y revisa tus últimos resultados de ultrasonido hoy.',
          'notification_successfully_set':
              'Notificación Configurada Exitosamente',
          'notification_successfully_set_description':
              'El recordatorio diario ha sido configurado a las ',
          'new': 'Nuevo',
          'select_language': 'Seleccionar Idioma',
          'language_changed': 'Idioma Cambiado',
          'language_changed_description':
              'El idioma de la aplicación ha sido cambiado a ',
          'apply': 'Aplicar',
        },
        // Italian translations
        'it': {
          'german': 'Tedesco',
          'english': 'Inglese',
          'french': 'Francese',
          'italian': 'Italiano',
          'spanish': 'Spagnolo',
          'portuguese': 'Portoghese',
          'russian': 'Russo',
          'turkish': 'Turco',
          'landing_page_tagline': 'Diagnosi Precoce,\nSalva Vite.',
          'landing_page_description':
              'Analisi ecografica del seno semplificata — alimentata da IA, progettata per supportare il tuo percorso di salute.',
          'get_started': 'Inizia',
          'onboarding_title_1': 'Il Tuo Corpo Parla,\nTi Aiutiamo a Capirlo.',
          'onboarding_description_1':
              "Interpretiamo la tua immagine ecografica per darti un'idea più chiara di ciò che sta succedendo all'interno.",
          'onboarding_title_2': 'Carica, Analizza e\nVisualizza.',
          'onboarding_description_2':
              "Carica la tua immagine e ricevi risultati segmentati dall'IA che evidenziano potenziali problemi in pochi secondi.",
          'your_ultrasound': 'La Tua Ecografia',
          'our_result': 'Il Nostro Risultato',
          'onboarding_title_3': 'Risultati Chiari,\nProssimi Passi Sicuri.',
          'onboarding_description_3':
              "La segmentazione visiva ti aiuta a comprendere meglio la tua scansione e ciò che potrebbe rivelare.",
          'continue': 'Continua',
          'schedule_daily_reminder': 'Programma Promemoria Giornaliero',
          'language': 'Lingua',
          'home_page_description_1':
              'Pronto a vedere il risultato? Lascia che l\'IA analizzi la tua immagine — o tocca sotto per sceglierne una diversa.',
          'home_page_description_2':
              "Selezioniamo la tua ecografia mammaria. Assicurati che tutte le autorizzazioni siano concesse affinché l'app funzioni correttamente.",
          'upload_image': 'Carica Immagine',
          'upload_again': 'Carica di Nuovo',
          'analyzing': 'Analisi in corso...',
          'analyze': 'Analizza',
          'no_image_selected': 'Nessuna Immagine Selezionata',
          'no_image_selected_description':
              'Per favore seleziona un\'immagine da caricare.',
          'converting_jpg_file': 'Conversione File JPG...',
          'select_from_files': 'Seleziona dai File',
          'select_from_gallery': 'Seleziona dalla Galleria',
          'home_info_card_title': 'Informazioni',
          'home_info_card_text_1':
              'Per risultati più accurati, carica la tua ecografia come un file ',
          'home_info_card_text_2': ' con una risoluzione di circa ',
          'home_info_card_text_3': ' pixel. \n\n',
          'home_info_card_text_4': ' e ',
          'home_info_card_text_5':
              ' sono accettati anche file ma verranno convertiti in PNG per mantenere la qualità per l\'analisi IA.',
          'result_info_card_title': 'Comprensione del Risultato',
          'result_info_card_text_1':
              'Questa immagine mostra le regioni segmentate rilevate dal nostro sistema IA:\n🟥 ',
          'red': 'Rosse',
          'result_info_card_text_2':
              ' le aree potrebbero indicare tessuto potenzialmente ',
          'malignant': 'maligno',
          'result_info_card_text_3': ' (canceroso).\n🟩 ',
          'green': 'Verdi',
          'result_info_card_text_4': ' le aree potrebbero suggerire risultati ',
          'benign': 'benigni',
          'result_info_card_text_5': ' (non cancerosi).\n✅ Se ',
          'result_info_card_text_6': 'non appaiono regioni colorate',
          'result_info_card_text_7':
              ', non è stato rilevato alcun tessuto notevole — il che spesso è un ',
          'result_info_card_text_8': 'buon segno',
          'result_page_description':
              'Curioso di confrontare? Visualizza l\'originale accanto al risultato — o torna alla home per provare un\'altra scansione.',
          'compare': 'Confronta',
          'share_the_image': 'Condividi l\'Immagine',
          'save_to_gallery': 'Salva nella Galleria',
          'api_error': 'Errore API',
          'image_conversion_failed': 'Conversione Immagine Fallita',
          'image_conversion_failed_description':
              'Errore durante la conversione del file JPG',
          'file_selection_error': 'Errore di Selezione File',
          'unsupported_format': 'Formato Non Supportato',
          'unsupported_format_description':
              'Per favore seleziona un\'immagine PNG',
          'image_selection_error': 'Errore di Selezione Immagine',
          'share_successful': 'Condivisione Riuscita',
          'share_successful_description':
              'Immagine condivisa secondo l\'azione selezionata',
          'save_failed': 'Salvataggio Fallito',
          'save_failed_description':
              'Impossibile salvare l\'immagine nella posizione selezionata a causa della restrizione di accesso alla cartella',
          'save_failed_description_gallery':
              'Impossibile salvare l\'immagine nella galleria',
          'share_failed': 'Condivisione Fallita',
          'share_failed_description': 'Impossibile condividere l\'immagine',
          'save_successful': 'Salvataggio Riuscito',
          'save_successful_description': 'Immagine salvata nella tua galleria',
          'disclaimer_dialog_title': 'Avviso Legale',
          'disclaimer_dialog_text_1':
              'Questo risultato è generato da un modello di IA e ',
          'disclaimer_dialog_text_2': 'non è una diagnosi medica',
          'disclaimer_dialog_text_3':
              '.\n\nConsulta un professionista sanitario per una valutazione completa e un consiglio medico appropriato.',
          'disclaimer_dialog_text_4': '\n\nAttenzione: ',
          'disclaimer_dialog_text_5':
              'Se avverti la presenza di un nodulo o di un punto duro sul seno, contatta il tuo medico.',
          'understood': 'Capito',
          'permission_dialog_title': 'Autorizzazione Richiesta',
          'permission_dialog_text':
              'Le autorizzazioni non sono concesse. Visita le impostazioni.',
          'open_settings': 'Apri Impostazioni',
          'hour': 'Ora',
          'minute': 'Minuto',
          'cancel': 'Annulla',
          'confirm': 'Conferma',
          'scheduled_notifications': 'Notifiche Programmate',
          'error_loading_notifications':
              'Errore nel caricamento delle notifiche',
          'no_scheduled_notifications': 'Nessuna notifica programmata',
          'cancel_all': 'Annulla Tutto',
          'scheduled_notification_title':
              '🕒 È ora del tuo controllo della salute del seno!',
          'scheduled_notification_description':
              'Sii proattiva—apri BreastSonoVision e rivedi i tuoi ultimi risultati ecografici oggi.',
          'notification_successfully_set': 'Notifica Impostata con Successo',
          'notification_successfully_set_description':
              'Il promemoria giornaliero è stato impostato alle ',
          'new': 'Nuovo',
          'select_language': 'Seleziona Lingua',
          'language_changed': 'Lingua Modificata',
          'language_changed_description':
              'La lingua dell\'app è stata cambiata in ',
          'apply': 'Applica',
        },
        // Portuguese translations
        'pt': {
          'german': 'Alemão',
          'english': 'Inglês',
          'french': 'Francês',
          'italian': 'Italiano',
          'spanish': 'Espanhol',
          'portuguese': 'Português',
          'russian': 'Russo',
          'turkish': 'Turco',
          'landing_page_tagline': 'Diagnóstico Precoce,\nSalva Vidas.',
          'landing_page_description':
              'Análise de ultrassom mamário simplificada — alimentada por IA, projetada para apoiar sua jornada de saúde.',
          'get_started': 'Começar',
          'onboarding_title_1': 'Seu Corpo Fala,\nNós Ajudamos a Entender.',
          'onboarding_description_1':
              "Interpretamos sua imagem de ultrassom para fornecer informações mais claras sobre o que está acontecendo por dentro.",
          'onboarding_title_2': 'Carregue, Analise e\nVisualize.',
          'onboarding_description_2':
              "Carregue sua imagem e receba resultados segmentados por IA que destacam possíveis preocupações em segundos.",
          'your_ultrasound': 'Seu Ultrassom',
          'our_result': 'Nosso Resultado',
          'onboarding_title_3':
              'Resultados Claros,\nPróximos Passos Confiantes.',
          'onboarding_description_3':
              "A segmentação visual ajuda você a entender melhor sua varredura e o que ela pode revelar.",
          'continue': 'Continuar',
          'schedule_daily_reminder': 'Agendar Lembrete Diário',
          'language': 'Idioma',
          'home_page_description_1':
              'Pronto para ver o resultado? Deixe a IA analisar sua imagem — ou toque abaixo para escolher uma diferente.',
          'home_page_description_2':
              "Vamos selecionar seu ultrassom mamário. Certifique-se de que todas as permissões sejam concedidas para que o aplicativo funcione corretamente.",
          'upload_image': 'Carregar Imagem',
          'upload_again': 'Carregar de novo',
          'analyzing': 'Analisando...',
          'analyze': 'Analisar',
          'no_image_selected': 'Nenhuma Imagem Selecionada',
          'no_image_selected_description':
              'Por favor, selecione uma imagem para carregar.',
          'converting_jpg_file': 'Convertendo Arquivo JPG...',
          'select_from_files': 'Selecionar dos Arquivos',
          'select_from_gallery': 'Selecionar da Galeria',
          'home_info_card_title': 'Informação',
          'home_info_card_text_1':
              'Para resultados mais precisos, carregue seu ultrassom como um arquivo ',
          'home_info_card_text_2': ' com uma resolução de aproximadamente ',
          'home_info_card_text_3': ' pixels. \n\n',
          'home_info_card_text_4': ' e ',
          'home_info_card_text_5':
              ' arquivos também são aceitos, mas serão convertidos para PNG para manter a qualidade para análise de IA.',
          'result_info_card_title': 'Entendendo Seu Resultado',
          'result_info_card_text_1':
              'Esta imagem mostra as regiões segmentadas detectadas pelo nosso sistema de IA:\n🟥 ',
          'red': 'Vermelhas',
          'result_info_card_text_2':
              ' as áreas podem indicar tecido potencialmente ',
          'malignant': 'maligno',
          'result_info_card_text_3': ' (canceroso).\n🟩 ',
          'green': 'Verdes',
          'result_info_card_text_4': ' as áreas podem sugerir achados ',
          'benign': 'benignos',
          'result_info_card_text_5': ' (não cancerosos).\n✅ Se ',
          'result_info_card_text_6': 'nenhuma região colorida',
          'result_info_card_text_7':
              ' aparecer, nenhum tecido notável foi detectado — o que frequentemente é um ',
          'result_info_card_text_8': 'bom sinal',
          'result_page_description':
              'Curioso para comparar? Veja seu original ao lado do resultado — ou volte para casa para tentar outra varredura.',
          'compare': 'Comparar',
          'share_the_image': 'Compartilhar a Imagem',
          'save_to_gallery': 'Salvar na Galeria',
          'api_error': 'Erro de API',
          'image_conversion_failed': 'Falha na Conversão da Imagem',
          'image_conversion_failed_description':
              'Ocorreu um erro ao converter seu arquivo JPG',
          'file_selection_error': 'Erro na Seleção de Arquivo',
          'unsupported_format': 'Formato Não Suportado',
          'unsupported_format_description':
              'Por favor, selecione uma imagem PNG',
          'image_selection_error': 'Erro na Seleção de Imagem',
          'share_successful': 'Compartilhamento Bem-sucedido',
          'share_successful_description':
              'Imagem compartilhada de acordo com a ação selecionada',
          'save_failed': 'Falha ao Salvar',
          'save_failed_description':
              'Falha ao salvar a imagem no local selecionado devido à restrição de acesso à pasta',
          'save_failed_description_gallery':
              'Falha ao salvar a imagem na galeria',
          'share_failed': 'Falha ao Compartilhar',
          'share_failed_description': 'Falha ao compartilhar a imagem',
          'save_successful': 'Salvo com Sucesso',
          'save_successful_description': 'Imagem salva na sua galeria',
          'disclaimer_dialog_title': 'Aviso Legal',
          'disclaimer_dialog_text_1':
              'Este resultado é gerado por um modelo de IA e ',
          'disclaimer_dialog_text_2': 'não é um diagnóstico médico',
          'disclaimer_dialog_text_3':
              '.\n\nPor favor, consulte um profissional de saúde para uma avaliação completa e aconselhamento médico adequado.',
          'disclaimer_dialog_text_4': '\n\nAtenção: ',
          'disclaimer_dialog_text_5':
              'Se você sentir que tem um nódulo ou um ponto endurecido em seu seio, entre em contato com seu médico.',
          'understood': 'Entendido',
          'permission_dialog_title': 'Permissão Necessária',
          'permission_dialog_text':
              'As permissões não foram concedidas. Por favor, visite as configurações.',
          'open_settings': 'Abrir Configurações',
          'hour': 'Hora',
          'minute': 'Minuto',
          'cancel': 'Cancelar',
          'confirm': 'Confirmar',
          'scheduled_notifications': 'Notificações Agendadas',
          'error_loading_notifications': 'Erro ao carregar notificações',
          'no_scheduled_notifications': 'Nenhuma notificação agendada',
          'cancel_all': 'Cancelar Tudo',
          'scheduled_notification_title':
              '🕒 Hora do seu Exame de Saúde Mamária!',
          'scheduled_notification_description':
              'Seja proativa—abra o BreastSonoVision e reveja seus últimos resultados de ultrassom hoje.',
          'notification_successfully_set':
              'Notificação Configurada com Sucesso',
          'notification_successfully_set_description':
              'O lembrete diário foi configurado para às ',
          'new': 'Novo',
          'select_language': 'Selecionar Idioma',
          'language_changed': 'Idioma Alterado',
          'language_changed_description':
              'O idioma do aplicativo foi alterado para ',
          'apply': 'Aplicar',
        },
        // Russian translations
        'ru': {
          'german': 'Немецкий',
          'english': 'Английский',
          'french': 'Французский',
          'italian': 'Итальянский',
          'spanish': 'Испанский',
          'portuguese': 'Португальский',
          'russian': 'Русский',
          'turkish': 'Турецкий',
          'landing_page_tagline': 'Ранняя диагностика\nспасает жизни.',
          'landing_page_description':
              'Анализ ультразвукового исследования молочной железы стал проще — с использованием ИИ, разработанного для поддержки вашего пути к здоровью.',
          'get_started': 'Начать',
          'onboarding_title_1': 'Ваше тело говорит,\nМы помогаем понять.',
          'onboarding_description_1':
              "Мы интерпретируем ваше ультразвуковое изображение, чтобы дать вам более ясное представление о том, что происходит внутри.",
          'onboarding_title_2': 'Загрузите, анализируйте\nи визуализируйте.',
          'onboarding_description_2':
              "Загрузите ваше изображение и получите результаты ИИ-сегментации, которые выделяют потенциальные проблемы за секунды.",
          'your_ultrasound': 'Ваше УЗИ',
          'our_result': 'Наш результат',
          'onboarding_title_3': 'Ясные результаты,\nУверенные следующие шаги.',
          'onboarding_description_3':
              "Визуальная сегментация помогает лучше понять ваше исследование и то, что оно может показать.",
          'continue': 'Продолжить',
          'schedule_daily_reminder': 'Запланировать ежедневное напоминание',
          'language': 'Язык',
          'home_page_description_1':
              'Готовы увидеть результат? Позвольте ИИ проанализировать ваше изображение — или нажмите ниже, чтобы выбрать другое.',
          'home_page_description_2':
              "Выберем ваше УЗИ молочной железы. Убедитесь, что все разрешения предоставлены для правильной работы приложения.",
          'upload_image': 'Загрузить изображение',
          'upload_again': 'Загрузить снова',
          'analyzing': 'Анализируем...',
          'analyze': 'Анализировать',
          'no_image_selected': 'Изображение не выбрано',
          'no_image_selected_description':
              'Пожалуйста, выберите изображение для загрузки.',
          'converting_jpg_file': 'Конвертация JPG файла...',
          'select_from_files': 'Выбрать из файлов',
          'select_from_gallery': 'Выбрать из галереи',
          'home_info_card_title': 'Информация',
          'home_info_card_text_1':
              'Для наиболее точных результатов загрузите ваше УЗИ как ',
          'home_info_card_text_2': ' файл с разрешением около ',
          'home_info_card_text_3': ' пикселей. \n\n',
          'home_info_card_text_4': ' и ',
          'home_info_card_text_5':
              ' файлы также принимаются, но будут конвертированы в PNG для сохранения качества при анализе ИИ.',
          'result_info_card_title': 'Понимание вашего результата',
          'result_info_card_text_1':
              'Это изображение показывает сегментированные области, обнаруженные нашей системой ИИ:\n🟥 ',
          'red': 'Красные',
          'result_info_card_text_2':
              ' области могут указывать на потенциально ',
          'malignant': 'злокачественную',
          'result_info_card_text_3': ' (раковую) ткань.\n🟩 ',
          'green': 'Зеленые',
          'result_info_card_text_4': ' области могут предполагать ',
          'benign': 'доброкачественные',
          'result_info_card_text_5': ' (не раковые) образования.\n✅ Если ',
          'result_info_card_text_6': 'цветные области не',
          'result_info_card_text_7':
              ' появляются, значимой ткани не обнаружено — что часто является ',
          'result_info_card_text_8': 'хорошим знаком',
          'result_page_description':
              'Интересно сравнить? Посмотрите оригинал рядом с результатом — или вернитесь домой, чтобы попробовать другое сканирование.',
          'compare': 'Сравнить',
          'share_the_image': 'Поделиться изображением',
          'save_to_gallery': 'Сохранить в галерею',
          'api_error': 'Ошибка API',
          'image_conversion_failed': 'Ошибка конвертации изображения',
          'image_conversion_failed_description':
              'Произошла ошибка при конвертации JPG файла',
          'file_selection_error': 'Ошибка выбора файла',
          'unsupported_format': 'Неподдерживаемый формат',
          'unsupported_format_description':
              'Пожалуйста, выберите PNG изображение',
          'image_selection_error': 'Ошибка выбора изображения',
          'share_successful': 'Успешно отправлено',
          'share_successful_description':
              'Изображение отправлено согласно выбранному действию',
          'save_failed': 'Ошибка сохранения',
          'save_failed_description':
              'Не удалось сохранить изображение в выбранном месте из-за ограничения доступа к папке',
          'save_failed_description_gallery':
              'Не удалось сохранить изображение в галерею',
          'share_failed': 'Ошибка при отправке',
          'share_failed_description': 'Не удалось поделиться изображением',
          'save_successful': 'Успешно сохранено',
          'save_successful_description': 'Изображение сохранено в вашу галерею',
          'disclaimer_dialog_title': 'Отказ от ответственности',
          'disclaimer_dialog_text_1':
              'Этот результат сгенерирован моделью ИИ и ',
          'disclaimer_dialog_text_2': 'не является медицинским диагнозом',
          'disclaimer_dialog_text_3':
              '.\n\nПожалуйста, проконсультируйтесь с медицинским специалистом для полной оценки и надлежащей медицинской консультации.',
          'disclaimer_dialog_text_4': '\n\nПредостережение: ',
          'disclaimer_dialog_text_5':
              'Если вы ощущаете уплотнение или твердый участок в молочной железе, обратитесь к врачу.',
          'understood': 'Понятно',
          'permission_dialog_title': 'Требуется разрешение',
          'permission_dialog_text':
              'Разрешения не предоставлены. Пожалуйста, перейдите в настройки.',
          'open_settings': 'Открыть настройки',
          'hour': 'Час',
          'minute': 'Минута',
          'cancel': 'Отмена',
          'confirm': 'Подтвердить',
          'scheduled_notifications': 'Запланированные уведомления',
          'error_loading_notifications': 'Ошибка загрузки уведомлений',
          'no_scheduled_notifications': 'Нет запланированных уведомлений',
          'cancel_all': 'Отменить все',
          'scheduled_notification_title':
              '🕒 Время для проверки здоровья молочной железы!',
          'scheduled_notification_description':
              'Будьте проактивны—откройте BreastSonoVision и просмотрите свои последние результаты УЗИ сегодня.',
          'notification_successfully_set': 'Уведомление успешно установлено',
          'notification_successfully_set_description':
              'Ежедневное напоминание установлено на ',
          'new': 'Новое',
          'select_language': 'Выбрать язык',
          'language_changed': 'Язык изменен',
          'language_changed_description': 'Язык приложения изменен на ',
          'apply': 'Применить',
        }
      };
}
