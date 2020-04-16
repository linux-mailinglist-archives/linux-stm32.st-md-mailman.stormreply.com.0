Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 274C41AC0B7
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Apr 2020 14:07:40 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C8453C36B0C;
	Thu, 16 Apr 2020 12:07:39 +0000 (UTC)
Received: from mail-vs1-f67.google.com (mail-vs1-f67.google.com
 [209.85.217.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E9714C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Apr 2020 12:07:37 +0000 (UTC)
Received: by mail-vs1-f67.google.com with SMTP id r7so2237487vso.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Apr 2020 05:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zqK9vQ7uGVRX9EHsY2IXKQ2OQL2LPfO4oHpQbQH0pZ8=;
 b=LSxq7bWjMbSX3AuwKUh3cNpQt/nN7PvEFYiQB9rgjEvR0+dRmCdIMIqoXYMhiblyaw
 C91Dd7UOwgN9yPg5X/DFkqiTma1eDPP/rzOsCuPeMkzxgZiGADw9WtgpjP3VStN6KoY9
 5yVRw/pcZ0V+nkcCVoJSLlDurwhMIRLW0fZxjK39nl69/FeO+zlWHm7JwOy3V1c1EyTt
 0RxSo0ZXoA2X6qaG2cwa/s7hzBY9q7YhzY3gItlnxgDGMOd4Q+ak7m1zg+nQRtZOs8HM
 K0BFFf1FAj9ZfenK+l2umXsqnuL8oqJWgb8HDX//7MOuvt4zQ21bC0uqbKs3Yz6TKu3I
 tVqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zqK9vQ7uGVRX9EHsY2IXKQ2OQL2LPfO4oHpQbQH0pZ8=;
 b=jfPSXRNk4k8Rl1Ufo/3q0F8IwTCMy53ZIDaTQiPLn22341HFtXEbYTHTfBpvpjre/j
 Pr3K65haDoLtgdSs25GZnmOrVtPFL1EvrLXOcDOP9Ppk3KNnapaQmNMvPz0deJQ7o91+
 2dqFoK1SMtkSxbKS8juJ/ljJe+Fi8BFTTuiIEhvS4ixSkxiT7Xfa+4voOGAo6G9AqRp5
 5GuYZryr4+0V/MHjQ7fPp8aCs89nFNXk49IEYfLaXJP3FDsciv0TXrzNvFdKlB5vkPTm
 6c6afjMaDUhxX7+ZTBTnI5m1QkAiqtWpTwz2puJ2F1vrcxxZBImb0pCnDX1QNohFgYE7
 JEwA==
X-Gm-Message-State: AGi0PubxP1bt6DzoxZUoYvyH3Rt+uKNHBt3GBIr545TEdjRuQAm8GQLK
 W1BauRjP+JbiEci4zu7zs1P5fcLAnqCJJvH46ZKYHQ==
X-Google-Smtp-Source: APiQypIf2U2EaVxpSy4+oahhN3R6apIV7Qx6ZHTYZ7H9F80/bkUHDrRU90Fz1tgagdqlSZBnxZruBkF4YXlou7tk7Sk=
X-Received: by 2002:a67:ead1:: with SMTP id s17mr1293841vso.200.1587038856541; 
 Thu, 16 Apr 2020 05:07:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200401195722.208157-1-marex@denx.de>
 <CAPDyKFoDB=d5B-2u_Y0e-XVzPQE46JBUTPwY_b_xzESm3NnjwQ@mail.gmail.com>
 <58d6bc7a-b772-e8cc-6120-b0adeb128070@denx.de>
In-Reply-To: <58d6bc7a-b772-e8cc-6120-b0adeb128070@denx.de>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 16 Apr 2020 14:07:00 +0200
Message-ID: <CAPDyKFrAgLMUqU4oSRX64VoDQMMFZuM3KtUq6SL770XDSc+QbQ@mail.gmail.com>
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

On Thu, 16 Apr 2020 at 12:29, Marek Vasut <marex@denx.de> wrote:
>
> On 4/15/20 10:40 AM, Ulf Hansson wrote:
> > On Wed, 1 Apr 2020 at 21:57, Marek Vasut <marex@denx.de> wrote:
> >>
> >> Patch all drivers and core code which uses mmc_set_signal_voltage()
> >> and prepare it for the fact that mmc_set_signal_voltage() can return
> >> a value > 0, which would happen if the signal voltage switch did NOT
> >> happen, because the voltage was already set correctly.
> >
> > I am not sure why you want to change mmc_set_signal_voltage(), can you
> > elaborate on that?
> >
> > I thought we discussed changing mmc_regulator_set_vqmmc(), what am I missing?
>
> Because mmc_set_signal_voltage() optionally calls
> host->ops_>start_signal_voltage_switch() , which can now return value >
> 0 , so the rest of the core needs to be patched to cater for that.

The issue that you wanted to solve (at least by looking at the
original patch) was to understand whether the vqmmc regulator changes
voltage level and then take different actions based on that in the
mmci host driver.

You don't need to change anything related to mmc_set_signal_voltage()
to accomplish that, do you? Moreover, I am worried that it may affect
the host driver's expectations from when
->start_signal_voltage_switch() may be called.

[...]

Kind regards
Uffe
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
