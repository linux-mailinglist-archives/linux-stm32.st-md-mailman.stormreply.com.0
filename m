Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB9772160B
	for <lists+linux-stm32@lfdr.de>; Sun,  4 Jun 2023 12:26:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1F983C6A5FA;
	Sun,  4 Jun 2023 10:26:53 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 59F55C6A5E7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  4 Jun 2023 10:26:52 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-977d6aa3758so19653966b.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 04 Jun 2023 03:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685874412; x=1688466412;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AJSHI/wM8OxoIZMScQKHzgdshhk+Z+V6iSUOb3f+fUo=;
 b=WBLIufn6FaDKJRlxmznzODTyp1EIkLlA9g0b7y9YQaN397riJeRgHOvmEhWu6QQTfg
 SIcsO05Y0x5Fo1CswjmM7AnZhLK/2Y6BLTVOVNW9UcKm8rKWzuKnbmChqwJsbbfr52ar
 jvioklNjVDfKH2xnlvzIibk3XTxlqrDVrsrgQHNUoWT7nETIhEc96bg+EzJBBrzeaNYL
 BUq1uwWS+eFrUcrkJX3a5BivOWVLvL/+tV7n8qnju7ZJKj665NBcpyPfwgjleO9dUHZV
 C2NjCIb0Tgorq+YFUbunBkpv4MIECxPrlKlHFPoL+mzVzizOvGfLUqmJlmePrjp2lCZJ
 zMMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685874412; x=1688466412;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AJSHI/wM8OxoIZMScQKHzgdshhk+Z+V6iSUOb3f+fUo=;
 b=WdHQET2YcXpd6Rc/In0Q979a4gTn0w+wG9kWfNik1llOIyyo6w886Mq+snNE8ZtNaZ
 HklPW99hC8peI/QXSLLlMbC2xMti3gX8VOrFUR3agRpyZVyI3UDiYB/LaKUlC7GHozeP
 Uu4rx2z1iVd4f+xKpIv33WJKKfIXFEN1zIFcxHyp3A4s8S8JOBW+wNAZDzsAZ0qtOr05
 mSlJgYPLOAcqevAXuGkM1sv69RJ86pdYwwDlQvKMaSlRD0r3X1QfNvbL1jZAHouF8NO7
 /cbj51NB1o6d1uLqhAtbA6CtSGHZXaK9JF+LfKOgu+YrRMU1kt+4sWK/wuP0VGSRoFYx
 nwfw==
X-Gm-Message-State: AC+VfDxMt76BD0JT8hzWmvk4XWCyDnrl61pjUkGORN7khoJfarGwAtqq
 PbcGWk3BnPaCr4hREVBdFHP6lQ==
X-Google-Smtp-Source: ACHHUZ4JYlaRMEe60I46ZCyR3ZzQ9mtSGPn76sEYeljxg2b0VEu14Ft6nUd4H17cb/XZHAbY26cixw==
X-Received: by 2002:a17:907:1c25:b0:977:d48f:97ad with SMTP id
 nc37-20020a1709071c2500b00977d48f97admr1102482ejc.75.1685874411803; 
 Sun, 04 Jun 2023 03:26:51 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.199.204])
 by smtp.gmail.com with ESMTPSA id
 qu25-20020a170907111900b00974530bb44dsm2905545ejb.183.2023.06.04.03.26.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 04 Jun 2023 03:26:51 -0700 (PDT)
Message-ID: <cd4501ab-a088-cd2a-51c8-a469a66b7af5@linaro.org>
Date: Sun, 4 Jun 2023 12:26:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Content-Language: en-US
To: Olivier Moysan <olivier.moysan@foss.st.com>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20230531140912.819373-1-olivier.moysan@foss.st.com>
 <20230531140912.819373-2-olivier.moysan@foss.st.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230531140912.819373-2-olivier.moysan@foss.st.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 1/3] ASoC: dt-bindings: stm32: document
 audio of graph port for i2s
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

On 31/05/2023 16:09, Olivier Moysan wrote:
> When linking the STM32 I2S to another DAI component, according
> to audio graph cards bindings, an OF graph port property is expected
> in the node. Document the port property.
> 
> Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
> ---
>  Documentation/devicetree/bindings/sound/st,stm32-i2s.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/st,stm32-i2s.yaml b/Documentation/devicetree/bindings/sound/st,stm32-i2s.yaml
> index a040d4d31412..3bc917a45802 100644
> --- a/Documentation/devicetree/bindings/sound/st,stm32-i2s.yaml
> +++ b/Documentation/devicetree/bindings/sound/st,stm32-i2s.yaml
> @@ -61,6 +61,10 @@ properties:
>      description: Configure the I2S device as MCLK clock provider.
>      const: 0
>  
> +  port:
> +    $ref: audio-graph-port.yaml#
> +    unevaluatedProperties: false
> +

Extend the example.

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
