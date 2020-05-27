Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED0E1E396A
	for <lists+linux-stm32@lfdr.de>; Wed, 27 May 2020 08:40:17 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E664FC36B21;
	Wed, 27 May 2020 06:40:16 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8201CC36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 May 2020 06:40:15 +0000 (UTC)
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CFFB32075A;
 Wed, 27 May 2020 06:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590561613;
 bh=geQPN2cB7sxO9U2Sau5QlOGksrlZFmA5S78FxZUADUM=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=CnmHpunOPyTq3p5AkW+fF2hEnKTTjCaUJEHXzWbZJNrRTIW0EhJuXpZUWTQhfOfsA
 78AZGWXjn2/fM6+vKQFsDRMqHYUk3y/lWdTQ6ESUvaiQxRvN8udsd4GLl8zidYy1Z6
 RRI9+cYYrMQZhQLEk7oi1XwbszKyBE07hvreYo2o=
MIME-Version: 1.0
In-Reply-To: <CAL9mu0L1OxDMHwNjfh+11br+z3vt+wyq45Q7-KNVSLTENAxH+Q@mail.gmail.com>
References: <1590378348-8115-1-git-send-email-dillon.minfei@gmail.com>
 <1590378348-8115-6-git-send-email-dillon.minfei@gmail.com>
 <159054389592.88029.12389551390229328953@swboyd.mtv.corp.google.com>
 <CAL9mu0L1OxDMHwNjfh+11br+z3vt+wyq45Q7-KNVSLTENAxH+Q@mail.gmail.com>
From: Stephen Boyd <sboyd@kernel.org>
To: dillon min <dillon.minfei@gmail.com>
Date: Tue, 26 May 2020 23:40:13 -0700
Message-ID: <159056161305.88029.13112387855463478530@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Cc: OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS
 <devicetree@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 linux-clk <linux-clk@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRM PANEL DRIVERS <dri-devel@lists.freedesktop.org>,
 linux-spi <linux-spi@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v5 5/8] clk: stm32: Fix stm32f429's ltdc
	driver hang in set clock rate,
	fix duplicated ltdc clock register to 'clk_core' case ltdc's clock
	turn off by clk_disable_unused()
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

Quoting dillon min (2020-05-26 20:30:47)
> On Wed, May 27, 2020 at 9:44 AM Stephen Boyd <sboyd@kernel.org> wrote:
> >
> > Quoting dillon.minfei@gmail.com (2020-05-24 20:45:45)
> > > From: dillon min <dillon.minfei@gmail.com>
> 
> >
> > >
> > > Signed-off-by: dillon min <dillon.minfei@gmail.com>
> >
> > Any Fixes tag?
> ok, will add --fixup in git commit next time, this patch fix two bugs,
> i should make two commit, each one has a
> fixes tag, right?
> first point to '517633e clk: stm32f4: Add post divisor for I2S & SAI PLLs'
> second point to 'daf2d11 clk: stm32f4: Add lcd-tft clock'

Sounds good. Thanks.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
