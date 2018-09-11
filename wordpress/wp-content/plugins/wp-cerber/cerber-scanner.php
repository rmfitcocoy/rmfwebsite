<?php
/*
 	Copyright (C) 2015-18 CERBER TECH INC., http://cerber.tech
    Copyright (C) 2015-18 Gregory Markov, https://wpcerber.com

    Licenced under the GNU GPL.

    This program is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation; either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program; if not, write to the Free Software
    Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA

*/

/*

*========================================================================*
|                                                                        |
|	       ATTENTION!  Do not change or edit this file!                  |
|                                                                        |
*========================================================================*

*/

define( 'CERBER_FT_WP', 1 );
define( 'CERBER_FT_PLUGIN', 2 );
define( 'CERBER_FT_THEME', 3 );
define( 'CERBER_FT_ROOT', 4 );
define( 'CERBER_FT_UPLOAD', 5 );
define( 'CERBER_FT_LNG', 6 );
define( 'CERBER_FT_MUP', 7 );
define( 'CERBER_FT_CNT', 8 );
define( 'CERBER_FT_CONF', 10 );
define( 'CERBER_FT_DRIN', 11 );
define( 'CERBER_FT_OTHER', 12 );

define( 'CERBER_MAX_SECONDS', 5 );
define( 'CERBER_MAX_SECONDS_CLOUD', 25 );

define( 'CERBER_FOK', 1 );
define( 'CERBER_VULN', 4 );
define( 'CERBER_NOHASH', 5 );
define( 'CERBER_IMD', 15 );
define( 'CERBER_SCF', 16 );
define( 'CERBER_PMC', 17 );
define( 'CERBER_USF', 18 );
define( 'CERBER_EXC', 20 );
define( 'CERBER_DIR', 26 );
define( 'CERBER_UXT', 30 );

define( 'CERBER_MALWR_DETECTED', 1000 );

define( 'CRB_HASH_THEME', 'hash_tm_' );
define( 'CRB_HASH_PLUGIN', 'hash_pl_' );
define( 'CRB_LAST_FILE', 'tmp_last_file' );

define( 'CRB_SCAN_GO',   '__CERBER__SECURITY_SCAN_GO__' );
define( 'CRB_SCAN_STOP', '__CERBER__SECURITY_SCAN_STOP__' );
define( 'CRB_SCAN_DTB',  '__CERBER__SECURITY_SCAN_DATA_B' );
define( 'CRB_SCAN_DTE',  '__CERBER__SECURITY_SCAN_DATA_E' );

function cerber_integrity_page() {

	$tab = cerber_get_tab( 'scanner', array( 'scanner', 'scan_settings', 'scan_schedule', 'scan_quarantine', 'help' ) );

	?>
    <div class="wrap crb-admin">

        <h1><?php _e( 'Site Integrity', 'wp-cerber' ) ?></h1>

        <h2 class="nav-tab-wrapper cerber-tabs">
		    <?php

		    echo '<a href="' . cerber_admin_link( 'scanner' ) . '" class="nav-tab ' . ( $tab == 'scanner' ? 'nav-tab-active' : '' ) . '"><i class="crb-icon crb-icon-bx-radar"></i> ' . __( 'Security Scanner', 'wp-cerber' ) . '</a>';
		    echo '<a href="' . cerber_admin_link( 'scan_settings' ) . '" class="nav-tab ' . ( $tab == 'scan_settings' ? 'nav-tab-active' : '' ) . '"><i class="crb-icon crb-icon-bxs-slider-alt"></i> ' . __( 'Settings' ) . '</a>';
		    echo '<a href="' . cerber_admin_link( 'scan_schedule' ) . '" class="nav-tab ' . ( $tab == 'scan_schedule' ? 'nav-tab-active' : '' ) . '"><i class="crb-icon crb-icon-bx-time"></i> ' . __( 'Scheduling' ) . '</a>';
		    echo '<a href="' . cerber_admin_link( 'scan_quarantine' ) . '" class="nav-tab ' . ( $tab == 'scan_quarantine' ? 'nav-tab-active' : '' ) . '"><i class="crb-icon crb-icon-bx-trash"></i> ' . __( 'Quarantine' ) . '</a>';
		    echo '<a href="' . cerber_admin_link( 'help', array( 'page' => cerber_get_admin_page() ) ) . '" class="nav-tab ' . ( $tab == 'help' ? 'nav-tab-active' : '' ) . '"><i class="crb-icon crb-icon-bx-idea"></i> ' . __( 'Help', 'wp-cerber' ) . '</a>';

		    echo lab_indicator();
			?>
        </h2>

		<?php

		cerber_show_aside( $tab );

		echo '<div class="crb-main">';

		switch ( $tab ) {
			case 'scan_settings':
				cerber_show_settings_page( 'scanner' );
				break;
			case 'scan_schedule':
				cerber_show_settings_page( 'schedule' );
				break;
			case 'scan_quarantine':
				cerber_show_quarantine();
				break;
			case 'help':
				cerber_show_help();
				break;
			default:
				cerber_show_scanner();
		}

		echo '</div>';

		?>

    </div>
	<?php
}

function cerber_show_scanner() {
    // http://www.adequatelygood.com/JavaScript-Module-Pattern-In-Depth.html

	$msg      = '';
	$status   = 0;

	if ( $scan = cerber_get_scan() ) {
		if ( ! $scan['finished'] ) {
			if ( $scan['cloud']
			     && cerber_is_cloud_enabled()
			     && $scan['started'] > ( time() - 900 )
			) {
				$msg = __( 'Currently a scheduled scan in progress. Please wait until it is finished.', 'wp_cerber' );
				$status = 1;
			}
			else {
				$msg = sprintf( __( 'Previous scan started %s has not been completed. Continue scanning?', 'wp-cerber' ), cerber_date( $scan['started'] ) );
				$status = 2;
			}
		}
		else {

		}
	}
	else {
		$msg = __( 'It seems this website has never been scanned. To start scanning click the button below.', 'wp-cerber' );
	}

	$start_quick = '<input data-control="start_scan" data-mode="quick" type="button" value="' . __( 'Start Quick Scan', 'wp-cerber' ) . '" class="button button-primary">';
	$start_full  = '<input data-control="start_scan" data-mode="full" type="button" value="' . __( 'Start Full Scan', 'wp-cerber' ) . '" class="button button-primary">';
	$stop        = '<input id="crb-stop-scan" style="display: none;" data-control="stop_scan" type="button" value="' . __( 'Stop Scanning', 'wp-cerber' ) . '" class="button button-primary">';
	$continue    = '<input id="crb-continue-scan" data-control="continue_scan" type="button" value="' . __( 'Continue Scanning', 'wp-cerber' ) . '" class="button button-primary">';
	$controls    = '';

	switch ( $status ) {
		case 0:
			$controls = $start_quick . $start_full;
			break;
		case 1:
			$controls = '';
			break;
		case 2:
			$controls = $start_quick . $start_full . $continue;
			break;
	}

	$controls .= $stop;


	echo '<div id="crb-scanner">';

	cerber_scanner_dashboard( $msg );

	?>
    <div id="crb-scan-area">
        <form>
            <table id="crb-scan-controls">
                <tr>
                    <td id="crb-file-controls"><input data-control="delete_file" type="button"
                                                      class="button button-secondary"
                                                      value="<?php _e( 'Delete', 'wp-cerber' ); ?>"/></td>
                    <td>
						<?php echo $controls; ?>
                    </td>
                    <!-- <td><a href="#" data-control="full-paths">Show full paths</a></td> -->
                    <td><a href="#" class="dashicons dashicons-list-view" data-control="full-paths" title="Toggle full/relative paths"></a></td>
                </tr>
            </table>
        </form>
    </div>

    <?php

	echo '</div>';
}

add_action( 'wp_ajax_cerber_scan_control', 'cerber_manual_scan' );
function cerber_manual_scan() {
	global $cerber_db_errors;

	cerber_check_ajax();

	ob_start(); // Collecting possible junk warnings and notices cause we need clean JSON to be sent

	$scanner     = array();
	$console_log = array();
	$scan_do     = '';

	if ( cerber_is_http_post() && isset( $_POST['cerber_scan_do'] ) ) {
		$scan_do = preg_replace( '/[^a-z_\-\d]/i', '', $_POST['cerber_scan_do'] );
		$mode = ( isset( $_POST['cerber_scan_mode'] ) ) ? preg_replace( '/[^a-z_\-\d]/i', '', $_POST['cerber_scan_mode'] ) : 'quick';

		$scanner = cerber_scanner( $scan_do, $mode );

	}
	else {
		$console_log[] = 'Unknown HTTP request';
	}

	$next_do = ( ! empty( $scanner['cerber_scan_do'] ) ) ? $scanner['cerber_scan_do'] : 'stop';

	if ( $cerber_db_errors ) {
		$console_log = array_merge( $console_log, $cerber_db_errors );
	}

	$console_log[] = 'PHP MEMORY ' . @ini_get( 'memory_limit' );

	$ret = array(
		'console_log'    => $console_log,
		'cerber_scan_do' => $next_do,
		'cerber_scanner' => $scanner,
		//'scan'           => cerber_get_scan(), // debug only
	);

	if ( $scan_do != 'continue_scan' ) {
		$ret['strings'] = cerber_get_strings();
	}

	ob_end_clean();

	echo json_encode( $ret );

	wp_die();
}

add_action( 'plugins_loaded', function () {
	global $cerber_db_errors;

	if ( ! cerber_is_cloud_request() ) {
		return;
	}

	ob_start(); // Collecting possible junk warnings and notices cause we need clean JSON to be sent

    // Load dependencies
	if ( ! function_exists( '_get_dropins' ) ) {
		require_once( ABSPATH . 'wp-admin/includes/plugin.php' );
	}

	$scanner = array();
	$errors  = array();
	$do      = '';

	if ( isset( $_POST['scan_mode'] ) ) {

	    $mode = ( isset( $_POST['scan_mode'] ) ) ? preg_replace( '/[^a-z_\-\d]/i', '', $_POST['scan_mode'] ) : 'quick';

		if ( cerber_is_cloud_enabled( $mode ) ) {
			if ( $scan = cerber_get_scan() ) {
				if ( $scan['finished'] || $scan['aborted'] ) {
					if ( $scan['finished'] < ( time() - 900 ) ) {
						$do = 'start_scan';
					}
					else {
						$errors['p'] = 'Scan protection interval';
					}
				}
                elseif ( $scan['cloud'] ) {
					if ( $scan['cloud'] == lab_get_real_node_id() ) {
						$do = 'continue_scan';
					}
					else {
					    // Restart a hung scan
                        if ( $scan['started'] < ( time() - 900 ) ) {
	                        $do = 'start_scan';
                        }
                        else {
	                        $errors['d'] = 'Scan from different node in progress';
                        }
					}
				}
				// Restart a hung/abandoned scan
                elseif ( $scan['started'] < ( time() - 900 ) ) {
					$do = 'start_scan';
				}
			}
			else {
				$do = 'start_scan';
			}

			if ( $do ) {
				$scanner           = cerber_scanner( $do, $mode );
				$scanner['errors'] = array(); // We don't process each error
			}

		}
		else {
			$errors['m'] = 'Mode is disabled';
		}

	}
	else {
		$errors['u'] = 'Unknown cloud request';
	}

	if ( ! empty( $scanner['cerber_scan_do'] ) ) {
		$do = $scanner['cerber_scan_do'];
	}
	else {
		$do = 'stop';
	}

	$db_errors = array_map( function ( $err ) {
		return substr( $err, 0, 1000 );
	}, $cerber_db_errors );

	$ret = array(
		'cerber_scanner' => $scanner,
		'client_errors'  => array( $errors, $db_errors ),
		'mem_limit'      => @ini_get( 'memory_limit' ),
		'ver'            => CERBER_VER
		//'scan'           => cerber_get_scan(), // debug only
	);

	ob_end_clean();

	if ( $do == 'continue_scan' ) {
		echo CRB_SCAN_GO;
	}
	else {
	    echo CRB_SCAN_STOP;
    }

	echo CRB_SCAN_DTB;
	echo json_encode( $ret );
	echo CRB_SCAN_DTE;

	die();

} );

function cerber_scanner( $control, $mode ) {
	global $cerber_db_errors, $cerber_scan_mode;

	$errors = array();

	if ( function_exists( 'wp_raise_memory_limit' ) ) {
		wp_raise_memory_limit( 'admin' );
	}
	else {
	    $errors[] = 'Unable to raise memory limit';
    }

	if ( ! $mode ) {
		$mode = 'quick';
	}

	$cerber_scan_mode = $mode;
	$status = null;
	$response = array();

	switch ( $control ) {
		case 'start_scan':
			cerber_update_set( CRB_LAST_FILE, '', 0, false );
			cerber_init_scan( $mode );
			cerber_step_scanning();
			break;
		case 'continue_scan':
			if ( $scan = cerber_get_scan() ) {
				$cerber_scan_mode = $scan['mode'];
				cerber_step_scanning();
			}
			else {
				$errors[] = 'No scan in progress';
            }
			break;
        case 'get_last_scan':
	        if ($scan = cerber_get_scan()) {
		        $filtered = $scan['issues'];
		        foreach ( $scan['issues'] as $key => $item ) {
			        if ( isset( $item['issues'] ) ) {
				        foreach ( $item['issues'] as $id => $issue ) {
					        if ( isset( $issue['data']['name'] ) ) {
						        if ( ! file_exists( $issue['data']['name'] ) ) {
							        unset( $filtered[ $key ]['issues'][ $id ] );
						        }
					        }
				        }
				        // We have to refresh indexes for JS in the user browser
				        $filtered[ $key ]['issues'] = array_values( $filtered[ $key ]['issues'] );
			        }
		        }
		        $response['issues'] = $filtered;
	        }
            break;
	}

	if ($scan = cerber_get_scan()) {

		$response['scan_id'] = $scan['id'];
		$response['mode']    = $scan['mode'];
		$response['cloud']   = $scan['cloud'];

		if ( $scan['finished'] || $scan['aborted'] ) {
			$response['cerber_scan_do'] = 'stop';
			//$response['checksum'] = sha1( serialize( $scan['issues'] ) );
		}
		else {
			$response['cerber_scan_do'] = 'continue_scan';
		}

		$response['aborted']      = $scan['aborted'];
		$response['errors']       = array_merge( $errors, $scan['errors'] );
		$response['errors_total'] = count( $response['errors'] );

		$response['total'] = $scan['total'];
		$response['step']  = $scan['next_step'];

		if ( ! cerber_is_cloud_request() ) {
			$response['step_issues'] = $scan['step_issues'];
			$response['scanned']     = $scan['scanned'];
			$response['numbers']     = $scan['numbers'];

			$response['started']  = cerber_date( $scan['started'] );
			$response['elapsed'] = time() - $scan['started'];
			$duration = $response['elapsed'];

			$response['finished'] = '';
			$response['duration'] = '';

			if ( $scan['finished'] ) {
				$response['finished'] = cerber_date( $scan['finished'] );
				$duration = $scan['finished'] - $scan['started'];
				$response['step'] = '';
			}
			else {
				$response['step'] = $scan['next_step'];
            }

			if ( $duration < 60 ) {
				$response['duration'] = $duration . ' seconds';
			}
			else {
				$response['duration'] = round( $duration / 60, 2 ) . ' minutes';
			}

			if ( $duration && ! empty( $scan['scanned']['bytes'] ) ) {
				$response['performance'] = number_format( round( ( $scan['scanned']['bytes'] / $duration ) / 1024, 0 ), 0, '.', ' ' );
			}
			else {
				$response['performance'] = 0;
			}
			$response['performance'] .= ' KB/sec';

		}
	}
	else {
		$response['cerber_scan_do'] = 'stop';
	}

	if ( $cerber_db_errors ) {
		cerber_watchdog( true );
	}

	return $response;
}

function cerber_show_last_scan_results() {
	$mime = wp_check_filetype( $file_name );
}

function cerber_step_scanning() {
    global $cerber_scan_mode;

	ignore_user_abort( true );

	cerber_exec_timer();

	if ( ! $scan = cerber_get_scan() ) {
		return false;
	}

	if ( $scan['finished'] || $scan['aborted'] ) {
		return true;
	}

	cerber_update_scan( array( 'step_issues' => array() ) );

	$update    = array();
	$next_step = $scan['next_step'];
	$aborted   = 0;
	$remain    = 0;
	$exceed    = false;

	switch ( $scan['next_step'] ) {
		case 1:
			if ( $result = cerber_scan_directory( ABSPATH, null, '_crb_save_file_names' ) ) {
				$above = dirname( cerber_get_abspath() ) . DIRECTORY_SEPARATOR;
				_crb_save_file_names( array( $above . 'wp-config.php', $above . '.htaccess' ) );
				$update['total']['files']   = cerber_db_get_var( 'SELECT COUNT(scan_id) FROM ' . cerber_get_db_prefix() . CERBER_SCAN_TABLE . ' WHERE scan_id = ' . $scan['id'] );
				$update['total']['folders'] = $result[0];
			}
			else {
				$aborted = 1;
			}
			break;
		case 2:
			if ( crb_get_settings( 'scan_tmp' ) ) {
				$tmp_dir = @ini_get( 'upload_tmp_dir' );
				if ( is_dir( $tmp_dir ) && $result = cerber_scan_directory( $tmp_dir, null, '_crb_save_file_names' ) ) {
					//$update['total']['folders'] += $result[0];
				}
				$update['total']['files'] = cerber_db_get_var( 'SELECT COUNT(scan_id) FROM ' . cerber_get_db_prefix() . CERBER_SCAN_TABLE . ' WHERE scan_id = ' . $scan['id'] );
			}
			break;
		case 3:
			if ( crb_get_settings( 'scan_tmp' ) ) {
				$tmp_dir = @ini_get( 'upload_tmp_dir' );
				$another_dir = sys_get_temp_dir();
				if ( $another_dir !== $tmp_dir && @is_dir( $another_dir ) && $result = cerber_scan_directory( $another_dir, null, '_crb_save_file_names' ) ) {
					//$update['total']['folders'] += $result[0];
				}
				$update['total']['files'] = cerber_db_get_var( 'SELECT COUNT(scan_id) FROM ' . cerber_get_db_prefix() . CERBER_SCAN_TABLE . ' WHERE scan_id = ' . $scan['id'] );
			}
			break;
        case 4:
			if ( crb_get_settings( 'scan_sess' ) ) {
				$another_dir = session_save_path();
				if ( is_dir( $another_dir ) && $result = cerber_scan_directory( $another_dir, null, '_crb_save_file_names' ) ) {
					//$update['total']['folders'] += $result[0];
				}
				$update['total']['files'] = cerber_db_get_var( 'SELECT COUNT(scan_id) FROM ' . cerber_get_db_prefix() . CERBER_SCAN_TABLE . ' WHERE scan_id = ' . $scan['id'] );
			}
			break;
		case 5:
			$x = 0;
			if ( $result = cerber_db_get_results( 'SELECT * FROM ' . cerber_get_db_prefix() . CERBER_SCAN_TABLE . ' WHERE scan_id = ' . $scan['id'] . ' AND file_hash = ""' ) ) {
				foreach ( $result as $row ) {
					if ( ! cerber_add_file_info( $row ) ) {
						cerber_log_scan_error( 'Unable to update file info. Scanning has been aborted.' );
						$aborted = 1;
						break;
					}
					if ( 0 === ( $x % 100 ) ) {
						if ( cerber_exec_timer() ) {
							$exceed = true;
							break;
						}
					}
					$x ++;
				}
				// Some files might be symlinks
				$update['total']['files']  = cerber_db_get_var( 'SELECT COUNT(scan_id) FROM ' . cerber_get_db_prefix() . CERBER_SCAN_TABLE . ' WHERE scan_id = ' . $scan['id'] );
				$update['total']['parsed'] = cerber_db_get_var( 'SELECT COUNT(scan_id) FROM ' . cerber_get_db_prefix() . CERBER_SCAN_TABLE . ' WHERE scan_id = ' . $scan['id'] . ' AND file_type !=0' );
			}
			else {
				$aborted = 1;
			}
			break;
		case 6:
			if ( cerber_is_check_fs() ) {
				cerber_check_fs_changes();
			}
			break;
		case 7:
			cerber_verify_wp();
			break;
		case 8:
			$remain = cerber_verify_plugins();
			break;
		case 9:
			$remain = cerber_verify_themes();
			break;
		case 10:
			$remain = cerber_process_files();
			break;
		case 11:
			// Finalizing scan
			break;
	}

	if ( ! $remain && ! $exceed && ! $aborted ) {
		$next_step = cerber_next_step( $scan );
	}

	if ( $next_step > 11 ) {
		$update['finished'] = time();
		$update['step_issues'] = array();
	}

	if ( $aborted ) {
		$update['aborted'] = time();
	}

	$update['next_step'] = $next_step;
	$update['scanned']['files'] = cerber_db_get_var( 'SELECT COUNT(scan_id) FROM ' . cerber_get_db_prefix() . CERBER_SCAN_TABLE . ' WHERE scan_id = ' . $scan['id'] . ' AND scan_status > 0' );
	$update['scanned']['bytes'] = cerber_db_get_var( 'SELECT SUM(file_size) FROM ' . cerber_get_db_prefix() . CERBER_SCAN_TABLE . ' WHERE scan_id = ' . $scan['id'] . ' AND scan_status > 0' );

	if ( ! $scan = cerber_get_scan() ) {
		return false;
	}

	$update['issues'] = cerber_merge_issues( $scan['issues'], $scan['step_issues'] );

	cerber_make_numbers( $update, $scan );

	$ret = cerber_update_scan( $update );

	if ( isset( $update['finished'] ) || isset( $update['aborted'] ) ) {
		cerber_scan_completed();
	}

	return $ret;

}

