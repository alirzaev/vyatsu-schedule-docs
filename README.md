# REST API for VyatSU schedule web server

## Table of contents
- [Show schedule calls](#schedule_calls)
- [Show list of groups (JSON)](#list_of_groups_json)
- [Show list of groups (XML)](#list_of_groups_xml)
- [Show list of groups ordered by faculties (JSON)](#list_of_groups_by_faculty_json)
- [Show list of groups ordered by faculties (XML)](#list_of_groups_by_faculty_xml)
- [Show schedule of group](#schedule_of_group)
- [Parse html document with group schedule](#parse_schedule)

### Show schedule calls

**General:**

URL: `/vyatsu/calls`

Method: `GET`

**Success response:**

Code: `200`

Content:
```js
[
    ["8:20", "9:50"],
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
```js
{
    "Group name": "Group id",
    ...
    "Group name": "Group id"
}
```

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
<group name="Group name">Group id</group>
...
</groups>
```

### Show list of groups ordered by faculties (JSON)

**General**

URL: `/vyatsu/groups/by_faculty.json`

Method: `GET`

**Success response:**

Code: `200`

Content:
```js
{
    'Faculty name':
    {
        "Group name": "Group id",
        ...
        "Group name": "Group id"
    }
    ...
    'Yet another faculty name':
    {
        "Group name": "Group id",
        ...
        "Group name": "Group id"
    }
}
```

### Show list of groups ordered by faculties (XML)

URL: `/vyatsu/groups/by_faculty.xml`

Method: `GET`

**Success response**

Code: `200`

Content:
```xml
<?xml version="1.0" ?>
<faculties>
    <faculty name="Faculty name">
    <group name="Group name">Group id</group>
    ...
    </faculty>
    ...
</faculties>
```

### Show schedule of group

**General**

URL: `/vyatsu/schedule/:group_id/:season`

Method: `GET`

URL params:

 - `id=[number]`
 - `season='autumn' | 'spring'`

**Success response:**

Code: `200`

Content:
```js
{ 
    "group": "group name",
    "weeks": [
        [
            ["Subject", "Yet another subject", ... ], //subjects on Monday
            ...
        ], //odd week
        [
            ["Some boring suject", ... ], //subjects on Monday
            ...
        ] //even week
    ]
}
```
  
**Error responses:**

Code: `422`

Content:
```json
{
    "error": "Invalid param 'season'"
}
```
---------
Code: `424`

Content:
```json
{
    "error": "vyatsu.ru error: <status code>"
}
```
---------
Code: `500`

Content:
```json
{
    "error": "Error while parsing html file"
}
```
---------
Code: `503`

Content:
```json
{
    "error": "Service unavailable: <error message>"
}
```

### Parse html document with group schedule

**General:**

URL: `/vyatsu/parse_schedule`

Method: `POST`

Data params:
```json
{
    "html_schedule": "<HTML><HEAD>..."
}
```

**Success response:**

Code: `200`

Content:
```js
{ "weeks": [
    [
        ["Subject", "Yet another subject", ... ], //subjects on Monday
        ...
    ], //odd week
    [
        ["Some boring suject", ... ], //subjects on Monday
        ...
    ] //even week
]}
```

**Error response:**

Code: `500`

Content:
```json
{
    "error": "Error while parsing html file"
}
```