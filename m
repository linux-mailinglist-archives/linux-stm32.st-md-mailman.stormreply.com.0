Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ED5B1993A20
	for <lists+linux-stm32@lfdr.de>; Tue,  8 Oct 2024 00:25:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EB839C6DD9F;
	Mon,  7 Oct 2024 22:25:16 +0000 (UTC)
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1FED8C6C855
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  7 Oct 2024 22:25:10 +0000 (UTC)
Received: from pendragon.ideasonboard.com (unknown [132.205.230.14])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3BF2C2E0;
 Tue,  8 Oct 2024 00:23:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1728339812;
 bh=dP+7pB+yKyOf0NQhF4Ey5QlbknqrHAfw9DP+SkAi1ag=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Vt/jQpsJvHUxjmrGDOx6XdDb5/eYcmNOZ+fqGvfgmsCX/Gb8xh5L8MF7/XiaHHs5d
 yKwoK1M07KNVU8k6VzBH5mlVNl0fsdfcm8rX4+3gQCvlKP9vNnMhm8hVpFB58jMlbq
 3JlQ6yo4ObX+z3BTaIVDayxCEaIiiFVwmh4Cxqis=
Date: Tue, 8 Oct 2024 01:25:02 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Message-ID: <20241007222502.GG30699@pendragon.ideasonboard.com>
References: <20241004094101.113349-1-sakari.ailus@linux.intel.com>
 <CAPDyKFp0N6UJhnHS164Tdf=xkWB0jzq65L9TdvYazeBQ-6WjeQ@mail.gmail.com>
 <20241007184924.GH14766@pendragon.ideasonboard.com>
 <CAPDyKFpQVnF7eQv3dup8k-3EijnMjuveCG9sZ=Rpey1Y6MBJEg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPDyKFpQVnF7eQv3dup8k-3EijnMjuveCG9sZ=Rpey1Y6MBJEg@mail.gmail.com>
Cc: imx@lists.linux.dev, rafael@kernel.org, linux-iio@vger.kernel.org,
 nouveau@lists.freedesktop.org, linux-pci@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mtd@lists.infradead.org,
 linux-i2c@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-i3c@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 asahi@lists.linux.dev, linux-staging@lists.linux.dev,
 Andy Shevchenko <andy.shevchenko@gmail.com>, amd-gfx@lists.freedesktop.org,
 linux-clk@vger.kernel.org, iommu@lists.linux.dev, linux-serial@vger.kernel.org,
 linux-input@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-media@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, greybus-dev@lists.linaro.org,
 patches@opensource.cirrus.com, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-bluetooth@vger.kernel.org,
 linux-crypto@vger.kernel.org, Sakari Ailus <sakari.ailus@linux.intel.com>,
 netdev@vger.kernel.org, dmaengine@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 00/51] treewide: Switch to
	__pm_runtime_put_autosuspend()
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

Hi Ulf,

On Tue, Oct 08, 2024 at 12:08:24AM +0200, Ulf Hansson wrote:
> On Mon, 7 Oct 2024 at 20:49, Laurent Pinchart wrote:
> > On Fri, Oct 04, 2024 at 04:38:36PM +0200, Ulf Hansson wrote:
> > > On Fri, 4 Oct 2024 at 11:41, Sakari Ailus wrote:
> > > >
> > > > Hello everyone,
> > > >
> > > > This set will switch the users of pm_runtime_put_autosuspend() to
> > > > __pm_runtime_put_autosuspend() while the former will soon be re-purposed
> > > > to include a call to pm_runtime_mark_last_busy(). The two are almost
> > > > always used together, apart from bugs which are likely common. Going
> > > > forward, most new users should be using pm_runtime_put_autosuspend().
> > > >
> > > > Once this conversion is done and pm_runtime_put_autosuspend() re-purposed,
> > > > I'll post another set to merge the calls to __pm_runtime_put_autosuspend()
> > > > and pm_runtime_mark_last_busy().
> > >
> > > That sounds like it could cause a lot of churns.
> > >
> > > Why not add a new helper function that does the
> > > pm_runtime_put_autosuspend() and the pm_runtime_mark_last_busy()
> > > things? Then we can start moving users over to this new interface,
> > > rather than having this intermediate step?
> >
> > I think the API would be nicer if we used the shortest and simplest
> > function names for the most common use cases. Following
> > pm_runtime_put_autosuspend() with pm_runtime_mark_last_busy() is that
> > most common use case. That's why I like Sakari's approach of repurposing
> > pm_runtime_put_autosuspend(), and introducing
> > __pm_runtime_put_autosuspend() for the odd cases where
> > pm_runtime_mark_last_busy() shouldn't be called.
> 
> Okay, so the reason for this approach is because we couldn't find a
> short and descriptive name that could be used in favor of
> pm_runtime_put_autosuspend(). Let me throw some ideas at it and maybe
> you like it - or not. :-)

I like the idea at least :-)

> I don't know what options you guys discussed, but to me the entire
> "autosuspend"-suffix isn't really that necessary in my opinion. There
> are more ways than calling pm_runtime_put_autosuspend() that triggers
> us to use the RPM_AUTO flag for rpm_suspend(). For example, just
> calling pm_runtime_put() has the similar effect.

To be honest, I'm lost there. pm_runtime_put() calls
__pm_runtime_idle(RPM_GET_PUT | RPM_ASYNC), while
pm_runtime_put_autosuspend() calls __pm_runtime_suspend(RPM_GET_PUT |
RPM_ASYNC | RPM_AUTO).

> 
> Moreover, it's similar for pm_runtime_mark_last_busy(), it's called
> during rpm_resume() too, for example. So why bother about having
> "mark_last_busy" in the new name too.
> 
> That said, my suggestion is simply "pm_runtime_put_suspend".

Can we do even better, and make pm_runtime_put() to handle autosuspend
automatically when autosuspend is enabled ?

> If you don't like it, I will certainly not object to your current
> approach, even if I think it leads to unnecessary churns.
> 
> [...]
> 
> Kind regards
> Uffe

-- 
Regards,

Laurent Pinchart
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
