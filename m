Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C71E36C00D8
	for <lists+linux-stm32@lfdr.de>; Sun, 19 Mar 2023 12:37:35 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8F6E0C6A5E7;
	Sun, 19 Mar 2023 11:37:35 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 05E17C57B6A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 19 Mar 2023 11:37:34 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id eg48so36503891edb.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 19 Mar 2023 04:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679225853;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zjQK98wMTvC2q3E7fdiQTGy4CfE9nib0P1aeqr32BDM=;
 b=CNN+BQW1qwnIWDvTxDCdF3J/x2g//K0JqhfSGQ0F1o+DOFxtJMpexG7Zg2xkstrcG3
 N+bDvSoc3N+PX8xxyOpd4P5FQyhLI7jmL6DiHr17l04ctANkt/h/obwznW6Ey2lYYQQU
 eP2I596H+O3bmLUf6p+46nb/f7yBcuo7lzxfgySwO2BcdcVmDv45qTT7YshpQk33z034
 C3rS/NaL3yaQbNCXzcGPGc5C4/FRf1ebAXvgljWLU1fDQSFe8a8q04Z4NFFYizrr+uiC
 AYnUZxGFufy4sIdurjFrVZbDayiYAgPBKzWOFy1RXzaONpIXOOt6Ffh7VM4DM14tCvBD
 itHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679225853;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zjQK98wMTvC2q3E7fdiQTGy4CfE9nib0P1aeqr32BDM=;
 b=F/iOVnd6y9uG2bjZv9vju+ASOFKYLwuHh0vR1wetiJbJQdBt54CnpGYx7Pnj9J9CEC
 PyyX8yUV/sDPhkmhOgmp08OE7L6+9hWcpsL17DJkAErBHTSLuFumM6AcRvEerh2ovwSc
 RBR4EZZJ2wcEmDLiL7BHLTMuU2wcXYMDt5Jjog7VRdMBjOGj60WKyN1bw+AlmYwqMXBa
 uyXzWqP6iQniFHqe55QhCGExQDSqSxQydbECS4mBLIAozEBbKde9zJkfccMGikYvZIDP
 bKDGwGIiyvEdSEOGmi/e4Bdxe0mi/yjCFc5LONVEsRSVpZ6udB6R3Mc/x07HZ+g0NSIy
 YZMQ==
X-Gm-Message-State: AO0yUKVCisQ8EIa4ZAbclJelYsMokunr9Eju2THByRaz85th3i0ZRbiu
 OPNhSvJnJsz5EkKRn1uq6kebtA==
X-Google-Smtp-Source: AK7set9U0AOSAuCrrvQlU6ITw/snJRIJElKkSVMThrbqvxYqk0NpWETXKzJ097yOzmwdgjDNpq92Zg==
X-Received: by 2002:a05:6402:c2:b0:4fe:94a2:81be with SMTP id
 i2-20020a05640200c200b004fe94a281bemr8384168edu.7.1679225853579; 
 Sun, 19 Mar 2023 04:37:33 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:5b5f:f22b:a0b:559d?
 ([2a02:810d:15c0:828:5b5f:f22b:a0b:559d])
 by smtp.gmail.com with ESMTPSA id
 s29-20020a50d49d000000b004fc2a75c6b3sm3408547edi.23.2023.03.19.04.37.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Mar 2023 04:37:33 -0700 (PDT)
Message-ID: <7098b2cb-eba9-ebae-1edc-f4c934bbd898@linaro.org>
Date: Sun, 19 Mar 2023 12:37:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Hector Martin <marcan@marcan.st>,
 Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Julius Werner <jwerner@chromium.org>, Evan Benn <evanbenn@chromium.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20230317233643.3969019-1-robh@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230317233643.3969019-1-robh@kernel.org>
X-Topics: 
Cc: devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 asahi@lists.linux.dev, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: watchdog: Drop unneeded
	quotes
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
