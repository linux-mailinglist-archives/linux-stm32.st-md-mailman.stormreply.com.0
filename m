Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A46DF78FC5E
	for <lists+linux-stm32@lfdr.de>; Fri,  1 Sep 2023 13:40:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5053CC6B44D;
	Fri,  1 Sep 2023 11:40:05 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1A6BFC65E56
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  1 Sep 2023 11:40:03 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-500a398cda5so3367080e87.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 01 Sep 2023 04:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693568403; x=1694173203;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Kp69p9Zx8jZm35in4Sfoz8ZwxS7m1KLnjf2cXSylp44=;
 b=gPYEEvgwXYRHDeN2qhNHLMQek0z5UAEmlAo9ejtTeX/Vf9tm82AqX2baqCbBpUaIxw
 aIRsaE4IoOtlYkTED0AEGETzpJuOIfhz+ZAmhSKQPpmKsK1lcKYraQHrDb9tSjc00/fC
 xIcVRCXrdt4/bCWcmfc70AJJWnoGEfIT7Tnn1GbrpjfYuY6WyEL4AjFbauHhBqI8TgN1
 uVePdIM7XhKDB6+y/ZetAthOTdpQXVzLgOFPZ/cQeLM1DTnx3Fa/mhKxt5QaBXLiaLvx
 vAhr9/z/s5IMf+YqLKXJuJsO10WgMI+UK2qdLIwIGaaHtms2VIrKwFzWPRcoovbke85u
 2zkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693568403; x=1694173203;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Kp69p9Zx8jZm35in4Sfoz8ZwxS7m1KLnjf2cXSylp44=;
 b=YF/QwIHA9FU7niJprsvy00KLR9LzLctoZ7WbSihZwgJ6BrTbuGdNpPbyLVdQAWRJxF
 D3mvILrmanVbpoITB3ZCBRETEaaU+IHE7LzMfKAg3NQzSL/0F7tkqkaimgDPlxd86INc
 +WSMW7PGJrTayRrb7iVT4Gui7QrMcTxxh8NatC60KvkrXT2ymLKP3bvZyQXZsz0v6dHq
 Ox7WqxSjoUD2G0fC42Ue3KT8OQM9kkOVn0ixxm1ZILYqAa2WSqOUle26gW5YncORv62Q
 cStqkRy1inan6rR1wRyWrjRsetOJgFBOMlBR8oP01hpiSjkXnVLrE5jQ8jVwhzchDlEr
 H04Q==
X-Gm-Message-State: AOJu0YyzgX9DojgDPt+NqT8wNSfmU6ajatsGvp3VTL4IgclNI1V0bcAv
 COqRfzXk5Y+DxvBU9BXKm1cLzw==
X-Google-Smtp-Source: AGHT+IGZbpHK6jfi7srWUarjgvFSbRnzBUrg+9jzA8L4rbc+OlK095lmkX03nbPqC8p+0N3Jyvqy6w==
X-Received: by 2002:ac2:5b8f:0:b0:4ff:8c9e:eb0d with SMTP id
 o15-20020ac25b8f000000b004ff8c9eeb0dmr1369836lfn.0.1693568403181; 
 Fri, 01 Sep 2023 04:40:03 -0700 (PDT)
Received: from [192.168.0.22] (77-252-46-238.static.ip.netia.com.pl.
 [77.252.46.238]) by smtp.gmail.com with ESMTPSA id
 u20-20020a056402065400b00529fb5fd3b9sm1960356edx.80.2023.09.01.04.40.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Sep 2023 04:40:02 -0700 (PDT)
Message-ID: <ac74775f-ea4f-7eba-e989-136524e96c81@linaro.org>
Date: Fri, 1 Sep 2023 13:40:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
To: Alexander Shiyan <eagle.alexander923@gmail.com>,
 inux-arm-kernel@lists.infradead.org
References: <20230901103856.31091-1-eagle.alexander923@gmail.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230901103856.31091-1-eagle.alexander923@gmail.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2 1/2] dt-bindings: stm32: document
 MYD-YA15XC-T development board
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

On 01/09/2023 12:38, Alexander Shiyan wrote:
> Add new entry for MYD-YA15XC-T development board.
> 
> Signed-off-by: Alexander Shiyan <eagle.alexander923@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/stm32/stm32.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
> index 4466b455bffa..1bde704bcd65 100644
> --- a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
> +++ b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
> @@ -140,6 +140,13 @@ properties:
>            - const: engicam,microgea-stm32mp1
>            - const: st,stm32mp157
>  
> +      - description: MyirTech STM32MP15x SoM based Boards
> +        items:
> +          - const: myir,myd-ya15xc-t   # MYIR MYD-YA15XC-T STM32MP151C
> +          - const: myir,myc-ya15xc-t   # MYIR MYC-YA15XC-T STM32MP15X SoM

I don't think you can have one compatible for all of them. The 153 and
157 variants differ by number of CANs, which are probably enabled in
your board DTS?

Also, I cannot find ordering of 153 and 157 variants:
https://www.myirtech.com/list.asp?id=658
so I wonder if they have actually same part numbers.


> +          - enum:
> +              - st,stm32mp151

This is highly unusual syntax - I think no other binding in Linux kernel
uses it. It is correct and I understand why you did it, just might
confuse others as we usually NAK it. I think less confusing would be to
have here const (with the price of duplicating this per variant).

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
