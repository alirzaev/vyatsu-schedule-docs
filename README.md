# REST API for VyatSU schedule web server

## Generate OpenAPI docs

`redoc-cli bundle OpenAPI.json`

## API v1.0

### Show schedule calls

**General:**

URL: `/vyatsu/calls`

Method: `GET`

**Success response:**

Code: `200`

Content:
```js
[
    ["8:20",   "9:50"],
    ["10:00", "11:30"],
    ["11:45", "13:15"],
    ["14:00", "15:30"],
    ["15:45", "17:15"],
    ["17:20", "18:50"],
    ["18:55", "20:25"]
]
```

### Show list of groups (JSON)

**General:**

URL: `/vyatsu/groups.json`

Method: `GET`

**Success response:**

Code: `200`

Content:

JSON object of key-value pairs `"group_name": "group_id"`

### Show list of groups (XML)

**General:**

URL: `/vyatsu/groups.xml`

Method: `GET`

**Success response:**

Code: `200`

Content: 
```xml
<?xml version="1.0" ?>
<groups>
    <group name="Group name #1">Group id #1</group>
    <group name="Group name #2">Group id #2</group>
    ...
    <group name="Group name #N">Group id #N</group>
</groups>
```

### Show list of groups ordered by faculties (JSON)

**General**

URL: `/vyatsu/groups/by_faculty.json`

Method: `GET`

**Success response:**

Code: `200`

Content:

JSON object of key-value pairs `"faculty_name": groups_dict`, 
where `groups_dict` is JSON object of key-value pairs `"group_name": "group_id"`

### Show list of groups ordered by faculties (XML)

URL: `/vyatsu/groups/by_faculty.xml`

Method: `GET`

**Success response**

Code: `200`

Content:
```xml
<?xml version="1.0" ?>
<faculties>
    <faculty name="Faculty name #1">
        <group name="Group name #1">Group id #1</group>
        <group name="Group name #2">Group id #2</group>
        ...
        <group name="Group name #N">Group id #N</group>
    </faculty>
    ...
</faculties>
```

### Show schedule of group

**General**

URL: `/vyatsu/schedule/:groupId/:season`

Method: `GET`

URL params:

 - `groupId` - group id, string
 - `season` - semester, `autumn` - 1st semester, `spring` - 2nd semester

**Success response:**

Code: `200`

Content:

JSON object with following fields:

`"group"` - group name, string

`"date_range"` - dates for current schedule, array of two strings `"ddMMYYYY"`

`"weeks"` - schedule, three-dimension array `[week_number][day_number][lesson_number]` of strings, where 

- `week_number` = `0` or `1`, `0` - odd week, `1` - even week 
- `day_number` = `0..5`, `0` - Monday, `1` - Tuesday, etc
- `lesson_number` = `0..6`, `0` - 1st lesson, `1` - 2nd lesson, etc
  
**Error responses:**

Code: `422`

Content:
```json
{
    "error": "Unknown groupId: <groupId>"
}
```
---------
Code: `422`

Content:
```json
{
    "error": "Unknown season: <season>"
}
```
---------
Code: `422`

Content:
```json
{
    "error": "Error while processing pdf file"
}
```
---------
Code: `422`

Content:
```json
{
    "error": "Invalid pdf file"
}
```
---------
Code: `422`

Content:
```json
{
    "error": "vyatsu.ru server error"
}
```
---------
Code: `500`

Content:
```json
{
    "error": "Internal server error"
}
```

## API v2.0

### Show schedule calls

**General:**

URL: `/vyatsu/v2/calls`

Method: `GET`

**Success response:**

Code: `200`

Content:
```js
[
    { "start": "8:20",  "end": "9:50"  },  
    { "start": "10:00", "end": "11:30" },  
    { "start": "11:45", "end": "13:15" },  
    { "start": "14:00", "end": "15:30" },  
    { "start": "15:45", "end": "17:15" },  
    { "start": "17:20", "end": "18:50" },  
    { "start": "18:55", "end": "20:25" }
]
```

### Show list of groups (JSON)

**General:**

URL: `/vyatsu/v2/groups.json`

Method: `GET`

**Success response:**

Code: `200`

Content:

JSON array of objects:
```json
{
    "id": "Group id",
    "name": "Group name"
}
```

### Show list of groups ordered by faculties (JSON)

**General**

URL: `/vyatsu/v2/groups/by_faculty.json`

Method: `GET`

**Success response:**

Code: `200`

Content:

JSON array of the objects with such fields:

`"faculty"` - faculty name, string

`"groups"` - groups, array of the following objects:


```json
{
    "id": "<group_id>",
    "name": "<group_name>"
}
```

