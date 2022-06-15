Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B96A654CADF
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Jun 2022 16:06:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 57F5AC5E2C6;
	Wed, 15 Jun 2022 14:06:46 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6DA92C03FDD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Jun 2022 14:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655302004; x=1686838004;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=/J7saP6W0TXPEiZ1K3kLi0tAL5PKe7Bfz4iY/dpF86g=;
 b=e791PoeOmL3IZFkCKgerPan09wOYxoYGUuWaVevWJVL5E9KSzafhUbBH
 PqvDkvAxXmZWT4PCR3yne3GLjR/T6eUSyHxd2TtKgcMPBTTdWW/UNnUDo
 nuqQuv+J6MLL6c1Os2Z2y4GPeKPRxl7I3HMlKZAam6NTHzphy3iE9cG31
 AhzgoWEdZicv1yBNkARGfRLdKIkLF0vsq6STTI0QPJipBn1J8GBzLW3Zh
 s9JPGNBd8UF3la8MEkTMrj4/cdPz1q+zjmbYLFxwQY7DLFXNG9jZK9v9+
 qv7Y0scO503Jxwa7FVHxJCejSv/F8VGug6eIUY6G2/c7LV1814IECLq6o A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10378"; a="277764954"
X-IronPort-AV: E=Sophos;i="5.91,302,1647327600"; d="scan'208";a="277764954"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2022 07:05:39 -0700
X-IronPort-AV: E=Sophos;i="5.91,302,1647327600"; d="scan'208";a="583222325"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2022 07:05:33 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1o1TeD-000dUK-Te; Wed, 15 Jun 2022 17:05:29 +0300
Date: Wed, 15 Jun 2022 17:05:29 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Message-ID: <YqnnKQYAnqORpdBJ@smile.fi.intel.com>
References: <20220615124829.34516-1-ilpo.jarvinen@linux.intel.com>
 <20220615124829.34516-5-ilpo.jarvinen@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220615124829.34516-5-ilpo.jarvinen@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-kernel@vger.kernel.org, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jiri Slaby <jirislaby@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Lino Sanfilippo <LinoSanfilippo@gmx.de>,
 NXP Linux Team <linux-imx@nxp.com>, linux-serial@vger.kernel.org,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Vladimir Zapolskiy <vz@mleia.com>,
 linux-arm-kernel@lists.infradead.org,
 Richard Genoud <richard.genoud@gmail.com>,
 Greg KH <gregkh@linuxfoundation.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Lukas Wunner <lukas@wunner.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [Linux-stm32] [PATCH v7 4/6] serial: take termios_rwsem for
 .rs485_config() & pass termios as param
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

On Wed, Jun 15, 2022 at 03:48:27PM +0300, Ilpo J=E4rvinen wrote:
> To be able to alter ADDRB within .rs485_config(), take termios_rwsem
> before calling .rs485_config() and pass termios.

I would use ->rs485_config() as a reference to the callback.

...

> -	ret =3D port->rs485_config(port, rs485);
> +	ret =3D port->rs485_config(port, rs485, NULL);

> +

Stray change?

>  	if (ret)
>  		memset(rs485, 0, sizeof(*rs485));

...

>  	void			(*handle_break)(struct uart_port *);
>  	int			(*rs485_config)(struct uart_port *,
> -						struct serial_rs485 *rs485);
> +						struct serial_rs485 *rs485,
> +						struct ktermios *termios);

Dunno if termios has to be second parameter. The idea is to pass input data
followed by (auxiliary) output as usual pattern.

>  	int			(*iso7816_config)(struct uart_port *,
>  						  struct serial_iso7816 *iso7816);

-- =

With Best Regards,
Andy Shevchenko


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