// Calculate the next step according to settings
function cerber_next_step( $scan ) {
	$ret = $scan['next_step'];
	switch ( $scan['next_step'] ) {
		case 1:
			if ( crb_get_settings( 'scan_tmp' ) ) {
				$ret += 1;
			}
			else {
				$ret += ( crb_get_settings( 'scan_sess' ) ) ? 3 : 4;
			}
			break;
		case 3:
			$ret += ( crb_get_settings( 'scan_sess' ) ) ? 1 : 2;
			break;
		case 5:
			$ret += ( cerber_is_check_fs() ) ? 1 : 2;
			break;
		default:
			$ret ++;
	}

	return $ret;
}

function cerber_scan_completed() {
	if ( ! cerber_is_cloud_request() || ! lab_lab() || ! cerber_is_cloud_enabled() ) {
		return;
	}

	if ( ! ( $scan = cerber_get_scan() ) || ! $scan['cloud'] ) {
		return;
	}

	$report = cerber_scan_report( $scan );

	if ( ! $report ) {
		return;
	}

	if ( ! cerber_send_email( 'scan', $report ) ) {
		// Send alert via cloud?
	}

}

/**
 * Initialize data structure for a new Scan
 *
 * @param string $mode  quick|fool
 *
 * @return array|bool
 */
function cerber_init_scan( $mode = 'quick' ) {
	cerber_delete_old_scans();

	if ( ! $mode ) {
		$mode = 'quick';
    }

	$data                    = array();
	$data['mode']            = $mode;     // Quick | Full
	$data['id']              = time();
	$data['started']         = $data['id'];
	$data['finished']        = 0;
	$data['aborted']         = 0;         // If > 0, the scan has been aborted due to unrecoverable errors
	$data['errors']          = array();   // Any software, DB, CURL, I/O and other system errors - for diagnostic/debugging
	$data['scanned']         = array();
	$data['issues']          = array();   // The list of issues
	$data['step_issues']     = array();   // The list of issues during the current step
	$data['total']           = array();    // Counters
	//$data['total']['issues'] = 0;
	$data['integrity']       = array();
	$data['ip']              = cerber_get_remote_ip();
	//$data['cloud']     = lab_is_cloud_request();
	$data['cloud']     = cerber_is_cloud_request();
	//$data['step']      = array();
	$data['next_step'] = 1;

	if ( ! cerber_update_set( 'scan', $data, $data['id'] ) ) {

		return false;
	}

	return $data;
}

/**
 * Return ID for the Scan in progress (the latest scan started)
 *
 * @return bool|integer Scan ID false if no scan in progress (no files to scan)
 */
function cerber_get_scan_id() {

	$scan_id = null;

	if ( $all = cerber_db_get_col( 'SELECT the_id FROM ' . cerber_get_db_prefix() . CERBER_SETS_TABLE . ' WHERE the_key = "scan"' ) ) {
		$scan_id = max( $all ); // There is no index for the_id column, so it should be faster
	}

	if ( ! $scan_id ) {
		$scan_id = false;
	}

	return $scan_id;
}

/**
 * Return Scan data
 *
 * @param integer $scan_id if not specified the last Scan data is returned
 *
 * @return array|bool
 */
function cerber_get_scan( $scan_id = null ) {

    // If no ID is specified look for the latest one
	if ( $scan_id === null && $all = cerber_db_get_col( 'SELECT the_id FROM ' . cerber_get_db_prefix() . CERBER_SETS_TABLE . ' WHERE the_key = "scan"' ) ) {
		$scan_id = max( $all ); // There is no index for the_id column, so it should be faster
	}

	if ( ! $scan_id ) {
		return false;
	}

	$scan = cerber_get_set( 'scan', $scan_id );
	$scan['mode_h'] = ( $scan['mode'] == 'full' ) ? __( 'Full Scan', 'wp-cerber' ) : __( 'Quick Scan', 'wp-cerber' );

	return $scan;

}

/**
 * Update scan data by simply merging values in array
 *
 * @param array $new_data
 *
 * @return bool
 */
function cerber_update_scan( $new_data ) {
	if ( ! $old_data = cerber_get_scan() ) {
		return false;
	}

	if ( isset( $new_data['id'] ) ) {
		unset( $new_data['id'] );
	}
	$data = array_merge( $old_data, $new_data );

	return cerber_update_set( 'scan', $data, $old_data['id'] );
}

/**
 * Update scan data and preserve existing keys in array (scan structure)
 *
 * @param array $new_data
 *
 * @return bool
 */
function cerber_set_scan( $new_data ) {
	if ( ! $scan_data = cerber_get_scan() ) {
		return false;
	}

	$data = cerber_array_merge_recurively( $scan_data, $new_data );

	return cerber_update_scan( $data );
}

/**
 * Delete all outdated scans and their results except the several ones
 *
 */
function cerber_delete_old_scans() {
	if ( ! $scans = cerber_db_get_results( 'SELECT * FROM ' . cerber_get_db_prefix() . CERBER_SETS_TABLE . ' WHERE the_key = "scan" ORDER BY the_id DESC' ) ) {
		return;
	}

	$limit = 2; // How many results we keep in the DB as a history
	$q_list = array();
	$q = 0;
	$f_list = array();
	$f = 0;

	foreach ( $scans as $item ) {
		$scan = unserialize( $item['the_value'] );
		if ( $scan['mode'] == 'quick' && $q < $limit ) {
			$q_list[] = $scan['id'];
			$q ++;
		}
        elseif ( $scan['mode'] == 'full' && $f < $limit ) {
			$f_list[] = $scan['id'];
			$f ++;
		}
		elseif ($q >= $limit && $f >= $limit ){
		    break;
        }
	}

	$keep   = array_merge( $q_list, $f_list );
	//$all    = array_column( $scans, 'the_id' );
	$all    = crb_array_column( $scans, 'the_id' );
	$delete = array_diff( $all, $keep );

	if ( ! $delete ) {
		return;
	}

	foreach ( $delete as $scan_id ) {
		cerber_delete_scan( $scan_id );
	}

}

/**
 * Delete a single scan
 *
 * @return bool
 */
function cerber_delete_scan( $scan_id ) {
	$scan_id = absint( $scan_id );
	if ( $scan_id && cerber_delete_set( 'scan', $scan_id ) ) {
		cerber_db_query( 'DELETE FROM ' . cerber_get_db_prefix() . CERBER_SCAN_TABLE . ' WHERE scan_id = ' . $scan_id );
		//cerber_db_query( 'DELETE FROM ' . cerber_get_db_prefix() . CERBER_SCAN_TABLE );
		cerber_delete_set( 'tmp_verify_plugins', $scan_id );

		return true;
	}

	return false;
}

/**
 * Save issues (for end user reporting) during the scanning
 *
 * @param string $section
 * @param array $issues
 * @param string $container Top level container for the section
 *
 * @return bool
 */
function cerber_push_issues( $section, $issues = array(), $container = '', $sec_details = array() ) {
	if ( empty( $issues ) || empty( $section ) ) {
		return false;
	}

	$sec_details = array_merge( array( 'vul_list' => false ), $sec_details );

	$list = array();

	// Add some details

	$setype = 0;

	foreach ( $issues as $issue ) {

		$data = array();
		$extra_issue = 0;

		if ( isset( $issue['file'] ) ) {

			$file          = $issue['file'];
			$data['bytes'] = $file['file_size'];
			$data['size']  = crb_size_format( $file['file_size'] );
			$ftime         = $file['file_mtime'];
			$data['time']  = cerber_auto_date( $ftime );
			$data['name']  = $file['file_name'];
			$data['type']  = $file['file_type'];

			if ( $file['file_status'] > 0 ) {
				$extra_issue = $file['file_status'];
				if ( $extra_issue == $issue[0] ) {
					$extra_issue = 0;
				}
			}

			// Is file can be deleted safely

			$allowed = 0;
			if ( $file['file_type'] != CERBER_FT_CONF ) {
				if ( ! empty( $file['fd_allowed'] ) ) {
					if ( cerber_can_be_deleted( $file['file_name'] ) ) {
						$allowed = 1;
					}
				}
			}

			$data['fd_allowed'] = $allowed;

		}
        //elseif ( isset( $issue['plugin'] ) ) {
		//	$data['version'] = $issue['plugin']['Version'];
		elseif ( isset( $sec_details['plugin'] ) ) {
			$data['version'] = $sec_details['plugin']['Version'];
	        $setype = 3;
		}
        elseif ( isset( $issue['theme'] ) ) {
			$data['version'] = $issue['theme']->get('Version');
	        $setype = 2;
		}
        elseif ( isset( $issue['wordpress'] ) ) {
	        $data['version'] = $issue['wordpress'];
	        $setype = 1;
        }

		$issue_type = $issue[0];
		$details = ( isset( $issue[2] ) ) ? $issue[2] : '';
		$short_name = ( isset( $issue[1] ) ) ? $issue[1] : '';

		$list[] = array(
			$issue_type, // Type of issue
			$short_name, // Object name
			cerber_calculate_risk( $issue ),
			$extra_issue,
			'data'    => $data,
			'details' => $details,
		);
	}

	// Some stuff for better end-user report displaying

	if ( $section == 'WordPress' ) {
		$container = 'crb-wordpress';
	}
	if ( $section == 'Uploads folder' ) {
		$setype = 20;
	}
	if ( $section == 'Unattended files' ) {
		$container = 'crb-unattended';
		$setype = 21;
	}

	// TODO: $container Should be refactored

	if ( ! $container ) {
		//$container = sha1( $section );
		if ( isset( $issues[0]['file'] ) ) {
			switch ( $issues[0]['file']['file_type'] ) {
				case CERBER_FT_WP:
				case CERBER_FT_CONF:
					$container = 'crb-wordpress';
					break;
				case CERBER_FT_PLUGIN:
					$container = 'crb-plugins';
					break;
				case CERBER_FT_THEME:
					$container = 'crb-themes';
					break;
				case CERBER_FT_UPLOAD:
					$container = 'crb-uploads';
					break;
                case CERBER_FT_MUP:
	                $container = 'crb-muplugins';
	                break;
				case CERBER_FT_DRIN:
					$container = 'crb-dropins';
					break;
				default:
					$container = 'crb-unattended';
			}
		}
		else {
			if ( $section == 'WordPress' ) {
				$container = 'crb-wordpress';
			}
		}
	}

	if ( ! $container ) {
		$container = 'crb-unattended';
		$setype    = 21;
	}


	// Save all

    // TODO: save section issues as a separate row with cerber_update_set()

	$id = sha1( $section );

	$scan = cerber_get_scan();

	$scan['step_issues'] = cerber_merge_issues( $scan['step_issues'], array(
		$id =>
			array(
				'name'        => $section,
				'container'   => $container,
				'sec_details' => $sec_details,
				'setype'      => $setype,
				'issues'      => $list,
			)
	) );

	$ret = cerber_update_scan( $scan );

	if ( ! $ret ) {
		cerber_log_scan_error( 'Unable to save the list of issues!' );
	}

	return $ret;
}

/**
 * Merge two lists of issues in a correct way
 *
 * @param $issues1
 * @param $issues2
 *
 * @return array
 */
function cerber_merge_issues( $issues1, $issues2 ) {
	if ( ! $issues1 ) {
		$issues1 = array();
	}
	foreach ( $issues2 as $id => $item ) {
		if ( ! isset( $issues1[ $id ] ) ) {
			//$issues1[ $id ] = array( 'name' => $item['name'], 'issues' => $item['issues'] );
			$issues1[ $id ] = $item;
		}
		else {
			$issues1[ $id ]['issues'] = array_merge( $issues1[ $id ]['issues'], $item['issues'] );
		}
	}

	return $issues1;
}

/**
 * Indicator for end-user
 *
 * @param $issue
 *
 * @return int|mixed
 */
function cerber_calculate_risk( $issue ) {
	$risk = array(
		CERBER_FOK  => 0,
		CERBER_VULN => 3,
		10          => 1,
		11          => 2,
		5           => 3,
		6           => 3,
		7           => 3,
		8           => 3
	);

	if ( isset( $risk[ $issue[0] ] ) ) {
		return $risk[ $issue[0] ];
	}

	$file = $issue['file'];

	// Small junk files?
	$size_factor = null;
	if ( isset( $file['file_size'] ) ) {
		if ( $file['file_size'] < 10 ) {
			$size_factor = 1;
		}
		elseif ( $file['file_size'] < 30 ) {
			$size_factor = 2;
		}
	}

	// TODO: convert into a formula with metrics
	switch ( $issue[0] ) {
		case 14:
			if ( $size_factor ) {
				return $size_factor;
			}
			return 2;
			break;
		case CERBER_EXC:
			if ( $size_factor ) {
				return $size_factor;
			}
			if ( $file['file_type'] == CERBER_FT_UPLOAD ) {
				return 3;
			}
			return 2;
			break;
		case CERBER_IMD:
		case CERBER_USF:
		case CERBER_SCF:
		case CERBER_PMC:
		case CERBER_DIR:
			if ( $size_factor ) {
				return $size_factor;
			}

			if ( ! cerber_detect_exec_extension( $file['file_name'], array( 'js', 'inc' ) ) ) {
				return 2;
			}

			return 3;
			break;
	}

	return 1;
}

function cerber_get_risk_label() {
	return array(
		'',
		'Low',
		'Medium',
		'High',
	);
}

function cerber_get_issue_label( $id = null ) {
	$issues = array(
		0 => 'To be scanned',
		CERBER_FOK => __( 'Verified', 'wp-cerber' ),

		// 2-3 are prohibited! See: 'scan_reinc' - overlap with risk levels

		// >3 is a real issue

        CERBER_VULN   => __( 'Vulnerability found', 'wp-cerber' ),
		CERBER_NOHASH => __( 'Integrity data not found', 'wp-cerber' ),
		6 => __( 'Unable to check the integrity of the plugin due to a network error', 'wp-cerber' ),
		7 => __( 'Unable to check the integrity of WordPress files due to a network error', 'wp-cerber' ),
		8 => __( 'Unable to check the integrity of the theme due to a network error', 'wp-cerber' ),
		9 => __( 'Unable to check the integrity due to a DB error', 'wp-cerber' ),

		10 => __( "Local file doesn't exist", 'wp-cerber' ),
		11 => 'No local hash found',
		13 => __( 'Unable to process file', 'wp-cerber' ),
		14 => __( 'Unable to open file', 'wp-cerber' ),

		CERBER_IMD => __( 'Checksum mismatch', 'wp-cerber' ), // Integrity

		// 16-25 PHP related -------------------------
		CERBER_SCF => __( 'Suspicious code found', 'wp-cerber' ),
		CERBER_PMC => __( 'Potentially malicious code found', 'wp-cerber' ),
		CERBER_USF => __( 'Unattended suspicious file', 'wp-cerber' ),
		CERBER_EXC => __( 'Executable code found', 'wp-cerber' ),

		// Other -------------------------------------
		CERBER_DIR => __( 'Suspicious directives found', 'wp-cerber' ),
		CERBER_UXT => __( 'Unwanted file extension', 'wp-cerber' ),

		50 => __( 'Content has been modified', 'wp-cerber' ), // Previous scan
		51 => __( 'New file', 'wp-cerber' ),

	);

	if ( $id !== null ) {
		if ( is_array( $id ) ) {

			return array_intersect_key( $issues, array_flip( $id ) );
		}

		return $issues[ $id ];
	}

	return $issues;
}


function cerber_get_qs( $v = null ) {
	$q = array(
		0 => __( 'Disabled', 'wp-cerber' ),
		1 => __( 'Every hour', 'wp-cerber' ),
		3 => __( 'Every 3 hours', 'wp-cerber' ),
		6 => __( 'Every 6 hours', 'wp-cerber' ),
	);
	if ( $v ) {
		return $q[ $v ];
	}

	return $q;
}

/**
 * Log system errors for the current scan
 *
 * @param string $msg
 *
 * @return bool
 */
function cerber_log_scan_error( $msg = '' ) {

	$scan = cerber_get_scan();
	$scan['errors'][] = $msg;

	return cerber_update_scan( array( 'errors' => $scan['errors'] ) );

}

/**
 * Check the integrity of installed plugins
 *
 * @return int The number of plugins to process
 */
function cerber_verify_plugins() {
	if ( ! $scan_id = cerber_get_scan_id() ) {
		return 0;
	}

	$key = 'tmp_verify_plugins';
    $done = cerber_get_set( $key, $scan_id );

	$plugins = get_plugins();

	if ( $done ) {
		$to_scan = array_diff( array_keys( $plugins ), array_keys( $done ) );
	}
	else {
		$done    = array();
		$to_scan = array_keys( $plugins );
	}

	if ( empty( $to_scan ) ) {
		return 0;
	}

	$plugins_dir = cerber_get_plugins_dir() . DIRECTORY_SEPARATOR;
	$file_count  = 0;
	$bytes = 0;

	$max_files = 100;

	while ( ! empty( $to_scan ) ) {
		$plugin = array_shift( $to_scan );
		$issues = array();

		if ( false === strpos( $plugin, '/' ) ) {
			// A single-file plugin with no plugin folder (no hash on wordpress.org)
			$done[ $plugin ] = 1;

			if ( $plugin == 'hello.php' ) { // It's checked with WP hash
				continue;
			}

			$plugin_folder = $plugin;
		}
		else {
			$plugin_folder = dirname( $plugin );
		}

		$plugin_hash = cerber_get_plugin_hash( $plugin_folder, $plugins[ $plugin ]['Version'] );

		if ( $plugin_hash && ! is_wp_error( $plugin_hash ) ) {
			foreach ( $plugin_hash->files as $file => $hash ) {

				if ( ! cerber_is_file_type_scan( $file ) ) {
					continue;
				}

				$file_name = $plugins_dir . $plugin_folder . DIRECTORY_SEPARATOR . cerber_normal_path( $file );
				$file_name_hash = sha1( $file_name );
				$where          = 'scan_id = ' . $scan_id . ' AND file_name_hash = "' . $file_name_hash . '"';
				$local_file     = cerber_db_get_row( 'SELECT * FROM ' . cerber_get_db_prefix() . CERBER_SCAN_TABLE . ' WHERE ' . $where );

				if ( ! $local_file ) {
					$issues[] = array( 10, DIRECTORY_SEPARATOR . $plugin_folder . DIRECTORY_SEPARATOR . $file );
					continue;
				}

				$short_name = cerber_get_short_name( $local_file );

				if ( empty( $local_file['file_hash'] ) ) {
					$issues[] = array( 11, $short_name, 'file' => $local_file );
					continue;
				}
				$hash_match = 0;
				if ( isset( $hash->sha256 ) ) {
					$repo_hash = $hash->sha256;
					if ( is_array( $repo_hash ) ) {
						$file_hash_repo = 'REPO provides multiple values, none match';
						foreach ( $repo_hash as $item ) {
							if ( $local_file['file_hash'] == $item ) {
								$hash_match     = 1;
								$file_hash_repo = $item;
								break;
							}
						}
					}
					else {
						$file_hash_repo = $repo_hash;
						if ( $local_file['file_hash'] == $repo_hash ) {
							$hash_match = 1;
						}
					}
				}
				else {
					$file_hash_repo = 'SHA256 hash not found';
				}

				$status = ( $hash_match ) ? CERBER_FOK : CERBER_IMD;

				if ( $status > CERBER_FOK ) {
					$issues[] = array( $status, $short_name, 'file' => $local_file );
				}

				cerber_db_query( 'UPDATE ' . cerber_get_db_prefix() . CERBER_SCAN_TABLE . ' SET file_hash_repo = "' . $file_hash_repo . '", hash_match = ' . $hash_match . ', scan_status = ' . $status . ' WHERE ' . $where );

				$file_count ++;
				$bytes += absint( $local_file['file_size'] );

			}

			$verified = 1;
		}
		else {
			$verified = cerber_verify_plugin( $plugin_folder, $plugins[ $plugin ] );
		}

		if ( ! $verified ) {
			$verified = 0;
			$status = CERBER_NOHASH;
		}
        else {
	        $verified = 1;
			$status = CERBER_FOK;
		}

		//$issues[] = array( $status, '', 'plugin' => $plugins[ $plugin ] );
		$issues[] = array( $status );

		$vuln = cerber_check_vulnerabilities( $plugin_folder, $plugins[ $plugin ] );

		if ( $vuln ) {
			foreach ( $vuln as $v ) {
				$issues[] = array( CERBER_VULN, $v['n'].'. '.$v['f'] );
			}
		}

		$sec_details = array(
			$status,
			'plugin' => array( 'slug' => $plugin, 'Version' => $plugins[ $plugin ]['Version'] ),
			'vul_list' => $vuln
		);

		cerber_push_issues( $plugins[ $plugin ]['Name'], $issues, 'crb-plugins', $sec_details );

		cerber_set_scan( array( 'integrity' => array( 'plugins' => array( $plugin => $verified ) ) ) );

		$done[ $plugin ] = 1;

		if ( $file_count > $max_files || cerber_exec_timer() ) {
			break;
		}

	}

	cerber_update_set( $key, $done, $scan_id );

	return count( $to_scan );
}

