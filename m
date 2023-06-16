Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 019E27329CE
	for <lists+linux-stm32@lfdr.de>; Fri, 16 Jun 2023 10:30:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C1081C6B45E;
	Fri, 16 Jun 2023 08:30:42 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3E921C6B455
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Jun 2023 08:30:42 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-4f8467e39cfso488498e87.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Jun 2023 01:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686904241; x=1689496241;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=AKBnKIdK2CO+P/WwZHo2AYQY3pe5441V6fpY4p0irEc=;
 b=rK4mZCX/IjZuLgF8DNqx1Su73VwpJdM0o0SzCj50IzO4/6TsEcJHwanPqvaMP8Ldcb
 zw+HivJZThGGPCh9dAW3zNu8Nfopj38bxnvpNvhBGo/Vzvg2hmyHZVQI9+ybocZXwIdj
 EyxYjrZDWuRLMiuQIRDXFRkraIVC8Euo+0buQ7MPgaDo6Tob4b7tODOhzqEvmzYZnjHy
 vjPIKqquUl77LAzsxMuSJZwVcRnIf6gfcayvek5y80lzfnBr+gYjwoHWficJOPt0/dZ7
 m6R+e5a4/ptMecSECvjhXTTuKhlDsCL+NN5YRtp3koLs9nJ93U3/4/MbfZNo48F8IfE5
 FJ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686904241; x=1689496241;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AKBnKIdK2CO+P/WwZHo2AYQY3pe5441V6fpY4p0irEc=;
 b=k/KuaMUduNZ0hGHMbf6B3CDsV+P+8DMJOa2w4R7q1sSjN8XtnJMzcP2KaNxYM0cK5w
 G4krTi5r1f2zP9iKQfmneoJiPX8i/GiaA6ezMMPwNJ4/bWzDPowPpUPRRfLjKCtnnI8n
 RYYXzP1ctAQBozNJkXflGJG2ZNFfJqkZqozgs7bE716kRF/00lRRUcCOCyLkBz39L0F4
 Gd5DCmDZvyjwBA34Cj5YmoVIIpXn3m2XoSE5ZNR/9r22YU0S4NIs8k0im29rWORAs6wC
 0KV0sGANxicv4lNsqZgVCDiFfDqJkAFZOiqhtH3SPxPD88diX9ANyvUYf4UklpGEu/GN
 jKIQ==
X-Gm-Message-State: AC+VfDyKAh2z/1yrkooUjB+A8wNLhB3Y/HqjHwdfNCRKWyaiksuskCuz
 TcmhuVpj+p2mO2jhj0i0Zvc30g==
X-Google-Smtp-Source: ACHHUZ69GNE4ZOqc3XtliTEHCTLTnYoMy/Zbi656rhwXpt06TURFYrcxTdKki18tWOPEX1/NdQoXRg==
X-Received: by 2002:ac2:5b08:0:b0:4f7:4f30:1532 with SMTP id
 v8-20020ac25b08000000b004f74f301532mr727845lfn.31.1686904241687; 
 Fri, 16 Jun 2023 01:30:41 -0700 (PDT)
Received: from [192.168.1.2] (c-05d8225c.014-348-6c756e10.bbcust.telenor.se.
 [92.34.216.5]) by smtp.gmail.com with ESMTPSA id
 j8-20020ac25508000000b004eb44c2ab6bsm2918106lfk.294.2023.06.16.01.30.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jun 2023 01:30:41 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 16 Jun 2023 10:30:39 +0200
MIME-Version: 1.0
Message-Id: <20230405-pl180-busydetect-fix-v6-7-b850ec8019f3@linaro.org>
References: <20230405-pl180-busydetect-fix-v6-0-b850ec8019f3@linaro.org>
In-Reply-To: <20230405-pl180-busydetect-fix-v6-0-b850ec8019f3@linaro.org>
To: Yann Gautier <yann.gautier@foss.st.com>, 
 Stefan Hansson <newbyte@disroot.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.12.2
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-mmc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v6 7/9] mmc: mmci: Use state machine state as
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
ChangeLog v4->v6:
- No changes.
ChangeLog v3->v4:
- No changes.
ChangeLog v2->v3:
- Rebased.
ChangeLog v1->v2:
- No changes
---
 drivers/mmc/host/mmci.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/mmc/host/mmci.c b/drivers/mmc/host/mmci.c
index 6ae56c973b0d..437b2144ecd4 100644
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
@@ -703,7 +703,7 @@ static bool ux500_busy_complete(struct mmci_host *host, u32 status, u32 err_msk)
 				       host->variant->busy_detect_mask,
 				       base + MMCIMASK0);
 				host->busy_state = MMCI_BUSY_WAITING_FOR_START_IRQ;
-				return false;
+				goto out_ret_state;
 			}
 			retries--;
 		}
@@ -712,8 +712,7 @@ static bool ux500_busy_complete(struct mmci_host *host, u32 status, u32 err_msk)
 		writel(readl(base + MMCIMASK0) &
 		       ~host->variant->busy_detect_mask, base + MMCIMASK0);
 		host->busy_state = MMCI_BUSY_DONE;
-		host->busy_status = 0;
-		return true;
+		goto out_ret_state;
 	}
 
 	/*
@@ -732,7 +731,7 @@ static bool ux500_busy_complete(struct mmci_host *host, u32 status, u32 err_msk)
 			host->busy_status |= status & (MCI_CMDSENT | MCI_CMDRESPEND);
 			writel(host->variant->busy_detect_mask, base + MMCICLEAR);
 			host->busy_state = MMCI_BUSY_WAITING_FOR_END_IRQ;
-			return false;
+			goto out_ret_state;
 		} else {
 			dev_dbg(mmc_dev(host->mmc),
 				"lost busy status when waiting for busy start IRQ\n");
@@ -741,7 +740,7 @@ static bool ux500_busy_complete(struct mmci_host *host, u32 status, u32 err_msk)
 			       ~host->variant->busy_detect_mask, base + MMCIMASK0);
 			host->busy_state = MMCI_BUSY_DONE;
 			host->busy_status = 0;
-			return true;
+			goto out_ret_state;
 		}
 	}
 
@@ -749,7 +748,7 @@ static bool ux500_busy_complete(struct mmci_host *host, u32 status, u32 err_msk)
 		if (!(status & host->variant->busy_detect_flag)) {
 			host->busy_status |= status & (MCI_CMDSENT | MCI_CMDRESPEND);
 			host->busy_state = MMCI_BUSY_DONE;
-			return false;
+			goto out_ret_state;
 		} else {
 			dev_dbg(mmc_dev(host->mmc),
 				"busy status still asserted when handling busy end IRQ\n");
@@ -759,11 +758,14 @@ static bool ux500_busy_complete(struct mmci_host *host, u32 status, u32 err_msk)
 			       ~host->variant->busy_detect_mask, base + MMCIMASK0);
 			host->busy_state = MMCI_BUSY_DONE;
 			host->busy_status = 0;
-			return true;
+			goto out_ret_state;
 		}
 	}
 
 	return true;
+
+out_ret_state:
+	return (host->busy_state == MMCI_BUSY_DONE);
 }
 
 /*

-- 
2.40.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
