Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F15D0320AD9
	for <lists+linux-stm32@lfdr.de>; Sun, 21 Feb 2021 15:03:21 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B017CC57191;
	Sun, 21 Feb 2021 14:03:21 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B7E92C5718A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 21 Feb 2021 14:03:19 +0000 (UTC)
Received: from archlinux (cpc108967-cmbg20-2-0-cust86.5-4.cable.virginm.net
 [81.101.6.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8E86E64EE0;
 Sun, 21 Feb 2021 14:03:15 +0000 (UTC)
Date: Sun, 21 Feb 2021 14:03:12 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: William Breathitt Gray <vilhelm.gray@gmail.com>
Message-ID: <20210221140312.299b0e5a@archlinux>
In-Reply-To: <YCsfXGzfEgRAD9p9@shinobu>
References: <cover.1613131238.git.vilhelm.gray@gmail.com>
 <7fa80c10fcd10d1d47d1bddced2b2cca3ff59ba9.1613131238.git.vilhelm.gray@gmail.com>
 <20210214171021.41b3e4e3@archlinux> <YCsfXGzfEgRAD9p9@shinobu>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, david@lechnology.com,
 linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 alexandre.belloni@bootlin.com, mcoquelin.stm32@gmail.com,
 linux-kernel@vger.kernel.org, o.rempel@pengutronix.de, kernel@pengutronix.de,
 fabrice.gasnier@st.com, syednwaris@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 alexandre.torgue@st.com
Subject: Re: [Linux-stm32] [PATCH v8 10/22] counter: Standardize to ERANGE
 for limit exceeded errors
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

On Tue, 16 Feb 2021 10:26:52 +0900
William Breathitt Gray <vilhelm.gray@gmail.com> wrote:

> On Sun, Feb 14, 2021 at 05:10:21PM +0000, Jonathan Cameron wrote:
> > On Fri, 12 Feb 2021 21:13:34 +0900
> > William Breathitt Gray <vilhelm.gray@gmail.com> wrote:
> >   
> > > ERANGE is a semantically better error code to return when an argument
> > > value falls outside the supported limit range of a device.  
> > 
> > #define	ERANGE		34	/* Math result not representable */
> > 
> > Not generally applicable to a parameter being out of range
> > despite the name.
> > #define	EINVAL		22	/* Invalid argument */
> > Is probably closer to what we want to describe here.
> > 
> > Jonathan  
> 
> The comment for ERANGE in error-base.h may be terse to a fault. I
> believe there's a connotation here provided by ERANGE that is absent
> from EINVAL: primarily that the device buffer is incapable of supporting
> the desired value (i.e. there is a hardware limitation).
> 
> This is why strtoul() returns ERANGE if the correct value is outside the
> range of representable values: the result of the operation is valid in
> theory (it would be an unsigned integer), but it cannot be returned to
> the user due to a limitation of the hardware to support that value (e.g.
> 32-bit registers) [1].
> 
> The changes in this patch follow the same logic: these are arguments
> that are valid in theory (e.g. they are unsigned integers), but the
> underlying devices are incapable of processing such a value (e.g. the
> 104-QUAD-8 can only handle 24-bit values).
> 
> [1] https://stackoverflow.com/a/34981398/1806289

Its a bit of a stretch, but I can't claim to feel that strongly about
this.

Jonathan

> 
> William Breathitt Gray

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
