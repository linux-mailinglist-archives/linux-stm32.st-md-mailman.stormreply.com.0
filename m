Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6E75AE698
	for <lists+linux-stm32@lfdr.de>; Tue,  6 Sep 2022 13:29:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3CF58C63325;
	Tue,  6 Sep 2022 11:29:34 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 81A6BC03FCD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Sep 2022 11:29:32 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id e18so14719695edj.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 06 Sep 2022 04:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=zJsAbZ/AKQeQ4weLGmp9NwiMeQJfb78eam6V/+FnVYY=;
 b=hBJzKow00M7omsY5l8rx/oyG5lSnqXPpiS+FRD2mIETLT7IIulTADi08ZhxkkFuwG6
 viLhlgZpTXlsGRt4fnHKJ7FkdVsOnY/JCjWZNl0+u7JyY+GWilo2U/6GwBupmXhuKL01
 NjXSfN35V2BIKf+mYIn+s44nlll6xXIZKj9khobr46DuW1Ln6C67ejc4zUOp0b4aY8Rr
 3Rw0dV85sbJA9cevPC0snEgGkI/+WpKcIlaETzpch+tUj2CDVx2SgodgulS2ZHVNFCB/
 MOqaYZ2+gCkEs7CqRaLJgnqCDBnrlTtk89fd0H+byG5PEZSw6f3tJsLxuURZ2Kz14JQU
 x4IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=zJsAbZ/AKQeQ4weLGmp9NwiMeQJfb78eam6V/+FnVYY=;
 b=TdOxk53YiMxzVZIwkbPRyjUQGgSp2JliqJEYyi3y82qj/nQ8qg74893bxx+ubv6LP6
 RhlXXL5B1tvsQ8EroB+cTI9gJP2Fdbr9MCTWUBH13060tl9J0ztofF1BDa9YCFRZbVi5
 qp3CGxyW9v/N/VSV+9dwmMRXhXQvAsGtsIrPPV8XJnbEMC7OuQm5Sz2C5VECZF1POyN/
 p0VS1tEGxP4R1aOVO1CUspoo9cVQcM+j8rVbQ/SN3oqbcewUtNVC3ZA4dSR4mI/1oDnx
 szw9Xa6ze4m/xLz/JxkbfT9crlwUdFGipVVSTW+wx17M+eUYQcoJDPWE4E8OnYOeRTTb
 wSJQ==
X-Gm-Message-State: ACgBeo3rVHFc1hf2HGIBFJA9f87/73HgcSXkI5jSSHGQHY+bfWnUWLo7
 TPsUbOy65H7TlRxxx+2/a1Jdtshf56rl2EyXAW3ZUA==
X-Google-Smtp-Source: AA6agR7Ok6ZUdyxV/KYBIT2cMmvQ/X8wHDApVUtfTjcaRRjUfQx3FJxPHPBP52nqOraNKAVYxsoFQptGhpxKejPYmLg=
X-Received: by 2002:aa7:d6d9:0:b0:44d:e1b7:d905 with SMTP id
 x25-20020aa7d6d9000000b0044de1b7d905mr11345627edr.32.1662463772132; Tue, 06
 Sep 2022 04:29:32 -0700 (PDT)
MIME-Version: 1.0
References: <YxbUO7WM0TbUBatv@google.com>
 <20220906101126.GA8061@francesco-nb.int.toradex.com>
In-Reply-To: <20220906101126.GA8061@francesco-nb.int.toradex.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 6 Sep 2022 13:29:21 +0200
Message-ID: <CACRpkdZU5vN6M31MN_EEQHpi+WfMOr4CTpkc7PD=AVvy_kb99A@mail.gmail.com>
To: Francesco Dolcini <francesco.dolcini@toradex.com>
Cc: Lee Jones <lee@kernel.org>, Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] mfd: stmpe: switch to using gpiod API
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

On Tue, Sep 6, 2022 at 12:11 PM Francesco Dolcini
<francesco.dolcini@toradex.com> wrote:
> On Mon, Sep 05, 2022 at 10:01:47PM -0700, Dmitry Torokhov wrote:
> > This patch switches the driver away from legacy gpio/of_gpio API to
> > gpiod API, and removes use of of_get_named_gpio_flags() which I want to
> > make private to gpiolib.
> >
> > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > ---
> >  drivers/mfd/stmpe.c | 36 +++++++++++++-----------------------
> >  1 file changed, 13 insertions(+), 23 deletions(-)
> >
> > diff --git a/drivers/mfd/stmpe.c b/drivers/mfd/stmpe.c
> > index 987e251d90ae..0c4f74197d3e 100644
> > --- a/drivers/mfd/stmpe.c
> > +++ b/drivers/mfd/stmpe.c
> > @@ -8,14 +8,13 @@
> >   */
> >
>
> <snip>
>
> > -     pdata->irq_gpio = of_get_named_gpio_flags(np, "irq-gpio", 0,
> <snip>
> > +     irq_gpio = devm_gpiod_get_optional(ci->dev, "irq", GPIOD_ASIS);
> isn't this changing from irq-gpio to irq-gpios property name?

The gpiolib core will automatically append and test the strings
*-gpios and *-gpio (in that order)

> in the DTS files we do have something like that:
>
>  irq-gpio = <&gpio TEGRA_GPIO(V, 0) IRQ_TYPE_LEVEL_LOW>;

This seems to be an orthogonal bug.

That flag in the last cell is invalid for a GPIO, the DT schema should
scream at you if you have one. GPIO flags are
GPIO_ACTIVE_LOW, GPIO_OPEN_DRAIN etc. That looks more
like an IRQ, and then the property should be irqs = <...>.

Yours,
Linus Walleij
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
