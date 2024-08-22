Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C864695C586
	for <lists+linux-stm32@lfdr.de>; Fri, 23 Aug 2024 08:34:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6AC93C71290;
	Fri, 23 Aug 2024 06:34:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3D404C6C855
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Aug 2024 13:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724332791; x=1755868791;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=AOwS0wzy6B8Bvq3MTZmnJ0ymFayaCPe5P2yYx0ql3J8=;
 b=FfRuBXbICh2hhIA/3lwkxAarM4fMWf/U9ZC9ts8+JA0pu9HezChbaC+v
 bxG9v61FmJQv7qy8BpLrXLeIFO8/bQLq/RPPKkAshGsMlls+CqOL/Rhm7
 2jeCbpSs+TOkevQxIzkzAQwdgiGP7FRJgZfANrrcBASEnEbCNt4fUgN7e
 k6DGOGXiTm2tMAl/Pm1rFC/paH9Ywv8LGw1CXDhmIUrXPEa+8SM1pQUCz
 Q+psqAFZZHIz5rGNAqw+qAdP/WbrlrbcjAxyCGshrSBwJGVGHOwirsFmO
 m18z4SkpWJBJXHRsv3/nm0tuJSCJTseFhrJd7eaC2RwbZ/DAmeuiVSzNF Q==;
X-CSE-ConnectionGUID: acgBQZHGQ4qbh4qOi4I1Rg==
X-CSE-MsgGUID: BRZSh5PIT/WgbBfmdlP51g==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="26495224"
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; d="scan'208";a="26495224"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2024 06:19:43 -0700
X-CSE-ConnectionGUID: aZqIIPrXQmaC3bF8xGIB7w==
X-CSE-MsgGUID: cjWQAwxoQza2rxDC3PVRCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; d="scan'208";a="61110275"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2024 06:19:35 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1sh7it-00000000Sdx-13zx; Thu, 22 Aug 2024 16:19:31 +0300
Date: Thu, 22 Aug 2024 16:19:31 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Lei Liu <liulei.rjpt@vivo.com>
Message-ID: <Zsc645l_nFK_Xp-t@smile.fi.intel.com>
References: <20240822033924.32397-1-liulei.rjpt@vivo.com>
 <20240822033924.32397-6-liulei.rjpt@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240822033924.32397-6-liulei.rjpt@vivo.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Mailman-Approved-At: Fri, 23 Aug 2024 06:34:54 +0000
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Paul Cercueil <paul@crapouillou.net>,
 Thierry Reding <thierry.reding@gmail.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Jiri Slaby <jirislaby@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 opensource.kernel@vivo.com, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-arm-kernel@lists.infradead.org,
 linux-serial@vger.kernel.org,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-mips@vger.kernel.org, John Ogness <john.ogness@linutronix.de>,
 linux-kernel@vger.kernel.org, linux-actions@lists.infradead.org,
 linux-tegra@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Richard Genoud <richard.genoud@bootlin.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Lino Sanfilippo <l.sanfilippo@kunbus.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sudeep Holla <sudeep.holla@arm.com>, Jeff Johnson <quic_jjohnson@quicinc.com>,
 Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>
Subject: Re: [Linux-stm32] [PATCH 5/8] tty: mps2-uart: Use
	devm_clk_get_enabled() helpers
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

On Thu, Aug 22, 2024 at 11:39:09AM +0800, Lei Liu wrote:
> The devm_clk_get_enabled() helpers:
>     - call devm_clk_get()
>     - call clk_prepare_enable() and register what is needed in order to
>      call clk_disable_unprepare() when needed, as a managed resource.
> 
> This simplifies the code and avoids calls to clk_disable_unprepare().

...

> -	mps_port->clk = devm_clk_get(&pdev->dev, NULL);
> +	mps_port->clk = devm_clk_get_enabled(&pdev->dev, NULL);
>  	if (IS_ERR(mps_port->clk))
>  		return PTR_ERR(mps_port->clk);
>  
> -	ret = clk_prepare_enable(mps_port->clk);
> -	if (ret)
> -		return ret;
> -
>  	mps_port->port.uartclk = clk_get_rate(mps_port->clk);
>  
> -	clk_disable_unprepare(mps_port->clk);

Your change is not equivalent. In case this clock is shared this may lead to
run-time issues. Hence I don't think this patch is needed in this case.
Instead, you may add a comment on top of devm_clk_get() to explain that we only
need it be enabled to get clock rate in the probe.

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
