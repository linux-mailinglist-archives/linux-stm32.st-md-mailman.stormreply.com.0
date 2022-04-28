Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 105D0512D5A
	for <lists+linux-stm32@lfdr.de>; Thu, 28 Apr 2022 09:52:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C592DC6046D;
	Thu, 28 Apr 2022 07:52:27 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D6281C5F1EF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 28 Apr 2022 07:52:25 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id g6so7902786ejw.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 28 Apr 2022 00:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=GDe4fbXhNYRyQLVQcRqvZFo+IyJ/gzKdBJXzfm/RHKQ=;
 b=DoC2Ul7QZteiwyq2vlY+yfBneqtGpD5/xJbSGVmb43FoVRYGkrBiA12rQkZmQ8OGHR
 oTHssGul06VTMM1zZEE/2/a4UIQK5k5ltPSAPMW2XeNoySn8kR0A5JQ4stqivqJ9f51u
 OUYq7uo2KWTAuPAPt2DaivMKd4eDXiL4jppcoI5FIJXZg78TFwySQByuKJnA5VTru3tr
 RiuyZQJ9H2ZR3yztpSy4e5ZXI692JDh1cW/aWmKsKYDQHDO+bgO8hfoVd7M1AxLC7T+H
 pJsStYnsMXIrzochMq3sNC6Lm+xbllkj9RsQpcDK77D6Bi/a3V+vuEI/ujJGAfgbxIZi
 xOFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=GDe4fbXhNYRyQLVQcRqvZFo+IyJ/gzKdBJXzfm/RHKQ=;
 b=mdvah2RdO7uqn7ovxk8rOVU5uGX5mGP062oTroDrbEd6fMtUnRXYZaQfNo486nrp+p
 hbonFuSTdWSgQmjTLoUtVKb248JFlcCMgPny5tEoJ1c4b/9s3edVug+t09YswUCfKDX7
 8b2T0jzuyMrFW93B9MOu60MsyNEXugI0P2xsmauRTwQD+oEGIyX/xsopuepXhc9Qad5I
 FkaCbQq0E6tlfC4QHn5rST73S66UZ1qxrggozgSZdThz0C0SnPEzC7KxuUW0XF/0N1Ch
 TyAr/aK5ZcNBMtpwDiRhN4e8FU5IBPvkgC2/9PdZuIOrjyZrIMrHO1dddOKZUsBWKtIr
 30dg==
X-Gm-Message-State: AOAM5317aT7rPVQJMXR0ensjQcVnaCudKnhyYL9ub++XVq5XW/yoMueY
 CpAcuXlZHoZMq4kcaH/Ao5kTAw==
X-Google-Smtp-Source: ABdhPJxcOk/BGrp7s0YFnwX2EGmsFKG7/CsaS03hRPpVL096TfZAnbCxF2kUpprXac9SaGSvjWccoA==
X-Received: by 2002:a17:906:c146:b0:6f3:e1b1:70ec with SMTP id
 dp6-20020a170906c14600b006f3e1b170ecmr1603870ejc.75.1651132345431; 
 Thu, 28 Apr 2022 00:52:25 -0700 (PDT)
Received: from [192.168.0.160] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 lb18-20020a170907785200b006efe7bb40b0sm7955449ejc.74.2022.04.28.00.52.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Apr 2022 00:52:24 -0700 (PDT)
Message-ID: <b23817dc-ee8d-11eb-99d0-2e8ee75b067a@linaro.org>
Date: Thu, 28 Apr 2022 09:52:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Oleksij Rempel <o.rempel@pengutronix.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 =?UTF-8?B?SsOpcsO0bWUgUG91aWxsZXI=?= <jerome.pouiller@silabs.com>
References: <20220426073511.1160119-1-o.rempel@pengutronix.de>
 <20220426073511.1160119-2-o.rempel@pengutronix.de>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220426073511.1160119-2-o.rempel@pengutronix.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@pengutronix.de, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v4 1/4] dt-bindings: arm: stm32: Add
 compatible strings for Protonic T1L boards
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

On 26/04/2022 09:35, Oleksij Rempel wrote:
> This boards are based on STM32MP151AAD3 and use 10BaseT1L for
> communication.
> 
> - PRTT1C - 10BaseT1L switch
> - PRTT1S - 10BaseT1L CO2 sensor board
> - PRTT1A - 10BaseT1L multi functional controller
> 
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> ---
>  Documentation/devicetree/bindings/arm/stm32/stm32.yaml | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
