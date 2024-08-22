Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2982A95C58E
	for <lists+linux-stm32@lfdr.de>; Fri, 23 Aug 2024 08:35:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E6CD0C7801F;
	Fri, 23 Aug 2024 06:35:04 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 69BC4C6C855
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Aug 2024 14:33:20 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D6BBF1C0002;
 Thu, 22 Aug 2024 14:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1724337199;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=28KjxeZ01+p9nDVnGtXx9KfJaHBczSdiwVjl2vmbphI=;
 b=MmE2IZpmpKFJ4A+9lsXAKU6W/E6Whvpbyy4BTW/u9jMcZ/kVKNoKCfgBmi6FUpl9ngeq2T
 jY4JhCs28GxODWc7Ckqrhcu9ZytXED4ifDTkMbDd+4INaZ9enWDSxSfPNhlqy/Xmfv5w9X
 aIXpRI0K3ER1hNzFuCfUbPGXnGLY/nMTaI0chcba5QUSnTcnEeN0SH/GSHVIJ1A9b3mjo0
 gnPZOYtCJ+fuTZm7aIiPfHP1iKEYzuI6rEUSb5d52Ugs37TTubxvW1Pk36T5hkKzmoRE26
 sQMCRp4IUvgBMPgmPEnOyQtwlHW4Y7tmuo/RCjTgySkhgK9eJhmohngZfX0Xvw==
Date: Thu, 22 Aug 2024 16:33:16 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Message-ID: <202408221433165841f563@mail.local>
References: <20240822033924.32397-1-liulei.rjpt@vivo.com>
 <20240822033924.32397-5-liulei.rjpt@vivo.com>
 <c54434e3-1fb8-4491-b24f-2167786fe84c@bootlin.com>
 <Zsc-ZNg_S8uT9gpR@smile.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Zsc-ZNg_S8uT9gpR@smile.fi.intel.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-Mailman-Approved-At: Fri, 23 Aug 2024 06:35:03 +0000
Cc: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
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
 Richard GENOUD <richard.genoud@bootlin.com>,
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

On 22/08/2024 16:34:28+0300, Andy Shevchenko wrote:
> On Thu, Aug 22, 2024 at 03:28:40PM +0200, Richard GENOUD wrote:
> > Le 22/08/2024 =E0 05:39, Lei Liu a =E9crit=A0:
> > > The devm_clk_get_enabled() helpers:
> > >      - call devm_clk_get()
> > >      - call clk_prepare_enable() and register what is needed in order=
 to
> > >       call clk_disable_unprepare() when needed, as a managed resource.
> > > =

> > > This simplifies the code and avoids calls to clk_disable_unprepare().
> =

> ...
> =

> > >   	 * The peripheral clock can now safely be disabled till the port
> > >   	 * is used
> > >   	 */
> > > -	clk_disable_unprepare(atmel_port->clk);
> > > -
> > Why removing this ?
> > This is not an error path.
> =

> Good point, I wouldn't apply this patch as well as a few others in this s=
eries
> due to this reason.
> =

> Instead it might make sense to add a comment on top of devm_clk_get() to
> explain why _enabled() variant is *not* used.

Or maybe stop doing brainded conversions to new APIs.

> =

> -- =

> With Best Regards,
> Andy Shevchenko
> =

> =


-- =

Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
