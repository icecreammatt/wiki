# Hydra

## Setting basic manual job

- Admin > Create Project
- Fill out basic info
- Actions > Create Jobset

| State            | Value                                             |
|------------------|---------------------------------------------------|
| identifier       | main                                              |
| type             | flake                                             |
| description      | flake                                             |
| description      | repo url ex: https://github.com/icecreammatt/wiki |
| flake URI        | git url ex: github:icecreammatt/wiki              |
| check interval   | 0                                                 |
| schedules shares | 1                                                 |
| evals to keep    | 3                                                 |

- Actions > Evaluate Jobset
- Home > Projects > <Project> > Evaluations > #

## Flake setup

Add new value to outputs. See wiki or tape-encoder for examples

```
    hydraJobs."tester" = self.defaultPackage;
```
