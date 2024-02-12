Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EBBC85297C
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Feb 2024 07:58:04 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D0FC5C6C83D;
	Tue, 13 Feb 2024 06:58:03 +0000 (UTC)
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 97AA0C6C83C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Feb 2024 15:43:55 +0000 (UTC)
Received: from submission (posteo.de [185.67.36.169]) 
 by mout02.posteo.de (Postfix) with ESMTPS id 0FA9D240107
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Feb 2024 16:43:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
 t=1707752635; bh=cvVTOC2X+05hH/d+YZ7aGeqiZdF4zt9gjMio55/9LC4=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:
 Content-Transfer-Encoding:From;
 b=gS7lHoVJUa0+Vm69TgFx8bQbHOMKrApMNLk50nRR5YKcltNl9p2WPpkRzIZBLSmgy
 TcPH++Wrv2nXZ05XQJGb/1mLvdTFTp3jXsPHtXtvmYYFirOILan5cOIjBNF7iRHWNY
 NdK4aCwNusOr+zjBR1X/x4IHHgJ9MISW84+OyT+mwB+u2o83lqbf4A+h5WWRhlRgI3
 sFW/NFlD13d7e7TEmnBpclZI/oVOcHvnUkvptcRsr0iILO8U4eVQUmeP04l3r6XFQ/
 VXtO+Psw3XN3H31Sp3IvNLmThZY/FiQoIu4/lkfJAHnuh3AkIzrZhfiTRZ3NZof0Ng
 55go2bntVoIqg==
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 4TYTJl4Z3Dz6txm;
 Mon, 12 Feb 2024 16:43:51 +0100 (CET)
From: Mark O'Donovan <shiftee@posteo.net>
To: linux-kernel@vger.kernel.org
Date: Mon, 12 Feb 2024 15:43:19 +0000
Message-Id: <20240212154319.907447-1-shiftee@posteo.net>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 13 Feb 2024 06:58:03 +0000
Cc: Mark O'Donovan <shiftee@posteo.net>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, edumazet@google.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] net: stmmac: xgmac: fix initializer element
	is not constant error
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

GCC prior to 8.x gives an "initializer element is not constant"
error for the uses of dpp_tx_err in dwxgmac3_dma_dpp_errors.
Newer compilers accept either version.

More info here:
https://lore.kernel.org/all/20240103-fix-bq24190_charger-vbus_desc-non-const-v1-1-115ddf798c70@kernel.org

Signed-off-by: Mark O'Donovan <shiftee@posteo.net>
---
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
index 323c57f03c93..c02c035b81c0 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
@@ -830,8 +830,8 @@ static const struct dwxgmac3_error_desc dwxgmac3_dma_errors[32]= {
 	{ false, "UNKNOWN", "Unknown Error" }, /* 31 */
 };
 
-static const char * const dpp_rx_err = "Read Rx Descriptor Parity checker Error";
-static const char * const dpp_tx_err = "Read Tx Descriptor Parity checker Error";
+#define dpp_rx_err "Read Rx Descriptor Parity checker Error"
+#define dpp_tx_err "Read Tx Descriptor Parity checker Error"
 static const struct dwxgmac3_error_desc dwxgmac3_dma_dpp_errors[32] = {
 	{ true, "TDPES0", dpp_tx_err },
 	{ true, "TDPES1", dpp_tx_err },

base-commit: 841c35169323cd833294798e58b9bf63fa4fa1de
-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
