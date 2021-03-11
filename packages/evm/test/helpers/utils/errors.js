const DISPUTE_MANAGER_ERRORS = {
  VOTER_WEIGHT_ZERO: 'DM_VOTER_WEIGHT_ZERO',
  SENDER_NOT_VOTING: 'DM_SENDER_NOT_VOTING',
  TERM_OUTDATED: 'DM_TERM_OUTDATED',
  SUBJECT_NOT_DISPUTE_SUBJECT: 'DM_SUBJECT_NOT_DISPUTE_SUBJECT',
  DISPUTE_DOES_NOT_EXIST: 'DM_DISPUTE_DOES_NOT_EXIST',
  CANNOT_CLOSE_EVIDENCE_PERIOD: 'DM_CANNOT_CLOSE_EVIDENCE_PERIOD',
  EVIDENCE_PERIOD_IS_CLOSED: 'DM_EVIDENCE_PERIOD_IS_CLOSED',
  INVALID_DISPUTE_STATE: 'DM_INVALID_DISPUTE_STATE',
  INVALID_RULING_OPTIONS: 'DM_INVALID_RULING_OPTIONS',
  DEPOSIT_FAILED: 'DM_DEPOSIT_FAILED',
  BAD_MAX_DRAFT_BATCH_SIZE: 'DM_BAD_MAX_DRAFT_BATCH_SIZE',
  ROUND_IS_FINAL: 'DM_ROUND_IS_FINAL',
  ROUND_DOES_NOT_EXIST: 'DM_ROUND_DOES_NOT_EXIST',
  INVALID_ADJUDICATION_STATE: 'DM_INVALID_ADJUDICATION_STATE',
  ROUND_ALREADY_DRAFTED: 'DM_ROUND_ALREADY_DRAFTED',
  ERROR_DRAFT_TERM_NOT_REACHED: 'DM_DRAFT_TERM_NOT_REACHED',
  ROUND_NOT_APPEALED: 'DM_ROUND_NOT_APPEALED',
  INVALID_APPEAL_RULING: 'DM_INVALID_APPEAL_RULING',
  PREV_ROUND_NOT_SETTLED: 'DM_PREVIOUS_ROUND_NOT_SETTLED',
  ROUND_ALREADY_SETTLED: 'DM_ROUND_ALREADY_SETTLED',
  ROUND_PENALTIES_NOT_SETTLED: 'DM_ROUND_PENALTIES_NOT_SETTLED',
  GUARDIAN_ALREADY_REWARDED: 'DM_GUARDIAN_ALREADY_REWARDED',
  WONT_REWARD_NON_VOTER_GUARDIAN: 'DM_WONT_REWARD_NON_VOTER_GUARD',
  WONT_REWARD_INCOHERENT_GUARDIAN: 'DM_WONT_REWARD_INCOHERENT_GUARD',
  APPEAL_ALREADY_SETTLED: 'DM_APPEAL_ALREADY_SETTLED'
}

const VOTING_ERRORS = {
  VOTE_ALREADY_EXISTS: 'CRV_VOTE_ALREADY_EXISTS',
  VOTE_DOES_NOT_EXIST: 'CRV_VOTE_DOES_NOT_EXIST',
  VOTE_ALREADY_COMMITTED: 'CRV_VOTE_ALREADY_COMMITTED',
  VOTE_ALREADY_REVEALED: 'CRV_VOTE_ALREADY_REVEALED',
  INVALID_OUTCOME: 'CRV_INVALID_OUTCOME',
  INVALID_OUTCOMES_AMOUNT: 'CRV_INVALID_OUTCOMES_AMOUNT',
  INVALID_COMMITMENT_SALT: 'CRV_INVALID_COMMITMENT_SALT',
  SENDER_NOT_DELEGATE: 'CRV_SENDER_NOT_DELEGATE',
  OWNER_MOCK_COMMIT_CHECK_REVERTED: 'CRV_OWNER_MOCK_COMMIT_CHECK_REVERTED'
}

