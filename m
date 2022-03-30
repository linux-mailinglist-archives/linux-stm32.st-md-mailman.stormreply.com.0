Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D4CEB4EC30D
	for <lists+linux-stm32@lfdr.de>; Wed, 30 Mar 2022 14:17:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 82EF0C60467;
	Wed, 30 Mar 2022 12:17:22 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 11799C01577
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Mar 2022 12:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648642641; x=1680178641;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=degjoFghFkob5qL3ehvoGOpozoU5J2XRIt2L6L1iub0=;
 b=Sl/L1luMMLMwoFtKORTIrzlG1A63JHKlLQJOanbkego8CF8J8mC3TwN9
 RCIFRuqg35/2nvBe4k0IREaB9/4yiP/WETKZRYmND045Talmf+G2Zr7kP
 6Qc0zJNBXVtX21pDSXo9E3wwV6Lq/AMDSDvsRApkK3rrannAECvxTcTkY
 yYXRvMZ5QtkAQHx54QMlZEeWu2m96d8+BldZWcpQQyJwVb9K9oJvG3pXl
 +ghIkquES3eumnvnMp6ooezRMjKXZDJJO5qOPmEgaxd0NPqIDuQDRv1FB
 CIY7QiZmT/zCaSlHOU4SFdyXuoNA0vAxpGVr8N2d4XmBOcD//tuG6fYy3 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10301"; a="241683609"
X-IronPort-AV: E=Sophos;i="5.90,222,1643702400"; d="scan'208";a="241683609"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2022 05:17:19 -0700
X-IronPort-AV: E=Sophos;i="5.90,222,1643702400"; d="scan'208";a="565512740"
Received: from smile.fi.intel.com ([10.237.72.59])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2022 05:17:10 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1nZXFc-009OGn-0z; Wed, 30 Mar 2022 15:16:36 +0300
Date: Wed, 30 Mar 2022 15:16:35 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Message-ID: <YkRKI6W4vR/aCr8c@smile.fi.intel.com>
References: <20220329152926.50958-1-andriy.shevchenko@linux.intel.com>
 <20220329152926.50958-8-andriy.shevchenko@linux.intel.com>
 <CAMuHMdWs+OuxV0cO=XGYvOOJ0Mctwu6fKV5HnkdRBXNKkLE3uQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdWs+OuxV0cO=XGYvOOJ0Mctwu6fKV5HnkdRBXNKkLE3uQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: Andrew Lunn <andrew@lunn.ch>, Tomer Maimon <tmaimon77@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Linus Walleij <linus.walleij@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>,
 Tali Perry <tali.perry1@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Benjamin Fair <benjaminfair@google.com>, Kevin Hilman <khilman@baylibre.com>,
 openbmc@lists.ozlabs.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Nancy Yuen <yuenn@google.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Qianggui Song <qianggui.song@amlogic.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Gregory Clement <gregory.clement@bootlin.com>
Subject: Re: [Linux-stm32] [PATCH v2 07/13] pinctrl: renesas: rza1: Switch
 to use for_each_gpiochip_node() helper
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

On Wed, Mar 30, 2022 at 12:00:27PM +0200, Geert Uytterhoeven wrote:
> On Tue, Mar 29, 2022 at 5:29 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:

...

> > +       struct fwnode_reference_args of_args;
> 
> fw_args?

Perhaps just args as other drivers do?

...

> > -       chip->label     = devm_kasprintf(rza1_pctl->dev, GFP_KERNEL, "%pOFn",
> > -                                        np);
> > +       chip->label     = devm_kasprintf(rza1_pctl->dev, GFP_KERNEL, "%pfw", fwnode);
> 
> This changes the label from e.g. "/soc/pinctrl@fcfe3000/gpio-11" to "gpio-11".

Hmm... It seems other way around, i.e. it changes from the name to full name.

> %pfwP?

But conclusion here is correct. Good catch!

...

> With the above fixed:
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks for review and testing!

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
