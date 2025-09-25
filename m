Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C278FB9E14B
	for <lists+linux-stm32@lfdr.de>; Thu, 25 Sep 2025 10:39:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 66D0EC36B2D;
	Thu, 25 Sep 2025 08:39:33 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5B3B4C36B29
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Sep 2025 08:39:32 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-46e37d10f3eso1201215e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Sep 2025 01:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758789572; x=1759394372;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oAHXmMCopf4Jez0mjNqGUbs2LoOHhw0W13KbFKKEtaA=;
 b=f130edLZtzf4VuBTgA6Jb+H6UkwRxHEZMqrFkl9K3RQuieahRShtGG5LUrbWDJbX66
 EOzB1/5fHQCUfmkpx6MLgoyyuoZVa9u5OR/XW3DERc5xFWSulFK1S7Edoye87QSMwlIh
 ugEG/5swePClNwGxcsMPhK7d17NkihzQniYM0JB0HcqWn8lOrNJnhea5A4HBrGMilEq5
 zwwn9Cea420hD1/la31H2Pi6jtmeMH6VwZv7/vKhUNM35OW+VIy9YVc5DaY9UGKy87N+
 jiD077n/PHyyndhV7zilp0zyXAp0nz6hQkXGT4pZ5+9wUSNkFK5+oXAbh62F7FMUpLHo
 kwQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758789572; x=1759394372;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oAHXmMCopf4Jez0mjNqGUbs2LoOHhw0W13KbFKKEtaA=;
 b=Yzh7SjtT/oTcUqrFO9EBMRqbuHWm8gmVzDXMs8O1rYzEAGu+draw+BsD66CMacbwPH
 a9pPWcMYVCGmvwoqsGVwdw42O2H1fI7rxVSzE+glfYCGnlh7eLW7RbtR8NsBGWVk866Y
 hVDIYBxLnjeP8Hrkd2IMzRMRGtVutAqXgmtEHH7po0WEo1WpahmFxwhqdmmW6+1KrLQZ
 gkwOPhr0aewF71aFeZiZWX/xYl9lyKIpW2Xdgv+1lgXyL64ZBfTZYS4N8Vu++G4lCj88
 41PYQWCq40IPf0Fy8XFBRS91Nt1XeY+DPs/3G+zcWLYdIfxDjmyXosldNN4IOHji9JtU
 Xw6g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvBwFGcc4dfwBWftIuJCE++vNoUAWW3kt6R1asNUmHcotVRnZ2YXj2lNCuyyrdjutQjRJrcLsgh4VeSw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxBBQCnDT9lZkDtaLOXXY4MI16apxi5sKDmVNfeqJMuOfqShtca
 qQQUrjEOjWNabY2vpVZCQsGaBQZ/9UfifzuFd2NsEH6jB+plkbNp9tu7jCHEM+HPqzQ=
X-Gm-Gg: ASbGnctWJkvcaWcT/UhWewgztYNvtFrtusF1R3PsgtuB65PT1RdRNeKN+cAyJ10wwXt
 FCj6GeUaVgGMk2jpJDIm0FTaImlQaP9kgnRqXFnY0q0OyfJGH00huybNFlD5yt1RqC/kTUY+sSB
 nrbUFj6fmNGNVQo74vgET505J6N/El0DbemwHMYt54BDaQtcVjnwMqofA6Lu0OQArpEXCKaVMIn
 YsRIqtHLNrqUJPvQR9yhkQ26DVTj8874nmrzcFyzSHv8jn5ot/0mGU8darNb9BZz6hm6LXYORx5
 DcizYEepbiO8zRMVDcucgAf9CxLinvk4813rOTsPdU0Fxb87K9Q+AP1y+2uUCvPEzNsIYvcsh8s
 Kqg4CgCG9QzStH5ah14inhxXQ4317lUccfb/d/WOdqQO+uEqGa/2yJ6cDBrrV40TsAmUqoynMDc
 mTDO3olJXYUys2sM63/cX5
