Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C9542A1B492
	for <lists+linux-stm32@lfdr.de>; Fri, 24 Jan 2025 12:17:23 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5A1C1C78F8E;
	Fri, 24 Jan 2025 11:17:23 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D58D4C78F8D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Jan 2025 11:17:15 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-436a39e4891so13086225e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Jan 2025 03:17:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1737717435; x=1738322235;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cVXKrB+O1fh/6+48GtXPh7iohUuDCptQ4J19ggAdm2o=;
 b=OFfb0tutpHHGYUBHHk4xgTB2uLDykr037S1fQrRIaMIJNee+dq0avDY9AUko8h7aXb
 cAQ4TEFoJuBH06AuiLVCkohkGKOMTSRRXawIej6DlNURUVOCbyTK5SqFRV7/T+lSU9yP
 uEzeVjfTNEyCh2iGuwcndAnFoGg6Piaa6qYV0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737717435; x=1738322235;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cVXKrB+O1fh/6+48GtXPh7iohUuDCptQ4J19ggAdm2o=;
 b=s78LP2kIHqJF7eWSZO/Ssu6W037dgMgneQFKzbGs+o0LUBkqc2RwB6/AzifB2Gh7I+
 2+51l8aRtgxNGYLktGzTMM5usOSK6uejVedJj4sIkqZNasNIQIvC68mJrQtJcGpV2UJM
 SfNn1eepUo3sGv+RRe+S3tTmRJUmsGyN7WhdzYAsZP+DOQ52bnGDvH9cY22g+9BAvab7
 WMbMstLItVbUZJGQT211IAdXsXq+IQMxXSN2ShdF+nNd5JelW18cZ13ZzzJQO1mI1W0q
 j0zdCg3BFS4G3R0yDa/Dwb9aCG8RByJKllOIVz733QB1c1y5HOKTGlXdU+FpnRZPGKzs
 SitA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXQVI/l/I4/pvwjPkkRYRq0Mn0Ut3M43EWUHxgNcbggygGKsyCtyzaj0eXuDGqGLeOsMvWEiBUzu8wIg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YytMrXrjPFMEybLfcrmLpGlTlpGjT0MRnACfNMeRpKlzmC57P6m
 Lb9iYCRxgi4YVIJLhlUrEpdYPRCF1uv2un0MR2oG8aiK5OjeH2FSfSS/XHtgHDE=
X-Gm-Gg: ASbGncuXFcUFRzO41JPiQ+UCb1paM7vP+TKvmJY8yLMFapVY65Z+t+RqgkL+V5UM++3
 X6GT6kUyf4sVnBmzZnmAYVQv2YvUPChvsexCnKO0Rm8FAPgRV8MOL35MCEdpbxdz9DB1UQ6YHT9
 NLl+2ue705IPbtMdwXEai1CZx3F2ipCZi+WYr7aivevR1J5c0Ce0HBg/HhqqtszhRgtu+8kRFr2
 eZM3BJXWeNkPSrSPcn2t8W1nPU2qBC7xdw4T2EBVasZA21eDKp2QGiyZY6HV73PgF3jcFozhkiV
 9ClW6MEEiwp/oXMJ5QUVhyIMDEXlw2caghLz3c25LA==
X-Google-Smtp-Source: AGHT+IF7P9coZufZpIyRLi78wcbOmVrALszhypBmaNuECTkf3A9PTixnF+7VqbmWI7lij1JXG+mT6Q==
X-Received: by 2002:a05:6000:1a8c:b0:38a:888c:6786 with SMTP id
 ffacd0b85a97d-38bf57c063fmr27161921f8f.52.1737717435139; 
 Fri, 24 Jan 2025 03:17:15 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:a445:7786:b555:5259])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c2a188bf5sm2431547f8f.50.2025.01.24.03.17.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 03:17:14 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Fri, 24 Jan 2025 12:16:54 +0100
Message-ID: <20250124111711.1051436-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Cc: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-clk@vger.kernel.org, Dan Carpenter <dan.carpenter@linaro.org>
Subject: [Linux-stm32] [PATCH] clk: stm32f4: fix an uninitialized variable
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

The variable s, used by pr_debug() to print the mnemonic of the modulation
depth in use, was not initialized. Fix the output by addressing the correct
mnemonic.

Fixes: 65b3516dbe50 ("clk: stm32f4: support spread spectrum clock generation")
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

 drivers/clk/clk-stm32f4.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk-stm32f4.c b/drivers/clk/clk-stm32f4.c
index f476883bc93b..85e23961ec34 100644
--- a/drivers/clk/clk-stm32f4.c
+++ b/drivers/clk/clk-stm32f4.c
@@ -888,7 +888,6 @@ static int __init stm32f4_pll_ssc_parse_dt(struct device_node *np,
 					   struct stm32f4_pll_ssc *conf)
 {
 	int ret;
-	const char *s;
 
 	if (!conf)
 		return -EINVAL;
@@ -916,7 +915,8 @@ static int __init stm32f4_pll_ssc_parse_dt(struct device_node *np,
 	conf->mod_type = ret;
 
 	pr_debug("%pOF: SSCG settings: mod_freq: %d, mod_depth: %d mod_method: %s [%d]\n",
-		 np, conf->mod_freq, conf->mod_depth, s, conf->mod_type);
+		 np, conf->mod_freq, conf->mod_depth,
+		 stm32f4_ssc_mod_methods[ret], conf->mod_type);
 
 	return 0;
 }
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
