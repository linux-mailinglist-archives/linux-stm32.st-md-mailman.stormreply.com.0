Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA5F8A6514
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Apr 2024 09:30:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 02127C6B45B;
	Tue, 16 Apr 2024 07:30:18 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F0075C69066
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Apr 2024 07:30:16 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-a44ad785a44so479275066b.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Apr 2024 00:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713252616; x=1713857416;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=cQoXqxQGz5UdNS/uHt9iOu3c65OCBEQl1AjepevvRYw=;
 b=t44LSkTJmBKoZNqEaFZqA/AJIUZxW0F7WSRR2ouWWO9V73/uxhOBXZQ4BDb2a0bmK5
 fugVm5Z2ksSh2XLfFTMRwq4YYcc0DoHTP9h24uPDjbXjBHKswzoHgRo2cinvw2MbbaRq
 8FXz0yiuTVBhsd8DQkwkgNp2ArHC9V/Q1KsXgOro2r+kZnMMKNFG7lz0nT03CK0RfjSn
 ILyMrnyP5Li3s9xEiedrS/2IBBiKjW0Vdyjbkju8Y1nxx0Zlq32vOquB99LRTqbqjuYq
 TnEI0QTQHr7Nnfqvw77iWq779Bq1Nl0HahBhVqvtsykOchkKFn1TkKLPMW7X8EGW6373
 kExw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713252616; x=1713857416;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cQoXqxQGz5UdNS/uHt9iOu3c65OCBEQl1AjepevvRYw=;
 b=LIVaklXtYUrK7XvJ4axUlVIIKPJVywmLUUbLi48s9C0wzeHg7YzB2W8zhTzkIC5w1j
 X+uI5LOKgSI9Oryud11I6ANGSO6NT7m4iuFL2HCE4HBPl0XJsxw0pPfyGxOtsk0/6VxL
 6x6n8QrTj95lhgdshyxw3+3+JfYi9fj8GrVPG9XUlUVSXdLAbXv3bpBSwInxClLJwkDp
 NBZ211I1u78bh9zXpGeF+kwb9SQEg2AVfvsWScn3nUOui6c8Q0dF92X1eih1utM7kmJb
 T+MpwsCByQ51vqdkFboPc3L6w/ANZkJ7oolsS4rXpVQVjbwP0sICAchc0v5Wm1BlLPtD
 mDTg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVdEScSZpeScUSwx/sGGSblouNh5MJj4Dc2EygjbeehamvthUqHkfriguZxpL30NVARX+5SSYFqIvUI59l7kWlTKP2CilPhlKtz1AjT7fXRvvfSI1ePV7iI
X-Gm-Message-State: AOJu0Yz9lQc3puxCHeeFlpWfAyVDW66vLs+naDDQFCspsW1bczHeXHlO
 eZG20cNUTanvw/YEPT3eg2RKf3GmQGh83EfjEs1ysoXecOsHimns1GOnpMjvXp4=
X-Google-Smtp-Source: AGHT+IES0flyaPsDqcItqmrdcMlT/9HhmNC59nIBd1+qe6iKBoJLQjAdExVi7n8xHc0r8DPQuGmsnQ==
X-Received: by 2002:a17:906:fd89:b0:a52:24b7:b4fc with SMTP id
 xa9-20020a170906fd8900b00a5224b7b4fcmr9643955ejb.72.1713252616011; 
 Tue, 16 Apr 2024 00:30:16 -0700 (PDT)
Received: from localhost ([102.222.70.76]) by smtp.gmail.com with ESMTPSA id
 h14-20020a1709070b0e00b00a518c69c4e3sm6421654ejl.23.2024.04.16.00.30.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Apr 2024 00:30:15 -0700 (PDT)
Date: Tue, 16 Apr 2024 10:30:11 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ricardo Ribalda <ribalda@chromium.org>
Message-ID: <cd4aac19-c4cf-4db0-a18c-42f1bf1441a8@moroto.mountain>
References: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
 <20240415-fix-cocci-v1-6-477afb23728b@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240415-fix-cocci-v1-6-477afb23728b@chromium.org>
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
Subject: Re: [Linux-stm32] [PATCH 06/35] media: stm32-dcmipp: Remove
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

On Mon, Apr 15, 2024 at 07:34:23PM +0000, Ricardo Ribalda wrote:
> platform_get_irq() already prints an error message.
> 
> Found by cocci:
> drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c:444:3-10: line 444 is redundant because platform_get_irq() already prints an error
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
> index bce821eb71ce..c25027b0ca32 100644
> --- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
> +++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
> @@ -439,11 +439,8 @@ static int dcmipp_probe(struct platform_device *pdev)
>  				     "Could not get reset control\n");
>  
>  	irq = platform_get_irq(pdev, 0);
> -	if (irq <= 0) {
> -		if (irq != -EPROBE_DEFER)
> -			dev_err(&pdev->dev, "Could not get irq\n");
> +	if (irq <= 0)
>  		return irq ? irq : -ENXIO;

platform_get_irq() can never return zero so this should be written as:

	irq = platform_get_irq(pdev, 0);
	if (irq < 0)
		return irq;

There is a comment next to platform_get_irq() which documents this.

regards,
dan carpenter

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
