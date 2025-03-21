Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B4417A6B8D0
	for <lists+linux-stm32@lfdr.de>; Fri, 21 Mar 2025 11:35:08 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 69788C78037;
	Fri, 21 Mar 2025 10:35:08 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C036CC71287
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Mar 2025 10:35:07 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 05FAD432C1;
 Fri, 21 Mar 2025 10:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1742553307;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=co8JDmZx4HmArnDvcnRVxtXy60X141/SmNungt+YCYA=;
 b=CeSI6YTZlyjSoGnwVyaPrxNXGMcD0MVY7JCZqknxbNudjZRVwShUwplGqX/Rc6KTLWyad/
 PeMmQE67B3ZVIvVmQkFb/eOeRRoCq+GGLkA1CDqgb+O5VYFg7SVQ3HSfFHIIsetfiZnCwS
 DR0nW7NmN63AbrL/Lc57umqyo4KL4buT+yzTd+/gj5+agAZP66mSZKO6JbN+k83dzse054
 +5JbjHRIDf8xbmvB5IjrGyBCPK8bKqvyuEl9kp6Qt9Otz6uZl9IBvX3R3yX07HBtTHxnPd
 4EHidxqS7qsPpAVfmuE4YL7vMk5XKkIZEmANEoyjRWsSiPIS/ejCrC56+RLvjA==
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: davem@davemloft.net, Andrew Lunn <andrew@lunn.ch>,
 Jakub Kicinski <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Russell King <linux@armlinux.org.uk>,
 Heiner Kallweit <hkallweit1@gmail.com>
Date: Fri, 21 Mar 2025 11:35:01 +0100
Message-ID: <20250321103502.1303539-1-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduhedtkeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhmvgcuvehhvghvrghllhhivghruceomhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhephedtheeufeeutdekudelfedvfefgieduveetveeuhffgffekkeehueffueehhfeunecukfhppedvrgdtudemtggsudelmeekugegheemgeeltddtmeeiheeikeemvdelsgdumeelvghfheemvgektgejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgduleemkegugeehmeegledttdemieehieekmedvlegsudemlegvfhehmegvkegtjedphhgvlhhopehfvgguohhrrgdrhhhomhgvpdhmrghilhhfrhhomhepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudekpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepvgguuhhmrgiiv
 ghtsehgohhoghhlvgdrtghomhdprhgtphhtthhopehprggsvghnihesrhgvughhrghtrdgtohhmpdhrtghpthhtoheplhhinhhugiesrghrmhhlihhnuhigrdhorhhgrdhukhdprhgtphhtthhopehhkhgrlhhlfigvihhtudesghhmrghilhdrtghomhdprhgtphhtthhopehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhm
X-GND-Sasl: maxime.chevallier@bootlin.com
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Simon Horman <horms@kernel.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 alexis.lothore@bootlin.com, thomas.petazzoni@bootlin.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next] net: stmmac: Call
	xpcs_config_eee_mult_fact() only when xpcs is present
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

Some dwmac variants such as dwmac_socfpga don't use xpcs but lynx_pcs.

Don't call xpcs_config_eee_mult_fact() in this case, as this causes a
crash at init :

 Unable to handle kernel NULL pointer dereference at virtual address 00000039 when write

 [...]

 Call trace:
  xpcs_config_eee_mult_fact from stmmac_pcs_setup+0x40/0x10c
  stmmac_pcs_setup from stmmac_dvr_probe+0xc0c/0x1244
  stmmac_dvr_probe from socfpga_dwmac_probe+0x130/0x1bc
  socfpga_dwmac_probe from platform_probe+0x5c/0xb0

Fixes: 060fb27060e8 ("net: stmmac: call xpcs_config_eee_mult_fact()")
Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
This targets net-next as the blamed commit is also still in net-next.

 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
index 7c0a4046bbe3..836f2848dfeb 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
@@ -524,7 +524,8 @@ int stmmac_pcs_setup(struct net_device *ndev)
 	if (ret)
 		return dev_err_probe(priv->device, ret, "No xPCS found\n");
 
-	xpcs_config_eee_mult_fact(xpcs, priv->plat->mult_fact_100ns);
+	if (xpcs)
+		xpcs_config_eee_mult_fact(xpcs, priv->plat->mult_fact_100ns);
 
 	priv->hw->xpcs = xpcs;
 
-- 
2.48.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
