Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F40997713ED
	for <lists+linux-stm32@lfdr.de>; Sun,  6 Aug 2023 10:14:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7D6F7C6B456;
	Sun,  6 Aug 2023 08:14:54 +0000 (UTC)
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com
 [209.85.166.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0C213C6B454
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  6 Aug 2023 08:14:52 +0000 (UTC)
Received: by mail-io1-f43.google.com with SMTP id
 ca18e2360f4ac-790976d86a1so142225439f.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 06 Aug 2023 01:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691309692; x=1691914492;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=oslzktuLlQuV/9tgiDlABRFZ0qfHlpBYOi45TJmyGLc=;
 b=NS97xhilq3s4K9gvE596eIPyUH6XJ3jAL2zU2p3wZ+cfKxMAHLImT//P4m38V7sCZ6
 vv8nvf+rZYq0QqByOHrhjyW272TdHCaANT4iNBGeKgr8sqFLbwpW/a/OqPs6auAMF9z3
 79aYzKb4uB0HoSFnNoZR7i3p/3wSL8B+7EHaLHyt6UIfW3DMZDCZBnkBxjJEdqQxVO30
 DGDBRrl5JcoAyL2Ziav5Yt35PlOECglhgQvkXqh2DrnAOhHudNk7xt/RIGdusKsmS7H2
 m0NMWbdEkF6YirHhO74fRJOS819AoQCKOOAe7+bR+nzZHNd6hHDz72GSfWldy+X1wXOC
 c2nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691309692; x=1691914492;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oslzktuLlQuV/9tgiDlABRFZ0qfHlpBYOi45TJmyGLc=;
 b=C1jSSDF5I9hPj8SWLrtx/iYdoG7+r1WtiNBcTcyN1r2kbT+s/jIWFkIbdeaLCxOiMq
 3JNF2rcvHSjVtl3murNSAp8GPDRpsLXqdzAXq2/jQLl5UnJuGBgrFANa8mOsz6Ny0pr1
 lrHqFE+oO7+/MPt9LqERQv8f2xogEt9EkzHDsQYNIQBYIU35m+AMQ0p40gTskRdtqlwt
 GS52Kppw5GlIaJD5TFvUplixk/K9cJ0LsLu60krwajYVjv13ZCwkBDnx29f/lVcJL8vj
 1f7pcE0SWGuRfA5D1b+rYKyKi4T8IE+HcNjxifBn3zmiWVH8bCisHtFKA3oYjjWX9k/O
 kFyw==
X-Gm-Message-State: AOJu0YxW9Ko5wpw9eqbyF0OONXdpoGwArEGq49R5CmgqhaXFZMoEBBhU
 OE5prgnUzNIu7l3WmG8D4rmeaHI1wp0/PmdE0S8=
X-Google-Smtp-Source: AGHT+IHVc2Fooi3YCjJ9SgBa4bKFKhmqzl4AFAaiBQoPiHD7T07vcjs8HA++6tkd7d3k2lgS0UnRj85G1NAGLWHtTl0=
X-Received: by 2002:a05:6602:254a:b0:783:3899:e1d0 with SMTP id
 cg10-20020a056602254a00b007833899e1d0mr7146880iob.6.1691309691790; Sun, 06
 Aug 2023 01:14:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230802133509.29381-1-aboutphysycs@gmail.com>
 <20230805193052.690c87e8@jic23-huawei>
In-Reply-To: <20230805193052.690c87e8@jic23-huawei>
From: Andrei Coardos <aboutphysycs@gmail.com>
Date: Sun, 6 Aug 2023 11:14:40 +0300
Message-ID: <CAMu7dgvt0mmQTkL9t1F_NpEBSew+0fa1aQnn=Aw=6FA9KpP2nw@mail.gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: lars@metafoo.de, linux-iio@vger.kernel.org,
 Alexandru Ardelean <alex@shruggie.ro>, linux-kernel@vger.kernel.org,
 mcoquelin.stm32@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] iio: trigger: stm32-lptimer-trigger:
	remove unneeded platform_set_drvdata()
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

Thank you very much!

On Sat, 5 Aug 2023 at 21:31, Jonathan Cameron <jic23@kernel.org> wrote:
>
> On Wed,  2 Aug 2023 16:35:09 +0300
> Andrei Coardos <aboutphysycs@gmail.com> wrote:
>
> > This function call was found to be unnecessary as there is no equivalent
> > platform_get_drvdata() call to access the private data of the driver. Also,
> > the private data is defined in this driver, so there is no risk of it being
> > accessed outside of this driver file.
> >
> > Reviewed-by: Alexandru Ardelean <alex@shruggie.ro>
> > Signed-off-by: Andrei Coardos <aboutphysycs@gmail.com>
> > ---
> >
> > Changelog V1->V2:
> >
> > * https://lore.kernel.org/linux-iio/CAH3L5QpuoDYU6qvWH7_z5Yx0cW2qPMbCA8AFEYAPsiEkSzCiwQ@mail.gmail.com/T/#t
> > * Adjusted the returning values of the function
> >
> >
> >  drivers/iio/trigger/stm32-lptimer-trigger.c | 6 +-----
> >  1 file changed, 1 insertion(+), 5 deletions(-)
> >
> > diff --git a/drivers/iio/trigger/stm32-lptimer-trigger.c b/drivers/iio/trigger/stm32-lptimer-trigger.c
> > index df2416e33375..ab1cc6a05f26 100644
> > --- a/drivers/iio/trigger/stm32-lptimer-trigger.c
> > +++ b/drivers/iio/trigger/stm32-lptimer-trigger.c
> > @@ -88,11 +88,7 @@ static int stm32_lptim_trigger_probe(struct platform_device *pdev)
> >       priv->dev = &pdev->dev;
> >       priv->trg = stm32_lptim_triggers[index];
> >
> > -     ret = stm32_lptim_setup_trig(priv);
> > -     if (ret)
> > -             return ret;
> > -
> > -     return 0;
> > +     return stm32_lptim_setup_trig(priv);
> Both of us failed to notice ret isn't used any more.  Anyhow, I cleaned that
> up after spotting the build warning.
>
> Jonathan
>
> >  }
> >
> >  static const struct of_device_id stm32_lptim_trig_of_match[] = {
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
