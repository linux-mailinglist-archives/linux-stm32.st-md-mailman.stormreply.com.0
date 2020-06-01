Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 411A81EA8C1
	for <lists+linux-stm32@lfdr.de>; Mon,  1 Jun 2020 19:56:11 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 070D8C36B28;
	Mon,  1 Jun 2020 17:56:11 +0000 (UTC)
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ECACAC36B0D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  1 Jun 2020 17:56:09 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id y18so257288plr.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 01 Jun 2020 10:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=u4RFNd9FFVlTeJLx02SSeMMgnm0C5Ocm0tA+r0cHo1Y=;
 b=jDpwCbFHHHOdFSOjq6a7d0+Jeda1zij/0s2YyarOhbL1q9jo+DgjNl/BLDo6Qai070
 2WLbe7LDYhcsR6Al9tIXcUq1hjSNSkJ5b37HvFu9BL8DAe3zZ4z6jWGtsBOh2laDL+VM
 IgVYA3Iv8FKeM1mbOVzl5grl6P2IqcPgjEioI8VvPUiDEJQ+s5y90Ie9Llm9B/aJnsaU
 1hJvyLWdtmO4dmDCoEE3OeIZsDrXfT+6CtGYWf0Ggvlf2vTy+KrKvrZ8VY1hoTFyQSkm
 rHd7p4AW41iHcMeRgg5GQN+kpaRrhnsrW+1K29gPT5lgGZ3DvVXMWW5RjsknN+xU8GPN
 uZNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=u4RFNd9FFVlTeJLx02SSeMMgnm0C5Ocm0tA+r0cHo1Y=;
 b=DfWZqiv4yknBGvDzUVZs1HOpmFkOIaAd3DZHcQVy3D5kQEE1Fn/jpMza9g0y2UyadC
 3N3OpeIQdCcJ/pR+pv627hEGp0r9osFoi9JKX9aAVF7D7FEMNbiMg9RgYCR2DZlKD316
 VlEBm3Eq9mWZYW8TFrt0g1Iq0Zam7su5NOqX/VExfF9MJryhBUMqDdQeUog8b86oaRIK
 9qwleMROQTxZMftodYauM9q0JWlMvPTGF7ZulFcHyu+8+z0DyM8xT97GHefTTPBr3ldh
 uenSGBKen85Ttpoi11Q+V1CFWEoPARyEH9sE/0pRddZjPpsz62QpZeKab7/x9Ar7Nx1b
 88kA==
X-Gm-Message-State: AOAM531dE+eZqkHIvd4VPunPDVR4/ga2SCS14bogA0pFce3Q9JgxESc4
 osiExsNIWLWa8rLzs9gCuvGGxg==
X-Google-Smtp-Source: ABdhPJyPL4cWZZg61WZPJde8LyrsdhiEW14iaC+dVSSpI6qDWDL94WZSK2PfRnxce1jBtWI4z5ay6w==
X-Received: by 2002:a17:902:8d83:: with SMTP id
 v3mr4455323plo.27.1591034168449; 
 Mon, 01 Jun 2020 10:56:08 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net.
 [68.147.8.254])
 by smtp.gmail.com with ESMTPSA id p7sm64771pfq.184.2020.06.01.10.56.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jun 2020 10:56:08 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: bjorn.andersson@linaro.org, ohad@wizery.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@st.com
Date: Mon,  1 Jun 2020 11:55:52 -0600
Message-Id: <20200601175552.22286-12-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200601175552.22286-1-mathieu.poirier@linaro.org>
References: <20200601175552.22286-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v4 11/11] remoteproc: stm32: Update M4 state
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

Update the co-processor state in function stm32_rproc_stop() so that
it can be used in scenarios where the remoteproc core is attaching
to the M4.

Mainly based on the work published by Arnaud Pouliquen [1].

[1]. https://patchwork.kernel.org/project/linux-remoteproc/list/?series=239877

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Reviewed-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
---
 drivers/remoteproc/stm32_rproc.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
index 77a20a638e0c..ad0307aaf3d5 100644
--- a/drivers/remoteproc/stm32_rproc.c
+++ b/drivers/remoteproc/stm32_rproc.c
@@ -503,6 +503,18 @@ static int stm32_rproc_stop(struct rproc *rproc)
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
 
-- 
2.20.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
