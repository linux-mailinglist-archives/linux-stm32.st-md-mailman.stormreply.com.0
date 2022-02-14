Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7244B4277
	for <lists+linux-stm32@lfdr.de>; Mon, 14 Feb 2022 08:07:12 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1FBD4C5F1F2;
	Mon, 14 Feb 2022 07:07:12 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CAC36C5A4FE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Feb 2022 07:07:10 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1nJVRQ-0005fD-S8; Mon, 14 Feb 2022 08:06:32 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nJVRK-00GUcs-Oc; Mon, 14 Feb 2022 08:06:26 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nJVRJ-002o8C-8b; Mon, 14 Feb 2022 08:06:25 +0100
Date: Mon, 14 Feb 2022 08:06:22 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Lino Sanfilippo <LinoSanfilippo@gmx.de>
Message-ID: <20220214070622.rz5cv6yy3aarvrjv@pengutronix.de>
References: <20220213222737.15709-1-LinoSanfilippo@gmx.de>
 <20220213222737.15709-2-LinoSanfilippo@gmx.de>
MIME-Version: 1.0
In-Reply-To: <20220213222737.15709-2-LinoSanfilippo@gmx.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: alexandre.belloni@bootlin.com, festevam@gmail.com,
 linux-kernel@vger.kernel.org, kernel@pengutronix.de, richard.genoud@gmail.com,
 gregkh@linuxfoundation.org, s.hauer@pengutronix.de, linux@armlinux.org.uk,
 nicolas.ferre@microchip.com, alexandre.torgue@foss.st.com,
 ludovic.desroches@microchip.com, lukas@wunner.de, linux-imx@nxp.com,
 mcoquelin.stm32@gmail.com, linux-serial@vger.kernel.org, shawnguo@kernel.org,
 jirislaby@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/9] serial: core: move RS485
 configuration tasks from drivers into core
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
Content-Type: multipart/mixed; boundary="===============4087030526080538373=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============4087030526080538373==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5shxigssusof4hd3"
Content-Disposition: inline


--5shxigssusof4hd3
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 13, 2022 at 11:27:29PM +0100, Lino Sanfilippo wrote:
> Several drivers that support setting the RS485 configuration via userspace
> implement on or more of the following tasks:

s/on/one/

>=20
> - in case of an invalid RTS configuration (both RTS after send and RTS on
>   send set or both unset) fall back to enable RTS on send and disable RTS
>   after send
>=20
> - nullify the padding field of the returned serial_rs485 struct
>=20
> - copy the configuration into the uart port struct
>=20
> - limit RTS delays to 100 ms
>=20
> Move these tasks into the serial core to make them generic and to provide
> a consistent beheviour among all drivers.

s/beheviour/behaviour/

> Signed-off-by: Lino Sanfilippo <LinoSanfilippo@gmx.de>
> ---
>  drivers/tty/serial/serial_core.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>=20
> diff --git a/drivers/tty/serial/serial_core.c b/drivers/tty/serial/serial=
_core.c
> index 846192a7b4bf..3fab4070359c 100644
> --- a/drivers/tty/serial/serial_core.c
> +++ b/drivers/tty/serial/serial_core.c
> @@ -1282,8 +1282,21 @@ static int uart_set_rs485_config(struct uart_port =
*port,
>  	if (copy_from_user(&rs485, rs485_user, sizeof(*rs485_user)))
>  		return -EFAULT;
> =20
> +	/* pick sane settings if the user hasn't */
> +	if (!(rs485.flags & SER_RS485_RTS_ON_SEND) =3D=3D
> +	    !(rs485.flags & SER_RS485_RTS_AFTER_SEND)) {
> +		rs485.flags |=3D SER_RS485_RTS_ON_SEND;
> +		rs485.flags &=3D ~SER_RS485_RTS_AFTER_SEND;
> +	}
> +	/* clamp the delays to [0, 100ms] */
> +	rs485.delay_rts_before_send =3D min(rs485.delay_rts_before_send, 100U);
> +	rs485.delay_rts_after_send =3D min(rs485.delay_rts_after_send, 100U);
> +	memset(rs485.padding, 0, sizeof(rs485.padding));
> +
>  	spin_lock_irqsave(&port->lock, flags);
>  	ret =3D port->rs485_config(port, &rs485);
> +	if (!ret)
> +		port->rs485 =3D rs485;

I was only Cc:d for the imx patch (patch #7) and tried to verify the
claim there that "the serial core already assigns the passed
configuration to the uart port". That failed when I looked at my kernel
tree.

So it would be great, if you sent dependencies (or at least a cover
letter) to all recipients of a given patch to ease review. Also I want
to suggest to mention uart_set_rs485_config() in the commit log of the
imx patch (and probably the others) to simplify verifying the claim
there.

Thanks
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--5shxigssusof4hd3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmIJ/2sACgkQwfwUeK3K
7AkxRwf/b3f/DboNsFG5mzr/yWa7KUZT9A+zxiz+7iI+Gl/R3UndBgCYH0G4WnLL
7MwSMvP+oKUYgZqWLQ+EO/B4cr+mIwjxaqmcKzRuz26E9FsPaDfvuyLW/vqvEBBQ
ivXeHn3Uwr7DFKixX67XUwThUqxuxe40AV24L7Hm7F/Z8RkwwtAL/hlH8a4qLet/
xL4BpeVAAFzCrorg+mwjwQx3LQrHyvft1z/4HuWiI6UBQ23O3ZIYC7uL3EURLbmT
eLKoFaLA/zjjdDWfFEPseb+D9ve5ek+PA/PPOUBr1zPFHo4GJSOFT+In/LJ5KKxG
cI48t2esb6pZZCOf/2kwqdevzevzdA==
=Yr+Q
-----END PGP SIGNATURE-----

--5shxigssusof4hd3--

--===============4087030526080538373==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============4087030526080538373==--
