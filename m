Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A634F7E32
	for <lists+linux-stm32@lfdr.de>; Thu,  7 Apr 2022 13:42:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 84DA7C628A2;
	Thu,  7 Apr 2022 11:42:24 +0000 (UTC)
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com
 [209.85.167.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E81DBC6049B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 Apr 2022 11:42:22 +0000 (UTC)
Received: by mail-oi1-f176.google.com with SMTP id z8so5345875oix.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 07 Apr 2022 04:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4SlNyJLkNkQjFibbjG7LibUXxMJ0vZJMxjm1ghUeLSo=;
 b=RyFz37RFrTq9tfEhm7CeR0XjT0XDM8te7eZ7yZTVn04gO23o3fYXZcM43nomGQETne
 k7I9SVLcJZsWi3Hfk8otl/I4P4YAlBF6HAuW+IhPYqZvKLVPsNuLUFvm76frX+RVZmn1
 EJLaHovsDsDTZqlT52trbcbd7nTvNGMLBZSNLyaXtpuq4KNeE/iKlH9MRyPxWNrglS2v
 8Hh6gIDU7InmRt+pgufza4JN2xpcLZLF1ef0u06op9zmgSjZXMHNmOh+MS+oXQmIX2pQ
 5HIWmA8Bu6/Qz5CvJGKvBtlb34aWLqpEGknEKNYwVumxYck8dYVDggcxvT5hL6UqNVYC
 G9PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4SlNyJLkNkQjFibbjG7LibUXxMJ0vZJMxjm1ghUeLSo=;
 b=Wrvk1hiX+1h/Y0D0TsWADdQ6Dti++svN2nDJZnOrxIVV9WzMl0/Pr3c+2enEHP9tB4
 tzRsL9p0zY/NicLMbqnk57JORm38j7eH2YmuFkoRmZq8XmwQKLDFg+BSNlZ5uFJlcuCE
 4BoBLtMgkph6R25VfJL9mfuAB08mUzW/vpoJwrXZxsodsf3herM6D7H1wALPNCs8eo5F
 BvBixvBUWbfQ6URuDP3q3DW3YoHWurmBTTE1K3fZQyemy8PDuYlDAM6dfozX7XRh/wOv
 r35L7HW7nkL5/jOGkJwt4uxLNJzKT1FPO6q6SS1qH+sL4SuBhGgNUwkYkugPuq1fQvJd
 +waQ==
X-Gm-Message-State: AOAM531sXIQbGRQqZEZmQ7qs/ce5nM7pVOfGagB0ddIERmimioPfwRla
 n9jGfUgeCtmKA88QRVeH+pPmsjHWy5ZQk/S3MVzwrA==
X-Google-Smtp-Source: ABdhPJwmb8NPaOfFwbH1UoLl7ZnI0TLh1pppFo6Oeu8yFnd1iYpTTiurcyIBl4X6Tu7dcJs42w/30+ElAs6L8dIdvzc=
X-Received: by 2002:a05:6808:1991:b0:2da:350d:f9fc with SMTP id
 bj17-20020a056808199100b002da350df9fcmr5606947oib.251.1649331741621; Thu, 07
 Apr 2022 04:42:21 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYuqU45hHmK4WMUNEXQbmBucE+9fB=S9wcHEfEHaZ2jgcQ@mail.gmail.com>
 <20220401151058.fipdax3kvmxknctv@houat>
 <CA+G9fYu+WddXTb0NcbviUfGQHhsmThssVCafLPw7+nj3JsoFAA@mail.gmail.com>
 <20220407075435.ahlylmbqmqnpxz64@houat>
In-Reply-To: <20220407075435.ahlylmbqmqnpxz64@houat>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 7 Apr 2022 17:12:09 +0530
Message-ID: <CA+G9fYvT_W9+0AguQu97mqTm5zNnSvF0asnatZX8BTf=_1oANg@mail.gmail.com>
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

On Thu, 7 Apr 2022 at 13:24, Maxime Ripard <maxime@cerno.tech> wrote:
>
> Hi,
>
> > > I'm not sure if it's feasible, but if it is, it looks like something
> > > that could be fixed by the patch pasted here:
> > >
> > > https://lore.kernel.org/linux-clk/20220401122736.5yvanksa4pla7uql@houat/
> > > Could you test it?
> >
> > I have tested the single line patch and reported problems not fixed.
>
> Could you test this branch?
> https://github.com/mripard/linux/tree/rpi/clk-improvements-more-fixes

I have tested your tree and branch.
I saw more clk prints in the boot log and did not notice the reported warning.

[    0.734195] clk_set_rate_range_nolock: qdss: orphan ? n
[    0.734222] clk_set_rate_range_nolock: qdss: core req rate 0
[    0.734235] clk_set_rate_range_nolock: qdss: clamped rate 0
[    0.734249] clk_core_set_rate_nolock: qdss: rate 0
[    0.734262] clk_core_set_rate_nolock: qdss: rounded rate 0
...
[    3.574169] clk_set_rate_range_nolock: gcc_ufs_phy_ice_core_clk: orphan ? n
[    3.581271] clk_set_rate_range_nolock: gcc_ufs_phy_ice_core_clk:
core req rate 300000000
[    3.589446] clk_set_rate_range_nolock: gcc_ufs_phy_ice_core_clk:
clamped rate 300000000
[    3.597521] clk_core_set_rate_nolock: gcc_ufs_phy_ice_core_clk:
rate 300000000
...

Please refer this link for detail boot log,
https://lkft.validation.linaro.org/scheduler/job/4861930#L2712

Build link
https://builds.tuxbuild.com/27SxYLYlZcKEUQGVbmnmLP3GxEp/

- Naresh

>
> Thanks!
> Maxime


--
Linaro LKFT
https://lkft.linaro.org
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
