Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A85FAA5FB03
	for <lists+linux-stm32@lfdr.de>; Thu, 13 Mar 2025 17:14:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6B081C78F83;
	Thu, 13 Mar 2025 16:14:43 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DF751C78023
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Mar 2025 16:14:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 3C94EA46745;
 Thu, 13 Mar 2025 16:09:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4906EC4CEEE;
 Thu, 13 Mar 2025 16:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741882480;
 bh=XHzsxcNRyzu969GVfBaBMQi0w2xQRXFs1QAQkqGdpgg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LlpPk8S1uGh9d6LTFPnY1jA7rpW3bHVSbItI+9C8P5cs7ggGtYxf5Yaf9t/QbkwgD
 t8x08DBY943XhQZDV0ch9NDCFaDhT20Ev7EZgb9YDzlwGJ0lDEgWXnwYDkBhCPXwz8
 xRB9VHHS3voN+uQysbf7LO1Zs+nCu6xGHKXKudMCgz8PHd0Uo7pUlmDVtIHpZoNen9
 AfFXusG6JUv39qIui9pjsw/h8yMM6+/ETJ8Y98s/kGiRkcuDgtJoZvK1YsyBZyBJIX
 T6bJ13b4KsWm55FEbyZt6ilgkSO47piInHLEGhzEPw4F0wOCyGKwkT/0m+sZpyhwVK
 +sMwlNKHGVf8A==
From: Philipp Stanner <phasta@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Yanteng Si <si.yanteng@linux.dev>, Huacai Chen <chenhuacai@kernel.org>,
 Yinggang Gu <guyinggang@loongson.cn>,
 Serge Semin <fancer.lancer@gmail.com>,
 Philipp Stanner <pstanner@redhat.com>
Date: Thu, 13 Mar 2025 17:14:21 +0100
Message-ID: <20250313161422.97174-3-phasta@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250313161422.97174-2-phasta@kernel.org>
References: <20250313161422.97174-2-phasta@kernel.org>
MIME-Version: 1.0
Cc: Philipp Stanner <phasta@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Henry Chen <chenx97@aosc.io>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Huacai Chen <chenhuacai@loongson.cn>
Subject: [Linux-stm32] [PATCH net-next 1/3] stmmac: loongson: Remove surplus
	loop
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
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Reviewed-by: Yanteng Si <si.yanteng@linux.dev>
Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>
Tested-by: Henry Chen <chenx97@aosc.io>
---
 .../net/ethernet/stmicro/stmmac/dwmac-loongson.c    | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
index 73a6715a93e6..e2959ac5c1ca 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
@@ -524,7 +524,7 @@ static int loongson_dwmac_probe(struct pci_dev *pdev, const struct pci_device_id
 	struct stmmac_pci_info *info;
 	struct stmmac_resources res;
 	struct loongson_data *ld;
-	int ret, i;
+	int ret;
 
 	plat = devm_kzalloc(&pdev->dev, sizeof(*plat), GFP_KERNEL);
 	if (!plat)
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
