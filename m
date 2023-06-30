Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 707487455AD
	for <lists+linux-stm32@lfdr.de>; Mon,  3 Jul 2023 08:58:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CEF3BC6B466;
	Mon,  3 Jul 2023 06:58:46 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E2581C04B10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 30 Jun 2023 17:48:47 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="352275052"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; d="scan'208";a="352275052"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2023 10:48:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="787792137"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; d="scan'208";a="787792137"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmsmga004.fm.intel.com with ESMTP; 30 Jun 2023 10:48:36 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andy@kernel.org>) id 1qFIET-001AaS-1x;
 Fri, 30 Jun 2023 20:48:33 +0300
Date: Fri, 30 Jun 2023 20:48:33 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Message-ID: <ZJ8VcZq2s5XrxJge@smile.fi.intel.com>
References: <20230630-topic-oxnas-upstream-remove-v2-0-fb6ab3dea87c@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230630-topic-oxnas-upstream-remove-v2-0-fb6ab3dea87c@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Mailman-Approved-At: Mon, 03 Jul 2023 06:58:44 +0000
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, linux-mtd@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-clk@vger.kernel.org,
 Marc Zyngier <maz@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jose Abreu <joabreu@synopsys.com>,
 Daniel Golle <daniel@makrotopia.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Michael Turquette <mturquette@baylibre.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, linux-pm@vger.kernel.org,
 linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Stephen Boyd <sboyd@kernel.org>, netdev@vger.kernel.org,
 Sebastian Reichel <sre@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Weinberger <richard@nod.at>, linux-oxnas@groups.io,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH v2 00/15] ARM: oxnas support removal
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

On Fri, Jun 30, 2023 at 06:58:25PM +0200, Neil Armstrong wrote:
> With [1] removing MPCore SMP support, this makes the OX820 barely usable,
> associated with a clear lack of maintainance, development and migration to
> dt-schema it's clear that Linux support for OX810 and OX820 should be removed.
> 
> In addition, the OX810 hasn't been booted for years and isn't even present
> in an ARM config file.
> 
> For the OX820, lack of USB and SATA support makes the platform not usable
> in the current Linux support and relies on off-tree drivers hacked from the
> vendor (defunct for years) sources.
> 
> The last users are in the OpenWRT distribution, and today's removal means
> support will still be in stable 6.1 LTS kernel until end of 2026.
> 
> If someone wants to take over the development even with lack of SMP, I'll
> be happy to hand off maintainance.
> 
> It has been a fun time adding support for this architecture, but it's time
> to get over!
> 
> Now arch/arm parts are removed, now it's time to remove the remaining stuff.

For all non-DT patches
Acked-by: Andy Shevchenko <andy@kernel.org>

I always like negative statistics of a magnitude order!

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
