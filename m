Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B9992CF36CD
	for <lists+linux-stm32@lfdr.de>; Mon, 05 Jan 2026 13:08:49 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 889ACC58D7C;
	Mon,  5 Jan 2026 12:08:49 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B95DCC57B72
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Jan 2026 12:08:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id E9CB06013D;
 Mon,  5 Jan 2026 12:08:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E411C19423;
 Mon,  5 Jan 2026 12:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767614927;
 bh=eYjmO4/KcUuQSAgS/pqGfLZtRf+t9bOtnePit3tibMs=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=SxbHD1eTJ4owNlGjsW70TBjverDtGr56WE31xriIvnnry3XEZ3jcSh1E7VHVrSbkA
 +/DfAHvV95XS+zfBGK3Bvcq4ns/5fTKJXBZPK0Z1go+3wmJsAA8ZiLlvC4YizCF0A3
 pVnEDTxl1wiyzm0xrzSNVWgbL9DCM0hCov0VPr1cVA6c7VJ3p3XDl3Y0sDF/omnMqB
 mpX73gC6HT5rVbudQywidJHdaGIdV7JXL5TByhnKc3B1XXj/T5mZEKcYuJE/3z9ys2
 ebBnDiwijtOmjFUZX/xdME8E1MLJSJSzOp8XC+4wG7Id6DpEu/xeHwoZW0P0ySXe38
 BFFYmySrx34mg==
From: Dinh Nguyen <dinguyen@kernel.org>
Date: Mon, 05 Jan 2026 06:08:22 -0600
MIME-Version: 1.0
Message-Id: <20260105-remove_ocp-v2-3-4fa2bda09521@kernel.org>
References: <20260105-remove_ocp-v2-0-4fa2bda09521@kernel.org>
In-Reply-To: <20260105-remove_ocp-v2-0-4fa2bda09521@kernel.org>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Mamta Shukla <mamta.shukla@leica-geosystems.com>, 
 Ahmad Fatoum <a.fatoum@pengutronix.de>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1335; i=dinguyen@kernel.org;
 h=from:subject:message-id; bh=eYjmO4/KcUuQSAgS/pqGfLZtRf+t9bOtnePit3tibMs=;
 b=owEBbQKS/ZANAwAKARmUBAuBoyj0AcsmYgBpW6nFGDEllWKa5yDVYKLtEHySPlbck9AIb35oX
 E72YoMUWMGJAjMEAAEKAB0WIQSgeEx6LKTlWbBUzA0ZlAQLgaMo9AUCaVupxQAKCRAZlAQLgaMo
 9MKRD/9Yk152YGHFJ8AKQitkuaNlY1VXWKWvxwWHopFkr8fWGmHO4yFMObHdCmZXPBn4TRaf7kR
 yO4LdO1avjGMUPAIrQClArlZYlTM2htGT1OWhBRNFtMJzrLgbycBXZRgG8hSEol9sLKUqnIza5H
 9YAokKctmMLwhKKTNua0unbOJkKHlzOTbxzn/AksmJIuO+q53wg8dQ/l7rwvkkSPNgDvE7AqSyv
 5/jnJHWPpu4iHqJr38V5EPPSsZTolcZB0bDhR1FzivhwyOUDVsqKT1Cl8tehrsmAsgUNWg4ge+p
 OmB5TIquALO7ykX967taXm4psv808EROVI6WpI0VnoQt2KpowZHRxVmlUXuR0etN+VK5B+p9FRl
 s3QDVue004RHuNUNWvwc7VO859aQN1a9MzK50OhvRLWi58/4//qP+INhEwU8VNT9NVYe6q+LGUQ
 ha00k0Ah1372Rkre6IUwDdurhNWM98ugq9QXYhLI5uQXwPib1wrF7Q2PLMT4+mEiJ2ZYiudKlyP
 OApm/7M8mMUAl6AUZbOGM89xFr+f5kwachzy6oIeXxR1ybOMGkMtssUCwHgnM3OaoED74d7sNTG
 EfDHwEMyUu/dz1Wj1oLi0ed5h+Fse58bn6vqbsSgYVXF4aGCRksoENoVXRT7HXIpWgGae70ET9H
 ulRcXdkmUjDj2bA==
X-Developer-Key: i=dinguyen@kernel.org; a=openpgp;
 fpr=A0784C7A2CA4E559B054CC0D1994040B81A328F4
Cc: devicetree@vger.kernel.org, bsp-development.geo@leica-geosystems.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Dinh Nguyen <dinguyen@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 3/3] dt-bindings: net: altr,
 socfpga-stmmac: deprecate 'stmmaceth-ocp'
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

Make the reset name 'stmmaceth-ocp' as deprecated and to use 'ahb' going
forward.

Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
---
 .../devicetree/bindings/net/altr,socfpga-stmmac.yaml          | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml b/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml
index fc445ad5a1f1..4ba06a955fe2 100644
--- a/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml
+++ b/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml
@@ -13,8 +13,6 @@ description:
   This binding describes the Altera SOCFPGA SoC implementation of the
   Synopsys DWMAC for the Cyclone5, Arria5, Stratix10, Agilex5 and Agilex7
   families of chips.
-  # TODO: Determine how to handle the Arria10 reset-name, stmmaceth-ocp, that
-  # does not validate against net/snps,dwmac.yaml.
 
 select:
   properties:
@@ -84,6 +82,15 @@ properties:
       - sgmii
       - 1000base-x
 
+  resets:
+    minItems: 1
+
+  reset-names:
+    deprecated: true
+    items:
+      - const: stmmaceth-ocp
+    description: Do not use 'stmmaceth-ocp' going forward, please use 'ahb' instead.
+
   rxc-skew-ps:
     description: Skew control of RXC pad
 

-- 
2.42.0.411.g813d9a9188

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
