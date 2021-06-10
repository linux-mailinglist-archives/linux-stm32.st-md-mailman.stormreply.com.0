Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E3B3A2EEE
	for <lists+linux-stm32@lfdr.de>; Thu, 10 Jun 2021 17:02:53 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6033FC59785;
	Thu, 10 Jun 2021 15:02:53 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AD8D4C58D5B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Jun 2021 15:02:49 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id A9BE382CBE;
 Thu, 10 Jun 2021 17:02:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1623337368;
 bh=F1MFJ40uheWhOoZMdVjlvdWhoiB2l8C8uaYwt0D+N0M=;
 h=From:To:Cc:Subject:Date:From;
 b=FEPXqSqunkPgQqx2Ld2k2AQLlFk2cpIfZEQm8+fa9kdLkmlBCLtmZoZBdx5iwzpOw
 VQ3bWo61+Iiz/8LBndP1OXMv/kdIFTAbgRbdfb/XIS8HMzOSjJq2wRJ3WyRxXBcREt
 BiEwRjyQvvIDHcnvLpxbSutgRLdw2G7aumkB7Ts3H/zEF5nkv4Om/0V1hZMBe8csUT
 XNv4G9jCDdo5QAg7qO6kFaom/dDzjOTMumMI8v2HUAzSMmwuR85sgZKb5+jv2q1Wmc
 JVOjNyfpTwKEsEtPMJ/9SmbQwZ9ALtlCG1KcHY3MRkWbRQm5eDach25fORVre7fxQa
 XAc+2OKChac7A==
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Date: Thu, 10 Jun 2021 17:02:41 +0200
Message-Id: <20210610150243.30017-1-marex@denx.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, kernel@dh-electronics.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 1/3] ARM: dts: stm32: Set {bitclock,
	frame}-master phandles on DHCOM SoM
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

Fix the following dtbs_check warning:
arch/arm/boot/dts/stm32mp157c-dhcom-pdk2.dt.yaml: codec@a: port:endpoint@0:frame-master: True is not of type 'array'
arch/arm/boot/dts/stm32mp157c-dhcom-pdk2.dt.yaml: codec@a: port:endpoint@0:bitclock-master: True is not of type 'array'

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: kernel@dh-electronics.com
Cc: linux-stm32@st-md-mailman.stormreply.com
To: linux-arm-kernel@lists.infradead.org
---
 arch/arm/boot/dts/stm32mp15xx-dhcom-pdk2.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/stm32mp15xx-dhcom-pdk2.dtsi b/arch/arm/boot/dts/stm32mp15xx-dhcom-pdk2.dtsi
index c5ea08fec535..d9316701fd03 100644
--- a/arch/arm/boot/dts/stm32mp15xx-dhcom-pdk2.dtsi
+++ b/arch/arm/boot/dts/stm32mp15xx-dhcom-pdk2.dtsi
@@ -168,15 +168,15 @@ sgtl5000_port: port {
 			sgtl5000_tx_endpoint: endpoint@0 {
 				reg = <0>;
 				remote-endpoint = <&sai2a_endpoint>;
-				frame-master;
-				bitclock-master;
+				frame-master = <&sgtl5000_tx_endpoint>;
+				bitclock-master = <&sgtl5000_tx_endpoint>;
 			};
 
 			sgtl5000_rx_endpoint: endpoint@1 {
 				reg = <1>;
 				remote-endpoint = <&sai2b_endpoint>;
-				frame-master;
-				bitclock-master;
+				frame-master = <&sgtl5000_rx_endpoint>;
+				bitclock-master = <&sgtl5000_rx_endpoint>;
 			};
 		};
 
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
