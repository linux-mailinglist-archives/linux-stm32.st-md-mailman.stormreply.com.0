Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D4DA575113C
	for <lists+linux-stm32@lfdr.de>; Wed, 12 Jul 2023 21:30:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 77432C6B44D;
	Wed, 12 Jul 2023 19:30:02 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9B3FEC6B442
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Jul 2023 19:30:00 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-51a52a7d859so2496686a12.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Jul 2023 12:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689190200; x=1691782200;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vCDyMfyZw0JBMHEQP3zkn43WOBZMaiSkCPKkobV+TU0=;
 b=KRiPHIywurXs7a/vCB61jmxjOuTF39PCsXp3Cb3aaIEkfrDNF316xsroxHXUDGiinP
 VpKZJSoYGFc+7mMbH7Zed8JkU8kL//1DmZZO77xEEVF57MJI55S/NtUFtsWweziLOhUh
 +22QJTjGpxDapbZ50hqAhEzp2OYwp9QCzjQO2t56QQ42XNo8aEoG6BKgi4V5lOlrXusE
 zTZiXhF8ExMBP9Rpr/M3ecZZBgap1BR+oGFiquS7vASI15z8QooubZaf+VV58U2yXIQ0
 +xdsgWcSm5/lnTJqsG5v4JwbvtnWnIXXBXfOYLSWNhtGaX6iLAMGPEdCnEUK6wHf1KXV
 px7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689190200; x=1691782200;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vCDyMfyZw0JBMHEQP3zkn43WOBZMaiSkCPKkobV+TU0=;
 b=U1o9y411gR2/grpZYQCxNpyl4oEv6b0vPbHnL2dNvKChN7/NMaWrzWXHZnmfCmXmGW
 oS92dnxgJhi6PQiZnWW60eXk1CUT03lhSSgZLUrtdbM/Y2os2r4skd8+vCNec31NZOJC
 8UEXXkv1CVn3lCo191qVqY1Hm5G1mATpv6OjcQs+fIoVdIFHcPXU5x+aoIzSUdl+RSDZ
 2ozyGCoCnFJjcu6uEzSb8DiErjjIDltJRoyBYEUZl2phb7Srgpqq/PPdTfv/bzU4OmNQ
 DQpFki/sW8YgeSeOPBrw4pMFEdhnTywp74W2YJ4ph15A71AoIXq0pbe67t8MxiJfO0jA
 qEWA==
X-Gm-Message-State: ABy/qLYvYQwPFzWpRJkE+OL8MTKvlXMlYZbocCFPcnR804F6yPIACjiu
 Nkx6ME/l4u0vAZX9948m0sw79g==
X-Google-Smtp-Source: APBJJlEaEds1c2vimfu2d4L3qIYc0gZlAn6G4CfWoTav0SMD+/rulpZFWT35TcKT6fjcTnUfdPRrbA==
X-Received: by 2002:a05:6402:3492:b0:51e:48e7:72ca with SMTP id
 v18-20020a056402349200b0051e48e772camr4298779edc.13.1689190199933; 
 Wed, 12 Jul 2023 12:29:59 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
 by smtp.gmail.com with ESMTPSA id
 b22-20020aa7dc16000000b0051bed21a635sm3168330edu.74.2023.07.12.12.29.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jul 2023 12:29:59 -0700 (PDT)
Message-ID: <53ece8ff-c3cf-5c7c-2d1a-243d2569fbd2@linaro.org>
Date: Wed, 12 Jul 2023 21:29:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Sean Nyekjaer <sean@geanix.com>, l.goehrs@pengutronix.de,
 a.fatoum@pengutronix.de, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20230712124248.2400862-1-sean@geanix.com>
 <20230712124248.2400862-8-sean@geanix.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230712124248.2400862-8-sean@geanix.com>
Cc: devicetree@vger.kernel.org, dantuguf14105@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v4 8/9] dt-bindings: arm: stm32: add extra
 SiP compatible for oct, stm32mp157c-osd32-red
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

On 12/07/2023 14:42, Sean Nyekjaer wrote:
> Add binding support for the Octavo OSD32MP1-RED development board.
> 
> General features:
>  - STM32MP157C
>  - 512MB DDR3
>  - CAN-FD
>  - HDMI
>  - USB-C OTG
>  - UART
> 
> Signed-off-by: Sean Nyekjaer <sean@geanix.com>
> ---
>  Documentation/devicetree/bindings/arm/stm32/stm32.yaml | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
> index 4bf28e717a56..232abdcef0fd 100644
> --- a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
> +++ b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
> @@ -143,9 +143,10 @@ properties:
>        - description: Octavo OSD32MP15x System-in-Package based boards
>          items:
>            - enum:
> -              - lxa,stm32mp157c-mc1      # Linux Automation MC-1
> -              - lxa,stm32mp157c-tac-gen1 # Linux Automation TAC (Generation 1)
> -              - lxa,stm32mp157c-tac-gen2 # Linux Automation TAC (Generation 2)
> +              - lxa,stm32mp157c-mc1        # Linux Automation MC-1
> +              - lxa,stm32mp157c-tac-gen1   # Linux Automation TAC (Generation 1)
> +              - lxa,stm32mp157c-tac-gen2   # Linux Automation TAC (Generation 2)
> +              - oct,stm32mp157c-osd32-red  # Octavo OSD32MP1 RED board

I would prefer the change without touching previous lines for
re-indenting the comment. However it's ok if your arch maintainers is happy:

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
