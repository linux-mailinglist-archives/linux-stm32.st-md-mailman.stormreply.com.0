Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9541A6C0160
	for <lists+linux-stm32@lfdr.de>; Sun, 19 Mar 2023 13:06:55 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 53D44C6A5E7;
	Sun, 19 Mar 2023 12:06:55 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1D66CC57B6A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 19 Mar 2023 12:06:53 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id r11so36796304edd.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 19 Mar 2023 05:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679227612;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3GQ0kuX+CANTyKsciGzMU4Vb8Jeilt6T7QwH/C5HtcI=;
 b=wyyRNf1RVCSmVWy3uIQD6gbqmoxHXa4hhnuxOXFy5DSK6KoJMRW/7snBe+hAcOuLSh
 4Lil0xPsXtCAFbTqAzDdtCyDhPRNI/pweLUmN6KTonFGYaLFKA2c641IjtNvE0333K/0
 iwf8OUVV6CImiDOkzXbLoQxSXxGLT1pNVgzmz8rjCC4TtF0xRkBnaw2J6Q6fsDn6B3vO
 qGuzkd5xHcL84vTvayPMp0BjhvSj1BaD45jc37kce8oQ795+M7hlUkz5iakVRZLdUngL
 KVKgU5E9wG7BR2kQZUT4ObnjiJ9P0zF028UvVcHQPrlM6HIR4Yc/BHO1sVUHHif7PQzP
 va2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679227612;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3GQ0kuX+CANTyKsciGzMU4Vb8Jeilt6T7QwH/C5HtcI=;
 b=wspvTB7BNOzwyyZhnxIBUHKA8C1EGKjfm0wD3V21NnvPiVg6bAX/KmVWEnK6ud2IJq
 jpgT9AKon8LWc2n8bnFILLr55zgu794cymg1cQM3oBc7NjdrMrOHbHfjzcp7S2SXsUfO
 M69LYnk81WWUObxAiJ/CsE9eTVZAJRmTRcmpwrvPizkOsoCmV2GXUX1oZUyB/VbQbpxZ
 TLnmiWwGFFvs/8zRBqj21gnustf3kwHHdYcpm/YNjkhKH7lANIj3/EH+PZeaFwVnD84i
 cdlN69iTm0ebU6ImgmkIgfR3UgEF2lBYebQ2JzSZmJacGwF+GuSAqBqiO2TyEmZvZdIW
 pxkQ==
X-Gm-Message-State: AO0yUKVuU+/CyVH8Ks9E3YB/gysxoLmpRL9Re6WUQMvqlco+Py6iH+iv
 98jIPPMa9uL/Qg0oNXoC1H7uOw==
X-Google-Smtp-Source: AK7set80QOZ+DV1BMmqsy+GIRzW1eJc2fyUakkB2BmV/dLpU+3H5MSHjgo5dvspVJM8r1tWCDkHtFw==
X-Received: by 2002:a05:6402:4d2:b0:501:c120:6e90 with SMTP id
 n18-20020a05640204d200b00501c1206e90mr1103738edw.3.1679227612697; 
 Sun, 19 Mar 2023 05:06:52 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:5b5f:f22b:a0b:559d?
 ([2a02:810d:15c0:828:5b5f:f22b:a0b:559d])
 by smtp.gmail.com with ESMTPSA id
 qx20-20020a170906fcd400b008eaf99be56esm3244862ejb.170.2023.03.19.05.06.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Mar 2023 05:06:52 -0700 (PDT)
Message-ID: <a4d6ef37-77a4-bdf7-9281-681864b901d3@linaro.org>
Date: Sun, 19 Mar 2023 13:06:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Hans Ulli Kroll <ulli.kroll@googlemail.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>,
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>,
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20230317233634.3968656-1-robh@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230317233634.3968656-1-robh@kernel.org>
X-Topics: 
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: rtc: Drop unneeded quotes
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

On 18/03/2023 00:36, Rob Herring wrote:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
