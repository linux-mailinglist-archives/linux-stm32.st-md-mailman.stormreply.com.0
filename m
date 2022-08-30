Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6535E5A5E85
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Aug 2022 10:49:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 245F7C5EC6B;
	Tue, 30 Aug 2022 08:49:40 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 68C99C57B6C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Aug 2022 08:49:39 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B43F9B81889;
 Tue, 30 Aug 2022 08:49:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C9BBC433D7;
 Tue, 30 Aug 2022 08:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1661849377;
 bh=y+1MMFa8GkCF5J8xOBa4wpAmNDUFKU7en8TBxW//a4E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Bf1YtPs307mo8lMrBvPJ8JYzsN4hPwgTGnjeruF2ZT+1HYnd27ANo4lCmBvYw6VuQ
 2XxLEk1UupnJaBo6WfhMPaUkQ7okqnaaO9IlK6tMeOhVGHNOJT8Nvn6H+iLkIHrqoI
 YzbnTxjGWzGZRSZHOSZBz4hrQkidgYl3DUpQ/ghA=
Date: Tue, 30 Aug 2022 10:49:34 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Message-ID: <Yw3PHg0imhJyb9sf@kroah.com>
References: <20220830072956.3630-1-ilpo.jarvinen@linux.intel.com>
 <20220830072956.3630-5-ilpo.jarvinen@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220830072956.3630-5-ilpo.jarvinen@linux.intel.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Jonathan Corbet <corbet@lwn.net>, Jiri Slaby <jirislaby@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Lino Sanfilippo <LinoSanfilippo@gmx.de>,
 NXP Linux Team <linux-imx@nxp.com>, linux-serial@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Vladimir Zapolskiy <vz@mleia.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org,
 Richard Genoud <richard.genoud@gmail.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [Linux-stm32] [PATCH v2 4/4] serial: Add kserial_rs485 to avoid
 wasted space due to .padding
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

On Tue, Aug 30, 2022 at 10:29:56AM +0300, Ilpo J=E4rvinen wrote:
> The struct serial_rs485 has a .padding field to make uapi updates
> easier. It wastes space, however. Create struct kserial_rs485 which is
> a kerner counterpart w/o padding.

"kernel"?

And what is the size difference now?

> +/**
> + * struct kserial_rs485 - kernel-side struct for controlling RS485 setti=
ngs.
> + * @flags:			RS485 feature flags
> + * @delay_rts_before_send:	Delay before send (milliseconds)
> + * @delay_rts_after_send:	Delay after send (milliseconds)
> + * @addr_recv:			Receive filter for RS485 addressing mode
> + *				(used only when %SER_RS485_ADDR_RECV is set).
> + * @addr_dest:			Destination address for RS485 addressing mode
> + *				(used only when %SER_RS485_ADDR_DEST is set).
> + *
> + * Must match with struct serial_rs485 in include/uapi/linux/serial.h ex=
cluding
> + * the padding.

Why must this match?  And how is that going to be enforced?

> + */
> +struct kserial_rs485 {
> +	__u32	flags;
> +	__u32	delay_rts_before_send;
> +	__u32	delay_rts_after_send;
> +	struct {
> +		__u8    addr_recv;
> +		__u8    addr_dest;
> +	};

As this is an in-kernel structure, this should be "u32" and "u8" now.

thanks,

greg k-h
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
