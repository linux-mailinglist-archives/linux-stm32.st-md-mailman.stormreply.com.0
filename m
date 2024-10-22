Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D59A39AB50D
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Oct 2024 19:28:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 922B4C6DD9F;
	Tue, 22 Oct 2024 17:28:23 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DE437C6DD6B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Oct 2024 17:28:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 43DB35C59ED;
 Tue, 22 Oct 2024 17:28:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A09D1C4CEC3;
 Tue, 22 Oct 2024 17:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729618093;
 bh=Xh0Dg7YzHWWSX+FIkTVR8WeZ65RIdshONwrzkKLVIGg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OFArfh+ljJoq9u/Aw17WBReW1fNR5Efru55WhTA7qiDbSHlKhBw4OLKU9YdWShIF1
 5ZUQFwoW2r6fQcM0r44gqy2wU3Yz6HbiMDaPucYcZrpK4RWtNL5f1JGXP+MUqUYM/y
 PRUtgcNNcc1DS5gInVNc4bvOp2x0vZC/om7OqIDSVjpaVpyF0p5WCrEcx0iVtjlG83
 r1G4hf9eOZTZcAeY5puk7U+DzQuJNrjlHSENbx7Dh3MP43FMerNTfOHbeeqqn7IW3x
 UO3UTJRuEaWuGHMLSCNibWbVnnhTYNdmTqvh8s/Z60aeiofQVbnCSt4sSzgik+LfFT
 t3xgiz77DurEg==
Date: Tue, 22 Oct 2024 18:28:06 +0100
From: Conor Dooley <conor@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Message-ID: <20241022-crisply-brute-45f98632ef78@spud>
References: <20241021103617.653386-1-inochiama@gmail.com>
 <20241021103617.653386-3-inochiama@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20241021103617.653386-3-inochiama@gmail.com>
Cc: Eric Dumazet <edumazet@google.com>, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
 Chen Wang <unicorn_wang@outlook.com>, Jose Abreu <joabreu@synopsys.com>,
 Inochi Amaoto <inochiama@outlook.com>, Paolo Abeni <pabeni@redhat.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Richard Cochran <richardcochran@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, Yixun Lan <dlan@gentoo.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, Palmer Dabbelt <palmer@dabbelt.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH 2/4] dt-bindings: net: Add support for
	Sophgo SG2044 dwmac
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
Content-Type: multipart/mixed; boundary="===============6417595743704882773=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============6417595743704882773==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6+sVcBOZQT1jcJu5"
Content-Disposition: inline


--6+sVcBOZQT1jcJu5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 21, 2024 at 06:36:15PM +0800, Inochi Amaoto wrote:
> The GMAC IP on SG2044 is almost a standard Synopsys DesignWare MAC
> with some extra clock.
>=20
> Add necessary compatible string for this device.
>=20
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>  .../devicetree/bindings/net/snps,dwmac.yaml   |   1 +
>  .../bindings/net/sophgo,sg2044-dwmac.yaml     | 145 ++++++++++++++++++
>  2 files changed, 146 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/sophgo,sg2044-d=
wmac.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Docu=
mentation/devicetree/bindings/net/snps,dwmac.yaml
> index 3c4007cb65f8..69f6bb36970b 100644
> --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> @@ -99,6 +99,7 @@ properties:
>          - snps,dwmac-5.30a
>          - snps,dwxgmac
>          - snps,dwxgmac-2.10
> +        - sophgo,sg2044-dwmac
>          - starfive,jh7100-dwmac
>          - starfive,jh7110-dwmac
> =20
> diff --git a/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.ya=
ml b/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
> new file mode 100644
> index 000000000000..93c41550b0b6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
> @@ -0,0 +1,145 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/sophgo,sg2044-dwmac.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: StarFive JH7110 DWMAC glue layer
> +
> +maintainers:
> +  - Inochi Amaoto <inochiama@gmail.com>
> +
> +select:
> +  properties:
> +    compatible:
> +      contains:
> +        enum:
> +          - sophgo,sg2044-dwmac
> +  required:
> +    - compatible
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: sophgo,sg2044-dwmac
> +      - const: snps,dwmac-5.30a
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: GMAC main clock
> +      - description: PTP clock
> +      - description: TX clock
> +
> +  clock-names:
> +    items:
> +      - const: stmmaceth
> +      - const: ptp_ref
> +      - const: tx
> +
> +  sophgo,syscon:

