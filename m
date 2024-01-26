Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C666683D596
	for <lists+linux-stm32@lfdr.de>; Fri, 26 Jan 2024 10:10:52 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8DAC9C6DD6C;
	Fri, 26 Jan 2024 09:10:52 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 322C8C6B444
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Jan 2024 09:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com; 
 s=default2211;
 h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID;
 bh=PfIWJgaCYljkJrkeOSurtuPSrNuyp8EvqXe2SqiBP2U=; b=FOAZbZQB/8TrGEUxHTYEu6+NRW
 tDW7a13KET237Bie/VHxFPTwe/HKP/NsfDka9FALYHW3mOHF/NkFEB4VTRYGoZbUz482tvBY16G/A
 zFWv8dF6JVH1HqgcUUx+R2a/WXJrW/IorJk7xe1IeZ4o+F4dCmdc5uJxW/TSmskHpgU+kNfd7aiIg
 Fcy9/vgXW1QP7yprfy2DrVot7wdJP3N3xEmymh0EFmtbeOR0eFeKMuACpFiOLwnv9hdNWIjNpU1F/
 OtwONQtlE3kuvAC81vmvV5oQY14/sTAFzXy5BECayHlynPIcOJ+QQeQ/l17KViBh4uxxA6wXpwJgV
 9c4mimsg==;
Received: from sslproxy04.your-server.de ([78.46.152.42])
 by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.94.2) (envelope-from <esben@geanix.com>)
 id 1rTIEZ-000GfM-47; Fri, 26 Jan 2024 10:10:47 +0100
Received: from [87.49.42.9] (helo=localhost)
 by sslproxy04.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <esben@geanix.com>)
 id 1rTIEY-0004ZG-03; Fri, 26 Jan 2024 10:10:46 +0100
From: Esben Haabendal <esben@geanix.com>
To: netdev@vger.kernel.org, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Fri, 26 Jan 2024 10:10:42 +0100
Message-ID: <379f79687ca4a7d0394a04d14fb3890ce257e706.1706256158.git.esben@geanix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1706256158.git.esben@geanix.com>
References: <cover.1706256158.git.esben@geanix.com>
MIME-Version: 1.0
X-Authenticated-Sender: esben@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27165/Thu Jan 25 10:51:15 2024)
Cc: Rohan G Thomas <rohan.g.thomas@intel.com>,
 "Abhishek Chauhan \(ABC\)" <quic_abchauha@quicinc.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH v2 2/2] net: stmmac: dwmac-imx: set TSO/TBS TX
	queues default settings
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

TSO and TBS cannot coexist. For now we set i.MX Ethernet QOS controller to
use the first TX queue with TSO and the rest for TBS.

TX queues with TBS can support etf qdisc hw offload.

Signed-off-by: Esben Haabendal <esben@geanix.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
index 8f730ada71f9..6b65420e11b5 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
@@ -353,6 +353,10 @@ static int imx_dwmac_probe(struct platform_device *pdev)
 	if (data->flags & STMMAC_FLAG_HWTSTAMP_CORRECT_LATENCY)
 		plat_dat->flags |= STMMAC_FLAG_HWTSTAMP_CORRECT_LATENCY;
 
+	/* Default TX Q0 to use TSO and rest TXQ for TBS */
+	for (int i = 1; i < plat_dat->tx_queues_to_use; i++)
+		plat_dat->tx_queues_cfg[i].tbs_en = 1;
+
 	plat_dat->host_dma_width = dwmac->ops->addr_width;
 	plat_dat->init = imx_dwmac_init;
 	plat_dat->exit = imx_dwmac_exit;
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
