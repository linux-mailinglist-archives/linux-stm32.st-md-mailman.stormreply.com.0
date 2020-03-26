Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D44001936B4
	for <lists+linux-stm32@lfdr.de>; Thu, 26 Mar 2020 04:24:09 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 89683C36B0B;
	Thu, 26 Mar 2020 03:24:09 +0000 (UTC)
Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 49362C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 26 Mar 2020 03:24:04 +0000 (UTC)
X-QQ-mid: bizesmtp23t1585193035tu9mb8m1
Received: from localhost.localdomain (unknown [111.28.140.218])
 by esmtp10.qq.com (ESMTP) with 
 id ; Thu, 26 Mar 2020 11:23:50 +0800 (CST)
X-QQ-SSF: 01400000002000N0LK40B00A0000000
X-QQ-FEAT: IU1j2zQXGSmkjKfBymb3/eBCubbz8BvgGz5vB7l51ezvAZ/1ATsIlO3vZICwj
 Acv37/jbadl8lB/wbRjUCeazwOedLgObATbuZ0u4K6CzA/QTPwMyvoZeDj5Ct6rMNauxeL7
 VKOrc5A8H1fzt2T9a7+QUo1lPnzmjlDxpJfvZUKsYqAfYRRZXVrcvPKVVoqWQ9M9+LEURir
 4/7SqzxKeDZ0pt8KACtlLzOodNtamGOTzisWHDUPg5UwEs7amdeo5C37f0zxK3bCpY2i2jr
 M0tJ6MkCP0IJY5WKIneYMIl0O191uNY6TCgxY5JqGyHcURKCPq8WCxNnHWhR6Ff/nn2Q==
X-QQ-GoodBg: 2
From: xiaolinkui <xiaolinkui@tj.kylinos.cn>
To: peppe.cavallaro@st.com
Date: Thu, 26 Mar 2020 11:23:41 +0800
Message-Id: <20200326032341.30280-1-xiaolinkui@tj.kylinos.cn>
X-Mailer: git-send-email 2.17.1
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tj.kylinos.cn:qybgforeign:qybgforeign7
X-QQ-Bgrelay: 1
Cc: netdev@vger.kernel.org, davem@davemloft.net, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, xiaolinkui <xiaolinkui@tj.kylinos.cn>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] net: stmmac: Abort loop after phydev is
	detected
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

A net_device only needs at most one phydev, There is no need
to recycle the entire list after finding a phydev.

Signed-off-by: xiaolinkui <xiaolinkui@tj.kylinos.cn>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
index cfe5d8b73142..6fb87cc18d65 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
@@ -431,6 +431,9 @@ int stmmac_mdio_register(struct net_device *ndev)
 
 		phy_attached_info(phydev);
 		found = 1;
+
+		if (phydev->phy_id != 0)
+			goto bus_register_done;
 	}
 
 	if (!found && !mdio_node) {
-- 
2.17.1



_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
