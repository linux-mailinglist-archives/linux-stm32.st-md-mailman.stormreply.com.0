Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D4D7BBAA3
	for <lists+linux-stm32@lfdr.de>; Fri,  6 Oct 2023 16:45:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1CEA3C6C837;
	Fri,  6 Oct 2023 14:45:27 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D24D6C65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Oct 2023 14:45:26 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qom4Y-0002UN-Rq; Fri, 06 Oct 2023 16:44:58 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qom4W-00BXaY-Dx; Fri, 06 Oct 2023 16:44:56 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qom4W-00AJrq-4D; Fri, 06 Oct 2023 16:44:56 +0200
Date: Fri, 6 Oct 2023 16:44:56 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Thierry Reding <thierry.reding@gmail.com>
Message-ID: <20231006144456.zybxv2pn4c37fpr3@pengutronix.de>
References: <cover.1696156485.git.sean@mess.org>
 <1bd5241d584ceb4d6b731c4dc3203fb9686ee1d1.1696156485.git.sean@mess.org>
 <20231004095920.ne7yrrthow6tnuvg@pengutronix.de>
 <ZR_hJ05h5O6SpM_D@orome.fritz.box>
MIME-Version: 1.0
In-Reply-To: <ZR_hJ05h5O6SpM_D@orome.fritz.box>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-pwm@vger.kernel.org, Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
 linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sean Young <sean@mess.org>, Daire McNamara <daire.mcnamara@microchip.com>,
 Fabio Estevam <festevam@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Vladimir Zapolskiy <vz@mleia.com>, Conor Dooley <conor.dooley@microchip.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, NXP Linux Team <linux-imx@nxp.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org,
 Shawn Guo <shawnguo@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
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
Content-Type: multipart/mixed; boundary="===============2146770182259509450=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============2146770182259509450==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="57x2r3oojyooxlif"
Content-Disposition: inline


--57x2r3oojyooxlif
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Thierry,

On Fri, Oct 06, 2023 at 12:27:51PM +0200, Thierry Reding wrote:
> On Wed, Oct 04, 2023 at 11:59:20AM +0200, Uwe Kleine-K=F6nig wrote:
> > On Sun, Oct 01, 2023 at 11:40:29AM +0100, Sean Young wrote:
> > > diff --git a/drivers/pwm/pwm-fsl-ftm.c b/drivers/pwm/pwm-fsl-ftm.c
> > > index b7c6045c5d08..b8b9392844e9 100644
> > > --- a/drivers/pwm/pwm-fsl-ftm.c
> > > +++ b/drivers/pwm/pwm-fsl-ftm.c
> > > @@ -405,6 +405,7 @@ static int fsl_pwm_probe(struct platform_device *=
pdev)
> > > =20
> > >  	fpc->soc =3D of_device_get_match_data(&pdev->dev);
> > >  	fpc->chip.dev =3D &pdev->dev;
> > > +	fpc->chip.can_sleep =3D true;
> >=20
> > As .apply() being callable in non-sleepable context only depends on
> > .apply() I think a better place for this property is in struct pwm_ops.
>=20
> What about drivers for devices that can be either sleeping or not? There
> are things like regmap which can abstract those differences away, so you
> could have a driver that works on both types of devices, so setting this
> in ops wouldn't be correct all the time. I think can_sleep needs to be
> per-chip rather than per-driver.

I would consider that a theoretic possibility. If there is a hardware
that has a (say) i2c and a memory-mapped register variant, I never
encountered such a thing. Hmm, the dwc driver seems to have a pci and a
memory-mapped variant, both would be "fast" though. (Wouldn't they?)

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--57x2r3oojyooxlif
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmUgHWcACgkQj4D7WH0S
/k7AkAgAuDF4yIt2iIMt7tFGHsc89qpaKIjDUSKxqgB4lz5w3E1CYWmOWOSFjuiU
bZpxAL0kQ59hMs24OJONQb7ZJrN2l1LuYC0rUBEgPh46tZXF9fQhEI8OtmsICxsn
tpEKsJB0Y3gRod2QvYDSu4vcVRFfXqZflcpDXeIA7bsTVV1KN/v6dqFX3zOKRKvu
7Y356VPxQOp6clwewkrvh5Jou1KF4IhKb4LOdPIRnTQlrOF8hx7efoOQmiwYUI9A
WrloVww0jolKUVUs/RnT+bOzfieEFHtSok2o9vMheSxETVtJcw/mfAucMQURNxF+
ykxzRqKEfm+5k6pp5by9MOO8KkmX/A==
=MC1V
-----END PGP SIGNATURE-----

--57x2r3oojyooxlif--

--===============2146770182259509450==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============2146770182259509450==--
