Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C12AC6164
	for <lists+linux-stm32@lfdr.de>; Wed, 28 May 2025 07:49:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6B76DC36B2A;
	Wed, 28 May 2025 05:49:03 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9940EC36B29
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 May 2025 05:49:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BE5225C47A7;
 Wed, 28 May 2025 05:46:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28AE1C4CEE7;
 Wed, 28 May 2025 05:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748411340;
 bh=KGxwizXyq77M4Y/aYZ8pvgoLSWCoKk87bmX4kaNkaFc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=m3UvmjVPTGnqK3eapjTiclUiTdJK1FO35G/m+POk9YoHm30o/+KWRDwVfg/KryaSQ
 Q1fEdM5C+Cy5v+1jUziV8ztOwQUu0aZonXvdPUKNk/ntCl5kcV5MFjVJPzBFoOn8vu
 A+gFpLoLA4TPBTPHTDJIrqcfjuSwre76/ZIHJxjpHEHGoF8PNWXGmH9SgFhKc+Osav
 YOo96MAT7kW1TMpGIAZTrFPXqw0AtGiR4MAwSdiSoKBW76GEsjHSEx11yor9JcPEh0
 t52CV7P6gHMAWT3cuhqTXAo5iLbNn6sHiCNvGOFCcdaAhn3HVRyZiLUcPLX5ZHWUFr
 Rr+5tym7lW+hw==
Message-ID: <ad7cd2e3-c061-4f17-83dc-2a6df8095d30@kernel.org>
Date: Wed, 28 May 2025 07:48:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: weishangjuan@eswincomputing.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, vladimir.oltean@nxp.com,
 rmk+kernel@armlinux.org.uk, yong.liang.choong@linux.intel.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, inochiama@gmail.com,
 jan.petrous@oss.nxp.com, jszhang@kernel.org, p.zabel@pengutronix.de,
 0x1207@gmail.com, boon.khai.ng@altera.com,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <20250528041455.878-1-weishangjuan@eswincomputing.com>
 <20250528041558.895-1-weishangjuan@eswincomputing.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20250528041558.895-1-weishangjuan@eswincomputing.com>
Cc: ningyu@eswincomputing.com, lizhi2@eswincomputing.com,
 linmin@eswincomputing.com
Subject: Re: [Linux-stm32] [PATCH v2 1/2] dt-bindings: ethernet: eswin:
 Document for EIC7700 SoC
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 28/05/2025 06:15, weishangjuan@eswincomputing.com wrote:
> From: Shangjuan Wei <weishangjuan@eswincomputing.com>
> 
> Add ESWIN EIC7700 Ethernet controller, supporting
> multi-rate (10M/100M/1G) auto-negotiation, clock/reset control,
> and AXI bus parameter optimization.
> 
> Signed-off-by: Zhi Li <lizhi2@eswincomputing.com>
> Signed-off-by: Shangjuan Wei <weishangjuan@eswincomputing.com>
> ---
>  .../bindings/net/eswin,eic7700-eth.yaml       | 200 ++++++++++++++++++
>  1 file changed, 200 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml
> 
> diff --git a/Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml b/Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml
> new file mode 100644
> index 000000000000..c76d2fbf0ebd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml
> @@ -0,0 +1,200 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/eswin,eic7700-eth.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Eswin EIC7700 SOC Eth Controller
> +
> +maintainers:
> +  - Shuang Liang <liangshuang@eswincomputing.com>
> +  - Zhi Li <lizhi2@eswincomputing.com>
> +  - Shangjuan Wei <weishangjuan@eswincomputing.com>
> +
> +description:
> +  The eth controller registers are part of the syscrg block on
> +  the EIC7700 SoC.
> +
> +select:
> +  properties:
> +    compatible:
> +      contains:
> +        enum:
> +          - eswin,eic7700-qos-eth
> +  required:
> +    - compatible
> +
> +allOf:
> +  - $ref: snps,dwmac.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: eswin,eic7700-qos-eth
> +      - const: snps,dwmac
> +
> +  reg:
> +    description: Base address and size of the Ethernet controller registers

Drop description, wasn't here.

> +    items:
> +      - description: Register base address
> +      - description: Register size

The second item makes no sense. Size is part of one entry. Looking at
your example you have only one item. Last time you said this is
extension region, so I really do not understand what is happening here.


> +
> +  interrupt-names:
> +    const: macirq
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  phy-mode:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    enum:
> +      - rgmii
> +      - rgmii-rxid
> +      - rgmii-txid
> +      - rgmii-id
> +
> +  phy-handle:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: Reference to the PHY device
> +
> +  clocks:
> +    minItems: 3
> +    maxItems: 7

No improvements. Read feedback given to other eswin patches. This cannot
be flexible.


> +
> +  clock-names:
> +    minItems: 3
> +    contains:
> +      enum:
> +        - app
> +        - stmmaceth
> +        - tx
> +
> +  resets:
> +    maxItems: 1
> +
> +  reset-names:
> +    items:
> +      - const: stmmaceth
> +
> +  dma-noncoherent: true
> +
> +  # Custom properties

