Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB4A3FBAB1
	for <lists+linux-stm32@lfdr.de>; Mon, 30 Aug 2021 19:14:06 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A52A8C5A4D9;
	Mon, 30 Aug 2021 17:14:05 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DD626C5A4D6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Aug 2021 17:14:02 +0000 (UTC)
Received: from jic23-huawei (cpc108967-cmbg20-2-0-cust86.5-4.cable.virginm.net
 [81.101.6.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 88C5860F57;
 Mon, 30 Aug 2021 17:13:55 +0000 (UTC)
Date: Mon, 30 Aug 2021 18:17:06 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: William Breathitt Gray <vilhelm.gray@gmail.com>
Message-ID: <20210830181706.74e45cb8@jic23-huawei>
In-Reply-To: <cover.1630031207.git.vilhelm.gray@gmail.com>
References: <cover.1630031207.git.vilhelm.gray@gmail.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, david@lechnology.com,
 linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 alexandre.belloni@bootlin.com, mcoquelin.stm32@gmail.com,
 linux-kernel@vger.kernel.org, o.rempel@pengutronix.de,
 jarkko.nikula@linux.intel.com, kernel@pengutronix.de, fabrice.gasnier@st.com,
 syednwaris@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, alexandre.torgue@st.com
Subject: Re: [Linux-stm32] [PATCH v16 00/14] Introduce the Counter character
 device interface
X-BeenThere: linux-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/linux-stm32/>
List-Post: <mailto:linux-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Fri, 27 Aug 2021 12:47:44 +0900
William Breathitt Gray <vilhelm.gray@gmail.com> wrote:

> Changes in v16:
>  - Define magic numbers for stm32-lptimer-cnt clock polarities
>  - Define magic numbers for stm32-timer-cnt encoder modes
>  - Bump KernelVersion to 5.16 in sysfs-bus-counter ABI documentation
>  - Fix typos in driver API generic-counter.rst documentation file
> 
> For convenience, this patchset is also available on my personal git
> repo: https://gitlab.com/vilhelmgray/iio/-/tree/counter_chrdev_v16
> 
> The patches preceding "counter: Internalize sysfs interface code" are
> primarily cleanup and fixes that can be picked up and applied now to the
> IIO tree if so desired. The "counter: Internalize sysfs interface code"
> patch as well may be considered for pickup because it is relatively safe
> and makes no changes to the userspace interface.
> 
> To summarize the main points of this patchset: there are no changes to
> the existing Counter sysfs userspace interface; a Counter character
> device interface is introduced that allows Counter events and associated
> data to be read() by userspace; the events_configure() and
> watch_validate() driver callbacks are introduced to support Counter
> events; and IRQ support is added to the 104-QUAD-8 driver, serving as an
> example of how to support the new Counter events functionality.

Hi William,

I'll aim to pick up the first part in a week (too tired today after a lot
of reviewing to even manage the basic sanity check on the changes).

For the rest...

What I'd really like to know is if anyone other than William and I is planning
to review them in depth? (particularly 7 and 8 which are the new interface
patch and docs)

So if anyone reading this is in that category please let me know.  We can wait,
but conversely if no one is going to get time / inclination to do it then I
don't want to hold these up any longer and maximum time in linux-next may
be more useful than sitting unloved on the mailing list.

Jonathan

> 
> William Breathitt Gray (14):
>   counter: stm32-lptimer-cnt: Provide defines for clock polarities
>   counter: stm32-timer-cnt: Provide defines for slave mode selection
>   counter: Internalize sysfs interface code
>   counter: Update counter.h comments to reflect sysfs internalization
>   docs: counter: Update to reflect sysfs internalization
>   counter: Move counter enums to uapi header
>   counter: Add character device interface
>   docs: counter: Document character device interface
>   tools/counter: Create Counter tools
>   counter: Implement signalZ_action_component_id sysfs attribute
>   counter: Implement *_component_id sysfs attributes
>   counter: Implement events_queue_size sysfs attribute
>   counter: 104-quad-8: Replace mutex with spinlock
>   counter: 104-quad-8: Add IRQ support for the ACCES 104-QUAD-8
> 
>  Documentation/ABI/testing/sysfs-bus-counter   |   38 +-
>  Documentation/driver-api/generic-counter.rst  |  358 +++-
>  .../userspace-api/ioctl/ioctl-number.rst      |    1 +
>  MAINTAINERS                                   |    3 +-
>  drivers/counter/104-quad-8.c                  |  699 ++++----
>  drivers/counter/Kconfig                       |    6 +-
>  drivers/counter/Makefile                      |    1 +
>  drivers/counter/counter-chrdev.c              |  553 ++++++
>  drivers/counter/counter-chrdev.h              |   14 +
>  drivers/counter/counter-core.c                |  191 +++
>  drivers/counter/counter-sysfs.c               |  960 +++++++++++
>  drivers/counter/counter-sysfs.h               |   13 +
>  drivers/counter/counter.c                     | 1496 -----------------
>  drivers/counter/ftm-quaddec.c                 |   60 +-
>  drivers/counter/intel-qep.c                   |  144 +-
>  drivers/counter/interrupt-cnt.c               |   62 +-
>  drivers/counter/microchip-tcb-capture.c       |   91 +-
>  drivers/counter/stm32-lptimer-cnt.c           |  212 ++-
>  drivers/counter/stm32-timer-cnt.c             |  195 +--
>  drivers/counter/ti-eqep.c                     |  180 +-
>  include/linux/counter.h                       |  715 ++++----
>  include/linux/counter_enum.h                  |   45 -
>  include/linux/mfd/stm32-lptimer.h             |    5 +
>  include/linux/mfd/stm32-timers.h              |    4 +
>  include/uapi/linux/counter.h                  |  154 ++
>  tools/Makefile                                |   13 +-
>  tools/counter/Build                           |    1 +
>  tools/counter/Makefile                        |   53 +
>  tools/counter/counter_example.c               |   93 +
>  29 files changed, 3569 insertions(+), 2791 deletions(-)
>  create mode 100644 drivers/counter/counter-chrdev.c
>  create mode 100644 drivers/counter/counter-chrdev.h
>  create mode 100644 drivers/counter/counter-core.c
>  create mode 100644 drivers/counter/counter-sysfs.c
>  create mode 100644 drivers/counter/counter-sysfs.h
>  delete mode 100644 drivers/counter/counter.c
>  delete mode 100644 include/linux/counter_enum.h
>  create mode 100644 include/uapi/linux/counter.h
>  create mode 100644 tools/counter/Build
>  create mode 100644 tools/counter/Makefile
>  create mode 100644 tools/counter/counter_example.c
> 
> 
> base-commit: 5ffeb17c0d3dd44704b4aee83e297ec07666e4d6

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
