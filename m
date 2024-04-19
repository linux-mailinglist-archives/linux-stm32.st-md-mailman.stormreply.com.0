Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B3718AABDB
	for <lists+linux-stm32@lfdr.de>; Fri, 19 Apr 2024 11:49:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D3BDAC7128E;
	Fri, 19 Apr 2024 09:49:47 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com
 [209.85.222.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E3C78C71289
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Apr 2024 09:49:45 +0000 (UTC)
Received: by mail-qk1-f171.google.com with SMTP id
 af79cd13be357-78f056f0a53so125561785a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Apr 2024 02:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1713520185; x=1714124985;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=H+ICFE9T0WtFgFxAAIzneJg+RkmVbFrs0mrpkqFICS0=;
 b=dETnDnrsfDYskUwUei0yxV4fgGZ6Gl/M/Iz65HYRDhnXaitzHPuGH3RYE0MaVDf0oF
 dbEO6/udjPkiawpDTWChuo0Q8fC94GSZZIo6iCk3J2+SR+LD9od/JtVnPJl32svgz80J
 +8ctcJRRnvD8KRU1lETgqKZrUB36dtZo+jVPk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713520185; x=1714124985;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=H+ICFE9T0WtFgFxAAIzneJg+RkmVbFrs0mrpkqFICS0=;
 b=lws1/zMak+CH+79SJxE2MbVsiG3xl5eOgm+ouT/ZZ0Yg9yI/7zFEodvTv9vbdcSfSW
 1r6IfTUJxosFCPCXWcgQi+cU7C8S671W5nDrDF6Nj+9zQS3bhyav+ALLq8xo/Lgwaaxo
 nb+OFXzFeJ8zj1yYwbcF45lBivBqvm8xPzD3JWv4q0ipdkuMutCDvlW3LIpKdpt6+79S
 kon2CrJXSLXblBSm611L+J7yBYEKCyRrbHt4jTEjzUTEsFt5LpBSBqE/Vj85dRfuL9E7
 u2h2/ypVC6bGqAulGmX5XTznItt8ysxwOETxMLqWMa1z9yZ6NtR462L6XnxFXJTx0gnm
 y4+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWk66ai+ABVll0PIIrA7tebcwBhRqB9jC0BurFO7xrJ61yi5+7iZLzsNOYHseuaaLyMz+GB4b3OL2L4huJDNAJl3me8Mi3Xs/cHfxC7amr8zn+DTkwuH/xr
X-Gm-Message-State: AOJu0YyU4TIxWIOGak/SDCHFPb8r/hcAiOdFChdlAaPYRRjbMwMvJlB+
 O+8Zcoa7zrosPCl3dKQ9EGkj+tZqf/VNTSpEZhih2aZlKEHNC6I5+K5u4AjY6w==
X-Google-Smtp-Source: AGHT+IHphQGghhdnaPa8294fBxI47z+y4xb3Msllejvsy/cEZHbt70Y742XZJgUuOJUmQOPF+5kWGQ==
X-Received: by 2002:a05:620a:1673:b0:78a:33f9:908c with SMTP id
 d19-20020a05620a167300b0078a33f9908cmr1816540qko.36.1713520184948; 
 Fri, 19 Apr 2024 02:49:44 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com.
 [35.245.152.114]) by smtp.gmail.com with ESMTPSA id
 dt14-20020a05620a478e00b0078d735ca917sm1434532qkb.123.2024.04.19.02.49.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Apr 2024 02:49:44 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 19 Apr 2024 09:48:08 +0000
MIME-Version: 1.0
Message-Id: <20240419-fix-cocci-v2-22-2119e692309c@chromium.org>
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
Subject: [Linux-stm32] [PATCH v2 22/26] media: tc358746: Use the correct
	div_ function
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

fin does not fit in 32 bits in some arches.

Found by cocci:
drivers/media/i2c/tc358746.c:847:2-8: WARNING: do_div() does a 64-by-32 division, please consider using div64_ul instead.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/tc358746.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/i2c/tc358746.c b/drivers/media/i2c/tc358746.c
index d676adc4401b..edf79107adc5 100644
--- a/drivers/media/i2c/tc358746.c
+++ b/drivers/media/i2c/tc358746.c
@@ -844,8 +844,7 @@ static unsigned long tc358746_find_pll_settings(struct tc358746 *tc358746,
 			continue;
 
 		tmp = fout * postdiv;
-		do_div(tmp, fin);
-		mul = tmp;
+		mul = div64_ul(tmp, fin);
 		if (mul > 511)
 			continue;
 

-- 
2.44.0.769.g3c40516874-goog

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
