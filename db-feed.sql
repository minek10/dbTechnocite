SET
    AUTOCOMMIT = 0;

INSERT INTO
    users
VALUES
    (
        1,
        "850717-061-02",
        "GOLANT",
        'Henri',
        "henri.golant@gmail.com",
        "+32486789456",
        "xgeN2GhgSZLvevSsQz79kaMqiA1xICLZuQ2tQAd",
        3
    ),
    (
        2,
        "850717-061-03",
        "KAN",
        'Jerry',
        "jerry06675@gmail.com",
        "+32476451456",
        "xntnntnnSZLkutynrtrtrnrtnA1xICLZuQ2tQAd",
        3
    ),
    (
        3,
        "850717-061-04",
        "ANDERTAL",
        'René',
        "cro.magnon@gmail.com",
        "+32413666456",
        "xgeN2GhgSZLvevSsQz79kaMqiA1rtnnnntrvfrd",
        3
    ),
    (
        4,
        "850417-061-04",
        "AULAIT",
        'Amaury',
        "amaury.aulait@gmail.com",
        "+32413166456",
        "xgeN2GhgSZLvevSsQz79kaMqiA1rtnnnntrvfrd",
        2
    ),
    (
        5,
        "890417-061-14",
        "TAMARE",
        'Quentin',
        "quentin.tamare@gmail.com",
        "+32413166456",
        "vvrN2GhgSZLvevSsQz79kaMqiA1rtnnnntrvfrd",
        1
    );

COMMIT;

SET
    AUTOCOMMIT = 0;

INSERT INTO
    formations
VALUES
    (
        1,
        "Formation NodeJS",
        "NODEJS2021",
        DATE '2021-01-17',
        DATE '2021-08-17'
    ),
    (
        2,
        "Formation .NET",
        "DOTNET2022",
        DATE '2022-01-17',
        DATE '2022-08-17'
    ),
    (
        3,
        "Formation Cobol",
        "COBOL1962",
        DATE '1962-01-17',
        DATE '1962-08-17'
    );

COMMIT;

SET
    AUTOCOMMIT = 0;

INSERT INTO
    users_has_formations
VALUES
    (1, 1, 1, 1),
    (2, 0, 1, 2),
    (3, 1, 1, 2);

COMMIT;

SET
    AUTOCOMMIT = 0;

INSERT INTO
    proofs
VALUES
    (
        1,
        DATE '2021-07-10',
        DATE '2021-07-10',
        "filePath.pdf",
        2
    );

COMMIT;

SET
    AUTOCOMMIT = 0;

INSERT INTO
    records
VALUES
    (
        1,
        DATE '2021-07-16',
        1,
        1,
        "Lorem Ipsum A",
        NULL,
        1
    ),
    (
        2,
        DATE '2021-07-16',
        1,
        2,
        "Lorem Ipsum B",
        1,
        2
    ),
    (
        3,
        DATE '2021-07-16',
        1,
        3,
        "Lorem Ipsum C",
        NULL,
        3
    );

COMMIT;

SET
    AUTOCOMMIT = 0;

INSERT INTO
    instructorchecks
VALUES
    (
        1,
        1,
        "Instructor Comment A",
        1
    ),
    (
        2,
        1,
        "Instructor Comment B",
        2
    );

COMMIT;