How many dwmac instances does the sg2044 have?

> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    items:
> +      - items:
> +          - description: phandle to syscon that configures phy
> +          - description: offset of phy mode register
> +          - description: length of the phy mode register
> +    description:
> +      A phandle to syscon with two arguments that configure phy mode.
> +      The argument one is the offset of phy mode register, the
> +      argument two is the length of phy mode register.
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - interrupts
> +  - interrupt-names
> +  - resets
> +  - reset-names
> +
> +allOf:
> +  - $ref: snps,dwmac.yaml#
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: sophgo,sg2044-dwmac

Why does this have to be applied conditionally? There's only one
compatible in the binding, can't you apply these unconditionally?


Cheers,
Conor.

> +    then:
> +      properties:
> +        interrupts:
> +          minItems: 1
> +          maxItems: 1
> +
> +        interrupt-names:
> +          minItems: 1
> +          maxItems: 1
> +
> +        resets:
> +          maxItems: 1
> +
> +        reset-names:
> +          const: stmmaceth
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    ethernet@30006000 {
> +      compatible =3D "sophgo,sg2044-dwmac", "snps,dwmac-5.30a";
> +      reg =3D <0x30006000 0x4000>;
> +      clocks =3D <&clk 151>, <&clk 152>, <&clk 154>;
> +      clock-names =3D "stmmaceth", "ptp_ref", "tx";
> +      interrupt-parent =3D <&intc>;
> +      interrupts =3D <296 IRQ_TYPE_LEVEL_HIGH>;
> +      interrupt-names =3D "macirq";
> +      resets =3D <&rst 30>;
> +      reset-names =3D "stmmaceth";
> +      snps,multicast-filter-bins =3D <0>;
> +      snps,perfect-filter-entries =3D <1>;
> +      snps,aal;
> +      snps,tso;
> +      snps,txpbl =3D <32>;
> +      snps,rxpbl =3D <32>;
> +      snps,mtl-rx-config =3D <&gmac0_mtl_rx_setup>;
> +      snps,mtl-tx-config =3D <&gmac0_mtl_tx_setup>;
> +      snps,axi-config =3D <&gmac0_stmmac_axi_setup>;
> +      status =3D "disabled";
> +
> +      gmac0_mtl_rx_setup: rx-queues-config {
> +        snps,rx-queues-to-use =3D <8>;
> +        snps,rx-sched-wsp;
> +        queue0 {};
> +        queue1 {};
> +        queue2 {};
> +        queue3 {};
> +        queue4 {};
> +        queue5 {};
> +        queue6 {};
> +        queue7 {};
> +      };
> +
> +      gmac0_mtl_tx_setup: tx-queues-config {
> +        snps,tx-queues-to-use =3D <8>;
> +        queue0 {};
> +        queue1 {};
> +        queue2 {};
> +        queue3 {};
> +        queue4 {};
> +        queue5 {};
> +        queue6 {};
> +        queue7 {};
> +      };
> +
> +      gmac0_stmmac_axi_setup: stmmac-axi-config {
> +        snps,blen =3D <16 8 4 0 0 0 0>;
> +        snps,wr_osr_lmt =3D <1>;
> +        snps,rd_osr_lmt =3D <2>;
> +      };
> +    };
> --=20
> 2.47.0
>=20

--6+sVcBOZQT1jcJu5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZxfgpgAKCRB4tDGHoIJi
0nAWAQDfeza6aA91cekxwcjXjesZrc3MIthUXQr3N1UZWnsSuQEAqCqjg9I1vB8t
/o5NgrwsAo5vJH/ZFQPuCuEIDd5xYQU=
=rpEJ
-----END PGP SIGNATURE-----

--6+sVcBOZQT1jcJu5--

--===============6417595743704882773==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============6417595743704882773==--
