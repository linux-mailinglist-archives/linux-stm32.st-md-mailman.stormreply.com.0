Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF487F5F15
	for <lists+linux-stm32@lfdr.de>; Thu, 23 Nov 2023 13:36:50 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7809BC6B479;
	Thu, 23 Nov 2023 12:36:50 +0000 (UTC)
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com
 [209.85.166.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CC57FC64110
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Nov 2023 12:36:48 +0000 (UTC)
Received: by mail-il1-f171.google.com with SMTP id
 e9e14a558f8ab-35b2144232bso2450185ab.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Nov 2023 04:36:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700743007; x=1701347807;
 h=date:subject:message-id:references:in-reply-to:cc:to:from
 :mime-version:content-transfer-encoding:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=JVG1KNeHJ3/qRli7u6E6D3tolaMDNcU5rbGWAgFoWgU=;
 b=olt2jaYBHREHDxW3E+5bNSsdJYIVm1NHE2McVcsUOewuTHF/6SBTDkFWQ20Mo9+SS3
 YWXGEeDvVugeguIw4jia2V8qdkZ5qsukcgAwEupOUeUiM8q/y1kLbtJPMq/613RS2WM8
 aa9qZRPyg9sETwsULvLE4s2UjlW+qHeWXoCKtbqPAc0L/xKNbaTzbDkJrJk+kuQdEq7B
 u6Rlh+7b1wfqIBrfviRDqj3Tixd/uK5Whdrt5LYJ5EpdCNskYfMW3zlWB76/dVfvNVkP
 HcS1aKdD9Txu+siT8zwat/WqCbP87yhHK80Jr5NV+e92ZmhQ8vn1FP+I8s6HXmm2DWmr
 49zQ==
X-Gm-Message-State: AOJu0YxA7VL0tQbk9V6vVyKifD8K+Xe9q+grVNJ76RSbWVd6ZPE+SixO
 G8U69UxPj+PRahOPoR+sDw==
X-Google-Smtp-Source: AGHT+IEafPH9MCVT+IeUUQWmAa4cHPiJx8xmvLFQH0AMy6TyixDtRRrpfnRNcq4x10e9HLwEtQ3bAQ==
X-Received: by 2002:a05:6e02:216d:b0:35a:fa7f:36b with SMTP id
 s13-20020a056e02216d00b0035afa7f036bmr5583940ilv.9.1700743007574; 
 Thu, 23 Nov 2023 04:36:47 -0800 (PST)
Received: from herring.priv ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id
 cn10-20020a056e02388a00b0035b01686da6sm323031ilb.58.2023.11.23.04.36.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Nov 2023 04:36:46 -0800 (PST)
Received: (nullmailer pid 853092 invoked by uid 1000);
 Thu, 23 Nov 2023 12:36:44 -0000
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Suraj Jaiswal <quic_jsuraj@quicinc.com>
In-Reply-To: <ff458955a24c0cb4ba41158b8b53fbef00c8237d.1700737841.git.quic_jsuraj@quicinc.com>
References: <cover.1700737841.git.quic_jsuraj@quicinc.com>
 <ff458955a24c0cb4ba41158b8b53fbef00c8237d.1700737841.git.quic_jsuraj@quicinc.com>
Message-Id: <170074300457.853076.1315477036902827786.robh@kernel.org>
Date: Thu, 23 Nov 2023 05:36:44 -0700
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
 ethqos: add binding doc for fault IRQ for sa8775p
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


On Thu, 23 Nov 2023 17:23:20 +0530, Suraj Jaiswal wrote:
> Add binding doc for fault IRQ. The fault IRQ will be
> triggered for ECC, DPP, FSM error.
> 
> Signed-off-by: Suraj Jaiswal <quic_jsuraj@quicinc.com>
> ---
>  Documentation/devicetree/bindings/net/qcom,ethqos.yaml | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/qcom,ethqos.example.dtb: ethernet@7a80000: interrupt-names:2: 'eth_lpi' was expected
	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/qcom,ethqos.example.dtb: ethernet@7a80000: Unevaluated properties are not allowed ('mdio', 'phy-handle', 'phy-mode', 'rx-fifo-depth', 'snps,reset-active-low', 'snps,reset-delays-us', 'snps,reset-gpio', 'snps,tso', 'tx-fifo-depth' were unexpected)
	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/ff458955a24c0cb4ba41158b8b53fbef00c8237d.1700737841.git.quic_jsuraj@quicinc.com

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
