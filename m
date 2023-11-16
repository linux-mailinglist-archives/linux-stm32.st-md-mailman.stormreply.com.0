Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 758E77EE635
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Nov 2023 18:55:56 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 280E3C6C83A;
	Thu, 16 Nov 2023 17:55:56 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CB581C6B44F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Nov 2023 17:55:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 5CC88B81C8B;
 Thu, 16 Nov 2023 17:55:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49CB0C433C8;
 Thu, 16 Nov 2023 17:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1700157353;
 bh=JTOSSzmkti/CwkIFzl38dTbWRkcFa2xCEPwQSmwX8aA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EFyoDzEMgrhUh2OxSpogBRBdx/kxk2p6NXUbDjjjl4EwgWbPltzgZixN/p8bEtMi7
 hKGIPprRoW/tOD8Qi79NE84j5zepPPPfDTZ4nGeBlQ/kfEvXdSTu504rIhA0hRfivw
 otOlkcUPnhOfuI3QGcCn7TyQWtn2zoL4S1oS43gRY3NxT1gobz1QaTr1DCgXPKxuT6
 iETnqxuNlPQ+vxs2F2//BHVqDgh9I14q059z8Lx1OZVi2DuLkrZvhkcXnD8TvBMG8/
 ZbCvJ1T99RoNUpsb7o/vOmb0CiVd4cgH494by8++yRUaYyitC8OskXl2dJ+ztFQ4Gj
 NSvbNuQH7f1SQ==
Date: Thu, 16 Nov 2023 17:55:48 +0000
From: Conor Dooley <conor@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Message-ID: <20231116-stellar-anguished-7cf06eb5634a@squawk>
References: <20231029042712.520010-1-cristian.ciocaltea@collabora.com>
 <20231029042712.520010-13-cristian.ciocaltea@collabora.com>
 <f253b50a-a0ac-40c6-b13d-013de7bac407@lunn.ch>
 <233a45e1-15ac-40da-badf-dee2d3d60777@collabora.com>
 <cb6597be-2185-45ad-aa47-c6804ff68c85@collabora.com>
MIME-Version: 1.0
In-Reply-To: <cb6597be-2185-45ad-aa47-c6804ff68c85@collabora.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Emil Renner Berthing <kernel@esmil.dk>,
 Eric Dumazet <edumazet@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-riscv@lists.infradead.org, kernel@collabora.com,
 linux-stm32@st-md-mailman.stormreply.com, Jose Abreu <joabreu@synopsys.com>,
 Samin Guo <samin.guo@starfivetech.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Richard Cochran <richardcochran@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, geert@linux-m68k.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH v2 12/12] [UNTESTED] riscv: dts: starfive:
 beaglev-starlight: Enable gmac
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
Content-Type: multipart/mixed; boundary="===============2776470860886289661=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============2776470860886289661==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uAMF7mMjCIyQbaxj"
Content-Disposition: inline


--uAMF7mMjCIyQbaxj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 16, 2023 at 03:15:46PM +0200, Cristian Ciocaltea wrote:
> On 10/30/23 00:53, Cristian Ciocaltea wrote:
> > On 10/29/23 20:46, Andrew Lunn wrote:
> >> On Sun, Oct 29, 2023 at 06:27:12AM +0200, Cristian Ciocaltea wrote:
> >>> The BeagleV Starlight SBC uses a Microchip KSZ9031RNXCA PHY supporting
> >>> RGMII-ID.
> >>>
> >>> TODO: Verify if manual adjustment of the RX internal delay is needed.=
 If
> >>> yes, add the mdio & phy sub-nodes.
> >>
> >> Please could you try to get this tested. It might shed some light on
> >> what is going on here, since it is a different PHY.
> >=20
> > Actually, this is the main reason I added the patch. I don't have access
> > to this board, so it would be great if we could get some help with test=
ing.
>=20
> @Emil, @Conor: Any idea who might help us with a quick test on the
> BeagleV Starlight board?

I don't have one & I am not sure if Emil does. Geert (CCed) should have
one though. Is there a specific test you need to have done?

--uAMF7mMjCIyQbaxj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZVZXoQAKCRB4tDGHoIJi
0tu2AP9drj6GsHST1GuwVshDCPfcDCHRO+vR+I1UqBAWPOMUXwEAqSxcPaC1TyWe
GMY51dqgFxkhTDyvFRD6foJdL4VC4w8=
=kvIZ
-----END PGP SIGNATURE-----

--uAMF7mMjCIyQbaxj--

--===============2776470860886289661==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============2776470860886289661==--
