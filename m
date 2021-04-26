Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F4F836B558
	for <lists+linux-stm32@lfdr.de>; Mon, 26 Apr 2021 17:00:34 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D70F3C57B6F;
	Mon, 26 Apr 2021 15:00:33 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0E5DACFAC55
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Apr 2021 15:00:24 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 1C38482843;
 Mon, 26 Apr 2021 17:00:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1619449223;
 bh=/rPzDFZwi+QGpWdCWyT5pJF0TpZfjpCjXWfODFoGgp0=;
 h=From:To:Cc:Subject:Date:From;
 b=wxW+YiXRif3Uc5fuz6fkmJNfUvXYvYN1sdCFOnE59TBSHWAjcLwm3Uk2tGw8DYQ4+
 dU1y5uUImJT7/jsU8gr4hYSeGbyfP0mQHglPed0JMsVZkHF8rPHjIK7lEjRu5Ky+Ux
 O8QS/fxQTEr1I32S8w/TROJU6uOCJH3YpL34FO09K/HrCcKsrKOqsU0FXHQLPnse5d
 OsWnK4nrURzDZwuIqdVBos44kccddrtbZvZhMHRda2dcHcTY3dRzbZYUvJ1TCjB371
 2HSZoawPRCGlPFCMAGJ6zv5N0htFIqWAUJvsRL2E6cYKOFi7CniN34Ge4YXw5okX5P
 PxOZbhT+GT4Yw==
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Date: Mon, 26 Apr 2021 17:00:12 +0200
Message-Id: <20210426150013.121406-1-marex@denx.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>, linux-stm32@st-md-mailman.stormreply.com,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Patrice Chotard <patrice.chotard@st.com>
Subject: [Linux-stm32] [PATCH 1/2] ARM: dts: stm32: Remove extra size-cells
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

Fix make dtbs_check warning:
arch/arm/boot/dts/stm32mp157c-dhcom-pdk2.dt.yaml: gpio-keys-polled: '#address-cells' is a dependency of '#size-cells'
arch/arm/boot/dts/stm32mp157c-dhcom-pdk2.dt.yaml: gpio-keys: '#address-cells' is a dependency of '#size-cells'

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alexandre Torgue <alexandre.torgue@st.com>
Cc: Patrice Chotard <patrice.chotard@st.com>
Cc: Patrick Delaunay <patrick.delaunay@st.com>
Cc: linux-stm32@st-md-mailman.stormreply.com
To: linux-arm-kernel@lists.infradead.org

Signed-off-by: Marek Vasut <marex@denx.de>
---
 arch/arm/boot/dts/stm32mp15xx-dhcom-pdk2.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/boot/dts/stm32mp15xx-dhcom-pdk2.dtsi b/arch/arm/boot/dts/stm32mp15xx-dhcom-pdk2.dtsi
index 5523f4138fd6..0fbf9913e8df 100644
--- a/arch/arm/boot/dts/stm32mp15xx-dhcom-pdk2.dtsi
+++ b/arch/arm/boot/dts/stm32mp15xx-dhcom-pdk2.dtsi
@@ -34,7 +34,6 @@ display_bl: display-bl {
 
 	gpio-keys-polled {
 		compatible = "gpio-keys-polled";
-		#size-cells = <0>;
 		poll-interval = <20>;
 
 		/*
@@ -60,7 +59,6 @@ button-2 {
 
 	gpio-keys {
 		compatible = "gpio-keys";
-		#size-cells = <0>;
 
 		button-1 {
 			label = "TA2-GPIO-B";
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
