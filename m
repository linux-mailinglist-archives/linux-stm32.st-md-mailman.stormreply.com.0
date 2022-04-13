Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C54E24FF39D
	for <lists+linux-stm32@lfdr.de>; Wed, 13 Apr 2022 11:35:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6B3CCC60496;
	Wed, 13 Apr 2022 09:35:10 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3BC43C5F1EF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 Apr 2022 09:35:08 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id
 md20-20020a17090b23d400b001cb70ef790dso5693478pjb.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 Apr 2022 02:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=g8bxk6TEEm2E4o6Pbnd9rhcp6xDjb41DTe9/87BNTLo=;
 b=JZp5Hsljcm5VODYRCefVlERxtrwbMN/LlqYjsY9aehOsYfTRooM0dffeuovLITcMpa
 t+jLjYNrGEtMRhwrgwT2BysFowAmmBOr0FU6zVCUa+z3DV7LgxziTGs0j7buO6IFvma2
 DUpc5v19rO3MTWgZTwg3fujt3L/WU9EST7MUOQqFS19JHXJTek3cJzrW04U2zCTDooeA
 cR8x3X0mjGiDHOTPwSWI5jKLuxaKULhc0/DSmB8qDJN6/L0VVpyuI1ois0AYFu+2K36M
 xcLUU3YCm0fbXvG/x+TtoxZV30tsAJribr7soOiY0ZmIO8FXCwy1UyM405dOqsAKkUh8
 jXjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=g8bxk6TEEm2E4o6Pbnd9rhcp6xDjb41DTe9/87BNTLo=;
 b=fVg9nEiE24WNjQds3znk/VyDAmHig8vh/j/gi7MZwYfd6+yrJUETx463rty1S9IWiz
 f+sqnm/DbFcMXwwsxqTV2Gl9tTiTJzTjThB5ysfqpmt7XjoXF7IYh72eT5hdOAzsUnPJ
 Hd2i7saMzLXQ0HD/bA6cMZvCxvpkNaIfT0VGMsnGRlJIur2hkT+xNzD3csXSRVbrqzP5
 al1dbwJXkh8f0yLXyqbzBmQYlcRB+98JOaidKQIdCs7PnFilDPMsFkZcF3H5G1klWvxj
 /W0Q/FFqcLO09G2S0/M0aPjMiw+bYXQTDpJKjcBHrMyyMEY9qnJPtiCq5DT8dQdY4khy
 pu8w==
X-Gm-Message-State: AOAM530rmqEJrl7cvcrTTZ4B4CvKVSHKqtC0MBl+6R7JiWLj5dymMOvV
 gt+BmekH9kB3W+hc8tsigHw=
X-Google-Smtp-Source: ABdhPJw45U2NXOywU+IuPRm5iLbjbC1jplGTrrmeq9htOE9PfollGG0Q1anN3JrXMq7WI+IagnJpBg==
X-Received: by 2002:a17:90b:3144:b0:1cd:37de:3bbc with SMTP id
 ip4-20020a17090b314400b001cd37de3bbcmr6458307pjb.110.1649842506902; 
 Wed, 13 Apr 2022 02:35:06 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id
 q15-20020a056a00150f00b004fb28ea8d9fsm44168349pfu.171.2022.04.13.02.35.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Apr 2022 02:35:06 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: chi.minghao@zte.com.cn
To: kvalo@kernel.org
Date: Wed, 13 Apr 2022 09:35:02 +0000
Message-Id: <20220413093502.2538316-1-chi.minghao@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, Zeal Robot <zealci@zte.com.cn>,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 Minghao Chi <chi.minghao@zte.com.cn>, davem@davemloft.net, kuba@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] wlcore: testmode: use
	pm_runtime_resume_and_get() instead of pm_runtime_get_sync()
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

From: Minghao Chi <chi.minghao@zte.com.cn>

Using pm_runtime_resume_and_get is more appropriate
for simplifing code

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Minghao Chi <chi.minghao@zte.com.cn>
---
 drivers/net/wireless/ti/wlcore/testmode.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/ti/wlcore/testmode.c b/drivers/net/wireless/ti/wlcore/testmode.c
index 3a17b9a8207e..3f338b8096c7 100644
--- a/drivers/net/wireless/ti/wlcore/testmode.c
+++ b/drivers/net/wireless/ti/wlcore/testmode.c
@@ -83,11 +83,9 @@ static int wl1271_tm_cmd_test(struct wl1271 *wl, struct nlattr *tb[])
 		goto out;
 	}
 
-	ret = pm_runtime_get_sync(wl->dev);
-	if (ret < 0) {
-		pm_runtime_put_noidle(wl->dev);
+	ret = pm_runtime_resume_and_get(wl->dev);
+	if (ret < 0)
 		goto out;
-	}
 
 	ret = wl1271_cmd_test(wl, buf, buf_len, answer);
 	if (ret < 0) {
@@ -158,11 +156,9 @@ static int wl1271_tm_cmd_interrogate(struct wl1271 *wl, struct nlattr *tb[])
 		goto out;
 	}
 
-	ret = pm_runtime_get_sync(wl->dev);
-	if (ret < 0) {
-		pm_runtime_put_noidle(wl->dev);
+	ret = pm_runtime_resume_and_get(wl->dev);
+	if (ret < 0)
 		goto out;
-	}
 
 	cmd = kzalloc(sizeof(*cmd), GFP_KERNEL);
 	if (!cmd) {
-- 
2.25.1


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
