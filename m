Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A7DDF12F21
	for <lists+linux-stm32@lfdr.de>; Fri,  3 May 2019 15:29:54 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 65B3FC57830
	for <lists+linux-stm32@lfdr.de>; Fri,  3 May 2019 13:29:54 +0000 (UTC)
Received: from mail-vs1-f65.google.com (mail-vs1-f65.google.com
 [209.85.217.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 85FC9C5782F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  3 May 2019 13:29:52 +0000 (UTC)
Received: by mail-vs1-f65.google.com with SMTP id e207so3570084vsd.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 03 May 2019 06:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GEzlUuM/Jwfv3VSJhIT2L6SyOU5GgzPaBEeFYcaGzrM=;
 b=O7rIyByj0jiAE4VnV24ZNn4Y1ylqkbfa1D8NaLihBPvQ6hc0TJ2Yiy69ux3icHlntZ
 OCoH1ySYRhckrmy+z0+u6WAjbTpS0gkWASmQrpvYQgV/WpkxcJajl0m0eEXXnR6El4qO
 zp9xSCHg2saZNiLmfNcuKvOI+3RH2fSU/GIakpBrVvCM90SOEC5Uu3Atgw7fatqZKTz+
 TbcUVhgAnKl+cp2XqrMVvd24D00wH5XOCIw/MaSWcFvEHbdiaDUmvIzmeVFLqFXhD5jm
 hNpu+BGi6tZULhQWflurRJiLW6GXpCEhr9PuyqeHVKcpiM0CCsFcKfvBSN1tTnWLtZgo
 2nFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GEzlUuM/Jwfv3VSJhIT2L6SyOU5GgzPaBEeFYcaGzrM=;
 b=fgLIHkmKUMDA14BOsreFas/QEeXCWyz9SSERabYKM9PC6TDP6vRXatRb6YfSVcyCQ5
 AZ7J8tkLMCw1mF8fNt6pgYEhBvFlbSGrC7FMpJNCQPsfB0ny3DH5g2aoipg4PwU4mKHh
 DAeBY6rWE0yOm8raEOr9/ZVef7F2Ja924S0Xyd1TdtBbwdvux7UGr2Z0414Gacoyx/WK
 gteUujKU/W93vp4xVVnUMQSbzdgni6m8qK8gtwidzMLFw9kkC9069ePqIMGzXDgyjQT5
 8Ce9reA2TJJaDQed55bpOAADFpI3RpbBJk5cBeUTPIXmt9WxAr3KaRQ1loMcgRKag7ZL
 mvhA==
X-Gm-Message-State: APjAAAWgkYT6YOLXQnvCkaUxl2//5gKdgwxSfsztIAR/YyiLt5C8ERXU
 UPtfXr6kZqORXo3JUxVXc10MlOLlAmropVJIfi8mOw==
X-Google-Smtp-Source: APXvYqy046Z/3iX9LlO9h/cYF4oWBVlij//f74AP7T9sKj+fNTyl+4O4+eLgNyusHCiXL4EPY2iMVAE5FFUMIfSAp/E=
X-Received: by 2002:a67:b44d:: with SMTP id c13mr5650144vsm.165.1556890191428; 
 Fri, 03 May 2019 06:29:51 -0700 (PDT)
MIME-Version: 1.0
References: <1556264798-18540-1-git-send-email-ludovic.Barre@st.com>
 <CAPDyKFqbn=UcbwoH_z+yjrjvHQZaMtmsD=n0yrBV7DAK5VRJEQ@mail.gmail.com>
 <74b91eb4-e5a3-38b2-f732-29cdd058eb6a@st.com>
In-Reply-To: <74b91eb4-e5a3-38b2-f732-29cdd058eb6a@st.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 3 May 2019 15:29:15 +0200
Message-ID: <CAPDyKFoURwnai1hbCbO+Uh6+hc7A4dYHjWkqeFAEgMQET-BzwA@mail.gmail.com>
To: Ludovic BARRE <ludovic.barre@st.com>
Cc: DTML <devicetree@vger.kernel.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH V2 0/5] mmc: mmci: add busy detect for
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

On Tue, 30 Apr 2019 at 14:06, Ludovic BARRE <ludovic.barre@st.com> wrote:
>
>
>
> On 4/30/19 1:13 PM, Ulf Hansson wrote:
> > On Fri, 26 Apr 2019 at 09:46, Ludovic Barre <ludovic.Barre@st.com> wrote:
> >>
> >> From: Ludovic Barre <ludovic.barre@st.com>
> >>
> >> This patch series adds busy detect for stm32 sdmmc variant.
> >> Some adaptations are required:
> >> -Avoid to check and poll busy status when is not expected.
> >> -Clear busy status bit if busy_detect_flag and busy_detect_mask are
> >>   different.
> >> -Add hardware busy timeout with MMCIDATATIMER register.
> >>
> >> V2:
> >> -mmci_cmd_irq cleanup in separate patch.
> >> -simplify the busy_detect_flag exclude
> >> -replace sdmmc specific comment in
> >> "mmc: mmci: avoid fake busy polling in mmci_irq"
> >> to focus on common behavior
> >>
> >> Ludovic Barre (5):
> >>    mmc: mmci: cleanup mmci_cmd_irq for busy detect feature
> >>    mmc: mmci: avoid fake busy polling in mmci_irq
> >>    mmc: mmci: fix clear of busy detect status
> >>    mmc: mmci: add hardware busy timeout feature
> >>    mmc: mmci: add busy detect for stm32 sdmmc variant
> >>
> >>   drivers/mmc/host/mmci.c | 61 ++++++++++++++++++++++++++++++++++++++-----------
> >>   drivers/mmc/host/mmci.h |  3 +++
> >>   2 files changed, 51 insertions(+), 13 deletions(-)
> >>
> >> --
> >> 2.7.4
> >>
> >
> > Ludovic, just wanted to let you know that I am reviewing and testing
> > this series.
> >
> > However, while running some tests on Ux500 for validating the busy
> > detection code, even without your series applied, I encounter some odd
> > behaviors. I am looking into the problem to understand better and will
> > let you know as soon as I have some more data to share.
>
> Oops, don't hesitate to share your status, if I could help.

Thanks! Good and bad news here, then.

I now understand what is going on - and there is certainly room for
improvements here, but more importantly the actual mmci busy detection
works as expected.

When it comes to improvements, the main issue I have found is how we
treat DATA WRITES. In many cases we simply don't use the HW busy
detection at all, but instead rely on the mmc core to send CMD13 in a
loop to poll. Well, then if the polling would have consisted of a
couple of CMD13s that wouldn't be an issue, but my observations is
rather that the numbers of CMD13 sent to poll is in the range or
hundreds/thousands - per each WRITE request!

I am going to send a patch (or two) that improves the behavior. It
might even involve changing parts in core layer, not sure how the end
result will look like yet.

In any case, I have applied patch 1 and patch2 for next, as the tests
turned out well at my side. I also took the liberty of updating some
of the comments/changelogs, please have look and tell if there is
something you want to change.

I will continue with the rest of series next week.

Kind regards
Uffe
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
