Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB3329278
	for <lists+linux-stm32@lfdr.de>; Fri, 24 May 2019 10:10:25 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 123FBC055F3
	for <lists+linux-stm32@lfdr.de>; Fri, 24 May 2019 08:10:25 +0000 (UTC)
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
 [209.85.208.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E0EF3C055F0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 May 2019 08:10:22 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id a10so7854538ljf.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 May 2019 01:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RcI5nX0zsFocv6c9Dh5dsyELmuugz9pu4xszs0C7sEQ=;
 b=TuplLlJStenwIfjMi0SPcifzNyONWCjOAlzsqNaVJLUf0JuryBZSSfqTfFouJIuKzD
 0YC70wD3x8HwBrd+c6N7bKprIw/j7WEBdykVkNvZ5kfd1Q1dAik3xDID7CXPN47G5nKV
 2aBSa3fo6+2pNul3KMaZQtmWsojWbkfJ3TU7f/MQ26mY1/WEdKrxO0X3tLBuaN0kuqw1
 +YegxUN9DJ/Twi84rwuicS92wlXlg2Ir6jLEZ5BElnExtPPOot/MYLcJ94OvTDN/UACH
 l3GMGETArM3mdVdYN3y3YkrYU4j8JovLoxeuYk9/NgH+4yLCITdjm01+eKqcIJUoU543
 lETw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RcI5nX0zsFocv6c9Dh5dsyELmuugz9pu4xszs0C7sEQ=;
 b=PZykTiWJCg1SiO7LAdESY6uJ5HKtcDJqp1hzr/QVJ4Sorfw0hzrywtI5LBrAmpf1BF
 YJvtgBBS3BpzYvXdR30i78ao5CteAET68TDjcjXmVwAjEpjYcqT3fbG6ejqPz/vhDxnN
 tCeFKHPqYnjnSpqtaz7X0sv2D6DweywtqgMa5k+YQhhwlwKXCv7L+QDYJk5+4jNg9Wki
 2YcgLrGCxNsR3Xyj6OdP8QoBp+x6Mjnk40miAM1ncAWu4/1umcx7uilng0J0M2iFzmgh
 Ut3ViCN++/gx6XVtPEve12Kx6L/q+hpWv/tpSJNNeUOqfo7HHej0NCTIowAIBsTg5JYO
 bY4w==
X-Gm-Message-State: APjAAAWY/UlCQ1gTnSLrX0z6iB1gzLG4/TXq/PwYGhHWWGqD+ujaQ8Ji
 1y4MrTgnIIrziS+v0UjNHI3keLXRF7e4dQoZ6FJ6/A==
X-Google-Smtp-Source: APXvYqwVNWAVXwkUBL7c8AEmHQLOpoFiD7Z4FJzo1VkNZyw8J0vlNLuTHQZ22OQHfGXFRXfI0eoS6GlJNewBVqn8NeY=
X-Received: by 2002:a2e:9cd1:: with SMTP id g17mr11514251ljj.191.1558685422051; 
 Fri, 24 May 2019 01:10:22 -0700 (PDT)
MIME-Version: 1.0
References: <1558683125-31882-1-git-send-email-amelie.delaunay@st.com>
In-Reply-To: <1558683125-31882-1-git-send-email-amelie.delaunay@st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 24 May 2019 10:10:10 +0200
Message-ID: <CACRpkdbRuveWT8huqpvo6vrSqyF2_g=xcHF+YjAs6AH4xcA65w@mail.gmail.com>
To: Amelie Delaunay <amelie.delaunay@st.com>
Cc: Randy Dunlap <rdunlap@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, kbuild-all@01.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v2] pinctrl: stmfx: Fix compile issue when
 CONFIG_OF_GPIO is not defined
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

On Fri, May 24, 2019 at 9:32 AM Amelie Delaunay <amelie.delaunay@st.com> wrote:

> When CONFIG_GPIO_OF is not defined, struct gpio_chip 'of_node' member does
> not exist:
> drivers/pinctrl/pinctrl-stmfx.c: In function 'stmfx_pinctrl_probe':
> drivers/pinctrl/pinctrl-stmfx.c:652:17: error: 'struct gpio_chip' has no member named 'of_node'
>      pctl->gpio_chip.of_node = np;
>
> Fixes: 1490d9f841b1 ("pinctrl: Add STMFX GPIO expander Pinctrl/GPIO driver")
> Reported-by: kbuild test robot <lkp@intel.com>
> Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>

Patch applied for fixes.

Yours,
Linus Walleij
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
