# REST API for VyatSU schedule web server

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

 - `group_id=[number]`
 - `season='autumn' | 'spring'`

**Success response:**

Code: `200`

Content:
```js
{ 
    "group": "group name",
    "date_range": ["first_date", "second_date"],
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
    "error": "Unknown groupId: <groupId>"
}
```
---------
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
    {
        "start": "8:20", "end": "9:50"
    },  
    {  
        "start": "10:00", "end": "11:30"
    },  
    {  
        "start": "11:45", "end": "13:15"
    },  
    {  
        "start": "14:00", "end": "15:30"
    },  
    {  
        "start": "15:45", "end": "17:15"
    },  
    {  
        "start": "17:20", "end": "18:50"
    },  
    {  
        "start": "18:55", "end": "20:25"
    }
]
```

### Show list of groups (JSON)

**General:**

URL: `/vyatsu/v2/groups.json`

Method: `GET`

**Success response:**

Code: `200`

Content:
```js
[
    {
        "id": "Group id",
        "name": "Group name"
    },
    ...
    {
        "id": "Group id",
        "name": "Group name"
    }
]
```
