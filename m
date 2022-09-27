Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F35D65EC25D
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Sep 2022 14:19:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BB4C6C63326;
	Tue, 27 Sep 2022 12:19:11 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 538EEC03FC4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Sep 2022 12:19:10 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id lc7so20400339ejb.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Sep 2022 05:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=0ZK1eijlfuB75W2R5VMV3jU4dLlENKu7GQ8sbTsnldo=;
 b=AssFJQ50nKYv9yXu5A0ATQRovpLXsd174gZnDiKQQK3Uxr82lwlViEkQ8hhOLcnedu
 QJSy8EE8GBOibVWRJ7PDOY6sOLhOG0FSB2/xbsGTRbs7BezNc2QNmksjXwSqvcRZJPwm
 srl+gGbXWj+qHX2h+3wUAClvyzrHWs51LC3VDL8kFPFHH7p65GOcWaHQTycA/VVxj5K7
 ZkIRtgZJ9yy6160sQVOFeAYxdhZnKdRINmchwd5KlKmz+M48+ZZdYaW1q7JrHRmC41/0
 wMCjuyvifCkYikZFk/uFiJL3CXCZEt8tbf5OMhxyh/r+WPRgtXIHGAOB6UnlUoSfjj1q
 fnLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=0ZK1eijlfuB75W2R5VMV3jU4dLlENKu7GQ8sbTsnldo=;
 b=FIVxeKjGH11ZZcQofDlJh/HYPag8bC0KrI0q0c3+ZCAyiX+rChbtxsFBcaDnsqVyxM
 wv1e2RVaHaU5LZfJStsMyEBKMHfz5/qrv6A3IhWpnLZl2UyCP5eLUo/YPTwTAGY1E9bS
 4R816xOV5lJropX1lMVqCZiJLliQjG+yWeEtllDARuR0mfCAuGzcbmidwiYzeVGXwfX+
 tcuphfbBbjrR1KaC+/dCqdf5cPJSD1WjT9xIvngxBGJMoUxRMPu4bg0QA52arUnRiB8i
 K+53ZKVVCV1bxLf3YXZu06L9qLLJU2FOK/PA3p17Thrqz4U+QlyqyIYaXaJbN8ET7fuL
 xAQw==
X-Gm-Message-State: ACrzQf0NXfk8S7knktl9X6yY6te5ZKFBgfVNC72yL5q0xg0Fst4FBRc/
 RzpDiDe95Ozt2dLQPvJnm+4UhUiUuMC8pUpK4Shi4Q==
X-Google-Smtp-Source: AMsMyM4DBYJmlp+aMpC8DVQo7RHtEZBA4GNatpgLZtI9iqTDVOWQDaV5gCeqqOh4C6ZJbQPRD5NTCS6UK/7FcGYWGVo=
X-Received: by 2002:a17:906:58c8:b0:6fe:91d5:18d2 with SMTP id
 e8-20020a17090658c800b006fe91d518d2mr23079321ejs.190.1664281149918; Tue, 27
 Sep 2022 05:19:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220927104138.5924-1-marex@denx.de>
In-Reply-To: <20220927104138.5924-1-marex@denx.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 27 Sep 2022 14:18:58 +0200
Message-ID: <CACRpkdaA=3QU+_HQkK6RSe4qQJ28O4BbtT6jHuKeVjKqaqLJaQ@mail.gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: devicetree@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
 linux-mmc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2] dt-bindings: mmc: arm,
	pl18x: Document interrupt-names property
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

On Tue, Sep 27, 2022 at 12:41 PM Marek Vasut <marex@denx.de> wrote:

> --- a/Documentation/devicetree/bindings/mmc/arm,pl18x.yaml
> +++ b/Documentation/devicetree/bindings/mmc/arm,pl18x.yaml
> @@ -99,6 +99,9 @@ properties:
>      minItems: 1
>      maxItems: 2
>
> +  interrupt-names:
> +    const: cmd_irq

This hardware come in variants with one or two IRQs.

Either two: "cmd_irq", "data_irq"

Or one combined IRQ (logic OR between those two!)
I don't know what that should be called, perhaps
"cmd_data_irq".

Since all DTS:es then have to be patched an alternative
is as Arnd says to just delete the names. We should however
at the very least patch the bindings description: for the IRQs
to make the above situation clear.

Yours,
Linus Walleij
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
