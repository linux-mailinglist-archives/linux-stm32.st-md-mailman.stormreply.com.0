Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 464FCB3F966
	for <lists+linux-stm32@lfdr.de>; Tue,  2 Sep 2025 11:01:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8F164C3FACB;
	Tue,  2 Sep 2025 09:01:11 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8AC9CC3F95B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  2 Sep 2025 09:01:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 8081460203;
 Tue,  2 Sep 2025 09:01:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93B9BC4CEED;
 Tue,  2 Sep 2025 09:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756803668;
 bh=mN5alaCamYFIsOV5DNqhwizhf2rPGa+oUFPBFZxEPYY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=t9EC+SXLly+Vx+79G57ZJem3FcxzZXJyPpX9DupmeAU5doHELqySn32k5H3OGMJx2
 qGqCX3b9GHQ8otVWjup3BhFcGsFfqwMjZpIHR8D5WDxmC6NJtZobScVVGnuN38Ggst
 tpd9w9eJpUyEVaIJvvwnn01I9DzIZ6LysK3vzDUq6wEkVQgE+pXXCXLWKbEQigzmXt
 cmycjbwyUnnDQNiHBrvB1wRlI9V+zCWL6EViyWV7QmY8bHsTcHZEBS5SzpC2H6Ar+r
 UeEoTrwjt9igTHLYLNMdNiM00GNms+D4swv38K1yF5952+TiIaU9kNBWSYhkcipmp5
 1FAVoLcyHaqVA==
Date: Tue, 2 Sep 2025 11:01:05 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Message-ID: <20250902-gainful-meerkat-of-prestige-dd4952@kuoka>
References: <20250902001302.3823418-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250902001302.3823418-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250902001302.3823418-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Eric Dumazet <edumazet@google.com>, linux-stm32@st-md-mailman.stormreply.com,
 Rob Herring <robh@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Jose Abreu <joabreu@synopsys.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, Philipp Zabel <p.zabel@pengutronix.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next 2/4] dt-bindings: net: renesas,
 rzv2h-gbeth: Document Renesas RZ/T2H and RZ/N2H SoCs
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

On Tue, Sep 02, 2025 at 01:13:00AM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Document the Ethernet MAC (GMAC) IP present on the Renesas RZ/T2H
> (R9A09G077) and RZ/N2H (R9A09G087) SoCs. The GMAC IP on RZ/N2H is
> identical to that found on the RZ/T2H SoC.
> 
> While the RZ/V2H(P), RZ/T2H, and RZ/N2H SoCs all integrate the Synopsys
> DesignWare MAC (version 5.20), the hardware is synthesized with different
> options compared to the RZ/V2H(P):
>   - RZ/T2H requires only 3 clocks instead of 7
>   - RZ/T2H supports 8 RX/TX queue pairs instead of 4
>   - RZ/T2H needs 2 reset controls with reset-names property, vs. a single
>     unnamed reset
>   - RZ/T2H has the split header feature enabled, while it is disabled on
>     RZ/V2H(P)
> 
> To accommodate these differences, introduce a new generic compatible
> string `renesas,rzt2h-gbeth`, used as a fallback for both RZ/T2H and
> RZ/N2H SoCs.
> 
> The DT schema is updated to validate the clocks, resets, reset-names,
> interrupts, and interrupt-names properties accordingly. Also extend
> `snps,dwmac.yaml` with the new `renesas,rzt2h-gbeth` compatible.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  .../bindings/net/renesas,rzv2h-gbeth.yaml     | 177 ++++++++++++++----
>  .../devicetree/bindings/net/snps,dwmac.yaml   |   1 +
>  2 files changed, 138 insertions(+), 40 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/renesas,rzv2h-gbeth.yaml b/Documentation/devicetree/bindings/net/renesas,rzv2h-gbeth.yaml
> index 23e39bcea96b..e01763389164 100644
> --- a/Documentation/devicetree/bindings/net/renesas,rzv2h-gbeth.yaml
> +++ b/Documentation/devicetree/bindings/net/renesas,rzv2h-gbeth.yaml
> @@ -17,63 +17,112 @@ select:
>            - renesas,r9a09g047-gbeth
>            - renesas,r9a09g056-gbeth
>            - renesas,r9a09g057-gbeth
> +          - renesas,r9a09g077-gbeth
> +          - renesas,r9a09g087-gbeth
>            - renesas,rzv2h-gbeth
>    required:
>      - compatible
>  
>  properties:
>    compatible:
> -    items:
> -      - enum:
> -          - renesas,r9a09g047-gbeth # RZ/G3E
> -          - renesas,r9a09g056-gbeth # RZ/V2N
> -          - renesas,r9a09g057-gbeth # RZ/V2H(P)
> -      - const: renesas,rzv2h-gbeth
> -      - const: snps,dwmac-5.20
> +    oneOf:
> +      - items:
> +          - enum:
> +              - renesas,r9a09g047-gbeth # RZ/G3E
> +              - renesas,r9a09g056-gbeth # RZ/V2N
> +              - renesas,r9a09g057-gbeth # RZ/V2H(P)
> +          - const: renesas,rzv2h-gbeth
> +          - const: snps,dwmac-5.20
> +
> +      - items:
> +          - enum:
> +              - renesas,r9a09g077-gbeth # RZ/T2H
> +              - renesas,r9a09g087-gbeth # RZ/N2H
> +          - const: renesas,rzt2h-gbeth
> +          - const: snps,dwmac-5.20
>  
>    reg:
>      maxItems: 1
>  
>    clocks:
> -    items:
> -      - description: CSR clock
> -      - description: AXI system clock
> -      - description: PTP clock
> -      - description: TX clock
> -      - description: RX clock
> -      - description: TX clock phase-shifted by 180 degrees
> -      - description: RX clock phase-shifted by 180 degrees
> +    oneOf:
> +      - items:
> +          - description: CSR clock
> +          - description: AXI system clock
> +          - description: PTP clock
> +          - description: TX clock
> +          - description: RX clock
> +          - description: TX clock phase-shifted by 180 degrees
> +          - description: RX clock phase-shifted by 180 degrees
> +

