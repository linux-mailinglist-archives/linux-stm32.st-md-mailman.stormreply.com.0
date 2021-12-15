Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5528C475A6C
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Dec 2021 15:17:13 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F190AC5E2C6;
	Wed, 15 Dec 2021 14:17:12 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1FB62C5E2C3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Dec 2021 14:17:10 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10198"; a="239046392"
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; d="scan'208";a="239046392"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2021 06:17:08 -0800
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; d="scan'208";a="567937520"
Received: from smile.fi.intel.com ([10.237.72.184])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2021 06:16:57 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1mxV4Z-006d5b-Tn; Wed, 15 Dec 2021 16:15:59 +0200
Date: Wed, 15 Dec 2021 16:15:59 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Message-ID: <Ybn4ny0YY/Sbld+Q@smile.fi.intel.com>
References: <20211213163929.7509-1-andriy.shevchenko@linux.intel.com>
 <CAMuHMdW_CKcXwOSUAbCreHVM62E35yjiCfpXC_wM0zK-V43CnA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdW_CKcXwOSUAbCreHVM62E35yjiCfpXC_wM0zK-V43CnA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Herve Codina <herve.codina@bootlin.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
 Viresh Kumar <vireshk@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Douglas Anderson <dianders@chromium.org>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Florian Fainelli <f.fainelli@gmail.com>, arm-soc <soc@kernel.org>,
 Marc Zyngier <maz@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Andy Gross <agross@kernel.org>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Baruch Siach <baruch@tkos.co.il>, Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Manivannan Sadhasivam <mani@kernel.org>, Sam Shih <sam.shih@mediatek.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, linux-actions@lists.infradead.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
 linux-mediatek@lists.infradead.org,
 Radim Pavlik <radim.pavlik@tbs-biometrics.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Support Opensource <support.opensource@diasemi.com>,
 Scott Branden <sbranden@broadcom.com>, - <patches@opensource.cirrus.com>,
 Sean Wang <sean.wang@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Ray Jui <rjui@broadcom.com>, Colin Foster <colin.foster@in-advantage.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Kavyasree Kotagiri <kavyasree.kotagiri@microchip.com>,
 Zhiyong Tao <zhiyong.tao@mediatek.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, linux-oxnas@groups.io,
 Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 linux-rpi-kernel <linux-rpi-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v1 1/2] pinctrl: Get rid of duplicate
 of_node assignment in the drivers
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

On Wed, Dec 15, 2021 at 11:28:34AM +0100, Geert Uytterhoeven wrote:
> On Mon, Dec 13, 2021 at 5:40 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > GPIO library does copy the of_node from the parent device of
> > the GPIO chip, there is no need to repeat this in the individual
> > drivers. Remove these assignment all at once.
> >
> > For the details one may look into the of_gpio_dev_init() implementation.

> >  drivers/pinctrl/renesas/pinctrl-rza2.c     | 1 -
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, there is v2 with this patch w/o changes. I take a liberty to
extrapolate the tags to it. I need to send a v3 in case Linus hasn't
taken the first patch before it happens.

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
