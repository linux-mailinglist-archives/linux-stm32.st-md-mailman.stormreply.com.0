Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD8E131EC4
	for <lists+linux-stm32@lfdr.de>; Tue,  7 Jan 2020 06:08:55 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 23718C36B0B;
	Tue,  7 Jan 2020 05:08:55 +0000 (UTC)
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
 [209.85.216.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2E773C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Jan 2020 05:08:53 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id kx11so8488311pjb.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 06 Jan 2020 21:08:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cr5sx8yPELFvuYRl+jNMxMdmYnoYhuCmAKJ5oKY9g0E=;
 b=bs8O920SS1yotiq316xmFKSrZBnBRdPAatoEKVXgtngpJcFL++S9RN5RwkXU2oL4Xx
 K0Xovl+wvF80zIxlBK+RWOePBY/ZNYDD8y0nTG/5qxJCsOX9yRL2TSOSxrjFTaSV9vWb
 kkcNaCW0XzGLmtdgZxX+e0l1kxQZSSgRJgEuC11v8NNShmuCvWGSdMTSM6g1SrlevIAF
 k0K/m1O0x9KoKblKFHdKetFua70jZ1+UwCwXtCXl5o0pHJOXI3684yFzCU7yGoVPy6e+
 /F5rsnlyDzeNoL48tvUnWJktqdeqB1xjmff/zZbdJSsR2bJw3dwlqd8QcraP2rM3Q/S5
 rIDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cr5sx8yPELFvuYRl+jNMxMdmYnoYhuCmAKJ5oKY9g0E=;
 b=UKh/YfCAzYIuqwXvB2T83gvX4WY5M/BPvD4KIeFJHer2HG9j5+ec001jmZ8VTzmIaA
 C/wvnSJjHRd3uNX/kv38E5x4ZBxux+5kR0zFIVRCaqABKOtkxtg9KR2VIFwdotIjjBzF
 4cXfPfKPN0wQBT9OC6BhDvSaye0Yu7CxRyjBs3F/Qb95iCI6T5nsxTYDWunTt7MQUr3b
 Zabvr1U0VMhNPUL4WM+aLJeKCZU4Ox5MS93GmKdi0ntNH+OeImZKUDXY2E0DLb8O7Vij
 kQpplZ2rDf6cQVhfQHB3o015LZdjlqc4cGp4/08z+MjThXTnhT5OxLHBwt42lQlFqCTh
 VzAQ==
X-Gm-Message-State: APjAAAVarKnr7RPFp3VC7KHynwC6X1Wjh0NBBGWfivFTQ3uFIfFOqHqd
 DqBN3bQCDDO2yoOTQgbZYSk=
X-Google-Smtp-Source: APXvYqz6YXrRtzypIMvVy+x3Jnu/MuLIq8K/vpYiXguCE8h2B/hQlRh5PoCsvQtDYr6Xwakge0GZjg==
X-Received: by 2002:a17:90a:8912:: with SMTP id
 u18mr46705829pjn.21.1578373732299; 
 Mon, 06 Jan 2020 21:08:52 -0800 (PST)
Received: from localhost.localdomain (ip68-111-84-250.oc.oc.cox.net.
 [68.111.84.250])
 by smtp.gmail.com with ESMTPSA id l66sm75149647pga.30.2020.01.06.21.08.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jan 2020 21:08:51 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
To: netdev@vger.kernel.org
Date: Mon,  6 Jan 2020 21:08:46 -0800
Message-Id: <20200107050846.16838-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Jayati Sahu <jayati.sahu@samsung.com>,
 Florian Fainelli <f.fainelli@gmail.com>, tomeu.vizoso@collabora.com,
 guillaume.tucker@collabora.com, mgalka@collabora.com,
 Sriram Dash <sriram.dash@samsung.com>, linux-kernel@vger.kernel.org,
 Padmanabhan Rajanbabu <p.rajanbabu@samsung.com>,
 linux-stm32@st-md-mailman.stormreply.com, broonie@kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, khilman@baylibre.com,
 enric.balletbo@collabora.com, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 heiko@sntech.de
Subject: [Linux-stm32] [PATCH net] Revert "net: stmmac: platform: Fix MDIO
	init for platforms without PHY"
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

This reverts commit d3e014ec7d5ebe9644b5486bc530b91e62bbf624 ("net:
stmmac: platform: Fix MDIO init for platforms without PHY") because it
breaks existing systems with stmmac which do not have a MDIO bus
sub-node nor a 'phy-handle' property declared in their Device Tree. On
those systems, the stmmac MDIO bus is expected to be created and then
scanned by of_mdiobus_register() to create PHY devices.

While these systems should arguably make use of a more accurate Device
Tree reprensentation with the use of the MDIO bus sub-node an
appropriate 'phy-handle', we cannot break them, therefore restore the
behavior prior to the said commit.

Fixes: d3e014ec7d5e ("net: stmmac: platform: Fix MDIO init for platforms without PHY")
Reported-by: Heiko Stuebner <heiko@sntech.de>
Reported-by: kernelci.org bot <bot@kernelci.org>
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
Heiko,

I did not add the Tested-by because the patch is a little bit different
from what you tested, even if you most likely were not hitting the other
part that I was changing. Thanks!

 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index cc8d7e7bf9ac..bedaff0c13bd 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -320,7 +320,7 @@ static int stmmac_mtl_setup(struct platform_device *pdev,
 static int stmmac_dt_phy(struct plat_stmmacenet_data *plat,
 			 struct device_node *np, struct device *dev)
 {
-	bool mdio = false;
+	bool mdio = true;
 	static const struct of_device_id need_mdio_ids[] = {
 		{ .compatible = "snps,dwc-qos-ethernet-4.10" },
 		{},
-- 
2.19.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
