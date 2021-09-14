Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7488440C01A
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Sep 2021 09:06:12 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1A2A3C5A4F9;
	Wed, 15 Sep 2021 07:06:12 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7BBB3C56630
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Sep 2021 13:40:07 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id y8so6866085pfa.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Sep 2021 06:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=n1xHERTWrj7D1DTPEGJj3xVwOdFR4NfsEg1IOHAruuw=;
 b=N4HjvaGMKIHbXihQJY26tsfN0SewA/NZla4RAEMjOxtJnPQfLV4agqUhzeTnjj86Mt
 LP0m9lTl6Gc6Dye+LCwhyvl/J0g772XxXhLEL/qoIq7xOen0Ca6jYCS8eZ2/qpZq0CpS
 iO0vzwUwO6nDVOLORCamflLOU2mxqFvkBzACzG8ZqC8Bld+xFWgUSd0csXsxALqCZhCm
 HPkXkL2TX1Gco+oKpFU9M6+4J58W844WQdDbfFQm7AV71OwP54oZplG9BA6hERNK2z6I
 D6pebIdKVNWIMDx5h12PyCUXPFJzFt0WMgD+1+QclBKkdJL568CtTfs8ic03gNLoycKT
 9AiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=n1xHERTWrj7D1DTPEGJj3xVwOdFR4NfsEg1IOHAruuw=;
 b=zLC60wEJ9FwrhMprAcAWU7/W7j6h7rpkb/rqUhxNvqlkxxg0LAAVVcvG+5fka5oso7
 dy88JP8xmjxomjgOyOb+5I0NUYhaOAINn6SsNasok2SXOijLDiYRdejIGv4Ug79sLu8Z
 V3I6YwYT0HQCxb1X8YD27S9NFIGZ/aMeMTtFP4lLnIfdzQUTMt8g72Hk5dszYYPWWkAn
 895GKN3SF427e4OfTlafaco2hkS6oqxAxQu0D/YffJN+kZUbG7bYTWjaXjYX9+2q6fJx
 0+Ty0govgDs4vQwE5huH5HDbtSdgWRufZvIvd29XQat/3Dn6Ze8XgG5menP0JpF38CS+
 txbQ==
X-Gm-Message-State: AOAM533vOM4TR1Ayejv/Ss5oSunzHzQvoIDqgQV0H07NvqC1/cbuRNxn
 SnBELiY90AGSkb4LqTfdmAVWrkK6mlNW3Wlm/Xw=
X-Google-Smtp-Source: ABdhPJyx6W1PZKwym79XKRlu1WIoa0lt5UEVm+XWEe1zmmFeUxgWA/N1FXcqIdWfUY+sZHxx2c6EUP6FZ4I55/6Q7mA=
X-Received: by 2002:a62:770d:0:b0:43d:aff0:dbec with SMTP id
 s13-20020a62770d000000b0043daff0dbecmr4853543pfc.79.1631626806301; Tue, 14
 Sep 2021 06:40:06 -0700 (PDT)
MIME-Version: 1.0
References: <CAGjnhw920kNaJ9Vkg54WR8vh2TaomuTtA3WwR3eieD4v6iEJDw@mail.gmail.com>
 <2ada6f05-fc3a-a301-a008-594f7665a514@wolfvision.net>
In-Reply-To: <2ada6f05-fc3a-a301-a008-594f7665a514@wolfvision.net>
From: =?UTF-8?Q?Sebastian_D=C3=B6ring?= <moralapostel+linuxkernel@gmail.com>
Date: Tue, 14 Sep 2021 15:39:39 +0200
Message-ID: <CADkZQakh49i-M_1NgsENkqBnacVo6J3Rj8D2NFijvyBts9Pneg@mail.gmail.com>
To: Michael Riesch <michael.riesch@wolfvision.net>
X-Mailman-Approved-At: Wed, 15 Sep 2021 07:06:11 +0000
Cc: sashal@kernel.org, linux-kernel@vger.kernel.org, peppe.cavallaro@st.com,
 linux-stm32@st-md-mailman.stormreply.com, alexandre.torgue@foss.st.com,
 Ivan Babrou <ivan@ivan.computer>, linux-rockchip@lists.infradead.org,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, netdev@vger.kernel.org,
 kuba@kernel.org, wens@kernel.org, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Hi Michael,

I guess looking for a better or more ideal solution sounds good, but
sorry if this is impertinent, as it's coming from a mostly uninvolved
3rd party: This is affects a kernel that is labeled as "stable". It
seems extremely unacceptable to break ethernet support for boards like
the rockpro64, which are used largely in a headless fashion, when the
offending commit has already been identified.

I don't expect a stable kernel release to completely break my hardware
and then see people not immediately applying a workaround patch. It
seems strange. I'm not fond of having to fix things through serial
console and hunting through mailing lists to figure out what's going
on. I'd only expect this for -rc kernels.

Just my two cents.

Best regards,
Sebastian

Am Di., 14. Sept. 2021 um 12:09 Uhr schrieb Michael Riesch
<michael.riesch@wolfvision.net>:
>
> Hello Ivan,
>
> On 9/14/21 3:10 AM, Ivan Babrou wrote:
> > Is it possible to revert the patch from the 5.14 and 5.15 as well?
> > I've tried upgrading my rockpro64 board from 5.13 to 5.15-rc1 and
> > ended up bisecting the issue to this commit like the others. It would
> > be nice to spare others from this exercise.
>
> For what it is worth we believe that there is a different issue with the
> dwmac-rk driver that was obscured by calling pm_runtime_get_sync()
> early. Investigation in progress -- I hope that we can achieve a proper
> solution before we have to revert the revert.
>
> Best regards,
> Michael
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
