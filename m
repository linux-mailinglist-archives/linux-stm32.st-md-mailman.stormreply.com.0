Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B1FDF8B9E74
	for <lists+linux-stm32@lfdr.de>; Thu,  2 May 2024 18:24:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 604B5C6C83A;
	Thu,  2 May 2024 16:24:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0DFE0C62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  2 May 2024 16:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714667059; x=1746203059;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=8bnm0Mp6aA159OPgwtTWCVCezNkfmBxywIMR3Q9y61E=;
 b=hdcCpyUDZvvdCToFmmXt4gZiCjTmCLBwaNQa27b32oUOQs0eD4ECo1Qn
 UmUH6sPh4kdn2j21lWICIlg99l4277C9Ea6FVCXWJss2iXyECUzcTWrl7
 1MLcSsQYXw+pfhgAb+o4yAwFFdD28gNlcZvm6uWjHjRaCDou63vr6ICPe
 HEyR46v2zLN7NPmxQIWywWZLH626RdPRud5X3uXW/e5j0ZaGWbm17tSPs
 XRWYpPHyM4pS1mqDBdT/SlsEIh+PEXo0KQ77XVyw/RgCnIImk9H8mak6e
 7OWA9R1vMIK9F8chZFORLGTw8PacsWgZaoYTgdE0lVSs+kSF7/zpL0o/z A==;
X-CSE-ConnectionGUID: LGo9QlVLRua1f45y5BTTmw==
X-CSE-MsgGUID: fBwoH5YVR8WgMK79lV6xfw==
X-IronPort-AV: E=McAfee;i="6600,9927,11062"; a="10378784"
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; d="scan'208";a="10378784"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2024 09:24:11 -0700
X-CSE-ConnectionGUID: gyKOMwuERVWbe1SWC/Pk/g==
X-CSE-MsgGUID: 2BvGVijpR2OhXI8q1CaqkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; d="scan'208";a="31662271"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com)
 ([10.237.72.44])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2024 09:24:07 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
 by kekkonen.fi.intel.com (Postfix) with SMTP id 8C03A11FA94;
 Thu,  2 May 2024 19:24:04 +0300 (EEST)
Date: Thu, 2 May 2024 16:24:04 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Message-ID: <ZjO-JDBdHXVLbz5H@kekkonen.localdomain>
References: <20240502-master-v1-0-8bd109c6a3ba@collabora.com>
 <20240502155626.GD15807@pendragon.ideasonboard.com>
 <ZjO46Uo_tVcRTdA0@kekkonen.localdomain>
 <20240502160830.GB11443@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240502160830.GB11443@pendragon.ideasonboard.com>
Cc: Julien Massot <julien.massot@collabora.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Heiko Stuebner <heiko@sntech.de>, Dafna Hirschfeld <dafna@fastmail.com>,
 imx@lists.linux.dev, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Todor Tomov <todor.too@gmail.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 linux-tegra@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Konrad Dybcio <konrad.dybcio@linaro.org>, linux-samsung-soc@vger.kernel.org,
 Robert Foss <rfoss@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>, linux-staging@lists.linux.dev,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org,
 Chen-Yu Tsai <wens@csie.org>, Bingbu Cao <bingbu.cao@intel.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, linux-sunxi@lists.linux.dev,
 Tianshu Qiu <tian.shu.qiu@intel.com>, Yong Zhi <yong.zhi@intel.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Jai Luthra <j-luthra@ti.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-arm-msm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-renesas-soc@vger.kernel.org,
 Eugen Hristev <eugen.hristev@collabora.com>, Benoit Parrot <bparrot@ti.com>,
 Rui Miguel Silva <rmfrfs@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Yong Deng <yong.deng@magewell.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Martin Kepplinger <martink@posteo.de>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Michal Simek <michal.simek@amd.com>, linux-arm-kernel@lists.infradead.org,
 Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Purism Kernel Team <kernel@puri.sm>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, linux-kernel@vger.kernel.org,
 Dan Scally <djrscally@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org,
 Shawn Guo <shawnguo@kernel.org>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: Re: [Linux-stm32] [PATCH 0/2] Introduce
	v4l2_async_nf_unregister_cleanup
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

Hi Laurent,

On Thu, May 02, 2024 at 07:08:30PM +0300, Laurent Pinchart wrote:
> On Thu, May 02, 2024 at 04:01:45PM +0000, Sakari Ailus wrote:
> > On Thu, May 02, 2024 at 06:56:26PM +0300, Laurent Pinchart wrote:
> > > On Thu, May 02, 2024 at 05:22:20PM +0200, Julien Massot wrote:
> > > > Many drivers has
> > > >   v4l2_async_nf_unregister(&notifier);
> > > >   v4l2_async_nf_cleanup(&notifier);
> > > > 
> > > > Introduce a helper function to call both functions in one line.
> > > 
> > > Does this really go in the right direction ? For other objects (video
> > > devices, media devices, ...), the unregistration should be done at
> > > .remove() time, and the cleanup at .release() time (the operation called
> > > when the last reference to the object is released). This is needed to
> > > ensure proper lifetime management of the objects, and avoid a
> > > use-after-free for objects that can be reached from userspace.
> > > 
> > > It could be argued that the notifier isn't exposed to userspace, but can
> > > we guarantee that no driver will have a need to access the notifier in a
> > > code path triggered by a userspace operation ? I think it would be safer
> > > to adopt the same split for the nofifier unregistration and cleanup. In
> > > my opinion using the same rule across different APIs also make it easier
> > > for driver authors and for reviewers to get it right.
> > > 
> > > As shown by your series, lots of drivers call v4l2_async_nf_cleanup()
> > > and .remove() time instead of .release(). That's because most drivers
> > > get lifetime management wrong and don't even implement .release().
> > > That's something Sakari is addressing with ongoing work. This patch
> > > series seems to go in the opposite direction.
> > 
> > This still avoids the driver authors feeling they need to implement wrapper
> > functions for v4l2_async_nf_{unregister,cleanup}. I'd be in favour merging
> > this.
> > 
> > I don't see this getting in the way of adding use counts as the code will
> > need to be changed in any case.
> 
> Fixing the lifetime issues would essentially revert 2/2 and move the
> v4l2_async_nf_cleanup() call to .remove(). I don't think providing a
> helper that forces the cleanup at .remove() time is a good idea, it
> gives a false sense of doing things right to drivers. This is the same
> reason why devm_kzalloc() is so harmful, it gave the wrong message, and
> created (or participated in) all those lifetime issues.

I still prefer having devm_*alloc() functions than having the drivers open
coding the same -- with the same result. The frameworks won't enable doing
this right at the moment and I don't think drivers (or us!) should be
penalised for that. The driver authors will only change what they do, with
these patches or without, when told so. But we don't really have an
alternative today.

A similar situation exists with clk_unprepare() and clk_disable().

-- 
Kind regards,

Sakari Ailus
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
