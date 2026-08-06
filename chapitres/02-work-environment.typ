#import "./../backmatter/glossaire.typ": *

= Work Environment and Project Management

== The Heidelberg Institute for Theoretical Studies (HITS) and the PSO Group

The work presented in this report was carried out at the *Heidelberg Institute for Theoretical Studies (HITS)*, a private, non-profit research institute dedicated to data-driven and computationally intensive natural sciences. HITS maintains strong academic ties with Heidelberg University while offering a state-of-the-art, highly autonomous research environment.

The research was conducted within the *Physics of Stellar Objects (PSO)* research group, led by *Prof. Dr. Friedrich K. Röpke*. The PSO group specializes in the numerical modeling of complex astrophysical processes, ranging from stellar evolution and binary star mergers (e.g., common envelope interactions) to Type Ia supernova explosions. 

The group is housed across two distinct buildings within the HITS campus: the historic 19th-century *Villa* (where part of the PSO team, including myself, was based) and the modern *Main Building*, which hosts the main group offices, meeting rooms, and administration. Despite this physical distribution, cohesion is maintained through a highly collaborative work culture. Notably, PSO stands out as the most international research group at HITS. While many other groups predominantly speak German, PSO operates entirely in English, bringing together researchers from several continents with German native speakers accounting for less than a third of the team.

== Work Infrastructure and Technical Ecosystem

=== Computational Facilities and Storage Strategy
Due to the multi-dimensional hydrodynamical nature of Type Ia supernova simulations, access to High-Performance Computing (HPC) infrastructure is critical. Calculations were executed on *Genoa*, one of HITS’s dedicated HPC clusters running under the SLURM workload manager.

Data storage is structured across two primary high-speed filesystems: `fast` (optimized for active I/O operations during runs) and `basement` (used for short-to-medium-term storage of simulation outputs). 
- *Volume Demands:* Hydrodynamic runs generate massive outputs (density profiles, velocity fields, mass fractions across species). By the end of the internship, my datasets occupied several tens of Terabytes.
- *Group-Wide Impact:* The PSO group alone accounts for over 60% of the total multi-Petabyte storage capacity of `basement`.
- *Infrastructure Challenges:* During my time at HITS, `basement` operated near critical capacity (\~95% full). This required strict data hygiene (compressing raw outputs, removing redundant checkpoint files, and archiving) while the institute prepared to commission a new storage architecture.

=== Software Engineering and Version Control
The core simulation software used throughout this project is *Phlegethon*, an in-house astrophysics code hosted on GitHub, complemented by internal GitLab repositories for auxiliary tools and online documentation. 

To implement the methodological updates required for my project—specifically enabling true 1D spherical/planar geometry modes and dynamic OpenMP parallelization—a dedicated feature branch was created from the main repository. Development workflows were designed with code merging in mind, allowing optimizations proven during the project to be integrated back into Phlegethon's main codebase.

== Team Dynamics, Collaboration, and Communication

=== Supervisory Structure and Everyday Guidance
Project governance was organized around a dual tier of supervision:
1. *Academic Supervision:* Weekly progress reviews and strategic direction were provided directly by *Prof. Dr. Friedrich K. Röpke*, whose office in the Main Building remained accessible for high-level discussions on physics and project objectives.
2. *Daily Operations & Technical Mentorship:* Day-to-day progress was supported by three key members of the PSO group:
   - *Krištof Vítovský (PhD Student):* Guided the initial onboarding, workspace configuration, and early familiarity with Phlegethon's runtime parameters and execution debugging.
   - *Dr. Giovanni Leidi (Postdoctoral Researcher):* As the primary developer of Phlegethon, Dr. Leidi assisted directly with code architecture, implementing customized code modifications (such as pure 1D geometries and enhanced data logging) on a dedicated git branch.
   - *Dr. Alexander Holas (Postdoctoral Researcher, PhD candidate during the internship):* Provided crucial expertise on the physical formulation of Type Ia supernovae. Dr. Holas guided the selection of nuclear networks, initial conditions, and physical approximations to ensure that numerical simplifications remained physically sound.

Support extended beyond office hours and contract end dates, with colleagues providing continuous technical and physical insights via Mattermost and in-person discussions.

=== Meeting Routines and Cross-Group Synergies
Research activities were structured around two fixed weekly meetings:

- *PSO Group Meeting (Wednesdays, 11:00 AM):* A joint session gathering the PSO team, members of the neighboring *SET* (Stellar Evolution Theory) group, and remote collaborators (including alumni now at institutions such as *Los Alamos National Laboratory*). Meetings combined operational updates (#gls("hpc") allocations, upcoming conferences) with a 40-to-60-minute scientific presentation. These presentations provided a platform for thesis defenses, conference dry-runs, and peer feedback across diverse topics in stellar physics.
- *SLH Subgroup Meeting (Thursdays, 4:00 PM):* Dedicated specifically to Stellar Hydrodynamics (SLH), this afternoon meeting accommodated international remote participants. Discussions were highly interactive, focusing on intermediate results, numerical anomalies, and technical blockers. Key technical breakthroughs—such as diagnosing dense-matrix bottlenecks in nuclear reaction networks ($O(N^3)$ scaling), identifying acoustic wave reflections at domain boundaries, and proposing dynamic OpenMP parallelization—originated directly from these sessions.

Working in fundamental computational astrophysics highlighted a fundamental difference between industrial engineering projects and academic research: project planning is inherently non-linear. Unlike classical engineering projects with pre-defined Gantt charts and rigid weekly milestones, numerical research involves constant adaptation. Unexpected physical phenomena, numerical instabilities, or stiff matrix convergence issues frequently generate new investigation branches. To navigate this unpredictability, I managed priorities through dynamic task tracking and personal documentation files rather than trying to fit the work into a static initial timeline.

== Integration, Working Conditions, and Scientific Culture

The working environment at HITS emphasizes both physical comfort and operational flexibility. Workstations in the open-plan offices feature highly ergonomic chairs and motor-driven sit-stand desks, equipped with dual-monitor setups and dedicated laptops connected to the institute's network via secure VPN and SSH tunnels.

From an organizational standpoint, HITS operates under a flexible office space policy (*flex-office*), allowing researchers to reserve any available desk within the PSO group's rooms via an internal booking system. In practice, however, team members naturally established preferred daily seats, striking a comfortable balance between organizational flexibility and a sense of routine.

Beyond formal meetings, scientific ideas and technical troubleshooting were routinely shared during morning coffee breaks and lunch hours. Digital collaboration was sustained through specialized Mattermost channels dedicated to scientific literature tracking, state-of-the-art developments, and competitor benchmark analysis. 

Social integration was facilitated from the start through events such as the weekly "Mensa" evenings in Heidelberg, joint group hikes, and the annual HITS Summer Party. This inclusive culture fostered an ideal environment for scientific inquiry, international networking, and rapid professional growth.