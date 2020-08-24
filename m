Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A9124FF6E
	for <lists+linux-stm32@lfdr.de>; Mon, 24 Aug 2020 16:01:15 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 57BF8C3FADA;
	Mon, 24 Aug 2020 14:01:15 +0000 (UTC)
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
 [209.85.160.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AF53EC32EA6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Aug 2020 14:01:13 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id v91so807556qte.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Aug 2020 07:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=mi86+WphliiE46rge60tCAlVsMmu7FS4d8IzZESWhL8=;
 b=kbEqpq12FNAu/2vT9L2fQEO7zBNYtapgY8AMifK5255p+PY9p/NZ4Pii14G9YIRR+0
 TgeZM4zpB1iowxqFm3Kc7yOmgUL2ghyxSFB34by1kfH8/asHa8z6MDGe9BA3SLvZqrMY
 CdpkPZZjwsCVjH1EblUnYRcPMrWQT8WpKFzsnVHR3xOXFYlXWqumKCd8n11MGWDHrP+G
 ZPfrSyipYHuhNd7gP92m+Gn2D8HcMVwPlBeGRlnGGgAXrs75qNAi2LKx2TTIFlU+s0ko
 XACx24Avzvxnc8pI1z0ujQBBQkYVPYF5RGG0yTn2jq03GYyI4kKVOp9JTCITPvaNYHDB
 K44w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=mi86+WphliiE46rge60tCAlVsMmu7FS4d8IzZESWhL8=;
 b=lM22n4iU8FJbX+vswD+cbaru/Svm6ZilZk7uCFhTUqOJRN/k7ITORh4/BlgF+yGvkV
 0suIasYNFweYDyR+xIcqSBP0jtO8h808SFlZToykalPVydj/j24hNnaKOkIV0V8opTPJ
 1ko05Biy8LCtx5JPT51JorfgGhGTAxDSB9oF9wWzauQfHAEjeevoVjjCVOQTZ0H4w3ug
 T4geXu8iU/pieejsiMN4B081XXRs2quj7NRi7J5s4Eu0kYBqPPp1EkcVWS5HlmWOIYhx
 z/NSjgB6Qr3HvhLI7tjBNJZo8kep+n5BwsOPpGqqwzraOkngMG5fU1kr9g9mYN0brEp9
 17pA==
X-Gm-Message-State: AOAM530R/bMx3mvdWI5EIVDtDXssadKB/8W7YFL6t3FcpLlO0wDmlemu
 CwaWBOa232lSt+lgfsMg4oI=
X-Google-Smtp-Source: ABdhPJw+LruaJmmWJO+Mtw5M3vgeggarBNQ1YOjhxoESzHvNExHtKePDygkeiBdJjbAieDiAUxQ6XA==
X-Received: by 2002:ac8:6c6:: with SMTP id j6mr5025543qth.129.1598277672543;
 Mon, 24 Aug 2020 07:01:12 -0700 (PDT)
Received: from localhost.localdomain ([177.194.72.74])
 by smtp.gmail.com with ESMTPSA id r20sm3244459qtc.87.2020.08.24.07.01.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Aug 2020 07:01:11 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: herbert@gondor.apana.org.au
Date: Mon, 24 Aug 2020 10:58:40 -0300
Message-Id: <20200824135840.3716-2-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200824135840.3716-1-festevam@gmail.com>
References: <20200824135840.3716-1-festevam@gmail.com>
Cc: Fabio Estevam <festevam@gmail.com>, linux-crypto@vger.kernel.org,
 mcoquelin.stm32@gmail.com, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 2/2] crypto: stm32/hash - include
	<linux/dma-mapping.h>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Building ARM allmodconfig leads to the following warnings:

drivers/crypto/stm32/stm32-hash.c:492:18: error: implicit declaration of function 'dma_map_sg'; did you mean 'dma_cap_set'? [-Werror=implicit-function-declaration]
drivers/crypto/stm32/stm32-hash.c:493:8: error: 'DMA_TO_DEVICE' undeclared (first use in this function); did you mean 'MT_DEVICE'?
drivers/crypto/stm32/stm32-hash.c:501:3: error: implicit declaration of function 'dma_unmap_sg' [-Werror=implicit-function-declaration]
drivers/crypto/stm32/stm32-hash.c:589:8: error: 'DMA_TO_DEVICE' undeclared (first use in this function); did you mean 'MT_DEVICE'?

Include <linux/dma-mapping.h> to fix such warnings

Reported-by: Olof's autobuilder <build@lixom.net>
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/crypto/stm32/stm32-hash.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/crypto/stm32/stm32-hash.c b/drivers/crypto/stm32/stm32-hash.c
index 03c5e6683805..092eaabda238 100644
--- a/drivers/crypto/stm32/stm32-hash.c
+++ b/drivers/crypto/stm32/stm32-hash.c
@@ -9,6 +9,7 @@
 #include <linux/clk.h>
 #include <linux/crypto.h>
 #include <linux/delay.h>
+#include <linux/dma-mapping.h>
 #include <linux/dmaengine.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
