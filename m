Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C214D41DFF4
	for <lists+linux-stm32@lfdr.de>; Thu, 30 Sep 2021 19:17:53 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 686C1C5A4CD;
	Thu, 30 Sep 2021 17:17:53 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 01F38C597AB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Sep 2021 17:17:51 +0000 (UTC)
Received: from jic23-huawei (cpc108967-cmbg20-2-0-cust86.5-4.cable.virginm.net
 [81.101.6.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B78F66137A;
 Thu, 30 Sep 2021 17:17:45 +0000 (UTC)
Date: Thu, 30 Sep 2021 18:21:40 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: William Breathitt Gray <vilhelm.gray@gmail.com>
Message-ID: <20210930182140.0475e772@jic23-huawei>
In-Reply-To: <cover.1632884256.git.vilhelm.gray@gmail.com>
References: <cover.1632884256.git.vilhelm.gray@gmail.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, david@lechnology.com,
 Peter Rosin <peda@axentia.se>, linux-iio@vger.kernel.org,
 patrick.havelange@essensium.com, alexandre.belloni@bootlin.com,
 mcoquelin.stm32@gmail.com, linux-kernel@vger.kernel.org,
 o.rempel@pengutronix.de, jarkko.nikula@linux.intel.com, kernel@pengutronix.de,
 fabrice.gasnier@st.com, syednwaris@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 alexandre.torgue@st.com
Subject: Re: [Linux-stm32] [PATCH v17 0/9] Introduce the Counter character
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

On Wed, 29 Sep 2021 12:15:57 +0900
William Breathitt Gray <vilhelm.gray@gmail.com> wrote:

> Changes in v17:
>  - A couple minor improvements to documentation from review suggestions
>  - chrdev_lock redeclared as atomic_t; BITMAP was not necessary because
>    chrdev_lock is a single flag
>  - test_and_set_bit_lock(), clear_bit_unlock(), and clear_bit(),
>    replaced respectively with atomic_add_unless(), atomic_dec(), and
>    atomic_set()
>  - counter_comp_read_is_equal() and counter_comp_read_is_set() macros
>    implemented in order to properly test counter_comp structures' read
>    callback states
>  - counter_sysfs_add() call performed before counter_chrdev_add() call
>    in counter_register() in order to match unwinding sequence
>  - for-loop utilized in counter-example.c in order to simplify code
>  - counter-example.c returns 1 on error instead of -errno; errno may be
>    modified after a subsequent library call so we can't depend on it
> 
> For convenience, this patchset is also available on my personal git
> repo: https://gitlab.com/vilhelmgray/iio/-/tree/counter_chrdev_v17
> 
> A Counter character device interface is introduced that allows Counter
> events and associated data to be read() by userspace; the
> events_configure() and watch_validate() driver callbacks are introduced
> to support Counter events; and IRQ support is added to the
> 104-QUAD-8 driver, serving as an example of how to support the new
> Counter events functionality.

Applied to the togreg branch of iio.git and pushed out as testing for
0-day to see if we missed anything!

I couldn't resist hitting lore.kernel.org for some archaeology on whether
this broke records for a series on the IIO list (i.e. one I'd actually
reviewed :)

It has the dubious honour of being the only series to reach v17 that has
been posted to linux-iio@vger.kernel.org as far as records go back.

Peter Rosin's MUX series got to v15 and that seems to be the previous
record holder joint with an mxs-lradc set from a while back.

Perhaps not a record you wanted to get, but it shows impressive grit
and determination!

Jonathan

> 
> William Breathitt Gray (9):
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
>  Documentation/ABI/testing/sysfs-bus-counter   |  29 +
>  Documentation/driver-api/generic-counter.rst  | 177 ++++--
>  .../userspace-api/ioctl/ioctl-number.rst      |   1 +
>  MAINTAINERS                                   |   2 +
>  drivers/counter/104-quad-8.c                  | 256 ++++++--
>  drivers/counter/Kconfig                       |   6 +-
>  drivers/counter/Makefile                      |   2 +-
>  drivers/counter/counter-chrdev.c              | 578 ++++++++++++++++++
>  drivers/counter/counter-chrdev.h              |  14 +
>  drivers/counter/counter-core.c                |  56 +-
>  drivers/counter/counter-sysfs.c               | 123 +++-
>  include/linux/counter.h                       |  98 +--
>  include/uapi/linux/counter.h                  | 154 +++++
>  tools/Makefile                                |  13 +-
>  tools/counter/Build                           |   1 +
>  tools/counter/Makefile                        |  53 ++
>  tools/counter/counter_example.c               |  92 +++
>  17 files changed, 1509 insertions(+), 146 deletions(-)
>  create mode 100644 drivers/counter/counter-chrdev.c
>  create mode 100644 drivers/counter/counter-chrdev.h
>  create mode 100644 include/uapi/linux/counter.h
>  create mode 100644 tools/counter/Build
>  create mode 100644 tools/counter/Makefile
>  create mode 100644 tools/counter/counter_example.c
> 
> 
> base-commit: a5ae0cfd53aaf031c2e9ba048281776fa67047c2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
