Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CCE98A63FE
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Apr 2024 08:35:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E0F1BC78024;
	Tue, 16 Apr 2024 06:35:04 +0000 (UTC)
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com
 [209.85.160.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6E3E3C69066
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Apr 2024 04:41:31 +0000 (UTC)
Received: by mail-oa1-f51.google.com with SMTP id
 586e51a60fabf-22ed075a629so2396791fac.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Apr 2024 21:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1713242490; x=1713847290;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=zlvfKPvFfqMVTjgmkdQ2dgHupdBvuhJAjVeekD23sMY=;
 b=m+xCdido6KzCRK7aRVeMDGH7H2DmlCEUQ0WROwzRuTKe9zLuXyiI94JHD4v4hyr2GK
 0VZGprc4KEA2RlK9J+foP6DVzGFd6FCMl+G+CnNsIG96ipb2hytHO/udx6gVXpH5yIhD
 7Le1f8oLQ6MSWiCvO554nHGFRhohJdXAeMdGQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713242490; x=1713847290;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zlvfKPvFfqMVTjgmkdQ2dgHupdBvuhJAjVeekD23sMY=;
 b=FXttVWqdIKibJ0dIHqaSBliQrdDsEpAW/OJ1LozOGcjsl4QCQYXiQGaTEg2x+AQEC3
 952T5ltzO1BMogz5KMvnQJHuhAMcGlMotvLZYB5UFjpKb7q75RgcxSA/LooWluFKMFGg
 rVzY/OCk1qJipX/TlMFG4cgP8CEw6gZFvk2EjCwmhc6WbSnGjjoICMu4RC8P2HzeerOv
 Kax7BE31LM/cxbuxgQLrVi2FBw+3EUhGuJGIknIN68s7Ntx6KtBVue/LNSeAJepq9o0I
 oQPJuyhH0wCuNws/nBEptP8JPzx0d99gFXAlqSixzTUZxeoNAOT+el+fLRK4zXiYJteU
 BTRg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/PdQbJ9c8fHFbV5EK5U+GwSJzhDlmY7YSIXlmoK7D95JsIO4TsVk7oeyCx6OEYuZUkxehBOh/1OCuF5mFKdMVUFxgfqH1WXWWWlIAmBmlOK7BwYxz6IYp
X-Gm-Message-State: AOJu0Yzim3yQSHsf5jW4iNzE+wq/QA4B+h0mJL4QlfPIO9lJDQDz9eiM
 mVSCoBjiNTFv6lCqS5MnBpu20vIHiMkmmrmsZeqgQTpfpRp8cZH0CKVsavAmww==
X-Google-Smtp-Source: AGHT+IFGNPBipDIE0AiNQc/Cqlxd5431Vef5ObfevA6hF44fnzurKBxD1B4lS2oVTJREu9b1YFAdCg==
X-Received: by 2002:a05:6870:89a4:b0:22d:fcf9:bd97 with SMTP id
 f36-20020a05687089a400b0022dfcf9bd97mr15408827oaq.26.1713242490147; 
 Mon, 15 Apr 2024 21:41:30 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:1137:d3d7:a09d:5379])
 by smtp.gmail.com with ESMTPSA id
 r4-20020a056a00216400b006edd05e3751sm8284703pff.176.2024.04.15.21.41.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Apr 2024 21:41:29 -0700 (PDT)
Date: Tue, 16 Apr 2024 13:41:19 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Ricardo Ribalda <ribalda@chromium.org>
Message-ID: <20240416044119.GB14947@google.com>
References: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
 <20240415-fix-cocci-v1-4-477afb23728b@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240415-fix-cocci-v1-4-477afb23728b@chromium.org>
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
Subject: Re: [Linux-stm32] [PATCH 04/35] media: uvcvideo: Use max() macro
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
> It makes the code slightly more clear and makes cocci incredibly happy:
> 
> drivers/media/usb/uvc/uvc_ctrl.c:839:22-23: WARNING opportunity for max()
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
