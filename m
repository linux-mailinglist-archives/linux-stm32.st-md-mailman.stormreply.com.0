Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD01F2A24
	for <lists+linux-stm32@lfdr.de>; Thu,  7 Nov 2019 10:07:24 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7FD5FC36B0B;
	Thu,  7 Nov 2019 09:07:24 +0000 (UTC)
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
 [209.85.208.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E5280C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 Nov 2019 09:07:22 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id n5so1358826ljc.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 07 Nov 2019 01:07:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4r2I4GWCi4/JcKwrvsl/b6YhN/4C3j/fmn4xKNtK0ZQ=;
 b=ux2FovIcG1zE1vslYMh2o/uYdWYD97faEpyQnorZ9gkQPiRWvlS2RTooMZAxvF3su+
 OqoHPDmvTUAi47XsDElIJWqgC3LO7i9KEuHpeu7FdNJRgfNfkzqPuAqSyPGzHXjMB3B6
 q9wjlHMeQgdsM7gIdR9S7L9ABnXjRR3GhZaPvwnscJwgO+QS/Eipa1O756bS8o8tMYgR
 uPt/rdMsJw77oSkg6k4BQQLd2cS3JqRU6ZzLbEl1CJ0K0AT0BeYhuoBj1UyAfOdehm9A
 YKs0s1JZ16Km5J4MR2gu5hILMegt1bUWBpQOx3xf72iFOTqNaIeQ7vGXgdOpXJ5gKTRF
 /4Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4r2I4GWCi4/JcKwrvsl/b6YhN/4C3j/fmn4xKNtK0ZQ=;
 b=SCVq/2jBrKeJJFBELvv5I/sWcItBilTFF2c35Bv6EJ0HLqJ0uiLGAR/6usFgg46rgD
 txagJh4HVutZejnEa2le7vZrQRKZocx5q/tndl7StNZauIjQLltJJzzT8iJg6h+Hm1wr
 33u35MimEEln5Lnaeb6ywNeuiFUKT5ukC3bF5bjIXZxg46BZbWOUt9yWOGjn6HYNbOG5
 Omn0pSYMjfqZP2FSw/uHZs7rR8GVnFHihInXT7EaUrxmuTYFEd8RzMGiQIbT+xsnYhPY
 VZVyu0o37AqTUg89HKXKG9fF/vtyOxKKsbshfS8G2G7I+qg322WuWZJ6Ret0Tugx/LwQ
 +SZQ==
X-Gm-Message-State: APjAAAV0k79O4MqhxPWruZBJULyYXkjq1zxoJjrDTuYarxo0nqHE4+HJ
 Y1MNd1BZP3GWLjI59r61JO3Nte0yJon48JkVMuBxFg==
X-Google-Smtp-Source: APXvYqwocIIrCbyry8zer+NUwVaV5Dx7e3lBotAXLq/eYxTJbRgLBTjLohnii7mCSBObKiM3W3u/8TT7mvEO2yLrxeg=
X-Received: by 2002:a05:651c:1202:: with SMTP id
 i2mr1583378lja.218.1573117642202; 
 Thu, 07 Nov 2019 01:07:22 -0800 (PST)
MIME-Version: 1.0
References: <20191104100908.10880-1-amelie.delaunay@st.com>
In-Reply-To: <20191104100908.10880-1-amelie.delaunay@st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 7 Nov 2019 10:07:10 +0100
Message-ID: <CACRpkdbFyTV_8aJko8r1+2vXohHfwoJy8ujTofUC0ruG1PeviA@mail.gmail.com>
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
> So, it is not possible to use init_valid_mask callback.
> To avoid this issue, get rid of valid_mask and rely on ranges.
>
> Fixes: da9b142ab2c5 ("pinctrl: stmfx: Use the callback to populate valid_mask")
> Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>

Patch applied for fixes.

Yours,
Linus Walleij
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
