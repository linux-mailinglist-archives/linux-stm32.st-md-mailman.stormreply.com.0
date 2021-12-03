Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 71BA4467763
	for <lists+linux-stm32@lfdr.de>; Fri,  3 Dec 2021 13:26:57 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 16B7CC5F1DB;
	Fri,  3 Dec 2021 12:26:57 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 188C3CFAC52
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  3 Dec 2021 12:26:54 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10186"; a="224209910"
X-IronPort-AV: E=Sophos;i="5.87,284,1631602800"; d="scan'208";a="224209910"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2021 04:26:46 -0800
X-IronPort-AV: E=Sophos;i="5.87,284,1631602800"; d="scan'208";a="678082863"
Received: from smile.fi.intel.com ([10.237.72.184])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2021 04:26:35 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1mt7d5-001lPG-5I; Fri, 03 Dec 2021 14:25:31 +0200
Date: Fri, 3 Dec 2021 14:25:30 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Message-ID: <YaoMuoONxbJb0prf@smile.fi.intel.com>
References: <20211202210839.79140-1-andriy.shevchenko@linux.intel.com>
 <CAMRc=Md-TKUETLzf41D2KeQODac153_AumMTW4928XfJ70GRxQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMRc=Md-TKUETLzf41D2KeQODac153_AumMTW4928XfJ70GRxQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: Baruch Siach <baruch@tkos.co.il>, Heiko Stuebner <heiko@sntech.de>,
 Tony Lindgren <tony@atomide.com>, Linus Walleij <linus.walleij@linaro.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Chunyan Zhang <chunyan.zhang@unisoc.com>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Florian Fainelli <f.fainelli@gmail.com>, Chunyan Zhang <zhang.lyra@gmail.com>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Marc Zyngier <maz@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 Alexandru Ardelean <aardelean@deviqon.com>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Orson Zhai <orsonzhai@gmail.com>, Grygorii Strashko <grygorii.strashko@ti.com>,
 Thierry Reding <treding@nvidia.com>, Jianqun Xu <jay.xu@rock-chips.com>,
 linux-pwm@vger.kernel.org, Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Ray Jui <rjui@broadcom.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Vladimir Zapolskiy <vz@mleia.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>,
 Gregory Fong <gregory.0xf0@gmail.com>, Santosh Shilimkar <ssantosh@kernel.org>,
 linux-tegra@vger.kernel.org, Linux-OMAP <linux-omap@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Scott Branden <sbranden@broadcom.com>, linux-unisoc@lists.infradead.org,
 patches@opensource.cirrus.com, Kevin Hilman <khilman@kernel.org>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Keerthy <j-keerthy@ti.com>,
 Baolin Wang <baolin.wang7@gmail.com>,
 linux-power <linux-power@fi.rohmeurope.com>
Subject: Re: [Linux-stm32] [PATCH v1 1/3] gpio: Get rid of duplicate of_node
 assignment in the drivers
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

On Fri, Dec 03, 2021 at 09:40:55AM +0100, Bartosz Golaszewski wrote:
> On Thu, Dec 2, 2021 at 10:17 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> >
> > GPIO library does copy the of_node from the parent device of
> > the GPIO chip, there is no need to repeat this in the individual
> > drivers. Remove these assignment all at once.
> >
> > For the details one may look into the of_gpio_dev_init() implementation.
> >
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > ---
> 
> I have a bad feeling about this but I've gone through the drivers in
> this patch and it seems like you don't update any of the drivers that
> use multiple child OF nodes so I can't really point out any obvious
> bug.

Yes, like I said it's just a series to kick off the conversion.
I left the corner cases to the last.

> I have another change I'm working on that's related, let me send it shortly.

Do you mean it should be attached to the series?

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
