Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FBF395C58A
	for <lists+linux-stm32@lfdr.de>; Fri, 23 Aug 2024 08:34:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9B0FDC78028;
	Fri, 23 Aug 2024 06:34:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3DDD2C6C855
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Aug 2024 13:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724333059; x=1755869059;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Ifzdw8rZaLUtG4yjgZfU3oaFMdqGu3/9BL4OZPs5jTM=;
 b=XxgpHf679eS1z9gyOrU6khZ1ud+DK9dK7vDLm/KOkCQw0a83tTeNlVS5
 zl9kHx6nJyCgV7xZkaCC/MmOv0mSvF84kgLDPcvf175haHtLOR25jhQ00
 Mzh/tUE3NwZ5jtRksLhC1C18a89IlISMCaYqKM8sufzdZSdUBfAjtsfRT
 RSPAFDbmsApQMz1k57sYzzjjS8UJTV26aVCgHKVu1Wn7+YAWuxk3hSyzP
 fn4q0G47FGqhqoJn4oLgDjaljOV3Hnf700rQ+fFaMHjCRQJW+ZFaW2q/5
 nV5aZEm+6lwCSwnPWKe3t2z9Kcb7CwfuemaLKwe23Nu9UiLJCLuj8Fl2r g==;
X-CSE-ConnectionGUID: MIMJo1kqSPy0Q3iTrPPOqQ==
X-CSE-MsgGUID: 5n2pxfqbQYOB3JaIbY6iIw==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="22614263"
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; d="scan'208";a="22614263"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2024 06:24:17 -0700
X-CSE-ConnectionGUID: l54lGSTOTjqGjj8UehtWGA==
X-CSE-MsgGUID: 8oVq4/R6Qk+gMwwh54YXQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; d="scan'208";a="61596334"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2024 06:24:10 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1sh7nJ-00000000Sif-16vw; Thu, 22 Aug 2024 16:24:05 +0300
Date: Thu, 22 Aug 2024 16:24:05 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Paul Cercueil <paul@crapouillou.net>
Message-ID: <Zsc79Y6MURWZdnzU@smile.fi.intel.com>
References: <20240822033924.32397-1-liulei.rjpt@vivo.com>
 <20240822033924.32397-2-liulei.rjpt@vivo.com>
 <09d6a69610ccec161ad8e0f2df64d8264c0a64fe.camel@crapouillou.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <09d6a69610ccec161ad8e0f2df64d8264c0a64fe.camel@crapouillou.net>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Mailman-Approved-At: Fri, 23 Aug 2024 06:34:54 +0000
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Thierry Reding <thierry.reding@gmail.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Jiri Slaby <jirislaby@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 opensource.kernel@vivo.com, Geert Uytterhoeven <geert+renesas@glider.be>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-arm-kernel@lists.infradead.org,
 linux-serial@vger.kernel.org,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-mips@vger.kernel.org, Lei Liu <liulei.rjpt@vivo.com>,
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Thu, Aug 22, 2024 at 11:40:46AM +0200, Paul Cercueil wrote:
> Le jeudi 22 ao=FBt 2024 =E0 11:39 +0800, Lei Liu a =E9crit=A0:

...

> Not really worth a V2, but if you make a V2, please "return data-
> >line;" directly.

> Acked-by: Paul Cercueil <paul@crapouillou.net>

Despite of this, the series has other small issues that needs to be address=
ed,
so I would wait for v2.

-- =

With Best Regards,
Andy Shevchenko


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
