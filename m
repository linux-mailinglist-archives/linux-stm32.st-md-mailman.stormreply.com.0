Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C9DD9D28D0
	for <lists+linux-stm32@lfdr.de>; Tue, 19 Nov 2024 16:01:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E366FC7A834;
	Tue, 19 Nov 2024 15:01:13 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7C365C78F9C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Nov 2024 15:01:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 3CC59A42B89;
 Tue, 19 Nov 2024 14:59:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5FB55C4CEF9;
 Tue, 19 Nov 2024 15:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732028465;
 bh=Jr5TibAxKlW6LPtn2UpIAws+Jljaxx/IUAbIela8acc=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=u/68oNb7CkfZKhPlsIU9LN0uIefJVa3Rem3KlFpTm4daxg27ET7sDvfths89ghFmH
 6vRrhosKyqz411NyZ/PRV0DOOD/bGD2LPTzHDfys+DXN79as9MC2/6HsnN9DCo5gin
 gTwC81LNAKGlESVBN49n9vWaaeodJ5T5NhFpYlprr13ZW62l960G2f8NXeyi1xss4a
 nqmFCOloDhqOuV1rUrhrpDHhfqwGXwAK8NcM9xIo53QEm/HduKBjsWUFCzcLdYs+gt
 qj3UfE0gks/mFpjAluiyUQoL2BLxhuEplo+O8L2kJo48vr1V/ZAqGhcqX/k9euCqHu
 BWKZM0DvKWPiw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 56486D44162;
 Tue, 19 Nov 2024 15:01:05 +0000 (UTC)
From: Jan Petrous via B4 Relay <devnull+jan.petrous.oss.nxp.com@kernel.org>
Date: Tue, 19 Nov 2024 16:00:21 +0100
MIME-Version: 1.0
Message-Id: <20241119-upstream_s32cc_gmac-v5-15-7dcc90fcffef@oss.nxp.com>
References: <20241119-upstream_s32cc_gmac-v5-0-7dcc90fcffef@oss.nxp.com>
In-Reply-To: <20241119-upstream_s32cc_gmac-v5-0-7dcc90fcffef@oss.nxp.com>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>, 
 Richard Cochran <richardcochran@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Emil Renner Berthing <kernel@esmil.dk>, 
 Minda Chen <minda.chen@starfivetech.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Iyappan Subramanian <iyappan@os.amperecomputing.com>, 
 Keyur Chudgar <keyur@os.amperecomputing.com>, 
 Quan Nguyen <quan@os.amperecomputing.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732028461; l=915;
 i=jan.petrous@oss.nxp.com; s=20240922; h=from:subject:message-id;
 bh=pHfq2w2j/SBgXCktQF2QqXPe5W6F70KOUcF5p5w2GsQ=;
 b=kg29ciDxOYgCtpwUA3BwC8OyW9MWH36GrRkyP2aoXLaiP8YzLpujxXXK+dVU1O7XUH5tRKMmO
 50nCIVDiH+9CkW1LffGBetnJYKNNZxBRWJIyA9rTWuO9O0z8R/ZHoE1
X-Developer-Key: i=jan.petrous@oss.nxp.com; a=ed25519;
 pk=Ke3wwK7rb2Me9UQRf6vR8AsfJZfhTyoDaxkUCqmSWYY=
X-Endpoint-Received: by B4 Relay for jan.petrous@oss.nxp.com/20240922 with
 auth_id=217
X-Original-From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
Cc: imx@lists.linux.dev, NXP S32 Linux Team <s32@nxp.com>,
 devicetree@vger.kernel.org, netdev@vger.kernel.org,
 "Jan Petrous \(OSS\)" <jan.petrous@oss.nxp.com>, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v5 15/16] MAINTAINERS: Add Jan Petrous as the
 NXP S32G/R DWMAC driver maintainer
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
Reply-To: jan.petrous@oss.nxp.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>

Add myself as NXP S32G/R DWMAC Ethernet driver maintainer.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 82161bc70b51..c65d8f904871 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2791,6 +2791,13 @@ S:	Maintained
 F:	arch/arm64/boot/dts/freescale/s32g*.dts*
 F:	drivers/pinctrl/nxp/
 
+ARM/NXP S32G/S32R DWMAC ETHERNET DRIVER
+M:	Jan Petrous <jan.petrous@oss.nxp.com>
+L:	NXP S32 Linux Team <s32@nxp.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml
+F:	drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
+
 ARM/Orion SoC/Technologic Systems TS-78xx platform support
 M:	Alexander Clouter <alex@digriz.org.uk>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)

-- 
2.47.0


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
