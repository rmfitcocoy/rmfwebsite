<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define('DB_NAME', 'rmf_screenr');

/** MySQL database username */
define('DB_USER', 'root');

/** MySQL database password */
define('DB_PASSWORD', '');

/** MySQL hostname */
define('DB_HOST', 'localhost');

/** Database Charset to use in creating database tables. */
define('DB_CHARSET', 'utf8mb4');

/** The Database Collate type. Don't change this if in doubt. */
define('DB_COLLATE', '');

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'O{f9%5uyf|MC__j4L2Q!QJ%2_QHhRA6Mv5GG![wRDw8>: + @oDB~iHJM5Ww++iK');
define('SECURE_AUTH_KEY',  'lkx-|,fC;y W{oOin`iJ /3U<?(3whft&c o$`]7TM# 3Ris{Ii<3x5?s*Hqz0$l');
define('LOGGED_IN_KEY',    'N{#l:Tv{_?=(~a}]Xg>>[#/Y*!;]:h*7PjrNJ5]cBi5p^Qp#Yp;Cm5`~r^`@kJk$');
define('NONCE_KEY',        'kw;U$*zikKfsnqB;j2Fy`V7^Sh<rt|:Br`fUH4~_)4}H^?c3&ce3vfMkV8ti]_hP');
define('AUTH_SALT',        'l$G[J2}89Gm0|xb]IZC:&w8^2K6M}yib#}9E)^vc%S[EcPL8jO Tgo{omOt0J.U}');
define('SECURE_AUTH_SALT', ',7P %>QD&#>,hNQ655})XVkB+r]J,+bt@Hf^IDW@Zxol>48T&vx7Vb;=n=Q:b`7 ');
define('LOGGED_IN_SALT',   'Df#k,8NIX59<@#dkO_qyj,&n5+I~oShP|SZP[hvO*QA]HH>u1M:A}Fv5%F>E~=[G');
define('NONCE_SALT',       'Os2~v>I9)Sx!^_iY44CI0Xe)T0w>4$1p$p7^+R;H;qp^y^2%zd`Gg{Tb<`h8>Q;N');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix  = 'rmf_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the Codex.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
define('WP_DEBUG', false);

/* That's all, stop editing! Happy blogging. */

/** Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');
