Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 56EE07ED525
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Nov 2023 22:01:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DC319C6C837;
	Wed, 15 Nov 2023 21:01:13 +0000 (UTC)
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com
 [209.85.160.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BA550C6B47D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Nov 2023 21:01:11 +0000 (UTC)
Received: by mail-oa1-f52.google.com with SMTP id
 586e51a60fabf-1f060e059a3so25860fac.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Nov 2023 13:01:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700082070; x=1700686870;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yeu2Yqk+1W7JwaGj7n+VfzHpUfLi9VX9pa9cQ1fxjWY=;
 b=KAIbo3sNbX3UniYS7Lc9R2VYjDjlstuPr4sLzbMPnNSvhXm2uiHd8lEnec62ay1x/u
 7olYlJ+pkDw6Gv3yccqNlUcTj9iUGDGt0Ak8HVV1ITKXp/QZToTc73VDyQumyTJSU+FV
 cWJoPdh8AhPZLqbT3C/bbHgRFVluL0sY8LxTsIXgGTwYy29M0ArrvdowJcR+uOKCv+SW
 K7LNYI5/eI4oHh6l85xfm9yprclnY2n0ZJlGoGGFaSTPqlXpgpe8TDedu1DwO3ZYIHV7
 7WPWo3Phf7VTTmggn1Td9ivzro7oZ30g+V8wgc68C3R6cywh7FaPufAyHan9azhPO3DI
 n9mA==
X-Gm-Message-State: AOJu0Yxqf98f0b9d03njCXOLUAnrOG84UCr2AMEZvabKb7be5LzymZIh
 2QDDIRuWTTk+A8UDqWQBkA==
X-Google-Smtp-Source: AGHT+IEVvxd3MCaCvVBahCTroW9oJyYWp33cFwoR5qhRxQiQVxo5B8PsmQhF/yPdTGut1NK8vIwcew==
X-Received: by 2002:a05:6870:c1d1:b0:1e9:c18b:b2da with SMTP id
 i17-20020a056870c1d100b001e9c18bb2damr18542152oad.18.1700082070487; 
 Wed, 15 Nov 2023 13:01:10 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 bs14-20020a056830398e00b006ce1f9c62a1sm692803otb.39.2023.11.15.13.01.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Nov 2023 13:01:09 -0800 (PST)
Received: (nullmailer pid 3738084 invoked by uid 1000);
 Wed, 15 Nov 2023 21:01:08 -0000
From: Rob Herring <robh@kernel.org>
To: Hugues Fruchet <hugues.fruchet@foss.st.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Wed, 15 Nov 2023 14:59:04 -0600
Message-ID: <20231115205904.3732985-1-robh@kernel.org>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: [Linux-stm32] [RESEND PATCH] media: stm32-dcmi: Drop unnecessary
	of_match_device() call
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

If probe is reached, we've already matched the device and in the case of
DT matching, the struct device_node pointer will be set. Therefore, there
is no need to call of_match_device() in probe.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/media/platform/st/stm32/stm32-dcmi.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmi.c b/drivers/media/platform/st/stm32/stm32-dcmi.c
index 8cb4fdcae137..48140fdf40bb 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmi.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmi.c
@@ -20,7 +20,6 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/of_graph.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/platform_device.h>
@@ -1890,7 +1889,6 @@ static int dcmi_graph_init(struct stm32_dcmi *dcmi)
 static int dcmi_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
-	const struct of_device_id *match = NULL;
 	struct v4l2_fwnode_endpoint ep = { .bus_type = 0 };
 	struct stm32_dcmi *dcmi;
 	struct vb2_queue *q;
@@ -1899,12 +1897,6 @@ static int dcmi_probe(struct platform_device *pdev)
 	struct clk *mclk;
 	int ret = 0;
 
-	match = of_match_device(of_match_ptr(stm32_dcmi_of_match), &pdev->dev);
-	if (!match) {
-		dev_err(&pdev->dev, "Could not find a match in devicetree\n");
-		return -ENODEV;
-	}
-
 	dcmi = devm_kzalloc(&pdev->dev, sizeof(struct stm32_dcmi), GFP_KERNEL);
 	if (!dcmi)
 		return -ENOMEM;
-- 
2.42.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
