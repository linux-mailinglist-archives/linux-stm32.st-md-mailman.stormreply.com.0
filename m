Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 946B421FE0B
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Jul 2020 22:05:00 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5F28FC36B2D;
	Tue, 14 Jul 2020 20:05:00 +0000 (UTC)
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5CA25C36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Jul 2020 20:04:58 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id u5so8044692pfn.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Jul 2020 13:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=h12JhHvSO+bmX99ezv3yaLnOJmMzfHeXrbHb3WDJUWc=;
 b=DJ7V8b5i+/Tv/OOoy+U5IAmyq8Y7huOUnzJqHDrYYbiKMKAAdMqDBxq0BIKBWDW2Ut
 rc+fvzDHyx0CTs1SJFC0C/9zNCrGBmp4Ltz/UhnHeINA6Hsug9v4/z5m91Dk5aOAnVhr
 l2JpMzWwsYGEavJG8gJ1+J4Qts/LLzVsTF3MFAeJay7oWq+meeeFI19vytEZBzyMatPK
 aKg/aSWDL5iYuvddNeZ1uTbfQ/lcwpt0pX3hPWWCeily6FupPwcdrPjgNKBuLU5OjqwV
 cWF598r+6Fq8oZMwAnONKN6gvQy3lIAN1k1R+P8Oydladzp4Q5Ftmp/hVxiL6h+eYaYi
 /7yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=h12JhHvSO+bmX99ezv3yaLnOJmMzfHeXrbHb3WDJUWc=;
 b=tS8imcIlXB/6NL1wb+8c4UHWHzpGGYUPVDZ7vkE6Tb/Dh3E0tJn6e+BpfeOBkWdg8K
 nCNBalYAnqqKsWb1wHB9lW/MDrrLlsK38O02j//0BUuKOyIVHgSMLR+pL/tvWQ+SN+Ik
 cxBraeqGYG2KcL2pFILX+eBX5/jUSLrTWnjhF+r03SU2pAwpwxylI98hW+qeiGs1+bTD
 b79Dm1b+3N1Y4sLgzNdAATzW6WqY8PRwkE3kdKZQ4IhDrVtZ/L27m7AUe8H7kL5SqZbA
 ZJXQtzKL+kySq1o7XRCiESzL3S+Y4oRoVBI0Xiv2wH5VPYYZHFRRZAuo447W5YTXuCX3
 Mtgw==
X-Gm-Message-State: AOAM533qfMjJjrcCXzpRdF/HXWCeWJHp8iHhwKcIVAlKIZrzgIiBNm6O
 TT9SP0jE05PfTgFc5SP27gwuRA==
X-Google-Smtp-Source: ABdhPJwLad282+1fQ4jA+c/yfEwsyyWdoEjqDQEBZ4Id0zFDntAlCtYcwIWvGi8A9COTD1KdXLIiYQ==
X-Received: by 2002:a65:6106:: with SMTP id z6mr4816217pgu.310.1594757096888; 
 Tue, 14 Jul 2020 13:04:56 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net.
 [68.147.8.254])
 by smtp.gmail.com with ESMTPSA id t13sm3262959pjs.17.2020.07.14.13.04.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jul 2020 13:04:56 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: ohad@wizery.com, bjorn.andersson@linaro.org, loic.pallardy@st.com,
 arnaud.pouliquen@st.com, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com
Date: Tue, 14 Jul 2020 14:04:41 -0600
Message-Id: <20200714200445.1427257-8-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200714200445.1427257-1-mathieu.poirier@linaro.org>
References: <20200714200445.1427257-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v6 07/11] remoteproc: Make function
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
