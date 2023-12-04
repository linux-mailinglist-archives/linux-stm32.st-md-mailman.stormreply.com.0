Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F479803750
	for <lists+linux-stm32@lfdr.de>; Mon,  4 Dec 2023 15:45:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DFA56C6B46B;
	Mon,  4 Dec 2023 14:45:27 +0000 (UTC)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com
 [209.85.167.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9D691C6B469
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 Dec 2023 14:45:26 +0000 (UTC)
Received: by mail-oi1-f177.google.com with SMTP id
 5614622812f47-3b8b0ced0f4so965452b6e.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 04 Dec 2023 06:45:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701701125; x=1702305925;
 h=date:subject:message-id:references:in-reply-to:cc:to:from
 :mime-version:content-transfer-encoding:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=IStlrL3AAA++ujnW7Gs80LO4c80fIgknoPnSy4FHWTY=;
 b=UogT/qajpRq7T4lW7tfX43vKwFX5cfNkTM7CCd8uuX3a9wGomJhvfLetRn5hRz7hMS
 9sCi611D9tHw7iyWtsf2Z9FmGmpsm3MYiC5lWtarkyiSCoTifhozK1EBWnP97xVj1djE
 sLK+QMp5ewkeF6u94Ye2cqyad32muvMvchWymsRLVgu84uE9s7RYxSXDL5Bd8o3HATyg
 TEtbjmZLfLFHEQkMNOrU9naU8AOloYFPCF3FAIn0Mmi6lNNzIBksAWXdxAbeyZlXA6UF
 FfwiQEmbHYpQQ+egG/c/BCzrylWQMdrZ1TGNJ2Fdqz+U9+2fMWeDG21JeCtRQLW/5sTX
 vltw==
X-Gm-Message-State: AOJu0YyDCBM8V/TzTfZNrjAzSb+hmjK+PaEUQsk+28DIkR4BQtU/I5me
 2n4/+rhWGyVcGegxeJto9w==
X-Google-Smtp-Source: AGHT+IGP/nC2C30emuK8+P2XIGBs/Pp0+yyMdPBFSIlSkDXIrMUGupMhp1AlWT6VkWwdCJoaeK1dQg==
X-Received: by 2002:a54:4414:0:b0:3b8:b06b:9807 with SMTP id
 k20-20020a544414000000b003b8b06b9807mr1684905oiw.55.1701701125334; 
 Mon, 04 Dec 2023 06:45:25 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 z3-20020a056808048300b003b83c516e62sm1847817oid.51.2023.12.04.06.45.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Dec 2023 06:45:24 -0800 (PST)
Received: (nullmailer pid 1246097 invoked by uid 1000);
 Mon, 04 Dec 2023 14:45:23 -0000
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Suraj Jaiswal <quic_jsuraj@quicinc.com>
In-Reply-To: <2f215e2dabec345ec7f28e759c9463854959cced.1701695218.git.quic_jsuraj@quicinc.com>
References: <cover.1701695218.git.quic_jsuraj@quicinc.com>
 <2f215e2dabec345ec7f28e759c9463854959cced.1701695218.git.quic_jsuraj@quicinc.com>
Message-Id: <170170112344.1246081.15695671179356012271.robh@kernel.org>
Date: Mon, 04 Dec 2023 08:45:23 -0600
Cc: Eric Dumazet <edumazet@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, kernel@quicinc.com,
 Jose Abreu <joabreu@synopsys.com>, Andy Gross <agross@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Prasad Sodagudi <psodagud@quicinc.com>,
 Andrew Halaney <ahalaney@redhat.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Bhupesh Sharma <bhupesh.sharma@linaro.org>,
 linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 netdev@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next v3 1/3] dt-bindings: net: qcom,
 ethqos: add binding doc for safety IRQ for sa8775p
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


On Mon, 04 Dec 2023 18:56:15 +0530, Suraj Jaiswal wrote:
> Add binding doc for safety IRQ. The safety IRQ will be
> triggered for ECC, DPP, FSM error.
> 
> Signed-off-by: Suraj Jaiswal <quic_jsuraj@quicinc.com>
> ---
>  Documentation/devicetree/bindings/net/qcom,ethqos.yaml | 9 ++++++---
>  Documentation/devicetree/bindings/net/snps,dwmac.yaml  | 5 +++--
>  2 files changed, 9 insertions(+), 5 deletions(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/snps,dwmac.example.dtb: ethernet@e0800000: interrupt-names:2: 'eth_lpi' is not one of ['eth_wake_irq', 'safety']
	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.example.dtb: ethernet@16030000: interrupt-names:2: 'eth_lpi' is not one of ['eth_wake_irq', 'safety']
	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.example.dtb: ethernet@16030000: interrupt-names:2: 'eth_lpi' is not one of ['eth_wake_irq', 'safety']
	from schema $id: http://devicetree.org/schemas/net/starfive,jh7110-dwmac.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.example.dtb: ethernet@16030000: Unevaluated properties are not allowed ('mdio', 'phy-handle', 'phy-mode', 'rx-fifo-depth', 'snps,axi-config', 'snps,en-tx-lpi-clockgating', 'snps,fixed-burst', 'snps,force_thresh_dma_mode', 'snps,multicast-filter-bins', 'snps,no-pbl-x8', 'snps,perfect-filter-entries', 'snps,rxpbl', 'snps,tso', 'snps,txpbl', 'stmmac-axi-config', 'tx-fifo-depth' were unexpected)
	from schema $id: http://devicetree.org/schemas/net/starfive,jh7110-dwmac.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/2f215e2dabec345ec7f28e759c9463854959cced.1701695218.git.quic_jsuraj@quicinc.com

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
