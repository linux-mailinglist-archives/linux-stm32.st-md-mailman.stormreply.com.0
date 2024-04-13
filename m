Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD418A3B9F
	for <lists+linux-stm32@lfdr.de>; Sat, 13 Apr 2024 10:26:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 32141C6DD67;
	Sat, 13 Apr 2024 08:26:59 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A28DBC6C859
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 13 Apr 2024 08:26:57 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1rvYiq-0000uh-Ou; Sat, 13 Apr 2024 10:26:52 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1rvYip-00C1vX-A3; Sat, 13 Apr 2024 10:26:51 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
 (envelope-from <ukl@pengutronix.de>) id 1rvYip-000fem-0j;
 Sat, 13 Apr 2024 10:26:51 +0200
Date: Sat, 13 Apr 2024 10:26:51 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <ie5i4re2clgqqvjhwiur62mi6qwzvzxmtlonjuje2uhxhk76ce@ygptew53hs66>
References: <20240315145443.982807-2-u.kleine-koenig@pengutronix.de>
 <861cb184-42ee-4f27-9b0c-3129d52cc706@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <861cb184-42ee-4f27-9b0c-3129d52cc706@foss.st.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] pwm: stm32: Add error messages in
	.probe()'s error paths
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
Content-Type: multipart/mixed; boundary="===============7625993247811200205=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============7625993247811200205==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wlkga23boekqkkvw"
Content-Disposition: inline


--wlkga23boekqkkvw
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 15, 2024 at 05:39:34PM +0100, Fabrice Gasnier wrote:
> On 3/15/24 15:54, Uwe Kleine-K=F6nig wrote:
> > Giving an indication about the problem if probing a device fails is a
> > nice move. Do that for the stm32 pwm driver.
> >=20
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
>=20
> Hi Uwe,
>=20
> Thanks for your patch, you can add my:
> Reviewed-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

Thanks, I applied it to
https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/for-=
next
with your review tag.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--wlkga23boekqkkvw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmYaQcoACgkQj4D7WH0S
/k6iTwf/RgV6QkMSL+jZfc6zc21tIOoDNv8ph8teLWvLRqT2YmxNkMWWYp9H/mUM
g3sOeLL4jojQgE2HgByWiGcRc+PLT7DgG8DAWlk2OQwVmGOhGLWbP0QoFQjuovUZ
sJkkIpc+LSsFAfO2BkU9nk4vVPvz9NdNGmCIel1+nd7GhZsLNgZT8j8VCkLK5ykx
JYbiMrXF++KBJjxg5myzW1X6sGm5cdkhZUsqFuF2Hy/OntafNlnNrVirywQNSG7y
7tF/g02CGB/EoO1DRPxstnhT8V9x1zykH/kXpZbz17w64o9C9oWCn+JZMcrJZHyJ
E0oU4gqPSgMS91ICeg9nBJaz0o/tGg==
=L8fg
-----END PGP SIGNATURE-----

--wlkga23boekqkkvw--

--===============7625993247811200205==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============7625993247811200205==--
