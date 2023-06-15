Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E6D73194E
	for <lists+linux-stm32@lfdr.de>; Thu, 15 Jun 2023 14:56:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4F3EDC65E58;
	Thu, 15 Jun 2023 12:56:53 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B3A7DC04B10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Jun 2023 12:56:52 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-4f64fb05a8aso10538025e87.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Jun 2023 05:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686833812; x=1689425812;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=v1CbTBRn8vQDvPf6Z2biUED1bJGUXq/a80Hy0PH+rSA=;
 b=pIzCccIMIRGK2q25DpBRdjMSE9rF2EraF12WiZ8h6N7uHRGusZ2WBw7HdRHqX2CeL5
 EKul/KBbvQJkKxXtT093+Wj1U/LHPnCAmqvmia0QrGEdbHfA+Zss1Abfir1yj56IH/9o
 uOGSulxNPYsuDFKg+RHzEHMoS48IYece+jmC5VW4+cnXP4VxKmfwBOr++lmyPuey5vXe
 Pq6ZGehysyoWw4MAO8BKFLiDiFqbT/PklBljqRPuA896y5RlHwx4Tm5/0eWdIxhu0TtZ
 ubzHiTGNXQ4XpK81GBliesQcRh1r6v4SjeNXQbHNPM0IOGA+tRleTV9kXy14TroVf1Lt
 d4gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686833812; x=1689425812;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=v1CbTBRn8vQDvPf6Z2biUED1bJGUXq/a80Hy0PH+rSA=;
 b=Pg4g0s5aoj+IchegbHa6CcflX9RJe9NJgn/WOacZZkK4w1D6HKblVKv/6rqtBJf6VG
 y/+yjs196D7FEQcYE4evRfgu1rwTmGafIUKj2LVwfp67o5CvA5cvovrLbmvSe+J56vIr
 4wcbpDLM4xgM0f2/4hCIVZHPbmI39WKAMaLU0KKrV0u4vJworf/KWsaQ8E2AGQy+Vkg1
 R11It5ACHMBKMiiwHdc+EmtYVYm4dgtPFpuJU4BmFALHRqoSWkDRzzEcFi3M8H1w7wso
 kBZ3chfMrb9J9z/CmM48QE1VS7T/mCmcMopcT4jJwS8mH5WlCLiN2YYBUZsmBs0kBr4z
 pRTw==
X-Gm-Message-State: AC+VfDxx9g9+GFkwyUoFTCxwUxfbkGGowggacx9U1SPwgEP1A67bAH7U
 XqS8cXt4LUgAFYqZoEtJrM9gzg==
X-Google-Smtp-Source: ACHHUZ4idKi9MKj9dACNe9eMwOfmRi1oqlCWD4/JIb33nDqyZCNa4kpiBxTMJ7GeUtyUjAUAiC/Yng==
X-Received: by 2002:a05:6512:48b:b0:4ef:ed49:fcc2 with SMTP id
 v11-20020a056512048b00b004efed49fcc2mr11392533lfq.26.1686833811790; 
 Thu, 15 Jun 2023 05:56:51 -0700 (PDT)
Received: from [192.168.1.101] (abyj190.neoplus.adsl.tpnet.pl. [83.9.29.190])
 by smtp.gmail.com with ESMTPSA id
 l9-20020ac25549000000b004f63739e2f1sm2559845lfk.255.2023.06.15.05.56.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Jun 2023 05:56:51 -0700 (PDT)
Message-ID: <18103637-c191-9b8f-7983-d0b1591f9024@linaro.org>
Date: Thu, 15 Jun 2023 14:56:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Content-Language: en-US
To: Bartosz Golaszewski <brgl@bgdev.pl>, Vinod Koul <vkoul@kernel.org>,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>
References: <20230615121419.175862-1-brgl@bgdev.pl>
 <20230615121419.175862-20-brgl@bgdev.pl>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230615121419.175862-20-brgl@bgdev.pl>
Cc: devicetree@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 19/23] arm64: dts: qcom: sa8775p: add
 the SGMII PHY node
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

On 15.06.2023 14:14, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Add the internal SGMII/SerDes PHY node for sa8775p platforms.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> index b130136acffe..b6d95813c98c 100644
> --- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> @@ -1837,6 +1837,15 @@ adreno_smmu: iommu@3da0000 {
>  				     <GIC_SPI 687 IRQ_TYPE_LEVEL_HIGH>;
>  		};
>  
> +		serdes0: phy@8901000 {
> +			compatible = "qcom,sa8775p-dwmac-sgmii-phy";
> +			reg = <0x0 0x08901000 0x0 0xe10>;
> +			clocks = <&gcc GCC_SGMI_CLKREF_EN>;
> +			clock-names = "sgmi_ref";
> +			#phy-cells = <0>;
> +			status = "disabled";
> +		};
> +
>  		pdc: interrupt-controller@b220000 {
>  			compatible = "qcom,sa8775p-pdc", "qcom,pdc";
>  			reg = <0x0 0x0b220000 0x0 0x30000>,
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
