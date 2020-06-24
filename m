Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 79CDF206E5F
	for <lists+linux-stm32@lfdr.de>; Wed, 24 Jun 2020 09:57:05 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2902FC36B0C;
	Wed, 24 Jun 2020 07:57:05 +0000 (UTC)
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
 [209.85.166.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 232A0C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Jun 2020 07:57:03 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id h4so1141636ior.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Jun 2020 00:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xwsl5Y0blEJP4hTqwqLpH/L66f7CdWeL56/kOIm2dJo=;
 b=O6y+cPs/buepS39s0exMrI3koN/Sen7jwoqQPnmuMWk/wBsZ+cLRFVwOm3nxSCGGJP
 M/fRROA3unTVnVtgq6bgytS8qJ1POHYJ3aWedi/q/8FNB9G/n3n3/oISsY2AJSPKlp+n
 3JDgvM7zQcVccKXGTCrNJ6h+nMPziCzKzm6K/AaLPjmyQf83MOgedijrw+o/nAim1wgy
 rBTWrtxDQ9/lOuKGCMXSyHOmR6VhLTD20F8lp4fRyDaRMRbPQCFa0E44A/zXX5IpiJ0Y
 xlf9nPT4CZgcC6UglwQ3mRBhdSdqM9pclA/K4UnJFFRQOX1W2cSNXuUw03d9zgwYjzYw
 wVuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xwsl5Y0blEJP4hTqwqLpH/L66f7CdWeL56/kOIm2dJo=;
 b=NoU3AGncsuPG9VSTkR1K6nNcfu8Sy8i+d4Bl6rKQ1ljXvZRDOizDCdc+tf2R1TWoSo
 4zDxnd1THuu6eRaOLqO8DpSDfQ0U1Yo/d9BwAcBQI4akMlsYqfImhXkomOilN0Q/EIRo
 7nMXemsEvWvftDQdtSVT9yhhK7kW9U9pxP00kFluUgidGIseGRtR2HpU7IwCaDSry27e
 COOKVPzKsgPZPADvGWqpT5U0GVdbCHaxdPX7nynfuUbL5HyLtYQB+Fvvv582i0sU5Vhw
 N2FXkDK8zlDcbPRe92kevoL7XC2wI3o74RqSiaXALrzgpX4TIbQvzReCYzSTRa5wtfJ5
 b0xg==
X-Gm-Message-State: AOAM530Is98nreDOikHaJXmiDdZnlkNyoLZVG2f/vYoS5dlMmMj9j9WE
 VKV4/4T5HKNB6cAMeOAZsLj+oZ0o6rIAsbEYqgQ=
X-Google-Smtp-Source: ABdhPJyFJAP4+TaXCF2Tt+Wk3tGrJYPg7JNM1+dgJ26YdHRQBoShmqhUXw3+uFALNZOy1RB4yAS6Jsq3KbHg3t1PB14=
X-Received: by 2002:a05:6602:2d95:: with SMTP id
 k21mr30336056iow.59.1592985421897; 
 Wed, 24 Jun 2020 00:57:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200603193648.19190-1-navid.emamdoost@gmail.com>
 <20200624074015.GP2324254@vkoul-mobl>
In-Reply-To: <20200624074015.GP2324254@vkoul-mobl>
From: Navid Emamdoost <navid.emamdoost@gmail.com>
Date: Wed, 24 Jun 2020 02:56:51 -0500
Message-ID: <CAEkB2ERfzxwkixX75CzCMeRRv51v-fM2zo2gpQrjtgaBZ_nNHQ@mail.gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Qiushi Wu <wu000273@umn.edu>, Kangjie Lu <kjlu@umn.edu>,
 LKML <linux-kernel@vger.kernel.org>, Navid Emamdoost <emamd001@umn.edu>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Stephen McCamant <smccaman@umn.edu>, dmaengine@vger.kernel.org,
 Dan Williams <dan.j.williams@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] dmaengine: stm32-dmamux: fix
	pm_runtime_get_sync fialure cases
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

On Wed, Jun 24, 2020 at 2:40 AM Vinod Koul <vkoul@kernel.org> wrote:
>
> On 03-06-20, 14:36, Navid Emamdoost wrote:
>
> s/fialure/failure
>
> > Calling pm_runtime_get_sync increments the counter even in case of
> > failure, causing incorrect ref count. Call pm_runtime_put_sync if
> > pm_runtime_get_sync fails.
> >
> > Signed-off-by: Navid Emamdoost <navid.emamdoost@gmail.com>
> > ---
> >  drivers/dma/stm32-dmamux.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/dma/stm32-dmamux.c b/drivers/dma/stm32-dmamux.c
> > index 12f7637e13a1..ab250d7eed29 100644
> > --- a/drivers/dma/stm32-dmamux.c
> > +++ b/drivers/dma/stm32-dmamux.c
> > @@ -140,6 +140,7 @@ static void *stm32_dmamux_route_allocate(struct of_phandle_args *dma_spec,
> >       ret = pm_runtime_get_sync(&pdev->dev);
> >       if (ret < 0) {
> >               spin_unlock_irqrestore(&dmamux->lock, flags);
> > +             pm_runtime_put_sync(&pdev->dev);
>
> why put_sync()
>
> >               goto error;
> >       }
> >       spin_unlock_irqrestore(&dmamux->lock, flags);
> > @@ -340,8 +341,10 @@ static int stm32_dmamux_suspend(struct device *dev)
> >       int i, ret;
> >
> >       ret = pm_runtime_get_sync(dev);
> > -     if (ret < 0)
> > +     if (ret < 0) {
> > +             pm_runtime_put_sync(dev);
>
> here too

Is put_noidle() better?

>
> >               return ret;
> > +     }
> >
> >       for (i = 0; i < stm32_dmamux->dma_requests; i++)
> >               stm32_dmamux->ccr[i] = stm32_dmamux_read(stm32_dmamux->iomem,
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
