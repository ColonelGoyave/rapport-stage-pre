#import "@preview/touying:0.5.3": *
#import themes.simple: *

#show: simple-theme.with(
  aspect-ratio: "16-9",
  primary: rgb("#2b3a67"),
)

#title-slide[
  = Thermonuclear Deflagration Flames in Type Ia Supernovae

  == A 1D Multiparametric Study on the Phlegethon Program

  #v(1em)
  Alexis Spaeth-\-Lemarchand \
  PSO Group -- HITS
]

== Objective

- Laminar deflagration flame speed $v_l$ governs the transition to detonation in exploding C-O white dwarfs
- Existing formulas each depend on only *two* of the three relevant parameters

#v(1em)
#align(center)[
  #text(size: 1.3em)[
    *Goal:* a single fitting formula $v_l = f(rho, X_i, Y_e)$ for C-O mixtures
  ]
]

== Setup: 1D Planar Flame in a Uniform Medium

- Not a full stellar structure, but a 1D box at fixed $rho$, uniform initial composition
- Single propagation direction ($x_2$), the transverse directions are inactive in 1D
- Composition: $X$(C12), $X$(O16), tuned via the C/O ratio
- Ignition: localized hot spot ($tanh$ profile), inspired by Schwab et al. (2020)
- Boundary conditions: $x_2$ reflective at both ends, $x_1$ and $x_3$ periodic (inactive)

== Timmes vs. Schwab

#align(center)[
  #table(
    columns: (1fr, 1fr),
    stroke: 0.5pt,
    align: left,
    [*Timmes & Woosley (1992)*], [*Schwab et al. (2020)*],
    [C-O and O-Ne-Mg mixtures], [O-Ne mixtures],
    [Up to 130-isotope network], [$tilde.op$495-isotope adaptive network],
    [Depends on $rho$, $X_i$], [Depends on $rho$, $Y_e$],
    [No $Y_e$ dependence], [No explicit composition dependence],
  )
]

#v(1em)
#align(center)[*Neither depends on all three parameters at once,\ hence the goal of this study.*]

== Combining Timmes and Schwab

$ v_"Timmes" = 92.0 (rho / 2 times 10^9)^0.805 [X(upright("C12"))/0.5]^0.889 upright("km/s") $
$ upright("factor")_"Schwab" (Y_e) = 1 + 96.8 (0.5 - Y_e) $

#v(1em)
*Working ansatz:*
$ v_l (rho, X_C, Y_e) approx v_"Timmes" (rho, X_C) times upright("factor")_"Schwab" (Y_e) $

#v(0.5em)
Combines both, tested directly against simulation, to be refined

== Varying $Y_e$: the Ne40 Spectator Species

- No naturally abundant isotope gives the exact $Y_e$ shift needed without disturbing the C-O composition
- Ne40 (Z=10, A=40, fictitious but $Z/A = 0.25$) used as an inert spectator species

$ X_s (upright("Ne40")) = (0.5 - Y_e) / 0.25 $

- Chosen over Ne22 ($Z/A approx 0.4545$): $~6 times$ less mass fraction needed
- What matters physically is the *fuel* $Y_e$: a spectator species keeps it fixed by construction

== Convergence to a Physical Attractor

Convergence tests varied: grid resolution, box size, ignition temperature, ignition spot size

#v(4em)
#align(center)[
  #text(size: 1.2em)[*Result: the final flame speed always converges to the same value*]
]
#v(1em)
\
\
- These parameters change how much excess energy is injected relative to the true steady-state flame profile
- More energy $arrow.r$ longer and larger-amplitude transient before relaxation and flame speed stability
- The asymptotic speed itself is a physical stable attractor, independent of these choices: "Eigenvalue flame speed" Zel'dovich-Frank-Kamenetskii (1938), Fife & McLeod (1977)

== Why Self-Similar Simulations

- Across the phase space, the physical flame width and expected speed vary by *orders of magnitude*
- A single fixed box / resolution / $T$ and $t_max$ cannot work everywhere

*Solution: scale every simulation to its own expected physics*
- Resolution: fixed cells per expected flame width
- Box length: fixed number of flame widths
- Duration: $t_max = x_"2u" \/ v_"expected"$, using Timmes and the Schwab factor

$arrow.r$ computational cost stays roughly constant across the whole phase space

== Spurious Acoustic Reflections

#figure(
  image("figures/acoustic_bounce_x2u.png", width: 62%),
  caption: [Front position for different box sizes ($x_"2u"$): reflected waves bouncing back and forth (fit fails: $v_"sim"$ = nan)],
)

- Motivates keeping the box just long enough (self-similar sizing), not longer
- Shorter box $arrow.r$ less time for reflections to contaminate the signal, *and* shorter $t_max$

== What a Clean Run Looks Like

#grid(
  columns: (1fr, 1fr),
  gutter: 6pt,
  figure(
    image("figures/overview_clean_15species.png", width: 100%),
    caption: [`overview`: radial profiles],
  ),
  figure(
    image("figures/speed_overview_clean_15species.png", width: 100%),
    caption: [`speed_overview`: fitted flame speed],
  ),
)

