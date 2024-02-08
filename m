Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE3684DD40
	for <lists+linux-stm32@lfdr.de>; Thu,  8 Feb 2024 10:48:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0F4DAC65E4C;
	Thu,  8 Feb 2024 09:48:38 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 743F3C62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 Feb 2024 09:48:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 76EC2CE1BB1;
 Thu,  8 Feb 2024 09:48:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A510C433F1;
 Thu,  8 Feb 2024 09:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1707385713;
 bh=dkNBf6Wtnx+g/bNs6bb2sjIsg6Nk2Oo7MshQorgJg4Q=;
 h=From:Date:Subject:To:Cc:From;
 b=Zeb3eMpCPXHN7y4LQyhk0OboUuo2MF5fSMSUfbAu9qAGPR6RlrV/kixO8NhmSUUjq
 CGbC/sXzM16aqBWwgL2hbv/ZRKXI/BYTGJxVLRSf6kmE9cVY5fQC4j8/6XdtBEz8om
 tassQjbt3jIaeObIh5ZOnOK24g6MEIPYvh+hxhPcRfD59mxDTiGih6ci0fJpN4EML/
 /Q/LsEDxktZdmcK+eYc8jSWxn78jvlpzqf2iXiXU3ahnTdVhMXEtxDLhtwxW9Pq6GB
 sGyHfJoTKKrXKi/szVBkFXRMjqkjmTPCIJHXaqLdgDK35v4GMWdoDDlosANG3sUdep
 0HTT5bPZmGXXw==
From: Simon Horman <horms@kernel.org>
Date: Thu, 08 Feb 2024 09:48:27 +0000
MIME-Version: 1.0
Message-Id: <20240208-xgmac-const-v1-1-e69a1eeabfc8@kernel.org>
X-B4-Tracking: v=1; b=H4sIAGqjxGUC/x3MQQqAIBBA0avErBPMlKKrRIuaJptFFiohiHdPW
 r7F/xkCeaYAU5PB08uBb1fRtQ3guTpLgvdqUFJpqeQokr1WFHi7EMWm0QybkQZ7hFo8ng5O/20
 GRxGWUj7OWc8XYgAAAA==
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>
X-Mailer: b4 0.12.3
Cc: Furong Xu <0x1207@gmail.com>, Kernel Test Robot <lkp@intel.com>,
 netdev@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 Jon Hunter <jonathanh@nvidia.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net] net: stmmac: xgmac: use #define for
	string constants
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

The cited commit introduces and uses the string constants dpp_tx_err and
dpp_rx_err. These are assigned to constant fields of the array
dwxgmac3_error_desc.

It has been reported that on GCC 6 and 7.5.0 this results in warnings
such as:

  .../dwxgmac2_core.c:836:20: error: initialiser element is not constant
   { true, "TDPES0", dpp_tx_err },

I have been able to reproduce this using: GCC 7.5.0, 8.4.0, 9.4.0 and 10.5.0.
But not GCC 13.2.0.

So it seems this effects older compilers but not newer ones.
As Jon points out in his report, the minimum compiler supported by
the kernel is GCC 5.1, so it does seem that this ought to be fixed.

It is not clear to me what combination of 'const', if any, would address
this problem.  So this patch takes of using #defines for the string
constants

Compile tested only.

Fixes: 46eba193d04f ("net: stmmac: xgmac: fix handling of DPP safety error for DMA channels")
Reported-by: Jon Hunter <jonathanh@nvidia.com>
Closes: https://lore.kernel.org/netdev/c25eb595-8d91-40ea-9f52-efa15ebafdbc@nvidia.com/
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202402081135.lAxxBXHk-lkp@intel.com/
Signed-off-by: Simon Horman <horms@kernel.org>
---
 .../net/ethernet/stmicro/stmmac/dwxgmac2_core.c    | 69 +++++++++++-----------
 1 file changed, 35 insertions(+), 34 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
index 323c57f03c93..1af2f89a0504 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
@@ -830,41 +830,42 @@ static const struct dwxgmac3_error_desc dwxgmac3_dma_errors[32]= {
 	{ false, "UNKNOWN", "Unknown Error" }, /* 31 */
 };
 
