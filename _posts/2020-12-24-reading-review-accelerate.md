---
layout:     post
title:      Reading review - Accelerate
tags: ["reading"]
image: '/images/posts/2020-12-24-reading-review-accelerate/cover.svg'
---

### Measure engineering productivity

Know what to measure is important building a great engineering culture. One aspect to measure is engineering productivity. And the authors proposes 4 useful metrics: *delivery lead time*, *deployment frequence*, *time to restore service*, and *change fail rate*.

> In our search for measures of delivery performance that meet these criteria, we settled on four: delivery lead time, deployment frequency, time to restore service, and change fail rate.

> Lead time is the time it takes to go from a customer making a request to the request being satisfied.

> there are two parts to lead time: the time it takes to design and validate a product or feature, and the time to deliver the feature to customers.

The culture of continuous delivery is importnt for productivity and innovation, and innovation cannot be outsourced for great company value.

> It’s worth noting that the ability to take an experimental approach to product development is highly correlated with the technical practices that contribute to continuous delivery.

> The fact that software delivery performance matters provides a strong argument against outsourcing the development of software that is strategic to your business, and instead bringing this capability into the core of your organization.

### Organization Culture

Organizational culture is analyzed in three levels: *basic assumptions*, *values*, and *artifacts*. Using this taxonomy we can form mental models as the organization evolves.

> At the first level, basic assumptions are formed over time as members of a group or organization make sense of relationships, events, and activities.

> The second level of organizational culture are values, which are more “visible” to group members as these collective values and norms can be discussed and even debated by those who are aware of them.

### Team Culture

Many research in this book also reveals insights on highly functioning teams:

> organizations with better information flow function more effectively.

> in organizations with a generative culture, people collaborate more effectively and there is a higher level of trust both across the organization and up and down the hierarchy.

One insight really resonated centers on "individual v.s. team":

> who is on a team matters less than how the team members interact, structure their work, and view their contributions

### Continuous Delivery

In my career, I have heard the term "CI/CD" continuous integration / continuous deployment over and over. Again, the authors define the concept and criteria cleanly:

> Continuous delivery is a set of capabilities that enable us to get changes of all kinds—features, configuration changes, bug fixes, experiments—into production or into the hands of users safely, quickly, and sustainably.

> By splitting work up into much smaller chunks that deliver measurable business outcomes quickly for a small part of our target market, we get essential feedback on the work we are doing so that we can course correct.

> We can and do deploy or release our application independently of other applications/services it depends on.


A great continuous delivery process should speed up iteration, and put engineers at ease:

> In software organizations, the capability to work and deliver in small batches is especially important because it allows you to gather user feedback quickly using techniques such as A/B testing.

> The fear and anxiety that engineers and technical staff feel when they push code into production can tell us a lot about a team’s software delivery performance. We call this deployment pain, and it is important to measure because it highlights the friction and disconnect that exist between the activities used to develop and test software and the work done to maintain and keep software operational.

> We found that where code deployments are most painful, you’ll find the poorest software delivery performance, organizational performance, and culture.

> Build systems that are designed to be deployed easily into multiple environments, can detect and tolerate failures in their environments, and can have various components of the system updated independently

### Security and Scalability

Software constantly evolves. A highly functioning engineering team builds software today with future in mind. Such mindset is reflected in the security practice and how code will be used:

> information security should be integrated into the entire software delivery lifecycle from development through operations. This means infosec experts should contribute to the process of designing applications, attend and provide feedback on demonstrations of the software, and ensure that security features are tested as part of the automated test suite.

> When building security into software is part of the daily work of developers, and when infosec teams provide tools, training, and support to make it easy for developers to do the right thing, delivery performance gets better.

> I recognize that my code will be used in ways I cannot anticipate, in ways it was not designed, and for longer than it was ever intended.

> I recognize that my code will be attacked by talented and persistent adversaries who threaten our physical, economic, and national security.

### Transformational Leadership

Technical leadership plays a key role in building a great engineering team. And two areas to focus on: *delivery* and *growth*. And during pressure times, to lead the team "slow down to speed up":

> Being a leader doesn’t mean you have people reporting to you on an organizational chart—leadership is about inspiring and motivating those around you. A good leader affects a team’s ability to deliver code, architect good systems, and apply Lean principles to how the team manages its work and develops products.

> Transformational leadership means leaders inspiring and motivating followers to achieve higher performance by appealing to their values and sense of purpose, facilitating wide-scale organizational change.

> leaders cannot achieve goals on their own. They need their teams executing the work on a suitable architecture, with good technical practices, use of Lean principles, and all the other factors that we’ve studied over the years.

> Managers are ultimately responsible for fostering a supportive and respectful work environment, and they can do so by creating a blame-free environment, striving to learn from failures, and communicating a shared sense of purpose.

> when organizational values and individual values are aligned, the effects of burnout can be lessened and even counteracted.

> in today’s fast-moving and competitive world, the best thing you can do for your products, your company, and your people is institute a culture of experimentation and learning, and invest in the technical and management capabilities that enable it.

> Too often, quality is overshadowed by the pressure for speed. A courageous and supportive leader is crucial to help teams “slow down to speed up,” providing them with the permission and safety to put quality first (fit for use and purpose) which, in the long run, improves speed, consistency, and capacity while reducing cost, delays, and rework.

### Engineering Organizational Structure

A good team structure is laid out in the book: *tribe*, *squad*, and *chapters*. It's a matrix-liked organization structure that encourages information sharing and product ownership.

> Most squads are cross-functional, consisting of engineers and marketers, collaborating as a single team with a shared understanding of customer value.

> There are also chapters, comprised of members of the same discipline (for example, the Data Analytics Chapter), who are matrixed across squads and bring specialized knowledge to promote learning and advancement among squad members.
