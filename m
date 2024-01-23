Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 12CA7838AD7
	for <lists+linux-stm32@lfdr.de>; Tue, 23 Jan 2024 10:50:24 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B0E07C6DD6C;
	Tue, 23 Jan 2024 09:50:23 +0000 (UTC)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com
 [209.85.167.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 46AB8C6DD6B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Jan 2024 09:50:22 +0000 (UTC)
Received: by mail-oi1-f182.google.com with SMTP id
 5614622812f47-3bd72353d9fso3405502b6e.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Jan 2024 01:50:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706003421; x=1706608221;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PB92u9IW1i3UPi9lwUSJ6To660URrQExv6UFr5Kbu60=;
 b=XYQdpUn4WDF3wE7PT4au8WmNYqau3Dg7DCQ6creR0ArCZgld2XoDFwFRR4eANjJ5qu
 WEEpLO0I8FSY+zcnYD1ITwT3LS9Dj0jLn58a2DqPoPMWr67+BkOso6JMqqoXuUrEbyHs
 2SsjaQw2/P6k1HWo2irqwZzR0UQYQcLnBIK/WM7yugTFaagCrmHQ/yKJVTLHBprJ/m70
 g97WGygHhfAAJ/aei3IXNBTtRbnk9o0xyQn/L8/d6TsutJzBQqDiTFJgvuamfia9hEjc
 IDNqhKCY9qdXQ+NmKS6BxxgOiw4GXWpiO4sdGwE3yrM1G2ymD/3jqvXlLAmMVVEADmJk
 NwCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706003421; x=1706608221;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PB92u9IW1i3UPi9lwUSJ6To660URrQExv6UFr5Kbu60=;
 b=pQAEf8Dkr3KtCTmJ2y2UGnP4j01IDYiQBAIS+RA522w237NAjdt7Jv5Nd6pjkRjAAG
 kF5YNSSAIkXazxGAEZoZ03r14vLwRS+IMhdtWxvdNhrcGeu9EiQXSQiCW6IKuNtN5kD+
 ACPmNwXTOauPwPBuW2MTNsjQqJCNxnzmOg4kTKAk5MH2f3dQRTgDBQ6zB5r2wkA7oj/1
 W1TKrh1i9ba6LTlf4Qmc5bo6V5yaGpTlj+MxDCpzSF936vrzWoZDSEzOfn4HRMbHATZF
 R73EPvl7GcxOdXRKObKKWbyavFSWiYflTeT+wdwADTRiWrI9Er6D0CMZGbGyACJQqchO
 8JyA==
X-Gm-Message-State: AOJu0YwcFNUh0YjeAqXT0uRjFY3zoo0qmBqIbHbDYXki32C97l4huuNP
 rMKYvK/QtO8kZ58Mmx1/a06sO0KA1pTf1gRSpMGVWmDPp86FkKb0
X-Google-Smtp-Source: AGHT+IFB2J7jlF2o323XuO6+0bPEVEQ5/i7o6OTowMJfhE3eJOKff9Hrtb7aB0/Z8Z/+nyeQkppHqA==
X-Received: by 2002:a05:6808:1a17:b0:3bd:c43b:f935 with SMTP id
 bk23-20020a0568081a1700b003bdc43bf935mr1051159oib.9.1706003420915; 
 Tue, 23 Jan 2024 01:50:20 -0800 (PST)
Received: from localhost.localdomain ([112.65.140.130])
 by smtp.googlemail.com with ESMTPSA id
 lp4-20020a056a003d4400b006dce766903dsm1325482pfb.90.2024.01.23.01.50.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jan 2024 01:50:20 -0800 (PST)
From: Furong Xu <0x1207@gmail.com>
To: "David S. Miller" <davem@davemloft.net>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Joao Pinto <jpinto@synopsys.com>, Simon Horman <horms@kernel.org>
Date: Tue, 23 Jan 2024 17:50:06 +0800
Message-Id: <20240123095006.979437-1-0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Furong Xu <0x1207@gmail.com>, rock.xu@nio.com, xfr@outlook.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net] net: stmmac: xgmac: fix handling of DPP
	safety error for DMA channels
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

Commit 56e58d6c8a56 ("net: stmmac: Implement Safety Features in
XGMAC core") checks and reports safety errors, but leaves the
Data Path Parity Errors for each channel in DMA unhandled at all, lead to
a storm of interrupt.
Fix it by checking and clearing the DMA_DPP_Interrupt_Status register.

Fixes: 56e58d6c8a56 ("net: stmmac: Implement Safety Features in XGMAC core")
Signed-off-by: Furong Xu <0x1207@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h      | 1 +
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
index 207ff1799f2c..188e11683136 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
@@ -385,6 +385,7 @@
 #define XGMAC_DCEIE			BIT(1)
 #define XGMAC_TCEIE			BIT(0)
 #define XGMAC_DMA_ECC_INT_STATUS	0x0000306c
+#define XGMAC_DMA_DPP_INT_STATUS	0x00003074
 #define XGMAC_DMA_CH_CONTROL(x)		(0x00003100 + (0x80 * (x)))
 #define XGMAC_SPH			BIT(24)
 #define XGMAC_PBLx8			BIT(16)
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
index eb48211d9b0e..874e85b499e2 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
@@ -745,6 +745,12 @@ static void dwxgmac3_handle_mac_err(struct net_device *ndev,
 
 	dwxgmac3_log_error(ndev, value, correctable, "MAC",
 			   dwxgmac3_mac_errors, STAT_OFF(mac_errors), stats);
+
+	value = readl(ioaddr + XGMAC_DMA_DPP_INT_STATUS);
+	writel(value, ioaddr + XGMAC_DMA_DPP_INT_STATUS);
+
+	if (value)
+		netdev_err(ndev, "Found DMA_DPP error, status: 0x%x\n", value);
 }
 
 static const struct dwxgmac3_error_desc dwxgmac3_mtl_errors[32]= {
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
