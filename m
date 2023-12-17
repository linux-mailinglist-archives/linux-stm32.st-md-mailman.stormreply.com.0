Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 45824816244
	for <lists+linux-stm32@lfdr.de>; Sun, 17 Dec 2023 22:03:50 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E1650C6DD6F;
	Sun, 17 Dec 2023 21:03:49 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CF7CEC6B45E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 17 Dec 2023 21:03:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id C9AA4CE0D9B;
 Sun, 17 Dec 2023 21:03:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61A47C433C7;
 Sun, 17 Dec 2023 21:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702847023;
 bh=mCEcMXWBRCUl8ycxVYQtMfuRfaojP7UvcGTxOXhKDaI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hvrsPbSDBmXRz7fBWAVgf3e4EySM97yOUjYsBwbpgyiOdI9DY8G/gQoVfOAG5b9io
 ELWQSRpweiRp25KmFZScZE1R7gu3L4njHUmSeYafmHTHI1hXgkZaaWm+wXueeGyORN
 sZLgKSVG117kpnXWB//nwjQTcU5HLd07b5ozYEhy3wzX0cuqZ6M2yicJ+k0XCxRjaU
 bYfavnhJ/435XHwjKKNE8uKp5+tbIyQKUqBUcbUdsw3Poed/utfsxAEUQnqJbL1W+U
 yBb5EgZjWizSeRZC1XgwZNH1Nz5Hg1OZg9pXcBUMplPIgDrLmtpz+n3p6shg2jcd1L
 P3At3ee5NOOhQ==
Date: Sun, 17 Dec 2023 21:03:36 +0000
From: Conor Dooley <conor@kernel.org>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Message-ID: <20231217-rippling-galleria-904152e41f95@spud>
References: <20231215204050.2296404-1-cristian.ciocaltea@collabora.com>
 <20231215204050.2296404-6-cristian.ciocaltea@collabora.com>
 <CAJM55Z-bg0EGPaLHtxcu2AzqN59zfuiT0eE7oCShrx7dG_QK1g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJM55Z-bg0EGPaLHtxcu2AzqN59zfuiT0eE7oCShrx7dG_QK1g@mail.gmail.com>
Cc: Emil Renner Berthing <kernel@esmil.dk>,
 Michael Turquette <mturquette@baylibre.com>,
 Eric Dumazet <edumazet@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-riscv@lists.infradead.org, kernel@collabora.com,
 linux-clk@vger.kernel.org, Hal Feng <hal.feng@starfivetech.com>,
 Jose Abreu <joabreu@synopsys.com>, Samin Guo <samin.guo@starfivetech.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Richard Cochran <richardcochran@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH v3 5/9] riscv: dts: starfive:
 jh7100-common: Setup pinmux and enable gmac
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
Content-Type: multipart/mixed; boundary="===============3975451297368715604=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============3975451297368715604==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="kG7DkOG8HSp8FfWf"
Content-Disposition: inline


--kG7DkOG8HSp8FfWf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 16, 2023 at 11:38:53AM -0800, Emil Renner Berthing wrote:
> Cristian Ciocaltea wrote:
> > Add pinmux configuration for DWMAC found on the JH7100 based boards and
> > enable the related DT node, providing a basic PHY configuration.
> >
> > Co-developed-by: Emil Renner Berthing <emil.renner.berthing@canonical.c=
om>
> > Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> > Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> > ---
> >  .../boot/dts/starfive/jh7100-common.dtsi      | 85 +++++++++++++++++++
> >  1 file changed, 85 insertions(+)
> >
> > diff --git a/arch/riscv/boot/dts/starfive/jh7100-common.dtsi b/arch/ris=
cv/boot/dts/starfive/jh7100-common.dtsi
> > index 42fb61c36068..5cafe8f5c2e7 100644
> > --- a/arch/riscv/boot/dts/starfive/jh7100-common.dtsi
> > +++ b/arch/riscv/boot/dts/starfive/jh7100-common.dtsi
> > @@ -72,7 +72,92 @@ wifi_pwrseq: wifi-pwrseq {
> >  	};
> >  };
> >
> > +&gmac {
> > +	pinctrl-names =3D "default";
> > +	pinctrl-0 =3D <&gmac_pins>;
> > +	phy-mode =3D "rgmii-id";
> > +	phy-handle =3D <&phy>;
>=20
> I'm not sure if it's a generic policy or not, but I don't really like add=
ing a
> reference to a non-existant node here. I'd move this property to the board
> files where the phy node is actually defined.

FWIW, I don't like the reference-in-the-wrong-place thing either.

--kG7DkOG8HSp8FfWf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZX9iKAAKCRB4tDGHoIJi
0ljjAQDdeQS9ySXycX3Kr1uE7USW6FuoSN3axiU/roL2LS3UxAD/QmhKPwhsop/g
JHAPtH4K9zTWBI5z0reix7grWZuUDgQ=
=ljQG
-----END PGP SIGNATURE-----

--kG7DkOG8HSp8FfWf--

--===============3975451297368715604==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============3975451297368715604==--
