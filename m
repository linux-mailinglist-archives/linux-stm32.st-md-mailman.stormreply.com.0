Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AEAD4EC520
	for <lists+linux-stm32@lfdr.de>; Wed, 30 Mar 2022 15:02:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 429E4C60467;
	Wed, 30 Mar 2022 13:02:46 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 077CDC01577
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Mar 2022 13:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648645365; x=1680181365;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=sJ4bTg/Jje7M8hJIE2LrKZWgq7g/VxTTlmJq4PtT+5k=;
 b=LC3tKV9OMTy8ujoKeIXEmG86Av+6+XgGV70TRhIgVJJgEMoZc69n6mQI
 0pOS14TAghFVj/r6vL9PmC3nZa72vE9L1x3ZK3rdLQc3Qv5SP+HcEqVfO
 tZ/5eHY1yzNjK93pO9nO6nErLljbNQvWOOuSSOHLPG7Az2nqq85B8vlvz
 /mMFOXnB5UeToJdy1ihhvkrXHdJ4aanBncWTjhSH+H95ucbTwUDFBpHyQ
 3LH5j1iH1rVCyibCUTKUzZ4qK6EDP4BaYl1esvPPs4t/YToJMLfmYpYxF
 33kMPtIlw1k4mSsLBQ0Tit3eR8vv5uRJQ9TFd1oj7KPG3UoEu7zztRiNx g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10301"; a="257115130"
X-IronPort-AV: E=Sophos;i="5.90,222,1643702400"; d="scan'208";a="257115130"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2022 06:02:42 -0700
X-IronPort-AV: E=Sophos;i="5.90,222,1643702400"; d="scan'208";a="519668600"
Received: from smile.fi.intel.com ([10.237.72.59])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2022 06:02:34 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1nZXxJ-009PSJ-LE; Wed, 30 Mar 2022 16:01:45 +0300
Date: Wed, 30 Mar 2022 16:01:45 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Fabien DESSENNE <fabien.dessenne@foss.st.com>
Message-ID: <YkRUuS5YKXstq9T7@smile.fi.intel.com>
References: <20220329152926.50958-1-andriy.shevchenko@linux.intel.com>
 <20220329152926.50958-5-andriy.shevchenko@linux.intel.com>
 <ec5a56e6-9402-f80f-3c86-1820e39fec27@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ec5a56e6-9402-f80f-3c86-1820e39fec27@foss.st.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: Andrew Lunn <andrew@lunn.ch>, Tomer Maimon <tmaimon77@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Linus Walleij <linus.walleij@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>,
 Tali Perry <tali.perry1@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 linux-samsung-soc@vger.kernel.org, Benjamin Fair <benjaminfair@google.com>,
 Kevin Hilman <khilman@baylibre.com>, openbmc@lists.ozlabs.org,
 Krzysztof Kozlowski <krzk@kernel.org>, Nancy Yuen <yuenn@google.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Alim Akhtar <alim.akhtar@samsung.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Qianggui Song <qianggui.song@amlogic.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-gpio@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Gregory Clement <gregory.clement@bootlin.com>
Subject: Re: [Linux-stm32] [PATCH v2 04/13] pinctrl: stm32: Switch to use
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

On Wed, Mar 30, 2022 at 02:32:36PM +0200, Fabien DESSENNE wrote:
> Hi Andy
> 
> 
> Thank you for the patch.
> 
> Fabien
> 
> On 29/03/2022 17:29, Andy Shevchenko wrote:
> > Switch the code to use for_each_gpiochip_node() helper.
> > 
> > While at it, in order to avoid additional churn in the future,
> > switch to fwnode APIs where it makes sense.
> > 
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Fabien Dessenne <fabien.dessenne@foss.st.com>

Thank you for the prompt review!

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
