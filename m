Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 23ECFC9F3C7
	for <lists+linux-stm32@lfdr.de>; Wed, 03 Dec 2025 15:10:03 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D3C62C5C842;
	Wed,  3 Dec 2025 14:10:02 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1B0C0C5A4E4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Dec 2025 14:10:01 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-5957f5e2755so509769e87.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 03 Dec 2025 06:10:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1764771000; x=1765375800;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zlE4w0TT3D3/y+5QAYjJUU63j0m4KIAcH19JgK8nOY8=;
 b=uq4kMt4Pf1i3DUz2wGvgEz+/XvIrMuQOAee9HFE2JUlRYq9zdZtxWzeAwCdBLRksEb
 TZ/9XvW4NBqS8OhylGhbKz+UMh9OPzRUeACJZlWeOk9zwCPpyvauWdz2eZ+fzjyn/2/H
 1Mx3mshuMTcFAkfNtR4rze3OcO/fLxSCeuclLjxOmjcN/FZKJVMY2KsW+xTWhigZKErI
 APR4vc/Jr82VdOzSaTA42kn6DpaqiFdL44DxIux4SSZ9BZoyW4NKebrc78m7JySNaTOS
 1G1meP9bhB+UwUz8zQaQkoNJ6gquzkfTDwYWAFHBbUht9LJPj7QWO6yJi/74IQ/D89eQ
 GgNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764771000; x=1765375800;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zlE4w0TT3D3/y+5QAYjJUU63j0m4KIAcH19JgK8nOY8=;
 b=PFOord03Aip3VQPnOXv2u5ACI4uhxbkRuS13v4tLuvouE0sfW/Ko2LszH+IbHoZ8Bu
 VXLmSvGQrv+F4Jf3CR1QvOX5blCXxnJooD94+G6mQL9JrZVLZG8uqavQW4FtfkM3QKu9
 NKnvH86XpOn5XO8KNTv0V9A9beZLZbRbutnZRXcss93naUGuto4QMbuO47rInIZVoKR6
 DLM/sGVxqRB+NbHY5gAuKlez7Tq7/8SUUf/UrEHjzBBzqk5t3wzeD1ISkCm7Nv1v/BpU
 5ouao59392HrcOi+rIC9WGgtBUzWnvoebG+41lCFf010XcdJCN/gAtVrjlWQiC6jmdsW
 yRpg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXR5HCpxT9FlPyspyINoknKGLoztL/1+huMdQNUhT1uX87qBcu5fjQrm/+oAEUipG5s7JZXt30NRazIeA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyL7CQtzsLqoccL//nGW0PWyBLx75NFJm/vhCRMW/AdR6sPPou/
 Dan35T5WRmBBPnukPObvXoEzwPXNvsTq0prCAVKNT+ZVUvNXykRWhyrwoDA/b9uaGjs=
X-Gm-Gg: ASbGnctRXK5/9rZ9lJRAKuiVIQa27pmdVzCX9L9a7mc+FY3SOC4EP2iiorrJ0qayy91
 SmjfwfDI9LNCG2sBKBINTEP7knfto1Pc03Xw6z3NgTeYsZMXpIC4gVCCYOCMedtAYz/d9ZUo0Bq
 8P4jmQ/OX5PLBNmgMLLVOStDEiWnSURqbmIWLht23kmBS1LB1DpvtykSdY8J5QSAEN3Jv1xyTWk
 hcQL2/0lk+DXkzY6LGxMSv7tFg59LzJKRHCerNsP+vOlW4C7LxZOexeol2Gt6o6eJ3adJEYR830
 UOceACnQkfvqtyIu5/Gxl0At6vsAG+wI6EtgxDJ+pyhyJqcdN4GxxDGzUac12ePNScDEoSOwXqR
 UqHc80mDaeVdX3UAT4eS1jiEgRosWhE2qU14yQUSYyimNuPtZ8levg+0flaK89qG1XcSoKI7dIs
 BcWpddUZT3PjHYDH8cWSEU1JPB7ivTNxLRNlidze8CV7oWEMhmjg7UcbO8Cse81+esX5iuIVNER
 0YW
