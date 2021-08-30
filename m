Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A2F3FB99C
	for <lists+linux-stm32@lfdr.de>; Mon, 30 Aug 2021 18:03:18 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C438AC5A4D7;
	Mon, 30 Aug 2021 16:03:17 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DD23FC57B51
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Aug 2021 16:03:15 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1308661039
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Aug 2021 16:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630339394;
 bh=aFevs/gSxbU10OD2HhmBmIy8lmlTrmGWeunJfZ8GXV4=;
 h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
 b=m2lWo3rrUt4CKtf+9F2RHi0LAvLDR2zr+nYw2qOLlFROMfazIHJUSBQ2RODMcrLCi
 pzQfitkSgwP1WJXPln2v8dn1uQJ2q+wfRUhgZJyRm18qEuds8+mYdqTboqvIdf+Gnc
 a4BTUmXO4/SkaUc8+GXU4aMi98MQ5kPd44a91lz4zWw+p2pitv8uVrAWtF7RFPapUA
 Eh/XkXZl59kLXE08NC8R2cnWZ8rufzCkM91fA3nPSBvo8tqYJDlSgUOZao+EXWjy15
 EboYQuQ5LkUOuRCJeXe7cq3/kwZ4dIFQnaekndyfxpXBsHJR1xjP87pkNRjPJsdOjz
 2AC5wSIaP7m9g==
Received: by mail-lf1-f44.google.com with SMTP id j4so32214276lfg.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Aug 2021 09:03:13 -0700 (PDT)
X-Gm-Message-State: AOAM530V2RW0BBvFQECje+SzFeNgi5laKLyWrwSWK6G2Wcw8UJV5SEVO
 coH1+YTxSHoUH67YeXPwWES/bwlzthfCdnBr+2Q=
X-Google-Smtp-Source: ABdhPJx2X93KAB+EVeQrnZM2DurW5sWa6kSM/wqlVkgAZbsxt9UtjBf99dzVD1xur/X4iU/kpcebwmpmAENY8zMU9po=
X-Received: by 2002:a05:6512:3f89:: with SMTP id
 x9mr18217622lfa.233.1630339392410; 
 Mon, 30 Aug 2021 09:03:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210823143754.14294-1-michael.riesch@wolfvision.net>
 <CAGb2v67Duk_56fOKVwZsYn2HKJ99o8WJ+d4jetD2UjDsAt9BcA@mail.gmail.com>
 <568a0825-ed65-58d7-9c9c-cecb481cf9d9@wolfvision.net>
In-Reply-To: <568a0825-ed65-58d7-9c9c-cecb481cf9d9@wolfvision.net>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 31 Aug 2021 00:03:00 +0800
X-Gmail-Original-Message-ID: <CAGb2v658bD91LereM-Mc-2usEq-RH=pn_8bR9fEgmDUqpi5OoQ@mail.gmail.com>
Message-ID: <CAGb2v658bD91LereM-Mc-2usEq-RH=pn_8bR9fEgmDUqpi5OoQ@mail.gmail.com>
To: Michael Riesch <michael.riesch@wolfvision.net>
Cc: Sasha Levin <sashal@kernel.org>, "David S . Miller" <davem@davemloft.net>,
 netdev <netdev@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>,
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

On Mon, Aug 30, 2021 at 3:57 PM Michael Riesch
<michael.riesch@wolfvision.net> wrote:
>
> Hi ChenYu,
>
> On 8/29/21 7:48 PM, Chen-Yu Tsai wrote:
> > Hi,
> >
> > On Mon, Aug 23, 2021 at 10:39 PM Michael Riesch
> > <michael.riesch@wolfvision.net> wrote:
> >>
> >> This reverts commit 2c896fb02e7f65299646f295a007bda043e0f382
> >> "net: stmmac: dwmac-rk: add pd_gmac support for rk3399" and fixes
> >> unbalanced pm_runtime_enable warnings.
> >>
> >> In the commit to be reverted, support for power management was
> >> introduced to the Rockchip glue code. Later, power management support
> >> was introduced to the stmmac core code, resulting in multiple
> >> invocations of pm_runtime_{enable,disable,get_sync,put_sync}.
> >>
> >> The multiple invocations happen in rk_gmac_powerup and
> >> stmmac_{dvr_probe, resume} as well as in rk_gmac_powerdown and
> >> stmmac_{dvr_remove, suspend}, respectively, which are always called
> >> in conjunction.
> >>
> >> Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
> >
> > I just found that Ethernet stopped working on my RK3399 devices,
> > and I bisected it down to this patch.
>
> Oh dear. First patch in a kernel release for a while and I already break
> things.
>
> Cc: Sasha as this patch has just been applied to 5.13-stable.
>
> > The symptom I see is no DHCP responses, either because the request
> > isn't getting sent over the wire, or the response isn't getting
> > received. The PHY seems to be working correctly.
>
> Unfortunately I don't have any RK3399 hardware. Is this a custom
> board/special hardware or something that is readily available in the
> shops? Maybe this is a good reason to buy a RK3399 based single-board
> computer :-)

I hit this on an ROC-RK3399-PC first, then bisected it on a NanoPi M4V2.
They both should be easy to get from their respective vendors. AFAIK
all the RK3399 devices have pretty much the same setup for Ethernet.

BTW, Don't get the Nanopi in the M4V2 variant. Get the original M4, or
the M4B (but the WiFi on the M4B doesn't seem to work lately).

> I am working on the RK3568 EVB1 and have not encountered faulty
> behavior. DHCP works fine and I can boot via NFS. Therefore, not sure
> whether I can be much of help in this matter, but in case you want to
> discuss this further please do not hesitate to contact me off-list.

My gut is telling me (without looking at the code) that maybe the GRF
access was not going through, and so the RGMII delays and stuff weren't
set properly, hence no traffic getting to/from the PHY. Otherwise there
were no error messages. I don't think I'll be able to squeeze out more
cycles to track down what actually went wrong though.


Regards
ChenYu
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
