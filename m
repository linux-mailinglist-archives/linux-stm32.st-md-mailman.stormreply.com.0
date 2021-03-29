Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F9B34D85A
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Mar 2021 21:36:35 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1E08EC57B60;
	Mon, 29 Mar 2021 19:36:35 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 99381C57B54
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Mar 2021 19:36:31 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4F8N9q2LS7z1s5Vy;
 Mon, 29 Mar 2021 21:36:31 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4F8N9q250nz1r1MD;
 Mon, 29 Mar 2021 21:36:31 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id qua_zFdu-A_h; Mon, 29 Mar 2021 21:36:30 +0200 (CEST)
X-Auth-Info: Vb5HA1EqNOnXlCretmZUtQVUP3Idsb6GVwwb/GmTVAM=
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Mon, 29 Mar 2021 21:36:30 +0200 (CEST)
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Date: Mon, 29 Mar 2021 21:36:13 +0200
Message-Id: <20210329193614.13374-3-marex@denx.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210329193614.13374-1-marex@denx.de>
References: <20210329193614.13374-1-marex@denx.de>
MIME-Version: 1.0
Cc: Marek Vasut <marex@denx.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Subject: [Linux-stm32] [PATCH V3 3/4] ARM: dts: stm32: Update GPIO line
	names on DRC02
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

Use more specific custom GPIO line names which denote exactly where
the GPIO came from, i.e. the base board. Also, update the new blank
GPIO line names set up by stm32mp15xx-dhcom-som.dtsi back to their
original values.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: linux-stm32@st-md-mailman.stormreply.com
To: linux-arm-kernel@lists.infradead.org
---
V2: New patch
V3: No change
---
 arch/arm/boot/dts/stm32mp15xx-dhcom-drc02.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/stm32mp15xx-dhcom-drc02.dtsi b/arch/arm/boot/dts/stm32mp15xx-dhcom-drc02.dtsi
index fad23d6f69b8..fb45c5aa878d 100644
--- a/arch/arm/boot/dts/stm32mp15xx-dhcom-drc02.dtsi
+++ b/arch/arm/boot/dts/stm32mp15xx-dhcom-drc02.dtsi
@@ -43,15 +43,15 @@ rs485-rx-en-hog {
 
 &gpiod {
 	gpio-line-names = "", "", "", "",
-			  "", "", "", "",
-			  "", "", "", "Out1",
-			  "Out2", "", "", "";
+			  "", "", "DHCOM-B", "",
+			  "", "", "", "DRC02-Out1",
+			  "DRC02-Out2", "", "", "";
 };
 
 &gpioi {
-	gpio-line-names = "In1", "", "", "",
-			  "", "", "", "",
-			  "In2", "", "", "",
+	gpio-line-names = "DRC02-In1", "DHCOM-O", "DHCOM-H", "DHCOM-I",
+			  "DHCOM-R", "DHCOM-M", "", "",
+			  "DRC02-In2", "", "", "",
 			  "", "", "", "";
 
 	/*
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
