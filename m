Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F294E6BC6E4
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Mar 2023 08:18:47 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A8156C6904C;
	Thu, 16 Mar 2023 07:18:47 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8E2E9C03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Mar 2023 07:18:46 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id o12so3714599edb.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Mar 2023 00:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678951126;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NnXgwqMa80GgQcjZaphhuCryiuQqQv6hvEmtAcagRtY=;
 b=Y6rCA9o2f/NI+S8BIN3TvXbjfq9ybMB1G7Q9KQX3B+K4Cp2J0Ehi5nlbqDi/MjIz3C
 D7csLNuQSuZRrKjPRxEvZJyJTwlyECGyVgp3ERZx4Xg53boHF8Zy0MNE3q9itV1Vm30Q
 eXwA2APfJHxQcYMFPjsRyyPusvx5XoIry2qv0gYOEcq1WtP/NtXcLNYG+ve+JO18nxHs
 nWLnDsFFbh1+shFw70JrGq3+adeq8zrsnxXIwxPDPb7OSV2hgx/JkUj0gc7z/TP4HT0w
 gJ8wfmgek9zr2TQnF3A0MMqKPjqwvt2Ad1i20sN6cGg2d8MDAXls9pbOnkC/sfmk7SEX
 Hs6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678951126;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NnXgwqMa80GgQcjZaphhuCryiuQqQv6hvEmtAcagRtY=;
 b=o59ISTcI38EP/aH/3g1XNLDG5bMBbyMY6WRO0fFCPo2oJuj4DU8whDOKpbI9/GAiFz
 EmIP5mlngrWKJixzZKxbkIPeDkwBkckYR4rq6QJUPVnxob2lMUVA0F4sip25z66iR7o/
 bjBFtvnbvp2DQcqnIQE0WbUm5FbaGMK04tf+IhMy/cZViQeYpBeoZuO0GdwKmNXKzjEh
 G4CozLu28zKkOagvOrM9YAYxTKlmmxs7Zt8K55ZSYvb0pWJYtwXbfAeU4d8wyiLBu+Ap
 iz/2r9Vze6Pl3cBWRYAkFYoZS7ayp9vJZuA6xp9kYNX34innVe2IC9h6KpbQsO+TCSVu
 SwGQ==
X-Gm-Message-State: AO0yUKU8bcpV/YEW0Lr/kvRGmShBygTie+9sa6wzCAh6W1zBDQ2N5KtU
 FVlZs2wjP43RJHdoc8INFFcZww==
X-Google-Smtp-Source: AK7set8KeJ1ASIpRhtbE5CF8uaaqBb8UCVuakG6IHDgYISCsD2RCx+znpN/mu0oRZl2mQ+YHVYN89A==
X-Received: by 2002:aa7:c04f:0:b0:4fa:b302:84d0 with SMTP id
 k15-20020aa7c04f000000b004fab30284d0mr5511978edo.15.1678951122577; 
 Thu, 16 Mar 2023 00:18:42 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:9827:5f65:8269:a95f?
 ([2a02:810d:15c0:828:9827:5f65:8269:a95f])
 by smtp.gmail.com with ESMTPSA id
 v1-20020a50c401000000b004acbda55f6bsm3401675edf.27.2023.03.16.00.18.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Mar 2023 00:18:42 -0700 (PDT)
Message-ID: <d3dd5001-1b97-cc94-0a78-0420dc97614b@linaro.org>
Date: Thu, 16 Mar 2023 08:18:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Andrew Halaney <ahalaney@redhat.com>, linux-kernel@vger.kernel.org
References: <20230313165620.128463-1-ahalaney@redhat.com>
 <20230313165620.128463-4-ahalaney@redhat.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230313165620.128463-4-ahalaney@redhat.com>
Cc: mturquette@baylibre.com, edumazet@google.com,
 krzysztof.kozlowski+dt@linaro.org, jonathanh@nvidia.com,
 linux-clk@vger.kernel.org, tee.min.tan@linux.intel.com, linux@armlinux.org.uk,
 veekhee@apple.com, hisunil@quicinc.com, joabreu@synopsys.com, kuba@kernel.org,
 pabeni@redhat.com, andrey.konovalov@linaro.org, ncai@quicinc.com,
 devicetree@vger.kernel.org, bhupesh.sharma@linaro.org,
 linux-arm-msm@vger.kernel.org, richardcochran@gmail.com, bmasney@redhat.com,
 mohammad.athari.ismail@intel.com, robh+dt@kernel.org, ruppala@nvidia.com,
 jsuraj@qti.qualcomm.com, peppe.cavallaro@st.com,
 linux-arm-kernel@lists.infradead.org, sboyd@kernel.org, netdev@vger.kernel.org,
 andersson@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 agross@kernel.org, konrad.dybcio@linaro.org, vkoul@kernel.org,
 mcoquelin.stm32@gmail.com, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH net-next 03/11] dt-bindings: net: qcom,
 ethqos: Convert bindings to yaml
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

On 13/03/2023 17:56, Andrew Halaney wrote:
> From: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> 
> Convert Qualcomm ETHQOS Ethernet devicetree binding to YAML.
> 

(...)

> diff --git a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
> new file mode 100644
> index 000000000000..68ef43fb283d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
> @@ -0,0 +1,112 @@
> +# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Ethernet ETHQOS device
> +
> +maintainers:
> +  - Bhupesh Sharma <bhupesh.sharma@linaro.org>
> +
> +description:
> +  This binding describes the dwmmac based Qualcomm ethernet devices which

Drio "This binding describes", but say what is the hardware here.

> +  support Gigabit ethernet (version v2.3.0 onwards).
> +
> +  So, this file documents platform glue layer for dwmmac stmmac based Qualcomm
> +  ethernet devices.
> +
> +allOf:
> +  - $ref: snps,dwmac.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,qcs404-ethqos
> +      - qcom,sm8150-ethqos
> +
> +  reg:
> +    maxItems: 2
> +
> +  reg-names:
> +    items:
> +      - const: stmmaceth
> +      - const: rgmii
> +
> +  interrupts:
> +    items:
> +      - description: Combined signal for various interrupt events
> +      - description: The interrupt that occurs when Rx exits the LPI state
> +
> +  interrupt-names:
> +    items:
> +      - const: macirq
> +      - const: eth_lpi
> +
> +  clocks:
> +    maxItems: 4
> +
> +  clock-names:
> +    items:
> +      - const: stmmaceth
> +      - const: pclk
> +      - const: ptp_ref
> +      - const: rgmii
> +
> +  iommus:
> +    maxItems: 1

Isn't this new property? Last time I asked to mention the changes to the
binding done during conversion. Explain shortly why you are adding new
properties.

> +
> +required:
> +  - compatible
> +  - clocks
> +  - clock-names

reg-names

> +
> +unevaluatedProperties: false
> +


Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
