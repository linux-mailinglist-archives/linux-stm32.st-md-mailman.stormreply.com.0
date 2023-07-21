Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2602A75C392
	for <lists+linux-stm32@lfdr.de>; Fri, 21 Jul 2023 11:49:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E118DC6B442;
	Fri, 21 Jul 2023 09:49:47 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5C613C65E70
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Jul 2023 09:49:47 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-3fc04692e20so15278055e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Jul 2023 02:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689932987; x=1690537787;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iU+7OOSQzQMFHjSzk+losa/DYpmzV3td0QjmbD8OzcE=;
 b=CU38tSUuiwOoek4v2FL5CQsijSX/aSA9/ovM080GsgYpu59cWWddJwgrt5Gcqg4c4I
 mPn30/D+E/oPCyr7WH5la3RTuGyALf1Vub7QevSbh82rVRGaALwiPyJWqYPNfwS7PlPA
 BgAqTdEEnpYu6akL3LWskEnPD7wXpDAIvZP07rqWg/IDZ+T7ssK+P52h7mFBkjE1vhef
 mIh3MH32yRpGvPBMHyb5MtbdZceIKwBA9NcIqDscdevVkB9kovoTGcNuS3+FDf/lqFD2
 pOWrgITn4Vq9g8dxYYKVE9J6L63RrEIe6xj4EDXLHCHqzgH2FXvr2y6cGlz7qeN8jBw3
 OinQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689932987; x=1690537787;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iU+7OOSQzQMFHjSzk+losa/DYpmzV3td0QjmbD8OzcE=;
 b=JL4BYhSOaP2KMIWd+wtQA1ljfMp6BUZdnXhD2QByTcfM+GjVnZcPxzMqmbnImQc2DK
 E1aJifnwNlLgSgbAHfaQme7bVozE7lJwzO6GfTeGHscWfSu452U7HFTBGtJdO1FovIcA
 5BKiznfVa2UjAuxjYVrBG0EvrZ1gTuaATQzpN8MjGHGWJh12gwp7E3IhA9WPgME87eu4
 1c+h5cMae6oYrYjDVcpKcxhdTzTj78wsEy4H/q9PVLBUKPpVymDzLTpBJ0UqVd/oOqLO
 a2BxwuxQJ+iPzUorGLAVV2eChWf7jJegJSar6V4bSnuMJPF8UkYvitGQh7TzcyHBAsc7
 I1jw==
X-Gm-Message-State: ABy/qLZGRPoCT4AOtJdVqfbBeXLIsLZKFA1BQ9K7JoTsQftfDM/Gu+tY
 aSTZ12zda9OiCSohi7EgKvcUwQ==
X-Google-Smtp-Source: APBJJlGL4iXmvdaweLqokx1Qb8W7E+7GdMaLV9cDNq0ZjTqEAMEWtatDIFOG4pZNJXsA2SFLZRqSrA==
X-Received: by 2002:a05:600c:ac6:b0:3fc:5606:c243 with SMTP id
 c6-20020a05600c0ac600b003fc5606c243mr1078931wmr.13.1689932986828; 
 Fri, 21 Jul 2023 02:49:46 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
 by smtp.gmail.com with ESMTPSA id
 q14-20020a1cf30e000000b003fbe561f6a3sm5832321wmq.37.2023.07.21.02.49.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Jul 2023 02:49:46 -0700 (PDT)
Message-ID: <3cf3319b-d071-fc49-031b-befc09ffdc32@linaro.org>
Date: Fri, 21 Jul 2023 11:49:43 +0200
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
References: <20230721090618.1211081-1-alexander.stein@ew.tq-group.com>
 <20230721090618.1211081-2-alexander.stein@ew.tq-group.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230721090618.1211081-2-alexander.stein@ew.tq-group.com>
Cc: linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 2/2] dt-bindings: leds: Add
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

On 21/07/2023 11:06, Alexander Stein wrote:
> This is a gpio-controller, so gpio-line-names should be allowed as well.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  Documentation/devicetree/bindings/leds/nxp,pca953x.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/leds/nxp,pca953x.yaml b/Documentation/devicetree/bindings/leds/nxp,pca953x.yaml
> index edf6f55df685..973c5fccaf4e 100644
> --- a/Documentation/devicetree/bindings/leds/nxp,pca953x.yaml
> +++ b/Documentation/devicetree/bindings/leds/nxp,pca953x.yaml
> @@ -28,6 +28,7 @@ properties:
>      maxItems: 1
>  
>    gpio-controller: true
> +  gpio-line-names: true

Missing constraints. Different chips have different amount of GPIOs.

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
