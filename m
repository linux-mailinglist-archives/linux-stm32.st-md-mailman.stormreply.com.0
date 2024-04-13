Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B30268A3BA1
	for <lists+linux-stm32@lfdr.de>; Sat, 13 Apr 2024 10:29:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6E396C6DD67;
	Sat, 13 Apr 2024 08:29:47 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 60B48C6C859
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 13 Apr 2024 08:29:46 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1rvYlb-0001SG-Cs; Sat, 13 Apr 2024 10:29:43 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1rvYla-00C1vo-D8; Sat, 13 Apr 2024 10:29:42 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
 (envelope-from <ukl@pengutronix.de>) id 1rvYla-000fir-11;
 Sat, 13 Apr 2024 10:29:42 +0200
Date: Sat, 13 Apr 2024 10:29:41 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Message-ID: <zhxpjbwubpai4wxjtu43gvjwoc5s7zmxkn4aakdp7rmskpbear@cm3yv7t5r425>
References: <cover.1710711976.git.u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <cover.1710711976.git.u.kleine-koenig@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, kernel@pengutronix.de
Subject: Re: [Linux-stm32] [PATCH 0/3] pwm: stm32: Some improvements
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
Content-Type: multipart/mixed; boundary="===============0925934841473674300=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============0925934841473674300==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xv2jnzdhqwxr4cnw"
Content-Disposition: inline


--xv2jnzdhqwxr4cnw
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Sun, Mar 17, 2024 at 10:52:13PM +0100, Uwe Kleine-K=F6nig wrote:
> while working on the character device support on an stm32mp157 I
> identified a few bugs / shortcomings in the stm32 pwm driver. These are
> fixed here.
>=20
> I based this series on top of pwm/for-next
> + https://lore.kernel.org/linux-pwm/20240315145443.982807-2-u.kleine-koen=
ig@pengutronix.de
> + a cherry-pick of commit b0cde62e4c54 ("clk: Add a devm variant of clk_r=
ate_exclusive_get()")

I applied this series to
https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/for-=
next
=2E The dependencies are in there, too: My pwm-stm32 is in my
pwm/for-next, too, the clk patch is in v6.9-rc1.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--xv2jnzdhqwxr4cnw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmYaQnUACgkQj4D7WH0S
/k6y6gf/VKf1zsCq3LHoeeIb/DTeTVGwy6u9mMCgs0Fb4PzUkN3VZi8i9mMWncU7
kBMxmRh7zCDnUhZqUBXOFQVLqirVcjQ0uUQ+mY+lBu2PxRO0x/dX2aLlxUlZAnSF
mdcKGzKdY2fNPkYOELbPtmAnBEcYpeMelmgCChHnxG+IdpuQrh06by0vGwZeIzO5
f/U66Kf//gwSIGw0+CPHIbdeu0lIJBupa5ZGKQmGkyoBu86Kh8jN1r/McnZyzS6J
gkxGdI6ny+e6R0CP4/RisZZ85Gfde+V2zRJSUhuHjvFTUhnwJ+W0sm76C+eCsYnP
FOwbyk3BfkVPWlD3VDXjwnWcVW2VDQ==
=xwr+
-----END PGP SIGNATURE-----

--xv2jnzdhqwxr4cnw--

--===============0925934841473674300==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============0925934841473674300==--
