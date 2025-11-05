Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 88215C347C0
	for <lists+linux-stm32@lfdr.de>; Wed, 05 Nov 2025 09:33:33 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 345F3C35E2B;
	Wed,  5 Nov 2025 08:33:33 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 31FB9C36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Nov 2025 08:33:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 6693C43A22;
 Wed,  5 Nov 2025 08:33:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CA45C4CEF8;
 Wed,  5 Nov 2025 08:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762331610;
 bh=N9DVJZLHg/ikq7JcKb017+GXdHTNHUl1swp5I6YFwKg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FWRtcGLQVHMZgFcfCcC2Ue5biDzICOqxbsTH9uRs3nHuk4V9OMogHP0jGb51Z/R1/
 jJxkWdC8AHsbMqgtuTPgrjWZOlEwVVOpsHrziXpskkAkKCA1xrAzVVi07M2Ld7UyTP
 VJIqW87HIEtASx13s4C1VM/y6/X7on3YXHn7gwZzVxCFO470mCBBKSCNdU9LIk5Cyc
 1XM/bvkZNvlVnWDHYXq4thAk5z0FFtDTWqf6wOzceEzFJa6Pqtp/I85AxdCnbThUg5
 dL17TQbIUFUeUW15dIGkbb9zPwlX5ZkCMOZjeOPxSyuT7pqNhvIJS5W4nOvExPXANQ
 M6yn12bRbQ/3Q==
Date: Wed, 5 Nov 2025 09:33:27 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Message-ID: <20251105-fat-aromatic-nightingale-1ef8ac@kuoka>
References: <20251104-qcom-sa8255p-emac-v4-0-f76660087cea@linaro.org>
 <20251104-qcom-sa8255p-emac-v4-1-f76660087cea@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251104-qcom-sa8255p-emac-v4-1-f76660087cea@linaro.org>
Cc: Drew Fustini <fustini@kernel.org>, s32@nxp.com,
 Heiko Stuebner <heiko@sntech.de>, Geert Uytterhoeven <geert+renesas@glider.be>,
 imx@lists.linux.dev, Frank Li <Frank.Li@nxp.com>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Swathi K S <swathi.ks@samsung.com>, Eric Dumazet <edumazet@google.com>,
 netdev@vger.kernel.org, Guo Ren <guoren@kernel.org>,
 Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
 linux-amlogic@lists.infradead.org, Shawn Guo <shawnguo@kernel.org>,
 linux-riscv@lists.infradead.org, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Rob Herring <robh@kernel.org>, Drew Fustini <dfustini@tenstorrent.com>,
 Shuang Liang <liangshuang@eswincomputing.com>,
 Samuel Holland <samuel@sholland.org>, sophgo@lists.linux.dev,
 Kevin Hilman <khilman@baylibre.com>, Chen Wang <unicorn_wang@outlook.com>,
 Magnus Damm <magnus.damm@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-rockchip@lists.infradead.org, Jose Abreu <joabreu@synopsys.com>,
 Clark Wang <xiaoning.wang@nxp.com>, Linux Team <linux-imx@nxp.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Konrad Dybcio <konradybcio@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Emil Renner Berthing <kernel@esmil.dk>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Samin Guo <samin.guo@starfivetech.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Richard Cochran <richardcochran@gmail.com>,
 David Wu <david.wu@rock-chips.com>, Jan Petrous <jan.petrous@oss.nxp.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Maxime Ripard <mripard@kernel.org>, Minda Chen <minda.chen@starfivetech.com>,
 "G. Jaya Kumaran" <vineetha.g.jaya.kumaran@intel.com>,
 Shangjuan Wei <weishangjuan@eswincomputing.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Chen-Yu Tsai <wens@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-sunxi@lists.linux.dev,
 linux-mips@vger.kernel.org, Keguang Zhang <keguang.zhang@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Romain Gantois <romain.gantois@bootlin.com>,
 Zhi Li <lizhi2@eswincomputing.com>, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 Vinod Koul <vkoul@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Inochi Amaoto <inochiama@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthew Gerlach <matthew.gerlach@altera.com>,
 "David S. Miller" <davem@davemloft.net>, Fu Wei <wefu@redhat.com>
Subject: Re: [Linux-stm32] [PATCH v4 1/8] dt-bindings: net: qcom: document
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

On Tue, Nov 04, 2025 at 02:08:52PM +0100, Bartosz Golaszewski wrote:
> diff --git a/Documentation/devicetree/bindings/net/qcom,ethqos-scmi.yaml b/Documentation/devicetree/bindings/net/qcom,ethqos-scmi.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..ff70d785d326f39a8fe5698759c56ab2cb7f7eef
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/qcom,ethqos-scmi.yaml
> @@ -0,0 +1,97 @@
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

You should have here both constraints - min and maxItems. Current code
works fine, but usually we want it to be explicit.

I found two more nits which I did not notice earlier, so when fixing
above please also:

1. Please name the file following compatible, so:
qcom,sa8255p-ethqos.yaml
(unless this was already discussed...)

> +        snps,tso;
> +        snps,pbl = <32>;
> +        rx-fifo-depth = <16384>;
> +        tx-fifo-depth = <16384>;
> +
> +        phy-handle = <&ethernet_phy>;
> +        phy-mode = "2500base-x";
> +
> +        snps,mtl-rx-config = <&mtl_rx_setup1>;
> +        snps,mtl-tx-config = <&mtl_tx_setup1>;
> +
> +        power-domains = <&scmi8_pd 0>, <&scmi8_pd 1>, <&scmi8_dvfs 0>;
> +        power-domain-names = "core", "mdio","serdes";

2. Missing space after ,


Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