-static const char * const dpp_rx_err = "Read Rx Descriptor Parity checker Error";
-static const char * const dpp_tx_err = "Read Tx Descriptor Parity checker Error";
+#define DPP_RX_ERR "Read Rx Descriptor Parity checker Error"
+#define DPP_TX_ERR "Read Tx Descriptor Parity checker Error"
+
 static const struct dwxgmac3_error_desc dwxgmac3_dma_dpp_errors[32] = {
-	{ true, "TDPES0", dpp_tx_err },
-	{ true, "TDPES1", dpp_tx_err },
-	{ true, "TDPES2", dpp_tx_err },
-	{ true, "TDPES3", dpp_tx_err },
-	{ true, "TDPES4", dpp_tx_err },
-	{ true, "TDPES5", dpp_tx_err },
-	{ true, "TDPES6", dpp_tx_err },
-	{ true, "TDPES7", dpp_tx_err },
-	{ true, "TDPES8", dpp_tx_err },
-	{ true, "TDPES9", dpp_tx_err },
-	{ true, "TDPES10", dpp_tx_err },
-	{ true, "TDPES11", dpp_tx_err },
-	{ true, "TDPES12", dpp_tx_err },
-	{ true, "TDPES13", dpp_tx_err },
-	{ true, "TDPES14", dpp_tx_err },
-	{ true, "TDPES15", dpp_tx_err },
-	{ true, "RDPES0", dpp_rx_err },
-	{ true, "RDPES1", dpp_rx_err },
-	{ true, "RDPES2", dpp_rx_err },
-	{ true, "RDPES3", dpp_rx_err },
-	{ true, "RDPES4", dpp_rx_err },
-	{ true, "RDPES5", dpp_rx_err },
-	{ true, "RDPES6", dpp_rx_err },
-	{ true, "RDPES7", dpp_rx_err },
-	{ true, "RDPES8", dpp_rx_err },
-	{ true, "RDPES9", dpp_rx_err },
-	{ true, "RDPES10", dpp_rx_err },
-	{ true, "RDPES11", dpp_rx_err },
-	{ true, "RDPES12", dpp_rx_err },
-	{ true, "RDPES13", dpp_rx_err },
-	{ true, "RDPES14", dpp_rx_err },
-	{ true, "RDPES15", dpp_rx_err },
+	{ true, "TDPES0", DPP_TX_ERR },
+	{ true, "TDPES1", DPP_TX_ERR },
+	{ true, "TDPES2", DPP_TX_ERR },
+	{ true, "TDPES3", DPP_TX_ERR },
+	{ true, "TDPES4", DPP_TX_ERR },
+	{ true, "TDPES5", DPP_TX_ERR },
+	{ true, "TDPES6", DPP_TX_ERR },
+	{ true, "TDPES7", DPP_TX_ERR },
+	{ true, "TDPES8", DPP_TX_ERR },
+	{ true, "TDPES9", DPP_TX_ERR },
+	{ true, "TDPES10", DPP_TX_ERR },
+	{ true, "TDPES11", DPP_TX_ERR },
+	{ true, "TDPES12", DPP_TX_ERR },
+	{ true, "TDPES13", DPP_TX_ERR },
+	{ true, "TDPES14", DPP_TX_ERR },
+	{ true, "TDPES15", DPP_TX_ERR },
+	{ true, "RDPES0", DPP_RX_ERR },
+	{ true, "RDPES1", DPP_RX_ERR },
+	{ true, "RDPES2", DPP_RX_ERR },
+	{ true, "RDPES3", DPP_RX_ERR },
+	{ true, "RDPES4", DPP_RX_ERR },
+	{ true, "RDPES5", DPP_RX_ERR },
+	{ true, "RDPES6", DPP_RX_ERR },
+	{ true, "RDPES7", DPP_RX_ERR },
+	{ true, "RDPES8", DPP_RX_ERR },
+	{ true, "RDPES9", DPP_RX_ERR },
+	{ true, "RDPES10", DPP_RX_ERR },
+	{ true, "RDPES11", DPP_RX_ERR },
+	{ true, "RDPES12", DPP_RX_ERR },
+	{ true, "RDPES13", DPP_RX_ERR },
+	{ true, "RDPES14", DPP_RX_ERR },
+	{ true, "RDPES15", DPP_RX_ERR },
 };
 
 static void dwxgmac3_handle_dma_err(struct net_device *ndev,

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
