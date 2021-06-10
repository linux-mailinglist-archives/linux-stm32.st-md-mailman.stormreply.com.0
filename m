Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 918223A2EEC
	for <lists+linux-stm32@lfdr.de>; Thu, 10 Jun 2021 17:02:53 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 224A6C58D5B;
	Thu, 10 Jun 2021 15:02:53 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ABCE4C57B7A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Jun 2021 15:02:50 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 55B2582ECD;
 Thu, 10 Jun 2021 17:02:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1623337369;
 bh=8wqH5TdiQ1EiyfbzZI4l6ICV+FVv8gQH1dolId+4pt0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Zq05PYSEO6yOLAfWbPdBMdd5F81auMBZKdyot29Gqy6sUYPWQna+iVR6p6TQVzN99
 e/9v51j7qXbKBvPDrugroKM1jUzTU8hMni9lcB3CVpoqC8dw+mB+CEqDkIZ4AlnciA
 kK0W+0QgK3FRP232fZmLh8RVfEqfYNGUD28rqEtDCSWz2Gu1EE1/dq84gJ9knvccPE
 eJKnVL0YisIrxJL3botWiUvOPSS4Vf+79I9BICJxEsHcXsgFo5qgCyxqRd/BlBKceF
 kqYz3UQzY27HYpUYJS0R+s2d400/j+lCmY0F1aJUkvAcXhtYCWxv8mYzfRYAyW+koB
 BU84r/XtoOXow==
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Date: Thu, 10 Jun 2021 17:02:43 +0200
Message-Id: <20210610150243.30017-3-marex@denx.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210610150243.30017-1-marex@denx.de>
References: <20210610150243.30017-1-marex@denx.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, kernel@dh-electronics.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 3/3] ARM: dts: stm32: Add usbphyc_port1 supply
	on DHCOM SoM
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

The port is unused, but shares the same supply with port0, so fill the
DT property in. This fixes the following dtbs_check warning:
arch/arm/boot/dts/stm32mp153c-dhcom-drc02.dt.yaml: usbphyc@5a006000: usb-phy@1: 'phy-supply' is a required property

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: kernel@dh-electronics.com
Cc: linux-stm32@st-md-mailman.stormreply.com
To: linux-arm-kernel@lists.infradead.org
---
 arch/arm/boot/dts/stm32mp15xx-dhcom-drc02.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/stm32mp15xx-dhcom-drc02.dtsi b/arch/arm/boot/dts/stm32mp15xx-dhcom-drc02.dtsi
index fb45c5aa878d..4b10b013ffd5 100644
--- a/arch/arm/boot/dts/stm32mp15xx-dhcom-drc02.dtsi
+++ b/arch/arm/boot/dts/stm32mp15xx-dhcom-drc02.dtsi
@@ -159,3 +159,7 @@ &usbphyc {
 &usbphyc_port0 {
 	phy-supply = <&vdd_usb>;
 };
+
+&usbphyc_port1 {
+	phy-supply = <&vdd_usb>;
+};
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
