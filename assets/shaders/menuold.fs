#if defined(VERTEX) || __VERSION__ > 100 || defined(GL_FRAGMENT_PRECISION_HIGH)
    #define MY_HIGHP_OR_MEDIUMP highp
#else
    #define MY_HIGHP_OR_MEDIUMP mediump
#endif

extern MY_HIGHP_OR_MEDIUMP number time;
extern MY_HIGHP_OR_MEDIUMP number vort_speed;
extern MY_HIGHP_OR_MEDIUMP vec4 colour_1;
extern MY_HIGHP_OR_MEDIUMP vec4 colour_2;
extern MY_HIGHP_OR_MEDIUMP number mid_flash;
extern MY_HIGHP_OR_MEDIUMP number vort_offset;

#define PIXEL_SIZE_FAC 700.
#define BLACK 0.6 * vec4(79./255., 99./255., 103./255., 1./0.6)

vec4 effect(vec4 colour, Image texture, vec2 texture_coords, vec2 screen_coords)
{
    MY_HIGHP_OR_MEDIUMP number pixel_size = length(love_ScreenSize.xy) / PIXEL_SIZE_FAC;
    MY_HIGHP_OR_MEDIUMP vec2 uv = (floor(screen_coords / pixel_size) * pixel_size - 0.5 * love_ScreenSize.xy) / length(love_ScreenSize.xy);
    MY_HIGHP_OR_MEDIUMP number uv_len = length(uv);

    MY_HIGHP_OR_MEDIUMP number speed = time * vort_speed;
    MY_HIGHP_OR_MEDIUMP number angle = atan(uv.y, uv.x) + (2.2 + 0.4 * min(6.0, speed)) * uv_len - 1.0 - speed * 0.05 - min(6.0, speed) * speed * 0.02 + vort_offset;
    MY_HIGHP_OR_MEDIUMP vec2 mid = (love_ScreenSize.xy / length(love_ScreenSize.xy)) * 0.5;
    MY_HIGHP_OR_MEDIUMP vec2 sv = vec2(uv_len * cos(angle) + mid.x, uv_len * sin(angle) + mid.y) - mid;

    sv *= 30.0;
    speed = time * 6.0 * vort_speed + vort_offset + 1033.0;
    MY_HIGHP_OR_MEDIUMP vec2 uv2 = vec2(sv.x + sv.y);

    for (int i = 0; i < 5; i++) {
        uv2 += sin(max(sv.x, sv.y)) + sv;
        sv += 0.5 * vec2(cos(5.1123314 + 0.353 * uv2.y + speed * 0.131121), sin(uv2.x - 0.113 * speed));
        sv -= cos(sv.x + sv.y) - sin(sv.x * 0.711 - sv.y);
    }

    const int LAYERS = 6;
    MY_HIGHP_OR_MEDIUMP number total_weight = 0.0;
    MY_HIGHP_OR_MEDIUMP number max_weight = 0.0;
    MY_HIGHP_OR_MEDIUMP vec4 ret_col = vec4(0.0);

    for (int i = 0; i < LAYERS; i++) {
        number offset = number(i - (LAYERS / 2)) * 0.5;
        number smoke = min(2.0, max(-2.0, 1.5 + length(sv) * 0.12 - 0.17 * (min(10.0, time * 1.2 - 4.0)) + offset));

        if (smoke < 0.2)
            smoke = (smoke - 0.2) * 0.6 + 0.2;

        number p = max(0.0, 1.0 - 2.0 * abs(1.0 - smoke));
        total_weight += p;
        max_weight = max(max_weight, p);

        // alternate between colour_1 and colour_2 manually (no %)
        vec4 use_col = mix(colour_1, colour_2, float((i / 2) * 2 == i ? 0.0 : 1.0));
        ret_col += use_col * p;
    }

    number cb = 1.0 - min(1.0, total_weight);
    ret_col += vec4(cb * BLACK.rgb, cb * colour_1.a);

    number mod_flash = max(mid_flash * 0.8, max_weight * 5.0 - 4.4) + mid_flash * max_weight;
    return ret_col * (1.0 - mod_flash) + mod_flash;
}