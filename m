Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A856B9E2F1
	for <lists+linux-stm32@lfdr.de>; Thu, 25 Sep 2025 11:04:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BB9E3C3F949;
	Thu, 25 Sep 2025 09:04:49 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CF416C3F93B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Sep 2025 09:04:48 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-46de78b595dso3373605e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Sep 2025 02:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758791088; x=1759395888;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=52cJq27fTrRB0shrC+OriI/jG8WLskY0nr0nR3oM2xU=;
 b=cjJGsKL9IQuyUi8JHMOqZoVPEMwocCKlTIiKEM173ie8QlA9z+8sgVZwMrWQ5H43LD
 4mV06XhPZAFF5Qzzb5+aUNjCjkAxVW8ezEEA6LkOTnFY4yscaWf+SanWdMf3BEPFjt/K
 bGBAVv/oTB4+q1R7hG0fDStrNNcXbahCpcVonSLIH/jxW1B4iqDBZph0AWfvOXbXT3EI
 3N799Bt7K+v8/G3Nhglaqfl3N0NvYzjqt73irGS5G00KNbLmC5nx04alqXJ3Z/kYUiim
 59m/FOZaKVzxz8NMCGhgJg1M7d5VUJ7ZcDtPPIE3PjR7dNYN3Zu9qBSLbZcbq8+xHtB6
 wMzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758791088; x=1759395888;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=52cJq27fTrRB0shrC+OriI/jG8WLskY0nr0nR3oM2xU=;
 b=Q2oIKmjsQTsRTyRkyBg9mrCU6b1gig7Uwi2BeBWGx/jwO757p1hHms6Q3p9+1nr/sv
 Mamykim15Q0kb9TDdG5oHHDHCDHzWoVYiGywuv8828AjbDGK3QtlLbyg4f+KyIx9yNGa
 eqiWEnZ9emf7ph2QmR57OcqwG1qGCx4EM4kgbOVyXk7uLWmOR5vFyoHzWx1bVdF7mQO0
 wiGMzDDEz1u5sSk56itVF7a7IZUvutF9MnEgxcNIodcX7fYgnfmUxethgBUoHCOnCOlK
 gmY92STFWfPSRqeux73Z1GnF6cipk11TRDww9PYPle/Lv1qTp9BUgqSbFdkXOTA2H+hr
 D0PQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVybNqLUp/i1X/w2r/pNDpC3jXduLK4W/zjqYAo/a6FsfvSvhcSsswET1ASfE7fLUNm4GPqsZ/8tjnlRg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwZY+V5XPnPdA1lYeoS0ZXx3dwh6wKOObgMIsfMp9qAnC1rDszh
 hz897Fd2lPxBjYQJ739mAB2GvVuR/zcupgj0UzARlmI5/dYbgYxWNa4plSBAK7bsW1M=
X-Gm-Gg: ASbGnctps/kAsU2i24u3zT0UmMP1nAbm+T9g2NLaKmrXtSDfewhg5MDqIZiyA56Og/U
 Vef9Mh7opacaw5ZW+7Eg73ObTTgvn47+T9FNRg0GkrLJKQ5Dh1Wi9qxOApX8elBOdS4aprI7mI8
 Zli9LPoXl52GzEPyV5oG1ut/Ebz5NPeob5ggcHozmXT+QI3XE3Rx3bc97HxjY+hITe8EKYM6BA8
 yuIAChEi2zSp9Ir8yCJ/3PKJJxmvOxh909Y0uEgp+6c6c055fKcL0FD/wCIhvyS5hYXBjkfNN8b
 TQA6IJkBqFxX4N3RHNA0bkUB8sTAsYZrAW1JhibPFKdoH9UBcSH71jBO4bF2W/NtYR+xmTws4x/
 p0OtUZEWyOKTk2ChDpTHEc+9+coLAYCr6RBRh3LlngvDEkN+TsSOpP+tNsIusSz7vbP45NPGmU9
 Fzjgy0gRZ6zFX2ojr+FVw6
X-Google-Smtp-Source: AGHT+IErNyAgA6Qo/uMNdIgcGBbOskM97JAo4kEppskCvZUmBIRp8NL7i5asdGJupVwWIHvszpenhQ==
X-Received: by 2002:a05:600c:a43:b0:45b:7b54:881 with SMTP id
 5b1f17b1804b1-46e329a0e5dmr26627875e9.1.1758791088108; 
 Thu, 25 Sep 2025 02:04:48 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e2a9ac5basm80767955e9.7.2025.09.25.02.04.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Sep 2025 02:04:47 -0700 (PDT)
Message-ID: <19c66c0e-e784-4403-abae-c4cd92f4a150@linaro.org>
Date: Thu, 25 Sep 2025 10:04:45 +0100
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
 <20250924-knp-mmclk-v1-5-d7ea96b4784a@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250924-knp-mmclk-v1-5-d7ea96b4784a@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 tingwei.zhang@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 trilok.soni@oss.qualcomm.com