X-Google-Smtp-Source: AGHT+IFO+YOTIwteVZwP9Fc69KqqvgKYIbM3VEI4cOHYQaY7rdoM1kZxNKOGAy+tDNAzlp1GEJGQ6g==
X-Received: by 2002:a05:6000:2586:b0:3ec:ea73:a91e with SMTP id
 ffacd0b85a97d-40e498b77bfmr2326378f8f.12.1758789571553; 
 Thu, 25 Sep 2025 01:39:31 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e32b4f336sm13972145e9.0.2025.09.25.01.39.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Sep 2025 01:39:30 -0700 (PDT)
Message-ID: <4315205b-5320-4a8f-a707-45f5eb35ae51@linaro.org>
Date: Thu, 25 Sep 2025 09:39:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Jagadeesh Kona <quic_jkona@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Taniya Das <taniya.das@oss.qualcomm.com>,
 Konrad Dybcio <konradybcio@kernel.org>
References: <20250924-knp-mmclk-v1-0-d7ea96b4784a@oss.qualcomm.com>
 <20250924-knp-mmclk-v1-3-d7ea96b4784a@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250924-knp-mmclk-v1-3-d7ea96b4784a@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 tingwei.zhang@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 trilok.soni@oss.qualcomm.com
Subject: Re: [Linux-stm32] [PATCH 3/9] dt-bindings: clock: qcom: Add support
 for CAMCC for Kaanapali
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 25/09/2025 00:56, Jingyi Wang wrote:
> From: Taniya Das <taniya.das@oss.qualcomm.com>
> 
> Update the compatible and the bindings for CAMCC support on Kaanapali
> SoC.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>   .../bindings/clock/qcom,sm8450-camcc.yaml          |   8 +-
>   .../clock/qcom,kaanapali-cambistmclkcc.h           |  33 +++++
>   include/dt-bindings/clock/qcom,kaanapali-camcc.h   | 147 +++++++++++++++++++++
>   3 files changed, 187 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
> index dbfcc399f10b..54b04ecf67c1 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
> @@ -12,9 +12,11 @@ maintainers:
>   
>   description: |
>     Qualcomm camera clock control module provides the clocks, resets and power
> -  domains on SM8450.
> +  domains on SM8450 SoCs.

This change is not about adding Kaanapali.

>   
>     See also:
> +    include/dt-bindings/clock/qcom,kaanapali-camcc.h
> +    include/dt-bindings/clock/qcom,kaanapali-cambistmclkcc.h

What's so special about Kanaanapli that it needs two headers for this ?


