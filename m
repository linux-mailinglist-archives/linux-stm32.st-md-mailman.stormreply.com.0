Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE37481C14
	for <lists+linux-stm32@lfdr.de>; Thu, 30 Dec 2021 13:31:54 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0CFD9C5E2C5;
	Thu, 30 Dec 2021 12:31:54 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BAE16C5C829
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Dec 2021 12:31:51 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6CC94616A3;
 Thu, 30 Dec 2021 12:31:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00F9CC36AEA;
 Thu, 30 Dec 2021 12:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1640867509;
 bh=x2thwngD98NIaTMG6mDpgHTaaqtUUesBX+o4q4qEB94=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=U0j9yqXcjDUcOM7/N9oFZHfYSVAqMtu4c063RjKJ4V1o04WVLUMFmGN1oM1oiiA8m
 yeyRkRx99lvwYdPVFf9an+xo9GGRgyU7C32C7s6Siap9V3F0piIJrFDdObsWZKLhjD
 tHDV3QKdXrnfrtUK8XEekDUOqC4wUhoi8Cpxmsyc=
Date: Thu, 30 Dec 2021 13:31:46 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Message-ID: <Yc2msulJ2Uc5eJZN@kroah.com>
References: <20211229154441.38045-1-u.kleine-koenig@pengutronix.de>
 <20211230085351.pywngltvdam25emx@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211230085351.pywngltvdam25emx@pengutronix.de>
Cc: Kamel Bouhara <kamel.bouhara@bootlin.com>,
 David Lechner <david@lechnology.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-iio@vger.kernel.org, Patrick Havelange <patrick.havelange@essensium.com>,
 William Breathitt Gray <vilhelm.gray@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-kernel@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jarkko Nikula <jarkko.nikula@linux.intel.com>, kernel@pengutronix.de,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Oleksij Rempel <linux@rempel-privat.de>,
 Syed Nayyar Waris <syednwaris@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 00/23] counter: cleanups and device
	lifetime fixes
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Thu, Dec 30, 2021 at 09:53:51AM +0100, Uwe Kleine-K=F6nig wrote:
> Hello,
> =

> On Wed, Dec 29, 2021 at 04:44:18PM +0100, Uwe Kleine-K=F6nig wrote:
> > this is v3 of my series to fix device lifetime issues in the counter
> > framework. This hopefully addresses all things pointed out for v2.
> > =

> > Note this depends on 60f07e74f86b (which is in next) now. Full diffstat
> > below.
> > =

> > Things that could be further improved:
> > =

> > [...]
> > =

> > Uwe Kleine-K=F6nig (23):
> >   counter: Use container_of instead of drvdata to track counter_device
> >   counter: ftm-quaddec: Drop unused platform_set_drvdata()
> >   counter: microchip-tcb-capture: Drop unused platform_set_drvdata()
> >   counter: Provide a wrapper to access device private data
> >   counter: 104-quad-8: Convert to counter_priv() wrapper
> >   counter: interrupt-cnt: Convert to counter_priv() wrapper
> >   counter: microchip-tcb-capture: Convert to counter_priv() wrapper
> >   counter: intel-qep: Convert to counter_priv() wrapper
> >   counter: ftm-quaddec: Convert to counter_priv() wrapper
> >   counter: ti-eqep: Convert to counter_priv() wrapper
> >   counter: stm32-lptimer-cnt: Convert to counter_priv() wrapper
> >   counter: stm32-timer-cnt: Convert to counter_priv() wrapper
> >   counter: Provide alternative counter registration functions
> >   counter: Update documentation for new counter registration functions
> >   counter: 104-quad-8: Convert to new counter registration
> >   counter: interrupt-cnt: Convert to new counter registration
> >   counter: intel-qep: Convert to new counter registration
> >   counter: ftm-quaddec: Convert to new counter registration
> >   counter: microchip-tcb-capture: Convert to new counter registration
> >   counter: stm32-timer-cnt: Convert to new counter registration
> >   counter: stm32-lptimer-cnt: Convert to new counter registration
> >   counter: ti-eqep: Convert to new counter registration
> >   counter: remove old and now unused registration API
> > =

> >  Documentation/driver-api/generic-counter.rst |  10 +-
> >  drivers/counter/104-quad-8.c                 |  93 +++++-----
> >  drivers/counter/counter-core.c               | 186 ++++++++++++++-----
> >  drivers/counter/ftm-quaddec.c                |  36 ++--
> >  drivers/counter/intel-qep.c                  |  46 ++---
> >  drivers/counter/interrupt-cnt.c              |  38 ++--
> >  drivers/counter/microchip-tcb-capture.c      |  44 ++---
> >  drivers/counter/stm32-lptimer-cnt.c          |  51 ++---
> >  drivers/counter/stm32-timer-cnt.c            |  48 ++---
> >  drivers/counter/ti-eqep.c                    |  31 ++--
> >  include/linux/counter.h                      |  15 +-
> >  11 files changed, 356 insertions(+), 242 deletions(-)
> > =

> > Range-diff against v2:
> > [...]
> > =

> > base-commit: a7904a538933c525096ca2ccde1e60d0ee62c08e
> > prerequisite-patch-id: 9459ad8bc78190558df9123f8bebe28ca1c396ea
> =

> All patches have a blessing by at least one of William and Jonathan.
> The prerequisite commit (60f07e74f86b) is in Greg's char-misc-next branch.
> =

> Assuming noone still finds a problem in this series that requires me to
> respin I wonder who will pick it up? Greg?
> =

> Given that it fixes a possible use-after-free in all counter drivers,
> I'd like to see it hit before v5.17-rc1. For 5.16 it's probably too
> late.

Of course it is too later for 5.16, sorry.

I'll queue this up to my tree now, for 5.17-rc1, thanks.

greg k-h
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
