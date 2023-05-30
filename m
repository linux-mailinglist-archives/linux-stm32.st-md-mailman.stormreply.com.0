Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BEFCA7162FE
	for <lists+linux-stm32@lfdr.de>; Tue, 30 May 2023 16:04:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 84564C6A613;
	Tue, 30 May 2023 14:04:36 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D168CC65E5A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 May 2023 14:04:35 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-510f525e06cso7860401a12.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 May 2023 07:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685455475; x=1688047475;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QYxvmLTRS13Ehc3QgciGTadH+O7LLfNmtYTSHMK4epM=;
 b=AfV/EiRzkrXsTyysLyhpCFT8cI/HfscqQp0tI3HrhAPz4ynNqrdym/iIYy5F/pw+74
 B9HnS9kFRB3OrvdSz+l1t5ler1GR1rUzWopwNykAPsXX4pJiWJEynSMnuIuoelqSREbq
 ozI4/MsvwNS9UHhbajkaDiRF0QC22E9exrDbrPg1dJ7luqtjpqEU6/CoFoDMGV4u1kUz
 MT9BzkXx9EfhaR9lPnuDXjPH/zoC7cnRLgGeYwlHHNve2aQQ2qD/vNc5NPFtAX0ymfoI
 ksq577fC4rGw/UrfFPjDK2aAU68qmtvXNsSuq2Jp16qUQXVVKU9+RxFPFbIcvR3uR9I2
 PR6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685455475; x=1688047475;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QYxvmLTRS13Ehc3QgciGTadH+O7LLfNmtYTSHMK4epM=;
 b=U51p9rnPlS8jrrjND6tUzHhvGljBKB9PJyghU8gLewkA70G0VbwlGSoTmYK7cT/bZQ
 NSmWOQja//7ALdU54GRN0DrUn0oK5w0LX5sS/vcmQzH06Rol5PsQLECsyHiNkBIWOofC
 4MHZ9b5AIMQvUfZnkutc1ubK2N3xFj3OWM+m1tNk00I0HvMtmeGTSAYytqIxK8pPgMZQ
 GrOifb/EvQzB4WCyaUGWEC6vpTqg79mjwo9pN3c5phi38q7Z9gGvC4e9S9WEQfEd46wY
 HS5kdZTQH1CHX3KlNorqu3Rs4kb7/iYym445QbCaTDmckwZlkDY6xoFXymk33ZG/dAcN
 7B8g==
X-Gm-Message-State: AC+VfDyjl+X3KohfIpxJgbpHfDoz7BZxkjM/xfW8jmaISjaoihkhBD97
 bqDu0Zmwl4nI3lAIgR77DkpR/Q==
X-Google-Smtp-Source: ACHHUZ65SdQ7bm40X1xjIzR//czjn3KI6YOqjCZL15qypKnRSXEwK+KSK6hQIq2PFBtO6Vd526Gbkw==
X-Received: by 2002:aa7:dccd:0:b0:50c:cde7:285b with SMTP id
 w13-20020aa7dccd000000b0050ccde7285bmr1610460edu.29.1685455475339; 
 Tue, 30 May 2023 07:04:35 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.199.204])
 by smtp.gmail.com with ESMTPSA id
 r25-20020aa7da19000000b00510d8e43fe0sm4415999eds.7.2023.05.30.07.04.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 May 2023 07:04:34 -0700 (PDT)
Message-ID: <ca6042f7-5586-8f7d-19a1-73a3676697f6@linaro.org>
Date: Tue, 30 May 2023 16:04:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Oleksij Rempel <o.rempel@pengutronix.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 =?UTF-8?B?SsOpcsO0bWUgUG91aWxsZXI=?= <jerome.pouiller@silabs.com>
References: <20230530083713.2527380-1-o.rempel@pengutronix.de>
 <20230530083713.2527380-3-o.rempel@pengutronix.de>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230530083713.2527380-3-o.rempel@pengutronix.de>
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@pengutronix.de,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 2/3] dt-bindings: net: pse-pd: Add
 "ethernet-pse-0" example to improve validation in podl-pse-regulator DT
 binding
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

On 30/05/2023 10:37, Oleksij Rempel wrote:
> This change adds a new example, "ethernet-pse-0", to the device tree
> binding for podl-pse-regulator. This helps improve validation by
> supporting more types of node names.
> 
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> ---
>  .../devicetree/bindings/net/pse-pd/podl-pse-regulator.yaml  | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/pse-pd/podl-pse-regulator.yaml b/Documentation/devicetree/bindings/net/pse-pd/podl-pse-regulator.yaml
> index 94a527e6aa1b..25d237e0f406 100644
> --- a/Documentation/devicetree/bindings/net/pse-pd/podl-pse-regulator.yaml
> +++ b/Documentation/devicetree/bindings/net/pse-pd/podl-pse-regulator.yaml
> @@ -38,3 +38,9 @@ examples:
>        pse-supply = <&reg_t1l1>;
>        #pse-cells = <0>;
>      };
> +  - |
> +    ethernet-pse-0 {

It's the same example. No need for new one with different node names.

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