>       include/dt-bindings/clock/qcom,sm8450-camcc.h
>       include/dt-bindings/clock/qcom,sm8550-camcc.h
>       include/dt-bindings/clock/qcom,sm8650-camcc.h
> @@ -22,6 +24,8 @@ description: |
>   properties:
>     compatible:
>       enum:
> +      - qcom,kaanapali-cambistmclkcc
> +      - qcom,kaanapali-camcc
>         - qcom,sm8450-camcc
>         - qcom,sm8475-camcc
>         - qcom,sm8550-camcc
> @@ -63,6 +67,8 @@ allOf:
>           compatible:
>             contains:
>               enum:
> +              - qcom,kaanapali-cambistmclkcc
> +              - qcom,kaanapali-camcc
>                 - qcom,sm8450-camcc
>                 - qcom,sm8550-camcc
>       then:
> diff --git a/include/dt-bindings/clock/qcom,kaanapali-cambistmclkcc.h b/include/dt-bindings/clock/qcom,kaanapali-cambistmclkcc.h
> new file mode 100644
> index 000000000000..ddb083b5289e
> --- /dev/null
> +++ b/include/dt-bindings/clock/qcom,kaanapali-cambistmclkcc.h
> @@ -0,0 +1,33 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#ifndef _DT_BINDINGS_CLK_QCOM_CAM_BIST_MCLK_CC_KAANAPALI_H
> +#define _DT_BINDINGS_CLK_QCOM_CAM_BIST_MCLK_CC_KAANAPALI_H
> +
> +/* CAM_BIST_MCLK_CC clocks */
> +#define CAM_BIST_MCLK_CC_DEBUG_CLK				0
> +#define CAM_BIST_MCLK_CC_DEBUG_DIV_CLK_SRC			1
> +#define CAM_BIST_MCLK_CC_MCLK0_CLK				2
> +#define CAM_BIST_MCLK_CC_MCLK0_CLK_SRC				3
> +#define CAM_BIST_MCLK_CC_MCLK1_CLK				4
> +#define CAM_BIST_MCLK_CC_MCLK1_CLK_SRC				5
> +#define CAM_BIST_MCLK_CC_MCLK2_CLK				6
> +#define CAM_BIST_MCLK_CC_MCLK2_CLK_SRC				7
> +#define CAM_BIST_MCLK_CC_MCLK3_CLK				8
> +#define CAM_BIST_MCLK_CC_MCLK3_CLK_SRC				9
> +#define CAM_BIST_MCLK_CC_MCLK4_CLK				10
> +#define CAM_BIST_MCLK_CC_MCLK4_CLK_SRC				11
> +#define CAM_BIST_MCLK_CC_MCLK5_CLK				12
> +#define CAM_BIST_MCLK_CC_MCLK5_CLK_SRC				13
> +#define CAM_BIST_MCLK_CC_MCLK6_CLK				14
> +#define CAM_BIST_MCLK_CC_MCLK6_CLK_SRC				15
> +#define CAM_BIST_MCLK_CC_MCLK7_CLK				16
> +#define CAM_BIST_MCLK_CC_MCLK7_CLK_SRC				17
> +#define CAM_BIST_MCLK_CC_PLL0					18
> +#define CAM_BIST_MCLK_CC_PLL_TEST_CLK				19
> +#define CAM_BIST_MCLK_CC_PLL_TEST_DIV_CLK_SRC			20
> +#define CAM_BIST_MCLK_CC_SLEEP_CLK				21
> +
> +#endif

BIST == Built In Self Test ?

Can this not just be put into one camcc header ?

