Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2592B252C6C
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Aug 2020 13:29:15 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D8C49C32E90;
	Wed, 26 Aug 2020 11:29:14 +0000 (UTC)
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5CB65C36B26
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Aug 2020 10:01:46 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id v13so986474oiv.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Aug 2020 03:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aU6SzC4HPKAdpsfd1/EKwFJCt0CfheymGe5/PRIykis=;
 b=kLkk6P2rg8BhuVDfo6yGiUK2wsxe4gSq3InBYsZSplXAV7lOxYYp1J3Q5DPL1Atuio
 wzsMCRLELwnf36uijOPxK5cp7rbI3xFBGVt/1xNk5NI1EEpw2+MFPYKkn0DV+bQnL8jS
 gByBV5G13T1sJJOtdkimgb3sWtgAKnqVtVqsjuz/8P0ot8gu3lO55v3Zz1BAI0voo4sC
 BgZLRZ6Zevw4I5LCGST2ULe4UDW0ldYsDc/Vfwdr18TYV92+8x24tYclqB9sPTYDWngS
 viVa9iCihofF9hXA0iHyWvHUPhFmgqY2F+y3lBMzCc0HVroFxSCvo5yUYKJIvlimNnYU
 9Rsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aU6SzC4HPKAdpsfd1/EKwFJCt0CfheymGe5/PRIykis=;
 b=KJX6ZQqLfs8+xKWAgGx4tYEUFheRgPrYr+y3YUky4nfXHN1dvrdjCgc7XU387DEvr5
 5U8tzaqMbw8yOHV5LDSiMAtOqsAvJcRqgJXR1QKgQbESRYRUtEiys8Fio5cCAEH2ryJI
 YBFZXKeOpsvnaylP1doUDCkV4H/iXnoX62FznrAef10+HFwmV2ZhO0LHt69sBSN1ZGF/
 /TBw4y+S14B2ULlACXNX0lElk3cNd3doSWSlrpEyi4vSImCcBWBW8o3KRZooAWrydiE2
 yOCTmanttXO/Ij1Gfplccjzwb5fGjYBAd5tEanoeWbxu0tQ4AAHjUPNx/irj8QR9iPQa
 kCNA==
X-Gm-Message-State: AOAM530t7sRUqdwmF/opHR/E9CLR8TZUVBFRspuEf92I+ShybCBHfkP7
 L3swh7O4OwnvS35ABCkHx0K8Qd2FnOEKnuGhszI=
X-Google-Smtp-Source: ABdhPJxgjAA4fAItoCC7+tMC6PKsZHjoR2FEmj+no0NTVKhbsiNR3TWflTznFRRmW3BfFUjZy+oAel/kSKbg107bAHA=
X-Received: by 2002:aca:304b:: with SMTP id w72mr3257414oiw.117.1598436105035; 
 Wed, 26 Aug 2020 03:01:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200826063850.47625-1-alexandru.ardelean@analog.com>
 <1c32f6b5-deb6-e310-4bc4-a871719cc8f3@st.com>
In-Reply-To: <1c32f6b5-deb6-e310-4bc4-a871719cc8f3@st.com>
From: Alexandru Ardelean <ardeleanalex@gmail.com>
Date: Wed, 26 Aug 2020 13:01:33 +0300
Message-ID: <CA+U=Dspxp4u5BoxwHCKMJBC5HWywX7ULSS=YBfOGzP1zLP=yVA@mail.gmail.com>
To: Fabrice Gasnier <fabrice.gasnier@st.com>
X-Mailman-Approved-At: Wed, 26 Aug 2020 11:29:13 +0000
Cc: linux-iio <linux-iio@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 Sergiu Cuciurean <sergiu.cuciurean@analog.com>,
 linux-arm-kernel@lists.infradead.org,
 Alexandru Ardelean <alexandru.ardelean@analog.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jonathan Cameron <jic23@kernel.org>
