Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B8EE8AABC8
	for <lists+linux-stm32@lfdr.de>; Fri, 19 Apr 2024 11:49:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1EA6CC7128A;
	Fri, 19 Apr 2024 09:49:32 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
 [209.85.222.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 304D6C71288
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Apr 2024 09:49:29 +0000 (UTC)
Received: by mail-qk1-f172.google.com with SMTP id
 af79cd13be357-78f05035f56so119368185a.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Apr 2024 02:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1713520168; x=1714124968;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=/qUCWhD1zt8bKcdbs6yESnMSEdigGZ2fB7xO4uH5zQE=;
 b=GtZMNJL0GowGaoiFBMPC5QuG3q2FfiRtueSY5Wg20wATKdV9CSGsLGZKEmXarbdm5/
 EOkLvV9DRMfWwPN7JN90lAC6ZWXWHjpWhmcH/vWCsEM3kTZ5uXAX+xj92UHDzRAN+mS3
 f0pMa5Ma1hPha/Gl/l6OXUHuzH9tInUYLgMEE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713520168; x=1714124968;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/qUCWhD1zt8bKcdbs6yESnMSEdigGZ2fB7xO4uH5zQE=;
 b=MHciIQ/5w57tfu0QruBfpN8pokEuAdu5G80k1tby79IFoIUGiSimdoAhh2eTtvpj+8
 Znhw2ZGPZuwc4FA5XOsmhtUKi3DQLiKdN7Ul4n36bLCyjO93WfmR6awQctTrH9MncZ3e
 373JImE5fmpez+WAUf/x2cLkPkZVy+EziK8DjtP0a3Na5Qt3Bt49LfeONaU+jcnYArgR
 xMvUaCghQp8o0wZ5TSuP/GfqDcdhC2xJiQA3I9pLpo5AZ3DWtPssQ9boG224nEr01pgX
 xLaWTZMRhQSSETARmPj3uoEle0H2bXdTm+2o9Ypl+cUUt4LxkrPmMHbyF0sRCXqxRjTV
 2fGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWzS463cdq1oHCYTtdCpQevkgRdMkx6CJhMA81U2PIXsaPm+GCoRFTpWLFA6XbBQvFsnOgwon9W+Zj9l3/uIoiL/SL4IeN3rgafRxGxvEc9/d9kiJMtfJ9s
X-Gm-Message-State: AOJu0Yxn5CkR3J6B7nEdeBDiaLrOVY8mEGtbggq4OOPJrXc4Plgd6Pm5
 U2LA2iLqwhgWuiBa4fZpGfIYcabABbujjjY2TLkiFrBrRRDw3dp/83ETxkTnxw==
X-Google-Smtp-Source: AGHT+IGrWT0O4AGlUln/2gm+WlWRdrbCZXYUSj9v1TAvaCupc//lNt4+QKq4Vo16BjNxQ14XM/vY2A==
X-Received: by 2002:a05:620a:4083:b0:78e:db2f:2726 with SMTP id
 f3-20020a05620a408300b0078edb2f2726mr1792928qko.51.1713520168153; 
 Fri, 19 Apr 2024 02:49:28 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com.
 [35.245.152.114]) by smtp.gmail.com with ESMTPSA id
 dt14-20020a05620a478e00b0078d735ca917sm1434532qkb.123.2024.04.19.02.49.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Apr 2024 02:49:27 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 19 Apr 2024 09:47:53 +0000
MIME-Version: 1.0
Message-Id: <20240419-fix-cocci-v2-7-2119e692309c@chromium.org>
References: <20240419-fix-cocci-v2-0-2119e692309c@chromium.org>
In-Reply-To: <20240419-fix-cocci-v2-0-2119e692309c@chromium.org>
To: Martin Tuma <martin.tuma@digiteqautomotive.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hugues Fruchet <hugues.fruchet@foss.st.com>, 
 Alain Volmat <alain.volmat@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
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
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.4
Cc: linux-arm-msm@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-mediatek@lists.infradead.org, Ricardo Ribalda <ribalda@chromium.org>,
 linux-tegra@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH v2 07/26] media: staging: sun6i-isp: Remove
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

platform_get_irq() already prints an error for us.

Found by cocci:
drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c:389:2-9: line 389 is redundant because platform_get_irq() already prints an error

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c
index 5c0a45394cba..58f8ae92320d 100644
--- a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c
+++ b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c
@@ -386,8 +386,7 @@ static int sun6i_isp_resources_setup(struct sun6i_isp_device *isp_dev,
 
 	irq = platform_get_irq(platform_dev, 0);
 	if (irq < 0) {
-		dev_err(dev, "failed to get interrupt\n");
-		ret = -ENXIO;
+		ret = irq;
 		goto error_clock_rate_exclusive;
 	}
 

-- 
2.44.0.769.g3c40516874-goog

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