/**
 * Checking the integrity of a plugin if there is no hash on wordpress.org
 *
 * @param string $plugin_folder Just folder, no full path, no slashes
 * @param array $plugin_data
 *
 * @return bool If true the plugin was verified by using an alternative source of hash
 */
function cerber_verify_plugin( $plugin_folder, $plugin_data ) {
	$ret  = false;
	$hash = null;

	// Is there local hash?

	$hash = cerber_get_local_hash( CRB_HASH_PLUGIN . sha1( $plugin_data['Name'] . $plugin_folder ), $plugin_data['Version'] );

	// Possibly remote hash?

	if ( ! $hash ) {

		$hash_url = null;

		if ( in_array( $plugin_folder, array( 'wp-cerber', 'wp-cerber-buddypress' ) ) ) {
			$hash_url = 'https://my.wpcerber.com/downloads/checksums/' . $plugin_folder . '/' . $plugin_data['Version'] . '.json';
		}

		if ( $hash_url ) {
			$response = cerber_obtain_hash( $hash_url );
			if ( ! $response['error'] ) {
				$hash = get_object_vars( $response['server_data'] );
			}
			else {
				if ( ! empty( $response['curl_error'] ) ) {
					$msg = 'CURL ' . $response['curl_error'];
				}
                elseif ( ! empty( $response['json_error'] ) ) {
					$msg = 'JSON ' . $response['json_error'];
				}
				else {
					$msg = 'Unknown network error';
				}
				//$ret = new WP_Error( 'net_issue', $msg );
				cerber_log_scan_error( $msg );
			}

		}
	}

	if ( $hash ) {
		//$local_prefix = cerber_get_plugins_dir() . DIRECTORY_SEPARATOR . $plugin_folder . DIRECTORY_SEPARATOR;
		$local_prefix = cerber_get_plugins_dir() . DIRECTORY_SEPARATOR;
		if ( ! strpos( $plugin_folder, '.' ) ) { // Not a single file plugin
			$local_prefix .= $plugin_folder . DIRECTORY_SEPARATOR;
		}
		list( $issues, $errors ) = cerber_verify_files( $hash, 'file_hash', $local_prefix );
		cerber_push_issues( $plugin_data['Name'], $issues, 'crb-plugins' );
		if ( ! $errors ) {
			$ret = true;
		}
	}

	return $ret;
}

/**
 * Verifying the integrity of the WordPress
 *
 * @return int
 */
function cerber_verify_wp() {
	$wp_version = cerber_get_wp_version();

	$data = null;
	$ret      = 0;
	$verified = 0;
	$wp_hash  = cerber_get_wp_hash();

	if ( ! is_wp_error( $wp_hash ) && ! empty( $wp_hash->checksums ) ) {
		$data = get_object_vars( $wp_hash->checksums );
	}

	if ( $data ) {
		// In case the default name 'plugins' of the plugins folder has been changed
		$wp_plugins_dir = basename( cerber_get_plugins_dir() );
		if ( $wp_plugins_dir != 'plugins' ) {
			$new_data = array();
			foreach ( $data as $key => $item ) {
				if ( 0 === strpos( $key, 'wp-content/plugins/' ) ) {
					$new_data[ 'wp-content/' . $wp_plugins_dir . '/' . substr( $key, 19 ) ] = $item;
				}
				else {
					$new_data[ $key ] = $item;
				}
			}
			$data = $new_data;
		}

		// In case the default name 'wp-content' of the CONTENT folder has been changed

		$wp_content_dir = basename( cerber_get_content_dir() );
		if ( $wp_content_dir != 'wp-content' ) {
			$new_data = array();
			foreach ( $data as $key => $item ) {
				if ( 0 === strpos( $key, 'wp-content/' ) ) {
					$new_data[ $wp_content_dir . '/' . substr( $key, 11 ) ] = $item;
				}
				else {
					$new_data[ $key ] = $item;
				}
			}
			$data = $new_data;
		}

		list( $issues, $errors ) = cerber_verify_files( $data, 'file_md5', ABSPATH, array(CERBER_FT_PLUGIN, CERBER_FT_THEME), CERBER_FT_WP, '_crb_not_existing' );
		if ( ! $errors ) {
			$verified = 1;
			$status   = CERBER_FOK;
		}
		else {
			$status = 9;
		}
		cerber_push_issues( 'WordPress', array( array( $status, 'wordpress' => $wp_version ) ) );
		cerber_push_issues( 'WordPress', $issues );
	}
	else {
		cerber_push_issues( 'WordPress', array( array( 7, 'wordpress' => $wp_version ) ) );
	}

	cerber_set_scan( array( 'integrity' => array( 'wordpress' => $verified ) ) );

	return $ret;
}

// Themes and plugin will be checked separately, not as a part of WP
function _crb_not_existing( $file_name ) {
	static $themes_prefix, $plugins_prefix;

	if ( $themes_prefix == null ) {
		$themes_prefix = basename( cerber_get_content_dir() ) . DIRECTORY_SEPARATOR . 'themes' . DIRECTORY_SEPARATOR;
	}
	if ( 0 === strpos( $file_name, $themes_prefix ) ) {
		return false;
	}

	if ( $plugins_prefix == null ) {
		$plugins_prefix = basename( cerber_get_content_dir() ) . DIRECTORY_SEPARATOR . basename( cerber_get_plugins_dir() ) . DIRECTORY_SEPARATOR;
	}
	if ( 0 === strpos( $file_name, $plugins_prefix ) ) {
		return false;
	}

	return true;
}

/**
 * Verifying the integrity of the themes
 *
 * @return int
 */
function cerber_verify_themes() {

	$themes = wp_get_themes();

	foreach ( $themes as $theme_folder => $theme ) {
		$issues = array();
		$hash = cerber_get_theme_hash( $theme_folder, $theme );
		$verified = 0;

		if ( $hash && ! is_wp_error( $hash ) ) {
			$local_prefix = cerber_get_themes_dir() . DIRECTORY_SEPARATOR . $theme_folder . DIRECTORY_SEPARATOR;
			list( $issues, $errors ) = cerber_verify_files( $hash, 'file_hash', $local_prefix, null, CERBER_FT_THEME );
			if ( ! $errors ) {
				$verified = 1;
				$status   = CERBER_FOK;
			}
			else {
				$status = 9;
			}
		}
		else {
			if ( is_wp_error( $hash ) ) {
				cerber_log_scan_error( $hash->get_error_message() );
			}
			$status = CERBER_NOHASH;
		}

		$issues[] = array( $status, $theme_folder, 'theme' => $theme );

		cerber_set_scan( array( 'integrity' => array( 'themes' => array( $theme_folder => $verified ) ) ) );

		if ( $issues ) {
			cerber_push_issues( $theme->get( 'Name' ), $issues, 'crb-themes' );
		}
	}

	//$scan_id = cerber_get_scan_id();
	//cerber_db_query( 'UPDATE ' . CERBER_SCAN_TABLE . ' SET scan_status = 5 WHERE scan_id = ' . $scan_id . ' AND file_type = ' . CERBER_FT_THEME );

	return 0;
}

/**
 * Inspecting unattended files (remain after integrity checking) for traces of malware and other issue
 *
 * @return int
 */
function cerber_process_files(){

	if ( ! $scan = cerber_get_scan() ) {
		return 0;
	}

	$not_in = CERBER_FOK . ',14,' . CERBER_IMD;

	if ( !$files = cerber_db_get_results( 'SELECT * FROM ' . cerber_get_db_prefix() . CERBER_SCAN_TABLE .
                                         ' WHERE scan_id = ' . $scan['id'] . ' AND scan_status NOT IN ('.$not_in.')' ) ) {
		return 0;
	}

	// Plugins data -------------------

	$plugins = array();
	foreach ( get_plugins() as $key => $item ) {
		if ( $pos = strpos( $key, DIRECTORY_SEPARATOR ) ) {
			$new_key = substr( $key, 0, strpos( $key, DIRECTORY_SEPARATOR ) );
		}
		else {
			$new_key = $key;
		}

		$plugins[ $new_key ] = $item;
		if ( ! empty( $scan['integrity']['plugins'][ $key ] ) ) {
			$plugins[ $new_key ]['integrity'] = true;
		}
	}

	// ---------------------------------------------------------------------------

	// Themes data -------------------

    $themes = wp_get_themes();

	// ---------------------------------------------------------------------------

	$can_be_deleted = array( CERBER_FT_UPLOAD, CERBER_FT_CNT, CERBER_FT_OTHER, CERBER_FT_LNG );

	$issues = array();
	$remain = 0;

	// Prevent hanging
	if ( $f = cerber_get_set( CRB_LAST_FILE, 0, false ) ) {
		//cerber_db_query( 'UPDATE ' . cerber_get_db_prefix() . CERBER_SCAN_TABLE . ' SET scan_status = 13 WHERE scan_id = ' . $scan['id'] . ' AND file_name_hash = "' . sha1( $f ) . '"' );
		cerber_update_file_status( sha1( $f ), 13, $scan['id'] );
		cerber_update_set( CRB_LAST_FILE, '', 0, false );
		$m = cerber_get_issue_label( 13 ) . ' ' . $f . ' size: ' . @filesize( $f ) . ' bytes';
		cerber_log_scan_error( $m );
	}

	if ( $unwanted = crb_get_settings( 'scan_uext' ) ) {
		$unwanted = array_map( function ( $ext ) {
			return strtolower( trim( $ext, '. *' ) );
		}, $unwanted );
	}

	$x = 0;

	foreach ( $files as $file ) {

		/*if ( cerber_is_htaccess( $file['file_name'] ) ) { // || $file['file_size'] == 0
			//cerber_db_query( 'UPDATE ' . cerber_get_db_prefix() . CERBER_SCAN_TABLE . ' SET scan_status = 1 WHERE scan_id = ' . $scan['id'] . ' AND file_name_hash = "' . $file['file_name_hash'] . '"' );
			cerber_update_file_status( $file['file_name_hash'], 1, $scan['id'] );
			continue;
		}*/

		$integrity_verified = false;
		$severity_limit     = 6;
		$status             = CERBER_USF;
		$section            = '';
		$do_not_del         = false;

		switch ( $file['file_type'] ) {
			case CERBER_FT_WP:
				$section    = 'WordPress';
				$do_not_del = true;
				if ( ! empty( $scan['integrity']['wordpress'] ) ) {
					$integrity_verified = true;
				}
				break;
			case CERBER_FT_PLUGIN:
				$f = cerber_get_file_folder( $file['file_name'], cerber_get_plugins_dir() );
				if ( isset( $plugins[ $f ] ) ) {
					$section    = $plugins[ $f ]['Name'];
					$do_not_del = true;
					if ( ! empty( $plugins[ $f ]['integrity'] ) ) {
						$integrity_verified = true;
					}
				}
				else {
					$severity_limit = 1;
				}
				break;
			case CERBER_FT_THEME:
				$f = cerber_get_file_folder( $file['file_name'], cerber_get_themes_dir() );
				if ( isset( $themes[ $f ] ) ) {
					$section    = $themes[ $f ]->get( 'Name' ); // WP_Theme object
					$do_not_del = true;
					if ( ! empty( $scan['integrity']['themes'][ $f ] ) ) {
						$integrity_verified = true;
					}
					$severity_limit = 5;
				}
				else {
					$severity_limit = 1;
				}
				//$status = 1;
				break;
			case CERBER_FT_ROOT:
				if ( cerber_is_htaccess( $file['file_name'] ) ) {
					$section = 'WordPress';
					$status = CERBER_FOK;
				}
				if ( ! empty( $scan['integrity']['wordpress'] ) ) {
					//$integrity_verified = true;
					$do_not_del = false;
				}
				else {
					$do_not_del = true;
				}
				$severity_limit = 1;
				break;
			case CERBER_FT_CONF:
				$section        = 'WordPress';
				$do_not_del     = true;
				$severity_limit = 2;
				break;
			case CERBER_FT_UPLOAD:
				$section        = 'Uploads folder';
				$severity_limit = 1;
				break;
			case CERBER_FT_MUP:
				$section    = 'Must-use plugins';
				$do_not_del = true;
				break;
			case CERBER_FT_OTHER:
				$severity_limit = 1;
				break;
			case CERBER_FT_DRIN:
				$section = 'Drop-ins';
				break;
			default:
				$severity_limit = 2;
				break;

		}

		// Now we're ready to perform inspection

		$result = array();

		if ( ! $integrity_verified ) {

			$result = cerber_inspect_file( $file['file_name'] );

			// TODO: refactor this!
			if ( ! is_wp_error( $result ) ) {
				$status = CERBER_FOK;
				if ( $result['severity'] == CERBER_MALWR_DETECTED ) {
					$status = CERBER_PMC;
				}
				/*
				elseif ( $result['severity'] == $severity_limit ) {
					$status = CERBER_USF;
				}*/
                elseif ( $result['severity'] >= $severity_limit ) {
					if ( $result['severity'] == 1 ) {
						$status = CERBER_EXC;
					}
					else {
						if ( cerber_is_htaccess( $file['file_name'] ) ) {
							$status = CERBER_DIR;
						}
						else {
							$status = CERBER_SCF;
						}
					}
				}
			}
			else {
				$status = 14;
			}

		}

		// An exception for wp-config.php
		if ( $status == CERBER_USF && $file['file_type'] == CERBER_FT_CONF ) {
			$status = CERBER_FOK;
		}

		// Unwanted extensions
		if ( $status == CERBER_FOK && $unwanted ) {
			$f = strtolower( basename( $file['file_name'] ) );
			$e = explode( '.', $f );
			array_shift( $e );
			if ( $e && array_intersect( $unwanted, $e ) ) {
				$status = CERBER_UXT;
			}
		}

		if ( $status == CERBER_FOK && $file['file_status'] > 0 ) {
			$status = $file['file_status'];
		}

		// There is an issue with this file
		if ( $status > CERBER_FOK ) {

			if ( ! $section ) {
				$section = 'Unattended files';

				$len = 0;
				if ( 0 === strpos( $file['file_name'], rtrim( cerber_get_abspath(), '/\\' ) ) ) {
					$len = mb_strlen( cerber_get_abspath() ) - 1;
				}
				if ( $len ) {
					$short_name = mb_substr( $file['file_name'], $len );
				}
				else {
					$short_name = $file['file_name'];
				}
			}
			else {
				$short_name = cerber_get_short_name( $file );
			}

			// Is file can be deleted?

			if ( $status >= CERBER_SCF ) {
				if ( $integrity_verified ) {
					$file['fd_allowed'] = 1;
				}
                elseif ( ! $do_not_del || in_array( $file['file_type'], $can_be_deleted ) ) {
					$file['fd_allowed'] = 1;
				}
			}

			$issues[ $section ][] = array( $status, $short_name, $result, 'file' => $file );
		}

		//cerber_db_query( 'UPDATE ' . cerber_get_db_prefix() . CERBER_SCAN_TABLE . ' SET scan_status = ' . $status . ' WHERE scan_id = ' . $scan['id'] . ' AND file_name_hash = "' . $file['file_name_hash'] . '"' );
		cerber_update_file_status( $file['file_name_hash'], $status , $scan['id'] );

		if ( 0 === ( $x % 100 ) ) {
			if ( cerber_exec_timer() ) {
				$remain = 1;
				break;
			}
		}
		$x ++;
	}


	if ( $issues ) {
		foreach ( $issues as $section => $list ) {
			cerber_push_issues( $section, $list );
		}
	}

	return $remain;
}

/**
 * Scan a file for suspicious and malicious code
 *
 * @param string $file_name
 *
 * @return array|bool|WP_Error
 */
function cerber_inspect_file( $file_name = '' ) {
	global $cerber_scan_mode, $wp_cerber;

	if ( !@is_file( $file_name ) ) {
		return false;
	}

	if ( cerber_is_htaccess( $file_name ) ) {
		return cerber_inspect_htaccess( $file_name );
	}

	if ( ! cerber_check_extension( $file_name, array( 'php', 'inc', 'phtm', 'phtml', 'phps', 'php2', 'php3', 'php4', 'php5', 'php6', 'php7' ) ) ) {
		$php = false;

		if ( $cerber_scan_mode == 'full' ) {
			// Try to find an PHP open tag in the content
			if ( $f = @fopen( $file_name, 'r' ) ) {
				$str = fread( $f, 10000 );
				if ( false !== strrpos( $str, '<?php' ) ) {
					$php = true;
				}
				fclose( $f );
			}
			else {
				cerber_log_scan_error( cerber_scan_msg( 0, $file_name ) );
            }
		}

		if ( ! $php ) {
			return array( 'severity' => 0 );
		}
	}

	cerber_update_set( CRB_LAST_FILE, $file_name, 0, false );
	$result = cerber_inspect_php( $file_name );
	cerber_update_set( CRB_LAST_FILE, '', 0, false );

	if ( is_wp_error( $result ) ) {
		cerber_log_scan_error( $result->get_error_message() );
		return $result;
	}



	return $result;
}

/**
 * Scan a file for suspicious and malicious PHP code
 *
 * @param string $file_name
 *
 * @return array|bool|WP_Error
 */
function cerber_inspect_php( $file_name = '' ) {
    static $patterns;

	if ( false === ( $content = @file_get_contents( $file_name ) ) ) {
		return new WP_Error( 'cerber-file', cerber_scan_msg( 0, $file_name ) );
	}

	$important = array( T_STRING, T_EVAL );

	$tokens = token_get_all( $content );
	unset( $content );
	if ( ! $tokens ) {
		return array( 'severity' => 0 ); // weird
	}

	$code_found = 0; // Any PHP code in the file = 1
	$severity = array();
	$xdata = array();
	$pos  = array();
	$open = null;
	$list = cerber_get_php_unsafe();

	foreach ( $tokens as $token ) {
		if ( ! is_array( $token ) ) {
			continue;
		}
		if ( in_array( $token[0], $important ) ) {
			$code_found = 1;
			if ( isset( $list[ $token[1] ] ) ) {
				$xdata[]    = array( 1, $token[1], $token[2], $token[0] );
				$severity[] = $list[ $token[1] ][0];
			}
		}
		if ( $token[0] == T_CONSTANT_ENCAPSED_STRING ) {
			if ( cerber_check_string( $token[1] ) ) {
				$xdata[]    = array( 1, 'base64_encoded_string', $token[2], $token[0] );
				$severity[] = 10;
			}
		}
		if ( $token[0] == T_OPEN_TAG ) {
			$open = $token[2] - 1;
		}
		if ( $open && ( $token[0] == T_CLOSE_TAG ) ) {
			$pos[] = array( $open, $token[2] - 1 );
			$open  = null;
		}
	}
	if ( $open !== null ) { // No closing tag till the end of the file
		$pos[] = array( $open, null );
	}

	if ( empty( $pos ) ) {
		return false;
	}
	if ( ! $lines = @file( $file_name ) ) {
		return new WP_Error( 'cerber-file', cerber_scan_msg( 0, $file_name ) );
	}

	$code  = array();
	$last  = count( $pos ) - 1;

	foreach ( $pos as $k => $p ) {
		if ( $last == $k ) {
			$length = null;
		}
		else {
			$length = $p[1] - $p[0] + 1;
		}
		$code = $code + array_slice( $lines, $p[0], $length, true );
	}

	//unset( $lines );
	$code = implode( "\n", $code );
	$code = cerber_remove_comments( $code );
	$code = preg_replace( "/[\r\n\s]+/", '', $code );

	if ( ! $code ) {
		return false;
	}

	// Check for malicious code patterns

	if ( ! $patterns ) {
		$patterns = cerber_get_php_patterns();
	}

	foreach ( $patterns as $pa ) {
	    if ($pa[1] == 2) { // 2 = REGEX
		    $matches = array();
		    if ( preg_match_all( '/' . $pa[2] . '/i', $code, $matches, PREG_OFFSET_CAPTURE ) ) {

		        if ( ! empty( $pa['not_func'] ) && function_exists( $pa['not_func'] ) ) {
				    foreach ( $matches[0] as $key => $match ) {
					    if ( call_user_func( $pa['not_func'], $match[0] ) ) {
						    unset( $matches[0][ $key ] );
					    }
				    }
			    }

			    if ( ! empty( $pa['func'] ) && function_exists( $pa['func'] ) ) {
				    foreach ( $matches[0] as $key => $match ) {
					    if ( ! call_user_func( $pa['func'], $match[0] ) ) {
						    unset( $matches[0][ $key ] );
					    }
				    }
			    }

			    if ( ! empty( $matches[0] ) ) {
				    $xdata[]    = array( 2, $pa[0], array_values( $matches[0] ) );
				    $severity[] = $pa[3];
			    }
		    }
	    }
	    else {
		    if ( false !== stripos( $code, $pa[2] ) ) {
			    $xdata[]    = array( 2, $pa[0], array( array( $pa[2] ) ) );
			    $severity[] = $pa[3];
		    }
	    }
	}

	// Try to find line numbers for matches
	if ( $xdata ) {
		foreach ( $xdata as $x => $d ) {
			if ( $d[0] != 2 || ! isset( $d[2] ) ) {
				continue;
			}
			foreach ( $d[2] as $y => $m ) {
				foreach ( $lines as $i => $line ) {
					if ( false !== strrpos( $line, $m[0] ) ) {
						$xdata[ $x ][2][ $y ][2] = $i + 1;
						break;
					}
				}
				if ( ! isset( $xdata[ $x ][2][ $y ][2] ) ) {
					$xdata[ $x ][2][ $y ][2] = '?';
				}
			}
		}
	}

	unset( $lines );

	// An attempt to interpret the results

	$max = 0;

	if ( $severity ) {
		$malwr_found        = false;
		$malwr_combinations = array( array( 10, 7 ), array( 9, 7 ) );
		foreach ( $malwr_combinations as $malwr ) {
			if ( $int = array_intersect( $malwr, $severity ) ) {
				if ( count( $malwr ) == count( $int ) ) {
					$malwr_found = true;
				}
			}
		}

		$max = ( $malwr_found ) ? CERBER_MALWR_DETECTED : max( $severity );
	}

	if ( $code_found && ! $max ) {
		$max = $code_found;
	}

	return array( 'severity' => $max, 'xdata' => $xdata );

}

