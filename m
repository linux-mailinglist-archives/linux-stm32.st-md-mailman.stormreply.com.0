Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 019F56D3D05
	for <lists+linux-stm32@lfdr.de>; Mon,  3 Apr 2023 07:52:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 96FEBC65E56;
	Mon,  3 Apr 2023 05:52:39 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C9763C03FCB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Apr 2023 05:52:38 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pjD7L-0001pP-ES; Mon, 03 Apr 2023 07:52:35 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pjD7E-008c3n-JV; Mon, 03 Apr 2023 07:52:28 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pjD7D-00A8u9-Ub; Mon, 03 Apr 2023 07:52:27 +0200
Date: Mon, 3 Apr 2023 07:52:21 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Simon Horman <simon.horman@corigine.com>
Message-ID: <20230403055221.xugl42vub7ugo3tz@pengutronix.de>
References: <20230402143025.2524443-1-u.kleine-koenig@pengutronix.de>
 <20230402143025.2524443-3-u.kleine-koenig@pengutronix.de>
 <ZCm1InKDMQERLsK3@corigine.com>
MIME-Version: 1.0
In-Reply-To: <ZCm1InKDMQERLsK3@corigine.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, kernel@pengutronix.de,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Paolo Abeni <pabeni@redhat.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 02/11] net: stmmac:
 dwmac-visconti: Make visconti_eth_clock_remove() return void
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
Content-Type: multipart/mixed; boundary="===============3273758905652846578=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============3273758905652846578==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="melvyq3rlaozpvm2"
Content-Disposition: inline


--melvyq3rlaozpvm2
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Simon,

On Sun, Apr 02, 2023 at 07:02:26PM +0200, Simon Horman wrote:
> On Sun, Apr 02, 2023 at 04:30:16PM +0200, Uwe Kleine-K=F6nig wrote:
> > The function returns zero unconditionally. Change it to return void
> > instead which simplifies one caller as error handing becomes
> > unnecessary.
> >=20
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
>=20
> ...
>=20
> > @@ -267,9 +265,7 @@ static int visconti_eth_dwmac_remove(struct platfor=
m_device *pdev)
> > =20
> >  	stmmac_pltfr_remove(pdev);
> > =20
> > -	err =3D visconti_eth_clock_remove(pdev);
> > -	if (err < 0)
> > -		dev_err(&pdev->dev, "failed to remove clock: %d\n", err);
> > +	visconti_eth_clock_remove(pdev);
> > =20
> >  	stmmac_remove_config_dt(pdev, priv->plat);
>=20
> err is now returned uninitialised by this function.

Good catch. Indeed err must be removed in this patch and return err
replaced by return 0. I'll send a v2 later this week, waiting a bit for
further feedback.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--melvyq3rlaozpvm2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmQqaZUACgkQj4D7WH0S
/k6Vggf/SvSUiYJNVJwbm16DWHGCYpXWtTC1Uback2St9/MjlFrbHyDdIhdSyHAE
pMaEIR4EwG6hnhOo3W3zHArrMWlX74bsBRHV/Fe8D7YTLmbn4Y0tdec4OnSd7JJE
bkzwDwnQlN+7TfK7coPW1ei2kuhpMWZB1KEvDsha6RLdlB+AACnmsIHEc6kfuGZ+
Oh2oXWy6VsxF/leIxrBV59vh0LrWVlQRVJioH/bdBywJY+NdRupBjiPYM38rcO45
xyle+7dB93ntVrVZt9x1XkSytkQBSh0aVzwlv3FOhsKXc8/if5F4b+8s0o780u2Y
vjkWOGjjvH9ed/uwCYH9h5tFA5hkwg==
=gDbX
-----END PGP SIGNATURE-----

--melvyq3rlaozpvm2--

--===============3273758905652846578==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============3273758905652846578==--
