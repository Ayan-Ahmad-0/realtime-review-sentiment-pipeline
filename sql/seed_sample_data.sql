-- Sample seed data for review sentiment pipeline
-- Inserts realistic reviews into raw_reviews and review_sentiment
-- Useful for testing dashboards immediately without running Airflow/Kafka

INSERT INTO raw_reviews (review_id, product_id, app_name, review_text, reviewer_name, rating, app_version, likes_count, source, source_posted_at)
VALUES
('rev-001', 'com.spotify.music', 'Spotify', 'The new UI update is super intuitive and playlist recommendations are spot on!', 'Sarah Jenkins', 5, '8.9.2', 42, 'play_store', NOW() - INTERVAL '1 day'),
('rev-002', 'com.spotify.music', 'Spotify', 'App crashes frequently after the latest update when playing offline songs.', 'David Miller', 1, '8.9.4', 115, 'play_store', NOW() - INTERVAL '2 days'),
('rev-003', 'com.spotify.music', 'Spotify', 'Sound quality is great, but premium subscription price keeps increasing.', 'Alex Chen', 3, '8.9.4', 18, 'play_store', NOW() - INTERVAL '3 days'),
('rev-004', 'com.instagram.android', 'Instagram', 'Reels algorithm has improved a lot, love finding new indie creators.', 'Emma Watson', 5, '312.0', 64, 'play_store', NOW() - INTERVAL '1 day'),
('rev-005', 'com.instagram.android', 'Instagram', 'Too many sponsored ads on my main feed now. It feels like shopping mall.', 'Marcus Cole', 2, '312.0', 89, 'play_store', NOW() - INTERVAL '4 days'),
('rev-006', 'com.instagram.android', 'Instagram', 'Direct messages keep glitching and unread badges wont clear.', 'Priya Patel', 2, '311.5', 31, 'play_store', NOW() - INTERVAL '5 days'),
('rev-007', 'com.whatsapp', 'WhatsApp', 'Clean messaging app, voice messages and video calls are clear and reliable.', 'Carlos Gomez', 5, '2.24.1', 53, 'play_store', NOW() - INTERVAL '2 days'),
('rev-008', 'com.whatsapp', 'WhatsApp', 'Backup restore failed and lost recent chats during phone transfer.', 'Lisa Wong', 1, '2.24.1', 77, 'play_store', NOW() - INTERVAL '6 days'),
('rev-009', 'com.whatsapp', 'WhatsApp', 'Channels feature is okay but I prefer keeping my chats separate from news.', 'John Doe', 3, '2.24.0', 9, 'play_store', NOW() - INTERVAL '7 days'),
('rev-010', 'com.zhiliaoapp.musically', 'TikTok', 'Editing tools and filters are unmatched! Excellent creative platform.', 'Chloe Adams', 5, '34.2', 120, 'play_store', NOW() - INTERVAL '1 day'),
('rev-011', 'com.zhiliaoapp.musically', 'TikTok', 'Battery drain is insane on my device after 20 minutes of scrolling.', 'Kevin Taylor', 2, '34.2', 45, 'play_store', NOW() - INTERVAL '3 days'),
('rev-012', 'com.zhiliaoapp.musically', 'TikTok', 'Search algorithm is very fast and responsive.', 'Zack Brown', 4, '34.1', 12, 'play_store', NOW() - INTERVAL '8 days')
ON CONFLICT (review_id) DO NOTHING;

INSERT INTO review_sentiment (review_id, sentiment_score, category, summary, model_used, batch_id, processed_at)
VALUES
('rev-001', 0.880, 'UI & Recommendations', 'Praise for intuitive UI and playlist recommendation accuracy', 'gemini-1.5-flash', 'batch-demo-1', NOW() - INTERVAL '1 day'),
('rev-002', -0.850, 'Stability & Crashes', 'App crashing consistently during offline audio playback', 'gemini-1.5-flash', 'batch-demo-1', NOW() - INTERVAL '2 days'),
('rev-003', 0.120, 'Pricing', 'Mixed feedback: good audio quality offset by rising subscription fees', 'gemini-1.5-flash', 'batch-demo-1', NOW() - INTERVAL '3 days'),
('rev-004', 0.910, 'Algorithm & Content', 'Praise for Reels algorithm discovering new creators', 'gemini-1.5-flash', 'batch-demo-2', NOW() - INTERVAL '1 day'),
('rev-005', -0.720, 'Advertisements', 'Frustration over excessive sponsored ads in home feed', 'gemini-1.5-flash', 'batch-demo-2', NOW() - INTERVAL '4 days'),
('rev-006', -0.650, 'Messaging Bugs', 'Direct message glitches and unread notification badge errors', 'gemini-1.5-flash', 'batch-demo-2', NOW() - INTERVAL '5 days'),
('rev-007', 0.820, 'Call & Chat Quality', 'Reliable and clear performance for messaging and voice calls', 'gemini-1.5-flash', 'batch-demo-3', NOW() - INTERVAL '2 days'),
('rev-008', -0.920, 'Backup & Data Loss', 'Critical failure during chat backup restore process', 'gemini-1.5-flash', 'batch-demo-3', NOW() - INTERVAL '6 days'),
('rev-009', 0.050, 'Features', 'Neutral sentiment regarding channels tab vs private chat UI', 'gemini-1.5-flash', 'batch-demo-3', NOW() - INTERVAL '7 days'),
('rev-010', 0.950, 'Creative Tools', 'Enthusiastic praise for video filters and editing suite', 'gemini-1.5-flash', 'batch-demo-4', NOW() - INTERVAL '1 day'),
('rev-011', -0.680, 'Performance & Battery', 'Severe battery drain reported during video playback', 'gemini-1.5-flash', 'batch-demo-4', NOW() - INTERVAL '3 days'),
('rev-012', 0.740, 'Search & Speed', 'Positive feedback regarding search speed and responsiveness', 'gemini-1.5-flash', 'batch-demo-4', NOW() - INTERVAL '8 days')
ON CONFLICT (review_id) DO NOTHING;
