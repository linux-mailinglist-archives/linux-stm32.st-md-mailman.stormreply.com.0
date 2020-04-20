Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 495E31B042C
	for <lists+linux-stm32@lfdr.de>; Mon, 20 Apr 2020 10:18:51 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0220BC36B0C;
	Mon, 20 Apr 2020 08:18:51 +0000 (UTC)
Received: from mail-ua1-f65.google.com (mail-ua1-f65.google.com
 [209.85.222.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 50541C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Apr 2020 08:18:49 +0000 (UTC)
Received: by mail-ua1-f65.google.com with SMTP id n26so1562975uap.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Apr 2020 01:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=It2vA21CwHolWpfirZrNfml7BAn8xW9KliuigaVPmQc=;
 b=jb1MGt9S2UQTTMPIjIj59TqFDBsCYHvXydQP1BV/FKasi9ecAniUpbEZyM4n0wyUBI
 rEIVIB1SoIuUQ5/RtDynoWn+x9z6lPx8chOdzQDtQcF2OTurfPvimcChtZQhDoyth90s
 dHKt9NIZkh4+iVw/+Lk17lOt/fj4pGvaPNBwaXS2CdhLeuei0Rcran3pkuRSZkRD84yA
 G4yw7PpFjYRALt+krAtZvAHqMROyloyKUh6xdZtzQncj0wt8XZYtre6TCDpaM+K2ostp
 2Owmu8mpy9iVy1UsL0gNXmRa2aIfHWNYANkVzvRTnLfpuqWqXBCNdvwvO9kA9PtNohDH
 vPzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=It2vA21CwHolWpfirZrNfml7BAn8xW9KliuigaVPmQc=;
 b=oLZ4DaLwPy0iEn9m07JP4f97NPFSuDnOGsv5IIZzcx8IchY25n1rhP5kyDHljEXqXl
 HIHq1kVPC/JKa83GHVZej2611r/7+0edfGZa27KBU27R4KjDc4ZCIerQeOHdns3/xlVo
 1BGB74JqkkhKzQ06QfnwEkOrFUIhTdcZFG/lC927GnXt/Mej2sl5ICsgFtkBAb1Jz61p
 n+9nNoDwfZxyDre5+m6bkudtIwL2Qw0JBowBKrvLkARxOLBvBVkd8jOUo37eMg1nR++N
 neVZQiEBfNlPo85U4OLC8Pqoy5BCpmW7Hdc5hqnDRLOOg4RafroSmXfrqYpmoA6x/CQr
 EGmw==
X-Gm-Message-State: AGi0PubzPMn50Gvgb2IGSBE1ITjzf1oqVj3VExiF0WTAjuzqDtKFYqBc
 9YRyR1Vlt5JSWt1MUbntvCc+n0rPb9hqgwSUPMF4lA==
X-Google-Smtp-Source: APiQypJtk77V1X8LIw0dAU5kX+wiqu7ySYUsJUq3LKsJR6m83qHiqqkP5jl/C3bqjnClwMvFKIlOPeqfCMfE1azjEhY=
X-Received: by 2002:ab0:6588:: with SMTP id v8mr6243394uam.100.1587370728146; 
 Mon, 20 Apr 2020 01:18:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200416163649.336967-1-marex@denx.de>
 <CAPDyKFqztJDfTrc+1q9mdyf0f2s=gE91J3eM92rzmm+FJNBW9A@mail.gmail.com>
 <11a78052-6320-2986-42b0-3f5536b8c061@denx.de>
In-Reply-To: <11a78052-6320-2986-42b0-3f5536b8c061@denx.de>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 20 Apr 2020 10:18:12 +0200
Message-ID: <CAPDyKFpQXaQ+rOX7f+zLfG2Q6fX3FsDk8d+uBtxAcLNkKPhAxQ@mail.gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Russell King <linux@armlinux.org.uk>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH V2 1/3] mmc: Prepare all code for
 mmc_regulator_set_vqmmc() returning > 0
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

On Fri, 17 Apr 2020 at 17:33, Marek Vasut <marex@denx.de> wrote:
>
> On 4/17/20 11:30 AM, Ulf Hansson wrote:
> > On Thu, 16 Apr 2020 at 18:36, Marek Vasut <marex@denx.de> wrote:
> >>
> >> Patch all drivers which use mmc_regulator_set_vqmmc() and prepare them for
> >> the fact that mmc_regulator_set_vqmmc() can return a value > 0, which would
> >> happen if the signal voltage switch did NOT happen, because the voltage was
> >> already set correctly.
> >>
> >> Signed-off-by: Marek Vasut <marex@denx.de>
> >> Cc: Alexandre Torgue <alexandre.torgue@st.com>
> >> Cc: Linus Walleij <linus.walleij@linaro.org>
> >> Cc: Ludovic Barre <ludovic.barre@st.com>
> >> Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> >> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> >> Cc: Patrice Chotard <patrice.chotard@st.com>
> >> Cc: Patrick Delaunay <patrick.delaunay@st.com>
> >> Cc: Russell King <linux@armlinux.org.uk>
> >> Cc: Ulf Hansson <ulf.hansson@linaro.org>
> >> Cc: linux-stm32@st-md-mailman.stormreply.com
> >> To: linux-mmc@vger.kernel.org
> >
> > Applied for next, thanks!
> >
> > I took the liberty to re-work and simplify some of the code, please
> > have a look at my next branch to make sure I didn't screw something
> > up.
>
> Where is your next branch ?

It's listed in the MAINTAINERS file.

git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/mmc.git

Kind regards
Uffe
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
