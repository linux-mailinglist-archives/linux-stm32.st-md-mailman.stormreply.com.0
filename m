Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1086946B968
	for <lists+linux-stm32@lfdr.de>; Tue,  7 Dec 2021 11:45:49 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B6BDDC5F1E8;
	Tue,  7 Dec 2021 10:45:48 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7D611C57183
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Dec 2021 10:45:44 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10190"; a="224809065"
X-IronPort-AV: E=Sophos;i="5.87,293,1631602800"; d="scan'208";a="224809065"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2021 02:44:21 -0800
X-IronPort-AV: E=Sophos;i="5.87,293,1631602800"; d="scan'208";a="563425275"
Received: from smile.fi.intel.com ([10.237.72.184])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2021 02:44:11 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1muXwD-003B63-00; Tue, 07 Dec 2021 12:43:09 +0200
Date: Tue, 7 Dec 2021 12:43:08 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Baruch Siach <baruch@tkos.co.il>
Message-ID: <Ya86vFcRJjM30xQ/@smile.fi.intel.com>
References: <20211202210839.79140-1-andriy.shevchenko@linux.intel.com>
 <20211207080325.6hfokrrcs45iucx6@pengutronix.de>
 <87ilw0on3z.fsf@tarshish>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87ilw0on3z.fsf@tarshish>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: Heiko Stuebner <heiko@sntech.de>, Tony Lindgren <tony@atomide.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Chunyan Zhang <chunyan.zhang@unisoc.com>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Florian Fainelli <f.fainelli@gmail.com>, Chunyan Zhang <zhang.lyra@gmail.com>,
 linux-rockchip@lists.infradead.org, Marc Zyngier <maz@kernel.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Jonathan Hunter <jonathanh@nvidia.com>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 bcm-kernel-feedback-list@broadcom.com,
 Alexandru Ardelean <aardelean@deviqon.com>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Orson Zhai <orsonzhai@gmail.com>, Grygorii Strashko <grygorii.strashko@ti.com>,
 Thierry Reding <treding@nvidia.com>, Jianqun Xu <jay.xu@rock-chips.com>,
 linux-pwm@vger.kernel.org, Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Ray Jui <rjui@broadcom.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Vladimir Zapolskiy <vz@mleia.com>,
 linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Gregory Fong <gregory.0xf0@gmail.com>, Santosh Shilimkar <ssantosh@kernel.org>,
 linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Scott Branden <sbranden@broadcom.com>,
 linux-unisoc@lists.infradead.org, patches@opensource.cirrus.com,
 Kevin Hilman <khilman@kernel.org>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Keerthy <j-keerthy@ti.com>, Baolin Wang <baolin.wang7@gmail.com>,
 linux-power@fi.rohmeurope.com
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Tue, Dec 07, 2021 at 10:05:08AM +0200, Baruch Siach wrote:
> On Tue, Dec 07 2021, Uwe Kleine-K=F6nig wrote:
> > Hello Andy,
> >
> > you Cc: linux-pwm and the pwm maintainers in this series. I don't spot
> > anything pwm specific here (apart from touching gpio-mvebu which also
> > contains a PWM driver). Do I miss something?

Thanks for your eagle eye! For the record I don't do this list manually,
I used the get_maintainer.pl's heuristics [1]. Usually it gives me more
than 95% correct prediction, so I believe here is no smoke without flame
(and it seems what Baruch discovered as well).

> That's probably because of drivers/gpio/gpio-mvebu.c that appears in the
> MAINTAINERS PWM entry.

[1]: https://github.com/andy-shev/home-bin-tools/blob/master/ge2maintainer.=
sh

-- =

With Best Regards,
Andy Shevchenko


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
