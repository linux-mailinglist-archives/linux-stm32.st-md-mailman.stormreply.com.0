Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 17D9C8A63FD
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Apr 2024 08:35:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D2861C78022;
	Tue, 16 Apr 2024 06:35:04 +0000 (UTC)
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com
 [209.85.210.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2677CC69066
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Apr 2024 04:39:28 +0000 (UTC)
Received: by mail-ot1-f44.google.com with SMTP id
 46e09a7af769-6ea2436de79so2660487a34.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Apr 2024 21:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1713242367; x=1713847167;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=VSyiMdTHrk1JwFRWNfMWMCAnJIqFPtjB/dNBg4kU2zU=;
 b=m3zKO1+ndb+5UQxPr6Kg5Ir9V2hNaqGc0ADPam1EcCn6bDja5wecQQFAv82q2ukzKX
 oDuBFqVDwMEZG/9mPsaSgeEdCEsgf7GbzD031mWWGdfh7ArS7yLMPcx+mHWcjDrUtB8I
 WaL/YPJvznrAKQc4GWQa4qaEHumxWCyXAv5RE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713242367; x=1713847167;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VSyiMdTHrk1JwFRWNfMWMCAnJIqFPtjB/dNBg4kU2zU=;
 b=cbX47WQU2S8uauy5Sbw141GYc7cQrCg7yZksB7pBAfhXqXOSlKGUvItBXH42ZgMcTs
 Xo0Mf3rzcCmJ6CXb9hO1VOzL2jcsmfgeq4mvC7dZIxZcKT+2zfnDnt5tb7jrDH6gwEzu
 FQkWnv84huDDvNhMjbZLCfOVX7tvjNA0j4BE1et/Erax5sWizheHk10tbw1PdC7lJ6oQ
 GkRmYE6kzfJNZggCaoW84PAQSoXz+tgAvLPzBKAd3Di9/Yp5rUZEoPFmDOpHsqXi2nEx
 ZmCgave13sMIYlE/oY36zj7hK0bTa5bjWYpTy8jVSNQyFjevX/j2n2cx76eaPc+beENC
 CIUQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUzt3eOLSdY+89LW0tNEsyCeHS/ZJ2NGGW0BWcWZ6LbRmzHu5vlO+ONyjgBJjXJoMF+hfNkj0vNOINQdUXaWArrbjnOxwceCwoVBF1xwG9WgLwBJ63yGXTY
X-Gm-Message-State: AOJu0YwM5phws/gGqCAOb1Vfo8u3Ns+8CQXjucuOoPiijsNnbx5WSvEe
 xluP3RlRMNFUfWzbKmv7vUafwkuocFgkI58fnjgiSK7IryXjQcd297SrZoanbw==
X-Google-Smtp-Source: AGHT+IG0ppjZwpHlNVZUS9DrO9z9Zt+G6PVBJT/QRsW763QY2rUFepRZ7LeeiLPVtOHJ43Afq2vK7g==
X-Received: by 2002:a9d:7f8a:0:b0:6ea:23af:2bcb with SMTP id
 t10-20020a9d7f8a000000b006ea23af2bcbmr12688528otp.32.1713242366850; 
 Mon, 15 Apr 2024 21:39:26 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:1137:d3d7:a09d:5379])
 by smtp.gmail.com with ESMTPSA id
 b65-20020a633444000000b005dccf48e2a5sm7898637pga.54.2024.04.15.21.39.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Apr 2024 21:39:26 -0700 (PDT)
Date: Tue, 16 Apr 2024 13:39:16 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Ricardo Ribalda <ribalda@chromium.org>
Message-ID: <20240416043916.GA14947@google.com>
References: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
 <20240415-fix-cocci-v1-3-477afb23728b@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240415-fix-cocci-v1-3-477afb23728b@chromium.org>
X-Mailman-Approved-At: Tue, 16 Apr 2024 06:35:01 +0000
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
Subject: Re: [Linux-stm32] [PATCH 03/35] media: uvcvideo: Refactor iterators
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

On (24/04/15 19:34), Ricardo Ribalda wrote:
[..]
> @@ -2165,7 +2167,7 @@ static int uvc_ctrl_init_xu_ctrl(struct uvc_device *dev,
>  int uvc_xu_ctrl_query(struct uvc_video_chain *chain,
>  	struct uvc_xu_control_query *xqry)
>  {
> -	struct uvc_entity *entity;
> +	struct uvc_entity *entity, *iter;
>  	struct uvc_control *ctrl;
>  	unsigned int i;
>  	bool found;

Is `found` still used?

> @@ -2175,16 +2177,16 @@ int uvc_xu_ctrl_query(struct uvc_video_chain *chain,
>  	int ret;
>  
>  	/* Find the extension unit. */
> -	found = false;
> -	list_for_each_entry(entity, &chain->entities, chain) {
> -		if (UVC_ENTITY_TYPE(entity) == UVC_VC_EXTENSION_UNIT &&
> -		    entity->id == xqry->unit) {
> -			found = true;
> +	entity = NULL;
> +	list_for_each_entry(iter, &chain->entities, chain) {
> +		if (UVC_ENTITY_TYPE(iter) == UVC_VC_EXTENSION_UNIT &&
> +		    iter->id == xqry->unit) {
> +			entity = iter;
>  			break;
>  		}
>  	}
>  
> -	if (!found) {
> +	if (!entity) {
>  		uvc_dbg(chain->dev, CONTROL, "Extension unit %u not found\n",
>  			xqry->unit);
>  		return -ENOENT;
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
