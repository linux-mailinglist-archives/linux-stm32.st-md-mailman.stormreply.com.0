Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F72423B18
	for <lists+linux-stm32@lfdr.de>; Wed,  6 Oct 2021 11:54:11 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9665DC597B4;
	Wed,  6 Oct 2021 09:54:11 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E1E0DC32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 Oct 2021 09:54:08 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1968Zurl023597; 
 Wed, 6 Oct 2021 11:53:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=iBK4jt+j/TuaNdy+BtubPQOGdvAAr+skdXQvKDtN8d4=;
 b=OVS9amKfW5iF06CYWl4M0AJla3mr76y6Opsvuizx+rhWsdJe2z6hQGiH0id/Q8fTtJnG
 nB3eIF+Nsc7yAKsJxawwJpR6OfHpeeAjLO02KyoJssoNs5TTgTISi7xRN5xvgNJDD/S4
 B4rIX/vU8Qb7494IW9R9k6k+fiyn49V1lavZUR8OW4kxDv8gft6sJ5lpztnkHlhROoGw
 7tV1UyYenUyFCLuII4bEFsEMsP6IFch6X5OpyXZam9qTFdT/Fy1JgTjweunFPeWBAeOx
 utaBq4G3lTPQPZtL4njJ4VyvYGBfbDbQ/u2Fi3KQsMT4xo5fikjQZrsAqHaNqsvgKjh+ wg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3bh8e8ghe6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 Oct 2021 11:53:57 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6B520100034;
 Wed,  6 Oct 2021 11:53:56 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6346F21BF6D;
 Wed,  6 Oct 2021 11:53:56 +0200 (CEST)
Received: from localhost (10.75.127.50) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.18; Wed, 6 Oct 2021 11:53:55
 +0200
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Rob Herring <robh+dt@kernel.org>
Date: Wed, 6 Oct 2021 11:53:55 +0200
Message-ID: <20211006095355.59078-1-amelie.delaunay@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-06_02,2021-10-04_01,2020-04-07_01
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH 1/1] ARM: dts: stm32: use usbphyc ck_usbo_48m
	as USBH OHCI clock on stm32mp151
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

Referring to the note under USBH reset and clocks chapter of RM0436,
"In order to access USBH_OHCI registers it is necessary to activate the USB
clocks by enabling the PLL controlled by USBPHYC" (ck_usbo_48m).

The point is, when USBPHYC PLL is not enabled, OHCI register access
freezes the resume from STANDBY. It is the case when dual USBH is enabled,
instead of OTG + single USBH.
When OTG is probed, as ck_usbo_48m is USBO clock parent, then USBPHYC PLL
is enabled and OHCI register access is OK.

This patch adds ck_usbo_48m (provided by USBPHYC PLL) as clock of USBH
OHCI, thus USBPHYC PLL will be enabled and OHCI register access will be OK.

Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
---
 arch/arm/boot/dts/stm32mp151.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/stm32mp151.dtsi b/arch/arm/boot/dts/stm32mp151.dtsi
index bd289bf5d269..fe194c787e6c 100644
--- a/arch/arm/boot/dts/stm32mp151.dtsi
+++ b/arch/arm/boot/dts/stm32mp151.dtsi
@@ -1452,7 +1452,7 @@ stmmac_axi_config_0: stmmac-axi-config {
 		usbh_ohci: usb@5800c000 {
 			compatible = "generic-ohci";
 			reg = <0x5800c000 0x1000>;
-			clocks = <&rcc USBH>;
+			clocks = <&rcc USBH>, <&usbphyc>;
 			resets = <&rcc USBH_R>;
 			interrupts = <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
 			status = "disabled";
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
