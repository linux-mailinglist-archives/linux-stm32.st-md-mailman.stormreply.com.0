Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 396102FC66D
	for <lists+linux-stm32@lfdr.de>; Wed, 20 Jan 2021 02:26:44 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D1373C3FADA;
	Wed, 20 Jan 2021 01:26:43 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D37F2C3FAD8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 Jan 2021 01:26:41 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 89E6B2333C;
 Wed, 20 Jan 2021 01:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611105998;
 bh=WnYGfdtWhQjlRaYO46+WG7tduw02H5398tfUFmXkLN0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jYLrXryRCd/xhD6F3y4nCpAFlUew85b71urrEkgSKaw1hVjlPMUM5uWcJcZyd4j+2
 njTf7TQthUSvpQCkb0XaODc+HjmMpF2SudE+3BV8z7ZGWD9VDwAZmFSMOWSxqv4eA+
 eLoztbajIg9EMe0n/b4RINXrN6cLisTHMuL5DY2vqO8veWCVs3oAJJi2A1tMXJ5opw
 3F3TCAx79gxTQh/Qz5B1pTE0e9fce0Ai9jAf1sdOfBnYuD0k6P2IBAqQSwHlNtl5OS
 P5YSmfqtu2nevDUFRwIiH+Dn8aOi43ePKLVxwK5xscgmbgvVYH15WqRTp4zXeHp1c1
 Y6sWOEFewjzsg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Tue, 19 Jan 2021 20:25:44 -0500
Message-Id: <20210120012602.769683-27-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210120012602.769683-1-sashal@kernel.org>
References: <20210120012602.769683-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Sasha Levin <sashal@kernel.org>, netdev@vger.kernel.org,
 Seb Laveze <sebastien.laveze@nxp.com>, Jakub Kicinski <kuba@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH AUTOSEL 5.10 27/45] net: stmmac: use
	__napi_schedule() for PREEMPT_RT
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

From: Seb Laveze <sebastien.laveze@nxp.com>

[ Upstream commit 1f02efd1bb35bee95feed6aab46d1217f29d555b ]

Use of __napi_schedule_irqoff() is not safe with PREEMPT_RT in which
hard interrupts are not disabled while running the threaded interrupt.

Using __napi_schedule() works for both PREEMPT_RT and mainline Linux,
just at the cost of an additional check if interrupts are disabled for
mainline (since they are already disabled).

Similar to the fix done for enetc commit 215602a8d212 ("enetc: use
napi_schedule to be compatible with PREEMPT_RT")

Signed-off-by: Seb Laveze <sebastien.laveze@nxp.com>
Link: https://lore.kernel.org/r/20210112140121.1487619-1-sebastien.laveze@oss.nxp.com
Signed-off-by: Jakub Kicinski <kuba@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index c33db79cdd0ad..cb39f6dbf72b8 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -2158,7 +2158,7 @@ static int stmmac_napi_check(struct stmmac_priv *priv, u32 chan)
 			spin_lock_irqsave(&ch->lock, flags);
 			stmmac_disable_dma_irq(priv, priv->ioaddr, chan, 1, 0);
 			spin_unlock_irqrestore(&ch->lock, flags);
-			__napi_schedule_irqoff(&ch->rx_napi);
+			__napi_schedule(&ch->rx_napi);
 		}
 	}
 
@@ -2167,7 +2167,7 @@ static int stmmac_napi_check(struct stmmac_priv *priv, u32 chan)
 			spin_lock_irqsave(&ch->lock, flags);
 			stmmac_disable_dma_irq(priv, priv->ioaddr, chan, 0, 1);
 			spin_unlock_irqrestore(&ch->lock, flags);
-			__napi_schedule_irqoff(&ch->tx_napi);
+			__napi_schedule(&ch->tx_napi);
 		}
 	}
 
-- 
2.27.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
