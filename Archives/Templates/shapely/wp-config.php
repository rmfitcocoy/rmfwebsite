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
define('DB_NAME', 'rmf_shapely');

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
define('AUTH_KEY',         'PS7hRZnb,]4RJ(X,L;{rA3s@TUZd^*p)ZH1>Jv>^?h[{j.k2>;(IKq%prD38-Fb.');
define('SECURE_AUTH_KEY',  'j~j~HGc^aDef/UPP>4xZ|rjX[U3$uJn?i`pZf(HOl],gW[t(~`Mh&B?&esY$P<Kt');
define('LOGGED_IN_KEY',    '1d`,/V,4U%D/rqb<*H<ry3}LEyF<[=: 7.#kq5c^j5Pd%6fSl,3 yTW$<S(2q+*C');
define('NONCE_KEY',        '_Y9O_zxURk8r~-VJIX%L,3fsBcF<F#?stL#jO@bvuL524WKT?NiEjX(op-RL}+}T');
define('AUTH_SALT',        '/Z9_k<=h.ZP_YF,zUGt]E]1VQR>cza+L(A*0A7j7JD](m) 2Q<G_Md*h)2)3nJtN');
define('SECURE_AUTH_SALT', ';*zbc$Cc(}dN?i>Sg6GMwe[A[4h2<;F6dWB umEhw_(p?JZC/MOB@N)vD-=2kmU@');
define('LOGGED_IN_SALT',   'LA#{&P9U!%P!&JFAnB6:xdA*WN yGLmdFi3%w[XEv^C81^j#ec52o&-6Mzd@_BQy');
define('NONCE_SALT',       'JvI++J&:nwnpo20,51=cxO17*,%ck<Lg3%16)oE`0AP`ti/Y7nmH~Oy@oJ/=qpbk');

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