> diff --git a/include/dt-bindings/clock/qcom,kaanapali-camcc.h b/include/dt-bindings/clock/qcom,kaanapali-camcc.h
> new file mode 100644
> index 000000000000..58835136b356
> --- /dev/null
> +++ b/include/dt-bindings/clock/qcom,kaanapali-camcc.h
> @@ -0,0 +1,147 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#ifndef _DT_BINDINGS_CLK_QCOM_CAM_CC_KAANAPALI_H
> +#define _DT_BINDINGS_CLK_QCOM_CAM_CC_KAANAPALI_H
> +
> +/* CAM_CC clocks */
> +#define CAM_CC_CAM_TOP_AHB_CLK					0
> +#define CAM_CC_CAM_TOP_FAST_AHB_CLK				1
> +#define CAM_CC_CAMNOC_DCD_XO_CLK				2
> +#define CAM_CC_CAMNOC_NRT_AXI_CLK				3
> +#define CAM_CC_CAMNOC_NRT_CRE_CLK				4
> +#define CAM_CC_CAMNOC_NRT_IPE_NPS_CLK				5
> +#define CAM_CC_CAMNOC_NRT_OFE_MAIN_CLK				6
> +#define CAM_CC_CAMNOC_RT_AXI_CLK				7
> +#define CAM_CC_CAMNOC_RT_AXI_CLK_SRC				8
> +#define CAM_CC_CAMNOC_RT_IFE_LITE_CLK				9
> +#define CAM_CC_CAMNOC_RT_TFE_0_MAIN_CLK				10
> +#define CAM_CC_CAMNOC_RT_TFE_1_MAIN_CLK				11
> +#define CAM_CC_CAMNOC_RT_TFE_2_MAIN_CLK				12
> +#define CAM_CC_CAMNOC_XO_CLK					13
> +#define CAM_CC_CCI_0_CLK					14
> +#define CAM_CC_CCI_0_CLK_SRC					15
> +#define CAM_CC_CCI_1_CLK					16
> +#define CAM_CC_CCI_1_CLK_SRC					17
> +#define CAM_CC_CCI_2_CLK					18
> +#define CAM_CC_CCI_2_CLK_SRC					19
> +#define CAM_CC_CORE_AHB_CLK					20
> +#define CAM_CC_CPHY_RX_CLK_SRC					21
> +#define CAM_CC_CRE_AHB_CLK					22
> +#define CAM_CC_CRE_CLK						23
> +#define CAM_CC_CRE_CLK_SRC					24
> +#define CAM_CC_CSI0PHYTIMER_CLK					25
> +#define CAM_CC_CSI0PHYTIMER_CLK_SRC				26
> +#define CAM_CC_CSI1PHYTIMER_CLK					27
> +#define CAM_CC_CSI1PHYTIMER_CLK_SRC				28
> +#define CAM_CC_CSI2PHYTIMER_CLK					29
> +#define CAM_CC_CSI2PHYTIMER_CLK_SRC				30
> +#define CAM_CC_CSI3PHYTIMER_CLK					31
> +#define CAM_CC_CSI3PHYTIMER_CLK_SRC				32
> +#define CAM_CC_CSI4PHYTIMER_CLK					33
> +#define CAM_CC_CSI4PHYTIMER_CLK_SRC				34
> +#define CAM_CC_CSI5PHYTIMER_CLK					35
> +#define CAM_CC_CSI5PHYTIMER_CLK_SRC				36
> +#define CAM_CC_CSID_CLK						37
> +#define CAM_CC_CSID_CLK_SRC					38
> +#define CAM_CC_CSID_CSIPHY_RX_CLK				39
> +#define CAM_CC_CSIPHY0_CLK					40
> +#define CAM_CC_CSIPHY1_CLK					41
> +#define CAM_CC_CSIPHY2_CLK					42
> +#define CAM_CC_CSIPHY3_CLK					43
> +#define CAM_CC_CSIPHY4_CLK					44
> +#define CAM_CC_CSIPHY5_CLK					45
> +#define CAM_CC_DRV_AHB_CLK					46
> +#define CAM_CC_DRV_XO_CLK					47
> +#define CAM_CC_FAST_AHB_CLK_SRC					48
> +#define CAM_CC_GDSC_CLK						49
> +#define CAM_CC_ICP_0_AHB_CLK					50
> +#define CAM_CC_ICP_0_CLK					51
> +#define CAM_CC_ICP_0_CLK_SRC					52
> +#define CAM_CC_ICP_1_AHB_CLK					53
> +#define CAM_CC_ICP_1_CLK					54
> +#define CAM_CC_ICP_1_CLK_SRC					55
> +#define CAM_CC_IFE_LITE_AHB_CLK					56
> +#define CAM_CC_IFE_LITE_CLK					57
> +#define CAM_CC_IFE_LITE_CLK_SRC					58
> +#define CAM_CC_IFE_LITE_CPHY_RX_CLK				59
> +#define CAM_CC_IFE_LITE_CSID_CLK				60
> +#define CAM_CC_IFE_LITE_CSID_CLK_SRC				61
> +#define CAM_CC_IPE_NPS_AHB_CLK					62
> +#define CAM_CC_IPE_NPS_CLK					63
> +#define CAM_CC_IPE_NPS_CLK_SRC					64
> +#define CAM_CC_IPE_NPS_FAST_AHB_CLK				65
> +#define CAM_CC_IPE_PPS_CLK					66
> +#define CAM_CC_IPE_PPS_FAST_AHB_CLK				67
> +#define CAM_CC_JPEG_CLK						68
> +#define CAM_CC_JPEG_CLK_SRC					69
> +#define CAM_CC_OFE_AHB_CLK					70
> +#define CAM_CC_OFE_ANCHOR_CLK					71
> +#define CAM_CC_OFE_ANCHOR_FAST_AHB_CLK				72
> +#define CAM_CC_OFE_CLK_SRC					73
> +#define CAM_CC_OFE_HDR_CLK					74
> +#define CAM_CC_OFE_HDR_FAST_AHB_CLK				75
> +#define CAM_CC_OFE_MAIN_CLK					76
> +#define CAM_CC_OFE_MAIN_FAST_AHB_CLK				77
> +#define CAM_CC_PLL0						78
> +#define CAM_CC_PLL0_OUT_EVEN					79
> +#define CAM_CC_PLL0_OUT_ODD					80
> +#define CAM_CC_PLL1						81
> +#define CAM_CC_PLL1_OUT_EVEN					82
> +#define CAM_CC_PLL2						83
> +#define CAM_CC_PLL2_OUT_EVEN					84
> +#define CAM_CC_PLL3						85
> +#define CAM_CC_PLL3_OUT_EVEN					86
> +#define CAM_CC_PLL4						87
> +#define CAM_CC_PLL4_OUT_EVEN					88
> +#define CAM_CC_PLL5						89
> +#define CAM_CC_PLL5_OUT_EVEN					90
> +#define CAM_CC_PLL6						91
> +#define CAM_CC_PLL6_OUT_EVEN					92
> +#define CAM_CC_PLL6_OUT_ODD					93
> +#define CAM_CC_PLL7						94
> +#define CAM_CC_PLL7_OUT_EVEN					95
> +#define CAM_CC_QDSS_DEBUG_CLK					96
> +#define CAM_CC_QDSS_DEBUG_CLK_SRC				97
> +#define CAM_CC_QDSS_DEBUG_XO_CLK				98
> +#define CAM_CC_SLEEP_CLK					99
> +#define CAM_CC_SLOW_AHB_CLK_SRC					100
> +#define CAM_CC_TFE_0_BAYER_CLK					101
> +#define CAM_CC_TFE_0_BAYER_FAST_AHB_CLK				102
> +#define CAM_CC_TFE_0_CLK_SRC					103
> +#define CAM_CC_TFE_0_MAIN_CLK					104
> +#define CAM_CC_TFE_0_MAIN_FAST_AHB_CLK				105
> +#define CAM_CC_TFE_1_BAYER_CLK					106
> +#define CAM_CC_TFE_1_BAYER_FAST_AHB_CLK				107
> +#define CAM_CC_TFE_1_CLK_SRC					108
> +#define CAM_CC_TFE_1_MAIN_CLK					109
> +#define CAM_CC_TFE_1_MAIN_FAST_AHB_CLK				110
> +#define CAM_CC_TFE_2_BAYER_CLK					111
> +#define CAM_CC_TFE_2_BAYER_FAST_AHB_CLK				112
> +#define CAM_CC_TFE_2_CLK_SRC					113
> +#define CAM_CC_TFE_2_MAIN_CLK					114
> +#define CAM_CC_TFE_2_MAIN_FAST_AHB_CLK				115
> +#define CAM_CC_TRACENOC_TPDM_1_CMB_CLK				116
> +#define CAM_CC_XO_CLK_SRC					117
> +
> +/* CAM_CC power domains */
> +#define CAM_CC_IPE_0_GDSC					0
> +#define CAM_CC_OFE_GDSC						1
> +#define CAM_CC_TFE_0_GDSC					2
> +#define CAM_CC_TFE_1_GDSC					3
> +#define CAM_CC_TFE_2_GDSC					4
> +#define CAM_CC_TITAN_TOP_GDSC					5
> +
> +/* CAM_CC resets */
> +#define CAM_CC_DRV_BCR						0
> +#define CAM_CC_ICP_BCR						1
> +#define CAM_CC_IPE_0_BCR					2
> +#define CAM_CC_OFE_BCR						3
> +#define CAM_CC_QDSS_DEBUG_BCR					4
> +#define CAM_CC_TFE_0_BCR					5
> +#define CAM_CC_TFE_1_BCR					6
> +#define CAM_CC_TFE_2_BCR					7
> +
> +#endif
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
