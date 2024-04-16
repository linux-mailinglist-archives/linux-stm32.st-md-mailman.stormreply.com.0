Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0559D8A6660
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Apr 2024 10:47:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A9A70C6B45B;
	Tue, 16 Apr 2024 08:47:23 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 159E1C6A61D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Apr 2024 08:47:23 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-a53f131d9deso206108866b.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Apr 2024 01:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713257242; x=1713862042;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=NkM0I+aW0wUUvGJQ59wWIPVhiqCpaSf/yczLNzgYK2M=;
 b=t0wqs2Coj7oRuAtzsYsfDUQHVt91YkDC/pEtMqEzG1xOIv1H/L7jnTLod8/kaNFgwV
 w47zMi6c8bnIKcRuTqeNQ883R0YrUf7YvgjDDrStv4RcrB4p/vbL+gbmllE5pHLAGQdE
 i/ZBb7E3mmDFDRLEjYNrdiM2tYiSWtLVvCLUx73Q6m55HndwQvtlEWVR6ha+yKqcq6rf
 dRttrF6RbYbd9KXmblZfS+khO8fajVDO/bGX/pYQYI8KbS1OQu5SxVekRTbQ4DQRXeCN
 a+4Xk7K/HHM0eYGcUISYleZ7oiMbMUaQlZFPq7bmxCR/gkIqUUz7w0ubdpyXdCSbIT53
 re4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713257242; x=1713862042;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NkM0I+aW0wUUvGJQ59wWIPVhiqCpaSf/yczLNzgYK2M=;
 b=TTePfUjEHu1QUqK6tSOzpPFizRUftBEk+7av0EUGrzXDpowEe5qA8kZm51NeVPRfbT
 zRaSAXE/KO9H423FWTrGOkJ9MoF6wZZY/M64SCvMjuj4MOsVCxXdvFopsBbSmjLrum6B
 gpjNBfxTgMFXOvnOPF8Hecxg/HS2V0w8QiwRp9ypj0iAY5djXClPwKJivWhfDd9Yu0AS
 OpPCElruaSkpOw28Oe85jk/om0yiFpGUUOrg5LcFSObA477GFTSbOucSeHH7fuPdCyO2
 QZu0sdMCGynDf7VTmGEVM87ZaikUvGr8hLtGZvXHk44oFEMNcZK+z6YtYpRyklkKos5Z
 1/rQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWkNQCeQxJdWajxMXPvjAbUWMYh1+sKLVlMIeXuiTZO4c+yI/OpFjV4Fw7cM1VdVTkuPkZtJku4w/83jCe2STorifcrxfqBzwZP0+oR88m57JJysP2swV5D
X-Gm-Message-State: AOJu0Yw3+Fj38lDVptz07uL7Fau+lHALqrEBM9Q1KF9uku1+CbtY0OF8
 fHt4pLCqNoQ4HZkEDSv6/vKNBk4a16GvzhrlwnhdfKGGmDhUlPObI6joO8x0fY8=
X-Google-Smtp-Source: AGHT+IERiWoYGa51YbGEPmkvByvhia/eckpCcRSCGVJVNIFEmOLsj+qs5GtIOBV8MGWtuu2neCmDeg==
X-Received: by 2002:a17:906:7145:b0:a52:8a8a:59cb with SMTP id
 z5-20020a170906714500b00a528a8a59cbmr2572423ejj.61.1713257242155; 
 Tue, 16 Apr 2024 01:47:22 -0700 (PDT)
Received: from localhost ([102.222.70.76]) by smtp.gmail.com with ESMTPSA id
 x16-20020a170906135000b00a51a7832a7asm6572111ejb.199.2024.04.16.01.47.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Apr 2024 01:47:21 -0700 (PDT)
Date: Tue, 16 Apr 2024 11:47:17 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ricardo Ribalda <ribalda@chromium.org>
Message-ID: <a003494c-a1a9-4fcd-83d8-766a75d6bbb2@moroto.mountain>
References: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
Cc: Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Oleg Drokin <green@linuxhacker.ru>, Hans Verkuil <hverkuil@xs4all.nl>,
 linux-tegra@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
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
Subject: Re: [Linux-stm32] [PATCH 00/35] media: Fix coccinelle warning/errors
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

In my opinion, it's better to just ignore old warnings.

When code is new the warnings are going to be mostly correct.  The
original author is there and knows what the code does.  Someone has
the hardware ready to test any changes.  High value, low burden.

When the code is old only the false positives are left.  No one is
testing the code.  It's low value, high burden.

Plus it puts static checker authors in a difficult place because now
people have to work around our mistakes.  It creates animosity.

Now we have to hold ourselves to a much higher standard for false
positives.  It sounds like I'm complaining and lazy, right?  But Oleg
Drokin has told me previously that I spend too much time trying to
silence false positives instead of working on new code.  He's has a
point which is that actually we have limited amount of time and we have
to make choices about what's the most useful thing we can do.

So what I do and what the zero day bot does is we look at warnings one
time and we re-review old warnings whenever a file is changed.

Kernel developers are very good at addressing static checker warnings
and fixing the real issues...  People sometimes ask me to create a
database of warnings which I have reviewed but the answer is that
anything old can be ignored.  As I write this, I've had a thought that
instead of a database of false positives maybe we should record a
database of real bugs to ensure that the fixes for anything real is
applied.

regards,
dan carpenter

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
