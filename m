Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B52BF6B72E9
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Mar 2023 10:43:51 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 648AAC6904C;
	Mon, 13 Mar 2023 09:43:51 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 50552C65E5A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Mar 2023 09:43:50 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pbeiZ-0001bb-NA; Mon, 13 Mar 2023 10:43:47 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pbeiX-003okP-IY; Mon, 13 Mar 2023 10:43:45 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pbeiW-004UsW-RW; Mon, 13 Mar 2023 10:43:44 +0100
Date: Mon, 13 Mar 2023 10:43:44 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Message-ID: <20230313094344.emv6pazrvberusil@pengutronix.de>
References: <20230313075430.2730803-1-u.kleine-koenig@pengutronix.de>
 <20230313075430.2730803-3-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <20230313075430.2730803-3-u.kleine-koenig@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH 2/5] clocksource: timer-stm32-lp: Mark
 driver as non-removable
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
Content-Type: multipart/mixed; boundary="===============7138554661864659507=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============7138554661864659507==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rm7zyqg5zd7u5psn"
Content-Disposition: inline


--rm7zyqg5zd7u5psn
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Mon, Mar 13, 2023 at 08:54:27AM +0100, Uwe Kleine-K=F6nig wrote:
> The comment in the remove callback suggests that the driver is not
> supposed to be unbound. However returning an error code in the remove
> callback doesn't accomplish that. Instead set the suppress_bind_attrs
> property (which makes it impossible to unbind the driver via sysfs).
> The only remaining way to unbind an stm32-lp device would be module
> unloading, but that doesn't apply here, as the driver cannot be built as
> a module.
>=20
> Also drop the useless remove callback.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/clocksource/timer-stm32-lp.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
>=20
> diff --git a/drivers/clocksource/timer-stm32-lp.c b/drivers/clocksource/t=
imer-stm32-lp.c
> index db2841d0beb8..616ea4fe4234 100644
> --- a/drivers/clocksource/timer-stm32-lp.c
> +++ b/drivers/clocksource/timer-stm32-lp.c
> @@ -195,11 +195,6 @@ static int stm32_clkevent_lp_probe(struct platform_d=
evice *pdev)
>  	return ret;
>  }
> =20
> -static int stm32_clkevent_lp_remove(struct platform_device *pdev)
> -{
> -	return -EBUSY; /* cannot unregister clockevent */
> -}
> -
>  static const struct of_device_id stm32_clkevent_lp_of_match[] =3D {
>  	{ .compatible =3D "st,stm32-lptimer-timer", },
>  	{},
> @@ -207,11 +202,11 @@ static const struct of_device_id stm32_clkevent_lp_=
of_match[] =3D {
>  MODULE_DEVICE_TABLE(of, stm32_clkevent_lp_of_match);
> =20
>  static struct platform_driver stm32_clkevent_lp_driver =3D {
> -	.probe	=3D stm32_clkevent_lp_probe,
>  	.remove =3D stm32_clkevent_lp_remove,

This is of course broken, I intended to drop the remove line ... and
only noticed that breakage after sending out the patch set :-\

So please either skip this patch, or fixup while applying. If you do the
former I'll come back to this driver and send a fixed patch.

Best regards and sorry
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--rm7zyqg5zd7u5psn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmQO8E0ACgkQwfwUeK3K
7Ama0Af9EAieyD1ilr+oUAsZ/Eghf0bXKulJmBLB9iw5CfGxUqr9e6wgKKREjimg
HNzY5n//YrM0/VjyRSmSVmO5ZTs0MfuHPt7aj6S5bP/EPX8C7WmfJ6e7+KdJqJvN
Gqfy9pn5/yFprpiM7Uv1o7vxFIDTqLfWIf3s0tLwxEY7IE5TZcFewmF5Y70UhyyZ
sPC4zKtimQf2q4e6JiB8OwX8LICHALRsVAwrb4WN+CkM84TcMPihc0rB4XvJEgpJ
ZKIRG0Riq7fB1TYc5RA+K1dwdSPbEXy7oFHJ9YaHg7fnU6g8OII42DoVxUI3Oyht
HGZ8yjATI4rGmdPfj79+s3n7B6g0fQ==
=51x9
-----END PGP SIGNATURE-----

--rm7zyqg5zd7u5psn--

--===============7138554661864659507==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============7138554661864659507==--
