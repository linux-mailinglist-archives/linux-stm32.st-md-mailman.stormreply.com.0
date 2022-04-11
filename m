Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F004FB969
	for <lists+linux-stm32@lfdr.de>; Mon, 11 Apr 2022 12:23:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EAD3BC628A2;
	Mon, 11 Apr 2022 10:23:03 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D1FA1C60464
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Apr 2022 10:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649672583; x=1681208583;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=W9PBitEIG3h2GlCxu7zEfN69pBWFXH7+lRg/Bcxe/tU=;
 b=ZC2AF/cQqGnjY0Nl8jXOyt1X+DC9kvD5J9JyFcXXqQPEY/VQI9iR+3y+
 BZBK69/4cxiBqxv2KVmkAAXtonoy7UwiQ0nYGbY3eFXaFP5fGydnJmEVM
 7V+pIHDTeh5WcRvXynVCAQuyc86fdVWpI5jGQ83zAYewKnUlvlcfAxunS
 qh82tKGwktz2/l37Xql6W9cfBQergipHxxi5o8pNzxMIKDXvhwIAZg/gF
 9EOzW88CukEcjdJuF5yTVaGrirkMgUOmcFCaK4tMbEyqY0IzKn3tEqPJM
 k8zii7kYDlKjYQ5KLgTAfUIPrIY8SUTALimeVO366mXVvrBV70PSa1fJ/ A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10313"; a="242670564"
X-IronPort-AV: E=Sophos;i="5.90,251,1643702400"; d="scan'208";a="242670564"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 03:23:00 -0700
X-IronPort-AV: E=Sophos;i="5.90,251,1643702400"; d="scan'208";a="525460425"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 03:22:52 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1ndr8Z-001B7S-AA; Mon, 11 Apr 2022 13:19:11 +0300
Date: Mon, 11 Apr 2022 13:19:11 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Message-ID: <YlQAn9+4kdB0F/4d@smile.fi.intel.com>
References: <20220401103604.8705-1-andriy.shevchenko@linux.intel.com>
 <20220401103604.8705-10-andriy.shevchenko@linux.intel.com>
 <CAMuHMdX8zWA-3_=Je7sB_72G8Ky7-syqCH-RXGxNMazUipW-2g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdX8zWA-3_=Je7sB_72G8Ky7-syqCH-RXGxNMazUipW-2g@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: Andrew Lunn <andrew@lunn.ch>, Tomer Maimon <tmaimon77@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Linus Walleij <linus.walleij@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>,
 Tali Perry <tali.perry1@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Benjamin Fair <benjaminfair@google.com>, Marc Zyngier <maz@kernel.org>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Nancy Yuen <yuenn@google.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Alim Akhtar <alim.akhtar@samsung.com>,
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
 Kevin Hilman <khilman@baylibre.com>, openbmc@lists.ozlabs.org
Subject: Re: [Linux-stm32] [PATCH v4 09/13] pinctrl: meson: Rename REG_* to
	MESON_REG_*
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

On Mon, Apr 11, 2022 at 11:04:00AM +0200, Geert Uytterhoeven wrote:
> On Fri, Apr 1, 2022 at 12:36 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > Currently compilation test fails on x86 due to name collision. The usual
> > way to fix that is to move both conflicting parts to their own namespaces.
> >
> > Rename REG_* to MESON_REG_* as a prerequisite for enabling COMPILE_TEST.

> >         NUM_REG,
> 
> MESON_NUM_REG?

Hmm... Only one place where it's defined and used, but I can do it, sure.

$ git grep -n -w NUM_REG
drivers/pinctrl/meson/pinctrl-meson.h:72:       NUM_REG,
drivers/pinctrl/meson/pinctrl-meson.h:105:      struct meson_reg_desc regs[NUM_REG];

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
