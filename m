Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 169D11B8080
	for <lists+linux-stm32@lfdr.de>; Fri, 24 Apr 2020 22:25:20 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C798FC36B12;
	Fri, 24 Apr 2020 20:25:19 +0000 (UTC)
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E54A1C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Apr 2020 20:25:15 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id d184so5349508pfd.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Apr 2020 13:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zvzC6gFPrPdzFl23lN2WuH5nBg+m021+fv4zS7XCe30=;
 b=JeSlOzJKUAlEQUUjc556FCSgmbLt7CRMMtZBI1ImTGOTQhqVQ47j1XgWFoD7gm7l3G
 G2OyjQRAXMotr3RA+1MdoK9ggCmO/iFqzu9YHxQkHfOhYqo39Rp0RCPnIK8k8nrt/pb/
 tF7s+f7d591EiuvECYRAcbhuxwo3yLUpfrYnofrrg7WWWeZ8WjLLRuO2i3xz4j8B1jpX
 ENW4ZcVeUz+SrLcKK49KaAZ9/fUlBMlMTuOMcsFFrcDL/ZKi5HXmg1P8Yi6jcGAgf7Or
 ZUHmtP4ISsKMs/b84P2+NxEV7oiNwQ/OtOIETDBID/tue4ztejeiC3HPuVEvEJj9sgwx
 Ghjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zvzC6gFPrPdzFl23lN2WuH5nBg+m021+fv4zS7XCe30=;
 b=QGxPgMGh/HzL59GvHw5Vd+3YOrh01Qo30eJN9z0x5kROwkOJoY965+h86gJimu4bid
 M454azDgynLUw6Sf2mntub+CLJsGCEqh8bdiT9O8f8GGryzVa7TNInybD6r1fQ4HWWL6
 mYur/TAI33jyZWV2/clQVtdqNzeUW0wgTfOEF38n+L97Erm0tINrOrzXzPGcxecJa9kj
 OK82Qfu19qfMLiSs7efHwQ83adqXMHhSVBTvOYuLqU0GRK4rRIcXhEUT6KHAo+PXWHh4
 PsYDZutA9VBppSEiXMkhvXD7yY9HMlY9vn9iQ1M5orgRd7TU35IeAcso+LjVwnhzNE3R
 WSQA==
X-Gm-Message-State: AGi0PuaEy667SxV9MBMSuveqg/dbMr3MoJSHX/Mq6XfOipu0YspNr86j
 ZAEwhgqQA+7gmdwnT8ggv/+UYMA+S4Y=
X-Google-Smtp-Source: APiQypL/FJQ9p9P0ruo1sUrpqRRDWLFXA2JvJ7Rs260rkeJu2EjUNFy/ALDcgjJW5wPGudCeO89+Yg==
X-Received: by 2002:a63:1e1f:: with SMTP id e31mr3966444pge.393.1587759914468; 
 Fri, 24 Apr 2020 13:25:14 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net.
 [68.147.8.254])
 by smtp.gmail.com with ESMTPSA id c1sm6553245pfc.94.2020.04.24.13.25.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Apr 2020 13:25:13 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: bjorn.andersson@linaro.org, ohad@wizery.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@st.com
Date: Fri, 24 Apr 2020 14:24:59 -0600
Message-Id: <20200424202505.29562-7-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200424202505.29562-1-mathieu.poirier@linaro.org>
References: <20200424202505.29562-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 06/12] remoteproc: stm32: Get coprocessor
	state
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

Introduce the required mechanic to get the state of the M4 when the
remoteproc core is initialising.

Mainly based on the work published by Arnaud Pouliquen [1].

[1]. https://patchwork.kernel.org/project/linux-remoteproc/list/?series=239877

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Reviewed-by: Loic Pallardy <loic.pallardy@st.com>
---
 drivers/remoteproc/stm32_rproc.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
index a285f338bed8..89fbd2ffac93 100644
--- a/drivers/remoteproc/stm32_rproc.c
+++ b/drivers/remoteproc/stm32_rproc.c
@@ -38,6 +38,15 @@
 #define STM32_MBX_VQ1_ID	1
 #define STM32_MBX_SHUTDOWN	"shutdown"
 
+#define RSC_TBL_SIZE		(1024)
+
+#define M4_STATE_OFF		0
+#define M4_STATE_INI		1
+#define M4_STATE_CRUN		2
+#define M4_STATE_CSTOP		3
+#define M4_STATE_STANDBY	4
+#define M4_STATE_CRASH		5
+
 struct stm32_syscon {
 	struct regmap *map;
 	u32 reg;
@@ -635,12 +644,23 @@ static int stm32_rproc_parse_dt(struct platform_device *pdev,
 	return 0;
 }
 
+static int stm32_rproc_get_m4_status(struct stm32_rproc *ddata,
+				     unsigned int *state)
+{
+	/* See stm32_rproc_parse_dt() */
+	if (!ddata->m4_state.map)
+		return -EINVAL;
+
+	return regmap_read(ddata->m4_state.map, ddata->m4_state.reg, state);
+}
+
 static int stm32_rproc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct stm32_rproc *ddata;
 	struct device_node *np = dev->of_node;
 	struct rproc *rproc;
+	unsigned int state;
 	bool auto_boot = false;
 	int ret;
 
@@ -664,6 +684,15 @@ static int stm32_rproc_probe(struct platform_device *pdev)
 	if (ret)
 		goto free_rproc;
 
+	ret = stm32_rproc_get_m4_status(ddata, &state);
+	if (ret) {
+		/*
+		 * We couldn't get the coprocessor's state, assume
+		 * it is not running.
+		 */
+		state = M4_STATE_OFF;
+	}
+
 	rproc->auto_boot = auto_boot;
 	rproc->has_iommu = false;
 	ddata->workqueue = create_workqueue(dev_name(dev));
-- 
2.20.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
