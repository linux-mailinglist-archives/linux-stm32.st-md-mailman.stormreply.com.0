Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 98BCF1AC926
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Apr 2020 17:21:04 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C0411C36B0C;
	Thu, 16 Apr 2020 15:21:03 +0000 (UTC)
Received: from mail-vs1-f65.google.com (mail-vs1-f65.google.com
 [209.85.217.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6B8D6C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Apr 2020 15:21:01 +0000 (UTC)
Received: by mail-vs1-f65.google.com with SMTP id p28so2603478vsg.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Apr 2020 08:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yQLFi9MaLL2nmNEDJgI1po1sqK0yDrrmYzbRTv6Uzug=;
 b=Jp2zHDuq1xGMtJ7LpM7ZSar0MqikjkAJd6KbYVKnCGgEY8V+AaPbfH0KzGn2fCfiue
 uo5oXB31OaDwbxlkGPDsP7ouskEBcuB+b9kCPb6K3tawp8YLOKRlVrk+uRA9U5foCOnl
 A7fQYZvj3q9GBt+xxZulepUE5iWKsXw/TsdH3LFaGtKvK3FXik1og1aIupOfVVftz1rN
 H/0qavSJnHrAWAXT0I/EVrinsNctcrhADYAd/10XZCTH7XTJ+bXcf1qTE1EdykJEMY+1
 r99oyhTnOIwQJQ4Y2c2z31mS+tylYE0Wp18LEzjTziTG2uWyBqhDs4JVVuvL7v0jIjik
 PEEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yQLFi9MaLL2nmNEDJgI1po1sqK0yDrrmYzbRTv6Uzug=;
 b=JQ/Oo88VnqLDvbvDLO0tjMVWzdI1zcmZ0fmHEnXRvZbAJ2I1+lvKDGyBJN/ZezTYmg
 fNVyhT0c4sVY5+3RdX2zG2YUFP+A/Np+XYf21QVpi3xwT8PqKGu3kkTKxDZSvftOLJoc
 H/4sTCDYwFGZPhbRX8HsbGzYzxFWE8DDCtrcjtLizH0HV92TaQh8snUoWKWD3AMLLJMj
 jL+kNa6cALj3F9NXfKop+rllk5CTkftRJzQBF1AaeWaWTHx5TqmWcIXglFo/X580Q1Jj
 rFDnpFvFZU5YkmN7uV0PxmIz3t/oMcua0w9zjMolLe+ZdpBLK9TM4+wB/H4Ckj+/yNBx
 yo/g==
X-Gm-Message-State: AGi0PuZM8ReA6TgJShANjW7bo+nLnSjfe5dJRk5ca70Tn+7FFt1+/K7r
 QXb8EJdBQMhh4lwkqXz8qvdhb9XPvslTzkktHxS3xQ==
X-Google-Smtp-Source: APiQypKelvng6nEDkSadPkm0R9266SRPp0qWA1kTwfViO4zgldtC09pWHiPRdE3fhPQJcFGPRCFF1mwnEke3v/8aUTs=
X-Received: by 2002:a05:6102:72d:: with SMTP id
 u13mr8883173vsg.35.1587050460084; 
 Thu, 16 Apr 2020 08:21:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200401195722.208157-1-marex@denx.de>
 <CAPDyKFoDB=d5B-2u_Y0e-XVzPQE46JBUTPwY_b_xzESm3NnjwQ@mail.gmail.com>
 <58d6bc7a-b772-e8cc-6120-b0adeb128070@denx.de>
 <CAPDyKFrAgLMUqU4oSRX64VoDQMMFZuM3KtUq6SL770XDSc+QbQ@mail.gmail.com>
 <20d299ab-ea7e-be85-7c5b-fd10e21a117d@denx.de>
In-Reply-To: <20d299ab-ea7e-be85-7c5b-fd10e21a117d@denx.de>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 16 Apr 2020 17:20:24 +0200
Message-ID: <CAPDyKFrOZG0F7jwm_gLTvbJ4odUn7tBcO0k9ZJgvjqp6BaJdow@mail.gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Russell King <linux@armlinux.org.uk>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH 1/3] mmc: Prepare all code for
 mmc_set_signal_voltage() returning > 0
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

On Thu, 16 Apr 2020 at 16:45, Marek Vasut <marex@denx.de> wrote:
>
> On 4/16/20 2:07 PM, Ulf Hansson wrote:
> > On Thu, 16 Apr 2020 at 12:29, Marek Vasut <marex@denx.de> wrote:
> >>
> >> On 4/15/20 10:40 AM, Ulf Hansson wrote:
> >>> On Wed, 1 Apr 2020 at 21:57, Marek Vasut <marex@denx.de> wrote:
> >>>>
> >>>> Patch all drivers and core code which uses mmc_set_signal_voltage()
> >>>> and prepare it for the fact that mmc_set_signal_voltage() can return
> >>>> a value > 0, which would happen if the signal voltage switch did NOT
> >>>> happen, because the voltage was already set correctly.
> >>>
> >>> I am not sure why you want to change mmc_set_signal_voltage(), can you
> >>> elaborate on that?
> >>>
> >>> I thought we discussed changing mmc_regulator_set_vqmmc(), what am I missing?
> >>
> >> Because mmc_set_signal_voltage() optionally calls
> >> host->ops_>start_signal_voltage_switch() , which can now return value >
> >> 0 , so the rest of the core needs to be patched to cater for that.
> >
> > The issue that you wanted to solve (at least by looking at the
> > original patch) was to understand whether the vqmmc regulator changes
> > voltage level and then take different actions based on that in the
> > mmci host driver.
> >
> > You don't need to change anything related to mmc_set_signal_voltage()
> > to accomplish that, do you? Moreover, I am worried that it may affect
> > the host driver's expectations from when
> > ->start_signal_voltage_switch() may be called.
>
> So, shall I just patch all the sites which use mmc_regulator_set_vqmmc()
> with something like
>
> return mmc_regulator_set_vqmmc();
> becomes
> ret = mmc_regulator_set_vqmmc();
> if (ret > 0)
>         ret = 0;
> return ret;

Yes, something along the lines of that. Or if you think it's better to
make mmc_regulator_set_vqmmc() to pass an out parameter. Whatever you
think looks best, I am fine with whatever.

Kind regards
Uffe
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
