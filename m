Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA998A6538
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Apr 2024 09:37:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 853D8C6B45B;
	Tue, 16 Apr 2024 07:37:20 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5DB5CC69066
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Apr 2024 07:37:19 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-a51a7d4466bso460682766b.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Apr 2024 00:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713253039; x=1713857839;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Vz5EFUG61C/PsBsUPlDK2q+AUqaXZYNi38q3WlwiS3E=;
 b=pGyavPs82h4B2ObxPjoumgAUPhJnHYXir2R2N2CAPmMbayw+lUMt3uBLY1lmSNixt0
 RMGpw95lxhrcTjaLkJrvV4ZQAYNFemKb4OCqg0s2iS3zwryXAgUcmZ59AfamTL+RaPCG
 RH8ZFPkGrZVRJk7ASdxFsrEdf4VyeQa4gdIXUNnojmAaQPtnhfMm+YesA11hjugH5xjd
 FuYzteuEUmBq2CpH6RGxel8pr1/2E6vF0sXj3pBsbZZzIuoa89BqXF1DtMsT2GVKKQEo
 aineQCueBcu5ExTuAj4t7Lnz9wVQVMLYeK1UiDZIpZ3BC4tCnHz+CJRKUoW9oMbYmJ0T
 Z0HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713253039; x=1713857839;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Vz5EFUG61C/PsBsUPlDK2q+AUqaXZYNi38q3WlwiS3E=;
 b=ebPbyFQTGEyNt0zTZx9ppuJV5sAcVdLhxPNCEf05+5pTgyCpnG/MZ+lk0yILwBEojB
 4JliSNOp+yCu/niS/opU5TFdcBBqq0kWW04dbchpotvmcXhZO7LVU8lFTYBWoMw3tTMR
 1BHceFiGFdZI5sHdPlAOZhgMt+lqZybtT8vexq+bIBMEzHYWInY9VxlkRL8BBJVhEhZ0
 OQ7ae6JNW1cxMhsxd5EVgjDLtJXPKYD4MxGghPFggKvh8NGWjV1DNJsQ4bsGRFIPmbSP
 I5FVVWlIzpYjC6IRpt/lAyw0TLRo1tNL2R6m9w+/HZUfKXlEJq3DO9Vdb0e4saiVjhLL
 7rKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX4Db+39pFfo3wbEMSNGUJF1d3b1kGwA9I+x6muF8YBY9HXR8x/n2zNJZJbUg4sc6hW04A6dgWFDzneLzPWyNUi5A0LXYFrtxPfCkgXDMqir5KEw8F6Hl16
X-Gm-Message-State: AOJu0YxWZoLjQ5HcZYyC82gfMu21c3EJs76WLaei8WOq5KAW//0aQY0B
 N6rPRL+W2EEqeFEnsuLE17aBsw6PdMplXiZ946lMWVahqq1r03rgZwE8ixbnnD0=
X-Google-Smtp-Source: AGHT+IF7djK9Gp7QvHWuOZzhp3iyt4a4kh6gE+5Chee7fTPBiXusYHzH5iP8LrBy89Sq7/Zoad7L6g==
X-Received: by 2002:a17:906:3488:b0:a52:e86:ae62 with SMTP id
 g8-20020a170906348800b00a520e86ae62mr7767532ejb.54.1713253038496; 
 Tue, 16 Apr 2024 00:37:18 -0700 (PDT)
Received: from localhost ([102.222.70.76]) by smtp.gmail.com with ESMTPSA id
 gt43-20020a1709072dab00b00a5242ec4573sm4507206ejc.29.2024.04.16.00.37.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Apr 2024 00:37:18 -0700 (PDT)
Date: Tue, 16 Apr 2024 10:37:14 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ricardo Ribalda <ribalda@chromium.org>
Message-ID: <b8a5cc23-240f-4fe9-9b25-b534f618506e@moroto.mountain>
References: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
 <20240415-fix-cocci-v1-7-477afb23728b@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240415-fix-cocci-v1-7-477afb23728b@chromium.org>
Cc: Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Hans Verkuil <hverkuil@xs4all.nl>, linux-tegra@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Pavel Machek <pavel@ucw.cz>, Dmitry Osipenko <digetx@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Sergey Kozlov <serjk@netup.ru>, Samuel Holland <samuel@sholland.org>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>, linux-staging@lists.linux.dev,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Chen-Yu Tsai <wens@csie.org>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, linux-sunxi@lists.linux.dev,
 linux-media@vger.kernel.org, Abylay Ospan <aospan@netup.ru>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-arm-msm@vger.kernel.org,
 Martin Tuma <martin.tuma@digiteqautomotive.com>,
 linux-mediatek@lists.infradead.org,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 linux-kernel@vger.kernel.org,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: Re: [Linux-stm32] [PATCH 07/35] media: staging: sun6i-isp: Remove
	redundant printk
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

On Mon, Apr 15, 2024 at 07:34:24PM +0000, Ricardo Ribalda wrote:
> platform_get_irq() already prints an error for us.
> 
> Found by cocci:
> drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c:389:2-9: line 389 is redundant because platform_get_irq() already prints an error
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c
> index 5c0a45394cba..a6424fe7023b 100644
> --- a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c
> +++ b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c
> @@ -386,7 +386,6 @@ static int sun6i_isp_resources_setup(struct sun6i_isp_device *isp_dev,
>  
>  	irq = platform_get_irq(platform_dev, 0);
>  	if (irq < 0) {
> -		dev_err(dev, "failed to get interrupt\n");
>  		ret = -ENXIO;

This is more fall out from when irq functions used to return zero (16
years ago).  Instead of ret = -ENXIO, set ret = irq.

regards,
dan carpenter
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
