Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A20904B52BE
	for <lists+linux-stm32@lfdr.de>; Mon, 14 Feb 2022 15:06:48 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 548FAC5F1F9;
	Mon, 14 Feb 2022 14:06:48 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 022DEC5A4FE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Feb 2022 14:06:46 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1nJc04-0008CA-9v; Mon, 14 Feb 2022 15:06:44 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nJc01-00GZ3m-7U; Mon, 14 Feb 2022 15:06:40 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nJbzz-0038PK-5F; Mon, 14 Feb 2022 15:06:39 +0100
Date: Mon, 14 Feb 2022 15:06:39 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Lee Jones <lee.jones@linaro.org>
Message-ID: <20220214140639.jmdldyne6ffq4dlq@pengutronix.de>
References: <20220207081709.27288-1-u.kleine-koenig@pengutronix.de>
 <YgpdPTDurgsvR9mk@google.com>
MIME-Version: 1.0
In-Reply-To: <YgpdPTDurgsvR9mk@google.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-kernel@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, kernel@pengutronix.de,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] mfd: stmfx: Improve error message
 triggered by regulator fault in .remove()
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
Content-Type: multipart/mixed; boundary="===============4621261114823845974=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============4621261114823845974==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="s563op37ko4b4dy6"
Content-Disposition: inline


--s563op37ko4b4dy6
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 14, 2022 at 01:46:37PM +0000, Lee Jones wrote:
> On Mon, 07 Feb 2022, Uwe Kleine-K=F6nig wrote:
>=20
> > Returning a non-zero value in an i2c remove callback results in the i2c
> > core emitting a very generic error message ("remove failed (-ESOMETHING=
),
> > will be ignored") and as the message indicates not further error handli=
ng
> > is done.
> >=20
> > Instead emit a more specific error message and then return zero in
> > .remove().
> >=20
> > The long-term goal is to make the i2c remove prototype return void, mak=
ing
> > all implementations return 0 is preparatory work for this change.
> >=20
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> > ---
> >  drivers/mfd/stmfx.c | 16 +++++++++++-----
> >  1 file changed, 11 insertions(+), 5 deletions(-)
> >=20
> > diff --git a/drivers/mfd/stmfx.c b/drivers/mfd/stmfx.c
> > index e095a3930142..16631c675f2f 100644
> > --- a/drivers/mfd/stmfx.c
> > +++ b/drivers/mfd/stmfx.c
> > @@ -392,17 +392,21 @@ static int stmfx_chip_init(struct i2c_client *cli=
ent)
> >  	return ret;
> >  }
> > =20
> > -static int stmfx_chip_exit(struct i2c_client *client)
> > +static void stmfx_chip_exit(struct i2c_client *client)
> >  {
> >  	struct stmfx *stmfx =3D i2c_get_clientdata(client);
> > =20
> >  	regmap_write(stmfx->map, STMFX_REG_IRQ_SRC_EN, 0);
> >  	regmap_write(stmfx->map, STMFX_REG_SYS_CTRL, 0);
> > =20
> > -	if (stmfx->vdd)
> > -		return regulator_disable(stmfx->vdd);
> > +	if (stmfx->vdd) {
> > +		int ret =3D regulator_disable(stmfx->vdd);
> > =20
> > -	return 0;
> > +		if (ret)
>=20
> Nit: Premise of the patch is fine, but please can you use the standard
> function call, check the return value format please.  Something about
> this is triggering my OCD! :)
>=20
>      	int ret;
>=20
> 	ret =3D regulator_disable(stmfx->vdd);
> 	if (ret)
> 		do_thing();

Not sure I understand you correctly. Do you want just:

 	regmap_write(stmfx->map, STMFX_REG_SYS_CTRL, 0);
=20
 	if (stmfx->vdd) {
-		int ret =3D regulator_disable(stmfx->vdd);
+		int ret;
+
+		ret =3D regulator_disable(stmfx->vdd);
 		if (ret)
 ...

squashed into the patch?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--s563op37ko4b4dy6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmIKYesACgkQwfwUeK3K
7Am/agf+Ox1j1cOxSuGwS+XoEjW3j9S/sI2S+1HQq/TZ5DMu7yrdIcQm+m157Xeh
SXiqNFcmVbXHvSU+r8gQtq1nInt6JFwjpFLdt+K/aUPPOZUsxug+3CgL+zTTnhm+
qBVhvWTGQoZ3tkxz4Ja4oSACEiYOHiM2NhQe3GVAFXNas6jwvZGDf6wBcwLhvQhK
am4yU8fWiiV/Wa5m1OGRB+ELOBaooi4hagB0WZVviHo1LFhQXu+o/q8gV1X7xdAN
f/4+8al/jfZJp5dkJGbj0fWPncQ7T0dZYtYvdSDAc6sapNWYlF9l0saS+r8iZbfb
AGWtHFSKo8ukP4MdGWnoZaIaDWlrEA==
=RA9W
-----END PGP SIGNATURE-----

--s563op37ko4b4dy6--

--===============4621261114823845974==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============4621261114823845974==--
