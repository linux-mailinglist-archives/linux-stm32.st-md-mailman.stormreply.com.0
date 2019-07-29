Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C5BC378590
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Jul 2019 08:55:16 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 69989C35E01;
	Mon, 29 Jul 2019 06:55:16 +0000 (UTC)
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2699CC36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Jul 2019 02:08:59 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id r7so27162863pfl.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 28 Jul 2019 19:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=GgqqXrj0IVL3XCjuqMEeh46rLbd7N7hEVY5Hg1vftSk=;
 b=VhQ24Xm4qxQ1CYPaB6WhF5IedavT1hfH+pAW+nNKczx/aBxtKhr9dgC0SKzTRe7Ki1
 Q/JIQnvaFXbFkPQPNUtjOH9TiNTZxLeArg10E3/dbQT5HukCE3gU6ogpsY0Xe023uXaB
 xn6L0Njlqzzes1/8U6W8kkKjqQWd09QkV9vm68h+BXbnNyszCP9lzlVNMEulf7UTfHVd
 r6c/3wkyPbUYYHd411oyZDnVh08fs0lVD0Tki4DtGEgvvM2GURS+ibiV/DJcHrma8HIU
 g/7LUwI7OneWn3HokbE90LPxQFDugrsUgxA8SSO9yUJfauib0nV78nnai5iBhOqMhig/
 QmQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=GgqqXrj0IVL3XCjuqMEeh46rLbd7N7hEVY5Hg1vftSk=;
 b=s3dlbNleaF+H9Obie8ofiNPpNEeQUfIOptREBVi5mE90n7sOrY7YsHeXUG5IOjFHhu
 csT/1c+ABbFQOETYvhB2tNJsP6okEDPZJyc1j2J8/CN/Odgozl1KvAXKfh9RMYOEsoDm
 0fi9Nh986VWg8Fl63l/mCRSWgEwRUkGOb2rJ4FgJxFpRQSj2lOWlWZmZoVIyRH6uydG0
 l/NTWdYW3sv1CyJpjhwHZ6bbeRaBuAlBNdnoOcZI6FdnmtkVt2gCDKmJDcaIWfeMg9rb
 vm7g1Jo1F0iULT2E7G2meb47GrI4GpC9njLIvJD+WY6B8J2zaiyj+0cwhn+nW2zNEcoe
 s5XQ==
X-Gm-Message-State: APjAAAVKKS4hLXgUfHk53tp0nsD4pJcuf3qqGGc1eT/t9SWjPYGWLlo6
 vXh2ewoLom9HOmmOsyeBGSA=
X-Google-Smtp-Source: APXvYqziKiVqdTi0EohhcF4w3kBjAEogyGJ2Ibb+1USarrNmtJONCBPCB1AYleTdYQ9v52s4F2E6kA==
X-Received: by 2002:a65:68c9:: with SMTP id k9mr68919329pgt.17.1564366137516; 
 Sun, 28 Jul 2019 19:08:57 -0700 (PDT)
Received: from oslab.tsinghua.edu.cn ([2402:f000:4:72:808::3ca])
 by smtp.gmail.com with ESMTPSA id p15sm57011634pjf.27.2019.07.28.19.08.54
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 28 Jul 2019 19:08:56 -0700 (PDT)
From: Jia-Ju Bai <baijiaju1990@gmail.com>
To: vkoul@kernel.org, dan.j.williams@intel.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@st.com
Date: Mon, 29 Jul 2019 10:08:49 +0800
Message-Id: <20190729020849.17971-1-baijiaju1990@gmail.com>
X-Mailer: git-send-email 2.17.0
X-Mailman-Approved-At: Mon, 29 Jul 2019 06:55:14 +0000
Cc: dmaengine@vger.kernel.org, Jia-Ju Bai <baijiaju1990@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH] dma: stm32-mdma: Fix a possible null-pointer
	dereference in stm32_mdma_irq_handler()
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

In stm32_mdma_irq_handler(), chan is checked on line 1368.
When chan is NULL, it is still used on line 1369:
    dev_err(chan2dev(chan), "MDMA channel not initialized\n");

Thus, a possible null-pointer dereference may occur.

To fix this bug, "dev_dbg(mdma2dev(dmadev), ...)" is used instead.

Signed-off-by: Jia-Ju Bai <baijiaju1990@gmail.com>
---
 drivers/dma/stm32-mdma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/stm32-mdma.c b/drivers/dma/stm32-mdma.c
index d6e919d3936a..1311de74bfdd 100644
--- a/drivers/dma/stm32-mdma.c
+++ b/drivers/dma/stm32-mdma.c
@@ -1366,7 +1366,7 @@ static irqreturn_t stm32_mdma_irq_handler(int irq, void *devid)
 
 	chan = &dmadev->chan[id];
 	if (!chan) {
-		dev_err(chan2dev(chan), "MDMA channel not initialized\n");
+		dev_dbg(mdma2dev(dmadev), "MDMA channel not initialized\n");
 		goto exit;
 	}
 
-- 
2.17.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
