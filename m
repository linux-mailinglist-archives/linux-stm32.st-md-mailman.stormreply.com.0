Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CC65719A6F9
	for <lists+linux-stm32@lfdr.de>; Wed,  1 Apr 2020 10:17:08 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 81E12C36B0B;
	Wed,  1 Apr 2020 08:17:08 +0000 (UTC)
Received: from mail-ua1-f66.google.com (mail-ua1-f66.google.com
 [209.85.222.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8D9ABC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  1 Apr 2020 08:17:06 +0000 (UTC)
Received: by mail-ua1-f66.google.com with SMTP id f9so8743753uaq.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 01 Apr 2020 01:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ensGezno4nmhj/DQXTgSjB6W9s0hooLswX7hmYrhsYs=;
 b=TFRE9IalabaS54Co9qCRHXDAKQZ8dqfLecwCXI0i4qEvEy2pykDB6zTBWsk6Y3YSUT
 6HN2RX1XTv4HHTt/9kJdLsz6wV9ajV1ybvfw1QEKHVLpsKWfJ2+U0ZXsxwybV+3oaqTb
 Odq+0k1ojeQnFLJsBCyKj20zYQmmcXmK+e52TDBWXDftfip2IxyIxUg4r98xe/H/57Bk
 K5XYc3YJQIxgZNiqmsXgC5SOyLNsbV67NyF9CWYCvfXdVYaqkhf7OOd+edYTaKvMLXCZ
 /itut1tKZbfF8o+8jX9hnrws6V6ZK/nHF8ugr/knbrem2hfAdRS3IMyBFgxRwBgWvMvS
 2ggQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ensGezno4nmhj/DQXTgSjB6W9s0hooLswX7hmYrhsYs=;
 b=hG2P0ZkpYA7n5JYdomPNvvQ5MM41YpJ5iFcDnOuCxN+CMbFWXI3Yj3B8qE2fhtQGlD
 6IKxVLMekZj44k0ZE9NFDsLVPD4+2zrgF/JIJqxnwBwCGiQG7Hs0zXJgLNu8xahsNEJi
 kedXcZfKH+ZZQktXhaZOjSV/cc12KEl7r1E9rrcwoQJKKqpLRF9B4cnXbgn6El4EDQ14
 e9RqbBj3kxafE7fr0h2QE80YWHeIGY2ew7a2ZUYVJqFk9d53zhtr3jHHVmAig/umhTap
 HacwXwP/v5l57VYA3BD6WThWU93/p5ALCdhBM8xTDJC6U1x8qkqtpnA3uCdSWrkS+moP
 QkrQ==
X-Gm-Message-State: AGi0PuaceM/Vscw2lEx6dJrGmiXrJHJYetkTAOJgm3m96Mdx4lFYdibX
 F7uHE+QZyiirZlJ4jGHcXp2txZRT2aluXM00OOjXeQ==
X-Google-Smtp-Source: APiQypJE/rOrtpVM/N8R34J7/BlgBaqpmAWpSVysnxQZrIHkKr0+mYCUesLSD5y0GEwVgkHo/cfrF633iR9GGKoYL7Y=
X-Received: by 2002:ab0:6204:: with SMTP id m4mr15304673uao.15.1585729025357; 
 Wed, 01 Apr 2020 01:17:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200331155254.100952-1-marex@denx.de>
 <CAPDyKFrypbDEuDaGWySjC6j_qKbXpVHoubhh8e9jS24JSzBg3Q@mail.gmail.com>
 <7a7c0180-0a11-17b2-7815-b18b1ca11120@denx.de>
In-Reply-To: <7a7c0180-0a11-17b2-7815-b18b1ca11120@denx.de>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 1 Apr 2020 10:16:29 +0200
Message-ID: <CAPDyKFoEFe=fru0=HCTzG2CikGA72hFWK0y6iL_EN6BDK3Vtkw@mail.gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Russell King <linux@armlinux.org.uk>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] mmc: mmci: Only call
 .post_sig_volt_switch if voltage switch happened
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

On Tue, 31 Mar 2020 at 23:01, Marek Vasut <marex@denx.de> wrote:
>
> On 3/31/20 8:53 PM, Ulf Hansson wrote:
> > On Tue, 31 Mar 2020 at 17:53, Marek Vasut <marex@denx.de> wrote:
> >>
> >> Call the post voltage switch handler only if the voltage switch actually
> >> happened. It is well possible that the regulator is already set correctly
> >> and no voltage switch happened, so there is no need to take any further
> >> action.
> >>
> >> This fixes a real issue on STM32MP1 where, if the eMMC is supplied with
> >> VccQ=1.8 V, the post voltage switch code will spin indefinitelly waiting
> >> for the voltage switch to complete, even though no voltage switch really
> >> happened.
> >
> > Whether this is a common problem or not, I think in a first step we
> > should manage this in the common mmc_regulator_set_vqmmc().
>
> I can pass in a variable which would be set if a voltage switch actually
> happened in mmc_regulator_set_vqmmc() OR I can return a code > 0 from
> there. Which one do you prefer?

Return a code > 0.

>
> Then I guess we can add something like
>
> if (regulator_get_voltage(...vqmmc) is already in voltage range)
>  return 1;
>
> ...
>
> and the MMCI driver would do something like
>
> if (mmc_regulator_set_vqmmc(...) > 0)
>  host->ops->post_sig_volt_switch(...);
>
> That looks OK I guess ?
>
> > Then on top of that, convert mmci into using the mmc_regulator_set_vqmmc() API.
> >
> > Can please try this approach instead?
> Sure. Does the above look sane ?

Yes, great!

Kind regards
Uffe
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
