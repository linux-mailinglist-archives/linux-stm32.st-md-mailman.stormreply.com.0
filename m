Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 613466C60D6
	for <lists+linux-stm32@lfdr.de>; Thu, 23 Mar 2023 08:32:30 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0848EC6A5E7;
	Thu, 23 Mar 2023 07:32:30 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 64820C65E42
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Mar 2023 07:32:28 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id h8so82600948ede.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Mar 2023 00:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679556748;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5krubHHgKYJDCf8X0UvJA7y8q2NbVKxEV7FY/oHuAps=;
 b=w3awquQKTHeWDx/yCfCfHfdrLUAb+7cmTUbCxlDsTXtHqnC/KTdLvanL3T8U7h9Hn+
 T2KyJY5oy1yPQyU6mzgUZh1CzH88VAPkqy8k2SW2SwKq45G6DggQbSFKp7id0BSjS8Rp
 VoHzkI+PUoz4dQKhOTIWOYjtIUHmYVlbCNMKTKatuW6HXvZvM2uiVdheYJwhuBaoVv6r
 XUFm0HfHybe27otwo9wNuL61H0cKrxmMAqzuTsillUtZ3oANbuyNtcnMhqKcUnzq/u1/
 nw9/mhXmeh0zZJ/KOLNvHLyQee+sIyAd8AbaOqnSeke6JK3XQ1qUndFUTGYQb65Q7Z6P
 x2gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679556748;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5krubHHgKYJDCf8X0UvJA7y8q2NbVKxEV7FY/oHuAps=;
 b=Oq3W+BJRhC/yCTa7e9B/ABsT9EkCFkVUJEy04vekN7J4CFWCWYv8Hf2dndNmmKwGQf
 EMuycJdUxA6dE4dvGZn0kLKd40F0ypZMGaGjBB6cqHmW30iVaVs5ZnFD7WIYc4pGCNgV
 YUkVN2l3pemMyrVqEVm5oEjAReE4A9dA1r9g6J0bIlb+M5DB9YVJKxsEHmbvBfrJ7qWS
 Mr+OEh+8jJB1lFdLBMUJjQ8aHiEFqywA9xpuMseu/6+Wdx92tDrWIImQBfxnfOZXpN9S
 v65lgc0E5JI77yy7MYgAm/OMnCL78rLmnETAoLc9GH+IkYtoGQau4pwJB8qozKQ9p4F4
 Sa/w==
X-Gm-Message-State: AO0yUKUCKMl+wlCRnfzpcYi+/2tk+Sa0Vdb+GG7lRm8JEs/egNKiich2
 3mjOJsI6tPsUaNqLh7dq+CFz/w==
X-Google-Smtp-Source: AK7set/JB2xOMNVpHVZoowg3tmnBogfsihGn8UMB3eRY9FKEh8TiRmePaafNm/r4PfEQeqBy+Y5BPA==
X-Received: by 2002:a17:906:1152:b0:930:c417:1ad2 with SMTP id
 i18-20020a170906115200b00930c4171ad2mr9679120eja.65.1679556747895; 
 Thu, 23 Mar 2023 00:32:27 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:a665:ed1e:3966:c991?
 ([2a02:810d:15c0:828:a665:ed1e:3966:c991])
 by smtp.gmail.com with ESMTPSA id
 v19-20020a1709067d9300b008cff300cf47sm8240016ejo.72.2023.03.23.00.32.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Mar 2023 00:32:27 -0700 (PDT)
Message-ID: <8fe6ee60-b8e8-e2d1-881d-544e12a7325b@linaro.org>
Date: Thu, 23 Mar 2023 08:32:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To: Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Michal Simek <michal.simek@xilinx.com>, Peter Rosin <peda@axentia.se>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20230322173530.3971676-1-robh@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230322173530.3971676-1-robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev,
 linux-amlogic@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: i2c: Drop unneeded quotes
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

On 22/03/2023 18:35, Rob Herring wrote:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/i2c/amlogic,meson6-i2c.yaml | 4 ++--
>  Documentation/devicetree/bindings/i2c/apple,i2c.yaml          | 4 ++--
>  Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml  | 2 +-
>  Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml     | 4 ++--
>  Documentation/devicetree/bindings/i2c/i2c-mux-gpio.yaml       | 4 ++--
>  Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml | 4 ++--
>  Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml       | 2 +-
>  .../devicetree/bindings/i2c/xlnx,xps-iic-2.00.a.yaml          | 4 ++--
>  8 files changed, 14 insertions(+), 14 deletions(-)
> 

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