const REGISTRY_ERRORS = {
  NOT_CONTRACT: 'GR_NOT_CONTRACT',
  INVALID_ZERO_AMOUNT: 'GR_INVALID_ZERO_AMOUNT',
  INVALID_ACTIVATION_AMOUNT: 'GR_INVALID_ACTIVATION_AMOUNT',
  INVALID_DEACTIVATION_AMOUNT: 'GR_INVALID_DEACTIVATION_AMOUNT',
  INVALID_LOCKED_AMOUNTS_LENGTH: 'GR_INVALID_LOCKED_AMOUNTS_LEN',
  INVALID_REWARDED_GUARDIANS_LENGTH: 'GR_INVALID_REWARD_GUARDIANS_LEN',
  ACTIVE_BALANCE_BELOW_MIN: 'GR_ACTIVE_BALANCE_BELOW_MIN',
  NOT_ENOUGH_AVAILABLE_BALANCE: 'GR_NOT_ENOUGH_AVAILABLE_BALANCE',
  CANNOT_REDUCE_DEACTIVATION_REQUEST: 'GR_CANT_REDUCE_DEACTIVATION_REQ',
  TOKEN_TRANSFER_FAILED: 'GR_TOKEN_TRANSFER_FAILED',
  TOKEN_APPROVE_NOT_ALLOWED: 'GR_TOKEN_APPROVE_NOT_ALLOWED',
  BAD_TOTAL_ACTIVE_BALANCE_LIMIT: 'GR_BAD_TOTAL_ACTIVE_BAL_LIMIT',
  TOTAL_ACTIVE_BALANCE_EXCEEDED: 'GR_TOTAL_ACTIVE_BALANCE_EXCEEDED',
  DEACTIVATION_AMOUNT_EXCEEDS_LOCK: 'GR_DEACTIV_AMOUNT_EXCEEDS_LOCK',
  CANNOT_UNLOCK_ACTIVATION: 'GR_CANNOT_UNLOCK_ACTIVATION',
  ZERO_LOCK_ACTIVATION: 'GR_ZERO_LOCK_ACTIVATION',
  UNLOCK_ACTIVATION_ZERO: 'GR_UNLOCK_ACTIVATION_ZERO',
  LOCK_MANAGER_NOT_ALLOWED: 'GR_LOCK_MANAGER_NOT_ALLOWED',
  WITHDRAWALS_LOCK: 'GR_WITHDRAWALS_LOCK'
}

const TREASURY_ERRORS = {
  DEPOSIT_AMOUNT_ZERO: 'TREASURY_DEPOSIT_AMOUNT_ZERO',
  WITHDRAW_FAILED: 'TREASURY_WITHDRAW_FAILED',
  WITHDRAW_AMOUNT_ZERO: 'TREASURY_WITHDRAW_AMOUNT_ZERO',
  WITHDRAW_INVALID_AMOUNT: 'TREASURY_WITHDRAW_INVALID_AMOUNT',
  WITHDRAWALS_DISALLOWED: 'TREASURY_WITHDRAWALS_DISALLOWED'
}

const PAYMENTS_BOOK_ERRORS = {
  COURT_HAS_NOT_STARTED: 'PB_COURT_HAS_NOT_STARTED',
  NON_PAST_PERIOD: 'PB_NON_PAST_PERIOD',
  PERIOD_DURATION_ZERO: 'PB_PERIOD_DURATION_ZERO',
  PERIOD_BALANCE_DETAILS_NOT_COMPUTED: 'PB_PER_BAL_DETAILS_NOT_COMPUTED',
  PAYMENT_AMOUNT_ZERO: 'PB_PAYMENT_AMOUNT_ZERO',
  ETH_DEPOSIT_AMOUNT_MISMATCH: 'PB_ETH_DEPOSIT_AMOUNT_MISMATCH',
  ETH_DEPOSIT_TOKEN_MISMATCH: 'PB_ETH_DEPOSIT_TOKEN_MISMATCH',
  ETH_TRANSFER_FAILED: 'PB_ETH_TRANSFER_FAILED',
  TOKEN_NOT_CONTRACT: 'PB_TOKEN_NOT_CONTRACT',
  TOKEN_DEPOSIT_FAILED: 'PB_TOKEN_DEPOSIT_FAILED',
  TOKEN_TRANSFER_FAILED: 'PB_TOKEN_TRANSFER_FAILED',
  GUARDIAN_SHARE_ALREADY_CLAIMED: 'PB_GUARDIAN_SHARE_ALREADY_CLAIMED',
  GOVERNOR_SHARE_ALREADY_CLAIMED: 'PB_GOVERNOR_SHARE_ALREADY_CLAIMED',
  OVERRATED_GOVERNOR_SHARE_PCT: 'PB_OVERRATED_GOVERNOR_SHARE_PCT'
}

const CONTROLLER_ERRORS = {
  SENDER_NOT_GOVERNOR: 'CTR_SENDER_NOT_GOVERNOR',
  INVALID_GOVERNOR_ADDRESS: 'CTR_INVALID_GOVERNOR_ADDRESS',
  IMPLEMENTATION_NOT_CONTRACT: 'CTR_IMPLEMENTATION_NOT_CONTRACT',
  INVALID_IMPLS_INPUT_LENGTH: 'CTR_INVALID_IMPLS_INPUT_LENGTH',
  MODULE_NOT_SET: 'CTR_MODULE_NOT_SET',
  MODULE_ALREADY_DISABLED: 'CTR_MODULE_ALREADY_DISABLED',
  MODULE_ALREADY_ENABLED: 'CTR_MODULE_ALREADY_ENABLED',
  CUSTOM_FUNCTION_NOT_SET: 'CTR_CUSTOM_FUNCTION_NOT_SET'
}

const ACL_ERRORS = {
  BAD_FREEZE: 'ACL_BAD_FREEZE',
  ROLE_ALREADY_FROZEN: 'ACL_ROLE_ALREADY_FROZEN',
  INVALID_BULK_INPUT: 'ACL_INVALID_BULK_INPUT'
}

