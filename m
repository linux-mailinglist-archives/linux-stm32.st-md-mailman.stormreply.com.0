Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 389978A63FF
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Apr 2024 08:35:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F04B8C78026;
	Tue, 16 Apr 2024 06:35:04 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EFDFDC69066
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Apr 2024 05:08:35 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id
 41be03b00d2f7-5dbcfa0eb5dso2783945a12.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Apr 2024 22:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1713244114; x=1713848914;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=+oFRnUlIWAVoS2ogvawh6UrIJvrJD5mfVByWfU6FCcs=;
 b=Tj1TFurpYCND7KyeRLy+HgmYNhYS/Z5OZh1BW2pvn0KxB/puqvM/Wjgch1N1R+tw9l
 6ZwVZIw3RVtm3nwLVNPTAc/XqUZ/bsKbkPbNBFXlF7WrTZafy1Q25gW5OAGNAZlvoB1X
 hSAvOg1mNXyMDnGZN1RkETwicnWzshplNYDm8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713244114; x=1713848914;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+oFRnUlIWAVoS2ogvawh6UrIJvrJD5mfVByWfU6FCcs=;
 b=dcHzNMe5NJA/6RaS6w6jjXB6QsplpkbxVKiG80j/zLUNHI4U1c6/olordnpP9p8hnT
 kr1AJDE+4ClZkjuMX5Y7p7xhnGlxDqW/QknmZS553tbIXaLDIR1kf5M2eDOUV+bIg7hj
 Wy1uStHrgQXKkhdzBrib75n4HoM1asQ7cH56hnae8huC2UD6wppUY5Uf7ZU2++2cNOY0
 REwkeyuoXGkA5zMN58qGTy3ETx6nH1XA+vNFajpZU5za7NwGG6tB8wtLP5w+t9ToJxkk
 Zv25ch7a4a6hpIi1V03euAObp6wx8Q7jTsdN+DWHOH5v3W8iHr5wmRpnV2gpfsLkIIXN
 fqGQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXvpT1UFXqxp4KIOjwgDP2J8zcxY3M1evcefCJ/Zh/kSEElekgqR9fwVpOB2Y6mkQFYgwpEreO/59WrC+0axK3JQqA7LAwHeZX8eP9JEgKE5Dy+f8oK8n1D
X-Gm-Message-State: AOJu0YwhkbpfWtZkEFs+StRjc1SChSKNG96tKKRUWanh24sx9bBNsBYj
 hc/scSzxPAYE3khrufiaZggc8X/RvbpeJsVNZgKVqqwTiKqZjciiXeuZFlXUvg==
X-Google-Smtp-Source: AGHT+IHdeyQZ3pISdOfe7kK+Dd6aJIUpN4QAP3YPL9N18bYFaJvtwg0bTY9a/3ZlCCWhymzrgDPW+Q==
X-Received: by 2002:a05:6a21:2d85:b0:1a9:c13e:f211 with SMTP id
 ty5-20020a056a212d8500b001a9c13ef211mr8124701pzb.47.1713244114400; 
 Mon, 15 Apr 2024 22:08:34 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:1137:d3d7:a09d:5379])
 by smtp.gmail.com with ESMTPSA id
 ju17-20020a170903429100b001e49428f313sm8835349plb.261.2024.04.15.22.08.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Apr 2024 22:08:33 -0700 (PDT)
Date: Tue, 16 Apr 2024 14:08:23 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Message-ID: <20240416050823.GC14947@google.com>
References: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
 <20240415-fix-cocci-v1-3-477afb23728b@chromium.org>
 <20240416043916.GA14947@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240416043916.GA14947@google.com>
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
 Ricardo Ribalda <ribalda@chromium.org>,
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

On (24/04/16 13:39), Sergey Senozhatsky wrote:
> On (24/04/15 19:34), Ricardo Ribalda wrote:
> [..]
> > @@ -2165,7 +2167,7 @@ static int uvc_ctrl_init_xu_ctrl(struct uvc_device *dev,
> >  int uvc_xu_ctrl_query(struct uvc_video_chain *chain,
> >  	struct uvc_xu_control_query *xqry)
> >  {
> > -	struct uvc_entity *entity;
> > +	struct uvc_entity *entity, *iter;
> >  	struct uvc_control *ctrl;
> >  	unsigned int i;
> >  	bool found;
> 
> Is `found` still used?

It is. Never mind.

FWIW
Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
