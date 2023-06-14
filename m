Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1230272F634
	for <lists+linux-stm32@lfdr.de>; Wed, 14 Jun 2023 09:25:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C3576C6A61A;
	Wed, 14 Jun 2023 07:25:46 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C55DBC6A615
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Jun 2023 07:25:44 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-5169f920a9dso12975019a12.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Jun 2023 00:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686727544; x=1689319544;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZYUp6f+gg9nccS7jAmhavJJDmvTnWdlOMMShB2IfyLM=;
 b=f+YcEOcsWR8xL+5nkBdWG/XfQuwyydCnwar9FyE0t3Il1q/TbBYviUimty8SCA+6JI
 OVAHeuvn5JYITI7W9hGiUU7vMeA0ISeoGPV0GNyi9lbrYkZ/vU9OKmTFoGEG1EaL80EF
 WoVjyhNosru4+9vZSX4c1N0vtx2IB2ySXYBz2+3wBy7u5yU53WuKY2tKmVQuJbfPkb6V
 ex3iX/Qm0KBiyzrxddSfGNS3SqjqzEj+Dyw+rK8fdfBGTds/xOsFw2TDpwSP/IS5ZAg6
 +eWVXA0FHOT9SHrACDTibQjZ80tQRKeJNAW01TYc+zt+xoOxBvHkKneW41gn8SX8Pj95
 V+Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686727544; x=1689319544;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZYUp6f+gg9nccS7jAmhavJJDmvTnWdlOMMShB2IfyLM=;
 b=F0cbDDnLnCy0eRpz4QUdFp0FVp6WGUqYgY4DfjNrMKPmJy59Vr4IEcIQaUXrXnEcgZ
 RY+HkKlU8Bg5Io42L8XZ4/qh6M5a7ywj184j4hEqC/qiZyUtR4yCr9TZ26iAPxqv64hk
 wDNwf7AgF6E8AhWK8JWuC9P20ND42kZnAX7AYYN/b3Tux6wqZWLNaLFyv9R1VJiidd8y
 37hilgokxrWy1C+W0Ee84axREajq8QHzbZq2l5N8U+7O1pjJgjoKGX3SA11ywnoExXtk
 LCcTk6iwqy3DB95VB7IAo8utHiv88x/XrJKE6Ghuq15glHh1ssxb7YVxjvbBStvB9vTK
 cS/Q==
X-Gm-Message-State: AC+VfDy2OcRN5opr6jfJd6Ep9jA7OZvx83V+JZCXUfNtkqxLEoiNsrVo
 N9sp7FdqHn0MfY0SByyi4sI9MA==
X-Google-Smtp-Source: ACHHUZ7mP70TiHTncN1MepuY33PcI4oQtT42XBiiH2VcreWZ2uAPSk4CyOcrDDgSGNYQSZjYSpcrNQ==
X-Received: by 2002:a05:6402:180f:b0:513:fa61:397a with SMTP id
 g15-20020a056402180f00b00513fa61397amr816136edy.12.1686727544263; 
 Wed, 14 Jun 2023 00:25:44 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
 by smtp.gmail.com with ESMTPSA id
 b24-20020a056402139800b0051827a12b47sm5256406edv.15.2023.06.14.00.25.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jun 2023 00:25:43 -0700 (PDT)
Message-ID: <712b2650-f0c1-088a-612c-ef6d6bcc1eb0@linaro.org>
Date: Wed, 14 Jun 2023 09:25:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: Bartosz Golaszewski <brgl@bgdev.pl>, Vinod Koul <vkoul@kernel.org>,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
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
 <20230612092355.87937-21-brgl@bgdev.pl>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230612092355.87937-21-brgl@bgdev.pl>
Cc: devicetree@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 20/26] dt-bindings: net: qcom,
 ethqos: add description for sa8775p
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

On 12/06/2023 11:23, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Add the compatible for the MAC controller on sa8775p platforms. This MAC
> works with a single interrupt so add minItems to the interrupts property.
> The fourth clock's name is different here so change it. Enable relevant
> PHY properties.
> 

I think the patch should be squashed with previous. Adding compatible to
common snps,dwmac binding does not make sense on its own. It makes sense
with adding compatible here.

> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  .../devicetree/bindings/net/qcom,ethqos.yaml       | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
> index 60a38044fb19..b20847c275ce 100644
> --- a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
> +++ b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
> @@ -20,6 +20,7 @@ properties:
>    compatible:
>      enum:
>        - qcom,qcs404-ethqos
> +      - qcom,sa8775p-ethqos
>        - qcom,sc8280xp-ethqos
>        - qcom,sm8150-ethqos
>  
> @@ -32,11 +33,13 @@ properties:
>        - const: rgmii
>  
>    interrupts:
> +    minItems: 1
>      items:
>        - description: Combined signal for various interrupt events
>        - description: The interrupt that occurs when Rx exits the LPI state
>  
>    interrupt-names:
> +    minItems: 1
>      items:
>        - const: macirq
>        - const: eth_lpi
> @@ -49,11 +52,20 @@ properties:
>        - const: stmmaceth
>        - const: pclk
>        - const: ptp_ref
> -      - const: rgmii
> +      - enum:
> +          - rgmii
> +          - phyaux
>  
>    iommus:
>      maxItems: 1
>  
> +  phys: true
> +
> +  phy-supply: true

Isn't this property of the phy?

> +
> +  phy-names:
> +    const: serdes

Keep the phy-names after phys.


Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