X-Google-Smtp-Source: AGHT+IE/1g55u7Pjo0hsbfs22DU9N430W8TGHsu9DROS2CQlieKXqdQ1amIEvDBBVY1Jc8SO9ZLe7A==
X-Received: by 2002:a05:6512:3b29:b0:595:8313:3bc8 with SMTP id
 2adb3069b0e04-597d4afa757mr357765e87.1.1764771000047; 
 Wed, 03 Dec 2025 06:10:00 -0800 (PST)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi.
 [91.159.24.186]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-596c0eb7112sm5453432e87.16.2025.12.03.06.09.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Dec 2025 06:09:59 -0800 (PST)
Message-ID: <7e22e126-cb08-4bc2-bad6-a895a4e35a8d@linaro.org>
Date: Wed, 3 Dec 2025 16:09:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Taniya Das <taniya.das@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jagadeesh Kona <quic_jkona@quicinc.com>
References: <20251202-sm8750_camcc-v1-0-b3f7ef6723f1@oss.qualcomm.com>
 <20251202-sm8750_camcc-v1-2-b3f7ef6723f1@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20251202-sm8750_camcc-v1-2-b3f7ef6723f1@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
 Imran Shaik <imran.shaik@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/3] dt-bindings: clock: qcom: Add camera
 clock controller for SM8750 SoC
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

Hi Taniya.

On 12/2/25 12:26, Taniya Das wrote:
> Add device tree bindings for the camera clock controller on
> Qualcomm SM8750 platform. The camera clock controller is split between
> camcc and cambist. The cambist controls the mclks of the camera clock
> controller.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>   .../bindings/clock/qcom,sm8450-camcc.yaml          |   5 +
>   .../dt-bindings/clock/qcom,sm8750-cambistmclkcc.h  |  30 ++++
>   include/dt-bindings/clock/qcom,sm8750-camcc.h      | 151 +++++++++++++++++++++
>   3 files changed, 186 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
> index c1e06f39431e68a3cd2f6c2dba84be2a3c143bb1..8e3baba5270b384eb03a68b4e47785e6c91ec6f7 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
> @@ -9,6 +9,7 @@ title: Qualcomm Camera Clock & Reset Controller on SM8450
>   maintainers:
>     - Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>     - Jagadeesh Kona <quic_jkona@quicinc.com>
> +  - Taniya Das <taniya.das@oss.qualcomm.com>
>   
>   description: |
>     Qualcomm camera clock control module provides the clocks, resets and power
> @@ -18,6 +19,8 @@ description: |
>       include/dt-bindings/clock/qcom,sm8450-camcc.h
>       include/dt-bindings/clock/qcom,sm8550-camcc.h
>       include/dt-bindings/clock/qcom,sm8650-camcc.h
> +    include/dt-bindings/clock/qcom,sm8750-cambistmclkcc.h
> +    include/dt-bindings/clock/qcom,sm8750-camcc.h
>   
>   properties:
>     compatible:
> @@ -26,6 +29,8 @@ properties:
>         - qcom,sm8475-camcc
>         - qcom,sm8550-camcc
>         - qcom,sm8650-camcc
> +      - qcom,sm8750-cambistmclkcc

Due to the very distinct nature of this new clock controller, I suppose
it does not inherit most of the properties of other CAMCC clocks, and
therefore it should be described in a separate dt binding documentation file.

Looking at the list of macro definitions from a new header file, a noticeable
remark is that this new clock controller is neither a reset controller nor
a power domain controller.

