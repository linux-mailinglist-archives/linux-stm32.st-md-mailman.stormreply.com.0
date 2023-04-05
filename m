Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E5B6D74B1
	for <lists+linux-stm32@lfdr.de>; Wed,  5 Apr 2023 08:50:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 18183C6A613;
	Wed,  5 Apr 2023 06:50:43 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4E697C6A617
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Apr 2023 06:50:41 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id g17so45347212lfv.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 04 Apr 2023 23:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680677440;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=SedxMfIaYADPukzZhH8Geg5DKkhSk0IMn5jBUH6WQ7c=;
 b=sKYVbnpmuCmXmd11jodJYOCxpGxuL4BUxhbyfMi7lHX+/WmeAsgbyeFU+pBvpdGJj/
 OSnbKCfMGCyjjWSZ38H+KyCuzhMLZaPq2YToZ9JW2ZxKAUrdZLm3wl4M3D/Oc9hXknUj
 XvMyrnjRXYdI7dr5Jn0/y9KDi2+GwG/aWmACwMLAj0GWVr5gX6qEM4bcFeDuLtomHt/3
 LPkjTMQtaPQRf5YNR2A0ManO7FtcQG3hpjQ+QSR7zoora7/kYXp85roBnnJbk0zfpjAd
 xLmaiHUU/GQ0jfvAQk+vTJdYYwrUdl2SDCYzAVe3a1pk95EgftcjpI94ROWB5gVnlQra
 WZ7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680677440;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SedxMfIaYADPukzZhH8Geg5DKkhSk0IMn5jBUH6WQ7c=;
 b=gOjX/QmYy9gv+UefbY/Lnbep79vnAdIa25yTzAwpBRYxRnmAj0DkRYNyIb+juI1YID
 HyZVTI6ZAHEpitJ7XzfdrNMBpCuTpQ0CG/pyUm488yps31s+yhvVOV1pk7ohb0rPDxV9
 Hzi7gHpT24jbtLgO6oboswFvTllkVhBf/EXrsDcjXvz0IWPCb/nhD0v7zc65ewOzyP1F
 NEFapFcQX3rre8Zk9GvZgL+0IrL2/J9HPrI4XHgJ2238MJqxgOEwvhVTxhVDAQMOeIe8
 oB68FbiFTQij7lpvIv+MRMT7S4K56NzVBuPqL6/vn5XDkUo68UOcp2pqHYd0UkfN0qCX
 /6jw==
X-Gm-Message-State: AAQBX9fDuaKc+hjHclv1FBbF+QhRbH1iKX2BZAIk4Z9EWyDHN4SH7lrr
 42SslCC0JeQvsdaK9wrYeXSFXQ==
X-Google-Smtp-Source: AKy350ae5XuGbnSNHcqmrQvRUyQYF8kbODHnokFj4Kv5Dc/ENzkhYswUuLUVjYMfQR/kno9SN1buSw==
X-Received: by 2002:ac2:43c2:0:b0:4d8:56d8:92ee with SMTP id
 u2-20020ac243c2000000b004d856d892eemr1205865lfl.35.1680677440764; 
 Tue, 04 Apr 2023 23:50:40 -0700 (PDT)
Received: from [192.168.1.2] (c-05d8225c.014-348-6c756e10.bbcust.telenor.se.
 [92.34.216.5]) by smtp.gmail.com with ESMTPSA id
 z19-20020ac25df3000000b004eb274b3a43sm2683086lfq.134.2023.04.04.23.50.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 23:50:40 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 05 Apr 2023 08:50:34 +0200
MIME-Version: 1.0
Message-Id: <20230405-pl180-busydetect-fix-v1-8-28ac19a74e5e@linaro.org>
References: <20230405-pl180-busydetect-fix-v1-0-28ac19a74e5e@linaro.org>
In-Reply-To: <20230405-pl180-busydetect-fix-v1-0-28ac19a74e5e@linaro.org>
To: Stefan Hansson <newbyte@disroot.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.12.0
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-mmc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 08/13] mmc: mmci: Use state machine state as
	exit condition
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