function cerber_check_string( $str ) {

	$str = trim( $str, '\'"' );

	if ( strlen( $str ) < 8 ) {
		return false;
	}

	if ( preg_match( '/[\-_\!\?\;\*]/', $str ) ) {
		return false;
	}

	$all          = str_split( $str );
	$chars        = array_count_values( $all );
	$total        = count( $all );
	$distribution = array();
	foreach ( $chars as $char => $entrances ) {
		$distribution[ $char ] = $entrances / $total * 1000;
	}

	$dev = cerber_stand_deviation( $distribution );

	if ( $dev >= 9 && $dev <= 12 ) { // Typical Base64 encoded string
		return true;
	}

	return false;
}

/**
 * Calculate Standard Deviation of a given array
 *
 * @param array $arr
 *
 * @return float
 */
function cerber_stand_deviation( $arr ) {
	$count = count( $arr );
	$variance = 0.0;
	$average = array_sum( $arr ) / $count;

	foreach ( $arr as $value ) {
		$variance += pow( ( $value - $average ), 2 );
	}

	return (float) sqrt( $variance / $count );
}

/**
 * Unsafe code tokens
 *
 * @return array
 */
function cerber_get_php_unsafe(){
	return array(
		'base64_encoded_string' => array( 10, 'Base64 encoded string found.' ),

		'system' => array( 10, 'May be used to get/change vital system information or to run arbitrary server software.' ),
		'shell_exec' => array(10, 'Executes arbitrary command via shell and returns the complete output as a string.'),
		'exec' => array(10, 'Executes arbitrary programs on the web server.'),
		'assert' => array(10, 'Allows arbitrary code execution.'),
		'passthru' => array(10,'Executes arbitrary programs on the web server and displays raw output.'),
		'pcntl_exec' => array(10, 'Executes arbitrary programs on the web server in the current process space.'),
		'proc_open' => array(10, 'Executes an arbitrary command on the web server and open file pointers for input/output.'),
		'popen' => array(10, 'Opens a process (execute an arbitrary command) file pointer on the web server.'),
		'dl' => array(10, 'Loads a PHP extension on the web server at runtime.'),
		'eval' => array( 9, 'May be used to execute malicious code on the web server. Pairing with base64_decode function indicates malicious code.' ),
		'str_rot13' => array(9, 'Perform the rot13 transform on a string. May be used to obfuscate malware.'),
		'mysql_connect' => array(9, 'Open a new connection to the MySQL server'),
		'mysqli_connect' => array(9, 'Open a new connection to the MySQL server'),
		'mysql_query' => array(9, 'Performs a query on the database'),
		'mysqli_query' => array(9, 'Performs a query on the database'),

        'base64_decode' => array(7, 'May be used to obfuscate and hinder detection of malicious code. Pairing with eval function indicates malicious code.'),
		'socket_create' => array(6, 'Creates a network connection with any remote host. May be used to load malicious code from any web server with no restrictions.'),
		'create_function' => array(6, 'Create an anonymous (lambda-style) function. Deprecated. A native anonymous function must be used instead.'),

		'hexdec' => array(5, 'Hexadecimal to decimal. May be used to obfuscate malware.'),
		'dechex' => array(5, 'Decimal to hexadecimal. May be used to obfuscate malware.'),

		'chmod' => array(5, 'Changes file access mode.'),
		'chown' => array(5, 'Changes file owner.'),
		'chgrp' => array(5, 'Changes file group.'),
		'symlink' => array(5, 'Creates a symbolic link to the existing file.'),
		'unlink' => array(5, 'Deletes a file.'),

		'gzinflate' => array(4, 'Inflate a deflated string. May be used to obfuscate malware.'),
		'gzdeflate' => array(4, 'Deflate a string. May be used to obfuscate malware.'),

		'curl_init' => array(4, 'Load external data from any web server. May be used to load malicious code from any web server with no restrictions.'),
		'curl_exec' => array(4, 'Load external data from any web server. May be used to load malicious code from any web server with no restrictions.'),
		'file_get_contents' => array(4, 'Read the entire file into a string. May be used to load malicious code from any web server with no restrictions.'),

        'wp_remote_request' => array(3, 'Load data from any web server. May be used to load malicious code from an external source.'),
		'wp_remote_get' => array(3, 'Load external data from any web server. May be used to load malicious code from an external source.'),
		'wp_remote_post' => array(3, 'Upload or download data from/to any web server. May be used to load malicious code from an external source.'),
		'wp_safe_remote_post' => array(3, 'Upload or download data from/to any web server. May be used to load malicious code from an external source.'),
		'wp_remote_head' => array(3, 'Load data from any web server. May be used to load malicious code from an external source.'),

		'call_user_func' => array(2, 'Call any function given by the first parameter. May be used to run malicious code or hinder code inspection.'),
		'call_user_func_array' => array(2, 'Call any function with an array of parameters. May be used to run malicious code or hinder code inspection.'),

        'fputs' => array(1, ''),
		'flock' => array(1, ''),
		'getcwd' => array(1, ''),
		'setcookie' => array(1, ''),
		'php_uname' => array(1, ''),
		'get_current_user' => array(1, ''),
		'fileperms' => array(1, ''),
		'getenv' => array(1, ''),
		'phpinfo' => array(1, ''),
		'header' => array(1, ''),

	);
}

/**
 * Unsafe code patterns/signatures
 *
 * @return array
 */
function cerber_get_php_patterns() {
	$list = array(
		array( 'VARF', 2, '\$[a-z0-9\_]+?\((?!\))', 11, 'A variable function call. Usually is used to hinder malware detection.' ), // pattern with function parameter(s): $example(something)
		array( 'IPV4', 2, '(?:[0-9]{1,3}\.){3}[0-9]{1,3}', 6, 'A suspicious external IPv4 address found. Can cause data leakage.', 'func' => '_is_ip_external' ),
		array( 'IPV6', 2, '(?:[A-F0-9]{1,4}:){7}[A-F0-9]{1,4}', 6, 'A suspicious external IPv6 address found. Can cause data leakage.', 'func' => '_is_ip_external' ),
		array( 'BCTK', 2, '`[a-z]+`', 10, 'Execute arbitrary command on the web server' ),
		array( 'PIDT', 3, 'php://input', 6, 'Get data or commands from the Internet. Should be used in trusted or verified software only' ),
		array( 'NGET', 3, '$_GET', 3, 'Get data or commands from the Internet. Should be used in trusted or verified software only' ),
		array( 'NPST', 3, '$_POST', 3, 'Get data or commands from the Internet. Should be used in trusted or verified software only' ),
		array( 'NREQ', 3, '$_REQUEST', 3, 'Get data or commands from the Internet. Should be used in trusted or verified software only' ),

        // Should be in a separate data set for non-php files
        //array( 'SHL1', 3, '#!/bin/sh', 6, 'Executable shell script' ),
	);
	if ( $custom = crb_get_settings( 'scan_cpt' ) ) {
		foreach ( $custom as $i => $p ) {
			if ( substr( $p, 0, 1 ) == '{' && substr( $p, - 1 ) == '}' ) {
				$p = substr( $p, 1, - 1 );
				$t = 2;
			}
			else {
				$t = 3;
			}
			$list[] = array( 'CUS' . $i, $t, $p, 4, __( 'Custom signature found', 'w-cerber' ) );
		}
	}

	return $list;
}

function cerber_inspect_htaccess( $file_name = '' ) {
	if ( false === ( $lines = @file( $file_name ) ) ) {
		return new WP_Error( 'cerber-file', cerber_scan_msg( 0, $file_name ) );
	}

	$pats = cerber_get_ht_patterns();
	$severity = array();
	$xdata = array();

	foreach ( $lines as $n => $line ) {
		if ( false !== ( $p = strpos( $line, '#' ) ) ) {
			$line = substr( $line, 0, $p );
		}
		$line = trim( $line );
		if ( ! $line ) {
			continue;
		}

		foreach ( $pats as $pa ) {
			if ($pa[1] == 2) { // 2 = REGEX
				$matches = array();
				if ( preg_match_all( '/' . $pa[2] . '/i', $line, $matches, PREG_OFFSET_CAPTURE ) ) {

					if ( ! empty( $pa['not_func'] ) && function_exists( $pa['not_func'] ) ) {
						foreach ( $matches[0] as $key => $match ) {
							if ( call_user_func( $pa['not_func'], $match[0], $line ) ) {
								unset( $matches[0][ $key ] );
							}
						}
					}

					if ( ! empty( $pa['func'] ) && function_exists( $pa['func'] ) ) {
						foreach ( $matches[0] as $key => $match ) {
							if ( ! call_user_func( $pa['func'], $match[0], $line ) ) {
								unset( $matches[0][ $key ] );
							}
						}
					}

					if ( ! empty( $matches[0] ) ) {
						$m = array_values( $matches[0] );
						$m[0][2] = $n + 1;
						$xdata[]    = array( 2, $pa[0], $m );
						$severity[] = $pa[3];
					}
				}
			}
			else {
				if ( false !== stripos( $line, $pa[2] ) ) {
					$xdata[]    = array( 2, $pa[0], array( array( $pa[2], 0, $n + 1 ) ) );
					$severity[] = $pa[3];
				}
			}
		}

	}

	$max = 0;
	if ( $severity ) {
		$max = max( $severity );
	}

	return array( 'severity' => $max, 'xdata' => $xdata );

}

function cerber_get_ht_patterns() {
    static $ret;
	if ( $ret !== null ) {
		return $ret;
	}
	//$pat = cerber_get_patterns();
	$ret = array(
		//array( 'R4IP', 2, '(?:[0-9]{1,3}\.){3}[0-9]{1,3}', 6, 'A suspicious redirection to another, probably phishing website.', 'func' => '_is_rewrite_rule' ),
		//array( 'R6IP', 2, '(?:[A-F0-9]{1,4}:){7}[A-F0-9]{1,4}', 6, 'A suspicious redirection to another, probably phishing website.', 'func' => '_is_rewrite_rule' ),
		array( 'IPV4', 2, '(?:[0-9]{1,3}\.){3}[0-9]{1,3}', 6, 'A suspicious external IPv4 address found. Can cause data leakage.', 'func' => '_is_ip_external' ),
		array( 'IPV6', 2, '(?:[A-F0-9]{1,4}:){7}[A-F0-9]{1,4}', 6, 'A suspicious external IPv6 address found. Can cause data leakage.', 'func' => '_is_ip_external' ),
		array( 'RWEB', 2, '(https?:\/\/[^\s]+)', 6, 'A suspicious redirection to another, probably phishing website.', 'func' => '_is_unsafe_redirect_rule' ),
		array( 'RFTP', 2, '(ftps?:\/\/.+)', 10, 'A suspicious redirection to another, probably phishing website.', 'func' => '_is_unsafe_redirect_rule' ),
		array( 'PHPC', 2, 'php_value\s+(.+)', 10, 'An unsafe, suspicious PHP configuration command. Normally must not be here.', 'func' => '_is_unsafe_php_value' ),
    );
	return $ret;
}

function _is_unsafe_php_value( $found, $line ) {
	$cmd_list = array( 'asp_tags', 'auto_append_file', 'auto_prepend_file', 'register_globals', 'include_path', 'open_basedir', 'user_ini', 'upload_tmp_dir' );
	if ( false !== crb_stripos_multi( $found, $cmd_list ) ) {
		return true;
	}

	return false;
}

function _is_unsafe_redirect_rule( $found, $line ) {
    static $allowed, $coms;

	$line = trim( $line );

	if ( ! $coms ) {
		$coms = array( 'RewriteRule', 'RewriteMap', 'ErrorDocument' );
	}

	if ( 0 !== crb_stripos_multi( $line, $coms ) ) {
		return false;
	}

	if ( ! $allowed ) {
		$allowed = array( home_url(), 'https://%{HTTP_HOST}', 'http://%{HTTP_HOST}' );
	}

	if ( 0 !== crb_stripos_multi( $found, $allowed ) ) {
		return true;
	}

	return false;
}

function crb_stripos_multi( &$str, &$list ) {
	foreach ( $list as $item ) {
		$pos = stripos( $str, $item );
		if ( false !== $pos ) {
			return $pos;
		}
	}

	return false;
}

function _is_ip_external( $ip ) {
	if ( is_ip_private( $ip ) ) {
		return false;
	}
	if ( defined( 'DB_HOST' ) && DB_HOST === $ip ) {
		return false;
	}

	return true;
}


function cerber_get_strings() {
	$data    = array();
	$data[1] = cerber_get_php_unsafe();
	$list    = array();
	$pats    = array_merge( cerber_get_php_patterns(), cerber_get_ht_patterns() );
	foreach ( $pats as $p ) {
		$list[ $p[0] ] = $p[4];
	}
	$data[2] = $list;

	$data['explain'] = array(
		'This file contains executable code and may contain obfuscated malware. If this file is a part of a theme or a plugin, it must be located in the theme or the plugin folder. No exception, no excuses.',
		'The scanner recognizes this file as "ownerless" or "not bundled" because it does not belong to any known part of the website and should not be there.',
		'It may remain after upgrading to a newer version of %s. It also may be a piece of unknown obfuscated malware. In a rare case it might be a part of a custom-made (bespoke) plugin or theme.',
		__( 'Suspicious code instruction found', 'wp-cerber' ),
		__( 'Suspicious code signatures found', 'wp-cerber' ),
		__( 'Suspicious directives found', 'wp-cerber' ),
		'The contents of the file has been changed and does match what exists in the official WordPress repository or a reference file you\'ve uploaded earlier. The file may have been infected by malware or has been tampered with.',
		__( 'To solve this issue you have to reinstall %s or update it to the latest version.', 'wp-cerber' ),
		__( 'Please upload a reference ZIP archive', 'wp-cerber' ),
		__( 'Resolve issue', 'wp-cerber' ),
	);

	$data['complete'] = 1;

	return $data;
}

/**
 * Verify files using hash data provided as array of $file_name => $hash
 *
 * @param array $hash_data Hash
 * @param string $field Name of DB table field with local hash
 * @param string $local_prefix  Local filename prefix
 * @param int $set_type If set, the file type will be set to this value
 * @param callable $func If a local file doesn't exist it will be saved as an issue if return true
 *
 * @return array Possibly DB Errors + List of issues found
 */
function cerber_verify_files( $hash_data, $field = 'file_hash', $local_prefix = '', $type_not_in = array(), $set_type = null, $func = null ) {
	if ( ! $scan = cerber_get_scan() ) {
		return array();
	}

	$set_type = absint( $set_type );
	$issues = array();
	$errors = 0;
	$file_count = 0;

	if ( !$func || !function_exists( $func ) ) {
		$func = null;
	}

	$table = cerber_get_db_prefix() . CERBER_SCAN_TABLE;

	$local_prefix = cerber_normal_path( $local_prefix );

	foreach ( $hash_data as $file_name => $hash ) {

		if ( ! cerber_is_file_type_scan( $file_name ) ) {
			continue;
		}

		$file_name = cerber_normal_path( $file_name );

		$file_name_hash = sha1( $local_prefix . $file_name );
		$where          = 'scan_id = ' . $scan['id'] . ' AND file_name_hash = "' . $file_name_hash . '"';

        $local_file = cerber_db_get_row( 'SELECT * FROM ' . $table . ' WHERE ' . $where );

		if ( ! $local_file ) {
			if ( $func ) {
				if ( ! call_user_func( $func, $file_name ) ) {
					continue;
				}
			}
			$issues[] = array( 10, DIRECTORY_SEPARATOR . ltrim( $file_name, DIRECTORY_SEPARATOR ) );
			continue;
		}

		if ( ! empty( $type_not_in ) && in_array( $local_file['file_type'], $type_not_in ) ) {
			continue;
		}

		$short_name = cerber_get_short_name( $local_file );

		if ( empty( $local_file[ $field ] ) ) {
			$issues[] = array( 11, $short_name, 'file' => $local_file );
			continue;
		}

		$hash_match = ( $local_file[ $field ] === $hash ) ? 1 : 0;

		$status = ( $hash_match ) ? CERBER_FOK : CERBER_IMD;

		if ( $status > CERBER_FOK ) {
			$issues[] = array( $status, $short_name, 'file' => $local_file );
		}

		$file_type = ( ! empty( $set_type ) ) ? $set_type : $local_file['file_type'];

		if ( ! cerber_db_query( 'UPDATE ' . cerber_get_db_prefix() . CERBER_SCAN_TABLE . ' SET file_type = ' . $file_type . ', file_hash_repo = "' . $hash . '", hash_match = ' . $hash_match . ', scan_status = ' . $status . ' WHERE ' . $where ) ) {
			$errors++;
		}

		$file_count ++;

	}

	return array( $issues, $errors );
}

/**
 * Retrieve hash for a given plugin from wordpress.org
 *
 * @param $plugin string  Plugin folder
 * @param $ver string Plugin version
 * @param $nocache bool If true, do not use data from the local cache (refresh one)
 *
 * @return WP_Error|array|mixed
 */
function cerber_get_plugin_hash( $plugin, $ver, $nocache = false ) {

	if ( !$plugin = preg_replace( '/[^a-z\-\d]/i', '', $plugin ) ) {
		return false;
	}

	$response = cerber_obtain_hash( 'https://downloads.wordpress.org/plugin-checksums/' . $plugin . '/' . $ver . '.json', $nocache );

	if ( ! $response['error'] ) {
		return $response['server_data'];
	}

	if ( $response['http_code'] == 404 ) {
		$ret = new WP_Error( 'no_remote_hash', 'The plugin is not found on wordpress.org' );
	}
	else {
		if ( ! empty( $response['curl_error'] ) ) {
			$msg = 'CURL ' . $response['curl_error'];
		}
        elseif ( ! empty( $response['json_error'] ) ) {
			$msg = 'JSON ' . $response['json_error'];
		}
		else {
			$msg = 'Unknown network error';
		}
		$ret = new WP_Error( 'net_issue', $msg );
		cerber_log_scan_error( $msg );
	}


	return $ret;

}

/**
 * @param $theme_folder
 * @param $theme object WP_Theme
 *
 * @return bool|WP_Error|array  false if no local hash or theme is not publicly hosted on on the wordpress.org
 */
function cerber_get_theme_hash( $theme_folder, $theme ) {

	if ( $hash = cerber_get_local_hash( CRB_HASH_THEME . sha1( $theme->get( 'Name' ) . $theme_folder ), $theme->get('Version') ) ) {
	    return $hash;
	}

	// Try to load a reference ZIP archive from wordpress.org

	$tmp_folder = cerber_get_tmp_file_folder();
	if ( is_wp_error( $tmp_folder ) ) {
		return $tmp_folder;
	}

	$tmp_zip_file = $tmp_folder . $theme_folder . '.' . $theme->get( 'Version' ) . '.zip';

	if ( ! $fp = fopen( $tmp_zip_file, 'w' ) ) {
		return new WP_Error( 'cerber-file', 'Unable to create temporary file ' . $tmp_zip_file );
	}

	$curl = @curl_init();
	if ( ! $curl ) {
		return new WP_Error( 'cerber-curl', 'CURL library is disabled or not installed on this web server.');
	}

	$url = 'https://downloads.wordpress.org/theme/' . $theme_folder . '.' . $theme->get( 'Version' ) . '.zip';

	curl_setopt_array( $curl, array(
		CURLOPT_URL               => $url,
		CURLOPT_POST              => false,
		CURLOPT_USERAGENT         => 'Cerber Security Plugin',
		CURLOPT_FILE              => $fp,
		CURLOPT_FAILONERROR       => true,
		CURLOPT_CONNECTTIMEOUT    => 5,
		CURLOPT_TIMEOUT           => 25, // including CURLOPT_CONNECTTIMEOUT
		CURLOPT_DNS_CACHE_TIMEOUT => 3 * 3600,
		CURLOPT_SSL_VERIFYHOST    => 2,
		CURLOPT_SSL_VERIFYPEER    => true,
		CURLOPT_CAINFO            => ABSPATH . WPINC . '/certificates/ca-bundle.crt',
	) );

	if ( ! curl_exec( $curl ) ) {
		$code = curl_getinfo( $curl, CURLINFO_HTTP_CODE );
		curl_close( $curl );
		fclose( $fp );
		unlink( $tmp_zip_file );

		if ( 404 == $code ) {
			return false; // Nothing serious, should not be logged
		}

		return new WP_Error( 'cerber-curl', 'Unable to download: ' . $url );
	}

	curl_close( $curl );
	fclose( $fp );

	$result = cerber_need_for_hash( $tmp_zip_file, true, time() + DAY_IN_SECONDS );
	if ( is_wp_error( $result ) ) {
	    return $result;
    }

	if ( $hash = cerber_get_local_hash( CRB_HASH_THEME . sha1( $theme->get( 'Name' ) . $theme_folder ), $theme->get('Version') ) ) {
		return $hash;
	}

	return false;
}

