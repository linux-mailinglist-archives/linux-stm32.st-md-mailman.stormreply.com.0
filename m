Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 819046900A8
	for <lists+linux-stm32@lfdr.de>; Thu,  9 Feb 2023 08:03:41 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2589DC6A5F2;
	Thu,  9 Feb 2023 07:03:41 +0000 (UTC)
Received: from smtpbg153.qq.com (smtpbg153.qq.com [13.245.218.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 66E78C62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Feb 2023 12:42:14 +0000 (UTC)
X-QQ-mid: bizesmtp77t1675860056tso805bk
Received: from localhost.localdomain ( [113.57.152.160])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Wed, 08 Feb 2023 20:40:54 +0800 (CST)
X-QQ-SSF: 01400000002000C0E000B00A0000000
X-QQ-FEAT: 3M0okmaRx3jmgcz4hYfpmUXK8ue06MHIp1jsI+1nr/Jbd8I+sZC8SmjemoglJ
 guBpXt5vqyZ51KN7TPkY1Br65zF7JIPHR4KZ13uJ+h/sCDb0ePOFjPVtxV6evJV8Kgah0B4
 ieSOyzEg+BStW0Cm+xgto/MywWcdt8S8lxg9IN7QddyipwxSwVZE4gLAp7ODRBe5fLgv3WV
 hRQpqOQu/xpKfK97fDiq5lZnlCZ05GcxuDAtZGQtjnTpg+7hMBbrYgCaXQOPhTki1vTwVBI
 VCxc6Kcpsu+gHc7LVbmIDe6x/zq5bZ10kosEE3qrAAx6GFXFML/y/Ikg4FnvBpy5RlIwMyv
 r7AVOxvgJkI/tw2V+dqaPA1DsMxNRNTUkwh4pk3jYTqHPfWLtSyAxqvWElPknDu9AX2BSGf
 IMAtvlweaBs=
X-QQ-GoodBg: 2
From: Guan Wentao <guanwentao@uniontech.com>
To: peppe.cavallaro@st.com, alexandre.torgue@foss.st.com, joabreu@synopsys.com
Date: Wed,  8 Feb 2023 20:40:25 +0800
Message-Id: <20230208124025.5828-1-guanwentao@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybglogicsvr:qybglogicsvr4
X-Mailman-Approved-At: Thu, 09 Feb 2023 07:03:39 +0000
Cc: Guan Wentao <guanwentao@uniontech.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, edumazet@google.com,
 mcoquelin.stm32@gmail.com, kuba@kernel.org, pabeni@redhat.com,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] net: stmmac: get phydev->interface from mac
	for mdio phy init
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

The phy->interface from mdiobus_get_phy is default from phy_device_create.
In some phy devices like at803x, use phy->interface to init rgmii delay.
Use plat->phy_interface to init if know from stmmac_probe_config_dt.

Fixes: 74371272f97f ("net: stmmac: Convert to phylink and remove phylib logic")
Signed-off-by: Guan Wentao <guanwentao@uniontech.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 1a5b8dab5e9b..debfcb045c22 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1162,6 +1162,12 @@ static int stmmac_init_phy(struct net_device *dev)
 			return -ENODEV;
 		}
 
+		/* If we know the interface, it defines which PHY interface */
+		if (priv->plat->phy_interface > 0) {
+			phydev->interface = priv->plat->phy_interface;
+			netdev_dbg(priv->dev, "Override default phy interface\n");
+		}
+
 		ret = phylink_connect_phy(priv->phylink, phydev);
 	}
 
-- 
2.20.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
