Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B3A28AC43F
	for <lists+linux-stm32@lfdr.de>; Mon, 22 Apr 2024 08:33:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0EC26C6DD9A;
	Mon, 22 Apr 2024 06:33:58 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CEE98C6B47E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 20 Apr 2024 22:47:06 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-349c4505058so2378595f8f.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 20 Apr 2024 15:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713653226; x=1714258026;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fHqxIncYJ8egtEQrph9tKgbaWj8ag9453EB89pr+LvE=;
 b=GhTKVBtnDmYME1x5GWS2f2E54EvviZwP2a6gJOHiDoSQCQnOyKlqyjIuyaNj46yKwI
 Vy4uhhDlpk6RBrIfrnQ6WN0HzmdJuNqo/+iW8y7t6L9bX4mwJ/CU7k7iKN1WaGAFUVUK
 1ijky4QJMDcrBhRkde8NDhIVDvnKgBQcKuRF42OND+AmT8hmAnTbNN123D0PIFo1kzKA
 5IyFS/l08puwwPDaqvKMp8MDYoNW9BfJo3WzLAv5rG5VwqUcjCWGNdwpFx8GsP/qHKhU
 HvR+Jeg2Tn1ucBOP/leoDna77Ck/J3zrE8LVHDcuHGS604+PYP5Ah4y5bo5qoZ29H0HZ
 Sk5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713653226; x=1714258026;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fHqxIncYJ8egtEQrph9tKgbaWj8ag9453EB89pr+LvE=;
 b=lOWCVAZ4jhXvfDFbN8od6/DglNbzYvGNeqbcdmUBeAQh5g2/RT2kOLStXqc/GEYQSk
 u0CRlyDOOy/zzUhj9Fj7yW6kLaNrJcYD851zUXzp1VSoJZeKqsCxO6wDHTEWHZy3/37G
 27/yhbw2ZuDIHEJx9IBDpnv22cZ5rphjGXFKtTcI1aQPALmxvTW3tAgC1QPCX1X6XNGI
 WdxGn98fwim+lpaakNRbVX5lav/Nkrl2EPLUMbbwS3KFNyhTvFYwXgUg9PknJVbPoK1h
 XCOJrdFLM+b8P1NBuhnbPP5hG+X3fhFBuQqRhyipz7dQH5OYCuNTlA0iSJJcVpOGrFoN
 afyw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJiC0tj/OhGFwAH3bYBygAaA6iw87AcozY8QDSkjl32eYcDRCHKmxUu547BZwJH6dKRY3msA84pxM0rpNk7YaOqIaiMyYWdX3UYMtzXDkMSIrFoUSzrafT
X-Gm-Message-State: AOJu0YzoRP1kWGjwW5TR0nX3EnpvE2pknj4l8xq7W2rbGeq9Uvlyhhy4
 CDXjGA2HRzMKAsuFG91bXxZagl9EFF0OIrwDDaK8XnG7c94JUgxm3nTFF70jO8U=
X-Google-Smtp-Source: AGHT+IGtPzW/+9lmMVQCxqN2UztagHO9wsOjvQj41cl+HJwvySkknf0HE8sKI3A2uzyMihcZkv08Sw==
X-Received: by 2002:a05:6000:2c2:b0:346:758e:5f29 with SMTP id
 o2-20020a05600002c200b00346758e5f29mr4624994wry.60.1713653226127; 
 Sat, 20 Apr 2024 15:47:06 -0700 (PDT)
Received: from [192.168.0.102] ([176.61.106.68])
 by smtp.gmail.com with ESMTPSA id
 fc14-20020a05600c524e00b004161af729f4sm11399884wmb.31.2024.04.20.15.47.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 20 Apr 2024 15:47:05 -0700 (PDT)
Message-ID: <0b5c6091-e47c-4d24-a13a-2b5ad1b9cfb8@linaro.org>
Date: Sat, 20 Apr 2024 23:47:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Ricardo Ribalda <ribalda@chromium.org>,
 Martin Tuma <martin.tuma@digiteqautomotive.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Chen-Yu Tsai
 <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
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
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
References: <20240419-fix-cocci-v2-0-2119e692309c@chromium.org>
 <20240419-fix-cocci-v2-23-2119e692309c@chromium.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240419-fix-cocci-v2-23-2119e692309c@chromium.org>
X-Mailman-Approved-At: Mon, 22 Apr 2024 06:33:57 +0000
Cc: linux-arm-msm@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2 23/26] media: venus: vdec: Make
 explicit the range of us_per_frame
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 19/04/2024 10:48, Ricardo Ribalda wrote:
> Unless the fps is smaller than 0.000232829 fps, this fits in a 32 bit
> number. Make that explicit.
> 
> Found by cocci:
> drivers/media/platform/qcom/venus/vdec.c:488:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_u64 instead.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>   drivers/media/platform/qcom/venus/vdec.c | 7 ++-----
>   1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
> index 29130a9441e7..2b2874aedb2d 100644
> --- a/drivers/media/platform/qcom/venus/vdec.c
> +++ b/drivers/media/platform/qcom/venus/vdec.c
> @@ -464,7 +464,7 @@ static int vdec_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
>   	struct venus_inst *inst = to_inst(file);
>   	struct v4l2_captureparm *cap = &a->parm.capture;
>   	struct v4l2_fract *timeperframe = &cap->timeperframe;
> -	u64 us_per_frame, fps;
> +	u64 us_per_frame;
>   
>   	if (a->type != V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE &&
>   	    a->type != V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
> @@ -484,10 +484,7 @@ static int vdec_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
>   	if (!us_per_frame)
>   		return -EINVAL;
>   
> -	fps = (u64)USEC_PER_SEC;
> -	do_div(fps, us_per_frame);
> -
> -	inst->fps = fps;
> +	inst->fps = USEC_PER_SEC / (u32)us_per_frame;
>   	inst->timeperframe = *timeperframe;
>   
>   	return 0;
> 

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