/**
 * Retrieve MD5 hash from wordpress.org
 * See also: get_core_checksums();
 *
 * @param bool $nocache if true, do not use the local cache
 *
 * @return array|object|WP_Error
 */
function cerber_get_wp_hash( $nocache = false ) {

    $wp_version = cerber_get_wp_version();

	$locale = get_locale();

	$response = cerber_obtain_hash( 'https://api.wordpress.org/core/checksums/1.0/?version=' . $wp_version . '&locale=' . $locale, $nocache );

	if ( ! $response['error'] ) {
		$ret = $response['server_data'];
	}
	else {
		if ( ! empty( $response['curl_error'] ) ) {
			$msg = 'CURL ' . $response['curl_error'];
		}
        elseif ( ! empty( $response['json_error'] ) ) {
			$msg = 'JSON ' . $response['json_error'];
		}
		else {
			$msg = 'Unknown network error';
		}
		$ret = new WP_Error( 'net_issue', $msg );
		cerber_log_scan_error( $msg );
	}

	return $ret;

}

/**
 * Download hash from the given URL. Network level.
 *
 * @param $url
 * @param bool $nocache If true, do not use data from the local cache (refresh one)
 *
 * @return array|bool
 */
function cerber_obtain_hash( $url, $nocache = false ) {

	$key = 'tmp_hashcache_' . sha1( $url );

	if ( ! $nocache && $cache = cerber_get_set( $key ) ) {
		return $cache;
	}

	$ret = array( 'error' => 1 );

	$curl = @curl_init();
	if ( ! $curl ) {
	    $ret['curl_error'] = 'CURL library is disabled or not installed on this web server.';
		return $ret;
	}

	curl_setopt_array( $curl, array(
		CURLOPT_URL               => $url,
		CURLOPT_POST              => false,
		CURLOPT_USERAGENT         => 'Cerber Security Plugin',
		CURLOPT_RETURNTRANSFER    => true,
		CURLOPT_CONNECTTIMEOUT    => 5,
		CURLOPT_TIMEOUT           => 10, // including CURLOPT_CONNECTTIMEOUT
		CURLOPT_DNS_CACHE_TIMEOUT => 3 * 3600,
		CURLOPT_SSL_VERIFYHOST    => 2,
		CURLOPT_SSL_VERIFYPEER    => true,
		CURLOPT_CAINFO            => ABSPATH . WPINC . '/certificates/ca-bundle.crt',
	) );

	$result = curl_exec( $curl );

	$ret['curl_status'] = curl_getinfo( $curl );
	$http_code = curl_getinfo( $curl, CURLINFO_HTTP_CODE );
	$ret['http_code'] = $http_code;

	if ( $result ) {
		if ( 200 === $http_code ) {
			$ret['server_data'] = json_decode( $result );
			if ( JSON_ERROR_NONE != json_last_error() ) {
				$ret['server_data'] = '';
				$ret['json_error'] = json_last_error();
				$ret['error'] = json_last_error();
			}
			else {
				$ret['error'] = 0;
				cerber_update_set( $key, $ret, 0, true, time() + DAY_IN_SECONDS );
			}
		}
        elseif ( 404 === $http_code ) {
	        $ret['curl_error'] = 'Remote server return 404 URL not found';
	        $ret['error'] = $ret['curl_error'];
			// There is no information about the plugin or this version of the plugin
		}
		else {
			if ( ! $err = curl_error( $curl ) ) {
				$err = 'Unknown CURL (network) error with code ' . $http_code;
			}
			$ret['curl_error'] = $err;
			$ret['error'] = $err;
		}
	}
	else {
		if ( ! $err = curl_error( $curl ) ) {
			$err = 'Unknown CURL (network) error with code ' . $http_code;
		}
		$ret['curl_error'] = $err;
		$ret['error'] = $err;
		//curl_errno($curl);
	}

	if ( ! empty( $ret['curl_error'] ) ) {
		$ret['curl_error'] = 'ERR# ' . curl_errno( $curl ) . ' ' . $ret['curl_error'] . ' for URL: ' . $url;
	}

	curl_close( $curl );

	return $ret;
}

function cerber_detect_file( $file_name ) {
	static $abspath = null;
	static $upload_dir = null;
	static $upload_dir_mu = null;
	static $plugin_dir = null;
	static $theme_dir = null;
	static $content_dir = null;
	static $len = null;

	if ( $abspath === null ) {
		$abspath       = cerber_get_abspath();
		$len           = strlen( $abspath );
		$content_dir   = cerber_get_content_dir() . DIRECTORY_SEPARATOR;
		$upload_dir    = cerber_get_upload_dir() . DIRECTORY_SEPARATOR;
		$upload_dir_mu = cerber_get_upload_dir_mu() . DIRECTORY_SEPARATOR;
		$plugin_dir    = cerber_get_plugins_dir() . DIRECTORY_SEPARATOR;
		$theme_dir     = cerber_get_themes_dir() . DIRECTORY_SEPARATOR;
	}

	// Check in a particular order for a better performance

	if ( 0 === strpos( $file_name, $abspath . 'wp-admin' . DIRECTORY_SEPARATOR ) ) {
		return CERBER_FT_WP; // WP
	}
	if ( 0 === strpos( $file_name, $abspath . 'wp-includes' . DIRECTORY_SEPARATOR ) ) {
		return CERBER_FT_WP; // WP
	}

	if ( 0 === strpos( $file_name, $plugin_dir ) ) {
		return CERBER_FT_PLUGIN; // Plugin
	}

	if ( 0 === strpos( $file_name, $theme_dir ) ) {
		return CERBER_FT_THEME; // Theme
	}

	if ( 0 === strpos( $file_name, $upload_dir ) ) {
		return CERBER_FT_UPLOAD; // Upload folder
	}

	if ( is_multisite() ) {
		if ( 0 === strpos( $file_name, $upload_dir_mu ) ) {
			return CERBER_FT_UPLOAD; // Upload folder
		}
	}

	if ( 0 === strpos( $file_name, $content_dir ) ) {
		if ( 0 === strpos( $file_name, $content_dir . 'languages' . DIRECTORY_SEPARATOR ) ) {
			return CERBER_FT_LNG; // Translations
		}
		if ( 0 === strpos( $file_name, $content_dir . 'mu-plugins' . DIRECTORY_SEPARATOR ) ) {
			return CERBER_FT_MUP; // A file in MU plugins folder
		}
		if ( $file_name === $content_dir . 'index.php' ) {
			return CERBER_FT_WP; // WP
		}

		if ( cerber_is_dropin( $file_name ) ) {
			return CERBER_FT_DRIN;
		}

		return CERBER_FT_CNT; // WP Content
	}

	if ( strrpos( $file_name, DIRECTORY_SEPARATOR ) === ( $len - 1 ) ) {
		//if ( strrchr( $file_name, DIRECTORY_SEPARATOR ) === DIRECTORY_SEPARATOR . 'wp-config.php' ) {
		if ( basename( $file_name ) == 'wp-config.php' ) {
			return CERBER_FT_CONF;
		}

		return CERBER_FT_ROOT; // File in the root folder
	}

	if ( basename( $file_name ) == 'wp-config.php' ) {
		if ( ! file_exists( $abspath . '/wp-config.php' ) ) {
			return CERBER_FT_CONF;
		}
	}

	return CERBER_FT_OTHER; // Some subfolder in the root folder

}

function cerber_is_htaccess( $file_name ) {
	if ( strrchr( $file_name, DIRECTORY_SEPARATOR ) === DIRECTORY_SEPARATOR . '.htaccess' ) {
		return true;
	}

	return false;
}

function cerber_is_dropin( $file_name ) {
	$dropins = _get_dropins();
	if ( isset( $dropins[ basename( $file_name ) ] ) ) {
		if ( 0 === strpos( $file_name, cerber_get_content_dir() . DIRECTORY_SEPARATOR ) ) {
			return true;
		}
	}

	return false;
}

/**
 * Return theme or plugin main folder
 *
 * @param $file_name
 * @param $path
 *
 * @return string
 */
function cerber_get_file_folder( $file_name, $path ) {
	$p_start = mb_strlen( $path ) + 1;
	$folder = mb_substr( $file_name, $p_start );
	if ( $pos = mb_strpos( $folder, DIRECTORY_SEPARATOR ) ) {
		$folder = mb_substr( $folder, 0, $pos );
	}

	return $folder;
}

/**
 * Prepare and save file data to the DB
 *
 * @param array $file A row from the cerber_files table
 *
 * @return bool
 */
function cerber_add_file_info( $file ) {
	static $md5;
	static $hash;

	if ( $md5 === null ) {
		$md5 = array( CERBER_FT_WP, CERBER_FT_PLUGIN, CERBER_FT_THEME, CERBER_FT_ROOT );
	}

	if ( $hash === null ) {
		$hash = array( CERBER_FT_PLUGIN, CERBER_FT_THEME );
	}

	$type = cerber_detect_file( $file['file_name'] );
	$file_name = $file['file_name'];
	$update_file_name = '';

	// A symbolic link in the content folder? Transform it to a real file name
	if ( $type == CERBER_FT_CNT && is_link( $file['file_name'] ) ) {

	    $file_name  = @readlink( $file['file_name'] );

	    if ( is_dir( $file_name ) ) {
			$delete_it = true;
		}
		else {
			$delete_it = cerber_db_get_var( 'SELECT COUNT(scan_id) FROM ' . cerber_get_db_prefix() . CERBER_SCAN_TABLE . ' WHERE scan_id = ' . $file['scan_id'] . ' AND file_name = "' . cerber_real_escape( $file_name ) . '"' );
		}

		if ( $delete_it ) {
			return cerber_db_query( 'DELETE FROM ' . cerber_get_db_prefix() . CERBER_SCAN_TABLE . ' WHERE scan_id = ' . $file['scan_id'] . ' AND file_name_hash = "' . $file['file_name_hash'] . '"' );
		}

		$update_file_name = ' file_name="'.cerber_real_escape( $file_name ).'",';
	}

	$file_hash = '';
	$file_md5 = '';

	if ( @is_readable( $file_name ) ) {
		if ( in_array( $type, $md5 ) ) {
			if ( ! $file_md5 = @md5_file( $file_name ) ) {
				$file_md5 = '';
			}
		}
		//if ( cerber_is_check_fs() || in_array( $type, $hash ) || cerber_is_htaccess( $file_name ) ) {
		if ( cerber_is_check_fs() || in_array( $type, $hash ) ) {
			if ( ! $file_hash = @hash_file( 'sha256', $file_name ) ) {
				$file_hash = '';
			}
		}
	}
	else {
		cerber_log_scan_error( cerber_scan_msg( 0, $file_name ) );
	}

	$size = @filesize( $file_name );
	$size = ( is_numeric( $size ) ) ? $size : 0;

	$perms = @fileperms( $file_name );
	$perms = ( is_numeric( $perms ) ) ? $perms : 0;

	$mtime = @filemtime( $file_name );
	$mtime = ( is_numeric( $mtime ) ) ? $mtime : 0;

	$is_writable = ( is_writable( $file_name ) ) ? 1 : 0;

	//if ( ! cerber_db_query( 'UPDATE ' . cerber_get_db_prefix() . CERBER_SCAN_TABLE . ' SET file_name = "' . $file_name . '", file_hash = "' . $file_hash . '", file_md5 = "' . $file_md5 . '", file_size = ' . $size . ', file_type = ' . $type . ', file_perms = ' . $perms . ', file_writable = ' . $is_writable . ', file_mtime = ' . $mtime .
	if ( ! cerber_db_query( 'UPDATE ' . cerber_get_db_prefix() . CERBER_SCAN_TABLE . ' SET '.$update_file_name.' file_hash = "' . $file_hash . '", file_md5 = "' . $file_md5 . '", file_size = ' . $size . ', file_type = ' . $type . ', file_perms = ' . $perms . ', file_writable = ' . $is_writable . ', file_mtime = ' . $mtime .
                            ' WHERE scan_id = ' . $file['scan_id'] . ' AND file_name_hash = "' . $file['file_name_hash'] . '"' ) ) {
		return false;
	}

	return true;
}

/**
 * @param string $file_name_hash
 * @param int $status
 * @param int $scan_id
 *
 * @return bool|mysqli_result|resource
 */
function cerber_update_file_status( $file_name_hash, $status, $scan_id ) {
	return cerber_db_query( 'UPDATE ' . cerber_get_db_prefix() . CERBER_SCAN_TABLE . ' SET scan_status = ' . $status . ' WHERE scan_id = ' . $scan_id . ' AND file_name_hash = "' . $file_name_hash . '"' );
}

function cerber_is_check_fs() {
	if ( crb_get_settings( 'scan_imod' ) || crb_get_settings( 'scan_inew' ) ) {
		return true;
	}

	return false;
}

/**
 * Are there any changes/new files
 *
 * @return int
 */
function cerber_check_fs_changes() {

	$scan_id = cerber_get_scan_id();

	$prev_id = cerber_get_prev_scan_id( $scan_id );

	if ( $prev_id ) {
		cerber_cmp_scans( $prev_id, $scan_id );
	}

	return 0;
}

function cerber_get_prev_scan_id( $scan_id = 0 ) {
    global $cerber_scan_mode;

	if ( ! $scans = cerber_db_get_results( 'SELECT * FROM ' . cerber_get_db_prefix() . CERBER_SETS_TABLE
	                                       . ' WHERE the_key = "scan" AND the_id < ' . $scan_id . ' ORDER BY the_id DESC' )
	) {
		return 0;
	}

	$prev_id = 0;
	foreach ( $scans as $item ) {
		$scan = unserialize( $item['the_value'] );
		if ( $scan['mode'] == $cerber_scan_mode ) {
			$prev_id = $scan['id'];
			break;
		}
	}

	return $prev_id;
}

function cerber_cmp_scans( $prev_id, $scan_id ) {

	$p_files = cerber_db_get_results( 'SELECT file_name_hash, file_hash, file_md5, file_size FROM ' . cerber_get_db_prefix() . CERBER_SCAN_TABLE . ' WHERE scan_id = ' . $prev_id);

	$n_files = cerber_db_get_results( 'SELECT file_name_hash, file_hash, file_md5, file_size FROM ' . cerber_get_db_prefix() . CERBER_SCAN_TABLE . ' WHERE scan_id = ' . $scan_id);

	if ( ! $p_files || ! $n_files ) {
		return 0;
	}

	$prev_files = array();
	foreach ( $p_files as $file ) {
		$prev_files[$file['file_name_hash']] = $file;
	}

	$new_files = array();
	foreach ( $n_files as $file ) {
		$new_files[$file['file_name_hash']] = $file;
	}

	$inew = crb_get_settings( 'scan_inew' );
	$imod = crb_get_settings( 'scan_imod' );

	$update = array();
	foreach ( $new_files as $key => $file ) {
		$status = 0;
		if ( ! isset( $prev_files[ $key ] ) ) {
			if ( $inew ) {
				$status = 51;
			}
		}
        elseif ( $imod ) {
			$status = cerber_cmp_files( $prev_files[ $key ], $new_files[ $key ] );
		}
		if ( $status > 0 ) {
			$update[ $key ] = $status;
		}
	}

	if ( ! $update ) {
		return 0;
	}

	$table = cerber_get_db_prefix() . CERBER_SCAN_TABLE;
	foreach ( $update as $key => $status ) {
		cerber_db_query( 'UPDATE ' . $table . ' SET file_status = ' . $status . ' WHERE scan_id = ' . $scan_id . ' AND file_name_hash = "' . $key . '"' );
	}

	return 0;

}

function cerber_cmp_files( $prev, $new ) {
	if ( ! empty( $prev['file_hash'] ) && ! empty( $new['file_hash'] ) ) {
		if ( $prev['file_hash'] != $new['file_hash'] ) {
			return 50;
		}
	}
    elseif ( ! empty( $prev['file_md5'] ) && ! empty( $new['file_md5'] ) ) {
		if ( $prev['file_md5'] != $new['file_md5'] ) {
			return 50;
		}
	}
    elseif ( $prev['file_size'] != $new['file_size'] ) {
		return 50;
	}

	return 0;
}

/**
 * Recursively creates a list of files in a given folder with a given filename pattern
 *
 * @param string $root The starting folder with trailing slash
 * @param string $pattern Pattern for filenames to include
 * @param callable $function The function to save the list of files that are passed as an array
 *
 * @return array The total number of folders and files
 */
function cerber_scan_directory( $root, $pattern = null, $function ) {
    static $history = array();
    static $exclude = null;

    // Prevent infinite recursion
	if ( isset( $history[ $root ] ) ) {
		return array( 0, 0 );
	}
	$history[ $root ] = 1;

	// Must be excluded
	if ( $exclude === null ) {
		$exclude = crb_get_settings( 'scan_exclude' );
		if ( ! $exclude ) {
			$exclude = array();
		}
		$d = cerber_get_the_folder();
		if ( is_dir( $d ) ) {
			$exclude[] = $d;
		}
		$exclude   = array_map( function ( $item ) {
			return rtrim( $item, '/\\' );
		}, $exclude );
	}

	if ( ! $pattern ) {
		$pattern = '{*,.*}';
	}

	$dir_counter  = 1;
	$file_counter = 0;
	$root = rtrim( $root, '/\\' ) . DIRECTORY_SEPARATOR;
	$list         = array();

	if ( $files = glob( $root . $pattern, GLOB_BRACE ) ) {
		foreach ( $files as $file_name ) {
			if ( @is_dir( $file_name ) ) {
				continue;
			}
			$file_counter ++;
			//$file_name = str_replace( array( '/', '\\' ), DIRECTORY_SEPARATOR, $file_name );
			//$file_name = cerber_norm_file_name( $file_name );
			$list[]    = $file_name;
			if ( count( $list ) > 200 ) { // packet size, can affect the DB performance if $function saves file names to the DB
				call_user_func( $function, $list );
				$list = array();
			}
		}
		if ( ! empty( $list ) ) {
			call_user_func( $function, $list );
		}
	}
    elseif ( $files === false ) {
		cerber_log_scan_error( 'PHP glob got error while accessing ' . $root . $pattern );
	}

	if ( $dirs = glob( $root . '*', GLOB_ONLYDIR ) ) {
		foreach ( $dirs as $dir ) {
			if ( in_array( $dir, $exclude ) ) {
				continue;
			}
			list ( $dc, $fc ) = cerber_scan_directory( $dir, $pattern, $function );
			$dir_counter  += $dc;
			$file_counter += $fc;
		}
	}
    elseif ( $files === false ) {
		cerber_log_scan_error( 'PHP glob got error while accessing ' . $root . '*' );
	}

	return array( $dir_counter, $file_counter );
}

/**
 * @param $file_name string
 *
 * @return string
 */
function cerber_normal_path( $file_name ) {
	return str_replace( array( '/', '\\' ), DIRECTORY_SEPARATOR, $file_name );
}

/**
 * Packet saving of file names
 *
 * @param array $list
 *
 * @return bool|mysqli_result
 */
function _crb_save_file_names( $list ) {
    global $cerber_scan_mode;
	static $scan_id;

	$list = array_filter( $list );
	if ( empty( $list ) ) {
		return true;
	}

	if ( ! isset( $scan_id ) ) {
		$scan_id = cerber_get_scan_id();
		if ( ! $scan_id ) {
			return false;
		}
	}

	if ( $cerber_scan_mode == 'full' ) {
		$scan_mode = 1;
	}
	else {
		$scan_mode = 0;
	}

	$sql = '';

	$table = cerber_get_db_prefix() . CERBER_SCAN_TABLE;

	foreach ( $list as $filename ) {
		if ( ! @is_file( $filename ) || ! cerber_is_file_type_scan( $filename ) ) {
			continue;
		}
		$filename = cerber_normal_path( $filename );

		$sha1 = sha1( $filename );
		if ( cerber_db_get_var( 'SELECT COUNT(scan_id) FROM ' . $table . ' WHERE scan_id = ' . $scan_id . ' AND file_name_hash = "' . $sha1 . '"' ) ) {
			continue;
		}
		$filename = cerber_real_escape( $filename );

		$sql .= '(' . $scan_id . ',' . $scan_mode . ',"' . $sha1 . '","' . $filename . '"),';
	}

	if ( ! $sql ) {
		return true;
	}

	$sql = rtrim( $sql, ',' );

	$ret = cerber_db_query( 'INSERT INTO ' . $table . ' (scan_id, scan_mode, file_name_hash, file_name) VALUES ' . $sql );
	if ( ! $ret ) {
		cerber_log_scan_error( 'DB Error occurred while saving filenames' );
	}

	return $ret;
}

/**
 * Return true if a given file must be checked (scanned)
 *
 * @param $filename
 *
 * @return bool
 */
function cerber_is_file_type_scan( $filename ) {
	global $cerber_scan_mode;
	static $code = array( 'php', 'inc' );

	if ( $cerber_scan_mode == 'full' ) {
		return true;
	}
	else {

	    if ( cerber_check_extension( $filename, $code ) ) {
			return true;
		}

		$pos = strrpos( $filename, DIRECTORY_SEPARATOR );
		if ( $pos ) {
			$filename = substr( $filename, $pos + 1 );
		}

		if ( $filename == '.htaccess' ) {
			return true;
		}

		return false;

	}

	return false;
}

/**
 * Check if a filename has an extension from a given list
 *
 * @param $filename
 * @param array $ext_list
 *
 * @return bool
 */
