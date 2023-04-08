Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F016DBD80
	for <lists+linux-stm32@lfdr.de>; Sun,  9 Apr 2023 00:00:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7F2A7C6B45A;
	Sat,  8 Apr 2023 22:00:42 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 44F00C6B44E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  8 Apr 2023 22:00:40 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id h11so51424648lfu.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 08 Apr 2023 15:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680991239;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=v33mdlLpkYzHfi1E5gVGRd0TDuZZSfA4mjcfujBxM+A=;
 b=zvZB0OsK/1qjVkWxdzfOC5rxLs2ixQsTrsrH8tt9pxn8hIVAa0FtUmLrUoOCEBdIMv
 ozL83UVSkgDA6lNgbVtnIbuDf0VobRhkes47FotsXDhzvbdX3ENquL+B3D2eQmZ5b1Ri
 Fk4rqL607LcjwGHPpsHgbUyWkjcu2Sv9SxnOzGzQfv3YEe91A/rdDK1c+KspVN71p59/
 G7jIa0sco4r6KEpcrgezhgVbzstNC53lp+HyoOQIVt8Uzq1WAErBbkSI/pvjnMcfecbS
 bLEZi3MRfnS0Ae5QeXdoMXvXaA66aFVS7piCXN0P8L4QL4B2r0hvZb8uqiasJhl2JTOi
 Di5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680991239;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v33mdlLpkYzHfi1E5gVGRd0TDuZZSfA4mjcfujBxM+A=;
 b=DkmnIJih219c3F29LuQJ2yrJ+z8+/Go5PK5vhsU0sxv0ow36D/sMPNgH0iz10wqSJk
 2ZQLqrUE93ZNUBqI3fGXYW42o73b5LbWTVBAuPDed0EDGoK7G2p/+6eJIELYKHG2hd9O
 2/2EnH4v6L4t2i6B37r+Jajn8pqrnavzZoM/03hca75pdcmr0E9JirDeLfrujxWKq6oq
 dp7i3CfzXi7UDWT2rxNBYm9JukwUNDZNWAtZWozdpz7LrK2ANSw5i6TKL4csHyWIGIeU
 Y7G+7c4vxdlE3MHXovq/WQQlesLqWKZZcLoMm5qNL11lEYpx3l9GLSHIJWN33tBS/l+A
 zaIw==
X-Gm-Message-State: AAQBX9f2zaWbmGG5BpZJOM4BR5e9OVVZ5AmNaBZ0/SR5gkVNTYEpVv1u
 MnzDNvHlN4VgC+8gbvq4Of+5jA==
X-Google-Smtp-Source: AKy350aJyNhiarkMTNpxNF5MoILdc0xBtNXt+OmxPmuqAPlydU7BJ+Cd+Y29utF9rWOb39niLKzGUA==
X-Received: by 2002:ac2:5df0:0:b0:4ec:5648:70e4 with SMTP id
 z16-20020ac25df0000000b004ec564870e4mr1905122lfq.12.1680991239718; 
 Sat, 08 Apr 2023 15:00:39 -0700 (PDT)
Received: from [192.168.1.2] (c-05d8225c.014-348-6c756e10.bbcust.telenor.se.
 [92.34.216.5]) by smtp.gmail.com with ESMTPSA id
 v9-20020a056512048900b004e9cad1cd7csm1328904lfq.229.2023.04.08.15.00.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Apr 2023 15:00:39 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 09 Apr 2023 00:00:27 +0200
MIME-Version: 1.0
Message-Id: <20230405-pl180-busydetect-fix-v2-6-eeb10323b546@linaro.org>
References: <20230405-pl180-busydetect-fix-v2-0-eeb10323b546@linaro.org>
In-Reply-To: <20230405-pl180-busydetect-fix-v2-0-eeb10323b546@linaro.org>
To: Yann Gautier <yann.gautier@foss.st.com>, 
 Stefan Hansson <newbyte@disroot.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.12.0
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-mmc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v2 06/12] mmc: mmci: Retry the busy start
	condition
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

This makes the ux500 ->busy_complete() callback re-read
the status register 10 times while waiting for the busy
signal to assert in the status register.

If this does not happen, we bail out regarding the
command completed already, i.e. before we managed to
start to check the busy status.

There is a comment in the code about this, let's just
implement it to be certain that we can catch this glitch
if it happens.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- Move over the initial saving of host->busy_status from
  an unrelated patch to this one: it is clear what we are
  doing: we don't want to miss any transient
  (MCI_CMDSENT | MCI_CMDRESPEND) in the status register.
---
 drivers/mmc/host/mmci.c | 40 ++++++++++++++++++++++++++++------------
 1 file changed, 28 insertions(+), 12 deletions(-)

diff --git a/drivers/mmc/host/mmci.c b/drivers/mmc/host/mmci.c
index 887b83e392a4..590703075bbc 100644
--- a/drivers/mmc/host/mmci.c
+++ b/drivers/mmc/host/mmci.c
@@ -664,6 +664,7 @@ static u32 ux500v2_get_dctrl_cfg(struct mmci_host *host)
 static bool ux500_busy_complete(struct mmci_host *host, u32 status, u32 err_msk)
 {
 	void __iomem *base = host->base;
+	int retries = 10;
 
 	if (status & err_msk) {
 		/* Stop any ongoing busy detection if an error occurs */
@@ -684,21 +685,36 @@ static bool ux500_busy_complete(struct mmci_host *host, u32 status, u32 err_msk)
 	 * Note that, the card may need a couple of clock cycles before
 	 * it starts signaling busy on DAT0, hence re-read the
 	 * MMCISTATUS register here, to allow the busy bit to be set.
-	 * Potentially we may even need to poll the register for a
-	 * while, to allow it to be set, but tests indicates that it
-	 * isn't needed.
 	 */
 	if (host->busy_state == MMCI_BUSY_IDLE) {
-		status = readl(base + MMCISTATUS);
-		if (status & host->variant->busy_detect_flag) {
-			writel(readl(base + MMCIMASK0) |
-			       host->variant->busy_detect_mask,
-			       base + MMCIMASK0);
-
-			host->busy_status = status & (MCI_CMDSENT | MCI_CMDRESPEND);
-			host->busy_state = MMCI_BUSY_WAITING_FOR_IRQS;
-			return false;
+		/*
+		 * Save the first status register read to be sure to catch
+		 * all bits that may be lost will retrying. If the command
+		 * is still busy this will result in assigning 0 to
+		 * host->busy_status, which is what it should be in IDLE.
+		 */
+		host->busy_status = status & (MCI_CMDSENT | MCI_CMDRESPEND);
+		while (retries) {
+			status = readl(base + MMCISTATUS);
+			if (status & host->variant->busy_detect_flag) {
+				writel(readl(base + MMCIMASK0) |
+				       host->variant->busy_detect_mask,
+				       base + MMCIMASK0);
+
+				/* Keep accumulating status bits */
+				host->busy_status |= status & (MCI_CMDSENT | MCI_CMDRESPEND);
+				host->busy_state = MMCI_BUSY_WAITING_FOR_IRQS;
+				return false;
+			}
+			retries--;
 		}
+		dev_dbg(mmc_dev(host->mmc), "no busy signalling in time\n");
+		writel(host->variant->busy_detect_mask, base + MMCICLEAR);
+		writel(readl(base + MMCIMASK0) &
+		       ~host->variant->busy_detect_mask, base + MMCIMASK0);
+		host->busy_state = MMCI_BUSY_DONE;
+		host->busy_status = 0;
+		return true;
 	}
 
 	/*

-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
