Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 90240CCB76
	for <lists+linux-stm32@lfdr.de>; Sat,  5 Oct 2019 18:49:52 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 47752C36B0B;
	Sat,  5 Oct 2019 16:49:52 +0000 (UTC)
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
 [209.85.167.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 86B5FC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  5 Oct 2019 16:49:51 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id x80so6561625lff.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 05 Oct 2019 09:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bFYXbByYhGEXfOvEgQ/Yv7O8maPlLwNPKG6/+oAaKb0=;
 b=F5Qjpvpi6G+ab+VeuCiBsb6tm18qqaMtmFRT4reLGjpmUHLQIKEy38RCdhiSjtQoYr
 gxUT6twp6LaP1bTlGnWGv4bQySjuigIwrgHhmPKCbxPGBjd7/LYxeuA+gBsCmRkysK3O
 pH/XMlhMcKe8iXOk/2VDpQk54SIR+ndpxUrBJzAe/NI5B0WdIBaj5ogYjdYehYK3cQ35
 Uz82JVR+RRWh/cH1+2hUTPNVyI31grf74MbU6CHnN01sEYQskDQY5F905me9Q1O4MIuO
 66UKqnl76X1MvlQ2KDltSwqSE5p2wZNmWRtT45rianVJwNaprLpXKDq9dfy+9WkxiBB0
 rISQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bFYXbByYhGEXfOvEgQ/Yv7O8maPlLwNPKG6/+oAaKb0=;
 b=k9XFlQMTdVN0VCfexjlpPaYnpD2wncAkT5orMJ17rd8loYUf9laBuvNhXqBFv+kYpD
 zLDqeRWMRk5mOj3Fj0d2UVzhPkm+JV022zW1WWLVng0FNcG9rvZxaPW76ujcF8/gH+iM
 S6la+V7RwvCYkvIN0vt47KpTVgWNuCaDdZQEpmhk5NOIng+DXFHnE3rotk81N9TpVrQv
 ibQNd12PtVxNHNQsOVAXc34k8jpG4YeFi0S5nxMvsijtXIsCYWQof1As++VdM6UbZR/M
 DmxUJt9NV9THru6ftXf+nQHTnNzsqYP0ARrtSFYLk+4vLQGAuktmOfag45Nt67TiQynt
 2RAA==
X-Gm-Message-State: APjAAAUJBfPhh7hh8zvqI3ctBCyPasyjvNNeemjWi4yVAZYS7hjWXeFy
 f8ICHAo5uxJ9OlZyGGAp0JscrTirMoNiVOUKeDdcDg==
X-Google-Smtp-Source: APXvYqzWLIXea2bSktYcXAMWUxPBnRthWgHgKi9V9cmgUV7xXLZpltHmYaRhUSOORfu5uwvTkgz2I3T7Lp7NJCXeluc=
X-Received: by 2002:ac2:5c11:: with SMTP id r17mr12207816lfp.61.1570294190713; 
 Sat, 05 Oct 2019 09:49:50 -0700 (PDT)
MIME-Version: 1.0
References: <20191004122923.22674-1-amelie.delaunay@st.com>
In-Reply-To: <20191004122923.22674-1-amelie.delaunay@st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 5 Oct 2019 18:49:37 +0200
Message-ID: <CACRpkda6CyYCt-s-VkaK856Jt3TxQg+HVDz-5Ww9T9KNHHAjaQ@mail.gmail.com>
To: Amelie Delaunay <amelie.delaunay@st.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH 1/1] pinctrl: stmfx: add
	irq_request/release_resources callbacks
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

On Fri, Oct 4, 2019 at 2:29 PM Amelie Delaunay <amelie.delaunay@st.com> wrote:

> When an STMFX IO is used as interrupt through the interrupt-controller
> binding, the STMFX driver should configure this IO as input. Default
> value of STMFX IO direction is input, but if the IO is used as output
> before the interrupt use, it will not work without these callbacks.
>
> Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>

OK I see what you want to achieve.

> +static int stmfx_gpio_irq_request_resources(struct irq_data *data)
> +{
> +       struct gpio_chip *gpio_chip = irq_data_get_irq_chip_data(data);
> +       struct stmfx_pinctrl *pctl = gpiochip_get_data(gpio_chip);
> +       int ret;
> +
> +       ret = stmfx_gpio_direction_input(&pctl->gpio_chip, data->hwirq);
> +       if (ret)
> +               return ret;
> +
> +       ret = gpiochip_lock_as_irq(&pctl->gpio_chip, data->hwirq);
> +       if (ret) {
> +               dev_err(pctl->dev, "Unable to lock gpio %lu as IRQ: %d\n",
> +                       data->hwirq, ret);
> +               return ret;
> +       }
> +
> +       return 0;
> +}

Just call gpiochip_reqres_irq() instead of calling the lock etc
explicitly.

> +static void stmfx_gpio_irq_release_resources(struct irq_data *data)
> +{
> +       struct gpio_chip *gpio_chip = irq_data_get_irq_chip_data(data);
> +       struct stmfx_pinctrl *pctl = gpiochip_get_data(gpio_chip);
> +
> +       gpiochip_unlock_as_irq(&pctl->gpio_chip, data->hwirq);
> +}

Just call gpiochip_relres_irq()

But all this duplicated a lot of code from the core which is not so nice.

> @@ -678,6 +706,8 @@ static int stmfx_pinctrl_probe(struct platform_device *pdev)
>         pctl->irq_chip.irq_set_type = stmfx_pinctrl_irq_set_type;
>         pctl->irq_chip.irq_bus_lock = stmfx_pinctrl_irq_bus_lock;
>         pctl->irq_chip.irq_bus_sync_unlock = stmfx_pinctrl_irq_bus_sync_unlock;
> +       pctl->irq_chip.irq_request_resources = stmfx_gpio_irq_request_resources;
> +       pctl->irq_chip.irq_release_resources = stmfx_gpio_irq_release_resources;

What about just adding

pctl->irq_chip.irq_enable and do stmfx_gpio_direction_input()
in that callback instead? gpiolib will helpfully wrap it.

Yours,
Linus Walleij
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
