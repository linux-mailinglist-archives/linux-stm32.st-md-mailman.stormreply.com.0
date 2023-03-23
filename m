Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E930D6C62F6
	for <lists+linux-stm32@lfdr.de>; Thu, 23 Mar 2023 10:12:27 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AFE19C6A5F6;
	Thu, 23 Mar 2023 09:12:27 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 062A2C69053
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Mar 2023 09:12:27 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id d17so11204433wrb.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Mar 2023 02:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679562746;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=Lw2KtnfrXgMSTtwKSsEVf0QKX+9cqYY4BerOVnSFpqg=;
 b=TV+V6f9LUNM0+CzoHHTrQsW8YpC23Qo+YU8xv3lKOiuJP8u3cIraecCZjOcZmHsYlj
 vcoNFC0bq+bU2VpRy24gs1OxJwzBOzhqRYJSs3uw8A3mWIZFDPWvXNUrRkE83gUK/AeR
 cSE8b8YjvBg1Alf5hAMT0bNnYGYTBFJ3HeC/wl4UrGBjYdTADQB/3Sw3niLDjQR4Mo82
 GxehxS2m5AoduZTfUkrHk/NKXR1xNi/69h0MQNkqKpa+6Icv532T8FN6Bt3fcK8CuB91
 4gShbWsbtl3nkQXNZUzliMisB26cWZXaMIAraZWm67oI0csUZ1bfzDqNg7yXWiLRFK/4
 tHow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679562746;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Lw2KtnfrXgMSTtwKSsEVf0QKX+9cqYY4BerOVnSFpqg=;
 b=CgKvrkAM6kbrzsAAhl6ao6y9EiZm1OH3hRZvPPpFVC/qXCOaM3maFz3VbOqX3d9mQf
 QubwM4iqksIAMDwWxwRAYJAkdBjFnBBB4tnyQePFL2IjjFEGXJtP/N9IRXxb+qwHgMMr
 45ZMKipKWpjkOEF+mzVmnDUGrLZeeCGtxi0yiP3ndncZTQ360VcseylTJ5RTjymO4YIt
 nBtc4/ONT/HJi+0Nz9MQJvrleVYzOVWQWA63gV7PTZg291f9XReZvdl7SCCESwANLty5
 N6sHo4NqYWFuKRF6zE8w/R1CGk7gniB3OYqsM9Ei8e3BolREynprHvDB0U/pULfb2sZ4
 dGxQ==
X-Gm-Message-State: AAQBX9e6aAw9rSn66R64K/DlDqriWLqWiwNT7z3KGysbLl1z+Gz3Gx1Q
 e3uUr/X26GXLjkZeT7ovQdTdGg==
X-Google-Smtp-Source: AKy350Y5wQTBHdHfn9aM67xMeKdfsK61wnhwAkLOBgELzHwC2WSTeOuu5J/UlaTvNclpU2KgwQ+apA==
X-Received: by 2002:a5d:525c:0:b0:2ce:a7df:c115 with SMTP id
 k28-20020a5d525c000000b002cea7dfc115mr1978118wrc.41.1679562746582; 
 Thu, 23 Mar 2023 02:12:26 -0700 (PDT)
Received: from [192.168.7.188] (679773502.box.freepro.com. [212.114.21.58])
 by smtp.gmail.com with ESMTPSA id
 a6-20020a056000100600b002c8ed82c56csm15727085wrx.116.2023.03.23.02.12.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Mar 2023 02:12:26 -0700 (PDT)
Message-ID: <ca9ee5c3-77cf-af08-1eb1-3e1170e32681@linaro.org>
Date: Thu, 23 Mar 2023 10:12:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Daire McNamara <daire.mcnamara@microchip.com>, Andy Gross
 <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Michal Simek <michal.simek@xilinx.com>
References: <20230322173449.3970718-1-robh@kernel.org>
Organization: Linaro Developer Services
In-Reply-To: <20230322173449.3970718-1-robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: mailbox: Drop unneeded quotes
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
Reply-To: neil.armstrong@linaro.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 22/03/2023 18:34, Rob Herring wrote:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>   .../devicetree/bindings/mailbox/amlogic,meson-gxbb-mhu.yaml   | 4 ++--

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