> +      - qcom,sm8750-camcc
>   
>     clocks:
>       items:
> diff --git a/include/dt-bindings/clock/qcom,sm8750-cambistmclkcc.h b/include/dt-bindings/clock/qcom,sm8750-cambistmclkcc.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..51615bee307fd9e7f81f7e5c1662535093dd8b55
> --- /dev/null
> +++ b/include/dt-bindings/clock/qcom,sm8750-cambistmclkcc.h
> @@ -0,0 +1,30 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#ifndef _DT_BINDINGS_CLK_QCOM_CAM_BIST_MCLK_CC_SM8750_H
> +#define _DT_BINDINGS_CLK_QCOM_CAM_BIST_MCLK_CC_SM8750_H
> +
> +/* CAM_BIST_MCLK_CC clocks */
> +#define CAM_BIST_MCLK_CC_MCLK0_CLK				0
> +#define CAM_BIST_MCLK_CC_MCLK0_CLK_SRC				1
> +#define CAM_BIST_MCLK_CC_MCLK1_CLK				2
> +#define CAM_BIST_MCLK_CC_MCLK1_CLK_SRC				3
> +#define CAM_BIST_MCLK_CC_MCLK2_CLK				4
> +#define CAM_BIST_MCLK_CC_MCLK2_CLK_SRC				5
> +#define CAM_BIST_MCLK_CC_MCLK3_CLK				6
> +#define CAM_BIST_MCLK_CC_MCLK3_CLK_SRC				7
> +#define CAM_BIST_MCLK_CC_MCLK4_CLK				8
> +#define CAM_BIST_MCLK_CC_MCLK4_CLK_SRC				9
> +#define CAM_BIST_MCLK_CC_MCLK5_CLK				10
> +#define CAM_BIST_MCLK_CC_MCLK5_CLK_SRC				11
> +#define CAM_BIST_MCLK_CC_MCLK6_CLK				12
> +#define CAM_BIST_MCLK_CC_MCLK6_CLK_SRC				13
> +#define CAM_BIST_MCLK_CC_MCLK7_CLK				14
> +#define CAM_BIST_MCLK_CC_MCLK7_CLK_SRC				15
> +#define CAM_BIST_MCLK_CC_PLL0					16
> +#define CAM_BIST_MCLK_CC_SLEEP_CLK				17
> +#define CAM_BIST_MCLK_CC_SLEEP_CLK_SRC				18
> +
> +#endif
> diff --git a/include/dt-bindings/clock/qcom,sm8750-camcc.h b/include/dt-bindings/clock/qcom,sm8750-camcc.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..dae788247afe896ef812bef716897c6cf80df2bb
> --- /dev/null
> +++ b/include/dt-bindings/clock/qcom,sm8750-camcc.h
> @@ -0,0 +1,151 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#ifndef _DT_BINDINGS_CLK_QCOM_CAM_CC_SM8750_H
> +#define _DT_BINDINGS_CLK_QCOM_CAM_CC_SM8750_H
> +
> +/* CAM_CC clocks */
> +#define CAM_CC_CAM_TOP_AHB_CLK					0
> +#define CAM_CC_CAM_TOP_FAST_AHB_CLK				1
> +#define CAM_CC_CAMNOC_DCD_XO_CLK				2
> +#define CAM_CC_CAMNOC_NRT_AXI_CLK				3
> +#define CAM_CC_CAMNOC_NRT_CRE_CLK				4
> +#define CAM_CC_CAMNOC_NRT_IPE_NPS_CLK				5
> +#define CAM_CC_CAMNOC_NRT_OFE_ANCHOR_CLK			6
> +#define CAM_CC_CAMNOC_NRT_OFE_HDR_CLK				7
> +#define CAM_CC_CAMNOC_NRT_OFE_MAIN_CLK				8
> +#define CAM_CC_CAMNOC_RT_AXI_CLK				9
> +#define CAM_CC_CAMNOC_RT_AXI_CLK_SRC				10
> +#define CAM_CC_CAMNOC_RT_IFE_LITE_CLK				11
> +#define CAM_CC_CAMNOC_RT_TFE_0_BAYER_CLK			12
> +#define CAM_CC_CAMNOC_RT_TFE_0_MAIN_CLK				13
> +#define CAM_CC_CAMNOC_RT_TFE_1_BAYER_CLK			14
> +#define CAM_CC_CAMNOC_RT_TFE_1_MAIN_CLK				15
> +#define CAM_CC_CAMNOC_RT_TFE_2_BAYER_CLK			16
> +#define CAM_CC_CAMNOC_RT_TFE_2_MAIN_CLK				17
> +#define CAM_CC_CAMNOC_XO_CLK					18
> +#define CAM_CC_CCI_0_CLK					19
> +#define CAM_CC_CCI_0_CLK_SRC					20
> +#define CAM_CC_CCI_1_CLK					21
> +#define CAM_CC_CCI_1_CLK_SRC					22
> +#define CAM_CC_CCI_2_CLK					23
> +#define CAM_CC_CCI_2_CLK_SRC					24
> +#define CAM_CC_CORE_AHB_CLK					25
> +#define CAM_CC_CPHY_RX_CLK_SRC					26
> +#define CAM_CC_CRE_AHB_CLK					27
> +#define CAM_CC_CRE_CLK						28
> +#define CAM_CC_CRE_CLK_SRC					29
> +#define CAM_CC_CSI0PHYTIMER_CLK					30
> +#define CAM_CC_CSI0PHYTIMER_CLK_SRC				31
> +#define CAM_CC_CSI1PHYTIMER_CLK					32
> +#define CAM_CC_CSI1PHYTIMER_CLK_SRC				33
> +#define CAM_CC_CSI2PHYTIMER_CLK					34
> +#define CAM_CC_CSI2PHYTIMER_CLK_SRC				35
> +#define CAM_CC_CSI3PHYTIMER_CLK					36
> +#define CAM_CC_CSI3PHYTIMER_CLK_SRC				37
> +#define CAM_CC_CSI4PHYTIMER_CLK					38
> +#define CAM_CC_CSI4PHYTIMER_CLK_SRC				39
> +#define CAM_CC_CSI5PHYTIMER_CLK					40
> +#define CAM_CC_CSI5PHYTIMER_CLK_SRC				41
> +#define CAM_CC_CSID_CLK						42
> +#define CAM_CC_CSID_CLK_SRC					43
> +#define CAM_CC_CSID_CSIPHY_RX_CLK				44
> +#define CAM_CC_CSIPHY0_CLK					45
> +#define CAM_CC_CSIPHY1_CLK					46
> +#define CAM_CC_CSIPHY2_CLK					47
> +#define CAM_CC_CSIPHY3_CLK					48
> +#define CAM_CC_CSIPHY4_CLK					49
> +#define CAM_CC_CSIPHY5_CLK					50
> +#define CAM_CC_DRV_AHB_CLK					51
> +#define CAM_CC_DRV_XO_CLK					52
> +#define CAM_CC_FAST_AHB_CLK_SRC					53
> +#define CAM_CC_GDSC_CLK						54
> +#define CAM_CC_ICP_0_AHB_CLK					55
> +#define CAM_CC_ICP_0_CLK					56
> +#define CAM_CC_ICP_0_CLK_SRC					57
> +#define CAM_CC_ICP_1_AHB_CLK					58
> +#define CAM_CC_ICP_1_CLK					59
> +#define CAM_CC_ICP_1_CLK_SRC					60
> +#define CAM_CC_IFE_LITE_AHB_CLK					61
> +#define CAM_CC_IFE_LITE_CLK					62
> +#define CAM_CC_IFE_LITE_CLK_SRC					63
> +#define CAM_CC_IFE_LITE_CPHY_RX_CLK				64
> +#define CAM_CC_IFE_LITE_CSID_CLK				65
> +#define CAM_CC_IFE_LITE_CSID_CLK_SRC				66
> +#define CAM_CC_IPE_NPS_AHB_CLK					67
> +#define CAM_CC_IPE_NPS_CLK					68
> +#define CAM_CC_IPE_NPS_CLK_SRC					69
> +#define CAM_CC_IPE_NPS_FAST_AHB_CLK				70
> +#define CAM_CC_IPE_PPS_CLK					71
> +#define CAM_CC_IPE_PPS_FAST_AHB_CLK				72
> +#define CAM_CC_JPEG_0_CLK					73
> +#define CAM_CC_JPEG_1_CLK					74
> +#define CAM_CC_JPEG_CLK_SRC					75
> +#define CAM_CC_OFE_AHB_CLK					76
> +#define CAM_CC_OFE_ANCHOR_CLK					77
> +#define CAM_CC_OFE_ANCHOR_FAST_AHB_CLK				78
> +#define CAM_CC_OFE_CLK_SRC					79
> +#define CAM_CC_OFE_HDR_CLK					80
> +#define CAM_CC_OFE_HDR_FAST_AHB_CLK				81
> +#define CAM_CC_OFE_MAIN_CLK					82
> +#define CAM_CC_OFE_MAIN_FAST_AHB_CLK				83
> +#define CAM_CC_PLL0						84
> +#define CAM_CC_PLL0_OUT_EVEN					85
> +#define CAM_CC_PLL0_OUT_ODD					86
> +#define CAM_CC_PLL1						87
> +#define CAM_CC_PLL1_OUT_EVEN					88
> +#define CAM_CC_PLL2						89
> +#define CAM_CC_PLL2_OUT_EVEN					90
> +#define CAM_CC_PLL3						91
> +#define CAM_CC_PLL3_OUT_EVEN					92
> +#define CAM_CC_PLL4						93
> +#define CAM_CC_PLL4_OUT_EVEN					94
> +#define CAM_CC_PLL5						95
> +#define CAM_CC_PLL5_OUT_EVEN					96
> +#define CAM_CC_PLL6						97
> +#define CAM_CC_PLL6_OUT_EVEN					98
> +#define CAM_CC_PLL6_OUT_ODD					99
> +#define CAM_CC_QDSS_DEBUG_CLK					100
> +#define CAM_CC_QDSS_DEBUG_CLK_SRC				101
> +#define CAM_CC_QDSS_DEBUG_XO_CLK				102
> +#define CAM_CC_SLEEP_CLK					103
> +#define CAM_CC_SLEEP_CLK_SRC					104
> +#define CAM_CC_SLOW_AHB_CLK_SRC					105
> +#define CAM_CC_TFE_0_BAYER_CLK					106
> +#define CAM_CC_TFE_0_BAYER_FAST_AHB_CLK				107
> +#define CAM_CC_TFE_0_CLK_SRC					108
> +#define CAM_CC_TFE_0_MAIN_CLK					109
> +#define CAM_CC_TFE_0_MAIN_FAST_AHB_CLK				110
> +#define CAM_CC_TFE_1_BAYER_CLK					111
> +#define CAM_CC_TFE_1_BAYER_FAST_AHB_CLK				112
> +#define CAM_CC_TFE_1_CLK_SRC					113
> +#define CAM_CC_TFE_1_MAIN_CLK					114
> +#define CAM_CC_TFE_1_MAIN_FAST_AHB_CLK				115
> +#define CAM_CC_TFE_2_BAYER_CLK					116
> +#define CAM_CC_TFE_2_BAYER_FAST_AHB_CLK				117
> +#define CAM_CC_TFE_2_CLK_SRC					118
> +#define CAM_CC_TFE_2_MAIN_CLK					119
> +#define CAM_CC_TFE_2_MAIN_FAST_AHB_CLK				120
> +#define CAM_CC_XO_CLK_SRC					121
> +
> +/* CAM_CC power domains */
> +#define CAM_CC_TITAN_TOP_GDSC					0
> +#define CAM_CC_IPE_0_GDSC					1
> +#define CAM_CC_OFE_GDSC						2
> +#define CAM_CC_TFE_0_GDSC					3
> +#define CAM_CC_TFE_1_GDSC					4
> +#define CAM_CC_TFE_2_GDSC					5
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

-- 
Best wishes,
Vladimir
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