function cerber_check_extension( $filename, $ext_list = array() ) {
	if ( ! is_array( $ext_list ) || empty( $ext_list ) ) {
		return false;
	}

	//$d = cerber_detect_exec_extension();

    $pos = mb_strrpos( $filename, DIRECTORY_SEPARATOR );
	if ( $pos ) {
		$filename = mb_substr( $filename, $pos + 1 );
	}

	$pos = mb_strpos( $filename, '.' );
	if (!$pos) {
		return false;
	}

	$ext = mb_substr( $filename, $pos + 1 );
	$ext = strtolower( $ext );

	// A normal, single extension

	if ( in_array( $ext, $ext_list ) ) {
		return true;
	}

	// No more additional extensions

	if ( substr_count( $ext, '.' ) == 0 ) {
		return false;
	}

	// Multiple "extensions"

	$last = substr( $ext, strrpos( $ext, '.' ) + 1 );
	if ( in_array( $last, $ext_list ) ) {
		return true;
	}
	$first = substr( $ext, 0, strpos( $ext, '.' ) - 1);
	if ( in_array( $first, $ext_list ) ) {
		return true;
	}

	return false;

}

/**
 * Retrieve a value from the key-value storage
 *
 * @param string $key
 * @param integer $id
 * @param bool $unserialize
 *
 * @return bool|array
 */
function cerber_get_set( $key, $id = null, $unserialize = true ) {
	$key = preg_replace( '/[^a-z_\-\d]/i', '', $key );

	$and = '';
	if ( $id !== null ) {
		$and = ' AND the_id = ' . absint( $id );
	}

	$ret = false;

	if ( $row = cerber_db_get_row( 'SELECT * FROM ' . cerber_get_db_prefix() . CERBER_SETS_TABLE . ' WHERE the_key = "' . $key . '" ' . $and ) ) {
		if ( $row['expires'] > 0 && $row['expires'] < time() ) {
			cerber_delete_set( $key, $id );
			return false;
		}
		if ( $unserialize ) {
			$ret = unserialize( $row['the_value'] );
		}
		else {
			$ret = $row['the_value'];
		}
	}

	return $ret;
}

/**
 * Update/insert value to the key-value storage
 *
 * @param string $key A unique key for the data set
 * @param $value
 * @param integer $id An additional numerical key
 * @param bool $serialize
 * @param integer $expires Unix timestamp (UTC) when this element will be deleted
 *
 * @return bool
 */
function cerber_update_set( $key, $value, $id = null, $serialize = true, $expires = null ) {

	$key = preg_replace( '/[^a-z_\-\d]/i', '', $key );

	if ( $id !== null ) {
		$id = absint( $id );
	}
	else {
		$id = 0;
	}

	if ( $serialize ) {
		$value = serialize( $value );
	}
	$value = cerber_real_escape( $value );

	if ( $expires !== null ) {
		$expires = absint( $expires );
	}
	else {
		$expires = 0;
	}

	if ( false !== cerber_get_set( $key, $id, false ) ) {
		$sql = 'UPDATE ' . cerber_get_db_prefix() . CERBER_SETS_TABLE . ' SET the_value = "' . $value . '", expires = ' . $expires . ' WHERE the_key = "' . $key . '" AND the_id = ' . $id;
	}
	else {
		$sql = 'INSERT INTO ' . cerber_get_db_prefix() . CERBER_SETS_TABLE . ' (the_key, the_id, the_value, expires) VALUES ("' . $key . '",' . $id . ',"' . $value . '",' . $expires . ')';
	}

	if ( cerber_db_query( $sql ) ) {
		return true;
	}
	else {
		return false;
	}
}

/**
 * Delete value from the storage
 *
 * @param string $key
 * @param integer $id
 *
 * @return bool
 */
function cerber_delete_set( $key, $id = null) {

	$key = preg_replace( '/[^a-z_\-\d]/i', '', $key );

	$and = '';
	if ( $id !== null ) {
		$and = ' AND the_id = ' . absint( $id );
	}

	if ( cerber_db_query( 'DELETE FROM ' . cerber_get_db_prefix() . CERBER_SETS_TABLE . ' WHERE the_key = "' . $key . '"' . $and ) ) {
		return true;
	}
	else {
		return false;
	}
}

/**
 * Clean up all expired sets. Usually by cron.
 * @param bool $all if true, deletes all sets that has expiration
 *
 * @return bool
 */
function cerber_delete_expired_set( $all = false ) {
	if ( ! $all ) {
		$where = 'AND expires < ' . time();
	}
	else {
		$where = '';
	}
	if ( cerber_db_query( 'DELETE FROM ' . cerber_get_db_prefix() . CERBER_SETS_TABLE . ' WHERE expires > 0 ' . $where ) ) {
		return true;
	}
	else {
		return false;
	}
}

function cerber_step_desc(){
	$steps = array(
		'',
		__( 'Scanning folders for files', 'wp-cerber' ),
		__( 'Scanning the upload folder for files', 'wp-cerber' ),
		__( 'Scanning the temp folder for files', 'wp-cerber' ),
		__( 'Scanning the session folder for files', 'wp-cerber' ),
		__( 'Parsing the list of files', 'wp-cerber' ),
		__( 'Checking for new and modified files', 'wp-cerber' ),
		__( 'Verifying the integrity of WordPress', 'wp-cerber' ),
		__( 'Verifying the integrity of the plugins', 'wp-cerber' ),
		__( 'Verifying the integrity of the themes', 'wp-cerber' ),
		__( 'Searching for malicious code', 'wp-cerber' ),
		__( 'Finalizing the scan', 'wp-cerber' ),
	);

	return $steps;
}

/**
 * Overwrites values and preserve array hierarchy (keys)
 *
 * @param array $a1
 * @param array $a2
 *
 * @return mixed
 */
function cerber_array_merge_recurively( $a1, $a2 ) {
	foreach ( $a2 as $key => $value ) {
		if ( isset( $a1[ $key ] ) && is_array( $a1[ $key ] ) && is_array( $value ) ) {
			$a1[ $key ] = cerber_array_merge_recurively( $a1[ $key ], $value );
		}
		else {
			$a1[ $key ] = $value;
		}
	}

	return $a1;
}

function cerber_get_short_name( $file_row ) {
	if ( ! $file_row ) {
		return '';
	}
	$file_name = $file_row['file_name'];
	$len = null;
	switch ( $file_row['file_type'] ) {
		case CERBER_FT_PLUGIN:
			$len = mb_strlen( cerber_get_plugins_dir() );
			break;
		case CERBER_FT_THEME:
			$len = mb_strlen( cerber_get_themes_dir() );
			break;
		case CERBER_FT_UPLOAD:
			if ( is_multisite() && false !== strpos( $file_name, cerber_get_upload_dir_mu() . DIRECTORY_SEPARATOR ) ) {
				$len = mb_strlen( dirname( cerber_get_upload_dir_mu() ) );
			}
			else {
				$len = mb_strlen( dirname( cerber_get_upload_dir() ) );
			}
			break;
		default:
			if ( 0 === strpos( $file_name, rtrim( cerber_get_abspath(), '/\\' ) ) ) {
				$len = mb_strlen( cerber_get_abspath() ) - 1;
			}
	}

	if ( $len ) {
		$ret = mb_substr( $file_name, $len );
	}
	else {
		$ret = $file_name;
    }

	return $ret;
}

function cerber_scanner_dashboard( $msg = '' ) {
	?>
    <div id="crb-scan-display">
        <div id="crb-the-table">
            <div class="crb-scan-info scan-tile">
                <table>
                    <tr>
                        <td><?php _e( 'Started', 'wp-cerber' ); ?></td>
                        <td id="crb-started" data-init="-">-</td>
                    </tr>
                    <tr>
                        <td><?php _e( 'Finished', 'wp-cerber' ); ?></td>
                        <td id="crb-finished" data-init="-">-</td>
                    </tr>
                    <tr>
                        <td><?php _e( 'Duration', 'wp-cerber' ); ?></td>
                        <td id="crb-duration" data-init="-">-</td>
                    </tr>
                    <tr>
                        <td><?php _e( 'Performance', 'wp-cerber' ); ?></td>
                        <td id="crb-performance" data-init="-">-</td>
                    </tr>
                    <tr>
                        <td>Mode</td>
                        <td id="crb-smode" data-init="-">-</td>
                    </tr>
                </table>
            </div>
            <div class="crb-scan-info scan-tile">
                <table>
                    <tr>
                        <td><?php _e( 'Vulnerabilities', 'wp-cerber' ); ?></td>
                        <td id="crb-numbers-4" data-init="-">-</td>
                    </tr>
                    <tr>
                        <td><?php _e( 'New files', 'wp-cerber' ); ?></td>
                        <td id="crb-numbers-51" data-init="-">-</td>
                    </tr>
                    <tr>
                        <td><?php _e( 'Changed files', 'wp-cerber' ); ?></td>
                        <td id="crb-numbers-50" data-init="-">-</td>
                    </tr>
                    <tr>
                        <td><?php _e( 'Unwanted extensions', 'wp-cerber' ); ?></td>
                        <td id="crb-numbers-30" data-init="-">-</td>
                    </tr>
                    <tr>
                        <td><?php _e( 'Unattended files', 'wp-cerber' ); ?></td>
                        <td id="crb-numbers-18" data-init="-">-</td>
                    </tr>
                </table>
            </div>
            <div class="scan-tile">
                <div><p><span id="crb-scanned-files" data-init="-">0</span> / <span id="crb-total-files"
                                                                                    data-init="-">0</span>
                    </p>
                    <p><?php echo __( 'Scanned', 'wp-cerber' ) . ' / ' . __( 'Files to scan', 'wp-cerber' ); ?></p>
                </div>
            </div>

            <div class="scan-tile">
                <div><p><span id="crb-critical" data-init="-">0</span> / <span id="crb-warning" data-init="-">0</span>
                    </p>
                    <p><?php _e( 'Critical issues', 'wp-cerber' ); ?> / <?php _e( 'Issues total', 'wp-cerber' ); ?></p>
                </div>
            </div>

        </div>

        <div id="crb-scan-progress">
            <div>
                <div id="the-scan-bar"></div>
            </div>
        </div>

        <p id="crb-scan-message"><?php echo $msg; ?></p>

    </div>
    <div id="crb-scan-details">
        <table class="crb-table" id="crb-browse-files">
			<?php
			$rows = array();
			$rows[] = '<tr class="crb-scan-container" id="crb-wordpress" style=""><td colspan="6">WordPress</td></tr>';
			$rows[] = '<tr class="crb-scan-container" id="crb-muplugins" style=""><td colspan="6">Must use plugins</td></tr>';
			$rows[] = '<tr class="crb-scan-container" id="crb-dropins" style=""><td colspan="6">Drop-ins</td></tr>';
			$rows[] = '<tr class="crb-scan-container" id="crb-plugins" style=""><td colspan="6">Plugins</td></tr>';

			/*
			$plugins = get_plugins();
			foreach ( $plugins as $plugin ) {
				$rows[] = '<tr class="crb-scan-section" id="' . sha1( $plugin['Name'] ) . '" style="display:none;"></tr>';
			}
			*/
			$rows[] = '<tr class="crb-scan-container" id="crb-themes" style=""><td colspan="6">Themes</td></tr>';

			/*$themes = wp_get_themes();
			foreach ( $themes as $theme_folder => $theme ) {
				$rows[] = '<tr class="crb-scan-section" id="' . sha1( $theme->get( 'Name' ) ) . '" style="display:none;"></tr>';
			}*/

			$rows[] = '<tr class="crb-scan-container" id="crb-uploads" style=""><td colspan="6">Uploads folder</td></tr>';
			$rows[] = '<tr class="crb-scan-container" id="crb-unattended" style=""><td colspan="6">Unattended files</td></tr>';
			echo implode("\n",$rows);
			?>
        </table>
    </div>

	<?php

	cerber_ref_upload_form();
}

function cerber_scanner_dashboardold( $msg = '' ) {
	?>
    <div id="crb-scan-display">
        <div id="" class="scan-tile">
            <table>
                <tr><td>Started</td><td id="crb-started" data-init="-">-</td></tr>
                <tr><td>Finished</td><td id="crb-finished" data-init="-">-</td></tr>
                <tr><td>Duration</td><td id="crb-duration" data-init="-">-</td></tr>
                <tr><td>Performance</td><td id="crb-performance" data-init="-">-</td></tr>
                <tr><td>Mode</td><td id="crb-smode" data-init="-">-</td></tr>
            </table>
        </div>
        <div class="scan-tile">
            <div><p id="crb-total-files" data-init="-">0</p>
                <p><?php _e( 'Files to scan', 'wp-cerber' ); ?></p></div>
        </div>
        <div class="scan-tile">
            <div><p><span id="crb-scanned-files" data-init="-">0</span><span id="crb-scanned-percentage" data-init=""></span></p>
                <p>Scanned</p></div>
        </div>
        <div class="scan-tile">
            <div><p id="crb-critical" data-init="-">0</p>
                <p><?php _e( 'Critical issues', 'wp-cerber' ); ?></p></div>
        </div>
        <div class="scan-tile">
            <div><p id="crb-warning" data-init="-">0</p>
                <p><?php _e( 'Issues total', 'wp-cerber' ); ?></p></div>
        </div>
        <div id="crb-scan-progress">
            <div>
                <div id="the-scan-bar"></div>
            </div>
        </div>

        <p id="crb-scan-message"><?php echo $msg; ?></p>

    </div>
    <div id="crb-scan-details">
        <table class="crb-table" id="crb-browse-files">
			<?php
			$rows = array();
			$rows[] = '<tr class="crb-scan-container" id="crb-wordpress" style=""><td colspan="6">WordPress</td></tr>';
			$rows[] = '<tr class="crb-scan-container" id="crb-muplugins" style=""><td colspan="6">Must use plugins</td></tr>';
			$rows[] = '<tr class="crb-scan-container" id="crb-dropins" style=""><td colspan="6">Drop-ins</td></tr>';
			$rows[] = '<tr class="crb-scan-container" id="crb-plugins" style=""><td colspan="6">Plugins</td></tr>';

			/*
			$plugins = get_plugins();
			foreach ( $plugins as $plugin ) {
				$rows[] = '<tr class="crb-scan-section" id="' . sha1( $plugin['Name'] ) . '" style="display:none;"></tr>';
			}
			*/
			$rows[] = '<tr class="crb-scan-container" id="crb-themes" style=""><td colspan="6">Themes</td></tr>';

			/*$themes = wp_get_themes();
			foreach ( $themes as $theme_folder => $theme ) {
				$rows[] = '<tr class="crb-scan-section" id="' . sha1( $theme->get( 'Name' ) ) . '" style="display:none;"></tr>';
			}*/

			$rows[] = '<tr class="crb-scan-container" id="crb-uploads" style=""><td colspan="6">Uploads folder</td></tr>';
			$rows[] = '<tr class="crb-scan-container" id="crb-unattended" style=""><td colspan="6">Unattended files</td></tr>';
			echo implode("\n",$rows);
			?>
        </table>
    </div>

	<?php

	cerber_ref_upload_form();
}

/**
 * Finalizes current AJAX request and sends data to the client
 *
 * @param $data array
 */
function cerber_end_ajax( $data = array() ) {
	global $cerber_db_errors;

	if ( ! $data ) {
		$data = array();
	}
	$data['cerber_db_errors'] = $cerber_db_errors;
	if (!$cerber_db_errors) $data['OK'] = 'OK!';
	echo json_encode( $data );

	wp_die();
}



// ======================================================================================================



function cerber_ref_upload_form() {
	?>
    <div id="crb-ref-upload-dialog" style="display: none;">
        <p><?php _e( 'We have not found any integrity data to verify', 'wp-cerber' ); ?> <span
                    id="ref-section-name"></span>.</p>
        <p><?php _e( "You have to upload a ZIP archive from which you've installed it. This enables the security scanner to verify the integrity of the code and detect malware.", 'wp-cerber' ); ?></p>
        <form enctype="multipart/form-data">
            <input type="file" name="refile" id="refile" required="required" accept=".zip">
            <input type="submit" name="submit" value="<?php _e( 'Upload file', 'wp-cerber' ); ?>"
                   class="button button-primary">
            <ul style="list-style: none;">
                <li style="display:none;" class="crb-status-msg">Uploading the file, please wait&#8230;</li>
                <li style="display:none;" class="crb-status-msg">Processing the file, please wait&#8230;</li>
            </ul>
        </form>
    </div>

    <?php
}

/**
 * Upload a reference ZIP archive for a theme or a plugin
 *
 */
add_action( 'wp_ajax_cerber_ref_upload', function () {

	cerber_check_ajax();

	//ob_start(); // Collecting possible junk warnings and notices cause we need clean JSON to be sent

	$error = '';

	$folder = cerber_get_tmp_file_folder();
	if ( is_wp_error( $folder ) ) {
		cerber_end_ajax( array( 'error' => $folder->get_error_message() ) );
	}

	if ( isset( $_FILES['refile'] ) ) {

		// Step 1, saving file

		if ( ! is_uploaded_file( $_FILES['refile']['tmp_name'] ) ) {
			$error = 'Unable to read uploaded file';
		}

		if ( ! cerber_check_extension( $_FILES['refile']['name'], array( 'zip' ) ) ) {
			$error = 'Incorrect file format';
		}

		if ( cerber_detect_exec_extension( $_FILES['refile']['name'] ) ) {
			$error = 'Incorrect file format';
		}

		if ( false !== strpos( $_FILES['refile']['name'], '/' ) ) {
			$error = 'Incorrect filename';
		}

		if ( $error ) {
			cerber_end_ajax( array( 'error' => $error ) );
		}

		if ( false === @move_uploaded_file( $_FILES['refile']['tmp_name'], $folder . $_FILES['refile']['name'] ) ) {
			cerber_end_ajax( array( 'error' => 'Unable to copy file to ' . $folder ) );
		}

	}
	else {

		// Step 2, creating hash

		$result = cerber_need_for_hash();
		if ( is_wp_error( $result ) ) {
			cerber_end_ajax( array( 'error' => $result->get_error_message() ) );
		}
	}

	cerber_end_ajax();

} );

// Process a manually installed/upgraded plugin/theme, part 1
add_filter( 'wp_insert_attachment_data', function ( $data, $postarr ) {
	global $crb_new_zip_file;
	if ( $postarr['context'] == 'upgrader' && $postarr['post_status'] == 'private' && isset( $postarr['file'] ) ) {
		$crb_new_zip_file = $postarr['file'];
	}

	return $data;
}, 10, 2 );

// Process a manually installed/upgraded plugin/theme, part 2
add_action( 'upgrader_process_complete', function ( $object, $extra ) {
	global $crb_new_zip_file;
	if ( empty( $crb_new_zip_file ) ) {
		return;
	}
	switch ( $extra['type'] ) {
		case 'plugin':
		case 'theme':
			if ( file_exists( $crb_new_zip_file ) ) {
				$tmp = cerber_get_tmp_file_folder();
				if ( ! is_wp_error( $tmp ) ) {
					$target_zip = $tmp . basename( $crb_new_zip_file );
					if ( copy( $crb_new_zip_file, $target_zip ) ) {
						wp_schedule_single_event( time() + 5 * MINUTE_IN_SECONDS, 'cerber_scheduled_hash', array( $target_zip ) );
						cerber_need_for_hash( $target_zip );
					}
					else {
					    // Error
                    }
				}
				else {
					// Error
                }
			}
			break;
	}

}, 10, 2 );

// Process a manually installed/upgraded plugin/theme, part 3
add_action( 'cerber_scheduled_hash', 'cerber_scheduled_hash' );
function cerber_scheduled_hash( $zip_file = '' ) {
	$result = cerber_need_for_hash( $zip_file );
	if ( is_wp_error( $result ) ) {
		//cerber_log( $result->get_error_message() );
	}
}

/**
 * Generate hash for an uploaded theme/plugin ZIP archive or for a specified ZIP file.
 * Hash will not be created if a theme/plugin is not installed on the website.
 *
 * @param string $zip_file Be used if set
 * @param bool $delete If true the source ZIP will be deleted
 * @param int $expires Timestamp when hash will expire, 0 = never
 *
 * @return bool|WP_Error
 */
