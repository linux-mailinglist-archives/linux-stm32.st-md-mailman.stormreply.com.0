Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C39937FC701
	for <lists+linux-stm32@lfdr.de>; Tue, 28 Nov 2023 22:08:02 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 88242C6B44B;
	Tue, 28 Nov 2023 21:08:02 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 88285C6B444
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Nov 2023 21:08:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6E0136167F;
 Tue, 28 Nov 2023 21:08:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92ECBC433C9;
 Tue, 28 Nov 2023 21:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701205680;
 bh=yALPx1clsSjw3MvJ0Uiu/tLK0uzvuU1ZwBeCGgp4gq0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DW17IbtxPtEfvv8lb1Zftvafdptlb18d7LMe2R2HothpRI+fNnWDBz3iH2DAbRpcV
 sVKu9JIzfUTy2Fml3GcvITQG2O5C4myOmIFNGZwJHiQFfysRyppaQY22T34be2HElE
 wSeQ2VA4gNIKJYGoa+FSYbmbSwPkL9A/NyVmiklFK7+JW2WfvTzgRg4AxlegLyE44G
 xMPgMcG/sdC3nyU72HdDLm0wVAT9fLK0K9r3eeIKPrOMjJ6Yofe9MrE3/4g903bFoe
 1OAmCji1g6xk6iNFYDERKzb3taPzjR5UZ9cuX1Ocr0yGFj4Pm6EGyEzBDg08I4ahdZ
 iMCwBBwBTmQEQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Tue, 28 Nov 2023 16:07:19 -0500
Message-ID: <20231128210750.875945-3-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231128210750.875945-1-sashal@kernel.org>
References: <20231128210750.875945-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.64
Cc: Sasha Levin <sashal@kernel.org>, mcoquelin.stm32@gmail.com,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 edumazet@google.com, joabreu@synopsys.com,
 linux-arm-kernel@lists.infradead.org, Simon Horman <horms@kernel.org>,
 kuba@kernel.org, pabeni@redhat.com, Keguang Zhang <keguang.zhang@gmail.com>,
 "David S . Miller" <davem@davemloft.net>, Jean Delvare <jdelvare@suse.de>
Subject: [Linux-stm32] [PATCH AUTOSEL 6.1 03/25] stmmac: dwmac-loongson: Add
	architecture dependency
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

From: Jean Delvare <jdelvare@suse.de>

[ Upstream commit 7fbd5fc2b35a8f559a6b380dfa9bcd964a758186 ]

Only present the DWMAC_LOONGSON option on architectures where it can
actually be used.

This follows the same logic as the DWMAC_INTEL option.

Signed-off-by: Jean Delvare <jdelvare@suse.de>
Cc: Keguang Zhang <keguang.zhang@gmail.com>
Reviewed-by: Simon Horman <horms@kernel.org>
Signed-off-by: David S. Miller <davem@davemloft.net>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/ethernet/stmicro/stmmac/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
index 31ff351740342..58091ee2bfe60 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
+++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
@@ -256,7 +256,7 @@ config DWMAC_INTEL
 config DWMAC_LOONGSON
 	tristate "Loongson PCI DWMAC support"
 	default MACH_LOONGSON64
-	depends on STMMAC_ETH && PCI
+	depends on (MACH_LOONGSON64 || COMPILE_TEST) && STMMAC_ETH && PCI
 	depends on COMMON_CLK
 	help
 	  This selects the LOONGSON PCI bus support for the stmmac driver,
-- 
2.42.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
