Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F8C75F85C
	for <lists+linux-stm32@lfdr.de>; Mon, 24 Jul 2023 15:36:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7BCA0C6B442;
	Mon, 24 Jul 2023 13:36:08 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BC00EC65E56
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Jul 2023 13:36:07 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-9936b3d0286so776500566b.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Jul 2023 06:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690205767; x=1690810567;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CUZQpPdIT858egNmU25ruQR94eOxPvH6ltaodarNd9g=;
 b=uz3c1UnB5ZXJhSrBInto1AcNQVdonbA1zngvwd1fUOakUAKuUGuZ9tef8/jNk+qC8o
 cPm3O6xdgYS3r2j422yCFMDvg81CqPMOkgBBwJ2M2zf82HkUE1fmhoX2IY67ngeGApGF
 iW+wE1ghO7KbnzIl+y6FcBSqURnEzI/YIVsBBDvuJNYj/t324Ubx168t1tiNFzaOFfFp
 9m0zZCAJr+xrz+WRx64Q0GhDZChKBKWya4Onl+zWI8bvZNlF5w438dyx48yK7VsGplkv
 IVXo3kOfUWLMO1MtRM5omsRMYpgvg74H/grqZF8UlrI+B4I/dGOUP5vnDzOcYOac15WX
 56mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690205767; x=1690810567;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CUZQpPdIT858egNmU25ruQR94eOxPvH6ltaodarNd9g=;
 b=fcrkuikbo4sqd/+inaqwVmj3w2I64P8kMHuynjkVF6AjqNO7eriDudAdPIR4gqkalo
 5g0urIUmbMmZxQimBuU9Tgxw9Cl4MC0V9DD/xjSRBP0kcC9WbyWHYd2P4j1gNweU3IH5
 zbnqgTP6y8chn7xWvKTXw5gOWig0wHGEyLogt4veFnzsr8ujV8pFvxZwxRf1Xh6zYGjO
 AFn2oyRLngsvaEOVATWebpHwyH9YRoCXUQGzY/RsCE/JEmuY58q8b8PrquA4ke+8Euh/
 JQmVinRXElCQ45oYsu+kHfpfUA/ko+KgNPYqoYpuLYXrmTI4bJSMMq5SZNJPUrlFBi0c
 CJ5g==
X-Gm-Message-State: ABy/qLZeBtwPBvMHL0Ku1dhKZ1AXWmuBCfDypmQhRBwwCqN/0wRBkGUa
 md04MIh8muRH/B5TSSsJQm+LKQ==
X-Google-Smtp-Source: APBJJlEFZc2GAnLQ7Chh6jd7HJTFUIs3C1+QLUm3qcXM4djlWORHjq2OVwXgSuJWE+3KbN4PA5mQ5Q==
X-Received: by 2002:a17:906:778f:b0:994:3207:cde3 with SMTP id
 s15-20020a170906778f00b009943207cde3mr11143513ejm.49.1690205767468; 
 Mon, 24 Jul 2023 06:36:07 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
 by smtp.gmail.com with ESMTPSA id
 p24-20020a170906a01800b00992f2befcbcsm6764671ejy.180.2023.07.24.06.36.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jul 2023 06:36:06 -0700 (PDT)
Message-ID: <68c371ed-f178-9d85-da31-4b5b894813cd@linaro.org>
Date: Mon, 24 Jul 2023 15:36:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Pavel Machek
 <pavel@ucw.cz>, Lee Jones <lee@kernel.org>
References: <20230724063520.182888-1-alexander.stein@ew.tq-group.com>
 <20230724063520.182888-2-alexander.stein@ew.tq-group.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230724063520.182888-2-alexander.stein@ew.tq-group.com>
Cc: linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2 2/2] dt-bindings: leds: Add
 gpio-line-names to PCA9532 GPIO
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

On 24/07/2023 08:35, Alexander Stein wrote:
> This is a gpio-controller, so gpio-line-names should be allowed as well.
> pca9532 supports up to 16 GPIOs.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