function cerber_need_for_hash( $zip_file = '', $delete = true, $expires = 0 ) {
	$folder     = cerber_get_tmp_file_folder();
	$zip_folder = $folder . 'zip' . DIRECTORY_SEPARATOR;

	if ( ! $zip_file ) {
		if ( ! $files = glob( $folder . '*.zip' ) ) {
			return false;
		}
	}
	else {
		if ( ! is_array( $zip_file ) ) {
			$files = array( $zip_file );
		}
		else {
			$files = $zip_file;
		}
	}

	$fs = cerber_init_wp_filesystem();

	foreach ( $files as $zip_file ) {

		if ( ! file_exists( $zip_file ) ) {
			continue;
		}

		if ( file_exists( $zip_folder ) && ! $fs->delete( $zip_folder, true ) ) {
			return new WP_Error( 'cerber-zip', 'Unable to clean up temporary zip folder ' . $zip_folder );
		}

		$result = cerber_unzip( $zip_file, $zip_folder );

		if ( $delete ) {
			unlink( $zip_file );
		}

		if ( is_wp_error( $result ) ) {
			return new WP_Error( 'cerber-zip', 'Unable to unzip file ' . $zip_file . ' ' . $result->get_error_message() );
		}

		if ( ! $obj = cerber_detect_object( $zip_folder ) ) {
			return new WP_Error( 'cerber-file', 'File ' . basename( $zip_file ) . ' can not be used. Proper program code not found or version mismatch. Please upload another file.' );
		}

		$dir = $obj['src'] . DIRECTORY_SEPARATOR;
		$len = mb_strlen( $dir );

		global $the_file_list;
		$the_file_list = array();

		cerber_scan_directory( $dir, null, function ($list){
		    global $the_file_list;
			$the_file_list = array_merge( $the_file_list, $list );
        } );

		if ( empty( $the_file_list ) ) {
			return new WP_Error( 'cerber-dir', 'No files found in ' . $zip_file );
		}

		$hash = array();

		foreach ( $the_file_list as $file_name ) {
			$hash[ mb_substr( $file_name, $len ) ] = hash_file( 'sha256', $file_name );
		}

		if ( !$obj['single'] ) {
			$b = $obj['src'];
		}
		else {
			$b = $obj['file'];
		}

		//$key = $obj['type'] . sha1( $obj['name'] . basename( $obj['src'] ) );
		$key = $obj['type'] . sha1( $obj['name'] . basename( $b ) );

        if ( ! cerber_update_set( $key, array(
			'name' => $obj['name'],
			'ver'  => $obj['ver'],
			'hash' => $hash,
			'time' => time()
		), 0, true, $expires )
		) {
			return new WP_Error( 'cerber-zip', 'Database error occurred while saving hash' );
		}
	}

	$fs->delete( $zip_folder, true );
    unset($the_file_list);

	return true;
}

/**
 * Retrieve local hash for plugin or theme
 *
 * @param $key
 * @param $version
 *
 * @return bool|mixed
 */
function cerber_get_local_hash( $key, $version ) {
	if ( $local_hash = cerber_get_set( $key ) ) {
		if ( $local_hash['ver'] == $version ) {
			return $local_hash['hash'];
		}
	}

	return false;
}

/**
 * @return string|WP_Error Full path to the folder with trailing slash
 */
function cerber_get_tmp_file_folder() {
	$folder = cerber_get_the_folder();
	if ( is_wp_error( $folder ) ) {
		return $folder;
	}

	$folder = $folder . 'tmp' . DIRECTORY_SEPARATOR;

	if ( ! is_dir( $folder ) ) {
		if ( ! mkdir( $folder, 0755, true ) ) {
			// TODO: try to set permissions for the parent folder
			return new WP_Error( 'cerber-dir', 'Unable to create the tmp directory ' . $folder );
		}
	}

	return $folder;
}

/**
 * Return Cerber's folder. If there is no folder it will be created.
 *
 * @return string|WP_Error  Full path to the folder with trailing slash
 */
function cerber_get_the_folder() {
    static $ret;

	if ( $ret !== null ) {
		return $ret;
	}

	$opt = cerber_get_set( '_cerber_mnemosyne' );

	if ( $opt && isset( $opt[4] ) && isset( $opt[ $opt[4] ] ) ) {
		$key = preg_replace( '/[^a-z0-9]/i', '', $opt[ $opt[4] ] );
		if ( $key ) {
			$folder = cerber_get_upload_dir() . DIRECTORY_SEPARATOR . 'wp-cerber-' . $key . DIRECTORY_SEPARATOR;
			if ( is_dir( $folder ) ) {
				if ( ! wp_is_writable( $folder ) ) {
					if ( ! chmod( $folder, 0755 ) ) {
						return new WP_Error( 'cerber-dir', __( 'The directory is not writable', 'wp-cerber' ) . ' ' . $folder );
					}
				}
				cerber_lock_the_folder( $folder );

				$ret = $folder;
				return $ret;
			}
		}
	}

	// Let's create the folder

	$key    = substr( str_shuffle( '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ' ), 0, rand( 16, 20 ) );
	$folder = cerber_get_upload_dir() . DIRECTORY_SEPARATOR . 'wp-cerber-' . $key . DIRECTORY_SEPARATOR;

	if ( ! mkdir( $folder, 0755, true ) ) {
		// TODO: try to set permissions for the parent folder
		return new WP_Error( 'cerber-dir', __( 'Unable to create WP CERBER directory', 'wp-cerber' ) . ' ' . $folder );
	}

	if ( ! cerber_lock_the_folder( $folder ) ) {
		return new WP_Error( 'cerber-dir', 'Unable to lock the directory ' . $folder );
	}

	$k      = substr( str_shuffle( '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ' ), 0, rand( 16, 20 ) );
	$i      = rand( 5, 10 );
	if ( ! cerber_update_set( '_cerber_mnemosyne', array( rand( 0, 3 ) => $k, 4 => $i, $i => $key ) ) ) {
		return new WP_Error( 'cerber-dir', 'Unable to save option' );
	}

	$ret = $folder;
	return $ret;
}

/**
 * Make a folder not accessible from the web
 *
 * @param $folder string
 *
 * @return bool
 */
function cerber_lock_the_folder( $folder ) {
	if ( $f = fopen( $folder . '.htaccess', 'w' ) ) {
		if ( fwrite( $f, 'deny from all' ) ) {
			fclose( $f );

			return true;
		}
	}

	return false;
}

function cerber_unzip( $file_name, $folder ) {
	cerber_init_wp_filesystem();

	return unzip_file( $file_name, $folder );

}

/**
 * @return WP_Error|WP_Filesystem_Direct
 */
function cerber_init_wp_filesystem() {
	global $wp_filesystem;

	require_once( ABSPATH . 'wp-admin/includes/file.php' );

	add_filter( 'filesystem_method', '__ret_direct' );
	if ( ! WP_Filesystem() ) {
		return new WP_Error( 'cerber-file', 'Unable to init WP_Filesystem' );
	}
	remove_filter( 'filesystem_method', '__ret_direct' );

	return $wp_filesystem;
}

function __ret_direct() {
	return 'direct';
}

function cerber_detect_object( $folder = '' ) {

    // Look for a theme

	$the_folder = false;

	$dirs = glob( $folder . '*', GLOB_ONLYDIR );
	if ( $dirs ) {
		$the_folder = $dirs[0]; // we expect only one subfolder
		if ( ! file_exists( $the_folder ) ) {
			$the_folder = false;
		}
	}

	if ( $result = cerber_check_theme_data( $the_folder ) ) {
		return array(
			'type'   => CRB_HASH_THEME,
			'name'   => $result->get( 'Name' ),
			'ver'    => $result->get( 'Version' ),
			'src'    => $the_folder,
			'single' => false,
		);
	}

	// Look for a plugin

	$files = glob( $folder . '*.php' ); // single file plugin
	if ( ! $files && $the_folder ) { // plugin with folder
		$files = glob( $the_folder . DIRECTORY_SEPARATOR . '*.php' );
		$single = false;
	}
	else {
	    $single = true;
    }

	if ( ! $files ) {
		return false;
	}

	require_once( ABSPATH . 'wp-admin/includes/plugin.php' );
	foreach ( $files as $file_name ) {
		$plugin_data = get_plugin_data( $file_name );
		if ( ! empty ( $plugin_data['Name'] ) && ! empty ( $plugin_data['Version'] ) ) {
			foreach ( get_plugins() as $key => $plugin ) {
				if ( $plugin['Name'] == $plugin_data['Name'] && $plugin['Version'] == $plugin_data['Version'] ) {

					return array(
						'type'   => CRB_HASH_PLUGIN,
						'name'   => $plugin_data['Name'],
						'ver'    => $plugin_data['Version'],
						'data'   => $plugin_data,
						'src'    => dirname( $file_name ),
						'single' => $single,
						'file'   => $file_name
					);
				}
			}

		}
	}


	return false;
}

/**
 * @param string $folder A folder with theme files
 *
 * @return bool|WP_Theme
 */
function cerber_check_theme_data( $folder ) {

	$style = $folder . DIRECTORY_SEPARATOR . 'style.css';
	if ( ! file_exists( $style ) ) {
		return false;
	}

    // See class-wp-theme.php
	static $theme_headers = array(
		'Name'        => 'Theme Name',
		'ThemeURI'    => 'Theme URI',
		'Description' => 'Description',
		'Author'      => 'Author',
		'AuthorURI'   => 'Author URI',
		'Version'     => 'Version',
		'Template'    => 'Template',
		'Status'      => 'Status',
		'Tags'        => 'Tags',
		'TextDomain'  => 'Text Domain',
		'DomainPath'  => 'Domain Path',
	);
	$theme_folder = basename( $folder );
	$headers = get_file_data( $style, $theme_headers, 'theme' );
	// $headers['Version'] means just theme, $headers['Template'] means child theme
	if ( ! empty ( $headers['Name'] ) && ( ! empty ( $headers['Version'] ) || ! empty ( $headers['Template'] ) ) ) {
		$themes = wp_get_themes();
		foreach ( $themes as $the_folder => $theme ) {
			if ( $the_folder != $theme_folder ) {
				continue;
			}
			if ( $headers['Name'] == $theme->get( 'Name' ) ) {
				if ( ! empty ( $headers['Version'] ) && ( $headers['Version'] == $theme->get( 'Version' ) ) ) {
					return $theme;
				}
				if ( ! empty ( $headers['Template'] ) && ( $headers['Template'] == $theme->get( 'Template' ) ) ) {
					return $theme;
				}
			}
		}
	}

	return false;
}

/**
 * File viewer, server side AJAX
 *
 */
add_action( 'wp_ajax_cerber_view_file', function () {
	global $cerber_db_errors;

	cerber_check_ajax();

	$file_name = $_GET['file'];
	if ( ! @is_file( $file_name ) ) {
		wp_die( 'I/O Error' );
	}

	$file_size = filesize( $file_name );

	if ( $file_size > 8000000 ) {
		wp_die( 'Error: This file is too large to display.' );
	}

	if ( $file_size <= 0 ) {
		wp_die( 'The file is empty.' );
	}

	$scan_id = absint( $_GET['scan_id'] );

	$the_file = cerber_db_get_row( 'SELECT * FROM ' . cerber_get_db_prefix() . CERBER_SCAN_TABLE . ' WHERE scan_id = ' . $scan_id . ' AND file_name = "' . $file_name . '"' );

	if ( ! $the_file ) {
		wp_die( __( 'File access error. Possibly scan results are outdated. Please run Quick or Full Scan.', 'wp-cerber' ) );
	}

	if ( ! $source = file_get_contents( $file_name ) ) {
		wp_die( 'Error: Unable to load file.' );
	}

	$source = htmlspecialchars( $source, ENT_SUBSTITUTE );

	if ( ! $source ) {
		$source = 'Unable to display the contents of the file. This file contains non-printable characters.';
	}

	if ( cerber_detect_exec_extension( $file_name )
	     || cerber_check_extension( $file_name, array( 'js', 'css', 'inc' ) )
	     || cerber_is_htaccess( $file_name )
	) {
		$paint = true;
	}
	else {
		$paint = false;
	}

	$overlay = '';
	if ( $paint ) {
		$overlay = '<div id="crb-overlay">Loading, please wait...</div>';
	}

	$sh_url  = plugin_dir_url( __FILE__ ) . 'assets/sh/';
	$sheight = absint( $_GET['sheight'] ) - 100; // highlighter is un-responsible, so we need tell him the real height
	$c_height = absint( $_GET['sheight'] );

	?>
    <!DOCTYPE html><html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <script type="text/javascript" src="<?php echo $sh_url ?>scripts/shCore.js"></script>
        <script type="text/javascript" src="<?php echo $sh_url; ?>scripts/shBrushPhp.js"></script>
        <link href="<?php echo $sh_url; ?>styles/shCore.css" rel="stylesheet" type="text/css" />
        <link href="<?php echo $sh_url; ?>styles/shThemeDefault.css" rel="stylesheet" type="text/css" />
        <style type="text/css" media="all">
            body {
                overflow: hidden;
                font-family: 'Roboto', sans-serif;
                font-size: 14px;
            }

            #crb-overlay {
                display: flex;
                justify-content: center;
                align-items: center;
                text-align: center;
                background-color: #fff;
                position: fixed;
                width: 100%;
                height: 100%
                z-index: 2;
                top: 0;
                left: 0;
                right: 0;
                bottom: 0;
            }

            #crb-issue {
                border-left: 3px solid crimson;
                background-color: #eee;
                padding: 1em;
                overflow: auto;
            }

            #crb-file-content {
            <?php
            if (!$paint) {
                echo '
                max-height: '.$sheight .'px;
                overflow: auto;
                padding: 15px;
                ';
            }
            else {
                echo 'overflow: hidden;';
            }
            ?>
            }

            .syntaxhighlighter {
                max-height: <?php echo $sheight; ?>px;
            }

            .syntaxhighlighter code {
                font-family: Menlo, Consolas, Monaco, monospace !important;
                font-size: 13px !important;
            }

            .syntaxhighlighter .gutter .line{
                border-right: 3px solid #c7c7c7 !important;
            }

        </style>
    </head>

    <body>

	<?php

	echo $overlay;

	echo '<pre id="crb-file-content" class="brush: php; toolbar: false;">' . $source . '</pre>';

	if ( $the_file ) {
		echo '<div id="crb-issue">Issue: ' . cerber_get_issue_label( $the_file['scan_status'] ) . '</div>';
	}

	if ( $paint ) :
		?>

        <script type="text/javascript">
            SyntaxHighlighter.defaults["highlight"];
            SyntaxHighlighter.all();
            function crb_waitUntilRender() {
                var overlay = document.getElementById("crb-overlay").style.visibility = "hidden";
            }
            var intervalID = setInterval(crb_waitUntilRender, 200);


        </script>

		<?php

	endif;

	?>

    </body>
    </html>

	<?php

	wp_die();
} );


/**
 * Deleting files, server side AJAX
 *
 */
add_action( 'wp_ajax_cerber_scan_delete_files', function () {
	global $cerber_db_errors;

	cerber_check_ajax();

	if ( empty( $_POST['files'] ) || empty( $_POST['scan_id'] ) ) {
		wp_die( 'Error!' );
	}

	$scan_id = absint( $_POST['scan_id'] );

	if ( ! cerber_get_scan( $scan_id ) ) {
		wp_die( 'Error!' );
	}

	$list = array();
	$i = 0;
	$errors = array();

	foreach ( $_POST['files'] as $file_name ) {

		if ( ! is_file( $file_name ) ) {
			continue;
		}

		$the_file = cerber_db_get_row( 'SELECT * FROM ' . cerber_get_db_prefix() . CERBER_SCAN_TABLE . ' WHERE scan_id = ' . $scan_id . ' AND file_name = "' . $file_name . '"' );
		if ( ! $the_file ) {
			continue;
		}

		$result = cerber_quarantine_move( $file_name, $scan_id );
		if ( is_wp_error( $result ) ) {
			$errors[] = $result->get_error_message();
		}
        elseif ( ! $result ) {
			$errors[] = 'Not possible';
		}
		else {
			$i ++;
			$list[] = $file_name;
		}

	}

	cerber_end_ajax( array( 'errors' => $errors, 'number' => $i, 'deleted' => $list ) );

});
/**
 * Move files to the quarantine folder
 *
 * @param string $file_name
 * @param integer $scan_id
 *
 * @return bool|WP_Error
 */
function cerber_quarantine_move( $file_name, $scan_id ) {
	static $folder;

	$scan_id = absint( $scan_id );
	if ( ! is_file( $file_name ) || ! $scan_id ) {
		return false;
	}
	if ( ! cerber_can_be_deleted( $file_name, true ) ) {
		return new WP_Error( 'cerber-del', "This file can't be deleted: ". $file_name );
	}

	if ( $folder === null ) {
		$folder = cerber_get_the_folder();
	}
	if ( is_wp_error( $folder ) ) {
		return $folder;
	}

	$quarantine = $folder . 'quarantine' . DIRECTORY_SEPARATOR . $scan_id . DIRECTORY_SEPARATOR;

	if ( ! is_dir( $quarantine ) ) {
		if ( ! mkdir( $quarantine, 0755, true ) ) {
			// TODO: try to set permissions for the parent folder
			return new WP_Error( 'cerber-dir', 'Unable to create the quarantine directory ' . $quarantine );
		}
	}
	else {
		if ( ! chmod( $quarantine, 0755 ) ) {
			return new WP_Error( 'cerber-dir', 'Unable to set directory permissions for ' . $quarantine );
		}
	}

	if ( ! cerber_lock_the_folder( $quarantine ) ) {
		return new WP_Error( 'cerber-dir', 'Unable to lock the directory ' . $quarantine );
	}

	// Preserve original paths for deleted files in a restore file
	$restore = $quarantine . '.restore';
	if ( ! file_exists( $restore ) ) {
		if ( ! $f = fopen( $restore, 'w' ) ) {
			return new WP_Error( 'cerber-quar', 'Unable to create a restore file.' );
		}
		fwrite( $f, 'Information for restoring deleted files.' . PHP_EOL
		            . 'Deletion date | Deleted file => Original file to copy to restore.' . PHP_EOL
		            . '-----------------------------------------------------------------'
		            . PHP_EOL . `` );
	}
	else {
		if ( ! $f = fopen( $restore, 'a' ) ) {
			return new WP_Error( 'cerber-quar', 'Unable to write to the restore file.');
		}
	}

	// Avoid file name collisions
	$new_name = $quarantine . basename( $file_name );
	if ( file_exists( $new_name ) ) {
		$i = 2;
		while ( file_exists( $new_name ) ) {
			$new_name = $quarantine . basename( $file_name ) . '.' . $i;
			$i ++;
		}
	}

	if ( ! @rename( $file_name, $new_name ) ) {
		return new WP_Error( 'cerber-quar', 'Unable to move file ' . $file_name . '. Check the file folder permissions.' );
	}

	// Save restoring info
	fwrite( $f, PHP_EOL . cerber_date( time() ) . ' | ' . basename( $new_name ) . ' => ' . $file_name );
	fclose( $f );

	return true;
}

/**
 * Some files can't be deleted...
 *
 * @param $file_name
 * @param bool $check_inclusion
 *
 * @return bool
 */
function cerber_can_be_deleted( $file_name, $check_inclusion = false ) {
	static $abspath;

	if ( ! file_exists( $file_name ) || ! is_file( $file_name ) || is_link( $file_name ) ) {
		return false;
	}

	if ( cerber_is_htaccess( $file_name ) || cerber_is_dropin( $file_name ) ) {
		return false;
	}

	if ( $check_inclusion && in_array( $file_name, get_included_files() ) ) {
		return false;
	}

	if ( basename( $file_name ) == 'wp-config.php' ) {
		if ( $abspath !== null ) {
			$abspath = cerber_get_abspath();
		}
		$file_name = cerber_normal_path( $file_name );

		if ( $file_name == $abspath . 'wp-config.php' ) {
			return false;
		}
		if ( ! file_exists( $abspath . 'wp-config.php' ) && $file_name == dirname( $abspath ) . DIRECTORY_SEPARATOR . 'wp-config.php' ) {
			return false;
		}
	}

	return true;
}

/**
 * Is time for current step is over?
 *
 * @param int $limit
 *
 * @return bool True if the time of execution of the current step is over
 */
function cerber_exec_timer( $limit = CERBER_MAX_SECONDS) {
	static $start;
	if ( $start === null ) {
		$start = time();
	}

	if ( $limit == CERBER_MAX_SECONDS && cerber_is_cloud_request() ) {
		$limit = CERBER_MAX_SECONDS_CLOUD;
	}

	if ( ( time() - $start ) > $limit ) {
		return true;
	}

	return false;
}

function cerber_scan_msg( $id, $txt = '' ) {
	$m = array( __( 'Unable to open file', 'wp-cerber' ) );

	$ret = '???';
	if ( isset( $m[ $id ] ) ) {
		$ret = $m[ $id ];
	}
	if ( $txt ) {
		//sprintf()
		$ret .= ' ' . $txt;
	}

	return $ret;
}

/**
 * Return the number of node if the request is originated from the Cerber Cloud, false otherwise
 *
 * @return bool|integer
 */
function cerber_is_cloud_request() {
	static $ret = null;

	if ( $ret !== null) {
		return $ret;
	}

	if ( ! cerber_is_http_post() || empty( $_POST['cerber-cloud-key'] ) ) {
		$ret = false;

		return $ret;
	}

	$key = lab_get_key();
	if ( ! isset( $key[4] ) ) {
		$key = lab_get_key( true );
	}
	if ( $key[4] != $_POST['cerber-cloud-key'] ) {
		$ret = false;

		return $ret;
	}

	$ret = lab_get_real_node_id();

    return $ret;
}


// TODO: debug, remove from production!
/*
add_action( 'init', function () {
	if ( ! empty( $_GET['scan-report'] ) && is_user_logged_in() ) {
		$scan   = cerber_get_scan();
		$report = cerber_scan_report( $scan );
		if ( ! $report ) {
			echo 'Nothing to report';
		}
		echo $report;
		//cerber_send_email( 'scan', $report );
		die();
	}
} );
*/

/**
 * Creates a user report
 *
 * @param array $scan
 *
 * @return bool|string False if there is nothing to report
 */
