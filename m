Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 635D08A6559
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Apr 2024 09:44:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 18D4EC6B45B;
	Tue, 16 Apr 2024 07:44:30 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0FA55C69066
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Apr 2024 07:44:28 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-56fd7df9ea9so4703026a12.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Apr 2024 00:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713253468; x=1713858268;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=AkbPRxuJaFbf8hemSHK1ZWQRF0fsDq8QRKmW1NagRfM=;
 b=apPu7kvGiY048GkbqW1DKpfpKyBW+YH6+LgnVhZ35+23fu5dg3g9dcGpbM0imFfPbM
 hKUsE1EDBRQj8z2e5cf0/jRS1AeVCpOf97KlEegxUaVmiGyHAy4Q4P1BupO3OSmNkBBO
 W8ImRUdaY8b6WIvZBiy/c7EonVLHsd8ISxw0ZOsYlEglnuaKxr+uSW2YseuV4dotYTa9
 3WUH+ZVF/n0/BSzbszT/c2YalYGAmuwB4EpuB7AoaM40/U9AjNpPh40YZTaNp4Gc0uWx
 84s/KdjCh9yBIRMq1/FF/0NEtxNT4TCyPH379kXRFygOUSKUEoafaV28sWkXhR10K9Pd
 EiJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713253468; x=1713858268;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AkbPRxuJaFbf8hemSHK1ZWQRF0fsDq8QRKmW1NagRfM=;
 b=xBOvhB2KaMWoNgGx9Lw1za4IPHBxzjLDTjbY/gMS6FfxqFfSmU9O37iyvfvU6F6jhA
 Y06+VXOYrJOyz9tm/B1vCcYk7LD2Zb1A4dpTXbUU4nH//kS1P8y7qvZvhHS/a3HGSQ99
 TrwRGM4kLJKgJ+l7jJV0M0CycHqlQVynqni69ti+nASyYYbrJ9mtYHlZir/rgog3M84B
 5OVwRsIftIpsTiMTHgLRaEJ3VovUG9RH5KTPJ5dXS0bIL9HwL9I88H6y7pKzkZvytIw5
 T9yRbjSiC/UiJyYtka7zGkEVFajERSPkwRCpgwwySRPR/CvN98wyzzh0wFqqAwvaAIwi
 Cr3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVC8k5h0TpaVZcBcAwR2LUfHM+1HHIXkmRa/lsE+MVbuU+IlrAiZkvAe52gwIjDcieI0VxfY7Vrg6X1vfM0PshgMzWDRcEqarsVYDK7R+xHEe1hmIKPdjzV
X-Gm-Message-State: AOJu0YwI+cibPXkzeYsk4Ji003KoFRqZA9tzTrjXncV1jfzPbwpAjfYv
 3fEsaTZ+RJdihqhZs9/DJMcD+O8qhGNFeoPvYD8li+EQK/s3mO2RdSsZxPic0Ew=
X-Google-Smtp-Source: AGHT+IHyv6GyLcCM7SuFRY2lQ0w+D3nRQ0Oogv+NgpwSUUhg8+w7A2aBnM/9CzYE2fZ/BNYLgCzdrg==
X-Received: by 2002:a50:8d0b:0:b0:570:38a:57ea with SMTP id
 s11-20020a508d0b000000b00570038a57eamr6318788eds.33.1713253468256; 
 Tue, 16 Apr 2024 00:44:28 -0700 (PDT)
Received: from localhost ([102.222.70.76]) by smtp.gmail.com with ESMTPSA id
 fk27-20020a056402399b00b0056e78e90a1dsm5799411edb.49.2024.04.16.00.44.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Apr 2024 00:44:28 -0700 (PDT)
Date: Tue, 16 Apr 2024 10:44:23 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ricardo Ribalda <ribalda@chromium.org>
Message-ID: <a1917f15-ba04-4d8b-8dd6-0c1bc9a498ca@moroto.mountain>
References: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
 <20240415-fix-cocci-v1-9-477afb23728b@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240415-fix-cocci-v1-9-477afb23728b@chromium.org>
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
Subject: Re: [Linux-stm32] [PATCH 09/35] media: v4l: async: refactor
 v4l2_async_create_ancillary_links
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

On Mon, Apr 15, 2024 at 07:34:26PM +0000, Ricardo Ribalda wrote:
> Return 0 without checking IS_ERR or PTR_ERR if CONFIG_MEDIA_CONTROLLER
> is not enabled.
> 
> This makes cocci happier:
> 
> drivers/media/v4l2-core/v4l2-async.c:331:23-30: ERROR: PTR_ERR applied after initialization to constant on line 319
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/v4l2-core/v4l2-async.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
> index 4bb073587817..e26a011c89c4 100644
> --- a/drivers/media/v4l2-core/v4l2-async.c
> +++ b/drivers/media/v4l2-core/v4l2-async.c
> @@ -316,9 +316,8 @@ v4l2_async_nf_try_all_subdevs(struct v4l2_async_notifier *notifier);
>  static int v4l2_async_create_ancillary_links(struct v4l2_async_notifier *n,
>  					     struct v4l2_subdev *sd)
>  {
> -	struct media_link *link = NULL;
> -
>  #if IS_ENABLED(CONFIG_MEDIA_CONTROLLER)
> +	struct media_link *link;
>  

I think another way you could write this is to remove the #ifs...

	struct media_link *link;

	if (!IS_ENABLED(CONFIG_MEDIA_CONTROLLER))
		return 0;

	if (sd->entity.function != MEDIA_ENT_F_LENS && ...

regards,
dan carpenter

>  	if (sd->entity.function != MEDIA_ENT_F_LENS &&
>  	    sd->entity.function != MEDIA_ENT_F_FLASH)
> @@ -326,9 +325,10 @@ static int v4l2_async_create_ancillary_links(struct v4l2_async_notifier *n,
>  
>  	link = media_create_ancillary_link(&n->sd->entity, &sd->entity);
>  
> -#endif
> -
>  	return IS_ERR(link) ? PTR_ERR(link) : 0;
> +#else
> +	return 0;
> +#endif
>  }
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
