Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IKukK1SJw2m6rQQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 25 Mar 2026 08:05:56 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4302432068E
	for <lists+linux-stm32@lfdr.de>; Wed, 25 Mar 2026 08:05:56 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B9B2BC8F285;
	Wed, 25 Mar 2026 07:05:55 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B635CC87EC5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Mar 2026 18:28:25 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id
 98e67ed59e1d1-35a1d4a095bso113201a91.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Mar 2026 11:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1774376904; x=1774981704;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=7jbYoDFFKwnOMKQiaSrjwW8IJ/VZkZBU3IOohjNwPSU=;
 b=PW3y8zEzoSTgUzhiMazf4u8Pio5/e63zfIsADrb68LdttEz+uy0XTbb9ra0ejZcMfd
 NukinqsAE3K5TsXsEh0prgGo8jthHhc6xI/aE4ia6xAC67zSJ80oBx/rBt7SQ1BqfYEM
 dss6GJcUlR0n1LLdyC6O1TU2ZwRGArabfO1mmvadrZG4Z96Qj5mC7xkTojILG/jPiKKn
 Q4DQsQrXFr9O77HJQw90p6sCGk6I4R3biQfhUqsJPBCOhe07f/W2zEtSfes7owE50Pml
 g09W9nNl/zOom+/Qc18RAUh0ubBClciWVZzFVgyimxXAajV4/F6gm58XU3Dk/QnHZyxk
 y6dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774376904; x=1774981704;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=7jbYoDFFKwnOMKQiaSrjwW8IJ/VZkZBU3IOohjNwPSU=;
 b=eetwguXpN442J88hvD9HUsd9ffKYmY/5rTq3PCchPhsVugKFs4Iko2QWTj9N4KpSaJ
 2c4OS0s3FBxk5vWHoR7U7mRN3LVyUWuwxgi1xW1aDhF5929Q8+TO3jSWzKF/WdOYzFwr
 OeWI3p0y2MwVwxNAoAf2vrDOevWnN4NNm43Q0qAm7DyXlvqbhNZqGgKGBEfNdM+nPtdj
 SqLADKyc69K3Ly6w2IPZeUFU8dh/q0v6QzHcQbQheU9Ab9ymbJLmOOY6FchmOZI6XxBQ
 kPLgrfqEmqSUZvDsU8uTECxZwr4FX+vAINczF3q309O/YeIHCWRD2zWI9MlFAV2GwwKj
 HqdQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVTfLe6SyLmKjO34AEmusPXp0dcxSoYkTeuUDWUr6QJRAJBxX1uBTU7dSdZGgPTBsAeJ8VabiJwPSQ78Q==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw/9iSlIq/bEkS7afDAJy4guj4ts3ooS5cysKlyp0ah3inQ2TFU
 n4RE0ykuX4BhUHCIOfNHa92MLzflzzOI+1jyIYEvgEm4FSA7GRQyRogv
X-Gm-Gg: ATEYQzwQY2opmpdPLWRrwIST+AGHsdglFyD/NV2hFpxPUjF3EmOqiGZMfyvB+KbAz08
 +wTwyk2Ak9oFla5lT7xH5BiXbFl9FK27/W1k+W4UxfziooSff/YXzqc5iyaTcoA0/Ves+M/urwB
 HezqgNYeSquNHDjOM6RM8DovCXhl7ND7ziTzoNteviXh82UV5p+PnN/lI4zqqctTgovZL5irK1J
 qqbG9QxKMgKrFUbu26U9w26B8pRj69cuLnHJe80KoRKXT26yOYNaQpsUl6dk30s6/oCkBjLPMsY
 VsEGK+LRchpvp4jUlouGidIx3+OnsQduakOY3h3x5nNa64OFmXF10piZcuhsK4fPkifwPAsD1II
 eFyJq2W1UvTX2LpgInksnfWuFOp7xVBJErvMhGeLzhTM8W6y3UOQNVn2q/hn3PD14NZDUKqoT0t
 OcJ8hf3cV3y4T+pLgON76FYXJ5hA==
X-Received: by 2002:a17:90b:3c07:b0:35b:a0f0:8327 with SMTP id
 98e67ed59e1d1-35c0d1001a9mr618620a91.2.1774376904310; 
 Tue, 24 Mar 2026 11:28:24 -0700 (PDT)
Received: from [127.0.1.1] ([103.216.213.160])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-35c0d6060b5sm350576a91.17.2026.03.24.11.28.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Mar 2026 11:28:23 -0700 (PDT)
From: Atharv Dubey <atharvd440@gmail.com>
Date: Tue, 24 Mar 2026 23:56:55 +0530
MIME-Version: 1.0
Message-Id: <20260324-deverr-v1-7-7e591cce33a3@gmail.com>
References: <20260324-deverr-v1-0-7e591cce33a3@gmail.com>
In-Reply-To: <20260324-deverr-v1-0-7e591cce33a3@gmail.com>
To: Till Harbaum <till@harbaum.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Laxman Dewangan <ldewangan@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>, 
 Alain Volmat <alain.volmat@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, Jean Delvare <jdelvare@suse.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774376818; l=2664;
 i=atharvd440@gmail.com; s=20260314; h=from:subject:message-id;
 bh=QTq/SsBBXUdzBzLen+lO5rBpYhODcjwD4XTKabWXWjM=;
 b=6uYv7INtZBtXz/5CGPPLnmZfr7dOa2FHZwl9/oOHXGn01WGXqmOPkElSojC2emL6vTKD8y1gU
 mA1lXC4EoXKCgHD1s/6elwyP7MOynX9ePlEaoKUiP69Jyq2pL/sIZCs
