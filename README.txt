# TurfsV Setup Instructions

## Step 1: Import SQL to Database
- The resource will **not work** without importing the SQL file to the database.
- Make sure you use **oxmysql** as the database.
- Ensure the SQL tables follow the `turfsV_` prefix for tables.
- Run the provided SQL file (located in the SQL folder) to set up the required tables.

## Step 2: Configuration
- All configurations for gangs, zones, and settings are now located in the `shared/config.lua` file.
- To set **Gang Management Locations**, **Vehicle Spawns**, and **Vehicle Returns**, modify the coordinates for each gang in the `shared/config.lua` file:
  - Management Locations: Edit the `Markers.Management.Location` for each gang.
  - Vehicle Spawns: Edit the `Markers.VehicleSpawn.Location`.
  - Vehicle Returns: Edit the `Markers.VehicleReturn.Location`.
  
- You can find the configuration for each gang under `Config.Gangs`:
  - Example: 
    ```lua
    Config.Gangs['aztecas'].Markers.Management.Location = {x = -265.08, y = -962.95, z = 31.22}
    Config.Gangs['aztecas'].Markers.VehicleSpawn.Location = {x = -3202.96, y = 834.78, z = 8.93}
    ```

- The settings for **Zones** (like meth farms and coke farms) are also located in `shared/config.lua`:
  - Change the location, rewards, and blips for each zone if necessary.

## Step 3: Replace esx_gangs
- If you're replacing **esx_gangs** with **TurfsV**, remove the old **esx_gangs** folder from your resources folder.
- Add the new **TurfsV** resource in the appropriate folder, e.g., `resources/[esx]/TurfsV`.

## Step 4: Modify CSS (Optional)
- To change the gang name display colors (for example, in NUI menus), you can modify the `nui/main.css` file if needed.
- Example: 
  - Open `nui/main.css`.
  - Look for the line that sets the text color for gang names (e.g., `.gang-label`).
  - Modify the color to your preferred color code.

## Step 5: Discord Webhook (Optional)
- If you want to log gang actions (e.g., capturing turf) to Discord, configure your **Discord Webhook** in the `shared/config.lua` file.
  - Add your Discord webhook URL in the `Config.DiscordWebhook` setting.

## Step 6: Ensure ox_lib and oxmysql are Installed
- TurfsV depends on **ox_lib** and **oxmysql**. Ensure both resources are installed and properly running.
- You can find **ox_lib** and **oxmysql** documentation here:
  - [ox_lib Documentation](https://overextended.dev/ox_lib)
  - [oxmysql Documentation](https://overextended.dev/oxmysql)

## Step 7: Additional Notes
- Make sure to restart your server after making any configuration changes.
- Keep track of any updates by checking the **changelog** file.
