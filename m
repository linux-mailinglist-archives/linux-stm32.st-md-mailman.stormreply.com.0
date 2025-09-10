Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D650CB5180C
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Sep 2025 15:38:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 20FEAC36B3F;
	Wed, 10 Sep 2025 13:38:37 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6231DC36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Sep 2025 13:38:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 41E7E601FA;
 Wed, 10 Sep 2025 13:38:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8CFEC4CEF0;
 Wed, 10 Sep 2025 13:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757511514;
 bh=a040r4eM2yhSWfXdg58fzda5OZ7oGB0lS6HGqRV+5gQ=;
 h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
 b=HPtWYkdOO487YPncRRA10m+CcLPt0C/2M4I2IfM/F1LoV9p4Y8+e3F53OFIrEtm5A
 uM2We3Zb9Gnr9/gicHy/kKJ1gBkfBDyaUfEmxugkONkn0XFDdSUwvULqtP4PcFjW15
 7d3NweIe78LkdubkgleqTHGnGCtw11S+/vR4d5YB/OaoRBjsApNJNHG15ZOtU6NT2d
 Le/7x0gAo5DMzMNtgyh/vhIZzcVVGpEgKwgSDfSJyoPmUDQuzi4fseAda+XHDC4Bpq
 zy4ylspGlOINlNJLyaSHpAxAVtj2oijUQSOcHMSE44GPKzQlygoDVhLjt9+nxwPOv6
 dLcaeOUn5K4pQ==
Date: Wed, 10 Sep 2025 08:38:34 -0500
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <20250910-qcom-sa8255p-emac-v1-2-32a79cf1e668@linaro.org>
References: <20250910-qcom-sa8255p-emac-v1-0-32a79cf1e668@linaro.org>
 <20250910-qcom-sa8255p-emac-v1-2-32a79cf1e668@linaro.org>
Message-Id: <175751081352.3667912.274641295097354228.robh@kernel.org>
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
Subject: Re: [Linux-stm32] [PATCH 2/9] dt-bindings: net: qcom: document the
 ethqos device for SCMI-based systems
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


On Wed, 10 Sep 2025 10:07:39 +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Describe the firmware-managed variant of the QCom DesignWare MAC. As the
> properties here differ a lot from the HLOS-managed variant, lets put it
> in a separate file.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  .../devicetree/bindings/net/qcom,ethqos-scmi.yaml  | 101 +++++++++++++++++++++
>  .../devicetree/bindings/net/snps,dwmac.yaml        |   4 +-
>  MAINTAINERS                                        |   1 +
>  3 files changed, 105 insertions(+), 1 deletion(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/renesas,rzn1-gmac.example.dtb: ethernet@44000000 (renesas,r9a06g032-gmac): power-domains: [[4294967295]] is too short
	from schema $id: http://devicetree.org/schemas/net/renesas,rzn1-gmac.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/renesas,rzn1-gmac.example.dtb: ethernet@44000000 (renesas,r9a06g032-gmac): Unevaluated properties are not allowed ('clock-names', 'clocks', 'interrupt-names', 'interrupts', 'phy-mode', 'power-domains', 'reg', 'rx-fifo-depth', 'snps,multicast-filter-bins', 'snps,perfect-filter-entries', 'tx-fifo-depth' were unexpected)
	from schema $id: http://devicetree.org/schemas/net/renesas,rzn1-gmac.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/renesas,rzn1-gmac.example.dtb: ethernet@44000000 (renesas,r9a06g032-gmac): power-domains: [[4294967295]] is too short
	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/mediatek-dwmac.example.dtb: ethernet@1101c000 (mediatek,mt2712-gmac): power-domains: [[4294967295, 4]] is too short
	from schema $id: http://devicetree.org/schemas/net/mediatek-dwmac.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/mediatek-dwmac.example.dtb: ethernet@1101c000 (mediatek,mt2712-gmac): Unevaluated properties are not allowed ('mac-address', 'phy-mode', 'reg', 'snps,reset-delays-us', 'snps,reset-gpio', 'snps,rxpbl', 'snps,txpbl' were unexpected)
	from schema $id: http://devicetree.org/schemas/net/mediatek-dwmac.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/mediatek-dwmac.example.dtb: ethernet@1101c000 (mediatek,mt2712-gmac): power-domains: [[4294967295, 4]] is too short
	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250910-qcom-sa8255p-emac-v1-2-32a79cf1e668@linaro.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
