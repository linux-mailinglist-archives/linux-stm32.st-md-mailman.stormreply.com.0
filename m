Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD869B42DD
	for <lists+linux-stm32@lfdr.de>; Tue, 29 Oct 2024 08:12:52 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B7654C71287;
	Tue, 29 Oct 2024 07:12:51 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E1B92C6DD9F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Oct 2024 07:12:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 6654BA414E2;
 Tue, 29 Oct 2024 07:10:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3AF6C4CECD;
 Tue, 29 Oct 2024 07:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730185962;
 bh=igfKIenU4dJBGawwsJvxkzCU1VOD+q+NRQ0rb5inxyw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oICyg007b5Gm5w8lag5yVt14qEuHdGfETw0y6VEKHn4w/2+3Xut+s17l7d0VbKdG5
 P+mUdW0xVf2EL4S3vtkjlyAp5avy27nY2x+JdhgoQTKP6cvMzN5zjbHQLJ0cUw74ln
 QnWDoP2fquZxcQ073e4poPypqnnYjw2HUHIXe5W+qDXrB6MShGJw+dDrfiPNKORvqJ
 1eTAeePVW9dQspVOjJ0Iq0SmDekLCynKm4wVOIvdaNCPUqDLpdpgoiTIZyaTmDE8vI
 BnUPa7sckEg5rItKMix1BIJGB+HS9sEzrOTCwD9pVIaV7YuJuvPjzej8EK1CPwGdIz
 WlSbXvlboWIiA==
Date: Tue, 29 Oct 2024 08:12:37 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
Message-ID: <erg5zzxgy45ucqv2nq3fkcv4sr7cxqzxz6ejdikafwfpgkkmse@7eigsyq245lu>
References: <20241028-upstream_s32cc_gmac-v4-0-03618f10e3e2@oss.nxp.com>
 <20241028-upstream_s32cc_gmac-v4-13-03618f10e3e2@oss.nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241028-upstream_s32cc_gmac-v4-13-03618f10e3e2@oss.nxp.com>
Cc: Andrew Lunn <andrew@lunn.ch>, NXP S32 Linux Team <s32@nxp.com>,
 Emil Renner Berthing <kernel@esmil.dk>, imx@lists.linux.dev,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Eric Dumazet <edumazet@google.com>,
 Iyappan Subramanian <iyappan@os.amperecomputing.com>,
 Quan Nguyen <quan@os.amperecomputing.com>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Jose Abreu <joabreu@synopsys.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Richard Cochran <richardcochran@gmail.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-arm-msm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Keyur Chudgar <keyur@os.amperecomputing.com>,
 Minda Chen <minda.chen@starfivetech.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 Nicolas Ferre <nicolas.ferre@microchip.com>, linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH v4 13/16] dt-bindings: net: Add DT
 bindings for DWMAC on NXP S32G/R SoCs
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

On Mon, Oct 28, 2024 at 09:24:55PM +0100, Jan Petrous (OSS) wrote:
> Add basic description for DWMAC ethernet IP on NXP S32G2xx, S32G3xx
> and S32R45 automotive series SoCs.
> 
> Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
> ---
>  .../devicetree/bindings/net/nxp,s32-dwmac.yaml     | 98 ++++++++++++++++++++++
>  .../devicetree/bindings/net/snps,dwmac.yaml        |  3 +
>  2 files changed, 101 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml b/Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml
> new file mode 100644
> index 000000000000..b11ba3bc4c52
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml
> @@ -0,0 +1,98 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright 2021-2024 NXP
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/nxp,s32-dwmac.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP S32G2xx/S32G3xx/S32R45 GMAC ethernet controller
> +
> +maintainers:
> +  - Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
> +
> +description:
> +  This device is a Synopsys DWC IP, integrated on NXP S32G/R SoCs.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - nxp,s32g2-dwmac
> +      - nxp,s32g3-dwmac
> +      - nxp,s32r-dwmac

Your driver says these are fully compatible, why this is not expressed
here?

> +
> +  reg:
> +    items:
> +      - description: Main GMAC registers
> +      - description: GMAC PHY mode control register
>

...

> +        mdio {
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +          compatible = "snps,dwmac-mdio";
> +
> +          phy0: ethernet-phy@0 {
> +              reg = <0>;

Messed indentation. Keep it consistent.

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
