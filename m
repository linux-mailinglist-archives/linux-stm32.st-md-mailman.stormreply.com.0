Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6382F4EC8CC
	for <lists+linux-stm32@lfdr.de>; Wed, 30 Mar 2022 17:52:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 14A06C60467;
	Wed, 30 Mar 2022 15:52:06 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4B934C60464
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Mar 2022 15:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648655524; x=1680191524;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=aHOCvdmEcRy5ZvBUbTf9zFkDOMo9CAy71FTo/IenFRo=;
 b=eaJehdiCnZrxeTqBfxF7caWnB131NP+hR2tbB7mKERRsVhzVtV40MYoQ
 rb1nEfPg0WDljCE5vKgGGW1I4B7KjMRUb9+Y3O3E4AJ/wDFMXOxfSTSzQ
 EDt4S0mWar2e7+SMfxcIITxHqnzQgO238WQegHvoWCgsPBEidOUTUI+wj
 HK81xBDVG+9MXFO0C7zDShzsFQalr1Hm2McPEoKqNuVeUknU7Jy2A05pY
 RRJSgdYHopwHaLB77sQbtiD9Y80JeUt5G1vpLckqrp4NNiRBFoE3c5o9h
 zOyeN35kvAFici1oj/kRUFyo7K2iSAJNSOM8rvpBzYoqr89tzqPr6+XAo w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10302"; a="257154354"
X-IronPort-AV: E=Sophos;i="5.90,223,1643702400"; d="scan'208";a="257154354"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2022 08:52:02 -0700
X-IronPort-AV: E=Sophos;i="5.90,223,1643702400"; d="scan'208";a="788049544"
Received: from smile.fi.intel.com ([10.237.72.59])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2022 08:51:54 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1nZabQ-009UCS-Cy; Wed, 30 Mar 2022 18:51:20 +0300
Date: Wed, 30 Mar 2022 18:51:20 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Message-ID: <YkR8eDT6fS8uRpOT@smile.fi.intel.com>
References: <20220329152926.50958-1-andriy.shevchenko@linux.intel.com>
 <20220329152926.50958-10-andriy.shevchenko@linux.intel.com>
 <94e888fe-d8fc-5379-302f-66d64f2ae10b@baylibre.com>
 <YkM22GwhxV+YKl8l@smile.fi.intel.com>
 <CAMuHMdWVA834tkeag=WOnHFGuhwZ93PkrgO24OV69Fye1hruLw@mail.gmail.com>
 <1b0bc704-a740-ea15-1e90-166905be27d0@baylibre.com>
 <YkQgfwUs8KbhF/b/@smile.fi.intel.com>
 <6812bb31-5d2b-4737-c2ad-8727d105847d@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6812bb31-5d2b-4737-c2ad-8727d105847d@baylibre.com>
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

On Wed, Mar 30, 2022 at 05:22:56PM +0200, Neil Armstrong wrote:
> On 30/03/2022 11:18, Andy Shevchenko wrote:

...

> > > > > > What error do you hit ?
> > > > > 
> > > > > arch/x86/include/asm/arch_hweight.h:9:17: error: expected identifier before string constant
> > > > > 9 | #define REG_OUT "a"
> > > > >     |                 ^~~
> > > > 
> > > > Perhaps REG_{OUT,IN} in arch/x86/include/asm/arch_hweight.h should be
> > > > renamed instead, as this is a generic header file that can be included
> > > > anywhere, while the REG_{OUT,IN} definitions are only used locally,
> > > > in the header file?
> > > 
> > > Even better, those REG_OUT/REG_IN should be undefined at the end of the header since only
> > > used in the headers inline functions:
> > > ==============><==================================
> > > diff --git a/arch/x86/include/asm/arch_hweight.h b/arch/x86/include/asm/arch_hweight.h
> > > index ba88edd0d58b..139a4b0a2a14 100644
> > > --- a/arch/x86/include/asm/arch_hweight.h
> > > +++ b/arch/x86/include/asm/arch_hweight.h
> > > @@ -52,4 +52,7 @@ static __always_inline unsigned long __arch_hweight64(__u64 w)
> > >   }
> > >   #endif /* CONFIG_X86_32 */
> > > 
> > > +#undef REG_IN
> > > +#undef REG_OUT
> > > +
> > >   #endif
> > > ==============><==================================
> > 
> > Can you submit a formal patch, please?
> 
> I'll submit it separately

Sure!

> > And I think it would be good to have my patch as well, so we do not depend on
> > the fate of the other one.
> 
> Yes sure

Thanks for acknowledging and review!

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
