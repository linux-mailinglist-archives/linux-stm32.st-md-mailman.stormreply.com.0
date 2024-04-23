Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A4358AE688
	for <lists+linux-stm32@lfdr.de>; Tue, 23 Apr 2024 14:43:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 27486C7128B;
	Tue, 23 Apr 2024 12:43:55 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 356FDC7128A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Apr 2024 12:43:53 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-3476dcd9c46so4226803f8f.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Apr 2024 05:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713876232; x=1714481032;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+qnKAwgvBHM35XCDpuBit4GUKItb+LTK0jOfybUvb7k=;
 b=qjOMAoeIQzqOvnEAyRjqegt9JWui9t/baarNEPNY5uUwj+0I1vH9bDbQd44HQztsb6
 9xqSJpST5BJ42cYOwXvo9pY0WMy8Iw8MAC2+NY5BiEjoOnZnHHYedMB+UY09r0/qHW4Q
 EChDfEgW91yR6TUd0nGOZLJSk8TKJQKl0FPPQXk1033js+PiVSXqieO9uzkTmKWQF2sW
 s2O/4lm0zyI4D13Wu9D7QZLpc6ZpJwDMJF/CcWPULHxNEifDU8/gIHQ52Sgz77KrT19B
 03jRaKwZHx6uVCfNN1kvEfG5wPxiN5tyskSHZiK10dQt+x+0NoY/Ii0p8AjSHWK/Q/vZ
 y6Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713876232; x=1714481032;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+qnKAwgvBHM35XCDpuBit4GUKItb+LTK0jOfybUvb7k=;
 b=p2E4i20V/A8dHtkMJ4VjEt2+hNBPDXIxb6wEId3SYXawUFgibu0bao2uwDSACjZcH+
 odZBNgp5jwSKJNy4zH/j2BUZ5Iu14bt/gwNxQcgRz96ip92qUamUBJsu9XhL+9jcBQnc
 csU8mnkNmnSaswNM+fjasr75WcsgssbnJM9j+GybrTvetxPNpBfnDBqL7AY/blYqEytQ
 3YJ/gZzU6U5OZIa+mWZjcwAisPCQRdakb4wffuN9yvi6VriYwe40YYV/z0IGW4Cgpssn
 UuPoXdeSti4eIonrzbAWPPEGGaCYSvpyvNwRac6EsjwD4WeU6Z7jQ2UlopNFTfoFCWZC
 a4QA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUnKEvWhucMwHKtIteH1BqrZ4u7YQeq2mdjPwt4RKYvqhOlU/0sk3EG68hiUhMPPX0kpQIidIzu/99Nmwj43y12tWt8Dbty3TtONpJ4CntWprBVlgpagX6P
X-Gm-Message-State: AOJu0YwNFSHlAAa1T2CqX/pCnb19BBeeSBORIrQQrL8qE85NW+HyPUfC
 95iwRsEt7LClvA3eDM9W5gtW/6kFy/+aJf9ywRcE/UermHY9pHxGYu80nUJJkRY=
X-Google-Smtp-Source: AGHT+IHx5NN+z23VludiFeHTrKmrJCe4gLG+r1lTx6C4j7QEMysWQLMdtEpvLnQqAlOL1NQMbBj3Zg==
X-Received: by 2002:a5d:6a8d:0:b0:34b:5caf:6342 with SMTP id
 s13-20020a5d6a8d000000b0034b5caf6342mr2073298wru.67.1713876232556; 
 Tue, 23 Apr 2024 05:43:52 -0700 (PDT)
Received: from [192.168.0.102] ([176.61.106.227])
 by smtp.gmail.com with ESMTPSA id
 r16-20020a5d6950000000b003477d26736dsm14506412wrw.94.2024.04.23.05.43.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Apr 2024 05:43:52 -0700 (PDT)
Message-ID: <d13fd47e-1ecd-4aa8-844b-cd260e9fa437@linaro.org>
Date: Tue, 23 Apr 2024 13:43:49 +0100
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
 <20240415-fix-cocci-v1-11-477afb23728b@chromium.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240415-fix-cocci-v1-11-477afb23728b@chromium.org>
Cc: linux-arm-msm@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 11/35] media: s2255: Use refcount_t
 instead of atomic_t for num_channels
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
> Use an API that resembles more the actual use of num_channels.
> 
> Found by cocci:
> drivers/media/usb/s2255/s2255drv.c:2362:5-24: WARNING: atomic_dec_and_test variation before object free at line 2363.
> drivers/media/usb/s2255/s2255drv.c:1557:5-24: WARNING: atomic_dec_and_test variation before object free at line 1558.

Hmm, that commit log needs more detail.

"Convert from atomic_t to refcount_t because refcount_t has memory 
ordering guarantees which atomic does not, hence the WARNING for the 
free after the atomic dec."

Something like that.

I'll leave it up to yourself to decide if this warrants a Fixes:

I don't think so myself because the previous code doesn't seem to matter 
to the decrement and free.

---
bod
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
