#!/usr/bin/sh

cat << EOF
[ \
    { \
        "application_id": 1279840485132730443, \
        "state": "$(uname -r)", \
        "details": "$(uname -n)", \
        "large_image": { \
            "key": "archlinux", \
            "text": null \
        }, \
        "small_image": "new_shing-xcf", \
        "start_timestamp": $(date -d "$(uptime -s)" +%s), \
        "end_timestamp": null, \
        "buttons": [ \
            { \
                "label": "Mi web", \
                "url": "https://shing.cat" \
            } \
        ], \
        "party": [1, 3] \
    } \
]
EOF<
