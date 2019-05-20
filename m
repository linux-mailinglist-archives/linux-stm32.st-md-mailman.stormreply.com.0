Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C76E2448B
	for <lists+linux-stm32@lfdr.de>; Tue, 21 May 2019 01:50:15 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B2CFDC63A46
	for <lists+linux-stm32@lfdr.de>; Mon, 20 May 2019 23:50:13 +0000 (UTC)
Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 03085C63A41
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 May 2019 23:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=megous.com; s=mail;
 t=1558396212; bh=lmN/vA2/QcSdUuzR1xKNkZ8E+T7fPttQ3k8QpH5igsQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=icuRmovmqEiyTkx1kZjdynNoQSk4c78preJIjNGDecNXCTpka+1z9503Aodfx2L88
 6sOPPpp5L2sC2XXN6VuIHqWX1c97ZiYpULA+xILVHEybnqSj3gIIu2jnLkXhLVSlH5
 V6knXlNvxgV1UUKlgvFu1bsGDIuZjLwsN46MtJdw=
From: megous@megous.com
To: linux-sunxi@googlegroups.com, Maxime Ripard <maxime.ripard@bootlin.com>,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>
Date: Tue, 21 May 2019 01:50:05 +0200
Message-Id: <20190520235009.16734-3-megous@megous.com>
In-Reply-To: <20190520235009.16734-1-megous@megous.com>
References: <20190520235009.16734-1-megous@megous.com>
MIME-Version: 1.0
Cc: Mark Rutland <mark.rutland@arm.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Ondrej Jirman <megous@megous.com>,
 devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com,
 Jose Abreu <joabreu@synopsys.com>, Daniel Vetter <daniel@ffwll.ch>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Icenowy Zheng <icenowy@aosc.io>
Subject: [Linux-stm32] [PATCH v5 2/6] net: stmmac: sun8i: force select
	external PHY when no internal one
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

From: Icenowy Zheng <icenowy@aosc.io>

The PHY selection bit also exists on SoCs without an internal PHY; if it's
set to 1 (internal PHY, default value) then the MAC will not make use of
any PHY such SoCs.

This problem appears when adapting for H6, which has no real internal PHY
(the "internal PHY" on H6 is not on-die, but on a co-packaged AC200 chip,
connected via RMII interface at GPIO bank A).

Force the PHY selection bit to 0 when the SOC doesn't have an internal PHY,
to address the problem of a wrong default value.

Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
Signed-off-by: Ondrej Jirman <megous@megous.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
index 3258dec84d55..0484c289f328 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
@@ -907,6 +907,11 @@ static int sun8i_dwmac_set_syscon(struct stmmac_priv *priv)
 		 * address. No need to mask it again.
 		 */
 		reg |= 1 << H3_EPHY_ADDR_SHIFT;
+	} else {
+		/* For SoCs without internal PHY the PHY selection bit should be
+		 * set to 0 (external PHY).
+		 */
+		reg &= ~H3_EPHY_SELECT;
 	}
 
 	if (!of_property_read_u32(node, "allwinner,tx-delay-ps", &val)) {
-- 
2.21.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
