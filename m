Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD4C217A77
	for <lists+linux-stm32@lfdr.de>; Tue,  7 Jul 2020 23:31:26 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B57AEC36B2B;
	Tue,  7 Jul 2020 21:31:25 +0000 (UTC)
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8E9D2C36B29
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Jul 2020 21:31:24 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id g67so19708419pgc.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 07 Jul 2020 14:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=h12JhHvSO+bmX99ezv3yaLnOJmMzfHeXrbHb3WDJUWc=;
 b=jic4pcGQoE5bbkcXOsIMdiKLSg+ok5snqmEkp5W4cedeKRPsSjWdR8qXyBYYMrKUF0
 GLsR17gvZ6kXQCC0uXBiAtGOhoarH5KfTlv/VetDPfX5sRclATaqgwTDRKqMdXoUhtvm
 mKDrD4/RJ0tTb8iUM4CvT7eh+5Ow7lvNFnioN78naLDRKOFpqSDhse86yKVoR/h2G2JZ
 w1SQ1wm9HBVLvIeUDuRVjPkHwGmr7FTXvs5ki2MMdV8dGNPRIJv2aK2JsupuUCv16Fc2
 /+ZcrQybwx6s/JU5QDnlzcmTtewaZoZuab1BP/DuJM6lJtAv+uLOUy7zdBLvGUDgWVXd
 c+Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=h12JhHvSO+bmX99ezv3yaLnOJmMzfHeXrbHb3WDJUWc=;
 b=ZcPOK0R8uz22YXqsHDPuK5GR/g35M+ug9HNmCio6IWFUUGSJ/QNhHZcKTIX+bKZgvN
 NJD3N44VGePPjkZDhxiwtDo6gqL2fYSD2HpPpIKV530ArZnVnA+h88qgTTvOi7m7uUjH
 9aFlE8vmJhWUFWmji3SqKGzYQN6uwRekxLEVz0R8K/Bly07n7FxXFVNXggoGVmX5aYcj
 JIwHJv2GZhyAWCIVa78inc9nFoXZZcbAdbV/dnUlOxHxw4Rkd1q8Y5rSO7IK04gpM/dH
 2sn4VSf/Vx3WUc4YIsI0yWvQMZFNeppWxbLl/CzTK8jLKSN1wCn4oJPbtZTA3brDT5SL
 8N3A==
X-Gm-Message-State: AOAM530FI49WS3wgCSK5wEUWvAVJNawbLZV5xKFyn5tDv0iY8myxzQsv
 2p4c44BjC+EniptsXkgA7Y2wqw==
X-Google-Smtp-Source: ABdhPJxgyaQh4mTEIOmvaKPyRLDgsJvLs8cVkBxus9NiBgbjD9jwfunvRpeoL0T5pYTI5kAYPoc2ow==
X-Received: by 2002:a62:1d0b:: with SMTP id d11mr53080485pfd.1.1594157483189; 
 Tue, 07 Jul 2020 14:31:23 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net.
 [68.147.8.254])
 by smtp.gmail.com with ESMTPSA id o128sm23560832pfg.127.2020.07.07.14.31.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2020 14:31:22 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: ohad@wizery.com, bjorn.andersson@linaro.org, loic.pallardy@st.com,
 arnaud.pouliquen@st.com, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com
Date: Tue,  7 Jul 2020 15:31:08 -0600
Message-Id: <20200707213112.928383-8-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200707213112.928383-1-mathieu.poirier@linaro.org>
References: <20200707213112.928383-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v5 07/11] remoteproc: Make function
	rproc_resource_cleanup() public
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

Make function rproc_resource_cleanup() public so that it can be
used by platform drivers when allocating resources to be used by
a detached remote processor.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/remoteproc/remoteproc_core.c | 3 ++-
 include/linux/remoteproc.h           | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 099c76ab198f..6e0f985e9c9a 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1271,7 +1271,7 @@ static void rproc_coredump_cleanup(struct rproc *rproc)
  * This function will free all resources acquired for @rproc, and it
  * is called whenever @rproc either shuts down or fails to boot.
  */
-static void rproc_resource_cleanup(struct rproc *rproc)
+void rproc_resource_cleanup(struct rproc *rproc)
 {
 	struct rproc_mem_entry *entry, *tmp;
 	struct rproc_debug_trace *trace, *ttmp;
@@ -1315,6 +1315,7 @@ static void rproc_resource_cleanup(struct rproc *rproc)
 
 	rproc_coredump_cleanup(rproc);
 }
+EXPORT_SYMBOL(rproc_resource_cleanup);
 
 static int rproc_start(struct rproc *rproc, const struct firmware *fw)
 {
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index cf5e31556780..7c0567029f7c 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -610,6 +610,7 @@ void rproc_put(struct rproc *rproc);
 int rproc_add(struct rproc *rproc);
 int rproc_del(struct rproc *rproc);
 void rproc_free(struct rproc *rproc);
+void rproc_resource_cleanup(struct rproc *rproc);
 
 struct rproc *devm_rproc_alloc(struct device *dev, const char *name,
 			       const struct rproc_ops *ops,
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
