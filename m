Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F324364F
	for <lists+linux-stm32@lfdr.de>; Thu, 13 Jun 2019 15:14:26 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6DA98CB36E0
	for <lists+linux-stm32@lfdr.de>; Thu, 13 Jun 2019 13:14:26 +0000 (UTC)
Received: from mail-vs1-f65.google.com (mail-vs1-f65.google.com
 [209.85.217.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 18ABECB36DB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Jun 2019 13:14:24 +0000 (UTC)
Received: by mail-vs1-f65.google.com with SMTP id q64so12594257vsd.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Jun 2019 06:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CR4I31iRpJNzMeDmL877t0ARvDi8UmH6xTDgLBUKOEU=;
 b=ELoOMPni1y0S2Eeu4CKg+k17whALIizetT7cvmiVzng2ASoWY/zEf4QCF5Q4OCkG4r
 lLSK1k41lMROJ+CxzlSyxs4V908CnVex3CA8jzK+NeJYcm9x2tEsn3yAQP+XWphKFejP
 JnPcJGVuzsD2hPED5Rx4zSlBDEMa4cgvvknreVnW5pBkqU20fs0btRzAemvxo5UuMhXw
 g5QinFv6WnqFTkUUnCvRl6n9kN9cK8l6xbWlCP4F+wdmQWWeftsL/0JGcradgEWeJSzp
 QWxvGdPrSOdP1tTXeg1zxynQFa/LfRm4TmZHofWD2iwya+qc8IzJc2B3hZq6Tq0/OBz1
 lEYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CR4I31iRpJNzMeDmL877t0ARvDi8UmH6xTDgLBUKOEU=;
 b=H5Sv6E4rcBkbvGmMc64FFKJ4HSO19NUFRAh7pyxjx4TGnTy1P6wGYKSXKXdy/LC3kQ
 0oSGUND8RDw/rKEiCezWqjyCI1gEj7fI7EzGMBeSHOOHINdVyCINC/fWEGWtHHqD0RbU
 GGdlFW+UhqTquTBNbfJrKyPuoaRcX3PihHb/ii76ZdxoVzPNFDuGzBVwThUZ7jt0Ne9U
 F0xLfVRztHW3S0Qg9da4KzRdy9Qk4dlC2nUqNiGPJuL0Mc2RQLOoX0zHAW+l6948b6mT
 f/38Z/awoI+M4npf/OUU3EuwUroCr196UAKfIh/6bwRWXdL6wcSMKj5esCmaWM4GmXmH
 LeZw==
X-Gm-Message-State: APjAAAVW5VM0gRgMA0j2lKvLoAgLVkdMz17316qB0fG52N3q1cQ0mJTx
 G1aNhhw/FrwDCOUeEjjg9Qg1y4liW7F/nDpcu7YQrA==
X-Google-Smtp-Source: APXvYqwbXxtKhJhPoMfm6hW9bmujkyqa7UqRJRkTixkWhWXjnp1ugr9ACSLRfaX8ICyv+pkIWZG5c6+bqjRTtP+mu6A=
X-Received: by 2002:a67:ee5b:: with SMTP id g27mr15041407vsp.165.1560431662796; 
 Thu, 13 Jun 2019 06:14:22 -0700 (PDT)
MIME-Version: 1.0
References: <1559577325-19266-1-git-send-email-ludovic.Barre@st.com>
 <5b7e1ae5-c97e-5a21-fc3e-7cc328087f04@st.com>
In-Reply-To: <5b7e1ae5-c97e-5a21-fc3e-7cc328087f04@st.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 13 Jun 2019 15:13:46 +0200
Message-ID: <CAPDyKFrULRk=cHzVodU9aa6LDX9ip-VPHNwG7QXhmNZrMpPjGw@mail.gmail.com>
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

On Thu, 13 Jun 2019 at 15:02, Ludovic BARRE <ludovic.barre@st.com> wrote:
>
> hi Ulf
>
> Just a "gentleman ping" about this series.
> I know you are busy, it's just to be sure you do not forget me :-)

Thanks! I started briefly to review, but got distracted again. I will
come to it, but it just seems to take more time than it should, my
apologies.

Br
Uffe

>
> Regards
> Ludo
>
> On 6/3/19 5:55 PM, Ludovic Barre wrote:
> > From: Ludovic Barre <ludovic.barre@st.com>
> >
> > This patch series adds busy detect for stm32 sdmmc variant.
> > Some adaptations are required:
> > -Clear busy status bit if busy_detect_flag and busy_detect_mask are
> >   different.
> > -Add hardware busy timeout with MMCIDATATIMER register.
> >
> > V3:
> > -rebase on latest mmc next
> > -replace re-read by status parameter.
> >
> > V2:
> > -mmci_cmd_irq cleanup in separate patch.
> > -simplify the busy_detect_flag exclude
> > -replace sdmmc specific comment in
> > "mmc: mmci: avoid fake busy polling in mmci_irq"
> > to focus on common behavior
> >
> > Ludovic Barre (3):
> >    mmc: mmci: fix read status for busy detect
> >    mmc: mmci: add hardware busy timeout feature
> >    mmc: mmci: add busy detect for stm32 sdmmc variant
> >
> >   drivers/mmc/host/mmci.c | 49 +++++++++++++++++++++++++++++++++++++++++--------
> >   drivers/mmc/host/mmci.h |  3 +++
> >   2 files changed, 44 insertions(+), 8 deletions(-)
> >
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
