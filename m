Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C1F1B2300
	for <lists+linux-stm32@lfdr.de>; Tue, 21 Apr 2020 11:39:25 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 91219C36B0C;
	Tue, 21 Apr 2020 09:39:25 +0000 (UTC)
Received: from mail-vk1-f196.google.com (mail-vk1-f196.google.com
 [209.85.221.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 51044C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Apr 2020 09:39:24 +0000 (UTC)
Received: by mail-vk1-f196.google.com with SMTP id g129so3420751vkh.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Apr 2020 02:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=J6xX4UX3gD4CgRlcECeL2t8r4Bb9qOAjl08Y9GivdCk=;
 b=wNADBHYfBqrmYLagYMXhvkFyUT8BxHFDmwzkIw/FRVt1EftHXgipIT5yJYjq9ocehu
 GrZB6OVK67pjdwBAL3ZpBnNYXCYFWesoXkeoHo0e+Ys2ree61WWYf4q1s6aM2pRu8zzE
 AejCt13Zo1guyVsMD5GmA9rvmocxaeUAi4sNkPEfOLyZk1Y2qbJjkD6tKDgzsKIF5CWZ
 bLLAKSp0UWZJvyvTPaV6DLqfwXjGE7lCNhM1KyduORgSrcceVXJfhY1vVq4+4BSaq4zN
 YVaXK4yTyH5sWOKbHxJKYqWhedO0PsZU5jTNO2D9GxGo88EZ/BqFQXR4VHF3pC6Bn3an
 zNPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=J6xX4UX3gD4CgRlcECeL2t8r4Bb9qOAjl08Y9GivdCk=;
 b=prdg341v62NKX19zb2m+o0g4iKrNJlO7+JZRaUwThAIpxINekwL1hXIcRLMi+M58Lx
 yDtYgQwvwciCCHxEX4PzSj1jQTQvHb6zaDnuZjx1EE7X/VvpLgtY453NUST2wVZ6Nu3E
 tu9rUTW3/Ozqm5DZGdxHH0G39eGJQjCIMLiQU5qGqZUiz7PbeUxYR+xxdclrs/3cHcGl
 x/X7bRITIwQlGpLtPN/blKkDfjSfVDHvWFvgjZZeGbfyLa7LTSx6TNiqYt3LDpGCSsF2
 QXS4P7BpQzEh18MhpoAw3aABaVY0nzZ1xmpdx4aKTf/UQY2baPQGBeUTWHEZR5Aipys3
 TKvg==
X-Gm-Message-State: AGi0PuY7ZQVOQ3RuXFCSQZYaxOR5omzvuIORlSUaNqEwPJiay4pHlBdJ
 JKsqA8ALhvz7BxXq+eu+n2Ot30rLkABECTwf+Opg6w==
X-Google-Smtp-Source: APiQypLnPZE96uN80G6KHYHQ5XnaUSopJzzVTgfYzGF7mgcTRi/zaOA8wN0KNmuIrTuTzZyPCglj01kkbBVX93uXS2o=
X-Received: by 2002:a1f:31cf:: with SMTP id x198mr4295427vkx.101.1587461963161; 
 Tue, 21 Apr 2020 02:39:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200420161831.5043-1-ludovic.barre@st.com>
 <CAPDyKFqC3fdnQ9CMYhS-=5MiCET=r5Az2S5oFoA2v1gdDeGO3w@mail.gmail.com>
In-Reply-To: <CAPDyKFqC3fdnQ9CMYhS-=5MiCET=r5Az2S5oFoA2v1gdDeGO3w@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 21 Apr 2020 11:38:47 +0200
Message-ID: <CAPDyKFrHcoVd=GKPB70gOFE8STOnTJrJbcZzE_DEgFWh1Vhszg@mail.gmail.com>
To: Ludovic Barre <ludovic.barre@st.com>
Cc: DTML <devicetree@vger.kernel.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Srini Kandagatla <srinivas.kandagatla@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH] mmc: mmci_sdmmc: fix power on issue due
	to pwr_reg initialization
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

On Tue, 21 Apr 2020 at 11:25, Ulf Hansson <ulf.hansson@linaro.org> wrote:
>
> On Mon, 20 Apr 2020 at 18:18, Ludovic Barre <ludovic.barre@st.com> wrote:
> >
> > This patch fix a power-on issue, and avoid to retry the power sequence.
> >
> > In power off sequence: sdmmc must set pwr_reg in "power-cycle" state
> > (value 0x2), to prevent the card from being supplied through the signal
> > lines (all the lines are driven low).
> >
> > In power on sequence: when the power is stable, sdmmc must set pwr_reg
> > in "power-off" state (value 0x0) to drive all signal to high before to
> > set "power-on".
>
> Just a question to gain further understanding.
>
> Let's assume that the controller is a power-on state, because it's
> been initialized by the boot loader. When the mmc core then starts the
> power-on sequence (not doing a power-off first), would $subject patch
> then cause the
> MMCIPOWER to remain as is, or is it going to be overwritten?
>
> I am a little worried that we may start to rely on boot loader
> conditions, which isn't really what we want either...
>
> >
> > To avoid writing the same value to the power register several times, this
> > register is cached by the pwr_reg variable. At probe pwr_reg is initialized
> > to 0 by kzalloc of mmc_alloc_host.
> >
> > Like pwr_reg value is 0 at probing, the power on sequence fail because
> > the "power-off" state is not writes (value 0x0) and the lines
> > remain drive to low.
> >
> > This patch initializes "pwr_reg" variable with power register value.
> > This it done in sdmmc variant init to not disturb default mmci behavior.
> >
> > Signed-off-by: Ludovic Barre <ludovic.barre@st.com>
>
> Besides the comment, the code and the approach seems reasonable to me.

Another related question. I just realized why you probably haven't set
.pwrreg_nopower for the variant_stm32_sdmmc and variant_stm32_sdmmcv2.

I guess it's because you need a slightly different way to restore the
context of MMCIPOWER register at ->runtime_resume(), rather than just
re-writing it with the saved register values. Is this something that
you are looking into as well?

[...]

Kind regards
Uffe
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
