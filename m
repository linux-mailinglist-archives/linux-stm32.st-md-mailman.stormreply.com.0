Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 49083EFFD1
	for <lists+linux-stm32@lfdr.de>; Tue,  5 Nov 2019 15:32:24 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0E0E8C36B0B;
	Tue,  5 Nov 2019 14:32:24 +0000 (UTC)
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
 [209.85.167.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A598AC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 Nov 2019 14:32:22 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id 195so15276939lfj.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 05 Nov 2019 06:32:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PLFMRSJOoW+yEvqE/nAHqNvN0PVJDrTXShmTG7ns9As=;
 b=y9perWPcAH4j5mAUN7KY2NmEekUSQ+a30wlQ/BNkpsPELwH8TkoyNWnfNTa3lXV3DG
 BkFwl5e2C3KBAEq3KrADfJNW1Ypu1c/6VxByLiYBAbCXpJq19EQ4g+exGsZm5h5Xlspb
 +Iq9W9nVecCRfhhM+jooPvA76M2X0wekEJFrOpHNcoKkEubx67vn9D5P1VY90UD436Hk
 T1tZtH3MMuvo3yEaGGNwhUmdU9HpmW/8QBNjtT0SxqiVtwGseNLZgQXk5Un5QKIiCuW0
 f+AFNL5Hr9zZUf5RXDuhMfNZsepmrFclGE7uh8/yMAabPU5TAGPuMIR/DxA+lc+l5PkB
 CHMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PLFMRSJOoW+yEvqE/nAHqNvN0PVJDrTXShmTG7ns9As=;
 b=DorUMKLq16Jalj9ZDnyKis18ZG+c/hRYYO+mgtaCDA+NP+SY51ikBBBqdu9FyZIKSY
 oRgE02JTgtXA08R5wQGTdpctob0VypZl0npw+LrRE8FxUYGRv1FKu5pV4AWAE7xtLXpF
 t5VgcZ9S7xqC4/REdEOaKSmaXJaalTEs5UoEDcC2SICeiSZ258QcspDJzaWh6hvXMkAH
 4Jguo6BGgJoyhIvUovBNN+CENkSSus0ilKV7ukwd5IF71Ns00dW/O3wrHqSuC9Xqb/DY
 Rbb11Ma0qH3kKUqDBllQaiNXJOYg1A/uUrcqTS4ZNcitEo39NE4wsO75AE2cDjlOK0CP
 QJEw==
X-Gm-Message-State: APjAAAVwseCaPTu2m6TxlgwH2lqlP86QsFV9UcqHY2l/h6Ao6MlqrExD
 1/hV32zfK26q20XJpyDqCqGxFnWEJyoKXnILHEP88g==
X-Google-Smtp-Source: APXvYqyVnOresRhCD7/BA1YBuA6qLWnNQMWqlAcN2EojWeInmLqNK2B9nacejztyRPmOEA5D/NM+oKAP10yDAKivgGk=
X-Received: by 2002:ac2:4a8f:: with SMTP id l15mr20732685lfp.5.1572964341873; 
 Tue, 05 Nov 2019 06:32:21 -0800 (PST)
MIME-Version: 1.0
References: <20191104100908.10880-1-amelie.delaunay@st.com>
In-Reply-To: <20191104100908.10880-1-amelie.delaunay@st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 5 Nov 2019 15:32:10 +0100
Message-ID: <CACRpkdb1c-NHXDQXYS78VTcGPnJApmxjzZbF_cM8SUknhDiQ4Q@mail.gmail.com>
To: Amelie Delaunay <amelie.delaunay@st.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
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

On Mon, Nov 4, 2019 at 11:09 AM Amelie Delaunay <amelie.delaunay@st.com> wrote:

> With stmfx_pinctrl_gpio_init_valid_mask callback, gpio_valid_mask was used
> to initialize gpiochip valid_mask for gpiolib. But gpio_valid_mask was not
> yet initialized. gpio_valid_mask required gpio-ranges to be registered,
> this is the case after gpiochip_add_data call. But init_valid_mask
> callback is also called under gpiochip_add_data. gpio_valid_mask
> initialization cannot be moved before gpiochip_add_data because
> gpio-ranges are not registered.

Sorry but this doesn't add up, look at this call graph:

gpiochip_add_data()
  gpiochip_add_data_with_key()
    gpiochip_alloc_valid_mask()
    of_gpiochip_add()
    of_gpiochip_add_pin_range()
    gpiochip_init_valid_mask()

So the .initi_valid_mask() is clearly called *after*
of_gpiochip_add_pin_range() so this cannot be the real reason,
provided that the ranges come from the device tree. AFAICT that
is the case with the stmfx.

Can you check and see if the problem is something else?

Yours,
Linus Walleij
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
