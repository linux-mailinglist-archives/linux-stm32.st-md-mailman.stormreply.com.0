Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C8894B9E2D6
	for <lists+linux-stm32@lfdr.de>; Thu, 25 Sep 2025 11:02:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8A112C3F949;
	Thu, 25 Sep 2025 09:02:19 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7C80BC3F93B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Sep 2025 09:02:18 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-3ecde0be34eso1079448f8f.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Sep 2025 02:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758790938; x=1759395738;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5Qe3xfGFmIVMF6CqhJOdRE5h4PSOi9dIsttGyzx+Zh0=;
 b=FZ7VIb4+3DhmzJD7UFYyiBpaSKvSiotIItOv6uqndLD9ME8pu80XQCmL8aFlUaK7fH
 J/hYGzksoZGrHtApNZXfKn/cLRcvH7LFNtw/8tzOS74RiQscps/pIeJBQwPq05cF5YKr
 6dsS3h/J7pgZESd2TQVfn1PILvE30unZO7qvgnmn2cnTHri5zYRRCm0alRqCeA9r5jLH
 H2uMRxS6TyyrTWSOYPssHy4IZr0V6SIoY6SBRsmkykUSm0/z1lq0Wvqcc5A0puq6A82j
 QGHn4g78jxKIUf+jo1zAXJTn3OVZ3MamrJtE30BjbxACD572jFJu0TQred9RJF9+qZiO
 IZVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758790938; x=1759395738;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5Qe3xfGFmIVMF6CqhJOdRE5h4PSOi9dIsttGyzx+Zh0=;
 b=jwZMR9N1gzXtRUutH77PK31eFT7sFrAki0jb1goGHsLQE4aQaM8ZZWx4RRJfus1zLn
 XBmaEYFrYXR4nU4fy3R8ZMQkyM99nF1ZFEI5Lul88/pDPEEaX62D42jAOMBQAmZwW3Ih
 eFVfqxB2be8dbabMuYHakJTmAnw3wj9WUC0RYkTF2U+FyeoHXnDe7ad/psFJjayXCizK
 jnvE1JZcCLonxBFwzyd8WgcvBv88qayDyR+qMeQh8lLQrKAI2DZd2WkVJRRlweZxckiR
 w0RDIZ2K5OKrXNZok6QvShwenUfABI+Wzb39BXjWVvCKEIkPDBACpfOuR69LGwtGXJMp
 hIHA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVAMVGP/y6L/YMEKORcMLhBIe4bidctm9oiplG8hVhjP+nvuxsOz9b3EanAspNl9hXB023X851xMT169Q==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzR+3WZ+RDlIGg8sD/XdzH2gCkXnppsiYKgwpXguYHYRUNpbPHL
 hL/fl7X5yznwsT/TrG/AYJM1AFA4LuUFfsgLXFsRTcoyS/nkvPsoGbypTfDdmhHByrI=
X-Gm-Gg: ASbGncuRL/+ULwxCTsQg3CKzDloMZvPzehFF9CjY2+60xmZBqJlTno+BiWYGKZA/MXF
 eVcsl4vJ7utXE8BbG3IjssvDiDX+R6b9XsegBAAk10UL4KVfS6el7C3fvrNfK0unV2tEp3OUJLx
 AccjqSrdC/PoZowA2FfsbZ+XwKFGGDMGNMjLprcqPvIvkT3HtUrf2WaP1zwlL3FAKXE4deSMG3G
 +ILoJ6s4dZAGjIVMXVccwdYqZgtmrPPZRCEMfp5CO1vknqlX0jaRazs5ntI3yQ253+M9iKMhL0w
 YcQThnmICdzfpsa6PEpOtgzDl4c4JclA/ls26Uw5LE1UVxelc3tI8HwuuK48sPsYkjipwxr2e7H
 SUIR3vPMkRP3wrGv5TMBCwPUPn3L+nFc0shJqPSptzisLzMVuakT2iwpyelcrVS5mB/NF7/AhUw
 6rVvWPEKpnMCBSyU4B5b+T
X-Google-Smtp-Source: AGHT+IG6omy3mi4l5IjwhwiD+yQndxiCA+tBSpwYG7hEz4IaSuBeLRkN2eEbLT+qy6PzJRqtHh6D9g==
X-Received: by 2002:a05:6000:2dc1:b0:3d0:e221:892e with SMTP id
 ffacd0b85a97d-40f6617670dmr1826060f8f.27.1758790937794; 
 Thu, 25 Sep 2025 02:02:17 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-40fb985e080sm2143861f8f.24.2025.09.25.02.02.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Sep 2025 02:02:17 -0700 (PDT)
Message-ID: <69e8c15d-108e-4832-849e-a23c7ddfe625@linaro.org>
Date: Thu, 25 Sep 2025 10:02:15 +0100
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
 <20250924-knp-mmclk-v1-4-d7ea96b4784a@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250924-knp-mmclk-v1-4-d7ea96b4784a@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 tingwei.zhang@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 trilok.soni@oss.qualcomm.com
