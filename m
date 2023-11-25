Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E60AF7F888B
	for <lists+linux-stm32@lfdr.de>; Sat, 25 Nov 2023 07:02:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8D2B9C6B47A;
	Sat, 25 Nov 2023 06:02:22 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
 [209.85.215.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CCA29C6B44B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 25 Nov 2023 06:02:20 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id
 41be03b00d2f7-5c21e185df5so1787228a12.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Nov 2023 22:02:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700892139; x=1701496939;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FclhQf3qesEshzQHC5UsLSEyaxrJX7Yi4QUTwlsrBzo=;
 b=OJgLh8iv4aYOQUc/Fy13OnZeYF4xVebgZeJ6EPRU/JC/7er7GaKQfQDW7wARH8jWpi
 4I9Zm5U5rnQJvGAiM23gVAzudvOCg/T1Qv3OCXR1A4rWQb/BTjz168UmMd7w248ExMep
 hKwSYP1ImTE9/iBsuNq4Ws8oiVZIW6J0+gE9TFcsqe/I3SiMmVFdBbbOKGkgWA8GwFJG
 APmIEs2fc/nkVuI+kxXxUsvjz8WJYdDB4qPSFqTmY1eQLAabIPBOG/irpLqdS091V9+/
 6AFZfxWWrdKps6lfmnH4LrcWsuPyiGDZfKjrMU3x0IluoPMIgUeguuTD7vhO9T43gvxa
 MYWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700892139; x=1701496939;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FclhQf3qesEshzQHC5UsLSEyaxrJX7Yi4QUTwlsrBzo=;
 b=U7nRP5FLkavgwsGg3PdE8a8fSHFi3YgfXHMs3KJACrVPCJIHqKay77OB7xRLAFcdOg
 tnlIfZZGhlD4BL4GTqvB2rT5tV+b35jMWPYK1qMLSMlq74y/lxp2JhOCoa+g/3lBuuWt
 m0vv6uA8wWyO8fqgrFJe2EhzFJE11diTFDW1PGqp/BwtP6qDveKrnmaqtx4uwU4d0mJX
 tQBoJl2hLO5lHRiAibV2lcJG4uXSyV78mt6rSOe6eZ9WjQbE/3oej8m5v62T1vfbjX/4
 NZK6QCqpX6Y+XS2CX2zohnEMOUPvstMhtJZ2mDPU4g4u3qEOb2FUdaPLhdhOyzUicQr4
 9Vyg==
X-Gm-Message-State: AOJu0Yz58fsTd6+T4Uw9yHlvx3SofVmC9lX8q8BDahx+I7Ge4flf57Se
 1FwdJlxuVGlM4sF171IPRUI=
X-Google-Smtp-Source: AGHT+IEyIZv6kPKcJuJsdF5mkhJzsr0Y/Z/jY64tcTkX225IcRn/vjh+aCjOupIC+C0YVipqna0Edg==
X-Received: by 2002:a17:903:2596:b0:1cf:9d88:a0ef with SMTP id
 jb22-20020a170903259600b001cf9d88a0efmr4177631plb.59.1700892139281; 
 Fri, 24 Nov 2023 22:02:19 -0800 (PST)
Received: from localhost.localdomain ([74.48.130.204])
 by smtp.googlemail.com with ESMTPSA id
 h11-20020a170902f7cb00b001c9c97beb9csm4142059plw.71.2023.11.24.22.02.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Nov 2023 22:02:18 -0800 (PST)
From: Furong Xu <0x1207@gmail.com>
To: "David S. Miller" <davem@davemloft.net>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Joao Pinto <jpinto@synopsys.com>, Simon Horman <horms@kernel.org>
Date: Sat, 25 Nov 2023 14:01:26 +0800
Message-Id: <20231125060126.2328690-1-0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: Larysa Zaremba <larysa.zaremba@intel.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Furong Xu <0x1207@gmail.com>, rock.xu@nio.com,
 xfr@outlook.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net v3] net: stmmac: xgmac: Disable FPE MMC
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
by default") tries to disable MMC interrupts to avoid a storm of
unhandled interrupts, but leaves the FPE(Frame Preemption) MMC
interrupts enabled, FPE MMC interrupts can cause the same problem.
Now we mask FPE TX and RX interrupts to disable all MMC interrupts.

Fixes: aeb18dd07692 ("net: stmmac: xgmac: Disable MMC interrupts by default")
Reviewed-by: Larysa Zaremba <larysa.zaremba@intel.com>
Signed-off-by: Furong Xu <0x1207@gmail.com>
---
Changes in v3:
  - Update commit message, thanks Larysa.
  - Rename register defines, thanks Serge.

Changes in v2:
  - Update commit message, thanks Wojciech and Andrew.
---
 drivers/net/ethernet/stmicro/stmmac/mmc_core.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/mmc_core.c b/drivers/net/ethernet/stmicro/stmmac/mmc_core.c
index ea4910ae0921..6a7c1d325c46 100644
--- a/drivers/net/ethernet/stmicro/stmmac/mmc_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/mmc_core.c
@@ -177,8 +177,10 @@
 #define MMC_XGMAC_RX_DISCARD_OCT_GB	0x1b4
 #define MMC_XGMAC_RX_ALIGN_ERR_PKT	0x1bc
 
+#define MMC_XGMAC_TX_FPE_INTR_MASK	0x204
 #define MMC_XGMAC_TX_FPE_FRAG		0x208
 #define MMC_XGMAC_TX_HOLD_REQ		0x20c
+#define MMC_XGMAC_RX_FPE_INTR_MASK	0x224
 #define MMC_XGMAC_RX_PKT_ASSEMBLY_ERR	0x228
 #define MMC_XGMAC_RX_PKT_SMD_ERR	0x22c
 #define MMC_XGMAC_RX_PKT_ASSEMBLY_OK	0x230
@@ -352,6 +354,8 @@ static void dwxgmac_mmc_intr_all_mask(void __iomem *mmcaddr)
 {
 	writel(0x0, mmcaddr + MMC_RX_INTR_MASK);
 	writel(0x0, mmcaddr + MMC_TX_INTR_MASK);
+	writel(MMC_DEFAULT_MASK, mmcaddr + MMC_XGMAC_TX_FPE_INTR_MASK);
+	writel(MMC_DEFAULT_MASK, mmcaddr + MMC_XGMAC_RX_FPE_INTR_MASK);
 	writel(MMC_DEFAULT_MASK, mmcaddr + MMC_XGMAC_RX_IPC_INTR_MASK);
 }
 
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
