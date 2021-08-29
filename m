Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B6FAD3FAD7C
	for <lists+linux-stm32@lfdr.de>; Sun, 29 Aug 2021 19:48:42 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C5752C5A4D5;
	Sun, 29 Aug 2021 17:48:36 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 72DF8C57196
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 29 Aug 2021 17:48:34 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5BA0E60F4B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 29 Aug 2021 17:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630259313;
 bh=Ng8Nc7RPjC5XZnL4EXuDtogqZsofQfD04ok2tzTdyg0=;
 h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
 b=WfLgDYhad3SWUz1Q4kjSXblwrfvtrwvQKrBBbqTsJgc9VEDQ7j0W46HWUbQGj6Q+K
 DZDilVD4HVaFbbPrRc8sjLPWJaCJC4+o6+hqJ5NSmlfeSgwh6w+Lyl0XGSun/MyOYS
 /kMm/O4VXOV2YzUvKbT/dhKfQ09ka2cwsUosXz3fBa7njXBw8QLnsVNX0+CVascDjS
 mzuavtotaNgLVb7fG/UEOXwC0XMAyhu8HtoU84+2E+RG7f9L53p2auRsy+l4OtyvGp
 al8f3KENJLJHQGaLVbQg3LBtb9vQdUIG7d2YiDYqdV/OB4oJVvFSk4n/agQFy6pSKd
 LBScUxJf9dl/A==
Received: by mail-lf1-f46.google.com with SMTP id m18so12182070lfl.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 29 Aug 2021 10:48:33 -0700 (PDT)
X-Gm-Message-State: AOAM5315G8E8Vp3bvUnRFAT3EkO+3N8DYub8P4gymGMSkZzRCPim+pgf
 PkGRNi4TNYTIFMW9yKR9wZQILPR8IP3g+N4T+jw=
X-Google-Smtp-Source: ABdhPJyB1nMr9MC5DfmQcKkSm3lO+DjPQnAw0j9giP2Ell6A/NFUpcvTKa18StEugRVNKMxhup/rEojB0Viq1QaPQ5w=
X-Received: by 2002:a05:6512:3f89:: with SMTP id
 x9mr14794257lfa.233.1630259311683; 
 Sun, 29 Aug 2021 10:48:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210823143754.14294-1-michael.riesch@wolfvision.net>
In-Reply-To: <20210823143754.14294-1-michael.riesch@wolfvision.net>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Mon, 30 Aug 2021 01:48:19 +0800
X-Gmail-Original-Message-ID: <CAGb2v67Duk_56fOKVwZsYn2HKJ99o8WJ+d4jetD2UjDsAt9BcA@mail.gmail.com>
Message-ID: <CAGb2v67Duk_56fOKVwZsYn2HKJ99o8WJ+d4jetD2UjDsAt9BcA@mail.gmail.com>
To: Michael Riesch <michael.riesch@wolfvision.net>
Cc: "David S . Miller" <davem@davemloft.net>, netdev <netdev@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: dwmac-rk: fix unbalanced
	pm_runtime_enable warnings
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
Reply-To: wens@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Hi,

On Mon, Aug 23, 2021 at 10:39 PM Michael Riesch
<michael.riesch@wolfvision.net> wrote:
>
> This reverts commit 2c896fb02e7f65299646f295a007bda043e0f382
> "net: stmmac: dwmac-rk: add pd_gmac support for rk3399" and fixes
> unbalanced pm_runtime_enable warnings.
>
> In the commit to be reverted, support for power management was
> introduced to the Rockchip glue code. Later, power management support
> was introduced to the stmmac core code, resulting in multiple
> invocations of pm_runtime_{enable,disable,get_sync,put_sync}.
>
> The multiple invocations happen in rk_gmac_powerup and
> stmmac_{dvr_probe, resume} as well as in rk_gmac_powerdown and
> stmmac_{dvr_remove, suspend}, respectively, which are always called
> in conjunction.
>
> Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>

I just found that Ethernet stopped working on my RK3399 devices,
and I bisected it down to this patch.

The symptom I see is no DHCP responses, either because the request
isn't getting sent over the wire, or the response isn't getting
received. The PHY seems to be working correctly.


ChenYu
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
