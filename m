Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C3E1699F76
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Feb 2023 22:53:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D2733C6A5FB;
	Thu, 16 Feb 2023 21:53:13 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6B2A9C64110
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Feb 2023 21:53:12 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4A8BB60C1D;
 Thu, 16 Feb 2023 21:53:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EEA3C4339E;
 Thu, 16 Feb 2023 21:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1676584390;
 bh=/89NA4NAoXcXzdPfjHUemplkBWp+8gbW+gPen4ZFpgo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Xx7q4GXXB4Ze6YTbHhjjCXHrGwNp71BIJV5GuJj4gBwBiwzTg6nkKStAHxNTmYAcy
 qbDmYTSljpicwjrAbhw5o/ypDDD0tgcN26EfyZPgeM1yI1U7lOOg7oHb35651sjpBe
 PZ3IeInK+WNQUl00mwuiCFvStJUKoaCwq6saPl6xj8Aa3Se3DH/+s8LiyHyAFtqu+H
 dsRq+jSUQU7Ns+eRE5UkrZotfNyo1vvj0nuOX633djBUYop/B4g5vkZjFroJsa5C8D
 ptZXCA31Et8eKsHz+ywE8GbM+0R51PxwoNZwLz68UUZrQNR0n+X07KI3BbaeeNo1gW
 mupdA/vmOkC8w==
Date: Thu, 16 Feb 2023 21:53:02 +0000
From: Conor Dooley <conor@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 daire.mcnamara@microchip.com
Message-ID: <Y+6lvizTUhF9t+xk@spud>
References: <20230211031821.976408-1-cristian.ciocaltea@collabora.com>
 <20230211031821.976408-3-cristian.ciocaltea@collabora.com>
MIME-Version: 1.0
In-Reply-To: <20230211031821.976408-3-cristian.ciocaltea@collabora.com>
Cc: Emil Renner Berthing <kernel@esmil.dk>, Eric Dumazet <edumazet@google.com>,
 Sagar Kadam <sagar.kadam@sifive.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-riscv@lists.infradead.org, kernel@collabora.com,
 linux-stm32@st-md-mailman.stormreply.com,
 Yanhong Wang <yanhong.wang@starfivetech.com>, Lee Jones <lee@kernel.org>,
 Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org,
 Albert Ou <aou@eecs.berkeley.edu>, Richard Cochran <richardcochran@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH 02/12] dt-bindings: riscv: sifive-ccache:
 Add 'uncached-offset' property
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
Content-Type: multipart/mixed; boundary="===============6692827683324784173=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============6692827683324784173==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="+OUnDp7k4pWMwsmV"
Content-Disposition: inline


--+OUnDp7k4pWMwsmV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey all,

On Sat, Feb 11, 2023 at 05:18:11AM +0200, Cristian Ciocaltea wrote:
> Add the 'uncached-offset' property to be used for specifying the
> uncached memory offset required for handling non-coherent DMA
> transactions.
>=20
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  Documentation/devicetree/bindings/riscv/sifive,ccache0.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/riscv/sifive,ccache0.yaml =
b/Documentation/devicetree/bindings/riscv/sifive,ccache0.yaml
> index 2b864b2f12c9..60cd87a2810a 100644
> --- a/Documentation/devicetree/bindings/riscv/sifive,ccache0.yaml
> +++ b/Documentation/devicetree/bindings/riscv/sifive,ccache0.yaml
> @@ -82,6 +82,11 @@ properties:
> =20
>    next-level-cache: true
> =20
> +  uncached-offset:
> +    $ref: /schemas/types.yaml#/definitions/uint64
> +    description: |
> +      Uncached memory offset for handling non-coherent DMA transactions.

Firstly, this pretty tied to the StarFive stuff, where there is only one
"bank" of memory that neatly maps to one bank of non-cached memory.
On PolarFire SoC, where we would also like to make use of non-coherent
DMA for some transfers using the FPGA fabric, things are a bit more
complex.
Instead of a region & a non-cached alias, we have 2 regions and 2
non-cached regions.
These regions lie at 0x8000_0000 & 0x10_0000_0000 and the non-cached
regions are at 0xc000_0000 & 0x14_0000_0000. As you can tell, one fixed
offset isn't going to work there!

The other bit of a problem is that there is no fixed concept of aliases,
as seems to be the case on the jh7100. Instead, where the regions
"point" to in physical DDR is something that is configurable at runtime.
Practically speaking, it is set by firmware very early on in boot & is
fixed from there out, but will vary between boards and FPGA fabric
configuration. Effectively that means that from the PoV of a Devicetree
it is constant, but a good bit of flexibility is going to be needed.

What we have been doing on PolarFire SoC (although mostly internally at
this point) is, rather than creating a property like uncached-offset, we
instead are using the dma-ranges properties to induce the same affect.

In an example configuration with memory at:
	reg =3D <0x0 0x80000000 0x0 0x4000000>;
	reg =3D <0x0 0x8a000000 0x0 0x8000000>;
	reg =3D <0x0 0xc4000000 0x0 0x6000000>;
	reg =3D <0x10 0x22000000 0x0 0x5e000000>;
	reg =3D <0x14 0x12000000 0x0 0x10000000>;

a reserved memory section then covering the non-cached region at
0x14_0000_0000:
	dma_non_cached_high: non-cached-high-buffer {
		compatible =3D "shared-dma-pool";
		size =3D <0x0 0x10000000>;
		no-map;
		linux,dma-default;
		alloc-ranges =3D <0x14 0x12000000 0x0 0x10000000>;
	};

and dma-ranges:
	dma-ranges =3D <0x14 0x0 0x0 0x80000000 0x0 0x4000000>,
		     <0x14 0x4000000 0x0 0xc4000000 0x0 0x6000000>,
		     <0x14 0xa000000 0x0 0x8a000000 0x0 0x8000000>,

In this configuration, 0x8000_0000, 0x10_0000_0000, 0xc000_0000 &
0x14_0000_0000 are all aliases of the same address.
With this setup, we're able to do non-coherent DMA to the FPGA fabric,
to the PCI for example.
The DTS does grow a bit of complexity, with reserved memory regions and
dma-ranges - but at least they're standard properties!

Emil, if you want to take a look at that it is here:
https://github.com/linux4microchip/linux linux-5.15-mchp
I think I said to you before that it was based on one of Atish's early
approaches, the one from the 5.15 development cycle IIRC since we're
using that LTS.
Obviously it'll need changes to be upstreamable so we're not wedded to
this approach. For instance, it's being controlled by a compile time
option at the moment, so that clearly needs to become runtime for
upstream (and realistically needs to be one in our vendor tree too...)

I'll try to hack that approach into the visionfive v1 soonTM and see how
it goes, but it'll not be this side of March before I have time to do
that.

Cheers,
Conor.


--+OUnDp7k4pWMwsmV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY+6lvgAKCRB4tDGHoIJi
0ulqAQCULkPATgqWtudHs9arilghmWnIl+5HOdnui0TiEobVIwD9EJWZRVVAGTBQ
VrKlrkCPLqc12a+YcCC0aBjkaR6SDwI=
=ZTRK
-----END PGP SIGNATURE-----

--+OUnDp7k4pWMwsmV--

--===============6692827683324784173==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============6692827683324784173==--
