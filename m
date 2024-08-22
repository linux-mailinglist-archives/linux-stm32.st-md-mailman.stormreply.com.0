Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E38C495C587
	for <lists+linux-stm32@lfdr.de>; Fri, 23 Aug 2024 08:34:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7E06CC78019;
	Fri, 23 Aug 2024 06:34:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BAD5EC6C855
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Aug 2024 13:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724332936; x=1755868936;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=6lUyVJL682/y+zHKSdeUnO1XoMkcTCqidWCSE5Cgcds=;
 b=FO5ud0olV3A/KldSsXy31T7HPmFN9oN/B62YTAitKk5UTSAIMWjgeoS4
 72Sf5BaZKsb7uFQkUySYr7/TMxLuwq5G+xAuUjUqF5FEJvrk0CDYBYFYS
 3m8aEEbPpszo5kLXEBa11y2qLF7mj58+YNYdYHdxLCu7XKasASFg/TK54
 Qip77j0E8kHPa+zbfVVNwzBvcypAHmD3vLSWEjn+QGL0QOG/uMZQQKIHT
 4xe7Z/Km7+0XwmHrkeJ9rLbyqsMIc+aozEb6Xxqx+w4CHcEeZrGVZMaCi
 fFKdw1WT1ldXRKAPPfeTeYcQk8OroGMMENfWYWeMfuWGUjfu1rjSf39tT w==;
X-CSE-ConnectionGUID: RuvObwLAQAGRF6mkukxBUg==
X-CSE-MsgGUID: tlhPJ2FZQ4C1TqKbfrFAXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="22268346"
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; d="scan'208";a="22268346"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2024 06:22:08 -0700
X-CSE-ConnectionGUID: mIssrLQYQ4eMGfz/yeBcfA==
X-CSE-MsgGUID: 7UrOXBtlTwKCxSEkW+YKnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; d="scan'208";a="66126744"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2024 06:22:00 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1sh7lD-00000000SgH-0pqd; Thu, 22 Aug 2024 16:21:55 +0300
Date: Thu, 22 Aug 2024 16:21:54 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Lei Liu <liulei.rjpt@vivo.com>
Message-ID: <Zsc7chKkKMZLs-bZ@smile.fi.intel.com>
References: <20240822033924.32397-1-liulei.rjpt@vivo.com>
 <20240822033924.32397-8-liulei.rjpt@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240822033924.32397-8-liulei.rjpt@vivo.com>
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
 Andi Shyti <andi.shyti@linux.intel.com>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-mips@vger.kernel.org, linux-serial@vger.kernel.org,
 John Ogness <john.ogness@linutronix.de>, linux-kernel@vger.kernel.org,
 linux-actions@lists.infradead.org, linux-tegra@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>,
 Richard Genoud <richard.genoud@bootlin.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Lino Sanfilippo <l.sanfilippo@kunbus.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sudeep Holla <sudeep.holla@arm.com>, Jeff Johnson <quic_jjohnson@quicinc.com>,
 Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>
Subject: Re: [Linux-stm32] [PATCH 7/8] tty: st-asc: Use
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

On Thu, Aug 22, 2024 at 11:39:11AM +0800, Lei Liu wrote:
> The devm_clk_get_enabled() helpers:
>     - call devm_clk_get()
>     - call clk_prepare_enable() and register what is needed in order to
>      call clk_disable_unprepare() when needed, as a managed resource.
> 
> This simplifies the code and avoids calls to clk_disable_unprepare().

...

Same caveat as in another patch comment.

> -	ascport->clk = devm_clk_get(&pdev->dev, NULL);
> +	ascport->clk = devm_clk_get_enabled(&pdev->dev, NULL);
>  
>  	if (WARN_ON(IS_ERR(ascport->clk)))
>  		return -EINVAL;
> -	/* ensure that clk rate is correct by enabling the clk */
> -	ret = clk_prepare_enable(ascport->clk);
> -	if (ret)
> -		return ret;
> +
>  	ascport->port.uartclk = clk_get_rate(ascport->clk);

>  	WARN_ON(ascport->port.uartclk == 0);

Btw, not related to this series, you may try to get rid of these 0 checks as
the serial core has this and it will fail anyway. Perhaps you want to expand
serial core to issue an error message (if it's not done yet).

> -	clk_disable_unprepare(ascport->clk);

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
