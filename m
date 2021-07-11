Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 05EEC3C3D17
	for <lists+linux-stm32@lfdr.de>; Sun, 11 Jul 2021 15:46:16 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 98C28C57B6B;
	Sun, 11 Jul 2021 13:46:15 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F389AC3FAD6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 11 Jul 2021 13:46:13 +0000 (UTC)
Received: from jic23-huawei (cpc108967-cmbg20-2-0-cust86.5-4.cable.virginm.net
 [81.101.6.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 982D26115B;
 Sun, 11 Jul 2021 13:46:09 +0000 (UTC)
Date: Sun, 11 Jul 2021 14:48:28 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: William Breathitt Gray <vilhelm.gray@gmail.com>
Message-ID: <20210711144828.795ca342@jic23-huawei>
In-Reply-To: <cover.1625471640.git.vilhelm.gray@gmail.com>
References: <cover.1625471640.git.vilhelm.gray@gmail.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, david@lechnology.com,
 linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 alexandre.belloni@bootlin.com, mcoquelin.stm32@gmail.com,
 linux-kernel@vger.kernel.org, o.rempel@pengutronix.de,
 jarkko.nikula@linux.intel.com, kernel@pengutronix.de, fabrice.gasnier@st.com,
 syednwaris@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, alexandre.torgue@st.com
Subject: Re: [Linux-stm32] [PATCH v12 00/17] Introduce the Counter character
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

On Mon,  5 Jul 2021 17:18:48 +0900
William Breathitt Gray <vilhelm.gray@gmail.com> wrote:

> Changes in v12:
>  - Move unlock to after register set in quad8_count_ceiling_write()
>  - Add locking protection to counter_set_event_node()
>  - Fix sparse warning by using {} instead of {0}
>  - Clean up and organize comments for clarity
>  - Reduce boilerplate by utilizing devm_add_action_or_reset()
>  - Use switch statements in ti_eqep_action_read() to make possible cases
>    more obvious
> 
> I pulled out a lot of bits and pieces to their own patches; hopefully
> that makes reviewing this patchset much simpler than before. This
> patchset is also available on my personal git repo for convenience:
> https://gitlab.com/vilhelmgray/iio/-/tree/counter_chrdev_v12
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
> 
> Something that should still be discussed: should the struct
> counter_event "status" member be 8 bits or 32 bits wide? This member
> will provide the return status (system error number) of an event
> operation.

Hi william,

I've looked through the lot and where I haven't commented, I had nothing
much to add to David's comments.

I'm not planning to go through the whole thing again unless major changes
occur. Fingers crossed for v13.

If it looks like there are still some unresolved issues after that, perhaps
applying up to patch 8 or so makes sense to reduced the volume of code you
are carrying.  Let me know if you'd like me to do that.

Thanks,

Jonathan

> 
> William Breathitt Gray (17):
>   counter: 104-quad-8: Return error when invalid mode during
>     ceiling_write
>   counter: Return error code on invalid modes
>   counter: Standardize to ERANGE for limit exceeded errors
>   counter: Rename counter_signal_value to counter_signal_level
>   counter: Rename counter_count_function to counter_function
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
>  Documentation/driver-api/generic-counter.rst  |  366 +++-
>  .../userspace-api/ioctl/ioctl-number.rst      |    1 +
>  MAINTAINERS                                   |    3 +-
>  drivers/counter/104-quad-8.c                  |  728 ++++----
>  drivers/counter/Kconfig                       |    6 +-
>  drivers/counter/Makefile                      |    1 +
>  drivers/counter/counter-chrdev.c              |  498 ++++++
>  drivers/counter/counter-chrdev.h              |   14 +
>  drivers/counter/counter-core.c                |  182 ++
>  drivers/counter/counter-sysfs.c               |  953 +++++++++++
>  drivers/counter/counter-sysfs.h               |   13 +
>  drivers/counter/counter.c                     | 1496 -----------------
>  drivers/counter/ftm-quaddec.c                 |   59 +-
>  drivers/counter/intel-qep.c                   |  150 +-
>  drivers/counter/interrupt-cnt.c               |   73 +-
>  drivers/counter/microchip-tcb-capture.c       |  103 +-
>  drivers/counter/stm32-lptimer-cnt.c           |  176 +-
>  drivers/counter/stm32-timer-cnt.c             |  147 +-
>  drivers/counter/ti-eqep.c                     |  205 ++-
>  include/linux/counter.h                       |  716 ++++----
>  include/linux/counter_enum.h                  |   45 -
>  include/uapi/linux/counter.h                  |  133 ++
>  tools/Makefile                                |   13 +-
>  tools/counter/Build                           |    1 +
>  tools/counter/Makefile                        |   53 +
>  tools/counter/counter_example.c               |   95 ++
>  27 files changed, 3501 insertions(+), 2767 deletions(-)
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
> base-commit: 6cbb3aa0f9d5d23221df787cf36f74d3866fdb78

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
