import { defineConfig } from 'vite';
import laravel from 'laravel-vite-plugin';
import vue from '@vitejs/plugin-vue';

export default defineConfig(({ command, mode }) => {
    const isProduction = mode === 'production';

    return {
        plugins: [
            laravel({
                input: 'resources/js/app.js',
                refresh: true,
                // Use the proper full URL in production for prefetching
                buildDirectory: 'build',
            }),
            vue({
                template: {
                    transformAssetUrls: {
                        base: null,
                        includeAbsolute: false,
                    },
                },
            }),
        ],
        base: isProduction ? '/' : '/',
        server: {
            https: true,
            host: '0.0.0.0',
            port: 5173,
        },
    };
});
