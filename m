Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4614252B9CA
	for <lists+linux-stm32@lfdr.de>; Wed, 18 May 2022 14:27:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E5BA6C03FDB;
	Wed, 18 May 2022 12:27:34 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0CEE0C03FC8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 May 2022 12:27:33 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A60E36164D;
 Wed, 18 May 2022 12:27:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5161AC34100;
 Wed, 18 May 2022 12:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652876852;
 bh=CjDagl7s1yUewHYXWMFrzcpaB6LIIM2ZSZMxbuBP6VU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hnC4SkjNnasn60+AMYnP+GabZRdRbbhXyBiudAEKnIT3Il/cnGrVK7x76SD6EuDAb
 kAM1/hxRcUNDEvAMNMdAb/X54hC6qgHTCEIUmfVbo8M3bJvnWeqotAk6xMB6NXDmex
 Apu2alnli9TMqn/ZIWIrMOSc1t65XfkRT6rtZ5CpDpI444/prtbAiHMxRx329PgWZL
 tbLqHmBOv5tTRJ8z26tYJ3ZSFPl/UFOnp3KaiihLJbexYdSvhySNcfEomnWxNEdctH
 XXF07ivaBJ6HC/11fQ1y+gyS1g4qQAa3ubNcKAb7F1T6WO7Y+X5SOo2UhaGiQcoYjJ
 ghaB7t7WzeJKQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Wed, 18 May 2022 08:26:30 -0400
Message-Id: <20220518122641.342120-17-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220518122641.342120-1-sashal@kernel.org>
References: <20220518122641.342120-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Sasha Levin <sashal@kernel.org>, netdev@vger.kernel.org,
 Yang Yingliang <yangyingliang@huawei.com>,
 linux-stm32@st-md-mailman.stormreply.com, Hulk Robot <hulkci@huawei.com>,
 edumazet@google.com, joabreu@synopsys.com, mcoquelin.stm32@gmail.com,
 Jakub Kicinski <kuba@kernel.org>, peppe.cavallaro@st.com, pabeni@redhat.com,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH AUTOSEL 5.17 17/23] net: stmmac: fix missing
	pci_disable_device() on error in stmmac_pci_probe()
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

From: Yang Yingliang <yangyingliang@huawei.com>

[ Upstream commit 0807ce0b010418a191e0e4009803b2d74c3245d5 ]

Switch to using pcim_enable_device() to avoid missing pci_disable_device().

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
Link: https://lore.kernel.org/r/20220510031316.1780409-1-yangyingliang@huawei.com
Signed-off-by: Jakub Kicinski <kuba@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c
index fcf17d8a0494..644bb54f5f02 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c
@@ -181,7 +181,7 @@ static int stmmac_pci_probe(struct pci_dev *pdev,
 		return -ENOMEM;
 
 	/* Enable pci device */
-	ret = pci_enable_device(pdev);
+	ret = pcim_enable_device(pdev);
 	if (ret) {
 		dev_err(&pdev->dev, "%s: ERROR: failed to enable device\n",
 			__func__);
@@ -241,8 +241,6 @@ static void stmmac_pci_remove(struct pci_dev *pdev)
 		pcim_iounmap_regions(pdev, BIT(i));
 		break;
 	}
-
-	pci_disable_device(pdev);
 }
 
 static int __maybe_unused stmmac_pci_suspend(struct device *dev)
-- 
2.35.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
