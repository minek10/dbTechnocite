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
    traineechecks
VALUES
    (1, 1, 1, 1),
    (2, 1, 0, 2),
    (3, 1, 1, 3);

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
        "iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAABHNCSVQICAgIfAhkiAAAAAlwSFlzAAAApgAAAKYB3X3/OAAAABl0RVh0U29mdHdhcmUAd3d3Lmlua3NjYXBlLm9yZ5vuPBoAAANCSURBVEiJtZZPbBtFFMZ/M7ubXdtdb1xSFyeilBapySVU8h8OoFaooFSqiihIVIpQBKci6KEg9Q6H9kovIHoCIVQJJCKE1ENFjnAgcaSGC6rEnxBwA04Tx43t2FnvDAfjkNibxgHxnWb2e/u992bee7tCa00YFsffekFY+nUzFtjW0LrvjRXrCDIAaPLlW0nHL0SsZtVoaF98mLrx3pdhOqLtYPHChahZcYYO7KvPFxvRl5XPp1sN3adWiD1ZAqD6XYK1b/dvE5IWryTt2udLFedwc1+9kLp+vbbpoDh+6TklxBeAi9TL0taeWpdmZzQDry0AcO+jQ12RyohqqoYoo8RDwJrU+qXkjWtfi8Xxt58BdQuwQs9qC/afLwCw8tnQbqYAPsgxE1S6F3EAIXux2oQFKm0ihMsOF71dHYx+f3NND68ghCu1YIoePPQN1pGRABkJ6Bus96CutRZMydTl+TvuiRW1m3n0eDl0vRPcEysqdXn+jsQPsrHMquGeXEaY4Yk4wxWcY5V/9scqOMOVUFthatyTy8QyqwZ+kDURKoMWxNKr2EeqVKcTNOajqKoBgOE28U4tdQl5p5bwCw7BWquaZSzAPlwjlithJtp3pTImSqQRrb2Z8PHGigD4RZuNX6JYj6wj7O4TFLbCO/Mn/m8R+h6rYSUb3ekokRY6f/YukArN979jcW+V/S8g0eT/N3VN3kTqWbQ428m9/8k0P/1aIhF36PccEl6EhOcAUCrXKZXXWS3XKd2vc/TRBG9O5ELC17MmWubD2nKhUKZa26Ba2+D3P+4/MNCFwg59oWVeYhkzgN/JDR8deKBoD7Y+ljEjGZ0sosXVTvbc6RHirr2reNy1OXd6pJsQ+gqjk8VWFYmHrwBzW/n+uMPFiRwHB2I7ih8ciHFxIkd/3Omk5tCDV1t+2nNu5sxxpDFNx+huNhVT3/zMDz8usXC3ddaHBj1GHj/As08fwTS7Kt1HBTmyN29vdwAw+/wbwLVOJ3uAD1wi/dUH7Qei66PfyuRj4Ik9is+hglfbkbfR3cnZm7chlUWLdwmprtCohX4HUtlOcQjLYCu+fzGJH2QRKvP3UNz8bWk1qMxjGTOMThZ3kvgLI5AzFfo379UAAAAASUVORK5CYII=",
        1
    ),
    (
        2,
        1,
        "Instructor Comment B",
        "iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAABHNCSVQICAgIfAhkiAAAAAlwSFlzAAAApgAAAKYB3X3/OAAAABl0RVh0U29mdHdhcmUAd3d3Lmlua3NjYXBlLm9yZ5vuPBoAAANCSURBVEiJtZZPbBtFFMZ/M7ubXdtdb1xSFyeilBapySVU8h8OoFaooFSqiihIVIpQBKci6KEg9Q6H9kovIHoCIVQJJCKE1ENFjnAgcaSGC6rEnxBwA04Tx43t2FnvDAfjkNibxgHxnWb2e/u992bee7tCa00YFsffekFY+nUzFtjW0LrvjRXrCDIAaPLlW0nHL0SsZtVoaF98mLrx3pdhOqLtYPHChahZcYYO7KvPFxvRl5XPp1sN3adWiD1ZAqD6XYK1b/dvE5IWryTt2udLFedwc1+9kLp+vbbpoDh+6TklxBeAi9TL0taeWpdmZzQDry0AcO+jQ12RyohqqoYoo8RDwJrU+qXkjWtfi8Xxt58BdQuwQs9qC/afLwCw8tnQbqYAPsgxE1S6F3EAIXux2oQFKm0ihMsOF71dHYx+f3NND68ghCu1YIoePPQN1pGRABkJ6Bus96CutRZMydTl+TvuiRW1m3n0eDl0vRPcEysqdXn+jsQPsrHMquGeXEaY4Yk4wxWcY5V/9scqOMOVUFthatyTy8QyqwZ+kDURKoMWxNKr2EeqVKcTNOajqKoBgOE28U4tdQl5p5bwCw7BWquaZSzAPlwjlithJtp3pTImSqQRrb2Z8PHGigD4RZuNX6JYj6wj7O4TFLbCO/Mn/m8R+h6rYSUb3ekokRY6f/YukArN979jcW+V/S8g0eT/N3VN3kTqWbQ428m9/8k0P/1aIhF36PccEl6EhOcAUCrXKZXXWS3XKd2vc/TRBG9O5ELC17MmWubD2nKhUKZa26Ba2+D3P+4/MNCFwg59oWVeYhkzgN/JDR8deKBoD7Y+ljEjGZ0sosXVTvbc6RHirr2reNy1OXd6pJsQ+gqjk8VWFYmHrwBzW/n+uMPFiRwHB2I7ih8ciHFxIkd/3Omk5tCDV1t+2nNu5sxxpDFNx+huNhVT3/zMDz8usXC3ddaHBj1GHj/As08fwTS7Kt1HBTmyN29vdwAw+/wbwLVOJ3uAD1wi/dUH7Qei66PfyuRj4Ik9is+hglfbkbfR3cnZm7chlUWLdwmprtCohX4HUtlOcQjLYCu+fzGJH2QRKvP3UNz8bWk1qMxjGTOMThZ3kvgLI5AzFfo379UAAAAASUVORK5CYII=",
        2
    );

COMMIT;
