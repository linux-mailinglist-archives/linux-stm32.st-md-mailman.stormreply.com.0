Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 44CF13E4D1B
	for <lists+linux-stm32@lfdr.de>; Mon,  9 Aug 2021 21:32:13 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E4970C57B51;
	Mon,  9 Aug 2021 19:32:12 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AB2A1C57196
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Aug 2021 19:32:10 +0000 (UTC)
Received: from jic23-huawei (cpc108967-cmbg20-2-0-cust86.5-4.cable.virginm.net
 [81.101.6.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E0EE760551;
 Mon,  9 Aug 2021 19:32:04 +0000 (UTC)
Date: Mon, 9 Aug 2021 20:34:55 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: William Breathitt Gray <vilhelm.gray@gmail.com>
Message-ID: <20210809203455.59ad5a61@jic23-huawei>
In-Reply-To: <cover.1628511445.git.vilhelm.gray@gmail.com>
References: <cover.1628511445.git.vilhelm.gray@gmail.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, david@lechnology.com,
 linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 alexandre.belloni@bootlin.com, mcoquelin.stm32@gmail.com,
 linux-kernel@vger.kernel.org, o.rempel@pengutronix.de,
 jarkko.nikula@linux.intel.com, kernel@pengutronix.de, fabrice.gasnier@st.com,
 syednwaris@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, alexandre.torgue@st.com
Subject: Re: [Linux-stm32] [PATCH v15 00/13] Introduce the Counter character
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

On Mon,  9 Aug 2021 21:37:25 +0900
William Breathitt Gray <vilhelm.gray@gmail.com> wrote:

> Changes in v15:
>  - Move the description for the member 'lock' in the 'quad8' structure
>    as a separate patch
>  - Reorganize the "counter: Internalize sysfs interface code" patch to
>    not call chrdev code; respective code moved to the "counter: Add
>    character device interface" patch with the other chrdev code
>  - Custom enums removed from the ftm-quaddec.c, stm32-lptimer-cnt.c, and
>    stm32-timer-cnt.c files; respective drivers refactored to use the
>    COUNTER_FUNCTION_* and COUNTER_SYNAPSE_* enum constants instead
Given this last one isn't trivial, I'll let patch 2 onwards sit
on the list for a little while just to see if anyone wants to take
a look at those changes.  Then I'll take up to patch 5. Whilst some
are precursors to the later patches, they don't do any harm and
will reduce the amount we are asking people to review going forwards.

As for the chrdev part.   My gut feeling is that needs more eyes
yet despite being fairly stable in form for a while now.
I'll try and take another look, and would definitely encourage
others to look at it as well.

New ABI is hard to get right so needs a bit more time than many other
forms of patch set.

Jonathan

> 
> For convenience, this patchset is also available on my personal git
> repo: https://gitlab.com/vilhelmgray/iio/-/tree/counter_chrdev_v15
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
> William Breathitt Gray (13):
>   counter: 104-quad-8: Describe member 'lock' in 'quad8'
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
>  drivers/counter/104-quad-8.c                  |  700 ++++----
>  drivers/counter/Kconfig                       |    6 +-
>  drivers/counter/Makefile                      |    1 +
>  drivers/counter/counter-chrdev.c              |  553 ++++++
>  drivers/counter/counter-chrdev.h              |   14 +
>  drivers/counter/counter-core.c                |  191 +++
>  drivers/counter/counter-sysfs.c               |  962 +++++++++++
>  drivers/counter/counter-sysfs.h               |   13 +
>  drivers/counter/counter.c                     | 1496 -----------------
>  drivers/counter/ftm-quaddec.c                 |   60 +-
>  drivers/counter/intel-qep.c                   |  144 +-
>  drivers/counter/interrupt-cnt.c               |   62 +-
>  drivers/counter/microchip-tcb-capture.c       |   91 +-
>  drivers/counter/stm32-lptimer-cnt.c           |  226 +--
>  drivers/counter/stm32-timer-cnt.c             |  179 +-
>  drivers/counter/ti-eqep.c                     |  180 +-
>  include/linux/counter.h                       |  715 ++++----
>  include/linux/counter_enum.h                  |   45 -
>  include/uapi/linux/counter.h                  |  154 ++
>  tools/Makefile                                |   13 +-
>  tools/counter/Build                           |    1 +
>  tools/counter/Makefile                        |   53 +
>  tools/counter/counter_example.c               |   93 +
>  27 files changed, 3568 insertions(+), 2784 deletions(-)
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
> base-commit: c886885336b0b5f1a08ce580f7201a2ca30ab041
> prerequisite-patch-id: 8ca55ffcdd5d060dd5fa2b4dd50bf01dc1026da6
> prerequisite-patch-id: 46ef2668ca6bdc0d08dd488fe1d2b886189a5652
> prerequisite-patch-id: 2df1946c917d6408148306db30a071e67b00ad73
> prerequisite-patch-id: f81579f50552e6041a95403cc743c5f36962b111
> prerequisite-patch-id: 8a6860e75cdec162812c56dc39c5d7fc6fc5154e

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
