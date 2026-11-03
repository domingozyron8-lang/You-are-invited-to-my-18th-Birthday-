<!DOCTYPE html>
<html lang="en" class="scroll-smooth">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Elaiza Rose Domingo - 18th Birthday Debut</title>

    <!-- Tailwind CSS -->
    <script src="https://cdn.tailwindcss.com"></script>
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    colors: {
                        violettheme: {
                            50: '#f5f3ff',
                            100: '#ede9fe',
                            200: '#ddd6fe',
                            300: '#c4b5fd',
                            400: '#a78bfa',
                            500: '#8b5cf6',
                            600: '#7c3aed',
                            700: '#6d28d9',
                            800: '#5b21b6',
                            900: '#4c1d95',
                            950: '#2e1065',
                        },
                        lavender: {
                            light: '#FAF5FF',
                            DEFAULT: '#E9D5FF',
                            dark: '#D8B4FE',
                            accent: '#9333EA'
                        }
                    },
                    fontFamily: {
                        serif: ['Playfair Display', 'Georgia', 'serif'],
                        cursive: ['Great Vibes', 'cursive'],
                        sans: ['Inter', 'sans-serif'],
                    }
                }
            }
        }
    </script>

    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Great+Vibes&family=Inter:wght@300;400;500;600&family=Playfair+Display:ital,wght@0,400;0,600;0,700;1,400&display=swap" rel="stylesheet">

    <!-- FontAwesome Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <style>
        /* Custom Styles & Violet Theme Animations */
        body {
            background-color: #0f0719;
            color: #f3e8ff;
            overflow-x: hidden;
        }

        .font-cursive {
            font-family: 'Great Vibes', cursive;
        }

        .bg-violet-pattern {
            background-color: #120924;
            background-image: 
                radial-gradient(rgba(167, 139, 250, 0.15) 1.5px, transparent 1.5px),
                radial-gradient(rgba(124, 58, 237, 0.1) 1px, transparent 1px);
            background-size: 32px 32px, 16px 16px;
            background-position: 0 0, 8px 8px;
        }

        /* Glassmorphism Card (Dark Violet Theme) */
        .glass-card {
            background: rgba(30, 16, 56, 0.65);
            backdrop-filter: blur(14px);
            -webkit-backdrop-filter: blur(14px);
            border: 1px solid rgba(196, 181, 253, 0.2);
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.4), inset 0 1px 0 rgba(255, 255, 255, 0.1);
        }

        /* Floating Petals Animation */
        .petal {
            position: fixed;
            top: -10%;
            user-select: none;
            pointer-events: none;
            z-index: 50;
            animation: fall linear infinite;
        }

        @keyframes fall {
            0% {
                transform: translateY(0vh) rotate(0deg) translateX(0px);
                opacity: 0.9;
            }
            50% {
                transform: translateY(50vh) rotate(180deg) translateX(40px);
                opacity: 0.7;
            }
            100% {
                transform: translateY(105vh) rotate(360deg) translateX(-20px);
                opacity: 0;
            }
        }

        /* Shimmer Violet Border */
        .shimmer-border {
            position: relative;
        }
        .shimmer-border::before {
            content: '';
            position: absolute;
            inset: -2px;
            background: linear-gradient(45deg, #a78bfa, #6d28d9, #c4b5fd, #8b5cf6);
            border-radius: inherit;
            z-index: -1;
            opacity: 0.7;
            animation: borderPulse 4s ease infinite;
        }

        @keyframes borderPulse {
            0%, 100% { opacity: 0.5; filter: blur(2px); }
            50% { opacity: 0.95; filter: blur(4px); }
        }

        /* Neon Glow Effect */
        .text-glow {
            text-shadow: 0 0 20px rgba(167, 139, 250, 0.5), 0 0 40px rgba(124, 58, 237, 0.3);
        }
    </style>
</head>
<body class="font-sans antialiased bg-violet-pattern text-purple-100">

    <!-- Petals Container -->
    <div id="petals-container"></div>

    <!-- Navigation Bar -->
    <nav class="fixed top-0 left-0 w-full z-40 bg-[#120924]/80 backdrop-blur-md border-b border-violet-900/60 transition-all duration-300 shadow-lg" id="navbar">
        <div class="max-w-6xl mx-auto px-4 sm:px-6 lg:px-8">
            <div class="flex items-center justify-between h-16">
                <a href="#hero" class="font-cursive text-3xl font-bold text-violet-300 hover:text-white transition text-glow">Elaiza Rose</a>
                <div class="hidden md:flex space-x-2 text-sm font-medium text-purple-200">
                    <button onclick="switchTab('hero')" id="tab-btn-hero" class="tab-btn px-4 py-2 rounded-lg transition duration-200 bg-violet-600/60 text-white border border-violet-400/40">Home</button>
                    <button onclick="switchTab('details')" id="tab-btn-details" class="tab-btn px-4 py-2 rounded-lg transition duration-200 hover:bg-violet-900/40 hover:text-violet-300">Details</button>
                    <button onclick="switchTab('roses')" id="tab-btn-roses" class="tab-btn px-4 py-2 rounded-lg transition duration-200 hover:bg-violet-900/40 hover:text-violet-300">18 Roses</button>
                    <button onclick="switchTab('treasures')" id="tab-btn-treasures" class="tab-btn px-4 py-2 rounded-lg transition duration-200 hover:bg-violet-900/40 hover:text-violet-300">18 Treasures</button>
                </div>
                <!-- Mobile menu button -->
                <button id="mobile-menu-btn" class="md:hidden text-purple-200 hover:text-violet-300 focus:outline-none">
                    <i class="fas fa-bars text-xl"></i>
                </button>
            </div>
        </div>
        <!-- Mobile menu content -->
        <div id="mobile-menu" class="hidden md:hidden bg-[#180c33]/95 border-b border-violet-900/80 px-4 pt-2 pb-4 space-y-2 text-center text-sm">
            <button onclick="switchTab('hero')" class="block w-full py-2 text-purple-200 hover:text-violet-300 border-b border-violet-900/40">Home</button>
            <button onclick="switchTab('details')" class="block w-full py-2 text-purple-200 hover:text-violet-300 border-b border-violet-900/40">Details</button>
            <button onclick="switchTab('roses')" class="block w-full py-2 text-purple-200 hover:text-violet-300 border-b border-violet-900/40">18 Roses</button>
            <button onclick="switchTab('treasures')" class="block w-full py-2 text-purple-200 hover:text-violet-300">18 Treasures</button>
        </div>
    </nav>

    <!-- HERO SECTION -->
    <section id="hero" class="tab-content relative min-h-screen flex items-center justify-center pt-24 pb-12 px-4">
        <div class="max-w-3xl w-full text-center z-10">
            <!-- Decorative Crown Header -->
            <div class="inline-block mb-4 p-3.5 rounded-full bg-violet-950/80 border border-violet-500/40 shadow-lg shadow-violet-900/50">
                <i class="fas fa-crown text-violet-300 text-2xl sm:text-3xl"></i>
            </div>
            
            <p class="uppercase tracking-widest text-xs sm:text-sm font-semibold text-violet-300 mb-3">You Are Cordially Invited To The 18th Debut Of</p>
            
            <!-- Main Title -->
            <h1 class="font-cursive text-6xl sm:text-7xl md:text-8xl text-purple-100 font-bold mb-4 text-glow">
                Elaiza Rose Domingo
            </h1>
            
            <p class="font-serif italic text-lg sm:text-2xl text-purple-200/90 mb-8">
                "Blooms into womanhood, elegance, and grace"
            </p>

            <!-- Date & Countdown Box -->
            <div class="glass-card rounded-2xl p-6 sm:p-8 max-w-xl mx-auto mb-10 shimmer-border">
                <div class="flex flex-col sm:flex-row justify-around items-center border-b border-violet-800/50 pb-6 mb-6 gap-4">
                    <div class="text-center sm:text-left">
                        <span class="block text-xs uppercase text-violet-300/80 font-bold tracking-wider">Date & Time</span>
                        <span class="text-xl sm:text-2xl font-serif text-purple-100 font-semibold"><i class="far fa-calendar-alt text-violet-400 mr-2"></i>Nov 8, 2026 • 6:00 PM</span>
                    </div>
                    <div class="hidden sm:block h-10 w-px bg-violet-800/60"></div>
                    <div class="text-center sm:text-right">
                        <span class="block text-xs uppercase text-violet-300/80 font-bold tracking-wider">Location</span>
                        <span class="text-xl sm:text-2xl font-serif text-purple-100 font-semibold"><i class="fas fa-church text-violet-400 mr-2"></i>Majayjay</span>
                    </div>
                </div>

                <!-- Live Countdown -->
                <div id="countdown" class="grid grid-cols-4 gap-2 sm:gap-4 text-center">
                    <div class="bg-violet-950/70 rounded-xl p-3 border border-violet-700/40">
                        <span id="days" class="block text-2xl sm:text-3xl font-serif font-bold text-violet-300">00</span>
                        <span class="text-[10px] sm:text-xs text-purple-300 uppercase tracking-wider">Days</span>
                    </div>
                    <div class="bg-violet-950/70 rounded-xl p-3 border border-violet-700/40">
                        <span id="hours" class="block text-2xl sm:text-3xl font-serif font-bold text-violet-300">00</span>
                        <span class="text-[10px] sm:text-xs text-purple-300 uppercase tracking-wider">Hours</span>
                    </div>
                    <div class="bg-violet-950/70 rounded-xl p-3 border border-violet-700/40">
                        <span id="minutes" class="block text-2xl sm:text-3xl font-serif font-bold text-violet-300">00</span>
                        <span class="text-[10px] sm:text-xs text-purple-300 uppercase tracking-wider">Mins</span>
                    </div>
                    <div class="bg-violet-950/70 rounded-xl p-3 border border-violet-700/40">
                        <span id="seconds" class="block text-2xl sm:text-3xl font-serif font-bold text-violet-300">00</span>
                        <span class="text-[10px] sm:text-xs text-purple-300 uppercase tracking-wider">Secs</span>
                    </div>
                </div>
            </div>

            <!-- Action Button -->
            <div class="flex items-center justify-center">
                <button onclick="switchTab('details')" class="px-8 py-3.5 bg-gradient-to-r from-violet-600 via-purple-600 to-violet-800 hover:from-violet-500 hover:to-purple-700 text-white rounded-full font-medium shadow-lg shadow-violet-900/50 hover:shadow-xl transition transform hover:-translate-y-0.5 text-sm uppercase tracking-wider border border-violet-400/30">
                    View Event Details
                </button>
            </div>

            <!-- Strictly 1 Person Notice (Home Tab) -->
            <div class="mt-12 inline-flex items-center justify-center space-x-2 bg-violet-950/80 border border-violet-500/40 px-5 py-2.5 rounded-full shadow-md text-xs sm:text-sm text-violet-200">
                <i class="fas fa-exclamation-circle text-violet-400 text-base"></i>
                <span class="font-semibold tracking-wide uppercase">Strictly No Additional Guest • 1 Person Only Invited</span>
            </div>
        </div>
    </section>

    <!-- EVENT DETAILS SECTION -->
    <section id="details" class="tab-content hidden min-h-screen py-24 px-4 relative bg-[#0d0617]">
        <div class="max-w-5xl mx-auto flex flex-col justify-between min-h-[75vh]">
            <div>
                <div class="text-center mb-16">
                    <span class="text-violet-400 font-serif italic text-lg">Where & When</span>
                    <h2 class="font-serif text-3xl sm:text-4xl text-purple-100 font-bold mt-1">Celebration Details</h2>
                    <div class="w-24 h-1 bg-gradient-to-r from-violet-500 via-purple-300 to-violet-500 mx-auto mt-4 rounded-full"></div>
                </div>

                <div class="grid md:grid-cols-2 gap-8">
                    <!-- Time & Schedule Card -->
                    <div class="glass-card rounded-2xl p-8 flex flex-col justify-between hover:border-violet-400/50 transition duration-300 border-t-4 border-violet-500">
                        <div>
                            <div class="w-12 h-12 rounded-full bg-violet-900/60 border border-violet-500/30 flex items-center justify-center mb-6 text-violet-300 text-xl shadow-inner">
                                <i class="far fa-clock"></i>
                            </div>
                            <h3 class="font-serif text-2xl font-bold text-purple-100 mb-2">Date & Time</h3>
                            <p class="text-violet-300 font-semibold text-lg mb-4">November 8, 2026 (Sunday) at 6:00 PM</p>
                            <p class="text-purple-200/80 leading-relaxed mb-6 text-sm">
                                Join us as we start the evening with standard debut proceedings, special performances, and formal dining.
                            </p>
                        </div>
                        <ul class="space-y-3 text-sm text-purple-200/90 border-t border-violet-900/60 pt-4">
                            <li class="flex items-center"><i class="fas fa-check text-violet-400 mr-3"></i> 5:30 PM - Guest Arrival & Welcome Photos</li>
                            <li class="flex items-center"><i class="fas fa-check text-violet-400 mr-3"></i> 6:00 PM - Grand Entrance & Program Start</li>
                            <li class="flex items-center"><i class="fas fa-check text-violet-400 mr-3"></i> 7:30 PM - 18 Roses & 18 Treasures Ceremony</li>
                        </ul>
                    </div>

                    <!-- Venue Card -->
                    <div class="glass-card rounded-2xl p-8 flex flex-col justify-between hover:border-violet-400/50 transition duration-300 border-t-4 border-violet-500">
                        <div>
                            <div class="w-12 h-12 rounded-full bg-violet-900/60 border border-violet-500/30 flex items-center justify-center mb-6 text-violet-300 text-xl shadow-inner">
                                <i class="fas fa-church"></i>
                            </div>
                            <h3 class="font-serif text-2xl font-bold text-purple-100 mb-2">Venue Location</h3>
                            <p class="text-violet-300 font-semibold text-lg mb-1">River of Life Church</p>
                            <p class="text-purple-200/80 font-medium mb-4 text-sm"><i class="fas fa-map-marker-alt text-violet-400 mr-1.5"></i> Majayjay, Laguna</p>
                            <p class="text-purple-200/80 leading-relaxed mb-6 text-sm">
                                We look forward to welcoming you to this blessed venue for a night filled with love, laughter, and lasting memories.
                            </p>
                        </div>
                        <div class="border-t border-violet-900/60 pt-4">
                            <a href="https://maps.google.com/?q=River+of+Life+Church+Majayjay" target="_blank" rel="noopener noreferrer" class="inline-flex items-center text-sm font-semibold text-violet-300 hover:text-white transition">
                                <i class="fas fa-directions mr-2"></i> Get Directions via Google Maps
                            </a>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Strictly 1 Person Notice (Details Tab) -->
            <div class="mt-16 text-center">
                <div class="inline-flex items-center justify-center space-x-2 bg-violet-950/80 border border-violet-500/40 px-5 py-2.5 rounded-full shadow-md text-xs sm:text-sm text-violet-200">
                    <i class="fas fa-exclamation-circle text-violet-400 text-base"></i>
                    <span class="font-semibold tracking-wide uppercase">Strictly No Additional Guest • 1 Person Only Invited</span>
                </div>
            </div>
        </div>
    </section>

    <!-- 18 ROSES SECTION -->
    <section id="roses" class="tab-content hidden min-h-screen py-24 px-4">
        <div class="max-w-6xl mx-auto flex flex-col justify-between min-h-[75vh]">
            <div>
                <div class="text-center mb-16">
                    <span class="text-violet-400 font-serif italic text-lg">Gentlemen of Honor</span>
                    <h2 class="font-serif text-3xl sm:text-4xl text-purple-100 font-bold mt-1">The 18 Roses</h2>
                    <p class="text-purple-200/80 max-w-xl mx-auto mt-2 text-sm sm:text-base">Gentlemen sharing a special dance with the debutante, offering wishes of guidance and support.</p>
                    <div class="w-24 h-1 bg-gradient-to-r from-violet-500 via-purple-300 to-violet-500 mx-auto mt-4 rounded-full"></div>
                </div>

                <!-- Grid of 18 Roses -->
                <div class="grid grid-cols-2 sm:grid-cols-3 md:grid-cols-4 lg:grid-cols-6 gap-4 sm:gap-6" id="roses-grid">
                    <!-- Javascript populates this -->
                </div>
            </div>

            <!-- Strictly 1 Person Notice (18 Roses Tab) -->
            <div class="mt-16 text-center">
                <div class="inline-flex items-center justify-center space-x-2 bg-violet-950/80 border border-violet-500/40 px-5 py-2.5 rounded-full shadow-md text-xs sm:text-sm text-violet-200">
                    <i class="fas fa-exclamation-circle text-violet-400 text-base"></i>
                    <span class="font-semibold tracking-wide uppercase">Strictly No Additional Guest • 1 Person Only Invited</span>
                </div>
            </div>
        </div>
    </section>

    <!-- 18 TREASURES / GIFTS SECTION -->
    <section id="treasures" class="tab-content hidden min-h-screen py-24 px-4 bg-[#0d0617]">
        <div class="max-w-6xl mx-auto flex flex-col justify-between min-h-[75vh]">
            <div>
                <div class="text-center mb-16">
                    <span class="text-violet-400 font-serif italic text-lg">Ladies of Wisdom & Good Wishes</span>
                    <h2 class="font-serif text-3xl sm:text-4xl text-purple-100 font-bold mt-1">The 18 Treasures</h2>
                    <p class="text-purple-200/80 max-w-xl mx-auto mt-2 text-sm sm:text-base">Special ladies offering meaningful gifts, messages, and prayers for Elaiza's journey.</p>
                    <div class="w-24 h-1 bg-gradient-to-r from-violet-500 via-purple-300 to-violet-500 mx-auto mt-4 rounded-full"></div>
                </div>

                <!-- Grid of 18 Treasures -->
                <div class="grid grid-cols-2 sm:grid-cols-3 md:grid-cols-4 lg:grid-cols-6 gap-4 sm:gap-6" id="treasures-grid">
                    <!-- Javascript populates this -->
                </div>
            </div>

            <!-- Strictly 1 Person Notice (18 Treasures Tab) -->
            <div class="mt-16 text-center">
                <div class="inline-flex items-center justify-center space-x-2 bg-violet-950/80 border border-violet-500/40 px-5 py-2.5 rounded-full shadow-md text-xs sm:text-sm text-violet-200">
                    <i class="fas fa-exclamation-circle text-violet-400 text-base
