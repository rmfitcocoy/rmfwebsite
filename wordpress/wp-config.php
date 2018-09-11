<?php
define('DEVELOPER_MODE',FALSE);
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
define('DB_NAME', 'rmf_sydney');

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
define('AUTH_KEY',         'b=C~B%MbC?=<i8J~z]{$]+0nw{?qBA2$A5? E^,=OAj2ZD(@7Cz^q`mV|3^b8`Zl');
define('SECURE_AUTH_KEY',  'KcruUoKoV{m@N:X}{4:Uve^_-P1L1M~Bc@Z:6bVne?/[*;)K6he}|dc<Y3l$b<d;');
define('LOGGED_IN_KEY',    'I^/ lQx+z$_nn=SCdIH}K$)@Ds<C,ihId8B.`a2W2Q*<Zs3E?KrFZQbF#3E8vX.F');
define('NONCE_KEY',        '6l|<u-2W-&(Rd9W`_(fwEfpO>.>aR%tft(9R8yf-&l=YK_Fa8|!DehGyeg9<ZMJy');
define('AUTH_SALT',        'ei&ZC@FVLX`9=qV9km:t<c0Wnfv.@W>Y-^MIjZ7/Mq[=au`21dBjRX#BXYu#LO08');
define('SECURE_AUTH_SALT', 'M*a6eUdTE1yf;tE[Pa>w3A-q&%Sn%dj4 g od/dLzU3k*z@ (3}CWQ=*bpl]SYak');
define('LOGGED_IN_SALT',   'R;EkEAOX5ptj2~I! ;kkwlwhj)3:r~$<WxKCp6,+>?~IM^S!}Ck%rcaCS3f;D7~-');
define('NONCE_SALT',       '#a{~UdPD%PNL%7UA;S.u{2G@Ir;rPZ][0$B=:D*SUgvVIx_m.-TKYi^9kcmC~i`@');

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
 
define('WP_DEBUG', DEVELOPER_MODE);
define('WP_DEBUG_DISPLAY', DEVELOPER_MODE);
/* That's all, stop editing! Happy blogging. */

/** Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');
