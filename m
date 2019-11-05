Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 047E4EFFB7
	for <lists+linux-stm32@lfdr.de>; Tue,  5 Nov 2019 15:29:00 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B7CB4C36B0B;
	Tue,  5 Nov 2019 14:28:59 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4FA40C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 Nov 2019 14:28:56 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Nov 2019 06:28:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,271,1569308400"; d="scan'208";a="195835022"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga008.jf.intel.com with ESMTP; 05 Nov 2019 06:28:39 -0800
Received: from andy by smile with local (Exim 4.93-RC1)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1iRzoy-00040T-Om; Tue, 05 Nov 2019 16:28:36 +0200
Date: Tue, 5 Nov 2019 16:28:36 +0200
From: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Message-ID: <20191105142836.GS32742@smile.fi.intel.com>
References: <cover.1572875541.git.matti.vaittinen@fi.rohmeurope.com>
 <20191105122042.GO32742@smile.fi.intel.com>
 <4e6fa62d7022c7b1426477a150a93c899725f5b0.camel@fi.rohmeurope.com>
 <20191105131038.duol3rwwkbuvgvwv@pengutronix.de>
 <20191105133025.GR32742@smile.fi.intel.com>
 <20191105134026.vl6h6kghuzmslptx@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191105134026.vl6h6kghuzmslptx@pengutronix.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "semi.malinen@ge.com" <semi.malinen@ge.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "david.daney@cavium.com" <david.daney@cavium.com>,
 "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
 "sathyanarayanan.kuppuswamy@linux.intel.com"
 <sathyanarayanan.kuppuswamy@linux.intel.com>,
 "ptyser@xes-inc.com" <ptyser@xes-inc.com>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 "marek.behun@nic.cz" <marek.behun@nic.cz>,
 "festevam@gmail.com" <festevam@gmail.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "marek.vasut+renesas@gmail.com" <marek.vasut+renesas@gmail.com>,
 "f.fainelli@gmail.com" <f.fainelli@gmail.com>,
 "khilman@kernel.org" <khilman@kernel.org>,
 "michal.simek@xilinx.com" <michal.simek@xilinx.com>,
 "jonathanh@nvidia.com" <jonathanh@nvidia.com>,
 "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
 "ludovic.desroches@microchip.com" <ludovic.desroches@microchip.com>,
 "bamv2005@gmail.com" <bamv2005@gmail.com>, "joel@jms.id.au" <joel@jms.id.au>,
 "nandor.han@ge.com" <nandor.han@ge.com>,
 "bcm-kernel-feedback-list@broadcom.com"
 <bcm-kernel-feedback-list@broadcom.com>,
 "linux-imx@nxp.com" <linux-imx@nxp.com>,
 "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>,
 "grygorii.strashko@ti.com" <grygorii.strashko@ti.com>,
 "ckeepax@opensource.cirrus.com" <ckeepax@opensource.cirrus.com>,
 "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
 "rjui@broadcom.com" <rjui@broadcom.com>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "vilhelm.gray@gmail.com" <vilhelm.gray@gmail.com>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "rf@opensource.cirrus.com" <rf@opensource.cirrus.com>,
 "ssantosh@kernel.org" <ssantosh@kernel.org>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "sbranden@broadcom.com" <sbranden@broadcom.com>,
 "yamada.masahiro@socionext.com" <yamada.masahiro@socionext.com>,
 "andrew@aj.id.au" <andrew@aj.id.au>, "info@metux.net" <info@metux.net>,
 "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "t.scherer@eckelmann.de" <t.scherer@eckelmann.de>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "patches@opensource.cirrus.com" <patches@opensource.cirrus.com>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>
Subject: Re: [Linux-stm32] [PATCH 00/62] Add definition for GPIO direction
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

On Tue, Nov 05, 2019 at 02:40:26PM +0100, Uwe Kleine-K=F6nig wrote:
> On Tue, Nov 05, 2019 at 03:30:25PM +0200, andriy.shevchenko@linux.intel.c=
om wrote:
> > On Tue, Nov 05, 2019 at 02:10:38PM +0100, Uwe Kleine-K=F6nig wrote:
> > > On Tue, Nov 05, 2019 at 12:54:55PM +0000, Vaittinen, Matti wrote:
> > > > On Tue, 2019-11-05 at 14:20 +0200, Andy Shevchenko wrote:
> > > > > I would also like to see bloat-o-meter statistics before and after
> > > > > your patch.
> > > > > My guts tell me that the result will be not in the favour of yours
> > > > > solution.
> > > > =

> > > > Can you please tell me what type of stats you hope to see? I can try
> > > > generating what you are after. The cover letter contained typical +=
/-
> > > > change stats from git and summary:
> > > > =

> > > > 62 files changed, 228 insertions(+), 104 deletions(-)
> > > =

> > > I guess he wants to see
> > > =

> > > 	scripts/bloat-o-meter vmlinuz.old vmlinuz
> > =

> > Yes, but be sure you have compiled them all and build them all in.
> > Otherwise you might get wrong result.
> > =

> > > . I would expect a 0 there. I didn't look in detail, but in general I
> > > like the idea to give 0 and 1 a symbolic name.
> > =

> > I'll will be fine with that if and only if maintainers are okay. For no=
w,
> > I don't like the idea to trade bad for worse.
> =

> I don't see you concern.
> =

> 	int somefunction(...)
> 	{
> 		return 1;
> 	}
> =

> is definitively worse than
> =

> 	int somefunction(...)
> 	{
> 		return GPIO_LINE_DIRECTION_IN;
> 	}
> =

> and after cpp had its go on the source the compiler sees the exact same
> thing, so I don't expect any size changes. The only change is that to
> write (or understand) the above code, you have to know that 1
> corresponds to GPIO input (or was it output?) while in the later
> function it is obvious that we're talking about an input.

In almost all cases I'm involved in the original code is different:

	return !!foo();

vs.

	if (foo())
		return A;
	return B;

-- =

With Best Regards,
Andy Shevchenko


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
