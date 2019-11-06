Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ABCFBF1880
	for <lists+linux-stm32@lfdr.de>; Wed,  6 Nov 2019 15:24:59 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 613E7C36B0B;
	Wed,  6 Nov 2019 14:24:59 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 26F95C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 Nov 2019 14:24:56 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Nov 2019 06:24:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,275,1569308400"; d="scan'208";a="214261381"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga002.jf.intel.com with ESMTP; 06 Nov 2019 06:24:43 -0800
Received: from andy by smile with local (Exim 4.93-RC1)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1iSMEj-0004HL-6Z; Wed, 06 Nov 2019 16:24:41 +0200
Date: Wed, 6 Nov 2019 16:24:41 +0200
From: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
To: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Message-ID: <20191106142441.GC32742@smile.fi.intel.com>
References: <cover.1573029228.git.matti.vaittinen@fi.rohmeurope.com>
 <20191106120846.5bunrqj3uz4khih5@earth.universe>
 <ddcd02cc6c709837a28cae2cbfa672c506927659.camel@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ddcd02cc6c709837a28cae2cbfa672c506927659.camel@fi.rohmeurope.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "david.daney@cavium.com" <david.daney@cavium.com>,
 "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
 "sathyanarayanan.kuppuswamy@linux.intel.com"
 <sathyanarayanan.kuppuswamy@linux.intel.com>,
 "sre@kernel.org" <sre@kernel.org>, "ptyser@xes-inc.com" <ptyser@xes-inc.com>,
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
 "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>,
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
 "andrew@aj.id.au" <andrew@aj.id.au>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "t.scherer@eckelmann.de" <t.scherer@eckelmann.de>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "patches@opensource.cirrus.com" <patches@opensource.cirrus.com>,
 "info@metux.net" <info@metux.net>
Subject: Re: [Linux-stm32] [PATCH v2 0/2] Add definition for GPIO direction
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

On Wed, Nov 06, 2019 at 12:25:18PM +0000, Vaittinen, Matti wrote:
> 
> On Wed, 2019-11-06 at 13:08 +0100, Sebastian Reichel wrote:
> > Hi,
> > 
> > On Wed, Nov 06, 2019 at 10:51:06AM +0200, Matti Vaittinen wrote:
> > > The patch series adds definitions for GPIO line directions.
> > > 
> > > For occasional GPIO contributor like me it is always a pain to
> > > remember
> > > whether 1 or 0 was used for GPIO direction INPUT/OUTPUT.
> > 
> > Maybe also update the GPIO drivers in pinctrl?
> > 
> > $ git grep -l gpio_get_direction drivers/pinctrl
> > drivers/pinctrl/bcm/pinctrl-bcm2835.c
> > drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
> > drivers/pinctrl/intel/pinctrl-baytrail.c
> > drivers/pinctrl/intel/pinctrl-cherryview.c
> > drivers/pinctrl/intel/pinctrl-intel.c
> > drivers/pinctrl/mediatek/pinctrl-mtk-common.c
> > drivers/pinctrl/mediatek/pinctrl-paris.c
> > drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
> > drivers/pinctrl/pinctrl-amd.c
> > drivers/pinctrl/pinctrl-at91.c
> > drivers/pinctrl/pinctrl-axp209.c
> > drivers/pinctrl/pinctrl-ingenic.c
> > drivers/pinctrl/pinctrl-ocelot.c
> > drivers/pinctrl/pinctrl-oxnas.c
> > drivers/pinctrl/pinctrl-pic32.c
> > drivers/pinctrl/pinctrl-pistachio.c
> > drivers/pinctrl/pinctrl-rk805.c
> > drivers/pinctrl/pinctrl-rockchip.c
> > drivers/pinctrl/pinctrl-rza1.c
> > drivers/pinctrl/pinctrl-st.c
> > drivers/pinctrl/pinctrl-stmfx.c
> > drivers/pinctrl/pinctrl-sx150x.c
> > drivers/pinctrl/qcom/pinctrl-msm.c
> > drivers/pinctrl/stm32/pinctrl-stm32.c
> > drivers/pinctrl/vt8500/pinctrl-wmt.c
> 
> Ouch. I didn't check from pinctrl but I see those should be converted
> as well. I'm a bit short on time right now so if anyone else is
> interested I won't mind :)
> 
> Luckily the value for IN and OUT is not changed - only the defines were
> added - so all of the drivers do not need to be done at once.

Agree.

> If no one
> else will take the pinctrl part then I can probably do pinctrl patches
> for v5.6 cycle.

For pin control Intel, since we send PR to Linus and it won't be different to
him, we would like to see patch per driver.

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
