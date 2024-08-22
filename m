Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BB90B95C585
	for <lists+linux-stm32@lfdr.de>; Fri, 23 Aug 2024 08:34:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4C592C71287;
	Fri, 23 Aug 2024 06:34:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8B11CC6C855
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Aug 2024 13:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724332264; x=1755868264;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=xmonMa7CWYPhpUCav6lGTP6kAPkTd4VjdENwMfAjDQ8=;
 b=nFmOaAFIB9d17qL8LnK/MdA6zzke0OxqirCeaJDcKM/pgYe99bae6FFq
 614TZ9IH1Sx6PNgq+2pPgqCGi5vAkurQMtPES3O8kPQBRKZNM9qfolDL6
 utmuGrmuSeY7ovHbyRVYS8qWhQUoptMi+/n7S5u3mpzkdCUSZ7P+jE5Pt
 /9vhJ5xa7UM9XwPsBvqQazIGIzPQnwz1ZzlrxNw797nJUYOcy8lzdVbAF
 D271sD3m/05LPP99/zjixM4M/1le5VRN9aZ9Xg5rtfpfFm/lW9GIzz0AC
 06vgAEkeJE6NGSGeQD8G2RPNbZ4l6F9nm7bLICZPMQuf9ChqwAaZZmS+5 Q==;
X-CSE-ConnectionGUID: ESqR4vP2R/S8PgCEZtgZvw==
X-CSE-MsgGUID: WtGhbo2GQUWyh5FCLHxzDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="33896721"
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; d="scan'208";a="33896721"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2024 06:10:16 -0700
X-CSE-ConnectionGUID: 1SNaBPdZR7KIjuHORoDEkg==
X-CSE-MsgGUID: dDS462oYQ5eH9CKAcZxrOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; d="scan'208";a="61759647"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2024 06:10:03 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1sh7ZB-00000000ST5-0oxN; Thu, 22 Aug 2024 16:09:29 +0300
Date: Thu, 22 Aug 2024 16:09:28 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Lei Liu <liulei.rjpt@vivo.com>
Message-ID: <Zsc4iPRCRKuFW0ZZ@smile.fi.intel.com>
References: <20240822033924.32397-1-liulei.rjpt@vivo.com>
 <20240822033924.32397-2-liulei.rjpt@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240822033924.32397-2-liulei.rjpt@vivo.com>
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
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-arm-kernel@lists.infradead.org,
 linux-serial@vger.kernel.org,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-mips@vger.kernel.org, John Ogness <john.ogness@linutronix.de>,
 linux-kernel@vger.kernel.org, linux-actions@lists.infradead.org,
 linux-tegra@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Richard Genoud <richard.genoud@bootlin.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Lino Sanfilippo <l.sanfilippo@kunbus.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sudeep Holla <sudeep.holla@arm.com>, Jeff Johnson <quic_jjohnson@quicinc.com>,
 Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>
Subject: Re: [Linux-stm32] [PATCH 1/8] tty: 8250_ingenic: Use
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

On Thu, Aug 22, 2024 at 11:39:05AM +0800, Lei Liu wrote:
> The devm_clk_get_enabled() helpers:
>     - call devm_clk_get()
>     - call clk_prepare_enable() and register what is needed in order to
>      call clk_disable_unprepare() when needed, as a managed resource.
> 
> This simplifies the code and avoids calls to clk_disable_unprepare().

...

>  	data->line = serial8250_register_8250_port(&uart);
>  	if (data->line < 0) {
>  		err = data->line;
> -		goto out_disable_baudclk;
> +		return err;
>  	}

	data->line = serial8250_register_8250_port(&uart);
	if (data->line < 0)
		return data->line;

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
