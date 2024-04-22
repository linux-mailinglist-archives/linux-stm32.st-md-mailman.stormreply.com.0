Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC628AC47B
	for <lists+linux-stm32@lfdr.de>; Mon, 22 Apr 2024 08:53:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9C4AAC6DD67;
	Mon, 22 Apr 2024 06:53:25 +0000 (UTC)
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com
 [209.85.210.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D196FC03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Apr 2024 06:53:24 +0000 (UTC)
Received: by mail-ot1-f44.google.com with SMTP id
 46e09a7af769-6eb77e56b20so2607995a34.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 21 Apr 2024 23:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1713768803; x=1714373603;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dg+W9++cTuSKiuuJU3BmFvsGHmcNsDKvQ8sCokwEeZM=;
 b=VVqMMhvicm9uXRmYYFTnVRipPIjrWM8CdRmYkjHe09JjfgSO67xzdbwyyyVHCpycx6
 ed+I5xZQCOYgJxf5Y7PvfBsdf1HptSXO9b+LT/Q7w8uOHnMt0A/72tTavld7R0Oy9iqN
 FgvmPfhrmKFd2FG5PwZ10bazlcAsIK84WZdsA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713768803; x=1714373603;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dg+W9++cTuSKiuuJU3BmFvsGHmcNsDKvQ8sCokwEeZM=;
 b=DiEBYxGmzPQu1tQiOo083t7hXk1e/XreR624lmBcL9RULvNBdylwzS1S/vTeRqS1Nq
 0xbDWNIwvuxuzGUIseFs6BGJ/zX+h5kokDPUnbLH6Xn1/JI4vRQ1hD3TtgcTSJbrGVkf
 RIRAoWGpFi1jov/XOh8exzNK0GNVABUWIdTRfm92IlHz0f7eGgpRv3Wz3GVh0z2unUpH
 Wi4tziSHH/WKhIHFXaLxtSkIdKI6ooGdc8/BFicivMimUbEUSR9yqdiRToaA5lgJomQi
 NTteLNJMk6krEcRacnvrPU6HiWzmFWvWNKLV3lGu8tZaBQc+H5o9ogOgA0E0jmkhBmbS
 awIA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX60GR/UWcEDSIkWjZrCAJh3sny6wSgg4Qb39VY38e8aBnFQRBglRbXDw070kw5gYIKCy5s83LiGgh5IagbXmr9CLtTSKVQLqfpByDKTjXUMAgpQuE/wACt
X-Gm-Message-State: AOJu0YyqLPv8oyYj6dYVbj6+tAjzIuqZGp3CAke9iR+sCiv5i+tebMen
 IorlQohbQjO40o/mvh93E+61VtPfV+JOsTNl1hXZo4l0z3vQCpXtB4NOHojnUYjsha08aQ5eE6E
 n3g==
X-Google-Smtp-Source: AGHT+IGKp28MvMG0bDC1k45SaOfAY0KNnAEVQsvKsD1GA0slYSBcLdFxcc/Y9bVMaGDj1Fv7NZZ3IQ==
X-Received: by 2002:a05:6808:14d2:b0:3c8:2c94:9912 with SMTP id
 f18-20020a05680814d200b003c82c949912mr3241450oiw.45.1713768802416; 
 Sun, 21 Apr 2024 23:53:22 -0700 (PDT)
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com.
 [209.85.210.49]) by smtp.gmail.com with ESMTPSA id
 d2-20020a05680805c200b003c7066c39e6sm1289538oij.21.2024.04.21.23.53.21
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 21 Apr 2024 23:53:22 -0700 (PDT)
Received: by mail-ot1-f49.google.com with SMTP id
 46e09a7af769-6eb55942409so2108836a34.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 21 Apr 2024 23:53:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWDsBlae6/P5owmJIz7drYJpm/bUfFVRMKV9ZFZ+3jwnVb4bxWvGGOTdMnooX1YpQTnNnvYu/ttJTPYxjKDpX/Q6QwKDe8K6Lfv4h6Gqwh1ELM+WyPaCzGb
X-Received: by 2002:a0c:ec88:0:b0:69b:1aec:88fb with SMTP id
 u8-20020a0cec88000000b0069b1aec88fbmr9872064qvo.23.1713768779447; Sun, 21 Apr
 2024 23:52:59 -0700 (PDT)
MIME-Version: 1.0
References: <20240419-fix-cocci-v2-0-2119e692309c@chromium.org>
 <20240419-fix-cocci-v2-6-2119e692309c@chromium.org>
 <124e35b3-5b0d-4bd7-848a-5c848b339157@linaro.org>
In-Reply-To: <124e35b3-5b0d-4bd7-848a-5c848b339157@linaro.org>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 22 Apr 2024 14:52:43 +0800
X-Gmail-Original-Message-ID: <CANiDSCt34D8-Ys+DbEQM0SyFdBF4WoV5_+xuuCjVbf22kT0xfw@mail.gmail.com>
Message-ID: <CANiDSCt34D8-Ys+DbEQM0SyFdBF4WoV5_+xuuCjVbf22kT0xfw@mail.gmail.com>
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
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
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>, linux-kernel@vger.kernel.org,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Martin Tuma <martin.tuma@digiteqautomotive.com>
Subject: Re: [Linux-stm32] [PATCH v2 06/26] media: stm32-dcmipp: Remove
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

Hi Bryan

Thanks for your review

On Sun, 21 Apr 2024 at 07:15, Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 19/04/2024 10:47, Ricardo Ribalda wrote:
> > -     if (irq <= 0) {
> <snip>
> > -             return irq ? irq : -ENXIO;
> > -     }
>
> You're dropping the original intent of the driver author there no ? when
> irq == 0 they want to return -ENXIO.

platform_get_irq() can never return 0.
https://lore.kernel.org/linux-media/cd4aac19-c4cf-4db0-a18c-42f1bf1441a8@moroto.mountain/

Let me add that to the commit message.

Thanks!

>
> ---
> bod



-- 
Ricardo Ribalda
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
