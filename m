Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6D595C58C
	for <lists+linux-stm32@lfdr.de>; Fri, 23 Aug 2024 08:34:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BE9D0C78030;
	Fri, 23 Aug 2024 06:34:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5C134C6DD9D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Aug 2024 13:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724333762; x=1755869762;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=0LjGR0jv6vQPi1I16qcrigZKwqwq5Ay6KaAm2phGUVQ=;
 b=nMTHVOUSIeSvt2Jr5zKO0q5P+QcmUvk0I14IpB/I+S+hY5YbRLld2jhL
 wG8xCvFsqUiw41OK9y7+DPOieV/H48tNe4Uyh4FxMlekpZ4Iq99ASgRiK
 Z4sOl/+2NLLEeRwy6zRRfy9bj1O4sYjQzpnl81y2htd5HM8Z5RI7Z3V35
 0YWWSnzEIy+nScP+HTJGrk6hVGe4Y9VEDgzgVl8UVrwqMuF+xut+c/nUj
 2Gf5jASyhV9BwT54uRYVQgHd1mhUsIAvYQReWK8dj/kWL1SCVf2RL01j+
 SzRnupHZUHGUxMVqY4Vwjgv9wp8R4iontT8ksZPngyZpeuJ+0a5PK8yiy A==;
X-CSE-ConnectionGUID: c2qcF5dxQV+P9FFyNxru4A==
X-CSE-MsgGUID: bW8fC8beT3GHAjv3xhgERw==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="22927328"
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; d="scan'208";a="22927328"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2024 06:35:53 -0700
X-CSE-ConnectionGUID: 6/NWjhhmSSKzAJQm5iXJ3Q==
X-CSE-MsgGUID: ei5bsNzcSRiljAVcDqkypQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; d="scan'208";a="61293724"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2024 06:35:44 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1sh7xM-00000000Sux-3XeL; Thu, 22 Aug 2024 16:34:28 +0300
Date: Thu, 22 Aug 2024 16:34:28 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Richard GENOUD <richard.genoud@bootlin.com>
Message-ID: <Zsc-ZNg_S8uT9gpR@smile.fi.intel.com>
References: <20240822033924.32397-1-liulei.rjpt@vivo.com>
 <20240822033924.32397-5-liulei.rjpt@vivo.com>
 <c54434e3-1fb8-4491-b24f-2167786fe84c@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c54434e3-1fb8-4491-b24f-2167786fe84c@bootlin.com>
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
 opensource.kernel@vivo.com, Florian Fainelli <florian.fainelli@broadcom.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-arm-kernel@lists.infradead.org,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-mips@vger.kernel.org, Lei Liu <liulei.rjpt@vivo.com>,
 John Ogness <john.ogness@linutronix.de>, linux-kernel@vger.kernel.org,
 linux-actions@lists.infradead.org, linux-serial@vger.kernel.org,
 linux-tegra@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Lino Sanfilippo <l.sanfilippo@kunbus.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sudeep Holla <sudeep.holla@arm.com>, Jeff Johnson <quic_jjohnson@quicinc.com>,
 Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>
Subject: Re: [Linux-stm32] [PATCH 4/8] tty: atmel_serial: Use
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

On Thu, Aug 22, 2024 at 03:28:40PM +0200, Richard GENOUD wrote:
> Le 22/08/2024 =E0 05:39, Lei Liu a =E9crit=A0:
> > The devm_clk_get_enabled() helpers:
> >      - call devm_clk_get()
> >      - call clk_prepare_enable() and register what is needed in order to
> >       call clk_disable_unprepare() when needed, as a managed resource.
> > =

> > This simplifies the code and avoids calls to clk_disable_unprepare().

...

> >   	 * The peripheral clock can now safely be disabled till the port
> >   	 * is used
> >   	 */
> > -	clk_disable_unprepare(atmel_port->clk);
> > -
> Why removing this ?
> This is not an error path.

Good point, I wouldn't apply this patch as well as a few others in this ser=
ies
due to this reason.

Instead it might make sense to add a comment on top of devm_clk_get() to
explain why _enabled() variant is *not* used.

-- =

With Best Regards,
Andy Shevchenko


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
