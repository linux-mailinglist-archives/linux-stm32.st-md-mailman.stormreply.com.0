Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F3C4C72BCCB
	for <lists+linux-stm32@lfdr.de>; Mon, 12 Jun 2023 11:35:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AEB8BC6A60F;
	Mon, 12 Jun 2023 09:35:56 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C64C5C06F81
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Jun 2023 09:35:55 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-4f61d79b0f2so4912373e87.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Jun 2023 02:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686562555; x=1689154555;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EVRsoBw2mYIKseG/0Qd8GC6oHBJlAAcz7DAhIfqh+7s=;
 b=Rwr9kl19lrfXZO0AeqyotRMwrSFgHnX2AoP9H6w4oq+N6tErLHtVV+lzHKFYdeULvb
 0pmtApmxu/AUW/D4E+4XdehvlfPdV8hcOHKPHv6o37u4RTUzH7lrEQO6A6RrJA4LYSTe
 cuerQiT4YbiV5uOghU2r35CX6IQAn0XlgVO84KYd+2mU1hLnzNIEtKPudu4D2NKk9DOC
 tXKGnDD35U+C60x+tSU/qUHuRH9UI3YphmR8XP8r0xRKbFH1o2Fo+8syvQtxj8Tqp66k
 vW8fcMPyDnIddHxQ8A7AVPkk+qmP55MTnznHaLlLWG7lpCu53xpBBjSugjQFeU9dB4jH
 7Apw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686562555; x=1689154555;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EVRsoBw2mYIKseG/0Qd8GC6oHBJlAAcz7DAhIfqh+7s=;
 b=auX303uUtXyFXlO5FV2XMcL9HT9/oLA7kQxF31eRNHHwsI3MHvM9U1uPXM6VNRYpkq
 YGErT3NYI3tfX3bMOWWGKUyuzu8eYYec6xzwTdsYzVkV1ntdzJBP1byMD/LQv3gfnMn7
 20+Zu+MdKlaIZGLTw01ouNYItCceIjo54o8VZgjCH6ruAqobUNZmdhuv+6pmNOqcYE9r
 c1oO7OFc1hjMJhsTYbQcyb/SrtWWz15O/gtlvL4J1RJKCD7kIhvQcgy9HoGeYJv8nHxP
 zZEIpSBD6vFR49cQd2bMWkSq3b/OVnIPOgKiyEje2zbFy8EnT7+BFclo9naQsrnDt9zS
 Mopg==
X-Gm-Message-State: AC+VfDyWBsnlPdc9sDL1F/24e+bq0qh6eg6D57CWCLYXndukp0xQRo0W
 xNLrnYtFNPHGWTN9V/2dXMvC6A==
X-Google-Smtp-Source: ACHHUZ4XIHc31aI7Yz7vxkZ7gA16gu5nwoiLxWZswPLz9iLHvgp3AlnZy1KH+hfVh/JFNYj+qnFqdw==
X-Received: by 2002:a05:6512:1ce:b0:4f6:1154:deba with SMTP id
 f14-20020a05651201ce00b004f61154debamr4261756lfp.65.1686562554980; 
 Mon, 12 Jun 2023 02:35:54 -0700 (PDT)
Received: from [192.168.1.101] (abyj190.neoplus.adsl.tpnet.pl. [83.9.29.190])
 by smtp.gmail.com with ESMTPSA id
 i9-20020ac25229000000b004f2b6a203aasm1386474lfl.224.2023.06.12.02.35.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jun 2023 02:35:54 -0700 (PDT)
Message-ID: <9562db04-ef2e-b32e-9fd6-1396798f28e5@linaro.org>
Date: Mon, 12 Jun 2023 11:35:52 +0200
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
References: <20230612092355.87937-1-brgl@bgdev.pl>
 <20230612092355.87937-23-brgl@bgdev.pl>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230612092355.87937-23-brgl@bgdev.pl>
Cc: devicetree@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 22/26] arm64: dts: qcom: sa8775p-ride: add
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



On 12.06.2023 11:23, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Add the internal SGMII/SerDes PHY node for sa8775p platforms.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> index b130136acffe..0e59000a0c82 100644
> --- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> @@ -1837,6 +1837,15 @@ adreno_smmu: iommu@3da0000 {
>  				     <GIC_SPI 687 IRQ_TYPE_LEVEL_HIGH>;
>  		};
>  
> +		serdes_phy: phy@8901000 {
> +			compatible = "qcom,sa8775p-dwmac-sgmii-phy";
> +			reg = <0 0x08901000 0 0xe10>;
The usage of 0 is inconsistent with 0x0 everywhere else

Konrad
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
