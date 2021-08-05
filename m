Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A34DA3E1A1F
	for <lists+linux-stm32@lfdr.de>; Thu,  5 Aug 2021 19:11:21 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6B2EFC597BE;
	Thu,  5 Aug 2021 17:11:21 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 07ED8C597AF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Aug 2021 17:11:20 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id x14so9371763edr.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 05 Aug 2021 10:11:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3Zmyx7SsE2CZ1f1aWOzazG1eiYj3hoTl2IjNLvtlL+c=;
 b=s1L089spP4v8oCOSoILq8WSMZE/tVEyt49P4fJDFwnNL1Jozk00CAI+ilftjAdmncf
 QLuNQrV1aGttOG6Yy6IP78YuVpYzO30urdRPaS/t8pEoHsuxV/FdUaUecsHcKRp2GwbZ
 VzjN/I25SPUw1MyRjCQV4c4nOJ6NxuPW5vZNPH6l10w3Ut0fj8vLbgcUO0TPIE22D/UZ
 lr6c1SM607C7vHEbPZBVAgUWqXKEMN0rTg7pomlKjX4xNxpT76toWaihma8Gldh4ghGt
 kC2ctIcQ4z+4T4HSRYQ5FUE1l4oDTttQQDr0I6znr/meq6lwkQ+B4dfUPr3wkpUqOSWp
 6Jfw==
X-Gm-Message-State: AOAM533hv0b1jwg5PlSXT12/mtpa0ASQBw0vgU42CKaBNPBvjshTMDxu
 EUQVh/h40ASKjW5IDJz+1cw=
X-Google-Smtp-Source: ABdhPJzLqHFvCFevmrya4YFKb6AejF9zs+3Of0jN857PIM+ynmoddWFCAw8SdwMdoDtjp3aQ+rbMlw==
X-Received: by 2002:a05:6402:13d8:: with SMTP id
 a24mr7911446edx.158.1628183479714; 
 Thu, 05 Aug 2021 10:11:19 -0700 (PDT)
Received: from msft-t490s.fritz.box
 (host-80-116-27-227.retail.telecomitalia.it. [80.116.27.227])
 by smtp.gmail.com with ESMTPSA id n2sm2592655edi.32.2021.08.05.10.11.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Aug 2021 10:11:19 -0700 (PDT)
From: Matteo Croce <mcroce@linux.microsoft.com>
To: netdev@vger.kernel.org
Date: Thu,  5 Aug 2021 19:11:01 +0200
Message-Id: <20210805171101.13776-3-mcroce@linux.microsoft.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210805171101.13776-1-mcroce@linux.microsoft.com>
References: <20210805171101.13776-1-mcroce@linux.microsoft.com>
MIME-Version: 1.0
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-kernel@vger.kernel.org, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [RFT net-next 2/2] stmmac: skb recycling
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

From: Matteo Croce <mcroce@microsoft.com>

Signed-off-by: Matteo Croce <mcroce@microsoft.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 30a0d915cd4b..2c48f1b5e9e9 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -5219,7 +5219,7 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 			skb_reserve(skb, buf->page_offset);
 			skb_put(skb, buf1_len);
 
-			page_pool_release_page(rx_q->page_pool, buf->page);
+			skb_mark_for_recycle(skb, buf->page, rx_q->page_pool);
 			buf->page = NULL;
 		} else if (buf1_len) {
 			dma_sync_single_for_cpu(priv->device, buf->addr,
@@ -5229,7 +5229,7 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 					priv->dma_buf_sz);
 
 			/* Data payload appended into SKB */
-			page_pool_release_page(rx_q->page_pool, buf->page);
+			page_pool_store_mem_info(buf->page, rx_q->page_pool);
 			buf->page = NULL;
 		}
 
@@ -5241,7 +5241,7 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 					priv->dma_buf_sz);
 
 			/* Data payload appended into SKB */
-			page_pool_release_page(rx_q->page_pool, buf->sec_page);
+			page_pool_store_mem_info(buf->sec_page, rx_q->page_pool);
 			buf->sec_page = NULL;
 		}
 
-- 
2.31.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
