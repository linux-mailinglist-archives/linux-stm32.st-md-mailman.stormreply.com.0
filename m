Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A98816E47
	for <lists+linux-stm32@lfdr.de>; Mon, 18 Dec 2023 13:46:23 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 58C73C6DD70;
	Mon, 18 Dec 2023 12:46:23 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 71799C6DD6F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 Dec 2023 12:46:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id DDAEBCE10B6;
 Mon, 18 Dec 2023 12:46:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62590C433CA;
 Mon, 18 Dec 2023 12:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702903579;
 bh=9NRGY183+ZrKjPWWEIE9GxstvsmhrLSKBsJzvLGYfcw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SrBBiWsOQB57cbGiUk3SFIcF1SRqZ4eMDASObSG5rJtZUwTCOhA01zkn5ABf0Hcox
 XP6PBvUGGmI+Bo9zIdPBadwGAJ8TYQaKPVSBo9Riv1QS3vslpDGJCpP5jnkObo+xZE
 S3bWGkrwhZx9Gdc0YMpNTSvH0yrtPFIO87VlTjhqZcXF3bI1CMCrkMk9BfXwuIjI6N
 tp5L3CtYNec+jOg9OKS6PLLusvNig0f7WYkKodgxU9nb+CcijSvjT9j8kPRbVRWYZl
 87MOoMWpAm9skSskojSLE52gshg6mROiWfMC+zWpDOqdhH+CmvQNeA0IvygxVUpKTI
 aIzYclVUA883A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Mon, 18 Dec 2023 07:45:43 -0500
Message-ID: <20231218124557.1380724-10-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231218124557.1380724-1-sashal@kernel.org>
References: <20231218124557.1380724-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.143
Cc: Sasha Levin <sashal@kernel.org>, Yanteng Si <siyanteng@loongson.cn>,
 edumazet@google.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Conor Dooley <conor.dooley@microchip.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, kuba@kernel.org, pabeni@redhat.com,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH AUTOSEL 5.15 10/13] stmmac: dwmac-loongson:
	drop useless check for compatible fallback
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

From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

[ Upstream commit 31fea092c6f9f8fb2c40a08137907f5fbeae55dd ]

Device binds to proper PCI ID (LOONGSON, 0x7a03), already listed in DTS,
so checking for some other compatible does not make sense.  It cannot be
bound to unsupported platform.

Drop useless, incorrect (space in between) and undocumented compatible.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Acked-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Signed-off-by: David S. Miller <davem@davemloft.net>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
index 2ae59f94afe1d..a896fadb96b0e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
@@ -59,11 +59,6 @@ static int loongson_dwmac_probe(struct pci_dev *pdev, const struct pci_device_id
 		return -ENODEV;
 	}
 
-	if (!of_device_is_compatible(np, "loongson, pci-gmac")) {
-		pr_info("dwmac_loongson_pci: Incompatible OF node\n");
-		return -ENODEV;
-	}
-
 	plat = devm_kzalloc(&pdev->dev, sizeof(*plat), GFP_KERNEL);
 	if (!plat)
 		return -ENOMEM;
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
