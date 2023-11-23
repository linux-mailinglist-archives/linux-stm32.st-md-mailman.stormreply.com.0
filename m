Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E7E67F5B1E
	for <lists+linux-stm32@lfdr.de>; Thu, 23 Nov 2023 10:36:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A60A7C6B476;
	Thu, 23 Nov 2023 09:36:21 +0000 (UTC)
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com
 [209.85.210.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 08E04C6B444
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Nov 2023 09:36:19 +0000 (UTC)
Received: by mail-ot1-f46.google.com with SMTP id
 46e09a7af769-6d7e794f5d3so441042a34.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Nov 2023 01:36:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700732179; x=1701336979;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dQhHNIKfWiIWad6NjUl3O8AGhzuURYHnVhK+SmvQomg=;
 b=BZiNtwGzypG8ogG9ZH62hEPOv4avOYrmqvpPS07uvJQTHOceuwgAKWp9+GRySXr4NF
 JmFGzRsGC+7VV1zb2TQcv/Bz4CGnhmgbxMYKAi2iSGfyMeBX7v5LfcuEth+fkUYBtTlh
 8nI5jTwQ+7bLw62hMVHeG/alDryohrNi6erYxz9k7sW9ul4Y+nhXiphNRvEzp4yGmwFY
 JmYLu4TnRNl+3rWfVVc4VpXcPHlYppQl9juSJBNaCYfTRThZJKjiaZNo7AVHblVjBrC1
 rGFp5NCNHrIvdUj5ao5jkEvMmYAwSFTmKdUgQMS+sK1QJ12uqr6eBiZ/qkq1Z3sn6BNy
 kvcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700732179; x=1701336979;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dQhHNIKfWiIWad6NjUl3O8AGhzuURYHnVhK+SmvQomg=;
 b=ilun0YBCO+PV6xm28kT+p2ikQPexahgmV8sxegFRryKuj0H+wm1cttQ3CGIbKwobnK
 f0qY0vODPDrWuxvcNtsJtJ/Pg2izUwrw1ywXe1bghmjdHzmuHXaM1Hfow8zMlToFDONG
 qW2s4HBrPFJGmqbLmSl31DKPAAN2PpIwJAMo+H5keZLwWzXZRYJa4tor3Fpb1uhjywlM
 Yx4s5/h4MN72AeR/KZBnNKv0wWPPkMq1c/JvVlpeD+SOQlR5pj1kffBWeDe5UMugiAmR
 unT/Qn+OCGPZR/yoJP/LyPaiE0PZ8/DkKFTIxtVdGSik4Q+JNIgpfhim+FvaVoWnRYaB
 gm5A==
X-Gm-Message-State: AOJu0YyFVirHTl535Axdm87DEWAP3vEh7PNBC1kKh6kQDaxxuD1ahlGq
 b3jG7RhfHchNWofF2kHs6zs=
X-Google-Smtp-Source: AGHT+IEpKb2YEB93s5BEDe/ctdnNVWLRYV7AcKyFu0sGdgnl4YodP6t5BrbO/0iA6SuVCzPswe8etA==
X-Received: by 2002:a9d:6857:0:b0:6d6:4b8b:baf1 with SMTP id
 c23-20020a9d6857000000b006d64b8bbaf1mr5427820oto.23.1700732178744; 
 Thu, 23 Nov 2023 01:36:18 -0800 (PST)
Received: from localhost.localdomain ([74.48.130.204])
 by smtp.googlemail.com with ESMTPSA id
 o13-20020a635a0d000000b005a9b20408a7sm922970pgb.23.2023.11.23.01.36.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Nov 2023 01:36:18 -0800 (PST)
From: Furong Xu <0x1207@gmail.com>
To: "David S. Miller" <davem@davemloft.net>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Joao Pinto <jpinto@synopsys.com>, Simon Horman <horms@kernel.org>
Date: Thu, 23 Nov 2023 17:35:38 +0800
Message-Id: <20231123093538.2216633-1-0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Furong Xu <0x1207@gmail.com>, rock.xu@nio.com, xfr@outlook.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net v1] net: stmmac: xgmac: Disable FPE MMC
	interrupts
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

Commit aeb18dd07692 ("net: stmmac: xgmac: Disable MMC interrupts
by default") leaves the FPE(Frame Preemption) MMC interrupts enabled.
Now we disable FPE TX and RX interrupts too.

Fixes: aeb18dd07692 ("net: stmmac: xgmac: Disable MMC interrupts by default")
Signed-off-by: Furong Xu <0x1207@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/mmc_core.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/mmc_core.c b/drivers/net/ethernet/stmicro/stmmac/mmc_core.c
index ea4910ae0921..cdd7fbde2bfa 100644
--- a/drivers/net/ethernet/stmicro/stmmac/mmc_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/mmc_core.c
@@ -177,8 +177,10 @@
 #define MMC_XGMAC_RX_DISCARD_OCT_GB	0x1b4
 #define MMC_XGMAC_RX_ALIGN_ERR_PKT	0x1bc
 
+#define MMC_XGMAC_FPE_TX_INTR_MASK	0x204
 #define MMC_XGMAC_TX_FPE_FRAG		0x208
 #define MMC_XGMAC_TX_HOLD_REQ		0x20c
+#define MMC_XGMAC_FPE_RX_INTR_MASK	0x224
 #define MMC_XGMAC_RX_PKT_ASSEMBLY_ERR	0x228
 #define MMC_XGMAC_RX_PKT_SMD_ERR	0x22c
 #define MMC_XGMAC_RX_PKT_ASSEMBLY_OK	0x230
@@ -352,6 +354,8 @@ static void dwxgmac_mmc_intr_all_mask(void __iomem *mmcaddr)
 {
 	writel(0x0, mmcaddr + MMC_RX_INTR_MASK);
 	writel(0x0, mmcaddr + MMC_TX_INTR_MASK);
+	writel(MMC_DEFAULT_MASK, mmcaddr + MMC_XGMAC_FPE_TX_INTR_MASK);
+	writel(MMC_DEFAULT_MASK, mmcaddr + MMC_XGMAC_FPE_RX_INTR_MASK);
 	writel(MMC_DEFAULT_MASK, mmcaddr + MMC_XGMAC_RX_IPC_INTR_MASK);
 }
 
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
