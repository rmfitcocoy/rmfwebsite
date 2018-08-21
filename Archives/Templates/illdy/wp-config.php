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
define('DB_NAME', 'rmf_illdy');

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
define('AUTH_KEY',         's-XtV-+ooc|P1H5Xd57c^kaqF:|+y.GP+:MJ&7`d!03ud ,D%x13u>5EwU7oQ*uT');
define('SECURE_AUTH_KEY',  'NIKZ9(5}oll4DR2bG5D[>/rETGB)PC4VRiTVg X}HW)s.7MA.25eRG~VwN@T 0*Y');
define('LOGGED_IN_KEY',    'wHh_tIP<N.uZ58sl[oePKhvtT=]GYJ.^=i/$v?sN2s>$hi+;Uw,rvw%O>%S5:v[>');
define('NONCE_KEY',        '.Cf>Gr(iy|CIZAN>z? zY7*8A/2S:JZ7m,_C4LqT&BC_?;04>^4mfm)H5,R=!w|`');
define('AUTH_SALT',        'd1ogTVa8doMl[-{8<U@Pl^yT2Pn)4+AAJyHU~DD@wlo;wRVGmIL 5@+ZNgT_@#^H');
define('SECURE_AUTH_SALT', '7s_:)8,Jh19u%3Fhx{@MQ1h-d;Fs0HamjN3&owqIa`./{j3f_Uubfo?1T#pB&twD');
define('LOGGED_IN_SALT',   '~ UTI`&YZH0xgI<+qhtV{gJeuG{Nza2>Ct cs,vXj__+bl%.tLBq_7(;nLT7TYLV');
define('NONCE_SALT',       '5h9rwOFL[(R[09I8jOp2;Q?Xr9q&,o)mS//,df()1=w/B0uVlTSrK:vQUizGxPNN');

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