#v(0.5em)
15-species network here $arrow.r$ under-resolved energy release $arrow.r$ speed below Timmes (expected. *Not a bug, a #emoji.sparkles feature #emoji.sparkles*.)

== Analysis Pipeline

#align(center)[
  #box(inset: 6pt, stroke: 0.5pt)[`generate_simulations.py`] $arrow.r$
  #box(inset: 6pt, stroke: 0.5pt)[Phlegethon] $arrow.r$
  #box(inset: 6pt, stroke: 0.5pt)[extraction] $arrow.r$
  #box(inset: 6pt, stroke: 0.5pt)[`analyze_results.py`]
]

- Front detection: $(T_"fuel" + T_"ashes")/2$ crossing + $dot(epsilon)_"nuc"$ peak, averaged
- Sub-cell resolution via parabolic interpolation
- Velocity extraction: went through *three* successive methods

== The Debugging Journey (1/3): Long Transients

- First attempt: time-averaged velocity $arrow.r$ biased, transient never fully decays within $t_max$
- Diagnosis: velocity decreases monotonically over the whole run, no clean plateau
- Fix: fit $r(t)$ directly with an integrated relaxation model
$ r(t) = r_0 + v_infinity t + A tau (1 - e^(-t/tau)) $ (Fife & McLeod 1977)

#figure(
  image("figures/exp_fit_good_example.png", width: 58%),
  caption: [A well-behaved case: clear relaxation, stable asymptote, quick and clear convergence],
)

== The Debugging Journey (2/3) -- Fit Instability

- Nonlinear 3-parameter fit is unstable when $t_max$ doesn't cover several $tau$
  $arrow.r$ *fit collapse*: extrapolation can drift far from the visible data trend
- Extreme sensitivity to noise in the dataset (extrapolation towards a specific function type, instead of a more robust polynomial interpolation)

#figure(
  image("figures/exp_fit_absurd_example.png", width: 58%),
  caption: [Fitted asymptote sits well outside the range the data actually shows: an unreliable extrapolation],
)

- Fix: cross-check against sliding-window OLS slopes + Aitken $Delta^2$ extrapolation, with a collapse guard falling back to a robust estimate on disagreement

== The Debugging Journey (3/3) -- The Ye Bug

#align(center)[
  #text(size: 1.2em)[*Weeks of "noisy physics" that were actually a labeling bug*]
]

- `read_sim_params()` never actually re-read $Y_e$ from the simulation files, silently defaulting to $0.5$ for *every* simulation
- Consequence: `--ye 0.5` filters matched everything; comparison plots quietly mixed different $Y_e$ values together
- Fix: recompute $Y_e$ from the Ne40 mass fraction actually present
$ Y_e = 0.5 - 0.25 dot X_s (upright("Ne40")) $

== Evolution of Results (1/2)

#grid(
  columns: (1fr, 1fr),
  gutter: 8pt,
  figure(
    image("figures/compare_results_polyfit_era.png", width: 100%),
    caption: [Early: naive polynomial fit],
  ),
  figure(
    image("figures/compare_results_before.png", width: 100%),
    caption: [Exponential fit, pre collapse-guard],
  ),
)

#v(0.5em)
Each successive fitting method exposed a new failure mode rather than just fixing the last one

== Evolution of Results (2/2)

#grid(
  columns: (1fr, 1fr),
  gutter: 8pt,
  figure(
    image("figures/compare_results_before.png", width: 100%),
    caption: [Before: mixed $Y_e$, unguarded fits],
  ),
  figure(
    image("figures/compare_results_after.png", width: 100%),
    caption: [After: collapse guard + Ye fix],
  ),
)

== Current Results

- (Relatively) good agreement with Timmes & Woosley (1992) for $rho >~ 5 times 10^8$ g/cm#super[3]
- Most outliers are concentrated at *low density*, across several compositions
- New diagnostic: $tau / T_"span"$ ratio flags simulations where $t_max$ likely wasn't long enough \
$arrow.r$ then calculation time goes up drastically, and the naive time limit should be more precisely calculated beforehand 

== Phase-Space Maps

#grid(
  columns: (1fr, 1fr),
  gutter: 8pt,
  figure(
    image("figures/results_Ye_0.5_0.497_expo_04_heatmap.png", width: 100%),
    caption: [Heatmap with the already simulated data],
  ),
  figure(
    image("figures/results_Ye_0.5_0.497_expo_04_3d.png", width: 100%),
    caption: [3D surface of speed for $X_C_O$ = 1.0],
  ),
)


#v(4em)
- Not yet fully conclusive, low-density outliers still visible
- Not fully following the trend Schwab predicts
- Incoherence between chemical compositions
#v(2em)
- Mostly due to the post-processing of the data sets

== Next Steps

- Resolve the remaining low-density discrepancy (likely $t_max$ way too short relative to $tau$)
- Continue the sweep of variating $Y_e$ values
- Derive the combined fitting formula $v_l = f(rho, X_i, Y_e)$ from the data

== What could the applications be

- This one formula could help with taking into account metallicity and other phenomenons happening inside true SN Ia and still have a rather precise flame speed value
- Spatially variable mixtures (with chemical fuel composition, Ye, and density) evolving as you move through the radius of the star
- Multidimensional simulations to check how the formula holds up once confronted with more multi-physics constraints

#v(2em)
#align(center)[#text(size: 1.5em)[Thank you for listening to my swanky project presentation. Any questions?\
#v(2em)
Thank you also for your help, presence, support and the good memories during these past three months. It went by fast and I'll miss you all.]]
