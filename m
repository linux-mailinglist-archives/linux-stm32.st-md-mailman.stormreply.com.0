Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B3B4FBB80
	for <lists+linux-stm32@lfdr.de>; Mon, 11 Apr 2022 14:00:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C28A4C628A2;
	Mon, 11 Apr 2022 12:00:16 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7B8E9C60464
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Apr 2022 12:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649678414; x=1681214414;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=sC8CyttMimPSNhIr3hh4HcfuM59Ph6N7lGNcafQdvcs=;
 b=IRSFsPD8cn/VlAKp0HnsEnPl32JKllKqCDf4NR/rtV2tti+Y1aBaDhi8
 45/m+4vEhyVvQRtJ1cL05lcNAmDGYmw9gPPNKcwI3STNenb2Shn+a+Vie
 7DvkBHaS1pSn3iOhEn9Oz0US3kRvFdEuoFfXMnTw5iEk3RwY3FbFkc3Hv
 oz4KDVVuWffBuHUOl9MU0vuhiWrtkoietFkCAenuSPOdwB4lU1s9d2ct7
 XX0UHwz/0XjYY7w6AqKwTGHPm4k+Fg18zT55oeAPatRneejXFAe0mvcT8
 Rf68blJxNrJy+A9BDIDilY7LKnLtM4JlpvRDw7n/fKp5OnfukoWHiDb4V Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10313"; a="261535014"
X-IronPort-AV: E=Sophos;i="5.90,251,1643702400"; d="scan'208";a="261535014"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 05:00:12 -0700
X-IronPort-AV: E=Sophos;i="5.90,251,1643702400"; d="scan'208";a="699346695"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 05:00:05 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1ndsed-001CQ3-RA; Mon, 11 Apr 2022 14:56:23 +0300
Date: Mon, 11 Apr 2022 14:56:23 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Message-ID: <YlQXZ3Ye13rObMy8@smile.fi.intel.com>
References: <20220401103604.8705-1-andriy.shevchenko@linux.intel.com>
 <20220401103604.8705-6-andriy.shevchenko@linux.intel.com>
 <d1f873c6-150f-5f4d-7aa8-7bb15823d991@linaro.org>
 <YlBXSVyj88CqjGj4@smile.fi.intel.com>
 <3b527700-444e-1f6e-fee1-5cd6ed2ef7f9@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3b527700-444e-1f6e-fee1-5cd6ed2ef7f9@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: Andrew Lunn <andrew@lunn.ch>, Tomer Maimon <tmaimon77@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Linus Walleij <linus.walleij@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>,
 Tali Perry <tali.perry1@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 linux-samsung-soc@vger.kernel.org, Benjamin Fair <benjaminfair@google.com>,
 Marc Zyngier <maz@kernel.org>, Gregory Clement <gregory.clement@bootlin.com>,
 Nancy Yuen <yuenn@google.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Qianggui Song <qianggui.song@amlogic.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-gpio@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>, openbmc@lists.ozlabs.org
Subject: Re: [Linux-stm32] [PATCH v4 05/13] pinctrl: samsung: Switch to use
 for_each_gpiochip_node() helper
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

On Sat, Apr 09, 2022 at 03:33:49PM +0200, Krzysztof Kozlowski wrote:
> On 08/04/2022 17:39, Andy Shevchenko wrote:
> > On Fri, Apr 08, 2022 at 05:22:21PM +0200, Krzysztof Kozlowski wrote:
> >> On 01/04/2022 12:35, Andy Shevchenko wrote:
> >>> Switch the code to use for_each_gpiochip_node() helper.
> > 
> > (...)
> > 
> >>>  /*
> >>>   * Iterate over all driver pin banks to find one matching the name of node,
> >>>   * skipping optional "-gpio" node suffix. When found, assign node to the bank.
> >>>   */
> >>> -static void samsung_banks_of_node_get(struct device *dev,
> >>> -				      struct samsung_pinctrl_drv_data *d,
> >>> -				      struct device_node *node)
> >>> +static void samsung_banks_node_get(struct device *dev, struct samsung_pinctrl_drv_data *d)
> >>
> >> This is worth simplification anyway, so please split it to separate patch.
> > 
> > Not sure what to do and why it worth an additional churn.
> 
> Makes this change smaller so it's easier to review.

https://git.kernel.org/pub/scm/linux/kernel/git/andy/linux-gpio-intel.git/log/?h=review-andy

That's how it looks like. Tell me if it is what you have had in mind.

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
