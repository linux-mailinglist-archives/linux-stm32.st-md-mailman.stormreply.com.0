Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 500FE54D998
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Jun 2022 07:15:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ECD60C5C829;
	Thu, 16 Jun 2022 05:15:30 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 147EDC035BF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Jun 2022 05:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655356529; x=1686892529;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=w5f/uRo7VAfu2ZSH1O1BKsd51bCmWG6WWb8H4rj04YI=;
 b=mQndEkhGYzWMkIpZOUUvyiFxtMQ3nIz5PptNUdMF2rzkPPoivn0AUkwC
 zzFFXVEqHSFXDiHleYRuHlAG2o1GOFkR7F1Y9XJ0l4UvoKltIB6yZRrul
 bio+cpMLNqhok/eTF/jhUeAxDqQMzDEp+wQX1glreFIqVpdW0bFAUp6zu
 eCmtKk7miM0PiuXaSVeFTXmQIWo1+Mrnh5PC/zpPbCqEPgbq90Mzv1Am0
 5kCBBa8kXWtymPxJZvd/i7Sa4K8Wd4XH/+B/BTI3rSIxmprDE6ogCUVEQ
 5e1TM7m2MpMhEwa3bgsxMIM4EOuTPrXdko8IQnj8XIO5L3Fv2ZfsaXoUo A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10379"; a="267856836"
X-IronPort-AV: E=Sophos;i="5.91,304,1647327600"; d="scan'208";a="267856836"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2022 22:15:27 -0700
X-IronPort-AV: E=Sophos;i="5.91,304,1647327600"; d="scan'208";a="641366171"
Received: from mngueron-mobl1.amr.corp.intel.com ([10.252.60.248])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2022 22:15:19 -0700
Date: Thu, 16 Jun 2022 08:15:16 +0300 (EEST)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
In-Reply-To: <YqnnKQYAnqORpdBJ@smile.fi.intel.com>
Message-ID: <ddc178b-1292-248c-21a1-4cf990d0b1c@linux.intel.com>
References: <20220615124829.34516-1-ilpo.jarvinen@linux.intel.com>
 <20220615124829.34516-5-ilpo.jarvinen@linux.intel.com>
 <YqnnKQYAnqORpdBJ@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1748112325-1655356526=:1693"
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 LKML <linux-kernel@vger.kernel.org>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jiri Slaby <jirislaby@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Lino Sanfilippo <LinoSanfilippo@gmx.de>,
 NXP Linux Team <linux-imx@nxp.com>,
 linux-serial <linux-serial@vger.kernel.org>,
 =?ISO-8859-15?Q?Uwe_Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
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
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1748112325-1655356526=:1693
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8BIT

On Wed, 15 Jun 2022, Andy Shevchenko wrote:

> On Wed, Jun 15, 2022 at 03:48:27PM +0300, Ilpo Järvinen wrote:
> > To be able to alter ADDRB within .rs485_config(), take termios_rwsem
> > before calling .rs485_config() and pass termios.
> 
> I would use ->rs485_config() as a reference to the callback.
> 
> ...
> 
> > -	ret = port->rs485_config(port, rs485);
> > +	ret = port->rs485_config(port, rs485, NULL);
> 
> > +
> 
> Stray change?

Yes it was.

> >  	if (ret)
> >  		memset(rs485, 0, sizeof(*rs485));
> 
> ...
> 
> >  	void			(*handle_break)(struct uart_port *);
> >  	int			(*rs485_config)(struct uart_port *,
> > -						struct serial_rs485 *rs485);
> > +						struct serial_rs485 *rs485,
> > +						struct ktermios *termios);
> 
> Dunno if termios has to be second parameter. The idea is to pass input data
> followed by (auxiliary) output as usual pattern.

I guess I can make termios 2nd param.

-- 
 i.

--8323329-1748112325-1655356526=:1693
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--8323329-1748112325-1655356526=:1693--
