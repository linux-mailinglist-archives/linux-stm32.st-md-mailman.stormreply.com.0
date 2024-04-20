Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F758AC445
	for <lists+linux-stm32@lfdr.de>; Mon, 22 Apr 2024 08:33:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5D6CCC71292;
	Mon, 22 Apr 2024 06:33:58 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BF2EDC6B47E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 20 Apr 2024 23:15:57 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-417f5268b12so33930385e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 20 Apr 2024 16:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713654957; x=1714259757;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kQknuL+r9cbmTtmVlTx7T5fh7q9KKWBimZWASaRekHw=;
 b=SSu5FYpEMBWc8ug4smYZZUIJFzij/pXxjSHGNtaVIWwP3mAr/xstxU1SP1SLj6JFpo
 oCZo7SDhJ580v/a16WgDdOQx12tm/jeYHdLCVzR4BxmW3pW7wUXNIL3lGr3qtikeK3+v
 xPVu8FLCSSTTze6EoFmM+nXLBZHsvJV/wUW5pguKsyal4X7FnYOm3PNnWmc9R+XZr7fK
 vBlRzxtJjarbWY+4Ov2RsB5N66H7jUhqrkpAbPWmTMeqPQIp14d5BZS2GDJNxtODWSDD
 NmbqaA9dioKpZwco0ThwqCH0kEvvsKZqDq1UCMfd4OsXEy7eDrylQUe3EaRQMtYEGfWf
 UQ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713654957; x=1714259757;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kQknuL+r9cbmTtmVlTx7T5fh7q9KKWBimZWASaRekHw=;
 b=A9bYTSkJykedX0+wUbV9J3qjleg7AYg3SWGBBZh/kXhC1+/Vm4nYXAYuOTIqdmhnmL
 frC9HDNriiaSRlG7iMEucPmCR9Zpf2yEjFCmP5kk/hW3C//7ZGGfgCYFxrGCsaa+rduf
 3thfvrtUGNPlfAo0AFpF3YxNAUTYFKxj5pWeymZVroTgAyviq+2rvGyTaqyeMDqSin5h
 Ur0g3W2nfA3C2uQnMoDU6/3FqgofW8qX30EGzYFzrEpRBr1Lv1THv7qUVFKnLEUYIH8d
 S8pe1IBgtkMvSfGcH4yjZDtjmmrtc6biU8eAaNweMWuL5vPTZJad5wWeMVmdC4W9Xp6/
 55mw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU56OPyA9hLQZfdBoVLv4dAK/sczW8EbLb+r7YSklSUoVgl9srmCS67I4lO6nb3xrWcvlBZ7ut3Wc0s/gxBsJVZHYTqNdMljfrO8pfsYVBcUvrbQBgPU8Ky
X-Gm-Message-State: AOJu0Yw4+rtc1Tj9Ipi3yS2FO+pAnZHwMlJTkeqReLWuF1VKrNlZ+S3R
 wESg9QmX2gmdoNtniJqNqLPGokEtscY9VCkucJNsHM9zZ6q1tFm3gAV+VLtJ2NU=
X-Google-Smtp-Source: AGHT+IEJ0pmo+Vbh8mjcD98mOO7pRnAuIGNTQ6Q1qc2nTTg8q3KESPbMSdkxwInYUTYo3kcHGC3OsQ==
X-Received: by 2002:a05:600c:5486:b0:419:f497:632f with SMTP id
 iv6-20020a05600c548600b00419f497632fmr1710464wmb.29.1713654957220; 
 Sat, 20 Apr 2024 16:15:57 -0700 (PDT)
Received: from [192.168.0.102] ([176.61.106.68])
 by smtp.gmail.com with ESMTPSA id
 q2-20020adfab02000000b00349d8717feasm7913040wrc.56.2024.04.20.16.15.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 20 Apr 2024 16:15:56 -0700 (PDT)
Message-ID: <124e35b3-5b0d-4bd7-848a-5c848b339157@linaro.org>
Date: Sun, 21 Apr 2024 00:15:55 +0100
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
 <20240419-fix-cocci-v2-6-2119e692309c@chromium.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240419-fix-cocci-v2-6-2119e692309c@chromium.org>
X-Mailman-Approved-At: Mon, 22 Apr 2024 06:33:57 +0000
Cc: linux-arm-msm@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 19/04/2024 10:47, Ricardo Ribalda wrote:
> -	if (irq <= 0) {
<snip>
> -		return irq ? irq : -ENXIO;
> -	}

You're dropping the original intent of the driver author there no ? when 
irq == 0 they want to return -ENXIO.

---
bod
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
