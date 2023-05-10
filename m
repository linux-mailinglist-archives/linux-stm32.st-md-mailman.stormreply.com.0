Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 195936FD701
	for <lists+linux-stm32@lfdr.de>; Wed, 10 May 2023 08:30:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B63BFC6904F;
	Wed, 10 May 2023 06:30:09 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C9794C65E70
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 May 2023 06:30:08 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pwdKu-0007AP-Us; Wed, 10 May 2023 08:30:04 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pwdKq-002PS9-K9; Wed, 10 May 2023 08:30:00 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pwdKp-002ztf-QJ; Wed, 10 May 2023 08:29:59 +0200
Date: Wed, 10 May 2023 08:29:59 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Bhupesh Sharma <bhupesh.sharma@linaro.org>
Message-ID: <20230510062959.ll5cr5s3uhjrdufj@pengutronix.de>
References: <20230508142637.1449363-1-u.kleine-koenig@pengutronix.de>
 <20230508142637.1449363-7-u.kleine-koenig@pengutronix.de>
 <CAH=2Ntyc-Oi-FCNQJbLwgyWT8Tt7tVpHO7HOc=hM2RdNweOzjg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAH=2Ntyc-Oi-FCNQJbLwgyWT8Tt7tVpHO7HOc=hM2RdNweOzjg@mail.gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Vinod Koul <vkoul@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 kernel@pengutronix.de, Simon Horman <simon.horman@corigine.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v2 06/11] net: stmmac:
 dwmac-qcom-ethqos: Convert to platform remove callback returning void
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
Content-Type: multipart/mixed; boundary="===============5648964859545327030=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============5648964859545327030==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ujbmobocnpqqxvme"
Content-Disposition: inline


--ujbmobocnpqqxvme
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Bhupesh,

On Tue, May 09, 2023 at 01:21:56PM +0530, Bhupesh Sharma wrote:
> On Mon, 8 May 2023 at 19:56, Uwe Kleine-K=F6nig
> <u.kleine-koenig@pengutronix.de> wrote:
> >
> > The .remove() callback for a platform driver returns an int which makes
> > many driver authors wrongly assume it's possible to do error handling by
> > returning an error code. However the value returned is (mostly) ignored
>=20
> ^^^ mostly, here seems confusing. Only if the return value is ignored
> marking the function
> as 'void' makes sense IMO.

FTR: It's only mostly ignored because a message is emitted:

	dev_warn(_dev, "remove callback returned a non-zero value. This will be ig=
nored.\n");

(see platform_remove() in drivers/base/platform.c).

> Also a small note (maybe a TBD) indicating that 'remove_new' will be
> eventually replaced with 'remove' would make reading this easier.

I adapted the commit message for future similar submissions. Thanks for
the feedback.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--ujbmobocnpqqxvme
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmRbOeYACgkQj4D7WH0S
/k5/GwgApW0aJFnjWf98AQ2GZft5CQeuQgfG9/DAnorz18X3IVbz5SUAyHBulSuP
CUx7GTREdCDoTXzgHUYz7vSqYzL2Ms0wfNBU+e7yTPmwlXOg+LTKURGb1hQghH7z
4GykefqgvVoF71QJvh2mCzmJZShPRGbQhV5x/K3N1vabiMKtOGT16uL+urxHAjOi
JcoO4QmLbgqscnWSy9ArmedFM7qtF0zNfhgA4EShG9UwgFSBxyqdfmKmYVJkQza+
fKjeD1pjYRSZVRfX6bC4LhlC7aMF3sjjOBhOP4QjoHf7BVH7Z6uJdXKqIEYX7ha7
bGJDn1V7wRLu3JchRl0ZgZOki4QouQ==
=PMrW
-----END PGP SIGNATURE-----

--ujbmobocnpqqxvme--

--===============5648964859545327030==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============5648964859545327030==--
