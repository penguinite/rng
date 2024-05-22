# nim-rng

Very basic wrapper over `std/sysrand`, you might be able to use this as a **somewhat** cryptographically-secure drop-in replacement for `std/random`

Documentation can be found [here](https://penguinite.github.io/rng)

**Warning:** `std/sysrand` has not been audited, and so it is possible that it might not actually be cryptographically secure. But, it also just wraps over common platform-specific cryptographically-secure random number generators so the chance that this is unsafe is small but it is a real chance. Decide for yourself whether or not this is worth the risk, if it isn't then consider using wrappers to OpenSSL or some other well-established cryptography library that offers RNG.