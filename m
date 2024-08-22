Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0232795C588
	for <lists+linux-stm32@lfdr.de>; Fri, 23 Aug 2024 08:34:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8FC0BC7801F;
	Fri, 23 Aug 2024 06:34:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B37B3C6C855
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Aug 2024 13:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724333003; x=1755869003;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=KFpKpnvDW0vqhhMnIVIsrqf2HnMAwgbclbS7nIfq404=;
 b=Pxb34z55bggOzAtapaUwGOU2Y6t9fFMNwOJ4bkjkO7tIGbxpSiJmfIfX
 YlWAxpdl+zaU9i60kwqXv9rhMZRtkOqXB7EUZa96hF1GV0h0GkDFunN/K
 JHWZchvLJoaGP/0wI5raN1qn6Lg0ck4wWRJkys/K+iKGNYJ2+bjzxvxsd
 qhDEzwICtw7AaCN0oFpcgkSs+68w9Mo68d6W/jY4pH2MsLXJLnA0yIPgp
 4V0YgRbzQsI0cw601Qi+eSrKrXCeD3aVuaDYsrDnnWIBPgFplO7im8T1y
 +QIToie0muU8q1Qykoa13EBLkhVsmtoT8r1+mk5O+iFxdomwg00/8vwM1 Q==;
X-CSE-ConnectionGUID: vV8XdygKTWWk9oARfnxHcQ==
X-CSE-MsgGUID: OS4tRiSrRfGEpGsGOxCQTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="40206710"
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; d="scan'208";a="40206710"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2024 06:23:15 -0700
X-CSE-ConnectionGUID: mVP2oLmLRwW6zgMul9JDcQ==
X-CSE-MsgGUID: /9OVbZTARoyrygXmExiBxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; d="scan'208";a="65644729"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2024 06:23:08 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1sh7mI-00000000Shg-0KHI; Thu, 22 Aug 2024 16:23:02 +0300
Date: Thu, 22 Aug 2024 16:23:01 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Lei Liu <liulei.rjpt@vivo.com>
Message-ID: <Zsc7tWn7oSKp7zTx@smile.fi.intel.com>
References: <20240822033924.32397-1-liulei.rjpt@vivo.com>
 <20240822033924.32397-9-liulei.rjpt@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240822033924.32397-9-liulei.rjpt@vivo.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Mailman-Approved-At: Fri, 23 Aug 2024 06:34:54 +0000
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Paul Cercueil <paul@crapouillou.net>,
 Thierry Reding <thierry.reding@gmail.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Jiri Slaby <jirislaby@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 opensource.kernel@vivo.com, Geert Uytterhoeven <geert+renesas@glider.be>,
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
Subject: Re: [Linux-stm32] [PATCH 8/8] tty: stm32-usart: Use
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

On Thu, Aug 22, 2024 at 11:39:12AM +0800, Lei Liu wrote:
> The devm_clk_get_enabled() helpers:
>     - call devm_clk_get()
>     - call clk_prepare_enable() and register what is needed in order to
>      call clk_disable_unprepare() when needed, as a managed resource.
> 
> This simplifies the code and avoids calls to clk_disable_unprepare().

...

>  err_clk:
> -	clk_disable_unprepare(stm32port->clk);
>  
>  	return ret;

No unneeded label, please drop it as well and return directly.

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
