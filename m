Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F0146AAA1CB
	for <lists+linux-stm32@lfdr.de>; Tue,  6 May 2025 00:52:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ADCEAC78039;
	Mon,  5 May 2025 22:52:06 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 707DBC57194
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 May 2025 22:52:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 89AC9446E8;
 Mon,  5 May 2025 22:52:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCD57C4CEEE;
 Mon,  5 May 2025 22:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746485523;
 bh=mma8tzwZ/NqwWnsXqPq43wQ4tvCGsiw9PyvHomQ17l4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=o8UHUuAV+pp8U4nzrTGRW3FafFipWgqRsYr3y82xYCrwmiQgenXntYpbxXN+jj3hl
 93lHACaMNuCKUiTjPgdNQz+XknKL5rixeL7R6xGgA4gbsdiqNfOtxkrOrxQVwqJBM3
 DpDw80m+k/+Iw7ZEM2Qt21XH+0sCtoTCdqJ9YEcdzzgUULtFJJusThbNm0HyGpiQqG
 rAKV7ex2tDHALtwOHoxgaDtlkSZIfRBoIcY2gfq0gAxvzqMvcPNnV9SvFemzkVTQae
 6u3oXBv3oOUB6CoUp2E47QnlEzqLhSfn+JOZGIcqs3YuUuCRwOPXzTJHBAgli7CVTQ
 pFNWS0X7egAKg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Mon,  5 May 2025 18:37:15 -0400
Message-Id: <20250505223922.2682012-359-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505223922.2682012-1-sashal@kernel.org>
References: <20250505223922.2682012-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.26
Cc: Chong Qiao <qiaochong@loongson.cn>, Sasha Levin <sashal@kernel.org>,
 chenfeiyang@loongson.cn, chenhuacai@kernel.org, mcoquelin.stm32@gmail.com,
 phasta@kernel.org, netdev@vger.kernel.org, Yanteng Si <si.yanteng@linux.dev>,
 fancer.lancer@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 andrew+netdev@lunn.ch, edumazet@google.com, zhaoqunqin@loongson.cn,
 Simon Horman <horms@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 pabeni@redhat.com, rmk+kernel@armlinux.org.uk, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, Huacai Chen <chenhuacai@loongson.cn>
Subject: [Linux-stm32] [PATCH AUTOSEL 6.12 359/486] net: stmmac:
	dwmac-loongson: Set correct {tx, rx}_fifo_size
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

From: Huacai Chen <chenhuacai@loongson.cn>

[ Upstream commit 8dbf0c7556454b52af91bae305ca71500c31495c ]

Now for dwmac-loongson {tx,rx}_fifo_size are uninitialised, which means
zero. This means dwmac-loongson doesn't support changing MTU because in
stmmac_change_mtu() it requires the fifo size be no less than MTU. Thus,
set the correct tx_fifo_size and rx_fifo_size for it (16KB multiplied by
queue counts).

Here {tx,rx}_fifo_size is initialised with the initial value (also the
maximum value) of {tx,rx}_queues_to_use. So it will keep as 16KB if we
don't change the queue count, and will be larger than 16KB if we change
(decrease) the queue count. However stmmac_change_mtu() still work well
with current logic (MTU cannot be larger than 16KB for stmmac).

Note: the Fixes tag picked here is the oldest commit and key commit of
the dwmac-loongson series "stmmac: Add Loongson platform support".

Acked-by: Yanteng Si <si.yanteng@linux.dev>
Reviewed-by: Simon Horman <horms@kernel.org>
Signed-off-by: Chong Qiao <qiaochong@loongson.cn>
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
Link: https://patch.msgid.link/20250210134328.2755328-1-chenhuacai@loongson.cn
Signed-off-by: Jakub Kicinski <kuba@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
index ab7c2750c1042..702ea5a00b56d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
@@ -590,6 +590,9 @@ static int loongson_dwmac_probe(struct pci_dev *pdev, const struct pci_device_id
 	if (ret)
 		goto err_disable_device;
 
+	plat->tx_fifo_size = SZ_16K * plat->tx_queues_to_use;
+	plat->rx_fifo_size = SZ_16K * plat->rx_queues_to_use;
+
 	if (dev_of_node(&pdev->dev))
 		ret = loongson_dwmac_dt_config(pdev, plat, &res);
 	else
-- 
2.39.5

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
