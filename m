Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 135681EA8BC
	for <lists+linux-stm32@lfdr.de>; Mon,  1 Jun 2020 19:56:06 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CC52EC36B2A;
	Mon,  1 Jun 2020 17:56:05 +0000 (UTC)
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 21F51C36B0D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  1 Jun 2020 17:56:05 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id y18so257124plr.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 01 Jun 2020 10:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4k72LVztQ+3OPIVfCjk5AKi+kBj/xA40V3ZRlBXiosE=;
 b=lwiDftbDn6zhaZZ4Jh4yVwIWU/cWgoePKS3jSUwjCl3Jfy2BfO7OzD3lXgOxCKSE6s
 EA0t9HA794QQuONUBIuG6b5LxDfH+Aw1c+/aneuoX/JjlzTQlbrAkDwwctTvo0RFXXVf
 RMe4teHr2HjquWdvA65du0gNHxLxbazkjPjxQf6BnGcoYzV/msXJjc/06OjrdozJyw1c
 MN/0xmcmq0yupcEbzeFr13DCoRnR+yqLYo28OOzIYC3ltUP0POk4iLxhxtzWu1RUbcCh
 lvSpreUDi/2CEOjllgx6Q10FBpzJf658wf9utALJLpgORudxuGyl21DkX+T8FE0cVT51
 y1Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4k72LVztQ+3OPIVfCjk5AKi+kBj/xA40V3ZRlBXiosE=;
 b=jlsQOUy4Up0gOStVdavi5SYSbCWUEkHfqGT+Qntpyx7tCZu7onWtV6V7mDs32KM1HW
 Z/qSr6j7v+EIuLlPXBe86IMIKUa5dsYaFszTAyTD9lNjFibBSBOiZ3UAtnWbP7Y68Ly5
 3fNT4MQ2gh7cAateyu1i9XvS7eVwlJoAqG0kpjxNUw/3WIkulDyEUXVWhbE+EEg4uQFX
 S/58M95yBGvyqfVcoyAKeJdAx5KYDiRVeCTUF8bqQp4CoDzt7o7SNq0ZdZPI7UMrcKfi
 lfqtNwUQUFzPVfsp/HnHOZc6s5kFml673gD+VZ0n2eBQI3uj0yjIcRWkgll6AHRSwGEU
 n2+g==
X-Gm-Message-State: AOAM530FFzre20tRWZLiAUH5UH7dEKPH98tuywJiqJ511YMpZsWne4Sb
 Oc0Ep3Eqggp+IFKDgsR8Kt2BDCr30zI=
X-Google-Smtp-Source: ABdhPJysMznlN/ClmaL8ZQBX6gr9202gWa/xTGIljnYs+zC6HL/jwJa9bKBC2cihfsJrdqTHVAfzzg==
X-Received: by 2002:a17:90b:8b:: with SMTP id
 bb11mr561940pjb.219.1591034163607; 
 Mon, 01 Jun 2020 10:56:03 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net.
 [68.147.8.254])
 by smtp.gmail.com with ESMTPSA id p7sm64771pfq.184.2020.06.01.10.56.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jun 2020 10:56:03 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: bjorn.andersson@linaro.org, ohad@wizery.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@st.com
Date: Mon,  1 Jun 2020 11:55:48 -0600
Message-Id: <20200601175552.22286-8-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200601175552.22286-1-mathieu.poirier@linaro.org>
References: <20200601175552.22286-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v4 07/11] remoteproc: Make function
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
index a8adc712e7f6..6b0ded714beb 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1272,7 +1272,7 @@ static void rproc_coredump_cleanup(struct rproc *rproc)
  * This function will free all resources acquired for @rproc, and it
  * is called whenever @rproc either shuts down or fails to boot.
  */
-static void rproc_resource_cleanup(struct rproc *rproc)
+void rproc_resource_cleanup(struct rproc *rproc)
 {
 	struct rproc_mem_entry *entry, *tmp;
 	struct rproc_debug_trace *trace, *ttmp;
@@ -1316,6 +1316,7 @@ static void rproc_resource_cleanup(struct rproc *rproc)
 
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
2.20.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