function cerber_scan_report( $scan ) {
	global $cerber_scan_mode;

	$include = crb_get_settings( 'scan_reinc' );

	$severity = array_intersect_key( array( 0, 1, 2, 3 ), $include ); // Severity are 0-4
	$types    = array_keys( $include );

	if ( ! $last_filtered = cerber_filter_issues( $scan, $types, $severity ) ) {
		return false;
	}

	$for_report = $last_filtered;

	if ( ! $cerber_scan_mode ) {
		$cerber_scan_mode = $scan['mode'];
	}
	if ( $prev_id = cerber_get_prev_scan_id( $scan['id'] ) ) {
		$prev_scan = cerber_get_scan( $prev_id );
	}
	else {
		$prev_scan = null;
    }

	$re = crb_get_settings( 'scan_relimit' );
	$prev_filtered = null;
	if ( $re > 1 ) {
		if ( $prev_scan ) {
			$prev_filtered = cerber_filter_issues( $prev_scan, $types, $severity );
		}
	}

	if ( $prev_filtered ) {
		switch ( $re ) {
			case 3:
				$last_comp = $last_filtered;
				// Remove "xx ago" that always changing from scan to scan and affect checksum
				array_walk_recursive( $last_comp, function ( &$e, $key ) {
					if ( $key === 'time' ) {
						$e = '';
					}
				} );
				array_walk_recursive( $prev_filtered, function ( &$e, $key ) {
					if ( $key === 'time' ) {
						$e = '';
					}
				} );
				$hash1 = sha1( serialize( $last_comp ) );
				$hash2 = sha1( serialize( $prev_filtered ) );
				if ( $hash1 == $hash2 ) {
					return false;
				}
				break;
			case 5:
				$for_report = cerber_get_new_issues( $prev_filtered, $last_filtered );
				break;
		}
	}

	if ( ! $for_report ) {
		return false;
	}


	// Generating the report

	$base_url = cerber_admin_link( 'scanner' );
	$site_name = ( is_multisite() ) ? get_site_option( 'site_name' ) : get_option( 'blogname' );

	$css_table = 'width: 95%; max-width: 1000px; margin:0 auto; margin-bottom: 10px; background-color: #f5f5f5; text-align: center; color: #000; font-family: Arial, Helvetica, sans-serif;';
	$css_td = 'padding: 0.5em 0.5em 0.5em 1em; text-align: left;';
	$css_border = 'border-bottom: solid 2px #f9f9f9;';

	$ret = '';

	$mode = ( $scan['mode'] == 'full' ) ? __( 'Full Scan Report', 'wp-cerber' ) : __( 'Quick Scan Report', 'wp-cerber' );
	$mode = '<a href="' . $base_url . '">' . $mode . '</a>';

	// Summary
	$summary[] = '';

	$diff = '';
	if ( ! empty( $prev_scan['scanned']['files'] ) ) {
		$d = $scan['scanned']['files'] - $prev_scan['scanned']['files'];
		if ( absint( $d ) > 0 ) {
			$diff = ' (' . ( ( $d > 0 ) ? '+' . $d : $d ) . ')';
		}
	}
	$summary[] = __( 'Files scanned', 'wp-cerber' ) . ' <b>' . $scan['scanned']['files'] . '</b>' . $diff;

	// TODO: refactor, keep the counter it in $scan
	$tot = 0;
	foreach ( $scan['issues'] as $sec ) {
		foreach ( $sec['issues'] as $i ) {
			if ( $i[0] > CERBER_FOK ) {
				$tot ++;
			}
		}
	}

	$diff = '';
	if ( ! empty( $prev_scan['issues'] ) ) {
		$prev_tot = 0;
		foreach ( $prev_scan['issues'] as $sec ) {
			foreach ( $sec['issues'] as $i ) {
				if ( $i[0] > CERBER_FOK ) {
					$prev_tot ++;
				}
			}
		}

		if ( $prev_tot ) {
			$d = $tot - $prev_tot;
			if ( absint( $d ) > 0 ) {
				$diff = ' (' . ( ( $d > 0 ) ? '+' . $d : $d ) . ')';
			}
		}
	}

	$summary[] = __( 'Issues total', 'wp-cerber' ) . ' <b>' . $tot . '</b>'.$diff;
	$summary = implode(' &nbsp;|&nbsp; ',$summary);


	$ret .= '<div style="' . $css_table . '"><div style="margin:0 auto; text-align: center;"><p style="font-size: 130%; padding-top: 0.5em;">' . $site_name . '</p><p style="padding-bottom: 1em;">' . $mode . $summary . '</p></div></div>';

	// Issues

	$isize = crb_get_settings( 'scan_isize' );
	$cols = ( $isize ) ? 3 : 2;
	$table = cerber_get_db_prefix() . CERBER_SCAN_TABLE;

	if ( $for_report ) {
		$conames        = array( 'crb-plugins' => 'plugin', 'crb-themes' => 'theme', 'crb-wordpress' => 'files' );
		$rows           = array();
		//$rows[] = '<td style="'.$css_td.$css_border.'" colspan="2"><p style="line-height: 1.5em; font-weight: bold;">Issues</p></td>';
		foreach ( $for_report as $section_id => $section ) {
			$section_items = array();
			$extra         = '';
			$vlist         = '';
			$c             = ( isset( $conames[ $section['container'] ] ) ) ? ' ' . $conames[ $section['container'] ] : '';
			//$rows[] = '<td style="' . $css_border . $css_td . '" colspan="'.$cols.'"><b>' . $section['name'] . $c . '</b></td>';
			$i              = 0;
			foreach ( $section['issues'] as $k=>$issue ) {
				if ( $issue[0] < 10 ) {
					if ( $issue[0] == CERBER_VULN ) {
						$vlist .= $issue[1] . '<br/>';
					}
					else {
					    $extra .= cerber_get_html_label($issue[0]);
					}
					continue;
				}
				$i ++;
				$color = ( $issue[2] > 2 ) ? ' color: #dd1320;' : '';
				//$bgcolor = ( $i % 2 == 0 ) ? ' bgcolor: #fff;' : '';
				$size = '';
				if ( $isize ) {
					$size_diff = '';
					if ( $issue[0] !== 51 && $prev_id ) {
						$psize = cerber_db_get_var( 'SELECT file_size FROM ' . $table . ' WHERE scan_id = ' . $prev_id . ' AND file_name_hash = "' . sha1( $issue['data']['name'] ) . '"' );
						if ( is_numeric( $psize ) ) {
							$diff = $issue['data']['bytes'] - $psize;
							if ( absint( $diff ) > 0 ) {
								$size_diff = crb_size_format( $diff );
								$size_diff = ' (' . ( ( $diff > 0 ) ? '+' . $size_diff : '-' . $size_diff ) . ')';
							}
						}
					}
					$size = '<td>' . $issue['data']['size'] . $size_diff . '</td>';
				}
				//$rows[] = '<td style="' . $css_border . $css_td . ' font-size:94%; font-family:  Menlo, Consolas, Monaco, monospace;">' . $single_issue[1] . '</td><td style="padding: 0.5em; text-align: center; ' . $color . $css_border . '">' . cerber_get_issue_label( $single_issue[0] ) . '</td>'.$size;
				$section_items[] = '<td style="' . $css_border . $css_td . ' font-size:94%; font-family:  Menlo, Consolas, Monaco, monospace;">' . $issue[1] . '</td><td style="padding: 0.5em; text-align: center; ' . $color . $css_border . '">' . cerber_get_issue_label( $issue[0] ) . '</td>' . $size;
			}
			/*
			if ( ! $i ) {
				array_pop( $rows );
			}*/
			if ( $section_items || $vlist ) {
				if ( $vlist ) {
					$extra = cerber_get_html_label( CERBER_VULN ) . $extra;
				}
				$rows[] = '<td style="' . $css_border . $css_td . '" colspan="' . $cols . '"><b>' . $section['name'] . $c . '</b>' . $extra . '<p>' . $vlist . '</p></td>';
				$rows   = array_merge( $rows, $section_items );
			}
		}

		if ( ! $rows ) {
			return false;
		}

		$ret .= '<table style="border-collapse: collapse; ' . $css_table . '"><tr>' . implode( '</tr><tr>', $rows ) . '</tr></table>';
	}

	// Errors

	if ( crb_get_settings( 'scan_ierrors' ) && $scan['errors']) {
		$ret .= '<table style="' . $css_table . '"><tr><td style="'.$css_td.' font-size:80%;" ><p style="font-weight: bold; margin:0;">Some errors occurred during the scan</p><ol style="padding-left: 1em;"><li>'.implode('</li><li>',$scan['errors']).'</li></ol></td></tr></table>';
	}

	$ret = '<div style="width:100%; padding: 1em; margin:0; text-align: center; background-color: #f9f9f9;">' . $ret . '</div>';

	$ret .= '<p>' . __( 'To view full report visit', 'wp-cerber' ) . ' <a href="' . $base_url . '">' . $base_url . '</a></p>';

	return $ret;

}

/**
 * Filter out a list of issues for a user report
 *
 * @param array $scan
 * @param array $types
 * @param array $severity
 *
 * @return array
 */
function cerber_filter_issues( $scan, $types, $severity ) {
	//$scan = cerber_get_scan($scan_id);
	$result = array();
	if ( empty( $scan['issues'] ) ) {
		return $result;
	}
	if ( $scan['issues'] ) {
		foreach ( $scan['issues'] as $section_id => $section ) {
		    $list = array();
			$sec_details = array();
			foreach ( $section['issues'] as $issue ) {
			    if ( in_array( $issue[2], $severity ) ) {
				    $list[] = $issue;
				    continue;
				}
                if ( in_array( $issue[0], $types ) ) {
	                $list[] = $issue;
	                continue;
				}
                if ( $issue[3] && in_array( $issue[3], $types ) ) {
	                $list[] = $issue;
	                continue;
				}
				if ( $issue[0] < 10 ) {
					$sec_details[] = $issue;
				}
			}

			if ( $list ) {
				$list = array_merge( $sec_details, $list );
				$result[ $section_id ]           = $section;
				$result[ $section_id ]['issues'] = $list;
			}
		}
	}

	return $result;
}

function cerber_get_new_issues( $list_a, $list_b ) {
	$ret = array();
	foreach ( $list_b as $key => $new ) {
		if ( ! isset( $list_a[ $key ] ) ) {
			$ret[ $key ] = $new;
			continue;
		}

		$new_elements = array();
		foreach ( $new['issues'] as $i => $b_issue ) {
			if ( ! empty( $b_issue[1] ) ) {
				$found = 0;
				foreach ( $list_a[ $key ]['issues'] as $a_issue ) {
					if ( $a_issue['data']['name'] == $b_issue['data']['name'] ) {
						$found = 1;
						break;
					}
				}
				if ( ! $found ) {
					$new_elements[] = $i;
				}
			}
		}

		if ( $new_elements ) {
			$ret[ $key ] = $new;
			$all         = array_keys( $new['issues'] );
			$diff        = array_diff( $all, $new_elements );

			foreach ( $diff as $i ) {
				unset( $ret[ $key ]['issues'][ $i ] );
			}
		}

	}

	return $ret;
}

function cerber_check_vulnerabilities( $plugin_slug, $plugin ) {
	if ( strpos( $plugin_slug, '.' ) ) {
		return false;
	}
	$ret = cerber_get_vulnerabilities( $plugin_slug, $plugin );
	if ( ! $ret ) {
		$ret = false;
	}

	return $ret;
}

function cerber_get_vulnerabilities( $plugin_slug, $plugin ) {
	$ret = false;
	$key = 'crb_vuln_' . sha1( $plugin_slug );
	$vu = cerber_get_set( $key );
	if ( ! $vu ) {
		if ( ! $json = @file_get_contents( CERBER_VULNDB_API . $plugin_slug ) ) {
			return $ret;
		}
		if ( ! $vu = json_decode( $json, true ) ) {
			return $ret;
		}
		cerber_update_set( $key, $vu, null, true, time() + 7200 );
	}

	$v_list = false;

	if ( !empty( $vu[ $plugin_slug ]['vulnerabilities'] ) ) {
		$v_list = $vu[ $plugin_slug ]['vulnerabilities'];
	}

	if ( ! is_array( $v_list ) ) {
		return $ret;
	}

	$ret = array();
	foreach ( $v_list as $v ) {
		$r = array();
		if ( version_compare( $v['fixed_in'], $plugin['Version'], '>' ) ) {
			$r['n'] = $v['title'];
			$r['l'] = 'https://wpvulndb.com/vulnerabilities/' . $v['id'] . '/';
			$r['t'] = "Type: ".$v['vuln_type'];
			$r['p'] = 'Published: ' . date( get_option( 'date_format' ), strtotime( $v['published_date'] ) );
			$r['f'] = "Fixed in version: " . $v['fixed_in'];
			if ( ! empty( $v['references']['url'] ) ) {
				$r['r'] = $v['references']['url'];
			}
		}
		if ( ! empty( $r ) ) {
			$ret[] = $r; //implode( '<br/>', $r );
		}
	}

	/*if ( ! empty( $report ) ) {
		$ret = '<h3 style="color:#FF0000">Vulnerability found!</h3>You need to update this plugin immediately! <ol><li>' . implode( '</li><li>', $report ) . '</li></ol><p>Information provided by <a href="https://wpvulndb.com/">WPScan Vulnerability Database</a></p>';
	}*/

	return $ret;
}

function cerber_make_numbers( &$update = array(), &$scan = array() ) {
	if ( ! isset( $scan['numbers'] ) ) {
		$update['numbers'] = array();
	}
	else {
		$update['numbers'] = $scan['numbers'];
    }
	foreach ( $scan['step_issues'] as $set ) {
		if ( $set['setype'] != 21 ) {
		    foreach ( $set['issues'] as $issue ) {
			    if ( ! isset( $update['numbers'][ $issue[0] ] ) ) {
				    $update['numbers'][ $issue[0] ] = 0;
			    }
			    $update['numbers'][ $issue[0] ] ++;
			    // extra issue
			    if ( ! empty( $issue[3] ) ) {
				    if ( ! isset( $update['numbers'][ $issue[3] ] ) ) {
					    $update['numbers'][ $issue[3] ] = 0;
				    }
				    $update['numbers'][ $issue[3] ] ++;
			    }
		    }
	    }
	    else {
		    if ( ! isset( $update['numbers'][ CERBER_USF ] ) ) {
			    $update['numbers'][ CERBER_USF] = 0;
		    }
		    $update['numbers'][ CERBER_USF ] += count( $set['issues'] );
        }
	}

}

function cerber_show_quarantine() {

	$folder = cerber_get_the_folder();
	if ( is_wp_error( $folder ) ) {
		echo $folder->get_error_message();

		return;
	}

	$no_files = __( 'There are no files in the quarantine at the moment.', 'wp-cerber' );
	$per_page = cerber_get_per_page();
	$first    = ( cerber_get_pn() - 1 ) * $per_page;
	$last     = $first + $per_page;
	$list     = array();

	if ( ! $dirs = glob( $folder . 'quarantine' . DIRECTORY_SEPARATOR . '*', GLOB_ONLYDIR ) ) {
		echo $no_files;

		return;
	}

	$count = 0;
	foreach ( $dirs as $dir ) {
		$f = $dir . '/.restore';
		$scan_id = basename( $dir );
		if ( file_exists( $f ) && $handle = @fopen( $f, "r" ) ) {
			$ln = 0;
			while ( ( $line = fgets( $handle ) ) !== false ) {
				$ln ++;
				if ( $ln <= 4 || empty( $line ) ) {
					continue;
				}
				$line = trim( $line );
				if ( empty( $line ) ) {
					continue;
				}
				$v = crb_parse_qline( $dir, $line );
				if ( $v ) {
					if ( $count >= $first && $count <= $last ) {
						$v['scan_id'] = $scan_id;
						$list[]       = $v;
					}
					$count ++;
				}
			}
			if ( ! feof( $handle ) ) {
				echo "Error: unexpected I/O Error";
			}
			fclose( $handle );
		}
	}

	if ( ! $list ) {
		echo $no_files;

		return;
	}

	//echo nl2br( print_r( $list, 1 ) );

	$rows     = array();
	$ofs = get_option( 'gmt_offset' ) * 3600;
	$confirm = ' onclick="return confirm(\'' . __( 'Are you sure?', 'wp-cerber' ) . '\');"';

	foreach ( $list as $file ) {
		$delete  = wp_nonce_url( add_query_arg( array(
			'crb-qdo'   => 'delete',
			'crb-qscan' => $file['scan_id'],
			'crb-qfile' => $file['qfile']
		) ), 'control', 'cerber_nonce' );
		$restore = ( ! $file['can'] ) ? '' : ' &nbsp;|&nbsp; <a ' . $confirm . ' href="' . wp_nonce_url( add_query_arg( array(
				'crb-qdo'   => 'restore',
				'crb-qscan' => $file['scan_id'],
				'crb-qfile' => $file['qfile']
			) ), 'control', 'cerber_nonce' ) . '">' . __( 'Restore', 'wp-cerber' ) . '</a>';
		$moved   = strtotime( $file['date'] ) - $ofs;
		$will    = cerber_auto_date( $file['scan_id'] + DAY_IN_SECONDS * crb_get_settings( 'scan_qcleanup' ) );
		$rows[]  = '<td><span title="' . cerber_date( $file['scan_id'] ) . '">' . cerber_auto_date( $file['scan_id'] ) . '</span></td><td><span title="' . cerber_date( $moved ) . '">' . cerber_auto_date( $moved ) . '</span></td><td>' . $will . '</td><td>' . $file['size'] . '</td><td>' . $file['source'] . '</td><td><a ' . $confirm . ' href="' . $delete . '">' . __( 'Delete permanently', 'wp-cerber' ) . '</a>' . $restore . '</td>';
	}

	$heading = array(
		__( 'Scanned', 'wp-cerber' ),
		__( 'Moved to quarantine', 'wp-cerber' ),
		__( 'Automatic deletion', 'wp-cerber' ),
		__( 'Size', 'wp-cerber' ),
		__( 'File', 'wp-cerber' ),
		__( 'Action', 'wp-cerber' ),
	);


	$titles = '<tr><th>' . implode( '</th><th>', $heading ) . '</th></tr>';

	$table = '<table class="widefat crb-table cerber-margin"><thead>' . $titles . '</thead><tfoot>' . $titles . '</tfoot>' . implode( '</tr><tr>', $rows ) . '</tr></table>';

	$table .= cerber_page_navi( $count, $per_page );

	//$showing = '<h3>' . sprintf( __( 'Showing last %d records from %d', 'wp-cerber' ), count( $rows ), $count ) . '</h3>';

	//$table .= '<div class="cerber-margin"><p><b>' . __( 'Hint', 'wp-cerber' ) . ':</b> ' . __( 'To view activity, click on the IP', 'wp-cerber' ) . '</p></div>';

	echo $table;
}

function cerber_quarantine_do( $what, $scan_id, $qfile ) {
	$scan_id = absint( $scan_id );
	if ( ! $scan_id ) {
		cerber_admin_notice( 'Error: Wrong scan parameters.' );

		return;
	}
	$dir = cerber_get_the_folder() . 'quarantine' . DIRECTORY_SEPARATOR . $scan_id;

	$file   = $dir . DIRECTORY_SEPARATOR . $qfile;
	if ( ! @is_file( $file ) ) {
		cerber_admin_notice( 'Error: No file to process' );

		return;
	}

	$rst = $dir . '/.restore';
	if ( ! file_exists( $rst ) || ! $handle = @fopen( $rst, 'r' ) ) {
		cerber_admin_notice( 'Error: A restore registry file is corrupt or missing.' );

		return;
	}

	$data = null;
	while ( ( $line = fgets( $handle ) ) !== false ) {
		if ( $p = crb_parse_qline( $dir, $line ) ) {
			if ( $p['qfile'] == $qfile ) {
			    $data = $p;
				break;
			}
		}
	}

	if ( ! $data ) {
		cerber_admin_notice( 'Error: No information about this file. Unable to proceed.' );

		return;
	}

	$err = null;
	$msg = null;
	switch ( $what ) {
		case 'delete':
			if ( unlink( $file ) ) {
				$msg = __( 'The file has been deleted permanently.', 'wp-cerber' );
			}
			else {
				$err = 'Unable to delete the file: ' . $file;
			}
			break;
		case 'restore':
			if ( $data['can'] ) {
				if ( @rename( $file, $data['source'] ) ) {
					$msg = __( 'The file has been restored to its original location.', 'wp-cerber' );
				}
				else {
					$err = 'A file error occurred while restoring the file. Check permissions of folders.';
				}
			}
			else {
				$err = 'This file cannot be restored and needs to be manually copied. <p>See instructions in this file: ' . $rst . '</p>';
			}
			break;
	}
	if ( $err ) {
		cerber_admin_notice( $err );
	}
	if ( $msg ) {
		cerber_admin_message( $msg );
	}
}

function crb_parse_qline( $dir, $line ) {
	list( $date, $info ) = explode( '|', $line );
	list( $qfile, $source ) = explode( '=>', $info );
	$date = trim( $date );
	$qfile = trim( $qfile );
	$source = trim( $source );
	if ( ! $qfile ) {
		return false;
	}
	$fname = $dir . '/' . $qfile;
	if ( ! @is_file( $fname ) ) {
		return false;
	}
	$size   = @filesize( $fname );
	$size   = ( is_numeric( $size ) ) ? $size : 0;
	$sdir   = dirname( $source ) . DIRECTORY_SEPARATOR;
	$can    = ( file_exists( $sdir ) ) ? true : false;
	if ( $can ) {
		$can = ( file_exists( $source ) ) ? false : true;
	}

	$ret = array(
		'date'   => $date,
		'size'   => crb_size_format( $size ),
		'qfile'  => $qfile,
		'source' => $source,
		'sdir'   => $sdir,
		'can'    => $can
	);

	return $ret;
}