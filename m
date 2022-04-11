Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE0E4FBCDE
	for <lists+linux-stm32@lfdr.de>; Mon, 11 Apr 2022 15:16:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A37A7C628A6;
	Mon, 11 Apr 2022 13:16:55 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 049B1C60495
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Apr 2022 13:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649683014; x=1681219014;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=8NkmJflT2vjOmTzpi2Ay4zQaAbqkNIhnYYU/YH2VLeY=;
 b=e14YV7S8Oo3xO8FNIfWZd02XWDXJ+StLyBXTklg8IEmedEHwd/cd0aSz
 fVpW4E7hb5ArDQ8EayuQiessPrfY8+T0+rnFoM4p99stVUcPuyNyJbbDw
 CGKll/SvQJxCrEOKmcsdZiyX86lPxzQMdMw92agUP2GABu24NoLPCTLu7
 3JxZYOzL5iEALyrs2FbaGUA0cjLNrGJhdVvMucLpKtWjdLK91sI8ci0tW
 yuV8HXncdFs5cKzEKsyPAJwNcYs0sQpkyGhwkLXK+DAvZKFbP0knAVGng
 xJ7YvuuYwYfu9v/aPQy5bgDp6rhrSuiXQc0Aj4ljUh726kG+1yh8krWWd w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10313"; a="242700158"
X-IronPort-AV: E=Sophos;i="5.90,251,1643702400"; d="scan'208";a="242700158"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 06:16:52 -0700
X-IronPort-AV: E=Sophos;i="5.90,251,1643702400"; d="scan'208";a="644080149"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 06:16:44 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1ndtqp-001DRI-MC; Mon, 11 Apr 2022 16:13:03 +0300
Date: Mon, 11 Apr 2022 16:13:03 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Message-ID: <YlQpX0Gu/O9IuhyW@smile.fi.intel.com>
References: <20220401103604.8705-1-andriy.shevchenko@linux.intel.com>
 <20220401103604.8705-6-andriy.shevchenko@linux.intel.com>
 <4513324d-3dba-fd21-2a7f-9f1b9ef535cc@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4513324d-3dba-fd21-2a7f-9f1b9ef535cc@linaro.org>
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

On Mon, Apr 11, 2022 at 02:21:00PM +0200, Krzysztof Kozlowski wrote:
> On 01/04/2022 12:35, Andy Shevchenko wrote:
> > Switch the code to use for_each_gpiochip_node() helper.
> > 
> > While at it, in order to avoid additional churn in the future,
> > switch to fwnode APIs where it makes sense.
> > 
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > ---
> >  drivers/pinctrl/samsung/pinctrl-exynos.c  |  8 +++---
> >  drivers/pinctrl/samsung/pinctrl-s3c24xx.c |  2 +-
> >  drivers/pinctrl/samsung/pinctrl-s3c64xx.c |  4 +--
> >  drivers/pinctrl/samsung/pinctrl-samsung.c | 30 +++++++++++------------
> >  drivers/pinctrl/samsung/pinctrl-samsung.h |  2 +-
> >  5 files changed, 22 insertions(+), 24 deletions(-)
> 
> Tested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Thanks!
I'm going to spread this to two patches to which I pointed out before.

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