Subject: Re: [Linux-stm32] [PATCH 5/9] dt-bindings: clock: qcom: document
 the Kaanapali GPU Clock Controller
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
> Add bindings documentation for the Kaanapali Graphics Clock and Graphics
> power domain Controller.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>   .../bindings/clock/qcom,kaanapali-gxclkctl.yaml    | 63 ++++++++++++++++++++++
>   .../bindings/clock/qcom,sm8450-gpucc.yaml          |  2 +
>   include/dt-bindings/clock/qcom,kaanapali-gpucc.h   | 47 ++++++++++++++++
>   .../dt-bindings/clock/qcom,kaanapali-gxclkctl.h    | 12 +++++
>   4 files changed, 124 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,kaanapali-gxclkctl.yaml b/Documentation/devicetree/bindings/clock/qcom,kaanapali-gxclkctl.yaml
> new file mode 100644
> index 000000000000..31398aec839d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,kaanapali-gxclkctl.yaml
> @@ -0,0 +1,63 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/qcom,kaanapali-gxclkctl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Graphics power domain Controller on Kaanapali
> +
> +maintainers:
> +  - Taniya Das <taniya.das@oss.qualcomm.com>
> +
> +description: |
> +  Qualcomm graphics power domain control module provides the power
> +  domains on Qualcomm SoCs. This module exposes the GDSC power domain
> +  which helps the recovery of Graphics subsystem.
> +
> +  See also::
> +    include/dt-bindings/clock/qcom,kaanapali-gxclkctl.h
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,kaanapali-gxclkctl
> +
> +  power-domains:
> +    description:
> +      Power domains required for the clock controller to operate
> +    items:
> +      - description: GFX power domain
> +      - description: GMXC power domain
> +      - description: GPUCC(CX) power domain
> +
> +  '#power-domain-cells':
> +    const: 1
> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - power-domains
> +  - '#power-domain-cells'
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/power/qcom,rpmhpd.h>
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        clock-controller@3d68024 {
> +            compatible = "qcom,kaanapali-gxclkctl";
> +            reg = <0 0x3d68024 0x0 0x8>;
> +            power-domains = <&rpmhpd RPMHPD_GFX>,
> +                            <&rpmhpd RPMHPD_GMXC>,
> +                            <&gpucc 0>;
> +            #power-domain-cells = <1>;
> +        };
> +    };
> +...
> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
> index 44380f6f8136..6feaa32569f9 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
> @@ -14,6 +14,7 @@ description: |
>     domains on Qualcomm SoCs.
>   
>     See also::
> +    include/dt-bindings/clock/qcom,kaanapali-gpucc.h
>       include/dt-bindings/clock/qcom,milos-gpucc.h
>       include/dt-bindings/clock/qcom,sar2130p-gpucc.h
>       include/dt-bindings/clock/qcom,sm4450-gpucc.h
> @@ -26,6 +27,7 @@ description: |
>   properties:
>     compatible:
>       enum:
> +      - qcom,kaanapali-gpucc
>         - qcom,milos-gpucc
>         - qcom,sar2130p-gpucc
>         - qcom,sm4450-gpucc
> diff --git a/include/dt-bindings/clock/qcom,kaanapali-gpucc.h b/include/dt-bindings/clock/qcom,kaanapali-gpucc.h
> new file mode 100644
> index 000000000000..e8dc2009c71b
> --- /dev/null
> +++ b/include/dt-bindings/clock/qcom,kaanapali-gpucc.h
> @@ -0,0 +1,47 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#ifndef _DT_BINDINGS_CLK_QCOM_GPU_CC_KAANAPALI_H
> +#define _DT_BINDINGS_CLK_QCOM_GPU_CC_KAANAPALI_H
> +
> +/* GPU_CC clocks */
> +#define GPU_CC_AHB_CLK						0
> +#define GPU_CC_CB_CLK						1
> +#define GPU_CC_CX_ACCU_SHIFT_CLK				2
> +#define GPU_CC_CX_GMU_CLK					3
> +#define GPU_CC_CXO_AON_CLK					4
> +#define GPU_CC_CXO_CLK						5
> +#define GPU_CC_DEMET_CLK					6
> +#define GPU_CC_DPM_CLK						7
> +#define GPU_CC_FF_CLK_SRC					8
> +#define GPU_CC_FREQ_MEASURE_CLK					9
> +#define GPU_CC_GMU_CLK_SRC					10
> +#define GPU_CC_GPU_SMMU_VOTE_CLK				11
> +#define GPU_CC_GX_ACCU_SHIFT_CLK				12
> +#define GPU_CC_GX_GMU_CLK					13
> +#define GPU_CC_HUB_AON_CLK					14
> +#define GPU_CC_HUB_CLK_SRC					15
> +#define GPU_CC_HUB_CX_INT_CLK					16
> +#define GPU_CC_HUB_DIV_CLK_SRC					17
> +#define GPU_CC_MEMNOC_GFX_CLK					18
> +#define GPU_CC_PLL0						19
> +#define GPU_CC_PLL0_OUT_EVEN					20
> +#define GPU_CC_RSCC_HUB_AON_CLK					21
> +#define GPU_CC_RSCC_XO_AON_CLK					22
> +#define GPU_CC_SLEEP_CLK					23
> +
> +/* GPU_CC power domains */
> +#define GPU_CC_CX_GDSC						0
> +
> +/* GPU_CC resets */
> +#define GPU_CC_CB_BCR						0
> +#define GPU_CC_CX_BCR						1
> +#define GPU_CC_FAST_HUB_BCR					2
> +#define GPU_CC_FF_BCR						3
> +#define GPU_CC_GMU_BCR						4
> +#define GPU_CC_GX_BCR						5
> +#define GPU_CC_XO_BCR						6
> +
> +#endif
> diff --git a/include/dt-bindings/clock/qcom,kaanapali-gxclkctl.h b/include/dt-bindings/clock/qcom,kaanapali-gxclkctl.h
> new file mode 100644
> index 000000000000..460e21881c4f
> --- /dev/null
> +++ b/include/dt-bindings/clock/qcom,kaanapali-gxclkctl.h
> @@ -0,0 +1,12 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#ifndef _DT_BINDINGS_CLK_QCOM_GX_CLKCTL_KAANAPALI_H
> +#define _DT_BINDINGS_CLK_QCOM_GX_CLKCTL_KAANAPALI_H
> +
> +/* GX_CLKCTL power domains */
> +#define GX_CLKCTL_GX_GDSC				0
> +
> +#endif
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
