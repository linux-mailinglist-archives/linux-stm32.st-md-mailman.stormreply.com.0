Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 042594CF92
	for <lists+linux-stm32@lfdr.de>; Thu, 20 Jun 2019 15:51:06 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A4269C63338
	for <lists+linux-stm32@lfdr.de>; Thu, 20 Jun 2019 13:51:05 +0000 (UTC)
Received: from mail-ua1-f67.google.com (mail-ua1-f67.google.com
 [209.85.222.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 42431C63337
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Jun 2019 13:51:04 +0000 (UTC)
Received: by mail-ua1-f67.google.com with SMTP id z13so1673317uaa.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Jun 2019 06:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2IFwlqbKib7dWbeVbv8X2YweFdeF4XDbaSTOpsTFt9E=;
 b=cnBfFGGl3pJdpKp1MmBsF47mWvkNWCygNpH36R5cENrnDyoojF55rqerYfDLfwbbTj
 RFNj58C5CUCULzDhnJhuuGUawX8GzXHIVIZhOz7jX/xVeIdC14e76z4ee9EhQzScRn3r
 yZyPrtDQwDjqyu6vqRuq4CLTKqp19vhLDP1kzyZlJral0qqZUmCvS5srHMy+sgfXo7OX
 8J3/HDJJtVqUJPoO9R3c2uQaBqDPo5Hb8yFlY4a3lZNrdJXrZ2uvs7wDiEP1uZSr6Jfu
 RATefM9/IOvINHrRt3pDF9AMIZimpQikwZUjdX3vOvvUC0JBvtUIxqFbJK3SbyUB77sX
 swNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2IFwlqbKib7dWbeVbv8X2YweFdeF4XDbaSTOpsTFt9E=;
 b=HVkR07IpKc+nVk07ux+JTlEcxRx9ocZS78orjQcrrdDaODXaIdjB1wkOBz7hN/t1rX
 zVEi9Mb62Bcfc6cLEruFfvBYWf2ba+ixMiBrbTj0W203vx1HosmgLu1EK5vrlQQn9nW+
 55jTs7CdZEhlY9uoADO17kMrVq04kNdw9GleFT5pC8CieH0+j3N4MUxL7KlNerFaGfhP
 /zhIok5lkhvjJFxoUiAerUoFieOyafpXR1L029EoJTWtFG6w0HBBzxWSrsoL6sLeS3rq
 veZwTC86vmXIdV6dwoncX5S9QZAGykeesjBYkYA4C0HXHnbGz54dKsZpe5nW2htBZ956
 FXmg==
X-Gm-Message-State: APjAAAU7qFW0If67k04S83DzyBMfUwEXYJWL8VNO5AHBzWVcqO0Mdvgx
 crIUa521F/O4v9v5CUWG9SB4t2QhCe8dOhF3tXIKtQ==
X-Google-Smtp-Source: APXvYqyZXCFrwLLbuKH87ntBoB1uPTcKE017Mrw8Z9+j3VOUxMLwq/g1pwfocngRvtK/nHu4TYQODtwzbAxVOv/4r8s=
X-Received: by 2002:a9f:242e:: with SMTP id 43mr8151929uaq.100.1561038663128; 
 Thu, 20 Jun 2019 06:51:03 -0700 (PDT)
MIME-Version: 1.0
References: <1559577325-19266-1-git-send-email-ludovic.Barre@st.com>
 <5b7e1ae5-c97e-5a21-fc3e-7cc328087f04@st.com>
 <CAPDyKFrULRk=cHzVodU9aa6LDX9ip-VPHNwG7QXhmNZrMpPjGw@mail.gmail.com>
In-Reply-To: <CAPDyKFrULRk=cHzVodU9aa6LDX9ip-VPHNwG7QXhmNZrMpPjGw@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 20 Jun 2019 15:50:26 +0200
Message-ID: <CAPDyKFr_KNpNY-xgGdKXdAnmmD5OD1=wxgs2LmBAUJOn0mZwqg@mail.gmail.com>
To: Ludovic BARRE <ludovic.barre@st.com>
Cc: DTML <devicetree@vger.kernel.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH V3 0/3] mmc: mmci: add busy detect for
	stm32 sdmmc variant
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

Hi Ludovic,

On Thu, 13 Jun 2019 at 15:13, Ulf Hansson <ulf.hansson@linaro.org> wrote:
>
> On Thu, 13 Jun 2019 at 15:02, Ludovic BARRE <ludovic.barre@st.com> wrote:
> >
> > hi Ulf
> >
> > Just a "gentleman ping" about this series.
> > I know you are busy, it's just to be sure you do not forget me :-)
>
> Thanks! I started briefly to review, but got distracted again. I will
> come to it, but it just seems to take more time than it should, my
> apologies.

Alright, so I planned to review this this week - but failed. I have
been overwhelmed with work lately (as usual when vacation is getting
closer).

I need to gently request to come back to this as of week 28, when I
will give this the highest prio. Again apologize for the delays!

Kind regards
Uffe

>
> Br
> Uffe
>
> >
> > Regards
> > Ludo
> >
> > On 6/3/19 5:55 PM, Ludovic Barre wrote:
> > > From: Ludovic Barre <ludovic.barre@st.com>
> > >
> > > This patch series adds busy detect for stm32 sdmmc variant.
> > > Some adaptations are required:
> > > -Clear busy status bit if busy_detect_flag and busy_detect_mask are
> > >   different.
> > > -Add hardware busy timeout with MMCIDATATIMER register.
> > >
> > > V3:
> > > -rebase on latest mmc next
> > > -replace re-read by status parameter.
> > >
> > > V2:
> > > -mmci_cmd_irq cleanup in separate patch.
> > > -simplify the busy_detect_flag exclude
> > > -replace sdmmc specific comment in
> > > "mmc: mmci: avoid fake busy polling in mmci_irq"
> > > to focus on common behavior
> > >
> > > Ludovic Barre (3):
> > >    mmc: mmci: fix read status for busy detect
> > >    mmc: mmci: add hardware busy timeout feature
> > >    mmc: mmci: add busy detect for stm32 sdmmc variant
> > >
> > >   drivers/mmc/host/mmci.c | 49 +++++++++++++++++++++++++++++++++++++++++--------
> > >   drivers/mmc/host/mmci.h |  3 +++
> > >   2 files changed, 44 insertions(+), 8 deletions(-)
> > >
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