Drop

> +  eswin,hsp_sp_csr:

Nothing improved. Eswin upstreamed several bindings at once with same
issues. I commented on multiple of them, but here I stopped commenting
asking you to fix the same things I asked your colleagues. The point is
that it is beneficial if you learn together, not each repeat same
mistake and receive same feedback from reviewer.

Follow DTS coding style naming for property.


> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    items:
> +      - items:
> +          - description: HSP peripheral control register area

What is HSP?

> +          - description: Control registers (such as used to select TX clock
> +                         source, PHY interface mode)
> +          - description: AXI bus low-power control related registers
> +          - description: Status register
> +    description:
> +      Configure TX clock source selection, set PHY interface mode,
> +      and control low-power bus behavior
> +
> +  eswin,syscrg_csr:

Nothing improved.

> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    items:
> +      - items:
> +          - description: CRG's device tree node handle

What is CRG? Anyway, use the same style. If previously phandle is
control register area, why this is phandle? Drop redundant parts,
because this cannot be anything else than phandle, and describe what is
the device you are pointing here.

> +          - description: Enable and divide HSP ACLK control
> +          - description: Behavior of configuring HSP controller
> +    description:
> +      Register that accesses the system clock controller.
> +      Used to configure HSP clocks for Ethernet subsystems
> +
> +  eswin,dly_hsp_reg:

Nothing improved.

> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    items:
> +      - items:
> +          - description: TX delay control register offset
> +          - description: RX delay control register offset

No... These are not phandles. Look at your example - where is a phandle
there?

> +          - description: Switch for controlling delay function
> +    description:
> +      Register for configuring delay compensation between MAC/PHY
> +
> +  snps,axi-config:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: AXI bus configuration

Do not redefine properties. Include proper ref and fix your
additionalProps to unevaluateadProperties.

> +
> +  stmmac-axi-config:

Don't duplicate with snps dwmac.

> +    type: object
> +    unevaluatedProperties: false
> +    properties:
> +      snps,blen:
> +        $ref: /schemas/types.yaml#/definitions/uint32-array
> +        description: Set the burst transmission length of AXI bus
> +      snps,rd_osr_lmt:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: Set OSR restrictions for read operations
> +      snps,wr_osr_lmt:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: Set OSR restrictions for write operations
> +      snps,lpi_en:
> +        $ref: /schemas/types.yaml#/definitions/flag
> +        description: Low Power Interface enable flag (true/false)
> +    required:
> +      - snps,blen
> +      - snps,rd_osr_lmt
> +      - snps,wr_osr_lmt
> +      - snps,lpi_en
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupt-names
> +  - interrupts
> +  - phy-mode
> +  - clocks
> +  - clock-names
> +  - resets
> +  - reset-names
> +  - eswin,hsp_sp_csr
> +  - eswin,syscrg_csr
> +  - eswin,dly_hsp_reg
> +  - snps,axi-config
> +
> +additionalProperties: false

unevaluatedProperties instead

> +
> +examples:
> +  - |
> +    gmac0: ethernet@50400000 {
> +        compatible = "eswin,eic7700-qos-eth", "snps,dwmac";
> +        reg = <0x0 0x50400000 0x0 0x10000>;
> +        interrupt-parent = <&plic>;
> +        interrupt-names = "macirq";
> +        interrupts = <61>;
> +        phy-mode = "rgmii-txid";
> +        phy-handle = <&phy0>;
> +        status = "okay";

Drop

> +        clocks = <&clock 550>,
> +                 <&clock 551>,
> +                 <&clock 552>;
> +        clock-names = "app", "stmmaceth", "tx";
> +        resets = <&reset 0x07 (1 << 26)>;
> +        reset-names = "stmmaceth";
> +        dma-noncoherent;
> +        eswin,hsp_sp_csr = <&hsp_sp_csr 0x1030 0x100 0x108>;
> +        eswin,syscrg_csr = <&sys_crg 0x148 0x14c>;
> +        eswin,dly_hsp_reg = <0x114 0x118 0x11c>;
> +        snps,axi-config = <&stmmac_axi_setup>;
> +        stmmac_axi_setup: stmmac-axi-config {
> +            snps,blen = <0 0 0 0 16 8 4>;
> +            snps,rd_osr_lmt = <2>;
> +            snps,wr_osr_lmt = <2>;
> +            snps,lpi_en;
> +        };
> +        /* mdio {

Don't post dead code.

> +          compatible = "snps,dwmac-mdio";
> +          status = "okay";

Drop

> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +
> +          phy0: ethernet-phy@0 {
> +            device_type = "ethernet-phy";
> +            reg = <0>;
> +            compatible = "ethernet-phy-id001c.c916", "realtek,rtl8211f";
> +          };
> +        }; */
> +    };


Best regards,
Krzysztof
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
