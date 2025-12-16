Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 88876CC204A
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Dec 2025 11:47:52 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 27EBEC87EDC;
	Tue, 16 Dec 2025 10:47:52 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1EEEAC01FBF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Dec 2025 10:47:50 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-37e8892d4e0so4758791fa.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Dec 2025 02:47:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1765882069; x=1766486869;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wmKGehAtF2aC6hECS065yudbuhoIUUvkuW0P86X+zRI=;
 b=H93ado8ivQLyv5pEybj3TMQVj8JT8okDorIMblN6yE0D56iD9pQeaGGzpIFGwgKvjf
 eZDf7UjV2JrclR9y37jcNONUTh4kY/tcRuMVa0yLcxUeufB+1cgnDIPAaGi5P3bxK+mL
 dNIEPkrcJPHl9UmOLreP5bjxYOTpMLm5kH8bZcbgwbzPRju8rPJOoKTJE4qicnK7JgFx
 m1XcBPIFAbisc55zphold361ElBA7ibxlGHCvzd/fB185siLAoYXEtfcAdgFrLnXxF/s
 ORpnUHMm4clF/zD9cizXt25bk6LspCNZojkybllynjQbtiYGNAcSN4tohY3DrVwZmFE6
 vnpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765882069; x=1766486869;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wmKGehAtF2aC6hECS065yudbuhoIUUvkuW0P86X+zRI=;
 b=LQlznm20oFdd9+8VirHzXQy5/hB23xcmK9tS3hIbu5SJFoC2syEMDLHa7/wNbr+a/g
 Rjl64poYrQDlmT1GBbDLsaF9VZe2h7MyFp0Avr8SGO58HIKVAckrb5+mra4lP/e5Aw88
 xZSLzRuLgG6w/Be/4TYkUeoOjr5kv/hiT2H5YLgtNm9SNURd1OP5QFOJHCofZRRDlp2p
 O+MSUlNm0VojFlYIk2gwuKlJtgddIG17to0933VpRVvQ9he5bstugtD29ggNZ3lL+Ur8
 4mhK/L24zW6g/n1tXfnODXmGEuLKTshxazhAlG11E8j9edIwlwnEvj6c3v5PV2d0QIvK
 DA2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWy2p4vGoUdZt9BqOO2I9GtOaMMZGzivDpi4KltzC1qflLEfn5q9Ih9GWNLhwWgU5yOQBr9p9ugIkeUVw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw7OhR0ed/Gb7pTUPuMOuK5LZnM8XR9XsNQJaQY21DnJ9Lwa3UX
 +uWxUQlVlMn7f0WSHNcYJxev4WVT6p0y51mWPkNlVdL1f75BthOPk2QNwqx10FePUzA=
X-Gm-Gg: AY/fxX4F/sg5dI6QHQbRfV8Zna+6g93FKZeas9mG/kjdlhSqfuOlvCcfT/GKUJ9ydtt
 u15/RD8250kZHqCfLus+tDs4UX65KsWu8a/LcBz3+21NF5Hff1BLVp7DduABY5XB4seGbZkgiaC
 6BZ5Z0fp4LbFrVZCh7XmzUAQthXe7drHkIXk3JugZmx4IG/Zax+f6dalmKZixEvDIo9FKjjGG9S
 z5XLG9Mk7zZE7Kb25CRqsAkABXq0WnkP5EZ8RpxXrqjEz9d67qYGQJ0/3Dv7kNsylsrdIyY4f4f
 /lIJqHQp9GlTXvI3c45pV5dMffr6UixMomfynI9oKo57RtsJ6iHB+FzvZUivAWO04EvTNGvDatU
 87RnNUMo89cTKWvfHo/++C2j5zZhrIKLwq+hKzxwg+Ta8lmjnho/8uqlgKMG4pzcSs7ZyY+rlec
 SL/Tm6oDgvu3xMSk7gU7BjteIjK9Sus1ETBNQuIk+Aou6V3t7JneiHjsIY/Mh3vdRAog==
