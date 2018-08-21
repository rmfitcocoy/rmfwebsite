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
define('AUTH_KEY',         'aYr_1#U/;v>xYsZQtcE6VR>{K|A|k7f]uj [l#q7!5#r:B$,28TtoO@(q*ZQf;a{');
define('SECURE_AUTH_KEY',  '.L_dFs:p{ZEtUYG92:`ZVEOf$P@qbuln)6k~-PZa~z~y,nzHELP2c }ml,PC*Y36');
define('LOGGED_IN_KEY',    '.%Zd(_6a8F-&^j+E4$U|xw!V+;a?IL&8NC5*xV)zR3z.kUTA[?sK.1G%?V}iM7UT');
define('NONCE_KEY',        '@4+Ni6/<Hvi@wHtUH=RZ.n)F)hDm7tcn6gNlvZH.Q;4[MWw+R ECJhqnIPEA3,%)');
define('AUTH_SALT',        'j}<$#pi=IG!,[Cj0;|Ajs}oa8<~x.XMQI`C=dFZ+~iWE1u>Cwn~`)WF4*nJWBA]u');
define('SECURE_AUTH_SALT', 'Aob@5`1ZQgOQ/Bw:=CA6Ax VN-|KJtMw0wI!`bF#70ia&dxa59msVFkd#;@JqGsa');
define('LOGGED_IN_SALT',   'o?][h^s?zx|4OP[{W=nxH[~m[!t/dK7fPnOXcZ d0E3it!Ki?h;rw%oy0DIAEwAT');
define('NONCE_SALT',       '<aCXv}?LQNn#26e^|B}dg6O4d)TL~78hqUY$IqzAAr>q_g92#Lmi $_a.wwKQ7):');

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
