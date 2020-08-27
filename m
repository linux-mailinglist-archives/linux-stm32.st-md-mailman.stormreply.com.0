Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 931BD25414B
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Aug 2020 10:55:52 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1E39AC32EA6;
	Thu, 27 Aug 2020 08:55:52 +0000 (UTC)
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F2F93C36B26
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Aug 2020 08:55:49 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id i11so3800754otr.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Aug 2020 01:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yYRU5RWjdCABcW+SWFbp3Yrowl6dALpg4gGN9PPMym4=;
 b=NU6KxZo/Iocb1DwO8n2E2MmxQxjBz2QmvF6tuBRu/iXnmUOHthNxzm8LmtICLTuW1q
 W7cR9OOP5WiyZFhHBnj9HnPZgnLKBqljoZKc1H7WR2AgHS2gt2i+EI4VamX98hMKz+v4
 MlSIRxfx4Wtwpw5DUksXVn2aKQSE7rjY3AuVpocTsN4WSthyGK3E98tFYBGTaiZIyvHk
 e0s/kC6il6ZhcB3FvfbkGUI2NIEU5LgRiqENR8ShqRGjmnJH3uGl8J5cUA61r/zRms/M
 HXBdTKOY3u+LnMkAnxlOYE28knMiU0xVrl0nt+mtNIF5/rjKCWvpxofnnE4VLDMHeVVT
 6hTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yYRU5RWjdCABcW+SWFbp3Yrowl6dALpg4gGN9PPMym4=;
 b=uIwOIVNX8bk/lD46+6gdi7bc04uOt/JrXjPhsWYX78t2yhY2wSA4/rvmgTsBdKSYdG
 UCkiC0gvmgCuMOOdEIr4RNjfJMJHYOSyS5Sryxu5fu299HSirSeLJ4/KzfzV8uRgA8im
 3UjJLEgWELcF2wQsGouLSgHPUeQhl4Otr23Y2PBMJG2aglK9CZ+KSvys66sFRtdomMDv
 hcMVk3oCop7imHx4+XxQIy0KO6J8M5XMOC8Z7N8pVKNmkwXejrxQwvW/h3bCiNx2BEZe
 flqRVBpzEvuXNlAg1HcFTpbY+cNBBTclB6H2yQAfrQWmrmXZ51R+4dbw0JhZeTY1XMv3
 ztfA==
X-Gm-Message-State: AOAM533+eHv6T811fkv00yx8kAME2CmGzeQb+b9kkRqkrfvpizl1BsBl
 3dn9jdoBuFgStym+FMslmILJw0b/uzs79QdI5mg=
X-Google-Smtp-Source: ABdhPJyYmnPw+UXq5Pnbrb1d8+Ls6OeV0jJ9/BCH19PZH76AENpdIFCNPcG4tB6nf4A3wQ8tAgaLGVlATIaLG7vJeOg=
X-Received: by 2002:a9d:4c04:: with SMTP id l4mr12187928otf.207.1598518548666; 
 Thu, 27 Aug 2020 01:55:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200826063850.47625-1-alexandru.ardelean@analog.com>
 <20200826120042.200364-1-alexandru.ardelean@analog.com>
In-Reply-To: <20200826120042.200364-1-alexandru.ardelean@analog.com>
From: Alexandru Ardelean <ardeleanalex@gmail.com>
Date: Thu, 27 Aug 2020 11:55:37 +0300
Message-ID: <CA+U=DsrMDSTQKEc2_3+W8u4bLraAowVB3nB4huKY--v8gnds2Q@mail.gmail.com>
To: Alexandru Ardelean <alexandru.ardelean@analog.com>
Cc: linux-iio <linux-iio@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 Sergiu Cuciurean <sergiu.cuciurean@analog.com>,
 linux-arm-kernel@lists.infradead.org, Fabrice Gasnier <fabrice.gasnier@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jonathan Cameron <jic23@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v2] iio: stm32-dac: Replace
 indio_dev->mlock with own device lock
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

On Wed, Aug 26, 2020 at 3:03 PM Alexandru Ardelean
<alexandru.ardelean@analog.com> wrote:
>
> From: Sergiu Cuciurean <sergiu.cuciurean@analog.com>
>
> As part of the general cleanup of indio_dev->mlock, this change replaces
> it with a local lock. The lock protects against potential races when
> reading the CR reg and then updating, so that the state of pm_runtime
> is consistent between the two operations.
>
> Signed-off-by: Sergiu Cuciurean <sergiu.cuciurean@analog.com>
> Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>
> ---

Forgot the changelog here.
Apologies.

Changelog v1 -> v2:
* removed whitespace change for 'common' field
* updated comment about the lock usage

>  drivers/iio/dac/stm32-dac.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/iio/dac/stm32-dac.c b/drivers/iio/dac/stm32-dac.c
> index 092c796fa3d9..7a8aed476850 100644
> --- a/drivers/iio/dac/stm32-dac.c
> +++ b/drivers/iio/dac/stm32-dac.c
> @@ -26,9 +26,11 @@
>  /**
>   * struct stm32_dac - private data of DAC driver
>   * @common:            reference to DAC common data
> + * @lock:              lock to protect the data buffer during regmap ops
>   */
>  struct stm32_dac {
>         struct stm32_dac_common *common;
> +       struct mutex            lock;
>  };
>
>  static int stm32_dac_is_enabled(struct iio_dev *indio_dev, int channel)
> @@ -58,10 +60,10 @@ static int stm32_dac_set_enable_state(struct iio_dev *indio_dev, int ch,
>         int ret;
>
>         /* already enabled / disabled ? */
> -       mutex_lock(&indio_dev->mlock);
> +       mutex_lock(&dac->lock);
>         ret = stm32_dac_is_enabled(indio_dev, ch);
>         if (ret < 0 || enable == !!ret) {
> -               mutex_unlock(&indio_dev->mlock);
> +               mutex_unlock(&dac->lock);
>                 return ret < 0 ? ret : 0;
>         }
>
> @@ -69,13 +71,13 @@ static int stm32_dac_set_enable_state(struct iio_dev *indio_dev, int ch,
>                 ret = pm_runtime_get_sync(dev);
>                 if (ret < 0) {
>                         pm_runtime_put_noidle(dev);
> -                       mutex_unlock(&indio_dev->mlock);
> +                       mutex_unlock(&dac->lock);
>                         return ret;
>                 }
>         }
>
>         ret = regmap_update_bits(dac->common->regmap, STM32_DAC_CR, msk, en);
> -       mutex_unlock(&indio_dev->mlock);
> +       mutex_unlock(&dac->lock);
>         if (ret < 0) {
>                 dev_err(&indio_dev->dev, "%s failed\n", en ?
>                         "Enable" : "Disable");
> @@ -327,6 +329,8 @@ static int stm32_dac_probe(struct platform_device *pdev)
>         indio_dev->info = &stm32_dac_iio_info;
>         indio_dev->modes = INDIO_DIRECT_MODE;
>
> +       mutex_init(&dac->lock);
> +
>         ret = stm32_dac_chan_of_init(indio_dev);
>         if (ret < 0)
>                 return ret;
> --
> 2.25.1
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
