# Shifts-ios-coding-challenge


## Assumptions I've made:

The simplest UI possible

Use project settings as provided, eg. `iOS version == 14`

Do not use gitflow - no branches for simple proof-of-concept (spike-solution) project


## TODO:

Adding shift to system calendar 

UI improvements, eg. pull-to-refresh (this would be easy with `.refreshable` available in iOS 15) 

Add error messages in case of problem - discuss with UI designer first

Add search parameters, eg. `radius`

Replace all `print("🛑` with proper logging system (at least os_log)

Make api and request builder dynamic for different requests 

Cacheing data to show something if there is no internet connection

Fallback in case of corrupted data from API (or data format change)



## To discuss:

### API:
Time zones: I assume date is in Iso8601 format
also not sure: `start_time` or `normalized_start_date_time` 

I'm guessing eg. `shift_kind` is some enum
and `state_id` can be mapped to state name 

### UI/UX:

On main list should we show facility name or localized_specialty name

Color inside "specialty" - where it should be shown



