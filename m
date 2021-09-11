Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BE7694076D3
	for <lists+linux-stm32@lfdr.de>; Sat, 11 Sep 2021 15:12:33 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 870C5C5A4D3;
	Sat, 11 Sep 2021 13:12:33 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2CC9FC59781
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 11 Sep 2021 13:12:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 08210611BF;
 Sat, 11 Sep 2021 13:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631365950;
 bh=EFMNFVAc5CcSijdhhhVHCaxpm6yJnxx8kYaKNOizbCs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kBMp8Gx8eUongj6OpSwfLMKLKZ/Vlf/9JE+rtHXUhqURe7gBUY8smYocC3K9pSKca
 4IdmfBinbUdwfNfr+IK6q3j1SowQlJZfQco2gjA8J8W9NrbcVqLlRqfM0IRvRyXQnC
 r81xMxtQ6TSslmDv+VbLhEnTqypbSD5E2o/ZO6wn8715crkbChGKu2DEkgWbZzh+Um
 xo/AwESeWa9kZVO8qIr7o1j5uGrgI75Hu8eb2b3Gt5BB4Zar46L7dMiyw8MFSQ2dOz
 rb3h6SuJD0Nw6keYLdpURDQZa2uS/ZClQGHbfFk44GF6clPlGhQ04FE5kG9Ul3p4xS
 9LM8DqE5vETuA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Sat, 11 Sep 2021 09:11:48 -0400
Message-Id: <20210911131149.284397-31-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210911131149.284397-1-sashal@kernel.org>
References: <20210911131149.284397-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Sasha Levin <sashal@kernel.org>, netdev@vger.kernel.org,
 zhaoxiao <long870912@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH AUTOSEL 5.14 31/32] stmmac: dwmac-loongson:Fix
	missing return value
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

From: zhaoxiao <long870912@gmail.com>

[ Upstream commit 5289de5929d1758a95477a4d160195397ccffa7b ]

Add the return value when phy_mode < 0.

Signed-off-by: zhaoxiao <long870912@gmail.com>
Signed-off-by: David S. Miller <davem@davemloft.net>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
index 4c9a37dd0d3f..ecf759ee1c9f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
@@ -109,8 +109,10 @@ static int loongson_dwmac_probe(struct pci_dev *pdev, const struct pci_device_id
 		plat->bus_id = pci_dev_id(pdev);
 
 	phy_mode = device_get_phy_mode(&pdev->dev);
-	if (phy_mode < 0)
+	if (phy_mode < 0) {
 		dev_err(&pdev->dev, "phy_mode not found\n");
+		return phy_mode;
+	}
 
 	plat->phy_interface = phy_mode;
 	plat->interface = PHY_INTERFACE_MODE_GMII;
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
