Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A5972F5A6
	for <lists+linux-stm32@lfdr.de>; Wed, 14 Jun 2023 09:13:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 932F8C6A61A;
	Wed, 14 Jun 2023 07:13:40 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8B51BC6A615
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Jun 2023 07:13:39 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-519b771f23aso11176a12.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Jun 2023 00:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686726819; x=1689318819;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=esjhB6FNbC1EpA195+AAnAhSVw66W/f4eIwLMazyni8=;
 b=Qdmt9FtZE9pDCTgj2b/5u43jUbAH+QGW34yMXH8ELwLQaPlaOaQqFvONc/VLmRbzzv
 mbRB1WjOKYWr8ChYE+wGsye+zvj3Rf9QG6GUf3YAjax+r/sPr5KbZwES2CQslsL5cGd8
 Dsi+K0uIjfSK7N5dwOF7yy6uGJKEXyQChR6wWtjFdHbXJbMcP+ewflU2MLR7VNZev3yn
 nkwayUyejXjvlCwFVASsYYy/vZ2qSPjvVmdf9wzQqSMgmquEGMOEjdY845CoGc6imcY6
 jnaY2CgDyYrSZtePupztTtufCgdstxTql2RDns+378YujR/unp8diGu43Beq+wsCZj9t
 eM0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686726819; x=1689318819;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=esjhB6FNbC1EpA195+AAnAhSVw66W/f4eIwLMazyni8=;
 b=T2gmWlA5oIfqvn7e+NUhmRhJpyePE14Yusq+UCtsSbKALl7ai8wC3fmArX8KkcOKh8
 W9nTbXCNKbJBeTI73Pc6arKegHBiy+GBSKCAMx2cDlfuJ8aD+PBQBigokYHffXR/xGX5
 tSYpH6/4f6pGQ8z8DIJ5Xn8g7NaWt4I3v64VYLRe9rJq3+UcqKaIgO0pzq9yu32FXgmx
 F2jXoJo78naGgqMJCqKRUCjGw+RENdhYBaalUAqiKx0mY9PyCVMLP6+CzV8essM9lEKJ
 5EysRDyCfKt8M8OFiMtFjmsdnbcfyqBA2fA2jGxLfzYWAgeSXimiX8GNit9giHHLxM57
 PWAg==
X-Gm-Message-State: AC+VfDwPALxORL1hIepub8jeLP4gyz1AOn2g0d3EX8ELYKiRfiHGufjc
 jghDec3yvFBzHX6eyVD2QTVQmw==
X-Google-Smtp-Source: ACHHUZ74GqZI5n7DD7l+seK7RspzJy2be50nrAxgF0QALAzfeJz/QPWtgJwKx1qQM3opxU4IOBMSyQ==
X-Received: by 2002:aa7:d9c1:0:b0:518:6e09:425c with SMTP id
 v1-20020aa7d9c1000000b005186e09425cmr3395161eds.9.1686726818958; 
 Wed, 14 Jun 2023 00:13:38 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
 by smtp.gmail.com with ESMTPSA id
 v26-20020aa7dbda000000b0050cc4461fc5sm7296614edt.92.2023.06.14.00.13.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jun 2023 00:13:38 -0700 (PDT)
Message-ID: <f5b5438a-48ce-8151-cfaf-09b4c5965c97@linaro.org>
Date: Wed, 14 Jun 2023 09:13:35 +0200
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
 <20230612092355.87937-3-brgl@bgdev.pl>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230612092355.87937-3-brgl@bgdev.pl>
Cc: devicetree@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 02/26] dt-bindings: phy: describe the
	Qualcomm SGMII PHY
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
> Describe the SGMII/SerDes PHY present on the sa8775p platforms.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


> +properties:
> +  compatible:
> +    const: qcom,sa8775p-dwmac-sgmii-phy
> +
> +  reg:
> +    items:
> +      - description: serdes
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    const: sgmi_ref
> +
> +  "#phy-cells":
> +    const: 0
> +
> +additionalProperties: false

Please put it after required: block.

> +
> +required:
> +  - compatible
> +  - reg
> +  - "#phy-cells"
> +  - clocks
> +  - clock-names
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,sa8775p-gcc.h>
> +    serdes_phy: phy@8901000 {
> +        compatible = "qcom,sa8775p-dwmac-sgmii-phy";
> +        reg = <0x08901000 0xe10>;
> +        clocks = <&gcc GCC_SGMI_CLKREF_EN>;
> +        clock-names = "sgmi_ref";
> +        #phy-cells = <0>;
> +        status = "disabled";

Drop the status.

With above:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

> +    };

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
