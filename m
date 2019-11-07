Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 07057F2A3B
	for <lists+linux-stm32@lfdr.de>; Thu,  7 Nov 2019 10:09:52 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B05ECC36B0B;
	Thu,  7 Nov 2019 09:09:51 +0000 (UTC)
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
 [209.85.167.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EA646C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 Nov 2019 09:09:50 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id v8so974141lfa.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 07 Nov 2019 01:09:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AqA01GmNXxOIqmKayDqMHICE140SmncdgO3v076ZB7M=;
 b=e1rffzcB/YxOOOMnwqrZJesi/tvKRrsHLKDm7hBclx75Uy4vnec54LTKDCDmeGbxLX
 ywJtFeBABHA2JWtFfXuhIA9T6KoJLckldeSEgkzM41VFxRhmu5dFjDJeO/qdXvwz70bM
 xTG46dhWbhTkRBTnJYoYMt28eGJfDJKh9g6gUOX9VOuydasSdGVlhbdFstZqqEtihxeK
 g2GbliMhnxmK+23pDp5kaNzH3+35Wu2lzqresRNH8I4E4Rea6WeU4rcLDWjAt6E5WA9t
 ilO2/9YI/XjQkBVrJvI+6DEyjGMETc6hnU0RgK1PjZIE/2rdbL1mhuXTb+kWtBIHDXqd
 zmkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AqA01GmNXxOIqmKayDqMHICE140SmncdgO3v076ZB7M=;
 b=AeZqfTYEiqhJARhDURMRUiiwcLKU//mp4YR0hjAs17zRy6GkDsVy39X6kXgpu06Er9
 XxmfBvgxnOXNP+6OJQY10Zq0JqRwGx1r+c61HO27XyAZz+v1AMzaGqK86DmyBlmKTxMH
 k9OTx9jkZ3+wyRmLl6hW/fhf/oaaHeVK7Eyhw/JFphpOZIuCqn3zRcJjId2NFK3r23O1
 9hKrb0eJh5iX2Tzoe5ANRzjodXz6o4pMlu5zCmTdRwiAhffUfZhbBbVjFgWIFBm3PhJJ
 fOh91Z9Lk8fs8fFKbKwzqyTwNxnHAaBvXkLYesPhGEp5lRB0AOjMI9e7z6CcW4NTGIxh
 IThA==
X-Gm-Message-State: APjAAAUnQryv4ejJC5G1iemAz5zshNTRSj2dG2woUWvJW7Sz0siepBDA
 vWTXk+7s3ptHQ9XAXyUIgH7NcoWzE8T8t9CL8xrm5Q==
X-Google-Smtp-Source: APXvYqxPdpHoDKQ+cbGzqAEy6IBEIt8P+sfO6dFt7eB3y8XbNYOaax86566DZUKRxXfZrrORDwfC5tpAMymbTbgGp38=
X-Received: by 2002:ac2:51dd:: with SMTP id u29mr1587920lfm.135.1573117790204; 
 Thu, 07 Nov 2019 01:09:50 -0800 (PST)
MIME-Version: 1.0
References: <20191104100908.10880-1-amelie.delaunay@st.com>
 <CACRpkdb1c-NHXDQXYS78VTcGPnJApmxjzZbF_cM8SUknhDiQ4Q@mail.gmail.com>
 <64f8096f-cec6-fef1-5a4e-ddca3bf8c73d@st.com>
In-Reply-To: <64f8096f-cec6-fef1-5a4e-ddca3bf8c73d@st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 7 Nov 2019 10:09:38 +0100
Message-ID: <CACRpkdbK=aB84hW0FtuMBtzqi3ftKBxedXEpqmnJhbN_vJWx2Q@mail.gmail.com>
To: Amelie DELAUNAY <amelie.delaunay@st.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH 1/1] pinctrl: stmfx: fix valid_mask init
	sequence
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