Subject: Re: [Linux-stm32] [PATCH] iio: stm32-dac: Replace indio_dev->mlock
	with own device lock
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

On Wed, Aug 26, 2020 at 12:01 PM Fabrice Gasnier <fabrice.gasnier@st.com> wrote:
>
> On 8/26/20 8:38 AM, Alexandru Ardelean wrote:
> > From: Sergiu Cuciurean <sergiu.cuciurean@analog.com>
> >
> > As part of the general cleanup of indio_dev->mlock, this change replaces
> > it with a local lock on the device's state structure.
> >
> > The patch also does a minor whitespace change to align the 'lock' with the
> > 'common' field via tabs.
> >
> > Signed-off-by: Sergiu Cuciurean <sergiu.cuciurean@analog.com>
> > Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>
> > ---
> >  drivers/iio/dac/stm32-dac.c | 14 +++++++++-----
> >  1 file changed, 9 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/iio/dac/stm32-dac.c b/drivers/iio/dac/stm32-dac.c
> > index 092c796fa3d9..fc636812c17e 100644
> > --- a/drivers/iio/dac/stm32-dac.c
> > +++ b/drivers/iio/dac/stm32-dac.c
> > @@ -26,9 +26,11 @@
> >  /**
> >   * struct stm32_dac - private data of DAC driver
> >   * @common:          reference to DAC common data
> > + * @lock:            lock to protect the data buffer during regmap ops
>
> Hi Alexandru,
>
> I think the same patch has been sent by Sergiu already [1].
> Jonathan and I had a minor comment at that time: E.g. could you please
> update the comment ?

Oh.
My bad. I didn't follow the discussion closely.
Will send a V2.

>
> [1] https://lkml.org/lkml/2020/5/18/254
>
> >   */
> >  struct stm32_dac {
> > -     struct stm32_dac_common *common;
> > +     struct stm32_dac_common *common;
>
> Is above change needed?

No.
I can remove it.

Thanks
Alex

>
> Best Regards,
> Fabrice
>
> > +     struct mutex            lock;
> >  };
> >
> >  static int stm32_dac_is_enabled(struct iio_dev *indio_dev, int channel)
> > @@ -58,10 +60,10 @@ static int stm32_dac_set_enable_state(struct iio_dev *indio_dev, int ch,
> >       int ret;
> >
> >       /* already enabled / disabled ? */
> > -     mutex_lock(&indio_dev->mlock);
> > +     mutex_lock(&dac->lock);
> >       ret = stm32_dac_is_enabled(indio_dev, ch);
> >       if (ret < 0 || enable == !!ret) {
> > -             mutex_unlock(&indio_dev->mlock);
> > +             mutex_unlock(&dac->lock);
> >               return ret < 0 ? ret : 0;
> >       }
> >
> > @@ -69,13 +71,13 @@ static int stm32_dac_set_enable_state(struct iio_dev *indio_dev, int ch,
> >               ret = pm_runtime_get_sync(dev);
> >               if (ret < 0) {
> >                       pm_runtime_put_noidle(dev);
> > -                     mutex_unlock(&indio_dev->mlock);
> > +                     mutex_unlock(&dac->lock);
> >                       return ret;
> >               }
> >       }
> >
> >       ret = regmap_update_bits(dac->common->regmap, STM32_DAC_CR, msk, en);
> > -     mutex_unlock(&indio_dev->mlock);
> > +     mutex_unlock(&dac->lock);
> >       if (ret < 0) {
> >               dev_err(&indio_dev->dev, "%s failed\n", en ?
> >                       "Enable" : "Disable");
> > @@ -327,6 +329,8 @@ static int stm32_dac_probe(struct platform_device *pdev)
> >       indio_dev->info = &stm32_dac_iio_info;
> >       indio_dev->modes = INDIO_DIRECT_MODE;
> >
> > +     mutex_init(&dac->lock);
> > +
> >       ret = stm32_dac_chan_of_init(indio_dev);
> >       if (ret < 0)
> >               return ret;
> >
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