Drop blank line

> +      - items:
> +          - description: CSR clock
> +          - description: AXI system clock
> +          - description: TX clock
>  
>    clock-names:
> -    items:
> -      - const: stmmaceth
> -      - const: pclk
> -      - const: ptp_ref
> -      - const: tx
> -      - const: rx
> -      - const: tx-180
> -      - const: rx-180
> -
> -  interrupts:
> -    minItems: 11
> +    oneOf:
> +      - items:
> +          - const: stmmaceth
> +          - const: pclk
> +          - const: ptp_ref
> +          - const: tx
> +          - const: rx
> +          - const: tx-180
> +          - const: rx-180
> +

Drop blank line

> +      - items:
> +          - const: stmmaceth
> +          - const: pclk
> +          - const: tx
> +
>  

Just one blank line

>    interrupt-names:
> -    items:
> -      - const: macirq
> -      - const: eth_wake_irq
> -      - const: eth_lpi
> -      - const: rx-queue-0
> -      - const: rx-queue-1
> -      - const: rx-queue-2
> -      - const: rx-queue-3
> -      - const: tx-queue-0
> -      - const: tx-queue-1
> -      - const: tx-queue-2
> -      - const: tx-queue-3
> +    oneOf:
> +      - items:
> +          - const: macirq
> +          - const: eth_wake_irq
> +          - const: eth_lpi
> +          - const: rx-queue-0
> +          - const: rx-queue-1
> +          - const: rx-queue-2
> +          - const: rx-queue-3
> +          - const: tx-queue-0
> +          - const: tx-queue-1
> +          - const: tx-queue-2
> +          - const: tx-queue-3
> +
> +      - items:
> +          - const: macirq
> +          - const: eth_wake_irq
> +          - const: eth_lpi
> +          - const: rx-queue-0
> +          - const: rx-queue-1
> +          - const: rx-queue-2
> +          - const: rx-queue-3
> +          - const: rx-queue-4
> +          - const: rx-queue-5
> +          - const: rx-queue-6
> +          - const: rx-queue-7
> +          - const: tx-queue-0
> +          - const: tx-queue-1
> +          - const: tx-queue-2
> +          - const: tx-queue-3
> +          - const: tx-queue-4
> +          - const: tx-queue-5
> +          - const: tx-queue-6
> +          - const: tx-queue-7
>  
>    resets:
> -    items:
> -      - description: AXI power-on system reset
> +    oneOf:
> +      - items:
> +          - description: AXI power-on system reset
> +
> +      - items:
> +          - description: GMAC stmmaceth reset

That's the same as before, no?

> +          - description: AHB reset
> +
> +  reset-names: true

Does not look needed.

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
