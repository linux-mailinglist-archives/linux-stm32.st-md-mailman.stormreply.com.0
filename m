Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 505534FBB93
	for <lists+linux-stm32@lfdr.de>; Mon, 11 Apr 2022 14:03:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0CE15C628A2;
	Mon, 11 Apr 2022 12:03:03 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C7E5FC60464
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Apr 2022 12:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649678581; x=1681214581;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=9kbQrXBy9DVbHOYLkpvDDmu+4Dwl0husw8ro+88KO44=;
 b=Udb9ZPMuvaTVss/zPcH2La4doztWcJTF6UWdhE6cR1Miv8fRiUB5TjOn
 CrQQDXBuBWnepQIiFxs8ReGeim2MKmzcZ1zVeRaRZ2q6ZtwJVDpUp/L+S
 53cZ6GwtWsKqc8yrsdTdX6XRRbIfVsPbWeLbvlhwKnmcWWxj7o34t2F9A
 /aLAltZmUqziI9LJJixnmd/ufVljBN2IzbYpbeSXDGWwKGrvWmRZPMq+j
 rriVJHuET3CgElppTrADxU3JVNpCT/5q0gGdQwctfOgFnw/rUaQlActMX
 oz0nkXgJo4qILRZ2e7AU3paQ8L4c9JO4LVZ9Kbi6HRBzOo8hHfViVPWWY g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10313"; a="260944711"
X-IronPort-AV: E=Sophos;i="5.90,251,1643702400"; d="scan'208";a="260944711"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 05:02:59 -0700
X-IronPort-AV: E=Sophos;i="5.90,251,1643702400"; d="scan'208";a="654594670"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 05:02:51 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1ndshK-001CUl-He; Mon, 11 Apr 2022 14:59:10 +0300
Date: Mon, 11 Apr 2022 14:59:10 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Qianggui Song <qianggui.song@amlogic.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Fabien Dessenne <fabien.dessenne@foss.st.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-renesas-soc@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Message-ID: <YlQYDnCNuTibuVi1@smile.fi.intel.com>
References: <20220401103604.8705-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220401103604.8705-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: Andrew Lunn <andrew@lunn.ch>, Tomer Maimon <tmaimon77@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Tomasz Figa <tomasz.figa@gmail.com>, Tali Perry <tali.perry1@gmail.com>,
 Avi Fishman <avifishman70@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Benjamin Fair <benjaminfair@google.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Patrick Venture <venture@google.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Nancy Yuen <yuenn@google.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [Linux-stm32] [PATCH v4 00/13] gpiolib: Two new helpers and way
	toward fwnode
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

On Fri, Apr 01, 2022 at 01:35:51PM +0300, Andy Shevchenko wrote:
> This is a spin-off of the previous work of switching GPIO library
> to use fwnode instead of of_node. Here we introduce a couple of
> a new macro helpers, which allows to switch some of the drivers
> to use fwnode and partially fwnode APIs. As a result of this cleanup
> a few drivers switched to use GPIO fwnode instead of of_node.
> 
> Bart, Linus, I can take it thru my tree with an immutable branch if
> it's the way you prefer, otherwise please suggest on how to proceed.

I'm going to push this, without samsung patch(es), but addresing latest
Geert's comment, to my for-next branch pending for PR to GPIO subsystem.

Please inform me within a few hours, if something should be postponed /
dropped / etc.

Thanks!

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