On Tue, Nov 5, 2019 at 4:14 PM Amelie DELAUNAY <amelie.delaunay@st.com> wrote:
> On 11/5/19 3:32 PM, Linus Walleij wrote:
> > On Mon, Nov 4, 2019 at 11:09 AM Amelie Delaunay <amelie.delaunay@st.com>
> > wrote:
> >
> >> With stmfx_pinctrl_gpio_init_valid_mask callback, gpio_valid_mask was used
> >> to initialize gpiochip valid_mask for gpiolib. But gpio_valid_mask was not
> >> yet initialized. gpio_valid_mask required gpio-ranges to be registered,
> >> this is the case after gpiochip_add_data call. But init_valid_mask
> >> callback is also called under gpiochip_add_data. gpio_valid_mask
> >> initialization cannot be moved before gpiochip_add_data because
> >> gpio-ranges are not registered.
> >
> > Sorry but this doesn't add up, look at this call graph:
> >
> > gpiochip_add_data()
> >    gpiochip_add_data_with_key()
> >      gpiochip_alloc_valid_mask()
> >      of_gpiochip_add()
> >      of_gpiochip_add_pin_range()
> >      gpiochip_init_valid_mask()
> >
> > So the .initi_valid_mask() is clearly called *after*
> > of_gpiochip_add_pin_range() so this cannot be the real reason,
> > provided that the ranges come from the device tree. AFAICT that
> > is the case with the stmfx.
> >
> > Can you check and see if the problem is something else?
> >
>
> stmfx_pinctrl_gpio_init_valid_mask uses pctl->gpio_valid_mask to
> initialize gpiochip valid_mask.
>
> pctl->gpio_valid_mask is initialized in
> stmfx_pinctrl_gpio_function_enable depending on gpio ranges.
>
> stmfx_pinctrl_gpio_function_enable is called after gpiochip_add_data
> because it requires gpio ranges to be registered.
>
> So, in stmfx driver the call graph is
>
> stmfx_pinctrl_probe
>    gpiochip_add_data()
>      gpiochip_add_data_with_key()
>        gpiochip_alloc_valid_mask()
>        of_gpiochip_add()
>        of_gpiochip_add_pin_range()
>        gpiochip_init_valid_mask()
>          stmfx_pinctrl_gpio_init_valid_mask (but pctl->gpio_valid_mask
> is not yet initialized so gpiochip valid_mask is wrong)
>    stmfx_pinctrl_gpio_function_enable (pctl->gpio_valid_mask is going to
> be initialized thanks to gpio ranges)
>
> When consumer tries to take a pin (it is the case for the joystick on
> stm32mp157c-ev1), it gets the following issue:
> [    3.347391] irq: :soc:i2c@40013000:stmfx@42:stmfx-pin-controller
> didn't like hwirq-0x0 to VIRQ92 mapping (rc=-6)
> [    3.356418] irq: :soc:i2c@40013000:stmfx@42:stmfx-pin-controller
> didn't like hwirq-0x1 to VIRQ92 mapping (rc=-6)
> [    3.366512] irq: :soc:i2c@40013000:stmfx@42:stmfx-pin-controller
> didn't like hwirq-0x2 to VIRQ92 mapping (rc=-6)
> [    3.376671] irq: :soc:i2c@40013000:stmfx@42:stmfx-pin-controller
> didn't like hwirq-0x3 to VIRQ92 mapping (rc=-6)
> [    3.387169] irq: :soc:i2c@40013000:stmfx@42:stmfx-pin-controller
> didn't like hwirq-0x4 to VIRQ92 mapping (rc=-6)
> [    3.397065] gpio-keys joystick: Found button without gpio or irq
> [    3.403041] gpio-keys: probe of joystick failed with error -22
>
> I can reword the commit message to make it clearer.

No need I understand it now, thanks for explaining!

We need to populate the valid mask some other way if you
want to safeguard this, I don't know if the existing
gpio-reserved-ranges would work? But it feels a bit unsafe
if you actually determine this some other way.

Yours,
Linus Walleij
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