>   .../devicetree/bindings/mailbox/microchip,mpfs-mailbox.yaml   | 4 ++--
>   .../devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml    | 4 ++--
>   Documentation/devicetree/bindings/mailbox/sprd-mailbox.yaml   | 4 ++--
>   Documentation/devicetree/bindings/mailbox/st,stm32-ipcc.yaml  | 4 ++--
>   .../devicetree/bindings/mailbox/xlnx,zynqmp-ipi-mailbox.yaml  | 4 ++--
>   6 files changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mailbox/amlogic,meson-gxbb-mhu.yaml b/Documentation/devicetree/bindings/mailbox/amlogic,meson-gxbb-mhu.yaml
> index dfd26b998189..385809ed1569 100644
> --- a/Documentation/devicetree/bindings/mailbox/amlogic,meson-gxbb-mhu.yaml
> +++ b/Documentation/devicetree/bindings/mailbox/amlogic,meson-gxbb-mhu.yaml
> @@ -2,8 +2,8 @@
>   # Copyright 2019 BayLibre, SAS
>   %YAML 1.2
>   ---
> -$id: "http://devicetree.org/schemas/mailbox/amlogic,meson-gxbb-mhu.yaml#"
> -$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +$id: http://devicetree.org/schemas/mailbox/amlogic,meson-gxbb-mhu.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>   
>   title: Amlogic Meson Message-Handling-Unit Controller
>   
> diff --git a/Documentation/devicetree/bindings/mailbox/microchip,mpfs-mailbox.yaml b/Documentation/devicetree/bindings/mailbox/microchip,mpfs-mailbox.yaml
> index 935937c67133..404477910f02 100644
> --- a/Documentation/devicetree/bindings/mailbox/microchip,mpfs-mailbox.yaml
> +++ b/Documentation/devicetree/bindings/mailbox/microchip,mpfs-mailbox.yaml
> @@ -1,8 +1,8 @@
>   # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>   %YAML 1.2
>   ---
> -$id: "http://devicetree.org/schemas/mailbox/microchip,mpfs-mailbox.yaml#"
> -$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +$id: http://devicetree.org/schemas/mailbox/microchip,mpfs-mailbox.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>   
>   title: Microchip PolarFire SoC (MPFS) MSS (microprocessor subsystem) mailbox controller
>   
> diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
> index d888ead09282..7f18fb10435d 100644
> --- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
> +++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
> @@ -1,8 +1,8 @@
>   # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>   %YAML 1.2
>   ---
> -$id: "http://devicetree.org/schemas/mailbox/qcom,apcs-kpss-global.yaml#"
> -$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +$id: http://devicetree.org/schemas/mailbox/qcom,apcs-kpss-global.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>   
>   title: Qualcomm APCS global block
>   
> diff --git a/Documentation/devicetree/bindings/mailbox/sprd-mailbox.yaml b/Documentation/devicetree/bindings/mailbox/sprd-mailbox.yaml
> index bdfb4a8220c5..b526f9c0c272 100644
> --- a/Documentation/devicetree/bindings/mailbox/sprd-mailbox.yaml
> +++ b/Documentation/devicetree/bindings/mailbox/sprd-mailbox.yaml
> @@ -1,8 +1,8 @@
>   # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>   %YAML 1.2
>   ---
> -$id: "http://devicetree.org/schemas/mailbox/sprd-mailbox.yaml#"
> -$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +$id: http://devicetree.org/schemas/mailbox/sprd-mailbox.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>   
>   title: Spreadtrum mailbox controller
>   
> diff --git a/Documentation/devicetree/bindings/mailbox/st,stm32-ipcc.yaml b/Documentation/devicetree/bindings/mailbox/st,stm32-ipcc.yaml
> index 0dfe05a04dd0..134fd223a02b 100644
> --- a/Documentation/devicetree/bindings/mailbox/st,stm32-ipcc.yaml
> +++ b/Documentation/devicetree/bindings/mailbox/st,stm32-ipcc.yaml
> @@ -1,8 +1,8 @@
>   # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>   %YAML 1.2
>   ---
> -$id: "http://devicetree.org/schemas/mailbox/st,stm32-ipcc.yaml#"
> -$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +$id: http://devicetree.org/schemas/mailbox/st,stm32-ipcc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>   
>   title: STMicroelectronics STM32 IPC controller
>   
> diff --git a/Documentation/devicetree/bindings/mailbox/xlnx,zynqmp-ipi-mailbox.yaml b/Documentation/devicetree/bindings/mailbox/xlnx,zynqmp-ipi-mailbox.yaml
> index 2193141dd7fd..45df46343f6a 100644
> --- a/Documentation/devicetree/bindings/mailbox/xlnx,zynqmp-ipi-mailbox.yaml
> +++ b/Documentation/devicetree/bindings/mailbox/xlnx,zynqmp-ipi-mailbox.yaml
> @@ -1,8 +1,8 @@
>   # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>   %YAML 1.2
>   ---
> -$id: "http://devicetree.org/schemas/mailbox/xlnx,zynqmp-ipi-mailbox.yaml#"
> -$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +$id: http://devicetree.org/schemas/mailbox/xlnx,zynqmp-ipi-mailbox.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>   
>   title: Xilinx IPI(Inter Processor Interrupt) mailbox controller
>   

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
