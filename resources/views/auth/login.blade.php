<x-guest-layout>

    <div class="min-h-screen flex items-center justify-center bg-gray-100 px-4">
        <div class="w-full max-w-3xl bg-white rounded-3xl shadow-xl overflow-hidden flex flex-col sm:flex-row">

            {{-- Panel kiri: logo --}}
            <div class="sm:w-1/2 flex flex-col items-center justify-center gap-4 p-10 border-b sm:border-b-0 sm:border-r border-gray-200">
                <img src="{{ asset('images/logo-bpkp.png') }}" alt="Logo BPKP" class="w-32 h-auto">
                <p class="text-sm font-semibold text-gray-700 text-center">Aplikasi Konsultasi Online</p>
            </div>

            {{-- Panel kanan: form login --}}
            <div class="sm:w-1/2 p-8 sm:p-10">
                <h1 class="text-2xl font-bold text-gray-800 mb-6">Login</h1>

                <!-- Session Status -->
                <x-auth-session-status class="mb-4" :status="session('status')" />

                <form method="POST" action="{{ route('login') }}">
                    @csrf

                    <!-- Email Address -->
                    <div>
                        <x-input-label for="email" :value="__('Email')" />
                        <div class="relative mt-1">
                            <span class="absolute inset-y-0 left-0 flex items-center pl-3 text-gray-400 z-10">
                                <svg xmlns="http://www.w3.org/2000/svg" class="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                    <path stroke-linecap="round" stroke-linejoin="round" d="M3 8l7.89 5.26a2 2 0 002.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z" />
                                </svg>
                            </span>
                            <x-text-input id="email" class="block w-full pl-9" type="email" name="email" :value="old('email')" required autofocus autocomplete="username" />
                        </div>
                        <x-input-error :messages="$errors->get('email')" class="mt-2" />
                    </div>

                    <!-- Password -->
                    <div class="mt-4">
                        <x-input-label for="password" :value="__('Password')" />
                        <div class="relative mt-1">
                            <span class="absolute inset-y-0 left-0 flex items-center pl-3 text-gray-400 z-10">
                                <svg xmlns="http://www.w3.org/2000/svg" class="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                    <path stroke-linecap="round" stroke-linejoin="round" d="M12 15v2m-6 4h12a2 2 0 002-2v-6a2 2 0 00-2-2H6a2 2 0 00-2 2v6a2 2 0 002 2zm10-10V7a4 4 0 00-8 0v4h8z" />
                                </svg>
                            </span>
                            <x-text-input id="password" class="block w-full pl-9"
                                            type="password"
                                            name="password"
                                            required autocomplete="current-password" />
                        </div>
                        <x-input-error :messages="$errors->get('password')" class="mt-2" />
                    </div>

                    <!-- Remember Me -->
                    <div class="block mt-4">
                        <label for="remember_me" class="inline-flex items-center">
                            <input id="remember_me" type="checkbox" class="rounded border-gray-300 text-blue-600 shadow-sm focus:ring-blue-500" name="remember">
                            <span class="ms-2 text-sm text-gray-600">{{ __('Remember me') }}</span>
                        </label>
                    </div>

                    <!-- Tombol Masuk -->
                    <x-primary-button class="w-full justify-center mt-4 bg-blue-600 hover:bg-blue-700">
                        {{ __('Masuk') }}
                    </x-primary-button>

                    <!-- Link daftar & lupa password -->
                    <div class="flex flex-col gap-2 text-sm mt-4 text-center">
                        @if (Route::has('register'))
                            <a href="{{ route('register') }}" class="text-gray-600 hover:text-blue-600 underline">
                                Belum Punya Akun?
                            </a>
                        @endif

                        @if (Route::has('password.request'))
                            <a href="{{ route('password.request') }}" class="text-gray-600 hover:text-blue-600 underline">
                                {{ __('Forgot your password?') }}
                            </a>
                        @endif
                    </div>
                </form>
            </div>

        </div>
    </div>

</x-guest-layout>