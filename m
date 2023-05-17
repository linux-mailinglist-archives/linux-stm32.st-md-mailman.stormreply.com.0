Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EA9157070AE
	for <lists+linux-stm32@lfdr.de>; Wed, 17 May 2023 20:22:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9CFD0C6B442;
	Wed, 17 May 2023 18:22:19 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9DFB4C65E5A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 May 2023 18:22:18 +0000 (UTC)
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b]
 helo=bjornoya.blackshift.org) by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mkl@pengutronix.de>)
 id 1pzLmh-0007yW-S9; Wed, 17 May 2023 20:21:59 +0200
Received: from pengutronix.de (unknown [172.20.34.65])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (Client did not present a certificate)
 (Authenticated sender: mkl-all@blackshift.org)
 by smtp.blackshift.org (Postfix) with ESMTPSA id 93EA41C74F0;
 Wed, 17 May 2023 18:21:57 +0000 (UTC)
Date: Wed, 17 May 2023 20:21:57 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Message-ID: <20230517-prescribe-duller-5457a674a3af-mkl@pengutronix.de>
References: <20230423172528.1398158-1-dario.binacchi@amarulasolutions.com>
 <20230423172528.1398158-2-dario.binacchi@amarulasolutions.com>
 <20230424090229.GB8035@google.com>
 <20230517-corset-pelvis-5b0c41f519c9-mkl@pengutronix.de>
 <28889e6c-0040-5adb-25e1-f8284931947a@linaro.org>
MIME-Version: 1.0
In-Reply-To: <28889e6c-0040-5adb-25e1-f8284931947a@linaro.org>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:b01:1d::7b
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: devicetree@vger.kernel.org,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Lee Jones <lee@kernel.org>,
 linux-kernel@vger.kernel.org, linux-can@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 oe-kbuild-all@lists.linux.dev, michael@amarulasolutions.com,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/4] dt-bindings: mfd: stm32f7: add
 binding definition for CAN3
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
Content-Type: multipart/mixed; boundary="===============4879441995651483384=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============4879441995651483384==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qnusropkbmgywkyd"
Content-Disposition: inline


--qnusropkbmgywkyd
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 17.05.2023 17:23:13, Krzysztof Kozlowski wrote:
> On 17/05/2023 16:16, Marc Kleine-Budde wrote:
> > Hey Lee Jones,
> >=20
> > On 24.04.2023 10:02:29, Lee Jones wrote:
> >> On Sun, 23 Apr 2023, Dario Binacchi wrote:
> >>
> >>> Add binding definition for CAN3 peripheral.
> >>>
> >>> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> >>> ---
> >>>
> >>>  include/dt-bindings/mfd/stm32f7-rcc.h | 1 +
> >>>  1 file changed, 1 insertion(+)
> >>
> >> Applied, thanks
> >=20
> > I upstreamed the v2 of this series
> > (https://lore.kernel.org/all/20230427204540.3126234-1-dario.binacchi@am=
arulasolutions.com/)
> > that doesn't contain this change to net/main without noticing that the
> > DT changes in that series depend on it.
> >=20
> > This broke the DT compilation of the stm32f746.dtsi in the net/main
> > tree. I don't see the stm32f7-rcc.h changes in linus/master so I'm
> > afraid this will break mainline too :/
> >=20
> > What are the possible solutions? I see:
> > 1) revert the stm32f746.dtsi changes via net/main
> > 2) upstream the stm32f7-rcc.h changes via net/main, too
> > 3) upstream the stm32f7-rcc.h changes via you tree, so that it hits
> >    mainline in the v6.4 release cycle.
> >=20
> > I'm in favor of solution number 1. Thoughts?
>=20
> DTS should never go with driver changes or with driver trees, not only
> because it hides ABI breaks but also for above reasons. The best if you
> just drop or revert DTS commits, so they can go via platform maintainer.

Reverted: https://lore.kernel.org/20230517181950.1106697-1-mkl@pengutronix.=
de

Thanks,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--qnusropkbmgywkyd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEDs2BvajyNKlf9TJQvlAcSiqKBOgFAmRlG0IACgkQvlAcSiqK
BOgvtggAs1aeq0u5rmdza+38M15JChcsOtvTbSMIoePcRPC8ygd/ZihgaHb7qs2y
i1+Nf64kuyjBt787Gf3/YsL72Rs5SOSYXXMJZNX3tNmNQSAgatZqrNSR308SVars
DfBTlhgmMsDj5fnDF7NL9XZHOSG20oRNWJ9dwZ5FIOwMuxP6rXtR7wAA8A9d51Y1
ZTDzYvBp5qkxqqfeD+Ap4s6kQ6G9r8Csj2h/C3nm1aNo82T8yrgtq6bAslk3rpTE
+NVp9T5olP/H7BayFdy/BlRS6lu+o7g58HQw6KCEKrFGYk4OkbAze/Vo1pq/+o0p
chq9aL6I5s9k2EwKMJvmg1Y2Cl+byg==
=8ejs
-----END PGP SIGNATURE-----

--qnusropkbmgywkyd--

--===============4879441995651483384==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============4879441995651483384==--
