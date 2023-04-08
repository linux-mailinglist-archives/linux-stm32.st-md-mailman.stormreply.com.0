Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 431096DBD7C
	for <lists+linux-stm32@lfdr.de>; Sun,  9 Apr 2023 00:00:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 89305C6B45E;
	Sat,  8 Apr 2023 22:00:42 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0BB5AC6B44E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  8 Apr 2023 22:00:41 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id r27so2339937lfe.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 08 Apr 2023 15:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680991240;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=68Rc2WXbmYgQ43B8wxGeYxLEsTfSBnBHmmvyKE+wjgE=;
 b=Jng6vM67VkLbQpEqx8soGTvigQAOITwa4rDGWidfa2GHkOXL86H3Vq1tRTtiU6vA4G
 P5WvV6/xJ1NRw98f2cY+/GZgPFodUaspwGjMFtctx17JbDn9My2G88RztkuimPoDcboV
 swYRndtqyjuBLAmHXEFVVZep5N/aUo1QZuBZ6mCy5sB7BIbDLJwEcNLBgAVuFQyodkBN
 ev/bm768A0Dve3wQab2svqiatzbiAdl3INZQOkHU1MXLzERHwNFy4FNAH8hV1/d3JFMc
 9VynWj09z6ZLRgbvCkgUNwJSrO7+sOpiktCRhJMQxrJfp8qbWzVNTNJgQozoKWvn54tF
 8nRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680991240;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=68Rc2WXbmYgQ43B8wxGeYxLEsTfSBnBHmmvyKE+wjgE=;
 b=lzPzWH1/ipmA4NdYhsW3vhI8C8rDxMVFqVXzNw2xGnNv5rqakCj65wPUV79mYvUjbg
 F1Nq9BQ+cjQxx/IVVqrBXZ+/h/YQSbMvVw83QRXOl6jUpCLtkJdrX+/tPjihHqWpwVQs
 cuAKZhOjsSdUscmYLC3BEc5CFauox+EYoH2sDOhddF7yDmknYFQoUrKv4z/zTLzHHzNY
 Sa2mo21358g5DIDBelIu+7Ur9pdRS5uzvMhPkkmTh1wYq4u1oX+P4TNakoulno06y3WR
 J0mRRIc9SabTuusuRNKcoG+65DbfM6JbrMQMVNo7wCGf8yFJfi15G46WPJTVR0O9BWir
 aRgw==
X-Gm-Message-State: AAQBX9cLz7dA6GcWpvzhY8Ns9GOXd8u9ZLa6Xlme7eoP33MgrWDYWZsD
 nVIoYjxMjCsqSLtRLCzh10J+wA==
X-Google-Smtp-Source: AKy350YlfCdenr9RWRKwBxE0XtY7Fl0xZTzRe9Mb8WEbRjfGWi9vUwzBUMckkJButIQ1kGSAgitciQ==
X-Received: by 2002:ac2:47ec:0:b0:4e0:a426:6ddc with SMTP id
 b12-20020ac247ec000000b004e0a4266ddcmr1890164lfp.0.1680991240796; 
 Sat, 08 Apr 2023 15:00:40 -0700 (PDT)
Received: from [192.168.1.2] (c-05d8225c.014-348-6c756e10.bbcust.telenor.se.
 [92.34.216.5]) by smtp.gmail.com with ESMTPSA id
 v9-20020a056512048900b004e9cad1cd7csm1328904lfq.229.2023.04.08.15.00.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Apr 2023 15:00:40 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 09 Apr 2023 00:00:28 +0200
MIME-Version: 1.0
Message-Id: <20230405-pl180-busydetect-fix-v2-7-eeb10323b546@linaro.org>
References: <20230405-pl180-busydetect-fix-v2-0-eeb10323b546@linaro.org>
In-Reply-To: <20230405-pl180-busydetect-fix-v2-0-eeb10323b546@linaro.org>
To: Yann Gautier <yann.gautier@foss.st.com>, 
 Stefan Hansson <newbyte@disroot.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.12.0
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-mmc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v2 07/12] mmc: mmci: Use state machine state
 as exit condition
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
ChangeLog v1->v2:
- No changes
---
 drivers/mmc/host/mmci.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/mmc/host/mmci.c b/drivers/mmc/host/mmci.c
index 590703075bbc..2689c6bb62d6 100644
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
@@ -704,7 +704,7 @@ static bool ux500_busy_complete(struct mmci_host *host, u32 status, u32 err_msk)
 				/* Keep accumulating status bits */
 				host->busy_status |= status & (MCI_CMDSENT | MCI_CMDRESPEND);
 				host->busy_state = MMCI_BUSY_WAITING_FOR_IRQS;
-				return false;
+				goto out_ret_state;
 			}
 			retries--;
 		}
@@ -713,8 +713,7 @@ static bool ux500_busy_complete(struct mmci_host *host, u32 status, u32 err_msk)
 		writel(readl(base + MMCIMASK0) &
 		       ~host->variant->busy_detect_mask, base + MMCIMASK0);
 		host->busy_state = MMCI_BUSY_DONE;
-		host->busy_status = 0;
-		return true;
+		goto out_ret_state;
 	}
 
 	/*
@@ -733,7 +732,7 @@ static bool ux500_busy_complete(struct mmci_host *host, u32 status, u32 err_msk)
 			host->busy_status |= status & (MCI_CMDSENT | MCI_CMDRESPEND);
 			writel(host->variant->busy_detect_mask, base + MMCICLEAR);
 			host->busy_state = MMCI_BUSY_START_IRQ;
-			return false;
+			goto out_ret_state;
 		} else {
 			dev_dbg(mmc_dev(host->mmc),
 				"lost busy status when waiting for busy start IRQ\n");
@@ -742,7 +741,7 @@ static bool ux500_busy_complete(struct mmci_host *host, u32 status, u32 err_msk)
 			       ~host->variant->busy_detect_mask, base + MMCIMASK0);
 			host->busy_state = MMCI_BUSY_DONE;
 			host->busy_status = 0;
-			return true;
+			goto out_ret_state;
 		}
 	}
 
@@ -751,7 +750,7 @@ static bool ux500_busy_complete(struct mmci_host *host, u32 status, u32 err_msk)
 			host->busy_status |= status & (MCI_CMDSENT | MCI_CMDRESPEND);
 			writel(host->variant->busy_detect_mask, base + MMCICLEAR);
 			host->busy_state = MMCI_BUSY_END_IRQ;
-			return false;
+			goto out_ret_state;
 		} else {
 			dev_dbg(mmc_dev(host->mmc),
 				"lost busy status when waiting for busy end IRQ\n");
@@ -760,7 +759,7 @@ static bool ux500_busy_complete(struct mmci_host *host, u32 status, u32 err_msk)
 			       ~host->variant->busy_detect_mask, base + MMCIMASK0);
 			host->busy_state = MMCI_BUSY_DONE;
 			host->busy_status = 0;
-			return true;
+			goto out_ret_state;
 		}
 	}
 
@@ -774,7 +773,7 @@ static bool ux500_busy_complete(struct mmci_host *host, u32 status, u32 err_msk)
 		if (status & host->variant->busy_detect_flag) {
 			/* We should just get two IRQs for busy detect */
 			dev_err(mmc_dev(host->mmc), "spurious busy detect IRQ\n");
-			return false;
+			goto out_ret_state;
 		}
 
 		writel(host->variant->busy_detect_mask, base + MMCICLEAR);
@@ -783,9 +782,13 @@ static bool ux500_busy_complete(struct mmci_host *host, u32 status, u32 err_msk)
 
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
