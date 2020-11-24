Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EB8BB2C341B
	for <lists+linux-stm32@lfdr.de>; Tue, 24 Nov 2020 23:38:38 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AFCA2C56630;
	Tue, 24 Nov 2020 22:38:38 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 119CFC32EA3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Nov 2020 22:38:36 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0AOMc5xj016952; Tue, 24 Nov 2020 23:38:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=STMicroelectronics;
 bh=MxQtwOp9fgA7AhJtkyo2khTdblmvpYD9H570y7mgSJE=;
 b=DN49BvJO4Q/LTGaR3sKWMRspPKtFDxS/edBiVz8mxffgCg1VOFi6v/icexlPAcNHmvJR
 u5HmamPu/Vp8CisqeSVc0DdGZlweeoVte90RknkUPgg9CW8T88unxs231ZmLxTmlT64w
 0v5CPTGvTyCR7sQ5ygY4FYisxUQ2WMJCW0wqsrXqQZg63d9yKV319GszZF/Ot8dGTMcF
 sPPl70fP/XuF02qkmNXoO165vzcVf+8GaA/v2aHa6ZBSU2oKhscu/ScTT5hb1s0vS/2P
 r9QHQmM8yO4ZGeL90+DuSzx7UKS1eQarBJ4nod/5u67TMIMxPP9X1myxns2fkaNQ8bru Yg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34y0hjc2vh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Nov 2020 23:38:22 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1643210002A;
 Tue, 24 Nov 2020 23:38:22 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag1node3.st.com [10.75.127.3])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F0BCD20755B;
 Tue, 24 Nov 2020 23:38:21 +0100 (CET)
Received: from localhost (10.75.127.48) by SFHDAG1NODE3.st.com (10.75.127.3)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 24 Nov 2020 23:38:21
 +0100
From: Antonio Borneo <antonio.borneo@st.com>
To: Alexandre Torgue <alexandre.torgue@st.com>, Jose Abreu
 <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>, Jakub
 Kicinski <kuba@kernel.org>
Date: Tue, 24 Nov 2020 23:37:29 +0100
Message-ID: <20201124223729.886992-1-antonio.borneo@st.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <42960ede-9355-1277-9a6f-4eac3c22365c@pengutronix.de>
References: <42960ede-9355-1277-9a6f-4eac3c22365c@pengutronix.de>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG1NODE3.st.com
 (10.75.127.3)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-24_10:2020-11-24,
 2020-11-24 signatures=0
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] net: stmmac: fix incorrect merge of patch
	upstream
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

Commit 757926247836 ("net: stmmac: add flexible PPS to dwmac
4.10a") was intended to modify the struct dwmac410_ops, but it got
somehow badly merged and modified the struct dwmac4_ops.

Revert the modification in struct dwmac4_ops and re-apply it
properly in struct dwmac410_ops.

Fixes: 757926247836 ("net: stmmac: add flexible PPS to dwmac 4.10a")
Cc: stable@vger.kernel.org # v5.6+
Signed-off-by: Antonio Borneo <antonio.borneo@st.com>
Reported-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
---
To: Alexandre Torgue <alexandre.torgue@st.com>
To: Jose Abreu <joabreu@synopsys.com>
To: "David S. Miller" <davem@davemloft.net>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: netdev@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
In-Reply-To: <42960ede-9355-1277-9a6f-4eac3c22365c@pengutronix.de>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
index 002791b77356..ced6d76a0d85 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
@@ -1171,7 +1171,6 @@ const struct stmmac_ops dwmac4_ops = {
 	.pcs_get_adv_lp = dwmac4_get_adv_lp,
 	.debug = dwmac4_debug,
 	.set_filter = dwmac4_set_filter,
-	.flex_pps_config = dwmac5_flex_pps_config,
 	.set_mac_loopback = dwmac4_set_mac_loopback,
 	.update_vlan_hash = dwmac4_update_vlan_hash,
 	.sarc_configure = dwmac4_sarc_configure,
@@ -1213,6 +1212,7 @@ const struct stmmac_ops dwmac410_ops = {
 	.pcs_get_adv_lp = dwmac4_get_adv_lp,
 	.debug = dwmac4_debug,
 	.set_filter = dwmac4_set_filter,
+	.flex_pps_config = dwmac5_flex_pps_config,
 	.set_mac_loopback = dwmac4_set_mac_loopback,
 	.update_vlan_hash = dwmac4_update_vlan_hash,
 	.sarc_configure = dwmac4_sarc_configure,

base-commit: 9bd2702d292cb7b565b09e949d30288ab7a26d51
-- 
2.29.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
