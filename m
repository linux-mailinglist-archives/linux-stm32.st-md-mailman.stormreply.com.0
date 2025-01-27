Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E6EFA1D697
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Jan 2025 14:25:37 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1BB9CC71289;
	Mon, 27 Jan 2025 13:25:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6590DC69063
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Jan 2025 13:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737984336; x=1769520336;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=RjFj+btLOrA1I0c/0XDEPot6dd9rNyckywxmgkJzq3o=;
 b=MUa7F2u4gGzBTL1Hu18S0pcrFArr5F669jllR0aI8h0eqVtqJC/w+JFS
 cc2Ogap8T6RvTQA1ukseEdlWXi+U0UUojZjCU+ZqHEsHB93dSXsSVBmuX
 r4ARIuTLyO8veyBItzT6390BB2JWWm9Wlk+u5yWJ8akm1q1BRV1C/IWCT
 cmBaTyDaoD5DY67GbFViQWyYdSKMHWewY2DOBOz/NP2JJLhS7RjEmyMkF
 wnV1hMA4iEceK1JA5VXpQWYz7BAD46PmB2iptwB0i6lSdNuHvRx/2I2xG
 1MCrUW1HOsAHfcAur0xuFWov39lroIXwUb3ZEG0sUMmKOZ/6+6qS9tjVr g==;
X-CSE-ConnectionGUID: 0BBFnWQlQ+6ML/HE+0oo0A==
X-CSE-MsgGUID: cdDR4fQLQ22ueqCXJggEDQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11328"; a="42105349"
X-IronPort-AV: E=Sophos;i="6.13,238,1732608000"; d="scan'208";a="42105349"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2025 05:25:22 -0800
X-CSE-ConnectionGUID: oOw//HyuRH2sXbDiVD3/cA==
X-CSE-MsgGUID: F7vXYkyrSx2N1gt4t3xT9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="131730368"
Received: from smile.fi.intel.com ([10.237.72.58])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2025 05:25:02 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@intel.com>)
 id 1tcP6l-00000005jpm-3fIe; Mon, 27 Jan 2025 15:24:55 +0200
Date: Mon, 27 Jan 2025 15:24:55 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Arnd Bergmann <arnd@kernel.org>
Message-ID: <Z5eJJ199QwL0HVJT@smile.fi.intel.com>
References: <20240403080702.3509288-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240403080702.3509288-1-arnd@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Heiko Stuebner <heiko@sntech.de>, "Rafael J. Wysocki" <rafael@kernel.org>,
 dri-devel@lists.freedesktop.org,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Christoph Hellwig <hch@lst.de>, linux-samsung-soc@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, linux-pm@vger.kernel.org,
 linux-sound@vger.kernel.org, Ian Abbott <abbotti@mev.co.uk>,
 linux-omap@vger.kernel.org, Trond Myklebust <trond.myklebust@hammerspace.com>,
 Alex Elder <elder@kernel.org>, Tero Kristo <kristo@kernel.org>,
 Xiang Chen <chenxiang66@hisilicon.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, H Hartley Sweeten <hsweeten@visionengravers.com>,
 Iyappan Subramanian <iyappan@os.amperecomputing.com>,
 linux-crypto@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linux-trace-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Markuss Broks <markuss.broks@gmail.com>,
 Vaibhav Hiremath <hvaibhav.linux@gmail.com>, linux-i2c@vger.kernel.org,
 Lars-Peter Clausen <lars@metafoo.de>, Corey Minyard <minyard@acm.org>,
 Helge Deller <deller@gmx.de>, Lee Jones <lee@kernel.org>,
 linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org,
 iommu@lists.linux.dev, Yisen Zhuang <yisen.zhuang@huawei.com>,
 Len Brown <lenb@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Michael Hennerich <michael.hennerich@analog.com>, linux-kbuild@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, greybus-dev@lists.linaro.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Jarkko Sakkinen <jarkko@kernel.org>, Anna Schumaker <anna@kernel.org>,
 linux-integrity@vger.kernel.org, alsa-devel@alsa-project.org,
 Jonathan Cameron <jic23@kernel.org>, linux-efi@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-fpga@vger.kernel.org,
 linux-fbdev@vger.kernel.org, kasan-dev@googlegroups.com,
 Jiri Slaby <jirislaby@kernel.org>, linux-rtc@vger.kernel.org,
 Stanislaw Gruszka <stf_xl@wp.pl>, Masahiro Yamada <masahiroy@kernel.org>,
 linux-staging@lists.linux.dev, linux-input@vger.kernel.org,
 Jacky Huang <ychuang3@nuvoton.com>, Kees Cook <keescook@chromium.org>,
 Arnd Bergmann <arnd@arndb.de>, Jiri Kosina <jikos@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Steven Rostedt <rostedt@goodmis.org>,
 Nathan Chancellor <nathan@kernel.org>, Mark Brown <broonie@kernel.org>,
 Moritz Fischer <mdf@kernel.org>, openipmi-developer@lists.sourceforge.net,
 linux-nfs@vger.kernel.org, "Martin K. Petersen" <martin.petersen@oracle.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Sebastian Reichel <sre@kernel.org>, Peter Rosin <peda@axentia.se>,
 linux-stm32@st-md-mailman.stormreply.com, Tony Lindgren <tony@atomide.com>,
 Liviu Dudau <liviu.dudau@arm.com>, linux-ide@vger.kernel.org,
 Peter Huewe <peterhuewe@gmx.de>, Ard Biesheuvel <ardb@kernel.org>,
 linux-leds@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>,
 linux-scsi@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 linux-serial@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Masami Hiramatsu <mhiramat@kernel.org>, Kalle Valo <kvalo@kernel.org>,
 John Allen <john.allen@amd.com>, netdev@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Damien Le Moal <dlemoal@kernel.org>, dmaengine@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [Linux-stm32] [PATCH 00/34] address all -Wunused-const warnings
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

On Wed, Apr 03, 2024 at 10:06:18AM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Compilers traditionally warn for unused 'static' variables, but not
> if they are constant. The reason here is a custom for C++ programmers
> to define named constants as 'static const' variables in header files
> instead of using macros or enums.
> 
> In W=1 builds, we get warnings only static const variables in C
> files, but not in headers, which is a good compromise, but this still
> produces warning output in at least 30 files. These warnings are
> almost all harmless, but also trivial to fix, and there is no
> good reason to warn only about the non-const variables being unused.
> 
> I've gone through all the files that I found using randconfig and
> allmodconfig builds and created patches to avoid these warnings,
> with the goal of retaining a clean build once the option is enabled
> by default.
> 
> Unfortunately, there is one fairly large patch ("drivers: remove
> incorrect of_match_ptr/ACPI_PTR annotations") that touches
> 34 individual drivers that all need the same one-line change.
> If necessary, I can split it up by driver or by subsystem,
> but at least for reviewing I would keep it as one piece for
> the moment.
> 
> Please merge the individual patches through subsystem trees.
> I expect that some of these will have to go through multiple
> revisions before they are picked up, so anything that gets
> applied early saves me from resending.

Arnd, can you refresh this one? It seems some misses still...
I have got 3+ 0-day reports against one of the mux drivers.

https://lore.kernel.org/all/?q=adg792a.c

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
