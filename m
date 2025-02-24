Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E28A42208
	for <lists+linux-stm32@lfdr.de>; Mon, 24 Feb 2025 14:53:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 19923C78F60;
	Mon, 24 Feb 2025 13:53:44 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B41ABC6DD6D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Feb 2025 13:53:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BB4275C4C82;
 Mon, 24 Feb 2025 13:53:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5A54C4CEEA;
 Mon, 24 Feb 2025 13:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740405221;
 bh=5xrxXhAp1q9xlycoc9AVu+owuxCr14/GLlxmzUJC94w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UgtfwNWwofNITGYl9SNjVj8FFLk0w7GNMLyFzybfZUfSDEgV5GJ/1eZXQ+4xM0gp6
 XVC1dsBHnsqw8JH5rRcwprEF362Ltz+bm7pM8v95eXOhnrzpg7a7xSIdjgVnHs82LG
 QqoVv6/WCVSCClunFpIjuS5hn1bhxMe+Iun5qjin8w6mBLXf17Mw4I2Dc/Z/elx5we
 CMK/EtvSgAd82kpUyUdA5c+fPrgFKI13OPuAfeA29I3kWwZbEAnXtPveJvr1uMuP/3
 e6F9UFH7TgLKAiitci/oIX738FEn5x4wZIwBfVU9w2mKB9874f7DYhQRj2xKjX42iS
 qg+LP545S/HxQ==
From: Philipp Stanner <phasta@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Huacai Chen <chenhuacai@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
 Yinggang Gu <guyinggang@loongson.cn>,
 Feiyang Chen <chenfeiyang@loongson.cn>,
 Philipp Stanner <pstanner@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Qing Zhang <zhangqing@loongson.cn>
Date: Mon, 24 Feb 2025 14:53:20 +0100
Message-ID: <20250224135321.36603-4-phasta@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250224135321.36603-2-phasta@kernel.org>
References: <20250224135321.36603-2-phasta@kernel.org>
MIME-Version: 1.0
Cc: Philipp Stanner <phasta@kernel.org>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH net-next v3 2/4] stmmac: loongson: Remove
	surplus loop
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

loongson_dwmac_probe() contains a loop which doesn't have an effect,
because it tries to call pcim_iomap_regions() with the same parameters
several times. The break statement at the loop's end furthermore ensures
that the loop only runs once anyways.

Remove the surplus loop.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
index 73a6715a93e6..e3cacd085b3f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
@@ -554,14 +554,9 @@ static int loongson_dwmac_probe(struct pci_dev *pdev, const struct pci_device_id
 	pci_set_master(pdev);
 
 	/* Get the base address of device */
-	for (i = 0; i < PCI_STD_NUM_BARS; i++) {
-		if (pci_resource_len(pdev, i) == 0)
-			continue;
-		ret = pcim_iomap_regions(pdev, BIT(0), DRIVER_NAME);
-		if (ret)
-			goto err_disable_device;
-		break;
-	}
+	ret = pcim_iomap_regions(pdev, BIT(0), DRIVER_NAME);
+	if (ret)
+		goto err_disable_device;
 
 	memset(&res, 0, sizeof(res));
 	res.addr = pcim_iomap_table(pdev)[0];
-- 
2.48.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
