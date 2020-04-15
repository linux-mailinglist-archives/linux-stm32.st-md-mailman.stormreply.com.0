Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B071A9D26
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Apr 2020 13:43:43 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3A3B8C36B0C;
	Wed, 15 Apr 2020 11:43:43 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A9F90C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Apr 2020 11:43:40 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 625A520737;
 Wed, 15 Apr 2020 11:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586951019;
 bh=evbnZiIFrAsIYXcCSJ9OBMYr3dZ/O+8OKQb8KFPAPjI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=r17acMCGaANieS7CM0ePZPJFuuCkG17zsLrjjYDr3cO1XVayLC+FQ5ZwZgEPK5TYx
 Y2qBoEjAqI4dRfZgV5DqF0CIHaBvcRFfQ8kB1MMY76I39fwvQ4w4xs+mFXW3p3Logb
 myAq2MAIrmctM5BAQ4R7HEs1Z8KKN/iLcTSvFTnE=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Wed, 15 Apr 2020 07:41:40 -0400
Message-Id: <20200415114226.13103-60-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200415114226.13103-1-sashal@kernel.org>
References: <20200415114226.13103-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Sasha Levin <sashal@kernel.org>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Jisheng Zhang <Jisheng.Zhang@synaptics.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH AUTOSEL 5.5 060/106] net: stmmac: dwmac1000:
	fix out-of-bounds mac address reg setting
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

From: Jisheng Zhang <Jisheng.Zhang@synaptics.com>

[ Upstream commit 3e1221acf6a8f8595b5ce354bab4327a69d54d18 ]

Commit 9463c4455900 ("net: stmmac: dwmac1000: Clear unused address
entries") cleared the unused mac address entries, but introduced an
out-of bounds mac address register programming bug -- After setting
the secondary unicast mac addresses, the "reg" value has reached
netdev_uc_count() + 1, thus we should only clear address entries
if (addr < perfect_addr_number)

Fixes: 9463c4455900 ("net: stmmac: dwmac1000: Clear unused address entries")
Signed-off-by: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
Signed-off-by: David S. Miller <davem@davemloft.net>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
index 542784300620f..efc6ec1b8027c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
@@ -207,7 +207,7 @@ static void dwmac1000_set_filter(struct mac_device_info *hw,
 			reg++;
 		}
 
-		while (reg <= perfect_addr_number) {
+		while (reg < perfect_addr_number) {
 			writel(0, ioaddr + GMAC_ADDR_HIGH(reg));
 			writel(0, ioaddr + GMAC_ADDR_LOW(reg));
 			reg++;
-- 
2.20.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
