Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B0C05423C3
	for <lists+linux-stm32@lfdr.de>; Wed,  8 Jun 2022 08:51:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3B7C3C03FFF;
	Wed,  8 Jun 2022 06:51:44 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AAAAFC035BC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Jun 2022 06:51:43 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1nypXY-0000mV-3Y; Wed, 08 Jun 2022 08:51:40 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nypXU-0078Sz-To; Wed, 08 Jun 2022 08:51:35 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nypXS-00EvGb-Qb; Wed, 08 Jun 2022 08:51:34 +0200
Date: Wed, 8 Jun 2022 08:51:31 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Jilin Yuan <yuanjilin@cdjrlc.com>
Message-ID: <20220608065131.svkxcwfgzdd7cs57@pengutronix.de>
References: <20220608010318.18040-1-yuanjilin@cdjrlc.com>
MIME-Version: 1.0
In-Reply-To: <20220608010318.18040-1-yuanjilin@cdjrlc.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org,
 thierry.reding@gmail.com, mcoquelin.stm32@gmail.com, lee.jones@linaro.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] pwm: stmpe: Deleted extra {}
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
Content-Type: multipart/mixed; boundary="===============2601987841860383756=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============2601987841860383756==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7azeu5p4ver3v3re"
Content-Disposition: inline


--7azeu5p4ver3v3re
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 08, 2022 at 09:03:18AM +0800, Jilin Yuan wrote:
> Remove unnecessary braces
>=20
> Signed-off-by: Jilin Yuan <yuanjilin@cdjrlc.com>
> ---
>  drivers/pwm/pwm-stmpe.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/drivers/pwm/pwm-stmpe.c b/drivers/pwm/pwm-stmpe.c
> index 2df526fe9c38..c45fe27859de 100644
> --- a/drivers/pwm/pwm-stmpe.c
> +++ b/drivers/pwm/pwm-stmpe.c
> @@ -78,10 +78,9 @@ static void stmpe_24xx_pwm_disable(struct pwm_chip *ch=
ip,
>  	value =3D ret & ~BIT(pwm->hwpwm);
> =20
>  	ret =3D stmpe_reg_write(stmpe_pwm->stmpe, STMPE24XX_PWMCS, value);
> -	if (ret) {
> +	if (ret)
>  		dev_err(chip->dev, "error writing PWM#%u control\n",
>  			pwm->hwpwm);
> -	}
>  }

This doesn't apply to neither next nor on the pwm tree nor on Linus
Torvald's tree. Please always mention preconditions of your patches,
preferably using git format-patch's --base option.

In this case it builds on top of a patch that was sent to only some
maintainers, but no public list. Please squash these patches together
and send them to (at least) linux-pwm@vger.kernel.org.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--7azeu5p4ver3v3re
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmKgRvAACgkQwfwUeK3K
7Aly8gf+IsXwM8wK6WR96UUHInicXEyDlpcmhCEbr3j0EI3D8JLbzSBwABVFvzVy
gVCD/rvGtjr5R7jRS3TCshBUoqdSxcf50Rt+aUPvxlUAzs/eqhIVqE0B9kEwI0U/
vAqW/55RtMNlL/eZV40sm/2OJ8SoSxZMZrI9xyh9BAdvUgGLMnKiWIkRy8ofA7pw
aUyoMHGL1zGE8s4STMPIQ+s59D4HCSwTksnYJYxHeu+UCAvVYXWIp2XVek52Dh/a
DyR8PbYvwXIfk26gENsvwXfKg2AQixfVSZukfj3whieoEsEbsfUWHkPdYQAxPnDY
X31yMqD443j/uEeaCDsmicULvIXdGg==
=en01
-----END PGP SIGNATURE-----

--7azeu5p4ver3v3re--

--===============2601987841860383756==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============2601987841860383756==--
