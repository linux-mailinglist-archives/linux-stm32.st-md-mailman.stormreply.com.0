Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A4F5167FF
	for <lists+linux-stm32@lfdr.de>; Sun,  1 May 2022 23:27:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AC52BC628A4;
	Sun,  1 May 2022 21:27:12 +0000 (UTC)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com
 [209.85.219.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8EBDAC628A0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  1 May 2022 21:27:11 +0000 (UTC)
Received: by mail-yb1-f182.google.com with SMTP id w17so23266421ybh.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 01 May 2022 14:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xAskLmoBXOcHx2RtzTF77xCmBBRnwL5PyD4a1eKKNdI=;
 b=hYV/EhhA2DcuXyipnbt78bMz1dzGRCn5wcMaI6OoOVP96sHoLhcaPCJ0RGRIOGrJAm
 akN8ym/xEl5RrJsPUfiMKwLpUrl0diGOu41mklHmoaSjLl8YtN0M+zkRZ4ap9kQ2hZh1
 iQq36tofaypj/mKFC2FKc0yP07ar7Qd0mLhPdltqDfCnFf3eRe/r5DWLpGiT5y8qvDTt
 GL7z9tExa6U/BM9Wf6zM4+YFtP9EAuI7gVIMlNQghw/8L8ztHTS7Vb4Z4rp2PkDnUETx
 ktBtv1I24NFPbSdl1tEVkgUvlxpfkbZLG+7vLp8cTR9Vps6SwdjRRtgQfvvLtyUUviAu
 5biQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xAskLmoBXOcHx2RtzTF77xCmBBRnwL5PyD4a1eKKNdI=;
 b=4g/GZjxwvOBFsm9lFBTx9nSif7nQEDm8+O/sznDLdujLrbC0kVLMQ5uJzhAhWg4FE2
 aMYDzT6Wm6eq1K/oqdIrByNvS2HNFGy/j6SRugj8qDAK9AeWjsyV2Kykb33JATQqZzzj
 zE3kl8dOZjWHwles0psrIUZ+3CPRjmOJZVSZibD4673BHrFHKd32JGfDGBkIUyxoR/8w
 EI2xeneYKqZXd2tK8pshWGeIzXZAef2sXBGGqh94Zd8Idtw+hJo+JhoJYo3liPzF99DR
 t0vJGETmNa//S4At6ev+PRPInHoYfuxjMsTah0VEWJ6iQkBlASim+Gun4lKICeK2kfHl
 fYvg==
X-Gm-Message-State: AOAM530DLXcEpEYX+I6eFNzobOHbwpHsfNZkIKbLyWx2++DvLDVFUgWZ
 Wud3nQX/YCFHgEKXSUTdSp5LauF0VZwygTC4M/5VFA==
X-Google-Smtp-Source: ABdhPJzeWejiiOdnxeA3dlJ1w/j6G5MpyiddMmyPKuipFWFSTECeY1MzdZqDUgfy0gPnbsIomcUkhrBhs/zBRuYqvdU=
X-Received: by 2002:a25:e684:0:b0:645:d429:78e9 with SMTP id
 d126-20020a25e684000000b00645d42978e9mr8625979ybh.369.1651440430413; Sun, 01
 May 2022 14:27:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220422143608.226580-1-fabien.dessenne@foss.st.com>
In-Reply-To: <20220422143608.226580-1-fabien.dessenne@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 1 May 2022 23:26:59 +0200
Message-ID: <CACRpkdbbUu+hKByGkVh2eR2MfMdgDuVYLFQ-VK+JyK_tRNsxZg@mail.gmail.com>
To: Fabien Dessenne <fabien.dessenne@foss.st.com>
Cc: Marek Vasut <marex@denx.de>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] pinctrl: stm32: improve bank clocks
	management
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

On Fri, Apr 22, 2022 at 4:36 PM Fabien Dessenne
<fabien.dessenne@foss.st.com> wrote:

> Instead of enabling/disabling the clock at each IO configuration update,
> just keep the clock enabled from the probe.
> This makes things simpler and more efficient (e.g. the time required to
> toggle an output IO is drastically decreased) without significantly
> increasing the power consumption.
>
> Signed-off-by: Fabien Dessenne <fabien.dessenne@foss.st.com>

Patch applied after merging in v5.18-rc5 as a prerequisite.

Yours,
Linus Walleij
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
