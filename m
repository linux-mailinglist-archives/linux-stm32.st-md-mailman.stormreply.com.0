Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A17934F86B3
	for <lists+linux-stm32@lfdr.de>; Thu,  7 Apr 2022 19:56:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5973AC628AE;
	Thu,  7 Apr 2022 17:56:54 +0000 (UTC)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com
 [209.85.219.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 147A7C628A2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 Apr 2022 17:56:53 +0000 (UTC)
Received: by mail-yb1-f177.google.com with SMTP id l36so10884016ybj.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 07 Apr 2022 10:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VlVF6lOp5dpC/j+GTWtTRB8fshiniUoILlPCbn8biBo=;
 b=cnyeRbdWotGynXREUrsZQqgNgw9t4HD1KXVc4VKbHn62elv0ZJt7/Sny282D3dfpa7
 9mwQsjnSnkas/boXNFGM4nCbO8mV/xB7h4n5AXa8sVjfI3a6kspQMlWxD7mZyWIVwdGO
 1k9Sx57p+wkTVmp+URiYVrQqs+xgROZiGchYY37qIcmaFSYoqXA6sCPLlvBhtZUFpu3f
 gvjzwXPBDF9oHVP9nQmjySzPmPJpUHFLeynLskBL2jB3YA1jp/eVHOgk7UEUFUcJOEAi
 tFuYYy5mhJhPwfEJ/9nNrBcZZrwOjPrIpmdswHYrYNZ6PiZjnrXsqcHnToS9LDQHE13L
 +V7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VlVF6lOp5dpC/j+GTWtTRB8fshiniUoILlPCbn8biBo=;
 b=qqw2lSmj1+drhkKoKBC0zfxGYJBLrssg7zELHKNAEfsL5LxSuvBkl4hKsIZj7jZ04n
 kb4cI5SMo37v8qYfYZAo1LZFlR6A2C3Y1mvmtv43bVzVTVshFY7MVJonPiyt/4VyRaV/
 Wc+7vdlnT1iUb/HiZOZLb9jAICj57scH/iUmBetw4ttpM+vpQLK4nxJ83gs8/s5YysY5
 NOYPqLM/6KqTl9HOwcazIssHC+WVKSnGfPhGWyEDBNPO5tPSMxErwJkfinHaKJ2nLh6K
 LhwrgI1O/6hvF9rqk/mE7+k94Rv1RBBJLz018dvxK5jYp/98OUoRDamLW9eu0iu6bstD
 XpPQ==
X-Gm-Message-State: AOAM531hUfBhXks3Mmo+R1jcmONuU7ZL70A8KEMFPZ8v3wVzghctFngj
 1a8GM9crNvTD3ynwbh3xI8PukTobCevBSSYLZYsV+/DWPlISdpur
X-Google-Smtp-Source: ABdhPJx7pBIu4DCGwRwQQvrbwgWliwJ3a5uEdC2cz90Zd9apB6WTYrp2DxQjMM+J44bGx5hlZh8QCq7A4LTclign76w=
X-Received: by 2002:a25:2409:0:b0:634:15f4:2240 with SMTP id
 k9-20020a252409000000b0063415f42240mr10337229ybk.88.1649354211810; Thu, 07
 Apr 2022 10:56:51 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYuqU45hHmK4WMUNEXQbmBucE+9fB=S9wcHEfEHaZ2jgcQ@mail.gmail.com>
 <20220401151058.fipdax3kvmxknctv@houat>
 <CA+G9fYu+WddXTb0NcbviUfGQHhsmThssVCafLPw7+nj3JsoFAA@mail.gmail.com>
 <20220407075435.ahlylmbqmqnpxz64@houat>
 <CA+G9fYvT_W9+0AguQu97mqTm5zNnSvF0asnatZX8BTf=_1oANg@mail.gmail.com>
 <20220407134615.pqx4lxvgl4ofjrki@houat>
In-Reply-To: <20220407134615.pqx4lxvgl4ofjrki@houat>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 7 Apr 2022 23:26:40 +0530
Message-ID: <CA+G9fYucyqd6LqBGGzmwXA=hYRyETJmk_w1Z0qPnFn3+Fzj7sQ@mail.gmail.com>
To: Maxime Ripard <maxime@cerno.tech>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, regressions@lists.linux.dev,
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 gabriel.fernandez@foss.st.com, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Nicolas Dechesne <nicolas.dechesne@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-clk <linux-clk@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [next] db845c: WARNING: CPU: 5 PID: 8 at
 drivers/clk/clk-divider.c:139 divider_recalc_rate
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

Hi Maxime

On Thu, 7 Apr 2022 at 19:16, Maxime Ripard <maxime@cerno.tech> wrote:
>
> Hi Naresh,
>
> On Thu, Apr 07, 2022 at 05:12:09PM +0530, Naresh Kamboju wrote:
> > On Thu, 7 Apr 2022 at 13:24, Maxime Ripard <maxime@cerno.tech> wrote:
> > >
> > > Hi,
> > >
> > > > > I'm not sure if it's feasible, but if it is, it looks like something
> > > > > that could be fixed by the patch pasted here:
> > > > >
> > > > > https://lore.kernel.org/linux-clk/20220401122736.5yvanksa4pla7uql@houat/
> > > > > Could you test it?
> > > >
> > > > I have tested the single line patch and reported problems not fixed.
> > >
> > > Could you test this branch?
> > > https://github.com/mripard/linux/tree/rpi/clk-improvements-more-fixes
> >
> > I have tested your tree and branch.
> > I saw more clk prints in the boot log and did not notice the reported warning.
>
> I just pushed a new version of my branch? It should get rid of most of
> the side effects (and logs) you were seeing.

The reported problem has been fixed.
Please check this boot log and test log [1].
FYI, "clk_ignore_unused" has been used in Kernel boot args.

https://lkft.validation.linaro.org/scheduler/job/4862043#L2712


- Naresh

>
> Thanks!
> Maxime
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