Return true if and only if we reached the state
MMCI_BUSY_DONE in the ux500 ->busy_complete() callback.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/mmc/host/mmci.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/mmc/host/mmci.c b/drivers/mmc/host/mmci.c
index 670b1622d282..734e8364b2f6 100644
--- a/drivers/mmc/host/mmci.c
+++ b/drivers/mmc/host/mmci.c
@@ -673,7 +673,7 @@ static bool ux500_busy_complete(struct mmci_host *host, u32 status, u32 err_msk)
 		       ~host->variant->busy_detect_mask, base + MMCIMASK0);
 		host->busy_state = MMCI_BUSY_DONE;
 		host->busy_status = 0;
-		return true;
+		goto out_ret_state;
 	}
 
 	/*
@@ -697,7 +697,7 @@ static bool ux500_busy_complete(struct mmci_host *host, u32 status, u32 err_msk)
 
 				host->busy_status |= status & (MCI_CMDSENT | MCI_CMDRESPEND);
 				host->busy_state = MMCI_BUSY_WAITING_FOR_IRQS;
-				return false;
+				goto out_ret_state;
 			}
 			retries--;
 		}
@@ -706,8 +706,7 @@ static bool ux500_busy_complete(struct mmci_host *host, u32 status, u32 err_msk)
 		writel(readl(base + MMCIMASK0) &
 		       ~host->variant->busy_detect_mask, base + MMCIMASK0);
 		host->busy_state = MMCI_BUSY_DONE;
-		host->busy_status = 0;
-		return true;
+		goto out_ret_state;
 	}
 
 	/*
@@ -726,7 +725,7 @@ static bool ux500_busy_complete(struct mmci_host *host, u32 status, u32 err_msk)
 			host->busy_status |= status & (MCI_CMDSENT | MCI_CMDRESPEND);
 			writel(host->variant->busy_detect_mask, base + MMCICLEAR);
 			host->busy_state = MMCI_BUSY_START_IRQ;
-			return false;
+			goto out_ret_state;
 		} else {
 			dev_dbg(mmc_dev(host->mmc),
 				"lost busy status when waiting for busy start IRQ\n");
@@ -735,7 +734,7 @@ static bool ux500_busy_complete(struct mmci_host *host, u32 status, u32 err_msk)
 			       ~host->variant->busy_detect_mask, base + MMCIMASK0);
 			host->busy_state = MMCI_BUSY_DONE;
 			host->busy_status = 0;
-			return true;
+			goto out_ret_state;
 		}
 	}
 
@@ -744,7 +743,7 @@ static bool ux500_busy_complete(struct mmci_host *host, u32 status, u32 err_msk)
 			host->busy_status |= status & (MCI_CMDSENT | MCI_CMDRESPEND);
 			writel(host->variant->busy_detect_mask, base + MMCICLEAR);
 			host->busy_state = MMCI_BUSY_END_IRQ;
-			return false;
+			goto out_ret_state;
 		} else {
 			dev_dbg(mmc_dev(host->mmc),
 				"lost busy status when waiting for busy end IRQ\n");
@@ -753,7 +752,7 @@ static bool ux500_busy_complete(struct mmci_host *host, u32 status, u32 err_msk)
 			       ~host->variant->busy_detect_mask, base + MMCIMASK0);
 			host->busy_state = MMCI_BUSY_DONE;
 			host->busy_status = 0;
-			return true;
+			goto out_ret_state;
 		}
 	}
 
@@ -767,7 +766,7 @@ static bool ux500_busy_complete(struct mmci_host *host, u32 status, u32 err_msk)
 		if (status & host->variant->busy_detect_flag) {
 			/* We should just get two IRQs for busy detect */
 			dev_err(mmc_dev(host->mmc), "spurious busy detect IRQ\n");
-			return false;
+			goto out_ret_state;
 		}
 
 		writel(host->variant->busy_detect_mask, base + MMCICLEAR);
@@ -776,9 +775,13 @@ static bool ux500_busy_complete(struct mmci_host *host, u32 status, u32 err_msk)
 
 		host->busy_state = MMCI_BUSY_DONE;
 		host->busy_status = 0;
+	} else {
+		dev_dbg(mmc_dev(host->mmc), "fell through on state %d\n",
+			host->busy_state);
 	}
 
-	return true;
+out_ret_state:
+	return (host->busy_state == MMCI_BUSY_DONE);
 }
 
 /*

-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