X-Google-Smtp-Source: AGHT+IF0H41NSoDHeiVoQB8t5PFRmbwgMPCmvxitVkRlghvklguwBlJGvPt9E5BeekSJvgfAgDKMYA==
X-Received: by 2002:a05:6512:3c8b:b0:594:2f72:2f78 with SMTP id
 2adb3069b0e04-598faab5a2emr2935465e87.8.1765882069039; 
 Tue, 16 Dec 2025 02:47:49 -0800 (PST)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi.
 [91.159.24.186]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5990da119c1sm806260e87.18.2025.12.16.02.47.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Dec 2025 02:47:47 -0800 (PST)
Message-ID: <3658e6cc-755c-4b38-aec7-b8bfdd7c8bd2@linaro.org>
Date: Tue, 16 Dec 2025 12:47:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: ru-RU
To: Taniya Das <taniya.das@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Konrad Dybcio <konradybcio@kernel.org>
References: <20251125-kaanapali-mmcc-v2-v2-0-fb44e78f300b@oss.qualcomm.com>
 <20251125-kaanapali-mmcc-v2-v2-5-fb44e78f300b@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20251125-kaanapali-mmcc-v2-v2-5-fb44e78f300b@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
 Imran Shaik <imran.shaik@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 05/11] dt-bindings: clock: qcom: Add
 support for CAMCC for Kaanapali
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

On 11/25/25 19:45, Taniya Das wrote:
> Update the compatible and the bindings for CAMCC support on Kaanapali
> SoC.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>   .../bindings/clock/qcom,sm8450-camcc.yaml          |   6 +
>   .../clock/qcom,kaanapali-cambistmclkcc.h           |  33 +++++
>   include/dt-bindings/clock/qcom,kaanapali-camcc.h   | 147 +++++++++++++++++++++
>   3 files changed, 186 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
> index c1e06f39431e68a3cd2f6c2dba84be2a3c143bb1..3ec9bf4d82ad3b0fbb3e58fe312a416b3580c30c 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
> @@ -15,6 +15,8 @@ description: |
>     domains on SM8450.
>   
>     See also:
> +    include/dt-bindings/clock/qcom,kaanapali-camcc.h
> +    include/dt-bindings/clock/qcom,kaanapali-cambistmclkcc.h
>       include/dt-bindings/clock/qcom,sm8450-camcc.h
>       include/dt-bindings/clock/qcom,sm8550-camcc.h
>       include/dt-bindings/clock/qcom,sm8650-camcc.h
> @@ -22,6 +24,8 @@ description: |
>   properties:
>     compatible:
>       enum:
> +      - qcom,kaanapali-cambistmclkcc
> +      - qcom,kaanapali-camcc

I do have right the same review comment as the given for SM8750 CAMCC one.

The introduced qcom,kaanapali-cambistmclkcc does not inherit reset
controller or power domain controller properties, thus it should not be
added to the list of regular camera clock contollers.

Please create a new dt schema file for qcom,kaanapali-cambistmclkcc
and qcom,sm8750-cambistmclkcc IP descriptions.

>         - qcom,sm8450-camcc
>         - qcom,sm8475-camcc
>         - qcom,sm8550-camcc
> @@ -63,6 +67,8 @@ allOf:
>           compatible:
>             contains:
>               enum:
> +              - qcom,kaanapali-cambistmclkcc
> +              - qcom,kaanapali-camcc
>                 - qcom,sc8280xp-camcc
>                 - qcom,sm8450-camcc
>                 - qcom,sm8550-camcc
> diff --git a/include/dt-bindings/clock/qcom,kaanapali-cambistmclkcc.h b/include/dt-bindings/clock/qcom,kaanapali-cambistmclkcc.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..ddb083b5289ecc5ddbf9ce0b8afa5e2b3bd7ccad
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

-- 
Best wishes,
Vladimir
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
