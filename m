Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 298D4BCE26A
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Oct 2025 19:50:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7EB3FC36B3A;
	Fri, 10 Oct 2025 17:50:04 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 26C90C36B30
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Oct 2025 17:50:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 102CD6270D;
 Fri, 10 Oct 2025 17:50:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92498C116C6;
 Fri, 10 Oct 2025 17:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760118601;
 bh=dMh8GBD4EAIQyzaGwyEd2ZtNzCl7oE20APdIRhgCkgM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RYSntg7krxRyForxuUI1r3H41ecE3Iq3vwl3eTPg581hTVTOgAfGnum8VXzSmfr4V
 jSvMhAAxNj/TpSoXZeZHOZ9DVDgiV0ffpEWSqTy/2QTQ5pBgZdjCJBYcuP4SPK1boA
 FXB32PHfjCXbPgw36axYILpbGouI9kslTYsgBLu39Tpgt4cx0CCo3Gq+T58FduLVzY
 PULLq5xKcNDSXDwj/41sy8SuiljheHTAyEEaUWn5hT65z8yV8/9IrGRvWL3nhMQlxA
 /LQrzxJY8z8N21wD2JceFIeuuTW64mbNgM+UovCvMsLtFeVXTVLxCbKq4+iIdw+c0H
 DjsfedyCQPJ7A==
Date: Fri, 10 Oct 2025 12:49:59 -0500
From: Rob Herring <robh@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Message-ID: <20251010174959.GA502249-robh@kernel.org>
References: <20251008-qcom-sa8255p-emac-v2-0-92bc29309fce@linaro.org>
 <20251008-qcom-sa8255p-emac-v2-1-92bc29309fce@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251008-qcom-sa8255p-emac-v2-1-92bc29309fce@linaro.org>
Cc: Eric Dumazet <edumazet@google.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Konrad Dybcio <konradybcio@kernel.org>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org, Richard Cochran <richardcochran@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, Vinod Koul <vkoul@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH v2 1/8] dt-bindings: net: qcom: document
 the ethqos device for SCMI-based systems
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

On Wed, Oct 08, 2025 at 10:17:48AM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Describe the firmware-managed variant of the QCom DesignWare MAC. As the
> properties here differ a lot from the HLOS-managed variant, lets put it
> in a separate file.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  .../devicetree/bindings/net/qcom,ethqos-scmi.yaml  | 101 +++++++++++++++++++++
>  .../devicetree/bindings/net/snps,dwmac.yaml        |   5 +-
>  MAINTAINERS                                        |   1 +
>  3 files changed, 106 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/qcom,ethqos-scmi.yaml b/Documentation/devicetree/bindings/net/qcom,ethqos-scmi.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..0a9cc789085e8bc94d44adc9da982b66071d1e79
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/qcom,ethqos-scmi.yaml
> @@ -0,0 +1,101 @@
> +# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/qcom,ethqos-scmi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Ethernet ETHQOS device (firmware managed)
> +
> +maintainers:
> +  - Bjorn Andersson <andersson@kernel.org>
> +  - Konrad Dybcio <konradybcio@kernel.org>
> +  - Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> +
> +description:
> +  dwmmac based Qualcomm ethernet devices which support Gigabit
> +  ethernet (version v2.3.0 and onwards) with clocks, interconnects, etc.
> +  managed by firmware
> +
> +allOf:
> +  - $ref: snps,dwmac.yaml#
> +
> +properties:
> +  compatible:
> +    const: qcom,sa8255p-ethqos
> +
> +  reg:
> +    maxItems: 2
> +
> +  reg-names:
> +    items:
> +      - const: stmmaceth
> +      - const: rgmii
> +
> +  interrupts:
> +    items:
> +      - description: Combined signal for various interrupt events
> +      - description: The interrupt that occurs when HW safety error triggered
> +
> +  interrupt-names:
> +    items:
> +      - const: macirq
> +      - const: sfty
> +
> +  power-domains:
> +    minItems: 3
> +
> +  power-domain-names:
> +    items:
> +      - const: power_core
> +      - const: power_mdio
> +      - const: perf_serdes

I would drop power and perf. I don't want to know about the abusing of 
the power-domain binding.

Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
