Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 393131B8082
	for <lists+linux-stm32@lfdr.de>; Fri, 24 Apr 2020 22:25:21 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F2897C36B0F;
	Fri, 24 Apr 2020 20:25:20 +0000 (UTC)
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
 [209.85.216.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7DDBFC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Apr 2020 20:25:19 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id a31so2454856pje.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Apr 2020 13:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=exYZpvChsSlo7lAJbJWuh/pu5cSD6aiCv7Lp3iIYni8=;
 b=iN9Rmvvnqh92eC4TVhJvXp9LrfV9PydbkGYoRVJklbytnIqLGmkGSkG1lI2zxCRgRF
 5M53EDEEzllMIdgoLfs1/dVl8b3pTJfORPir4EQsdGV5FGTSVHYNP6wQ3KcdmPUgPpDH
 YJvNHFBk/YBKfcyFuLNIun9KsZvifIbnoX14xisIiPXfuVfLDlPu6+PjVy9eWJ0Pun4A
 1SmSDGzlNT2UlssN6jOGylFsnYwa8kVifpktDTIW+H/dVnq36Vp+0AuTokOk9ojoWvGi
 cLVSm+hhmnpYe3VgiFbrN7OgP+GhT8Vp3GSAE0Q0lX+SM/8VROPHvcG/UzE1Le1Sr0m6
 TPjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=exYZpvChsSlo7lAJbJWuh/pu5cSD6aiCv7Lp3iIYni8=;
 b=mMHPknSF3lz/Yr+yzm4D7qmNlZevTe2sjmgGNYd8A5aMeTj81+81FwjeDnJ9I5jUEj
 NJ/gtqsVr2VURX0OUKAQZFwa4j9CkkuVfghLRj7Zg9C3q48vNLwVrpCI9SS1uXV2X/EQ
 X2N1+X8t1h5RIbPe9fY0VC6DVuhmV5lfvmyEkooUpuAFQ1n8C+p4ANz9GeDlUXk+ExxL
 HUiWkgRQRf+/0t8Nl0nQCZ0zdUpdar78jsuFLxNNiJhQn02PpLWrcAYAWbARsdwYZOji
 b9t28keC+eSvF30+xQL58Ffiuz8ij7JznDRTpypmGviIV5bj5dLuScQMXQAezn8i4I09
 tUYg==
X-Gm-Message-State: AGi0PuZ2O58ytNqIRq2qf00G0/Fvlt2EwW0nZlOjH3FOM/I0WN6d+yLi
 CZu0WP2z/J1RQtk9RWGtha4LTw==
X-Google-Smtp-Source: APiQypL5AzMQXq3gOoXlH0PVqgL7PRKhGgSOEjwcpARkI3Rx98coNs2TcHAu6I+2Ek+Xn1y8hG4T1g==
X-Received: by 2002:a17:90a:1743:: with SMTP id
 3mr8488308pjm.106.1587759918032; 
 Fri, 24 Apr 2020 13:25:18 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net.
 [68.147.8.254])
 by smtp.gmail.com with ESMTPSA id c1sm6553245pfc.94.2020.04.24.13.25.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Apr 2020 13:25:17 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: bjorn.andersson@linaro.org, ohad@wizery.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@st.com
Date: Fri, 24 Apr 2020 14:25:02 -0600
Message-Id: <20200424202505.29562-10-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200424202505.29562-1-mathieu.poirier@linaro.org>
References: <20200424202505.29562-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 09/12] remoteproc: stm32: Update M4 state
	in stm32_rproc_stop()
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

Update the M4 co-processor state in function stm32_rproc_stop() so
that it can be used in synchronisation scenarios.

Mainly based on the work published by Arnaud Pouliquen [1].

[1]. https://patchwork.kernel.org/project/linux-remoteproc/list/?series=239877

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/remoteproc/stm32_rproc.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
index 404f17a97095..86d23c35d805 100644
--- a/drivers/remoteproc/stm32_rproc.c
+++ b/drivers/remoteproc/stm32_rproc.c
@@ -493,6 +493,18 @@ static int stm32_rproc_stop(struct rproc *rproc)
 		}
 	}
 
+	/* update coprocessor state to OFF if available */
+	if (ddata->m4_state.map) {
+		err = regmap_update_bits(ddata->m4_state.map,
+					 ddata->m4_state.reg,
+					 ddata->m4_state.mask,
+					 M4_STATE_OFF);
+		if (err) {
+			dev_err(&rproc->dev, "failed to set copro state\n");
+			return err;
+		}
+	}
+
 	return 0;
 }
 
@@ -531,6 +543,7 @@ static struct rproc_ops st_rproc_ops = {
 
 static __maybe_unused struct rproc_ops st_rproc_sync_ops = {
 	.start		= stm32_rproc_sync_start,
+	.stop		= stm32_rproc_stop,
 };
 
 static const struct of_device_id stm32_rproc_match[] = {
-- 
2.20.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
