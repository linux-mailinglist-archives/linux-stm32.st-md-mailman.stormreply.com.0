Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E655A5EA4
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Aug 2022 10:52:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 59D78C5EC6B;
	Tue, 30 Aug 2022 08:52:25 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6F7F7C5A4FD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Aug 2022 08:52:24 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 27F0B6155B;
 Tue, 30 Aug 2022 08:52:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE725C433D7;
 Tue, 30 Aug 2022 08:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1661849542;
 bh=GfTk307VAPbulMgNaAUsMDt2ahKUcbPofgSTa8PhAiQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DyAjFc9HC2ltJIBwtejCLHGP0+sh4+HuJH4YfCl6P8VLxiBLSdh4bYf4KeN7al3lV
 5PLJQlBjMnWL25yCyRqMVhzRZ3gM02EAmzOaeMviC4al0M8ZWWAUGB8MNMawubTwtT
 eF2q9bnUCiff/VsE6cHX2ADN9bnv18PGyeNm8ssg=
Date: Tue, 30 Aug 2022 10:52:19 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Message-ID: <Yw3Pw9kwDDKXuqC+@kroah.com>
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
> -static int serial_rs485_from_user(struct serial_rs485 *rs485,
> +static int serial_rs485_from_user(struct kserial_rs485 *rs485,
>  				  const struct serial_rs485 __user *rs485_user)
>  {
> -	if (copy_from_user(rs485, rs485_user, sizeof(*rs485)))
> +	struct serial_rs485 rs485_uapi;
> +
> +	if (copy_from_user(&rs485_uapi, rs485_user, sizeof(*rs485)))
>  		return -EFAULT;
>  =

> +	*rs485 =3D *((struct kserial_rs485 *)&rs485_uapi);

Ah, you are mapping this on top of the existing structure, so there was
no padding in the original one, why say that?

> +/*
> + * Compile-time asserts for struct kserial_rs485 and struct serial_rs485=
 equality
> + * (except padding).

This does not take into account any padding, in fact it's the opposite
as all of this:

> + */
> +static_assert(offsetof(struct kserial_rs485, flags) =3D=3D
> +	      offsetof(struct serial_rs485, flags));
> +static_assert(offsetof(struct kserial_rs485, delay_rts_before_send) =3D=
=3D
> +	      offsetof(struct serial_rs485, delay_rts_before_send));
> +static_assert(offsetof(struct kserial_rs485, delay_rts_after_send) =3D=
=3D
> +	      offsetof(struct serial_rs485, delay_rts_after_send));
> +static_assert(offsetof(struct kserial_rs485, addr_recv) =3D=3D
> +	      offsetof(struct serial_rs485, addr_recv));
> +static_assert(offsetof(struct kserial_rs485, addr_dest) =3D=3D
> +	      offsetof(struct serial_rs485, addr_dest));
> +static_assert(sizeof(struct kserial_rs485) <=3D sizeof(struct serial_rs4=
85));

Is there to ensure that the offsets are exactly the same, no padding
involved anywhere.

So I don't understand the problem you are trying to solve here,

greg k-h
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
