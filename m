Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C1E50E61C
	for <lists+linux-stm32@lfdr.de>; Mon, 25 Apr 2022 18:45:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 88B1AC62D5D;
	Mon, 25 Apr 2022 16:45:10 +0000 (UTC)
Received: from mout.perfora.net (mout.perfora.net [74.208.4.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B7170C5F1F1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Apr 2022 15:49:21 +0000 (UTC)
Received: from toolbox.int.toradex.com ([81.221.85.15]) by mrelay.perfora.net
 (mreueus004 [74.208.5.2]) with ESMTPSA (Nemesis) id
 1MWj1Y-1nPCsS0WCG-00X6Jv; Mon, 25 Apr 2022 17:49:04 +0200
From: Marcel Ziswiler <marcel@ziswiler.com>
To: netdev@vger.kernel.org
Date: Mon, 25 Apr 2022 17:48:56 +0200
Message-Id: <20220425154856.169499-1-marcel@ziswiler.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:mu9bK8rJ3RbONCPFleKxVm8y/XpyuFrUVOlp1t0I5GIjR1cPhEp
 JXL2fZSF7pPFx+xTLi+Aq49pJ3HiFN7lMVBI5Ts7TddFRGXvGB8ygr02VXUz6QVaext0RNv
 +0P+v4g9NVXW08d3j/ux6QoYDTiJxxLU3Q2TBwAn2swEts57tAooR2Xv62D0OE3jtmYwz7X
 cYO02AscjIs8qBwD4vRNw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:j2B6w7sRz5A=:H2LH+imHelZRraqcpsmDEw
 v5m89hm+aXC6XzB1O8wayiMM3nA55ivKxJUyt+s2aAmbwKYyZ5OVh0GrPJq3Jp6GUx+8B5cWl
 M78PYkteuFzVRqrt0YcNKS67xmxhYd4UozN+mTAlIjXfwAkIejjc8mduErb1SQB0FlpVZhOvx
 mVrONK/GyaMEk21QE0+oQgTLq04LdDjIQLFdmt4/8Q0Df2F0BsF4ZvOWdeoxHjgTFTdhIGf8W
 BrG4csduL28uXosg+PxhKhnnjMHrXmnhcTYiLnJHtIObCG7d7AyvfR4ZsMfD33fF07uG8WqkL
 uqSRr5lZVKrmHexSS5Wi5tmzDXYvZN5xfZ69/4WOEIzCqLNH2GrH955YQi77BFeHAOTtQxRNC
 p0NkQmjxtA2NylL8H0Qb9xbiVfhNDs4dS1sPC5Hvq+mBecA+0L0/VtjfX/fAj9am+7WNYU+WV
 60kr5AEaD6tMqbhpmreaAghgyT2VP0jEyo9S0Kj6nvapFSmuNoqWqHyRJ4ZI8OgavYbrnimUh
 0Y7SVjKBndSEuYENyfhIeemP3XIq5hHijW84t7VWisBM1tvMJPra9P6D0qjVVoZ+1UCmPBiFo
 hxzso2PpKA40z/uN9w+dKJfYXW1vg9YzgTj+kamkKhXsFn+uG/wChkODJqCK8FpcQ4ixTBqiO
 MwVc3AMVIYs8bRK2Ejl12lybChnAr9BWaTg3T2q8vmavxASnLNlQa43bjlOcWTGceo9g=
X-Mailman-Approved-At: Mon, 25 Apr 2022 16:45:09 +0000
Cc: Fugang Duan <fugang.duan@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Jose Abreu <joabreu@synopsys.com>, NXP Linux Team <linux-imx@nxp.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Paolo Abeni <pabeni@redhat.com>,
 Fabio Estevam <festevam@gmail.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v1] net: stmmac: dwmac-imx: comment spelling
	fix
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

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Fix spelling in comment.

Fixes: 94abdad6974a ("net: ethernet: dwmac: add ethernet glue logic for NXP imx8 chip")
Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

 drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
index 84651207a1de..bd52fb7cf486 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
@@ -197,9 +197,9 @@ imx_dwmac_parse_dt(struct imx_priv_data *dwmac, struct device *dev)
 	}
 
 	if (of_machine_is_compatible("fsl,imx8mp")) {
-		/* Binding doc describes the propety:
+		/* Binding doc describes the property:
 		   is required by i.MX8MP.
-		   is optinoal for i.MX8DXL.
+		   is optional for i.MX8DXL.
 		 */
 		dwmac->intf_regmap = syscon_regmap_lookup_by_phandle(np, "intf_mode");
 		if (IS_ERR(dwmac->intf_regmap))
-- 
2.35.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