const CONTROLLED_ERRORS = {
  CONTROLLER_NOT_CONTRACT: 'CTD_CONTROLLER_NOT_CONTRACT',
  SENDER_NOT_ALLOWED: 'CTD_SENDER_NOT_ALLOWED',
  SENDER_NOT_CONTROLLER: 'CTD_SENDER_NOT_CONTROLLER',
  SENDER_NOT_FUNDS_GOVERNOR: 'CTD_SENDER_NOT_FUNDS_GOVERNOR',
  SENDER_NOT_CONFIG_GOVERNOR: 'CTD_SENDER_NOT_CONFIG_GOVERNOR',
  SENDER_NOT_ACTIVE_VOTING: 'CTD_SENDER_NOT_ACTIVE_VOTING',
  SENDER_NOT_ACTIVE_DISPUTE_MANAGER: 'CTD_SEND_NOT_ACTIVE_DISPUTE_MGR',
  SENDER_NOT_CURRENT_DISPUTE_MANAGER: 'CTD_SEND_NOT_CURRENT_DISPUTE_MGR',
  INSUFFICIENT_RECOVER_FUNDS: 'CTD_INSUFFICIENT_RECOVER_FUNDS'
}

const CONFIG_ERRORS = {
  TOO_OLD_TERM: 'CONF_TOO_OLD_TERM',
  INVALID_PENALTY_PCT: 'CONF_INVALID_PENALTY_PCT',
  INVALID_FINAL_ROUND_REDUCTION_PCT: 'CONF_INVALID_FINAL_ROUND_RED_PCT',
  INVALID_MAX_APPEAL_ROUNDS: 'CONF_INVALID_MAX_APPEAL_ROUNDS',
  LARGE_ROUND_PHASE_DURATION: 'CONF_LARGE_ROUND_PHASE_DURATION',
  BAD_INITIAL_GUARDIANS_NUMBER: 'CONF_BAD_INITIAL_GUARDIAN_NUMBER',
  BAD_APPEAL_STEP_FACTOR: 'CONF_BAD_APPEAL_STEP_FACTOR',
  ZERO_COLLATERAL_FACTOR: 'CONF_ZERO_COLLATERAL_FACTOR',
  ZERO_MIN_ACTIVE_BALANCE: 'CONF_ZERO_MIN_ACTIVE_BALANCE'
}

const CLOCK_ERRORS = {
  TERM_DOES_NOT_EXIST: 'CLK_TERM_DOES_NOT_EXIST',
  TERM_DURATION_TOO_LONG: 'CLK_TERM_DURATION_TOO_LONG',
  TERM_RANDOMNESS_NOT_YET: 'CLK_TERM_RANDOMNESS_NOT_YET',
  TERM_RANDOMNESS_UNAVAILABLE: 'CLK_TERM_RANDOMNESS_UNAVAILABLE',
  BAD_FIRST_TERM_START_TIME: 'CLK_BAD_FIRST_TERM_START_TIME',
  TOO_MANY_TRANSITIONS: 'CLK_TOO_MANY_TRANSITIONS',
  INVALID_TRANSITION_TERMS: 'CLK_INVALID_TRANSITION_TERMS',
  CANNOT_DELAY_STARTED_COURT: 'CLK_CANNOT_DELAY_STARTED_PROT',
  CANNOT_DELAY_PAST_START_TIME: 'CLK_CANNOT_DELAY_PAST_START_TIME'
}

const TREE_ERRORS = {
  UPDATE_OVERFLOW: 'SUM_TREE_UPDATE_OVERFLOW',
  KEY_DOES_NOT_EXIST: 'SUM_TREE_KEY_DOES_NOT_EXIST',
  SEARCH_OUT_OF_BOUNDS: 'SUM_TREE_SEARCH_OUT_OF_BOUNDS',
  MISSING_SEARCH_VALUES: 'SUM_TREE_MISSING_SEARCH_VALUES',
  INVALID_INTERVAL_SEARCH: 'TREE_INVALID_INTERVAL_SEARCH',
  SORTITION_LENGTHS_MISMATCH: 'TREE_SORTITION_LENGTHS_MISMATCH'
}

const CHECKPOINT_ERRORS = {
  CHECKPOINT_VALUE_TOO_BIG: 'CHECKPOINT_VALUE_TOO_BIG',
  CHECKPOINT_CANNOT_ADD_PAST_VALUE: 'CHECKPOINT_CANNOT_ADD_PAST_VALUE'
}

const MATH_ERRORS = {
  ADD_OVERFLOW: 'MATH_ADD_OVERFLOW',
  SUB_OVERFLOW: 'MATH_SUB_OVERFLOW'
}

module.exports = {
  DISPUTE_MANAGER_ERRORS,
  VOTING_ERRORS,
  REGISTRY_ERRORS,
  TREASURY_ERRORS,
  PAYMENTS_BOOK_ERRORS,
  CONTROLLER_ERRORS,
  ACL_ERRORS,
  CONTROLLED_ERRORS,
  CONFIG_ERRORS,
  CLOCK_ERRORS,
  TREE_ERRORS,
  CHECKPOINT_ERRORS,
  MATH_ERRORS
}