X-Developer-Key: i=atharvd440@gmail.com; a=ed25519;
 pk=T6i1xWOKT/RUSDYATSgyVG/4X7ac8jPjRSG1mMAcqVk=
X-Mailman-Approved-At: Wed, 25 Mar 2026 07:05:52 +0000
Cc: linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
 Atharv Dubey <atharvd440@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Enrico Zanda <e.zanda1@gmail.com>
Subject: [Linux-stm32] [PATCH 07/10] i2c: st: Replace dev_err() with
 dev_err_probe() in probe function
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
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:till@harbaum.org,m:andi.shyti@kernel.org,m:ldewangan@nvidia.com,m:digetx@gmail.com,m:thierry.reding@gmail.com,m:jonathanh@nvidia.com,m:wens@kernel.org,m:jernej.skrabec@gmail.com,m:samuel@sholland.org,m:pierre-yves.mordret@foss.st.com,m:alain.volmat@foss.st.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:patrice.chotard@foss.st.com,m:orsonzhai@gmail.com,m:baolin.wang@linux.alibaba.com,m:zhang.lyra@gmail.com,m:jdelvare@suse.com,m:linux-kernel@vger.kernel.org,m:linux-sunxi@lists.linux.dev,m:linux-i2c@vger.kernel.org,m:linux-tegra@vger.kernel.org,m:atharvd440@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:e.zanda1@gmail.com,m:thierryreding@gmail.com,m:jernejskrabec@gmail.com,m:mcoquelinstm32@gmail.com,m:zhanglyra@gmail.com,m:ezanda1@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[atharvd440@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[harbaum.org,kernel.org,nvidia.com,gmail.com,sholland.org,foss.st.com,linux.alibaba.com,suse.com];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[atharvd440@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.linux.dev,gmail.com,st-md-mailman.stormreply.com,lists.infradead.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	NEURAL_SPAM(0.00)[0.951];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 4302432068E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Enrico Zanda <e.zanda1@gmail.com>

This simplifies the code while improving log.

Signed-off-by: Enrico Zanda <e.zanda1@gmail.com>
Signed-off-by: Atharv Dubey <atharvd440@gmail.com>
---
 drivers/i2c/busses/i2c-st.c | 34 ++++++++++++++--------------------
 1 file changed, 14 insertions(+), 20 deletions(-)

diff --git a/drivers/i2c/busses/i2c-st.c b/drivers/i2c/busses/i2c-st.c
index 751ea421caaf..3f89c2145741 100644
--- a/drivers/i2c/busses/i2c-st.c
+++ b/drivers/i2c/busses/i2c-st.c
@@ -775,17 +775,15 @@ static int st_i2c_of_get_deglitch(struct device_node *np,
 
 	ret = of_property_read_u32(np, "st,i2c-min-scl-pulse-width-us",
 			&i2c_dev->scl_min_width_us);
-	if ((ret == -ENODATA) || (ret == -EOVERFLOW)) {
-		dev_err(i2c_dev->dev, "st,i2c-min-scl-pulse-width-us invalid\n");
-		return ret;
-	}
+	if ((ret == -ENODATA) || (ret == -EOVERFLOW))
+		return dev_err_probe(i2c_dev->dev, ret,
+				     "st,i2c-min-scl-pulse-width-us invalid\n");
 
 	ret = of_property_read_u32(np, "st,i2c-min-sda-pulse-width-us",
 			&i2c_dev->sda_min_width_us);
-	if ((ret == -ENODATA) || (ret == -EOVERFLOW)) {
-		dev_err(i2c_dev->dev, "st,i2c-min-sda-pulse-width-us invalid\n");
-		return ret;
-	}
+	if ((ret == -ENODATA) || (ret == -EOVERFLOW))
+		return dev_err_probe(i2c_dev->dev, ret,
+				     "st,i2c-min-sda-pulse-width-us invalid\n");
 
 	return 0;
 }
@@ -808,16 +806,13 @@ static int st_i2c_probe(struct platform_device *pdev)
 		return PTR_ERR(i2c_dev->base);
 
 	i2c_dev->irq = irq_of_parse_and_map(np, 0);
-	if (!i2c_dev->irq) {
-		dev_err(&pdev->dev, "IRQ missing or invalid\n");
-		return -EINVAL;
-	}
+	if (!i2c_dev->irq)
+		return dev_err_probe(&pdev->dev, -EINVAL, "IRQ missing or invalid\n");
 
 	i2c_dev->clk = of_clk_get_by_name(np, "ssc");
-	if (IS_ERR(i2c_dev->clk)) {
-		dev_err(&pdev->dev, "Unable to request clock\n");
-		return PTR_ERR(i2c_dev->clk);
-	}
+	if (IS_ERR(i2c_dev->clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(i2c_dev->clk),
+				     "Unable to request clock\n");
 
 	i2c_dev->mode = I2C_MODE_STANDARD;
 	ret = of_property_read_u32(np, "clock-frequency", &clk_rate);
@@ -829,10 +824,9 @@ static int st_i2c_probe(struct platform_device *pdev)
 	ret = devm_request_threaded_irq(&pdev->dev, i2c_dev->irq,
 			NULL, st_i2c_isr_thread,
 			IRQF_ONESHOT, pdev->name, i2c_dev);
-	if (ret) {
-		dev_err(&pdev->dev, "Failed to request irq %i\n", i2c_dev->irq);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "Failed to request irq %i\n", i2c_dev->irq);
 
 	pinctrl_pm_select_default_state(i2c_dev->dev);
 	/* In case idle state available, select it */

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
