Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F774EBD79
	for <lists+linux-stm32@lfdr.de>; Wed, 30 Mar 2022 11:19:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4A32DC60467;
	Wed, 30 Mar 2022 09:19:41 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E0CC3C60464
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Mar 2022 09:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648631980; x=1680167980;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=CexHFbKj9fB0vNoQokL/+22Rm+MDw+vDfIRSUuljC98=;
 b=C56DLKDgo7Nqvzv/GJkQTubGNSqqab934zQE9JyIRTkORX+BhF6m9wZQ
 dDVLagTBUjNnIB0U8hmwAl4jZ2MPSXTEJE/aDMfj81fEIlZAd9S+/zn+T
 cWpgjVAHHcNB/bQOxskKEuwjWRKjBLc3ObpOzC6qh8JUWfCKi70M3jI/R
 wM3eiwy+IpsL7i+7pIRnWRYeWuDupGDvCPuckLY7Juny8Diu4hu1K6n8e
 2HUZts2I/94qj3YyFVkvlyvZk5dkM7ER5hPxMRYfqZeZWNJyJ9ZHxvPko
 /2VsJmht6iYR7t7JF2KWIG6rbC6c3KCsiX9Re8wbEI+ZyGGlBmUV7oGyW A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10301"; a="284402004"
X-IronPort-AV: E=Sophos;i="5.90,222,1643702400"; d="scan'208";a="284402004"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2022 02:19:37 -0700
X-IronPort-AV: E=Sophos;i="5.90,222,1643702400"; d="scan'208";a="503246100"
Received: from smile.fi.intel.com ([10.237.72.59])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2022 02:19:30 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1nZUTf-009J1d-AZ; Wed, 30 Mar 2022 12:18:55 +0300
Date: Wed, 30 Mar 2022 12:18:55 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Message-ID: <YkQgfwUs8KbhF/b/@smile.fi.intel.com>
References: <20220329152926.50958-1-andriy.shevchenko@linux.intel.com>
 <20220329152926.50958-10-andriy.shevchenko@linux.intel.com>
 <94e888fe-d8fc-5379-302f-66d64f2ae10b@baylibre.com>
 <YkM22GwhxV+YKl8l@smile.fi.intel.com>
 <CAMuHMdWVA834tkeag=WOnHFGuhwZ93PkrgO24OV69Fye1hruLw@mail.gmail.com>
 <1b0bc704-a740-ea15-1e90-166905be27d0@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1b0bc704-a740-ea15-1e90-166905be27d0@baylibre.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: Andrew Lunn <andrew@lunn.ch>, Tomer Maimon <tmaimon77@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Linus Walleij <linus.walleij@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>,
 Tali Perry <tali.perry1@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Benjamin Fair <benjaminfair@google.com>, Kevin Hilman <khilman@baylibre.com>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Nancy Yuen <yuenn@google.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Geert Uytterhoeven <geert@linux-m68k.org>,
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
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, openbmc@lists.ozlabs.org
Subject: Re: [Linux-stm32] [PATCH v2 09/13] pinctrl: meson: Rename REG_* to
	MREG_*
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

On Wed, Mar 30, 2022 at 11:09:11AM +0200, Neil Armstrong wrote:
> On 30/03/2022 10:54, Geert Uytterhoeven wrote:
> > On Tue, Mar 29, 2022 at 6:47 PM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Tue, Mar 29, 2022 at 06:13:19PM +0200, Neil Armstrong wrote:
> > > > On 29/03/2022 17:29, Andy Shevchenko wrote:

...

> > > > What error do you hit ?
> > > 
> > > arch/x86/include/asm/arch_hweight.h:9:17: error: expected identifier before string constant
> > > 9 | #define REG_OUT "a"
> > >    |                 ^~~
> > 
> > Perhaps REG_{OUT,IN} in arch/x86/include/asm/arch_hweight.h should be
> > renamed instead, as this is a generic header file that can be included
> > anywhere, while the REG_{OUT,IN} definitions are only used locally,
> > in the header file?
> 
> Even better, those REG_OUT/REG_IN should be undefined at the end of the header since only
> used in the headers inline functions:
> ==============><==================================
> diff --git a/arch/x86/include/asm/arch_hweight.h b/arch/x86/include/asm/arch_hweight.h
> index ba88edd0d58b..139a4b0a2a14 100644
> --- a/arch/x86/include/asm/arch_hweight.h
> +++ b/arch/x86/include/asm/arch_hweight.h
> @@ -52,4 +52,7 @@ static __always_inline unsigned long __arch_hweight64(__u64 w)
>  }
>  #endif /* CONFIG_X86_32 */
> 
> +#undef REG_IN
> +#undef REG_OUT
> +
>  #endif
> ==============><==================================

Can you submit a formal patch, please?


And I think it would be good to have my patch as well, so we do not depend on
the fate of the other one.

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
