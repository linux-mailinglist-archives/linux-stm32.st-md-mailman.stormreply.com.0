Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E88E05AF401
	for <lists+linux-stm32@lfdr.de>; Tue,  6 Sep 2022 20:58:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8B5C5C63326;
	Tue,  6 Sep 2022 18:58:53 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 08729C03FCD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Sep 2022 18:58:51 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id gh9so3485572ejc.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 06 Sep 2022 11:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=YhCD2BUnvk+EART+qJYRghEdCBWvNx4ju2rtPfEiOI4=;
 b=y+siq/RM3RjL+a1SK0nGMlaEWNEBEQpvol3sAC7TSLKfqrvgrwE+jUGmQgB/MUNllk
 jnsMr1WTUb1cZLxUcNNORCDaeZfQt3O1dgZahrjHwLFy0N6vd6qrvqlsy4AEpQ/4VXsf
 zWotv3g4A24afILYTS/uVTv4MQrVjjn09OpgSxusqSom94LbqJNvu50DCuu0P9ro/JId
 GkTk05VU3tLi5ADw6VkS0s49SNsT77h2jqjtOZEWVI40YVhpkHSt19Z8JmMq67O9jUmd
 fUm9c2Qa9pCn4G5/mzAkrd7N5g1tRPHblr6ND74ND6KX6C6xDtOakIOOqteQoziPUM4L
 N3jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=YhCD2BUnvk+EART+qJYRghEdCBWvNx4ju2rtPfEiOI4=;
 b=d8NcZAFBvFHSYnORjXfpUWBvIcDSAUkcWb4i7biTIBQo1KAltOLJLh2JURSsBWWflW
 0w3DzOl5cCaY5+GagMCf1NdRqIZ9VDUl6JFk/9BLWbxCwF14inN/BgVcjwGhh/NLPgVe
 6BJBdSQMR2HqOv3xhJqhR114rMEbNWz9ybQQYRSq2+V338XT9KKe/MjUyVX51THga24J
 ZAE0b3kz+0HOjKXtEk75Ty+jhesYLumik5+mm0JDvZOTCLsrpFRcqMiRbf3BkYhoo7CQ
 Q2Sy3bEgnbYDQoSRYAQBxIW6o1KqCL0jZKTa/0vO3/MV+RrzdJaeI7KQ/9uXQafW9Gmv
 lIaQ==
X-Gm-Message-State: ACgBeo00NDwhznXu/PI5ieoZDVTTaNMUdzJiZH01Q/1ylF/dnGhtM8p2
 Zs4PReFSWDrNDjKd9M8Y0MKhA28+EL18bvNbmbTnlQ==
X-Google-Smtp-Source: AA6agR5AOS8szLUYRUywxgPElU/nyOQWQJSIyBhejwRqUbyMNY9SBFGhCIk8wI4FG9Qv8YfYQiDR8F4+fwjKMWs/ojo=
X-Received: by 2002:a17:906:58c8:b0:6fe:91d5:18d2 with SMTP id
 e8-20020a17090658c800b006fe91d518d2mr41006298ejs.190.1662490731615; Tue, 06
 Sep 2022 11:58:51 -0700 (PDT)
MIME-Version: 1.0
References: <YxeS1BK2OBH1P/kO@google.com>
In-Reply-To: <YxeS1BK2OBH1P/kO@google.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 6 Sep 2022 20:58:40 +0200
Message-ID: <CACRpkdY1DmywF3UdzBQHSp6N_uwK5MK93Do8TkKExtCVVQHZ2w@mail.gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-kernel@vger.kernel.org, Lee Jones <lee@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-tegra@vger.kernel.org,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] mfd: stmpe: switch to using gpiod API
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

On Tue, Sep 6, 2022 at 8:35 PM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:

> This patch switches the driver away from legacy gpio/of_gpio API to
> gpiod API, and removes use of of_get_named_gpio_flags() which I want to
> make private to gpiolib.
>
> We also need to patch relevant DTS files, as the original code relied on
> the fact that of_get_named_gpio_flags() would fetch any data encoded in
> GPIO flags, even if it does not reflect valid flags for a GPIO.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

> ---
>
> v1->v2:
>  - add DTS changes, as noticed by Francesco Dolcini.
>
> I guess we could do a dance of changing stmpe to check the flags coming
> from DTS and try to distinguish IRQ flags from proper GPIO flags, then
> have a separate patch changing DTSes, and finally a 2nd patch to stmpe
> to use GPIOD API, but I am hoping we could apply this in one go...

It's a mess, let's just apply it and forget about it. It's one of those
trees falling in the forest and noone is there to hear it fall-type of
things.

Yours,
Linus Walleij
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
