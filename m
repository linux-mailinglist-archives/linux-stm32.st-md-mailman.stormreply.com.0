Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B86968AC444
	for <lists+linux-stm32@lfdr.de>; Mon, 22 Apr 2024 08:33:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6942FC71294;
	Mon, 22 Apr 2024 06:33:58 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AFE11C6B47E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 20 Apr 2024 23:23:11 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-a559b919303so78396266b.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 20 Apr 2024 16:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713655391; x=1714260191;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=G7j9WmKVfIxCtxmA5+g+ivZQajcRB8Ss1Yyb3DxCAfA=;
 b=E7UtzNxISqwOnr8jozO1SXIOSN/4sb8L7IA4tGKjssZXyO6QTONkvKWrD9nZbo37EC
 +VckyL2CoX8IUEK2l0LpVTLpLTIexvCtKaszjWl70DIamIN7le4RgvUA6H3cAqvGwHv0
 HzO6tnLfJ0l5JLwaLZzcyXPL+HhSqt+83/QRGprSplx84AcclE3o2nH1qIAOQrF6vOjK
 M1Uh3E+1HkROyYDFNtibbpMbPAFzWUjxKp/XvwSTGdBRah3sVFoEr4FKmNaPK7t/Okoo
 JNfkplHEQ5tI57xjQul7zsnsDidjyjHmdVmJTuLD/+0kc3QvEvggWgTgnTJgd7rJEBb+
 Nppw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713655391; x=1714260191;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=G7j9WmKVfIxCtxmA5+g+ivZQajcRB8Ss1Yyb3DxCAfA=;
 b=nMk0IWMWebBJ9dSESgEYu+mfe4ViKPgujkebbL0nK463weFo0/dcEWv9waf5+cQhhV
 0vqKMB5mgKo0moo8CLRJuHN5gKl0vDxi2NpQZ0Mnf9hnbWaiE4OBdDhdguOVjp9qbKuT
 SV8OJ13qQ/CzeI4LTIRe1wdH5+OkkcCkEBqtC2MhzcV6AJWKMi4UKJaozgOkzl6SaMG/
 Clev1IDaUrtPi31lmr917cFiFRJ+L+X1begYKUvitgt+kLqOIT1QKuL1GbbFnZ3gluWF
 fkBD+J+xz7srbjeqqizFC0suGkW6iW3K0oee6rsEojrwVH+PZvPeR5SLKgGTdm6+1/X3
 TgiA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXw+StPpjQzKoAuujx03ghDsGWHUN7R0mUfzRyb5RpjrKHsP+ioBJ3WxT2YxdQEjiWf7tOaVeybL0sMo9iUlYRkSuLxshKbrfBL+zKkGq+f1+x1zhzenAY
X-Gm-Message-State: AOJu0YyT1GkSg7VMpsrpGLd6awTuxxoPYhkesiNDSY+HPj7SngJz/W9w
 BsJZKJoPN+FvDHLSvjO/54lJdZoTouX2tx9UmleGJ0rxU3o7Yrj7N1+R1ChZZnQ=
X-Google-Smtp-Source: AGHT+IHIgAHqaBHAo2tv0s9P7hAH/P161Q1ck8771gq2FLpa0nizkFWxKtOsbHWkZLUsCdT//bfy9g==
X-Received: by 2002:a17:906:c24d:b0:a4e:5137:9969 with SMTP id
 bl13-20020a170906c24d00b00a4e51379969mr4156927ejb.32.1713655391076; 
 Sat, 20 Apr 2024 16:23:11 -0700 (PDT)
Received: from [192.168.0.102] ([176.61.106.68])
 by smtp.gmail.com with ESMTPSA id
 v24-20020a170906339800b00a521904b548sm3889268eja.166.2024.04.20.16.23.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 20 Apr 2024 16:23:10 -0700 (PDT)
Message-ID: <27513574-3131-4704-9c3d-f699cc9edb9b@linaro.org>
Date: Sun, 21 Apr 2024 00:23:08 +0100
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
 <20240419-fix-cocci-v2-9-2119e692309c@chromium.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240419-fix-cocci-v2-9-2119e692309c@chromium.org>
X-Mailman-Approved-At: Mon, 22 Apr 2024 06:33:57 +0000
Cc: linux-arm-msm@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2 09/26] media: v4l: async: refactor
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 19/04/2024 10:47, Ricardo Ribalda wrote:
> Return 0 without checking IS_ERR or PTR_ERR if CONFIG_MEDIA_CONTROLLER
> is not enabled.
> 
> This makes cocci happier:
> 
> drivers/media/v4l2-core/v4l2-async.c:331:23-30: ERROR: PTR_ERR applied after initialization to constant on line 319
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>   drivers/media/v4l2-core/v4l2-async.c | 7 +++----
>   1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
> index 4bb073587817..915a9f3ea93c 100644
> --- a/drivers/media/v4l2-core/v4l2-async.c
> +++ b/drivers/media/v4l2-core/v4l2-async.c
> @@ -316,9 +316,10 @@ v4l2_async_nf_try_all_subdevs(struct v4l2_async_notifier *notifier);
>   static int v4l2_async_create_ancillary_links(struct v4l2_async_notifier *n,
>   					     struct v4l2_subdev *sd)
>   {
> -	struct media_link *link = NULL;
> +	struct media_link *link;
>   
> -#if IS_ENABLED(CONFIG_MEDIA_CONTROLLER)
> +	if (!IS_ENABLED(CONFIG_MEDIA_CONTROLLER))
> +		return 0;
>   
>   	if (sd->entity.function != MEDIA_ENT_F_LENS &&
>   	    sd->entity.function != MEDIA_ENT_F_FLASH)
> @@ -326,8 +327,6 @@ static int v4l2_async_create_ancillary_links(struct v4l2_async_notifier *n,
>   
>   	link = media_create_ancillary_link(&n->sd->entity, &sd->entity);
>   
> -#endif
> -
>   	return IS_ERR(link) ? PTR_ERR(link) : 0;
>   }
>   
> 

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
