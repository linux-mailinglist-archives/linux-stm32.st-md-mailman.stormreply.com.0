Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DECF44DB92
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Nov 2021 19:25:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1AE0BC5EC71;
	Thu, 11 Nov 2021 18:25:26 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7AF27C5A4FD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Nov 2021 18:25:24 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id z10so1173598edc.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Nov 2021 10:25:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=txXLZF+9GfwagVnL9c9/R4fXHlgcGjXwIQ9SEznOgw0=;
 b=DsB69FvhZeAIbA18E5lHyHhIB+6y0QEHISA/MG0eDH6ZxBcMLGUWVQ73YJDeYYAuHw
 e6V86fgWC1PkbhMVTYclUPfSFPLWwo492vk1iDlCsBGyKY/2zadSes9BDcjIiMh/01rd
 LPCk0ucKKmeu6HPFTyXRbZ9bD/1Be5x3+UyrvsuuAv+XlPY+sXKphDeW2InKsrnoHSqe
 XgUh6JVC7DlIInCuCaKz0thozytIvWre7vRcqx25k4CO7zYNJR7ZjncGFTzqMMPWHlEu
 JQBbd/cULS7+E+9oGsIMEUZw5VX4IeNRzDW9pJqmZgopfUrOgBy6giZ0dNaaCDDd5gG5
 MGug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=txXLZF+9GfwagVnL9c9/R4fXHlgcGjXwIQ9SEznOgw0=;
 b=ZPWbsu1A/+ul0X/oJhHkof4pIE0a4lm0rNP6oqQvhXcw9FkXCWCvV0Dgn2/H3vjFD8
 Tkj2suW7d7HLB9zC8J9JndgNlJGKofp5cPZXY6CS/fvb9bfuVIPn9/E9sp04+pWn/enP
 tN6gpIh85xKEHQycxsX/Ja89AglRfjuPxftYZfM5jvhEvVqxQiNY2jQ9BTSRAdKcpsGj
 vW0u0hPTuPAjpftt2g60Mx2bF/Ku/yyYFaNDt22TpXoWrHoCBDvfNS53gIe08DWGu1zG
 ZSFp3eeSM6fo4KNmIyaRSFyjXgZTkOv+Uxk977Ib+BWFmz4fVODHb3zAIFKTLHkl+KyK
 khiw==
X-Gm-Message-State: AOAM533l8q3JXNpcLmUCy+0n/iKTA/RCiTi7GXLqsJnPF+l/OxslrjPB
 cjHCqvtJf/KridJVWkZmUns/yoP9n8nwbTb+MS3Snw==
X-Google-Smtp-Source: ABdhPJxFE9orYhB3+TLnpd1AnZFajEuUTnGFTtb8ntq5zjW336ZzFGuMzgIOFqm93IGf+xvcyleIp9lOGq1fKGp/DkU=
X-Received: by 2002:a05:6402:280d:: with SMTP id
 h13mr12768202ede.346.1636655124051; 
 Thu, 11 Nov 2021 10:25:24 -0800 (PST)
MIME-Version: 1.0
References: <a4b8454f560b70cedf0e4d06275787f08d576ee5.1635964610.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <a4b8454f560b70cedf0e4d06275787f08d576ee5.1635964610.git.christophe.jaillet@wanadoo.fr>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Thu, 11 Nov 2021 11:25:12 -0700
Message-ID: <CANLsYkxQu1Prfg64qqWF7fRMp_rVXoL6PG1trWaX8bSNnaiY4g@mail.gmail.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Suzuki.Poulose@arm.com, alexander.shishkin@linux.intel.com,
 coresight@lists.linaro.org, kernel-janitors@vger.kernel.org,
 alexandre.torgue@foss.st.com, linux-kernel@vger.kernel.org,
 mcoquelin.stm32@gmail.com, leo.yan@linaro.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 mike.leach@linaro.org
Subject: Re: [Linux-stm32] [PATCH v2] coresight: Use devm_bitmap_zalloc when
	applicable
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

Hi Christophe,

On Wed, 3 Nov 2021 at 12:39, Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> 'drvdata->chs.guaranteed' is a bitmap. So use 'devm_bitmap_kzalloc()' to
> simplify code, improve the semantic and avoid some open-coded arithmetic
> in allocator arguments.
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> v1 --> v2: remove the 'guaranteed' variable to be even less verbose
> ---
>  drivers/hwtracing/coresight/coresight-stm.c | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/hwtracing/coresight/coresight-stm.c b/drivers/hwtracing/coresight/coresight-stm.c
> index 58062a5a8238..bb14a3a8a921 100644
> --- a/drivers/hwtracing/coresight/coresight-stm.c
> +++ b/drivers/hwtracing/coresight/coresight-stm.c
> @@ -856,13 +856,11 @@ static int stm_probe(struct amba_device *adev, const struct amba_id *id)
>  {
>         int ret;
>         void __iomem *base;
> -       unsigned long *guaranteed;
>         struct device *dev = &adev->dev;
>         struct coresight_platform_data *pdata = NULL;
>         struct stm_drvdata *drvdata;
>         struct resource *res = &adev->res;
>         struct resource ch_res;
> -       size_t bitmap_size;
>         struct coresight_desc desc = { 0 };
>
>         desc.name = coresight_alloc_device_name(&stm_devs, dev);
> @@ -904,12 +902,10 @@ static int stm_probe(struct amba_device *adev, const struct amba_id *id)
>         else
>                 drvdata->numsp = stm_num_stimulus_port(drvdata);
>
> -       bitmap_size = BITS_TO_LONGS(drvdata->numsp) * sizeof(long);
> -
> -       guaranteed = devm_kzalloc(dev, bitmap_size, GFP_KERNEL);
> -       if (!guaranteed)
> +       drvdata->chs.guaranteed = devm_bitmap_zalloc(dev, drvdata->numsp,
> +                                                    GFP_KERNEL);
> +       if (!drvdata->chs.guaranteed)
>                 return -ENOMEM;
> -       drvdata->chs.guaranteed = guaranteed;

I will pick up this patch when -rc1 gets released.

Thanks,
Mathieu

>
>         spin_lock_init(&drvdata->spinlock);
>
> --
> 2.30.2
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
