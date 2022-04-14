Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD37501B1E
	for <lists+linux-stm32@lfdr.de>; Thu, 14 Apr 2022 20:33:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6E90AC60495;
	Thu, 14 Apr 2022 18:33:27 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BE3E5C5E2CC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Apr 2022 18:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649961206; x=1681497206;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=oRmVExYVaB1xDR78U0c+1m6aDPKj+y1FVLIHRd7bypw=;
 b=BZ9IHDC0jfrITOIWpNfU2qJ83H62CU6Q9SNrhLQnsLPHLre/ilV2gNiK
 sP7e22t8XVPAddbOVLW+td5FqShLKMHfP7KSQGbDkmwn7Gra5cYm2q5hQ
 Hf5Y9hoWMV0eJuKyDKOLuLBh+AqgB6xuowKqQaQKym3BudkiGYHmqSYhE
 856FEFfuqXxcQLGPov2F+JbOCOtE/jF9E2y5DCqt5yvnQn72BL+SQ+tom
 AkbG7nT0ru5SK4TBQ5XJiWppSBZ0XWMc2RY46Bn3ugdxRKhFEjj7DcZbz
 9uOqxfLmpofMr+I6xSaRA7SuykyDpEOo+pZCcr4TLkCW/FQhAVoO5w4Nn w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10317"; a="262449063"
X-IronPort-AV: E=Sophos;i="5.90,260,1643702400"; d="scan'208";a="262449063"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 11:33:23 -0700
X-IronPort-AV: E=Sophos;i="5.90,260,1643702400"; d="scan'208";a="527503151"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 11:33:15 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1nf4HH-002Rzo-IM; Thu, 14 Apr 2022 21:33:11 +0300
Date: Thu, 14 Apr 2022 21:33:11 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Message-ID: <Ylho5+teMJGxooYI@smile.fi.intel.com>
References: <20220401103604.8705-1-andriy.shevchenko@linux.intel.com>
 <CGME20220414063849eucas1p126e41b53ff0d342f5c48408994b704e9@eucas1p1.samsung.com>
 <20220401103604.8705-12-andriy.shevchenko@linux.intel.com>
 <3a24ef01-3231-1bee-7429-dce5680c5682@samsung.com>
 <CAHp75VfMPpfeMpawRyLo_GtLR8+gVGgm8zW-fatp6=9a9wK18A@mail.gmail.com>
 <CAFBinCCCtZvdp+01DdEE=-f7rZ8V46O125wKDqE1muA645sdUg@mail.gmail.com>
 <CAHp75VcYaGmEruEsi2UUrLU4=k3OpBn2YV8B0LhyrhtQ=uCTXg@mail.gmail.com>
 <Ylhnzg3bvbrfpoFi@smile.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Ylhnzg3bvbrfpoFi@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: Andrew Lunn <andrew@lunn.ch>, Tomer Maimon <tmaimon77@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Linus Walleij <linus.walleij@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>,
 Tali Perry <tali.perry1@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
 Benjamin Fair <benjaminfair@google.com>, Marc Zyngier <maz@kernel.org>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Nancy Yuen <yuenn@google.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Alim Akhtar <alim.akhtar@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Qianggui Song <qianggui.song@amlogic.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-amlogic <linux-amlogic@lists.infradead.org>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: [Linux-stm32] [PATCH v4 11/13] pinctrl: meson: Replace custom
 code by gpiochip_node_count() call
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

On Thu, Apr 14, 2022 at 09:28:30PM +0300, Andy Shevchenko wrote:
> On Thu, Apr 14, 2022 at 07:06:21PM +0300, Andy Shevchenko wrote:
> > On Thu, Apr 14, 2022 at 6:32 PM Martin Blumenstingl
> > <martin.blumenstingl@googlemail.com> wrote:
> > > On Thu, Apr 14, 2022 at 3:51 PM Andy Shevchenko
> > > <andy.shevchenko@gmail.com> wrote:
> > > [...]
> > > > > This patch landed in linux next-20220413 as commit 88834c75cae5
> > > > > ("pinctrl: meson: Replace custom code by gpiochip_node_count() call").
> > > > > Unfortunately it breaks booting of all my Amlogic-based test boards
> > > > > (Odroid C4, N2, Khadas VIM3, VIM3l). MMC driver is no longer probed and
> > > > > boards are unable to mount rootfs. Reverting this patch on top of
> > > > > linux-next fixes the issue.
> > > >
> > > > Thank you for letting me know, I'll withdraw it and investigate.
> > > If needed I can investigate further later today/tomorrow. I think the
> > > problem is that our node name doesn't follow the .dts recommendation.
> > >
> > > For GXL (arch/arm64/boot/dts/amlogic/meson-gxl.dtsi) the GPIO
> > > controller nodes are for example:
> > >   gpio: bank@4b0 {
> > >       ...
> > >   }
> > > and
> > >   gpio_ao: bank@14 {
> > >       ...
> > >   }
> > >
> > > See also:
> > > $ git grep -C6 gpio-controller arch/arm64/boot/dts/amlogic/*.dtsi
> > >
> > > Marek did not state which error he's getting but I suspect it fails
> > > with "no gpio node found".
> > 
> > Would be interesting to know that, yeah.
> > 
> > The subtle difference between the patched and unpatched version is
> > that the former uses only available nodes, it means that node is not
> > available by some reason and then the error would be the one you
> > guessed.
> 
> Looking into the difference between iterating via available nodes I have found
> nothing suspicious. Your DTSes do not have status property, so it assumes the
> node is available.
> 
> I'm quite puzzled what's going on there. Because I can't see what the logical
> difference the patch brought in.
> 
> P.S. In any case it's withdrawn now and shouldn't appear in the next Linux
> Next. But I would really appreciate more input on this.

Okay, now I got it. The "name" of the node is not the same as containing the
property with a given name. So, the faulting line of the code is this one:

gpio_np = to_of_node(device_get_named_child_node(pc->dev, "gpio-controller"));


-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
