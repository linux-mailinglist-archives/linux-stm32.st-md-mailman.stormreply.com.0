Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E02227B7CBE
	for <lists+linux-stm32@lfdr.de>; Wed,  4 Oct 2023 11:59:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A3950C6C833;
	Wed,  4 Oct 2023 09:59:40 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 03D37C6C832
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Oct 2023 09:59:38 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qnyf5-0002vN-0q; Wed, 04 Oct 2023 11:59:23 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qnyf3-00Azxr-7z; Wed, 04 Oct 2023 11:59:21 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qnyf2-008uPw-UB; Wed, 04 Oct 2023 11:59:20 +0200
Date: Wed, 4 Oct 2023 11:59:20 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Sean Young <sean@mess.org>
Message-ID: <20231004095920.ne7yrrthow6tnuvg@pengutronix.de>
References: <cover.1696156485.git.sean@mess.org>
 <1bd5241d584ceb4d6b731c4dc3203fb9686ee1d1.1696156485.git.sean@mess.org>
MIME-Version: 1.0
In-Reply-To: <1bd5241d584ceb4d6b731c4dc3203fb9686ee1d1.1696156485.git.sean@mess.org>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org,
 Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Daire McNamara <daire.mcnamara@microchip.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Vladimir Zapolskiy <vz@mleia.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Thierry Reding <thierry.reding@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 1/2] pwm: make it possible to apply pwm
 changes in atomic context
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
Content-Type: multipart/mixed; boundary="===============3471987847152701924=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============3471987847152701924==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hz3c3li5tw4muaqt"
Content-Disposition: inline


--hz3c3li5tw4muaqt
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Sean,

On Sun, Oct 01, 2023 at 11:40:29AM +0100, Sean Young wrote:
> diff --git a/drivers/pwm/core.c b/drivers/pwm/core.c
> index dc66e3405bf5..d9679ae5b2be 100644
> --- a/drivers/pwm/core.c
> +++ b/drivers/pwm/core.c
> @@ -505,7 +505,7 @@ int pwm_apply_state(struct pwm_device *pwm, const str=
uct pwm_state *state)
>  	 * is a bad idea. So make it explicit that calling this function might
>  	 * sleep.
>  	 */
> -	might_sleep();
> +	might_sleep_if(pwm_can_sleep(pwm));
> =20
>  	if (!pwm || !state || !state->period ||
>  	    state->duty_cycle > state->period)

I'd like to have a mechanism to catch drivers that missed to set
=2Ecan_sleep. The best idea I currently have for that is to disable
preemption if IS_ENABLED(CONFIG_PWM_DEBUG) && !pwm_can_sleep(pwm) while
=2Eapply() is running.

> diff --git a/drivers/pwm/pwm-fsl-ftm.c b/drivers/pwm/pwm-fsl-ftm.c
> index b7c6045c5d08..b8b9392844e9 100644
> --- a/drivers/pwm/pwm-fsl-ftm.c
> +++ b/drivers/pwm/pwm-fsl-ftm.c
> @@ -405,6 +405,7 @@ static int fsl_pwm_probe(struct platform_device *pdev)
> =20
>  	fpc->soc =3D of_device_get_match_data(&pdev->dev);
>  	fpc->chip.dev =3D &pdev->dev;
> +	fpc->chip.can_sleep =3D true;

As .apply() being callable in non-sleepable context only depends on
=2Eapply() I think a better place for this property is in struct pwm_ops.

Also I wonder if the distinction between atomic and sleeping
pwm_state_apply() should be more explicit. For GPIOs you have a sleeping
variant gpiod_set_value_cansleep() that allows to immediately determine
the intended context in the caller. This would allow that programming
a PWM stays a preemption point (if possible/desired) even if the
underlying hardware/driver is atomic. To not have to touch all consumer
drivers, maybe the pair for pwm should better be

	pwm_apply_state()
	pwm_apply_state_atomic()

instead of a "cansleep" suffix for the sleeping variant? Or maybe it's
better to accept touching all consumer drivers to get semantics similar
to gpio? I couldn't decide quickly what I really like better here, so
that's your chance to comment and influence the outcome :-)

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--hz3c3li5tw4muaqt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmUdN3gACgkQj4D7WH0S
/k7Vgwf+OSTM/5a3jTbEn+zj18WbWk6jQQdj6kqyM47GR36RweXbkLMfbl++5ogJ
z6xjVfn/ov9rQsnn2Em53Zkv7yV/AQb+Hu1tLnuVAsdyxVC/CrCRjWAcrkpoZf6o
Ru7Nf7hs/mJ57jeLgBfPp+k2kwntn470QPIpzLiruZge1YeEwuYKzeHuO7WI4KCb
777XYS5j+tntQRSrlm2dzE8H+5lEqc7mEzG22MAd+yIt4dAsuSAdno2hKLMJx960
4k6Y+UmLJB3cC+BPcAjEllupp1c4turpZ+3P/7D0Fo8P5BgH937nm/wktXJJlPBs
aJ8B/mMpia+WhQcYdq+TjejxlzAf3Q==
=THVI
-----END PGP SIGNATURE-----

--hz3c3li5tw4muaqt--

--===============3471987847152701924==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============3471987847152701924==--
