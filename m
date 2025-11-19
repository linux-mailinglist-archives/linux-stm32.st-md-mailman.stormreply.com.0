Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B817C6FCEB
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Nov 2025 16:53:20 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 48C60C36B30;
	Wed, 19 Nov 2025 15:53:20 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D0E8EC36B2A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Nov 2025 15:53:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 83F1B405C9;
 Wed, 19 Nov 2025 15:53:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6339C4AF14;
 Wed, 19 Nov 2025 15:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763567597;
 bh=ghn1DQMvwDFb2t8E3blcc0GQRRX7k47nsQNotsdpd5k=;
 h=From:To:Cc:Subject:Date:From;
 b=LX+K4FSDDP4e9yAEryXqFyjA/EQPdkOCtujeK1HOh4xZoELGg5FYGLKkmK42o0XBO
 88LV5Z4Xcp0LVexLHCGjyrmQK4hIPPsEFJi8mwwBRGn0zL3dWUxTVAJxaIWAcLbzrX
 wkc5Cv+tRibnjmRcjZiO3WsiORlul+yjjCDbVDxHQqk6OXT/hlHSjcNbEkq4D3cV4E
 FS3c2VIXH4jtiu1fpJLE4svc5x+tS6oF7fo+xBJcjIyehIOX8auitNcy4GKdUMlhkF
 2EIgcAw7Ped67nJvYNUZSAze5OjzWKlVyrXW2T21L9sFwQ2wnoPLq0V/bNvwm8j7HZ
 doxPGSbZI9KIA==
From: Jisheng Zhang <jszhang@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Russell King <rmk+kernel@armlinux.org.uk>
Date: Wed, 19 Nov 2025 23:35:26 +0800
Message-ID: <20251119153526.13780-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH v2 resend] net: stmmac: add support for dwmac
	5.20
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

The dwmac 5.20 IP can be found on some synaptics SoCs. 

The binding doc has been already upstreamed by
commit 13f9351180aa ("dt-bindings: net: snps,dwmac: Add dwmac-5.20
version")

So we just need to add a compatibility flag in dwmac generic driver.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
Since v1:
 - fix the commit msg

 drivers/net/ethernet/stmicro/stmmac/dwmac-generic.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-generic.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-generic.c
index b9218c07eb6b..cecce6ed9aa6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-generic.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-generic.c
@@ -59,6 +59,7 @@ static const struct of_device_id dwmac_generic_match[] = {
 	{ .compatible = "snps,dwmac-3.72a"},
 	{ .compatible = "snps,dwmac-4.00"},
 	{ .compatible = "snps,dwmac-4.10a"},
+	{ .compatible = "snps,dwmac-5.20"},
 	{ .compatible = "snps,dwmac"},
 	{ .compatible = "snps,dwxgmac-2.10"},
 	{ .compatible = "snps,dwxgmac"},
-- 
2.51.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
