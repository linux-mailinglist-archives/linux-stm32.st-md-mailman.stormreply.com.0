Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 55BBA8AF47A
	for <lists+linux-stm32@lfdr.de>; Tue, 23 Apr 2024 18:42:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 10193C6DD6D;
	Tue, 23 Apr 2024 16:42:57 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 13032C57194
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Apr 2024 16:42:55 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4196c62bb4eso31919555e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Apr 2024 09:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713890575; x=1714495375;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AAjd9LkEDNuVK7j7GhyFYBnO65hiE7cXAXMhivu0jgk=;
 b=fdVdc+ltiU0SwjDU508ZpaSfxrdEjCqsE/YDm1Ojm32lqNZuT4a/9C7ZA/tslyX4+8
 uPtgMsOFGw4WbAUbnuGcN7nu5jXs5gFQ937wtA4oO+ldZ4GNw2QAC9gJ2ljC9jGrEZDx
 nr41nWySy3PZB1GtS/EztV+zA0us7mY36de1GxtzhLvbQCcWrebcSvEP+seI6xk0j7we
 vztTC+/FPv2SWdwE0wAH8ux4hBVuLm2MJhrYaJpGgGirOBBv7uyibwVfQ9K0KKb6ek5Z
 Vahn2AvdrhBJBdqFygzMs4k2yCNc9teztjKG7HWj2Y8KFDqvHIv+UpY1AdHD4+JQOrdh
 bG6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713890575; x=1714495375;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AAjd9LkEDNuVK7j7GhyFYBnO65hiE7cXAXMhivu0jgk=;
 b=hrXWnNeMdHg3ReKctdUPAh265AQcQXwxUV5l2FM4BZWnsRN5bwKPPdHCtkuOsbko0R
 +8p3RyGhus7Hswliw4nc52MgO9pun786gFkN8AelgCWtQpRHj5qdaQGLS1esr8xS2Ra7
 3M+A9GdiT8/9IyPyAwZzs/pQbX4+Rne/8TGlgDatKZ76DQmurYOz3GZlIOPylZsYiiQt
 zZslUnZ9H2Z51ix+xWdA3HyJzxGD8TMK2eU/uB8tsYbyc4u1gX1xJiu8rA0x1S66Ybxx
 CI/fQEaXQmGe7yfV3yeVCpXs0u7c2K2QaN6QzG53gn7dkOQIc4AarT3tw7B2bt4XPAp+
 4d1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQl42HEkAXydfJKvbXEZVxB1tEBHSpdSgWshJ2ZKJtnzxGuLhhFP5wAJkBhctcJAsLKnj4ApQ4H7qr5zSNy4nWAwNrOMzSwbd72YLHkersUmiRsTDhOYwO
X-Gm-Message-State: AOJu0YyS1kRW8kiIa5FYxMZx7ZTz5QhiFClTShPjs3CB6JSc5RGPOfLq
 RJiNCf9+J57yn/KOWQ5R/yBI08x+qoziZTHn2zstpKgDjNBD3cybV09amqr0CQ0=
X-Google-Smtp-Source: AGHT+IFrxYPbNd0JIn8yeAWouLUX4KO2HR4fWg0b0VJjkA0zy4qA+fxtUoj+497CZ/NN5m4uB+meNA==
X-Received: by 2002:a05:600c:1c9e:b0:418:a5fc:5a5b with SMTP id
 k30-20020a05600c1c9e00b00418a5fc5a5bmr10146720wms.36.1713890575406; 
 Tue, 23 Apr 2024 09:42:55 -0700 (PDT)
Received: from [192.168.0.102] ([176.61.106.227])
 by smtp.gmail.com with ESMTPSA id
 jg1-20020a05600ca00100b004183e983d97sm20619705wmb.39.2024.04.23.09.42.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Apr 2024 09:42:54 -0700 (PDT)
Message-ID: <3f5c46bc-6fe8-45a4-8929-7b93b276478f@linaro.org>
Date: Tue, 23 Apr 2024 17:42:53 +0100
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
 <20240415-fix-cocci-v1-19-477afb23728b@chromium.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240415-fix-cocci-v1-19-477afb23728b@chromium.org>
Cc: linux-arm-msm@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 19/35] media: stk1160: Use min macro
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
> Simplifies the code.
> 
> Found by cocci:
> drivers/media/usb/stk1160/stk1160-video.c:133:12-13: WARNING opportunity for min()
> drivers/media/usb/stk1160/stk1160-video.c:176:13-14: WARNING opportunity for min()
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Show the commit log some love, then add

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

For patches 16 through 19.

---
bod

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
