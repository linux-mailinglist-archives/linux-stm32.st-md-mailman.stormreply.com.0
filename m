Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8873A572F67
	for <lists+linux-stm32@lfdr.de>; Wed, 13 Jul 2022 09:43:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 26CFFC640FE;
	Wed, 13 Jul 2022 07:43:16 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 144CBC06F81
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 Jul 2022 07:43:15 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id j22so18403142ejs.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 Jul 2022 00:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/VlnmlHCQfW3p97UCy5YcE83IQ1M7mTcSHN9rJn92L0=;
 b=DMmVsyTnzW/ZzHy/WNEhXKuJ/wvbeUmmgXu5noAA5OBSdWDoQXacYqh811HBuPUcB2
 1704vMKky0r/XykIbgErzhYfAUaQwcS9in9Iyv7UDr89rtWYHrjgAoS4/ftDM13e6zET
 6Zq3W/iDUAstij4E96pl6A4dFBehNRT4BC9T4B+TDbUnPluj2ffkyJngYthP+RTyypoS
 8Ngpxqp4L5W5uQXKECMiWjztav+0/GDWvhzTqjfXmJSqE4LeJbCOxop9s0KYRQHCvYwi
 E53Ud0ve7qzEcCxNGVvfN7QIMwZ7/wVNGUlwjNS+1AxhR4BSF0jl8P02UdhUEjzq2usI
 6Yhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/VlnmlHCQfW3p97UCy5YcE83IQ1M7mTcSHN9rJn92L0=;
 b=MMp7Sinv6tKac90eQ0wig5T4+WabF25u20qOQS4dSWLyQM9057B1MYB4ufKuPAsi82
 ajUV08VJEPJQ4Yrc4mRrL7l8RftAmc2lyB2TlAlFdlltLRU9Vf4/hDEZPr4XU3Mvcmte
 iRmGkhh0ev77ekoz9RwhdZ2tW7Fin5rCIYINauzE9qS4fS1I2yT6NZHuvwGy13HsPye7
 lOoYt0I0zrv04BEEazO59vcNC7xPbRaqzycaOyvq9kNdphDp7LI7Dvedf3FZO5+Q1N64
 i3gKWUbNAii5ehjG0PZObTlNMMm5waQD/dky3onjIXqrlD5Uc05KUw5smRSL6FSyMap6
 8uYQ==
X-Gm-Message-State: AJIora/FU81O+y5C2BPPgpwrl/hyNykfWI19h5tbaQolDe82t+L7UYKM
 007X2A7wmKGXX6G3CNZIKoDu0GIuWrw7ldWRp9QIwA==
X-Google-Smtp-Source: AGRyM1sqqwrs67V0xYX+vIkQzt1SsBz/eWMrr7ikKraa6psgwLTFp/02ZOU5oQQud0MALSLXgtkrRGzhBoT1X0IdY9c=
X-Received: by 2002:a17:907:87b0:b0:72b:9f0d:3f89 with SMTP id
 qv48-20020a17090787b000b0072b9f0d3f89mr1053322ejc.734.1657698194579; Wed, 13
 Jul 2022 00:43:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220712163345.445811-1-francesco.dolcini@toradex.com>
 <20220712163345.445811-4-francesco.dolcini@toradex.com>
In-Reply-To: <20220712163345.445811-4-francesco.dolcini@toradex.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 13 Jul 2022 09:43:04 +0200
Message-ID: <CAMRc=McUdeXSNwE9WBVh_ZrsL+-WusEQjqcuE2v=m1exHS6_eA@mail.gmail.com>
To: Francesco Dolcini <francesco.dolcini@toradex.com>
Cc: devicetree <devicetree@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-iio <linux-iio@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Linux Input <linux-input@vger.kernel.org>, Lee Jones <lee.jones@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v2 3/5] dt-bindings: gpio: stmpe: Remove
	node name requirement
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

On Tue, Jul 12, 2022 at 6:33 PM Francesco Dolcini
<francesco.dolcini@toradex.com> wrote:
>
> STMPE driver does not require a specific node name anymore, only the
> compatible is checked, update binding according to this.
>
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> ---
>  Documentation/devicetree/bindings/gpio/gpio-stmpe.txt | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-stmpe.txt b/Documentation/devicetree/bindings/gpio/gpio-stmpe.txt
> index a0e4cf885213..b33f8f02c0d7 100644
> --- a/Documentation/devicetree/bindings/gpio/gpio-stmpe.txt
> +++ b/Documentation/devicetree/bindings/gpio/gpio-stmpe.txt
> @@ -8,8 +8,7 @@ Optional properties:
>   - st,norequest-mask: bitmask specifying which GPIOs should _not_ be requestable
>     due to different usage (e.g. touch, keypad)
>
> -Node name must be stmpe_gpio and should be child node of stmpe node to which it
> -belongs.
> +Node should be child node of stmpe node to which it belongs.
>
>  Example:
>         stmpe_gpio {
> --
> 2.25.1
>

Acked-by: Bartosz Golaszewski <brgl@bgdev.pl>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
