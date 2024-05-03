Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F4068BABE9
	for <lists+linux-stm32@lfdr.de>; Fri,  3 May 2024 13:55:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E438DC712A2;
	Fri,  3 May 2024 11:55:21 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 04A98C712A1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  3 May 2024 11:55:13 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-41adf155cffso62268915e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 03 May 2024 04:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714737313; x=1715342113;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ejcxvyIN9Gt9hs/CP6yU9CZUBAq0kOYwH6s0PyoHfGQ=;
 b=rSwHzt5iOxERlAQ6xYYazsBEKQhO6Q17cKX0c1zumKJFAvRrmGyGE+NnTnwYS7wrOH
 pOLs+TGPGYf+ne1b08s6un/nDy4Q4I7NCtPp3vVMT0HOmBmmRqmm2P4cgZPc9N2h3R/s
 jeVgofCnJGO3e2KpL2eXlOAHH8rwyN/5Tr9B83JfwMECncgr5OAnVwyqpHkcUsRWQSkD
 Zl0prAZLCIYcXVFBboR/TMqAqB7ObQhSIIRIM0AAoFV3FP7Vtiv642krrR5SHn3Z5XCE
 gDbONqmwvVgMzmqlhnbnkabL9OMYJIjOXZ3qjKvbFRQD1c6rHG5ecyhuMX2Xkk2yniDC
 d4SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714737313; x=1715342113;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ejcxvyIN9Gt9hs/CP6yU9CZUBAq0kOYwH6s0PyoHfGQ=;
 b=SgljMcUXMzmJapZYjTO2knSP6+h21aj89iBvVGKQ1nCFcaU4g9yscZjVSIaYmVxbU0
 w2Vm6V6mwmwmAl0/vD1FGBSiLKAL5oThaGGFhfqQhZFyV5XYJoIR0CMj5gj1S++1PqKy
 oHtikgafC5WcwIKm/5MCwZyRLTaGf39+n+aSRxhoBZ2eaDxJJtwEky78kw+R6g65NyQR
 q+G1YJVAgtIKt5mCuVJQiOGiET/ba4TKa1/FusXdO0ES6U0W5sXVOYjqKB5UV1KhPpfB
 53JmdLRzs4zc+gjqe+khY5RxFYoZD6+20rZDBHLwk823L/bFY0sdL6r/0nxJMjj2DnLW
 Ye4A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWTRNV4o8d9Pr0+/q+ARZQRWpuSHG1UCal4zPuGeMEmwn8Z+jxubFRS8+9YNO0unizEyei7VKVdOODNEtoNiP6QNi/FH4JdG63FfUfw1sGyI7V3LeYw2/3I
X-Gm-Message-State: AOJu0YxxB/WzBg2cxvKm1IRlzBSLIa3kDzSuIEqd3A5KsxAQdeVmCpCg
 bOd3jTnZvmgfHfm+Mgh0zOl6oE7XuLAJpUoFFVKGUZ6hJcxu+aIz4CC7Jzw3CgA=
X-Google-Smtp-Source: AGHT+IHjyMa7ooctRLN/1tdS/gx79TA23M2UYYTNE+3A8Wfu/afPHupfSN+yShlxrDD3Ur4rmUCBww==
X-Received: by 2002:a05:600c:5118:b0:41a:34c3:2297 with SMTP id
 o24-20020a05600c511800b0041a34c32297mr1821832wms.5.1714737313152; 
 Fri, 03 May 2024 04:55:13 -0700 (PDT)
Received: from localhost ([102.222.70.76]) by smtp.gmail.com with ESMTPSA id
 k8-20020a05600c1c8800b00418a6d62ad0sm9213606wms.34.2024.05.03.04.55.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 May 2024 04:55:12 -0700 (PDT)
Date: Fri, 3 May 2024 14:55:09 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Message-ID: <c4287024-8012-458d-9829-15ffbceb25cf@moroto.mountain>
References: <20240429-fix-cocci-v3-0-3c4865f5a4b0@chromium.org>
 <20240429-fix-cocci-v3-26-3c4865f5a4b0@chromium.org>
 <20240503112758.763d8d31@sal.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240503112758.763d8d31@sal.lan>
Cc: Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Hans Verkuil <hverkuil@xs4all.nl>, linux-tegra@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Dmitry Osipenko <digetx@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Sergey Kozlov <serjk@netup.ru>,
 Samuel Holland <samuel@sholland.org>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>, linux-staging@lists.linux.dev,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, linux-sunxi@lists.linux.dev,
 linux-media@vger.kernel.org, Abylay Ospan <aospan@netup.ru>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-arm-msm@vger.kernel.org,
 linux-mediatek@lists.infradead.org,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>, linux-kernel@vger.kernel.org,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Ricardo Ribalda <ribalda@chromium.org>,
 Martin Tuma <martin.tuma@digiteqautomotive.com>
Subject: Re: [Linux-stm32] [PATCH v3 26/26] media: dvb-frontends: tda10048:
 Make the range of z explicit.
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

On Fri, May 03, 2024 at 11:27:58AM +0100, Mauro Carvalho Chehab wrote:
> Em Mon, 29 Apr 2024 15:05:05 +0000
> Ricardo Ribalda <ribalda@chromium.org> escreveu:
> 
> > We do not expect the sample_freq to be over 613MHz.
> > 
> > Found by cocci:
> > drivers/media/dvb-frontends/tda10048.c:345:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_u64 instead.
> > 
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/dvb-frontends/tda10048.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/media/dvb-frontends/tda10048.c b/drivers/media/dvb-frontends/tda10048.c
> > index 3e725cdcc66b..1886f733dbbf 100644
> > --- a/drivers/media/dvb-frontends/tda10048.c
> > +++ b/drivers/media/dvb-frontends/tda10048.c
> > @@ -328,7 +328,8 @@ static int tda10048_set_wref(struct dvb_frontend *fe, u32 sample_freq_hz,
> >  			     u32 bw)
> >  {
> >  	struct tda10048_state *state = fe->demodulator_priv;
> > -	u64 t, z;
> > +	u32 z;
> > +	u64 t;
> >  
> >  	dprintk(1, "%s()\n", __func__);
> >  
> > @@ -341,6 +342,7 @@ static int tda10048_set_wref(struct dvb_frontend *fe, u32 sample_freq_hz,
> >  	/* t *= 2147483648 on 32bit platforms */
> >  	t *= (2048 * 1024);
> >  	t *= 1024;
> > +	/* Sample frequency is under 613MHz */
> 
> Are you sure about that? Some DVB devices have very high frequency 
> clocks, specially if they're also used for satellite, so I can't
> be sure by just looking at the driver's code.
> 
> Also, we had already a bunch of regressions with "fixes" like this
> that actually broke frontend drivers.

This patch preserves the existing behavior. The sample_freq_hz variable
is a u32 so, in the original code, z couldn't have been more than
U32_MAX even though it was declared as a u64.

It's possible that the original code was wrong.  We have seen that in
other places in this patchset.  Adding a note about the datasheet is
also a good idea.

regards,
dan carpenter

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
