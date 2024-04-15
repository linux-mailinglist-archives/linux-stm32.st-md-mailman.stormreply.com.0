Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EBBFD8A5C53
	for <lists+linux-stm32@lfdr.de>; Mon, 15 Apr 2024 22:43:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 70AFBC6B444;
	Mon, 15 Apr 2024 20:43:59 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1D410C69066
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Apr 2024 20:43:58 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-2da888330b1so20596271fa.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Apr 2024 13:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713213837; x=1713818637;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Vh4G/AjMszS/t0HRqrjwJOahq/7qZsmwbbcrIjf8WJY=;
 b=dtCm8mBX8KbSb2IakjCDA3ZYShVHWROFJehLNtzhHdwUNrxCZu2xKbxouECGmGnUWO
 52Uei3J558dXK9Mx9zLXpfuXbSjK5h8ytPgyffYKWEh5A21EVQBeZoU28dfShZl/Arbu
 vojg17bRWDiG+nIULhBKXPsm80mXC0t4zNEWHU4F8qYaw5PFHJWIerw1WKy7exQXiRi/
 VjRoaP0j7MqGdyn7EqVIxwUPCOgU3KkJ4UUCVtIjwinuWqv2ZFAZ+AEFChRLkhZK+kWd
 bMTgJBojTIxjykgPh4oQaWqT9t8jurgvJcNasg/r0EHY+jJcLZXR5h74DbtSJAuVvkgc
 Vf3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713213837; x=1713818637;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Vh4G/AjMszS/t0HRqrjwJOahq/7qZsmwbbcrIjf8WJY=;
 b=i3TWDK50KEKGwGdFGDad9WfQUG6j1G8xHidGXiYNad4SMf/S5FP1DGZJeggAbRbIBZ
 Oec5zJnobmoPFwCLHOVyjYRwqQ7XRGQqpjMD896UJEGVFEQp9RZv0gnDjRgxj4dVOZZs
 YQ7z+VImDIzfdMTWA4M/B74CXTOy4kAkO4UjZSTeXtF+ub5J1qspxPRYFoUfPUQsRTyR
 x0QxCYbBjP1zKsraPokr+SA5mrFxWKF3AqFKGP73r4tJ/s/3KxCDZC/Ehh3seZRbAtFq
 CbX6P+0m6bpCuecLWcX7lGOFDaSAOhIjNRuizwCukPfAEhjrCVrROHwrwfv6S+co/G77
 /Z+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKDzDWpq3n7FtFejZ9eYWvP/aW0AKW9Zgt+PCQGZVooGJy+PoLYWobj6bubJf6h7gDi3lJ6O23C5fpXTUu0i4103igi4Kjqv7SD41kgdBiUgergQQT6YlF
X-Gm-Message-State: AOJu0Yx3knylhF6SDgLrciReYZ8uQ8o6/j/HZo3GHCJ2nmaa/KwedEdh
 tUx7oBex0aJhNPEbJMoH/r6cKPis7th5T8XijWA1mCfTVh5fEN8c
X-Google-Smtp-Source: AGHT+IHuk+bIjnHF/M32DBBym4XM02bSBQeXa2Xi9niRXZxUmLjNJbCmeAfQcyqxYAWLBytnQmudbw==
X-Received: by 2002:a2e:bc09:0:b0:2d8:97f:451e with SMTP id
 b9-20020a2ebc09000000b002d8097f451emr8116687ljf.37.1713213836997; 
 Mon, 15 Apr 2024 13:43:56 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net.
 [86.58.6.171]) by smtp.gmail.com with ESMTPSA id
 i11-20020a5d630b000000b0034659d971a6sm12976964wru.26.2024.04.15.13.43.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Apr 2024 13:43:56 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Martin Tuma <martin.tuma@digiteqautomotive.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Hans Verkuil <hverkuil@xs4all.nl>, Sergey Kozlov <serjk@netup.ru>,
 Abylay Ospan <aospan@netup.ru>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Dmitry Osipenko <digetx@gmail.com>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Niklas =?ISO-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Pavel Machek <pavel@ucw.cz>, Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 15 Apr 2024 22:43:54 +0200
Message-ID: <4910185.31r3eYUQgx@jernej-laptop>
In-Reply-To: <20240415-fix-cocci-v1-7-477afb23728b@chromium.org>
References: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
 <20240415-fix-cocci-v1-7-477afb23728b@chromium.org>
MIME-Version: 1.0
Cc: linux-arm-msm@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-mediatek@lists.infradead.org, Ricardo Ribalda <ribalda@chromium.org>,
 linux-tegra@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
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

Dne ponedeljek, 15. april 2024 ob 21:34:24 GMT +2 je Ricardo Ribalda napisal(a):
> platform_get_irq() already prints an error for us.
> 
> Found by cocci:
> drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c:389:2-9: line 389 is redundant because platform_get_irq() already prints an error
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

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
>  		goto error_clock_rate_exclusive;
>  	}
> 
> 




_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