Subject: Re: [Linux-stm32] [PATCH 4/9] dt-bindings: clock: qcom: Add
 Kaanapali video clock controller
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
> Add device tree bindings for the video clock controller on Qualcomm
> Kaanapali SoC.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>   .../bindings/clock/qcom,sm8450-videocc.yaml        |  3 ++
>   include/dt-bindings/clock/qcom,kaanapali-videocc.h | 58 ++++++++++++++++++++++
>   2 files changed, 61 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
> index b31bd8335529..e6beebd6a36e 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
> @@ -15,6 +15,7 @@ description: |
>     domains on SM8450.
>   
>     See also:
> +    include/dt-bindings/clock/qcom,kaanapali-videocc.h
>       include/dt-bindings/clock/qcom,sm8450-videocc.h
>       include/dt-bindings/clock/qcom,sm8650-videocc.h
>       include/dt-bindings/clock/qcom,sm8750-videocc.h
> @@ -22,6 +23,7 @@ description: |
>   properties:
>     compatible:
>       enum:
> +      - qcom,kaanapali-videocc
>         - qcom,sm8450-videocc
>         - qcom,sm8475-videocc
>         - qcom,sm8550-videocc
> @@ -61,6 +63,7 @@ allOf:
>           compatible:
>             contains:
>               enum:
> +              - qcom,kaanapali-videocc
>                 - qcom,sm8450-videocc
>                 - qcom,sm8550-videocc
>                 - qcom,sm8750-videocc
> diff --git a/include/dt-bindings/clock/qcom,kaanapali-videocc.h b/include/dt-bindings/clock/qcom,kaanapali-videocc.h
> new file mode 100644
> index 000000000000..cc0d41b895c9
> --- /dev/null
> +++ b/include/dt-bindings/clock/qcom,kaanapali-videocc.h
> @@ -0,0 +1,58 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#ifndef _DT_BINDINGS_CLK_QCOM_VIDEO_CC_KAANAPALI_H
> +#define _DT_BINDINGS_CLK_QCOM_VIDEO_CC_KAANAPALI_H
> +
> +/* VIDEO_CC clocks */
> +#define VIDEO_CC_AHB_CLK					0
> +#define VIDEO_CC_AHB_CLK_SRC					1
> +#define VIDEO_CC_MVS0_CLK					2
> +#define VIDEO_CC_MVS0_CLK_SRC					3
> +#define VIDEO_CC_MVS0_FREERUN_CLK				4
> +#define VIDEO_CC_MVS0_SHIFT_CLK					5
> +#define VIDEO_CC_MVS0_VPP0_CLK					6
> +#define VIDEO_CC_MVS0_VPP0_FREERUN_CLK				7
> +#define VIDEO_CC_MVS0_VPP1_CLK					8
> +#define VIDEO_CC_MVS0_VPP1_FREERUN_CLK				9
> +#define VIDEO_CC_MVS0A_CLK					10
> +#define VIDEO_CC_MVS0A_CLK_SRC					11
> +#define VIDEO_CC_MVS0A_FREERUN_CLK				12
> +#define VIDEO_CC_MVS0B_CLK					13
> +#define VIDEO_CC_MVS0B_CLK_SRC					14
> +#define VIDEO_CC_MVS0B_FREERUN_CLK				15
> +#define VIDEO_CC_MVS0C_CLK					16
> +#define VIDEO_CC_MVS0C_CLK_SRC					17
> +#define VIDEO_CC_MVS0C_FREERUN_CLK				18
> +#define VIDEO_CC_MVS0C_SHIFT_CLK				19
> +#define VIDEO_CC_PLL0						20
> +#define VIDEO_CC_PLL1						21
> +#define VIDEO_CC_PLL2						22
> +#define VIDEO_CC_PLL3						23
> +#define VIDEO_CC_SLEEP_CLK					24
> +#define VIDEO_CC_TS_XO_CLK					25
> +#define VIDEO_CC_XO_CLK						26
> +#define VIDEO_CC_XO_CLK_SRC					27
> +
> +/* VIDEO_CC power domains */
> +#define VIDEO_CC_MVS0A_GDSC					0
> +#define VIDEO_CC_MVS0_GDSC					1
> +#define VIDEO_CC_MVS0_VPP1_GDSC					2
> +#define VIDEO_CC_MVS0_VPP0_GDSC					3
> +#define VIDEO_CC_MVS0C_GDSC					4
> +
> +/* VIDEO_CC resets */
> +#define VIDEO_CC_INTERFACE_BCR					0
> +#define VIDEO_CC_MVS0_BCR					1
> +#define VIDEO_CC_MVS0_VPP0_BCR					2
> +#define VIDEO_CC_MVS0_VPP1_BCR					3
> +#define VIDEO_CC_MVS0A_BCR					4
> +#define VIDEO_CC_MVS0C_CLK_ARES					5
> +#define VIDEO_CC_MVS0C_BCR					6
> +#define VIDEO_CC_MVS0_FREERUN_CLK_ARES				7
> +#define VIDEO_CC_MVS0C_FREERUN_CLK_ARES				8
> +#define VIDEO_CC_XO_CLK_ARES					9
> +
> +#endif
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
