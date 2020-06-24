Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D12206E2C
	for <lists+linux-stm32@lfdr.de>; Wed, 24 Jun 2020 09:49:11 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A9188C36B0C;
	Wed, 24 Jun 2020 07:49:11 +0000 (UTC)
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
 [209.85.166.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B4B6BC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Jun 2020 07:49:10 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id k23so1098862iom.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Jun 2020 00:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IMLtUyyLaeGE1Rn+RkOTJ2DJsfDwk7l2d3YRRlgm31o=;
 b=GMOEE2Aka1QlX9FIQVJl66QctjiCb0XiJacypZj3tcoGy1G9k9XfYETKKmM1a/oj7o
 xdGpc2tIhuF+bDtUMn9f8Yw/dFmzQ/YFNp3xIurzF3JwwJ0qdhGdgf0H8hOW+DPyzg6K
 7fRNcnLdA5L730dHt0w4xejiidfHS++GxJqx3O1eirdtCZMUXTslm8ddsiHsBiy9deA+
 1gkReav+ZWgFcvQ1bgt3sWUxdR7vjndM71DYbx3YZ+QZj2SADIGwsRmegJNuOHhOsgCg
 aCGoSXZmXE8nsKCgozBPX9phPtcxkDDPjN1vkX+Xsg0uKkEtZfWCmoNv1oHhLayoZkOl
 VfUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IMLtUyyLaeGE1Rn+RkOTJ2DJsfDwk7l2d3YRRlgm31o=;
 b=Q3mBalhrajqgejNNYVHi7A4paHIOhmVw+AwYXlCySy/SrT6Z+KzVoQWtOME3wod97i
 TdnK+zLLrhGOrDIFddCWeY22Y58EyFTR8x17kVFdNUe9yvwKlTc3Z8Cy0Bn+Rt7funsp
 cwgS9CNt5naC28aYXvqsUdOCLmCnKuuiAMIftv/4dUXWAAGSl/1+M25lY7dDBPRxSCze
 C0oZzyNeQlUmycwpuFPH92QJSNRjp4rupTWR7lGUBz/XboDFXk/DmotXzvXmyi7xQB6y
 5p6jwFVNislPaJjknVU2WDspCuY7V/TJn2UvssezF/iT9yWOZGhJwbjTxeGk/vdMZ1l+
 AGSA==
X-Gm-Message-State: AOAM531u9y8M+IFdSK23Clvmrk4ysRDm7xbYZ4LeveAn6aVsE7Pk5yF/
 6NdNfb1Ma3+78HpfXGpb4XsHuzoZx3A7xrtLmiY=
X-Google-Smtp-Source: ABdhPJxbMiUffQwZWQ2UYDzKfRDx3+8H0TxEgs2Hi4DaFt/LCSVVqMasK98uer8zv/ZRuV7r2kzL7kWtnNEiZIzxaCs=
X-Received: by 2002:a5e:8d15:: with SMTP id m21mr4447306ioj.60.1592984949433; 
 Wed, 24 Jun 2020 00:49:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200603183410.76764-1-navid.emamdoost@gmail.com>
 <20200624073932.GO2324254@vkoul-mobl>
In-Reply-To: <20200624073932.GO2324254@vkoul-mobl>
From: Navid Emamdoost <navid.emamdoost@gmail.com>
Date: Wed, 24 Jun 2020 02:48:58 -0500
Message-ID: <CAEkB2EQ6AquKCexaaauHcsQXP4Y5hsri5FqehKqiw7deex5kQw@mail.gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Qiushi Wu <wu000273@umn.edu>, Kangjie Lu <kjlu@umn.edu>,
 LKML <linux-kernel@vger.kernel.org>, Navid Emamdoost <emamd001@umn.edu>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Stephen McCamant <smccaman@umn.edu>, dmaengine@vger.kernel.org,
 Dan Williams <dan.j.williams@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] engine: stm32-dma: call pm_runtime_put if
 pm_runtime_get_sync fails
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

Hi,

On Wed, Jun 24, 2020 at 2:39 AM Vinod Koul <vkoul@kernel.org> wrote:
>
> On 03-06-20, 13:34, Navid Emamdoost wrote:
> > Calling pm_runtime_get_sync increments the counter even in case of
> > failure, causing incorrect ref count. Call pm_runtime_put if
> > pm_runtime_get_sync fails.
>
> pls fix subsystem name as dmaengine: ...
> >
> > Signed-off-by: Navid Emamdoost <navid.emamdoost@gmail.com>
> > ---
> >  drivers/dma/stm32-dma.c | 8 ++++++--
> >  1 file changed, 6 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/dma/stm32-dma.c b/drivers/dma/stm32-dma.c
> > index 0ddbaa4b4f0b..0aab86bd97fe 100644
> > --- a/drivers/dma/stm32-dma.c
> > +++ b/drivers/dma/stm32-dma.c
> > @@ -1169,8 +1169,10 @@ static int stm32_dma_alloc_chan_resources(struct dma_chan *c)
> >       chan->config_init = false;
> >
> >       ret = pm_runtime_get_sync(dmadev->ddev.dev);
> > -     if (ret < 0)
> > +     if (ret < 0) {
> > +             pm_runtime_put(dmadev->ddev.dev);
> >               return ret;
> > +     }
> >
> >       ret = stm32_dma_disable_chan(chan);
> >       if (ret < 0)
> > @@ -1439,8 +1441,10 @@ static int stm32_dma_suspend(struct device *dev)
> >       int id, ret, scr;
> >
> >       ret = pm_runtime_get_sync(dev);
> > -     if (ret < 0)
> > +     if (ret < 0) {
> > +             pm_runtime_put_sync(dev);
>
> why put_sync()

My bad! I will fix it.

> >               return ret;
> > +     }
> >
> >       for (id = 0; id < STM32_DMA_MAX_CHANNELS; id++) {
> >               scr = stm32_dma_read(dmadev, STM32_DMA_SCR(id));
> > --
> > 2.17.1
>
> --
> ~Vinod



-- 
Navid.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
