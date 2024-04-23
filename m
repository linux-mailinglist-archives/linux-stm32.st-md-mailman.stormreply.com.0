Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C718AE6B2
	for <lists+linux-stm32@lfdr.de>; Tue, 23 Apr 2024 14:46:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5CA06C7128A;
	Tue, 23 Apr 2024 12:46:38 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D096DC57194
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Apr 2024 12:46:36 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-34b3374ae22so1810245f8f.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Apr 2024 05:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713876396; x=1714481196;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SnPvo8X71/HjmVfrFSADYDRaBhD7wOKAzatHqFXk968=;
 b=eU1ZKCFw+9twQ9HwCO5XttqSLejbGXIWP/9iPDJo1EOUxzqnY1OCL1j/XczEOSw1sx
 VOFk/M5ib2SJTqWuHyrSfIRyR60J/3081B6PwDsuSL6BAqbkBZFKYr38q+rt3P1RIeqO
 EXbPrfT7zLE9EQES01eTYPNhKEOrmFdWLYMXpiYj2W/q6bkWLvqBtaMjY3Lm6GqyYdk2
 PMQ9/ZMZyuFdF/BRAuyyjoHf0TUYM1pDWv7yXKXIZaIKdr+dmM8+vUtM/VqipIUzYkFc
 56umFSke4b3LJljzpaZGmWJQD7JRWJrGju2rfuZqlUHDd0ZxGyDH3CsdTM88UT3639WZ
 /Rww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713876396; x=1714481196;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SnPvo8X71/HjmVfrFSADYDRaBhD7wOKAzatHqFXk968=;
 b=Rymdm9gF29yKxIQEC2qZoTpR6XEP27aGoO8a8jwW2T0nKf+C7CP5ue85Pz7nERGtY4
 gnayUKqQmcZSV+CXJq1oqETpiURDgTLSBOeBjkksJipwekmKJF/rvphXV6MMq2SPjuiP
 5G//BRATl18FQVHdzITnXI9ObUtiY1+7RTYHDqYm9FrqAadLnlhSgfncMaE/t9xfqams
 TiDghBLShT6ZecLtevMfPHRlVU/N/dk42T0BixmFREpHQlVrnsmnruMo146k/onn9/DZ
 7jIYtHK9azQ2fo5cl82ACMQVqSPEjwSCodxBsBEDbUCRSVfzfPEum6tqvIAaCeTF2mCr
 0B4A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXN65vYKb1mXMXREqT2lX1htE+PisDv91g1I2d3Re8IbKwGkPJIQgzMypxdpuYHjgOrN3Ep/dmsIbdmgpoXpmFKXGfVkDrsgiJQR62WqDknsxmOVRtPb38H
X-Gm-Message-State: AOJu0YyzzrF5vRdPzDgclDY5wN3a9BYLKUE1pyj/vDnLTwl6nixKCJsu
 np9e4SVld852sA//oftHMLYWmw3Ox/USq2JFSjDpQHWH7drKFNz6bhwsIYfjBzU=
X-Google-Smtp-Source: AGHT+IG+1vx5mJkN+16nkw6DrmjKX/bCAbSI7iHWCeWcx9NCAuHfmO/i6PUYzl4PV0Sl6Y/Ow1sbhA==
X-Received: by 2002:adf:b197:0:b0:349:f83f:9ebf with SMTP id
 q23-20020adfb197000000b00349f83f9ebfmr11081490wra.5.1713876396189; 
 Tue, 23 Apr 2024 05:46:36 -0700 (PDT)
Received: from [192.168.0.102] ([176.61.106.227])
 by smtp.gmail.com with ESMTPSA id
 y7-20020a5d6207000000b00346f9071405sm14531796wru.21.2024.04.23.05.46.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Apr 2024 05:46:35 -0700 (PDT)
Message-ID: <44d6ab8c-3810-46ac-8e54-c125b5c29199@linaro.org>
Date: Tue, 23 Apr 2024 13:46:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Ricardo Ribalda <ribalda@chromium.org>,
 Martin Tuma <martin.tuma@digiteqautomotive.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
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
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Pavel Machek <pavel@ucw.cz>
References: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
 <20240415-fix-cocci-v1-12-477afb23728b@chromium.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240415-fix-cocci-v1-12-477afb23728b@chromium.org>
Cc: linux-arm-msm@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 12/35] media: platform: mtk-mdp3: Use
 refcount_t for job_count
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

On 15/04/2024 20:34, Ricardo Ribalda wrote:
> Use an API that resembles more the actual use of job_count.
> 
> Found by cocci:
> drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c:527:5-24: WARNING: atomic_dec_and_test variation before object free at line 541.
> drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c:578:6-25: WARNING: atomic_dec_and_test variation before object free at line 581.

Same comment here as per the previous patch.

You should explain in terms of the memory ordering that refcount_t gives 
so that the intention of the WARNING and the API change is well 
communicated.

---
bod

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
