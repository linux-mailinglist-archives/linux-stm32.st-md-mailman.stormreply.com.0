Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EDFD55FF00D
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Oct 2022 16:17:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A458DC65048;
	Fri, 14 Oct 2022 14:17:01 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5326DC65043
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Oct 2022 14:17:00 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29EAjEqT030849;
 Fri, 14 Oct 2022 16:16:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=VxRBgimP26JpPfojcnUGD1RWSdCB/e3xLalPvah99dU=;
 b=ufAhqHD5xXxV8jD8vaFeksi/f4zzF6qyNyzYgRM/Qk8EItgGo7mO7K3WkViawZAfySwI
 G1bjjeoQDQR7H2e7vucTTOsv7wluxjmK+dzftlkDWvrHTv450UZwtkcTQEzVDr/+dfhv
 nM2dIWhJuv34oCqy0AemXZRVaJNSWOuI0JOmUCJXm4LBbTu18DEPOiVt9ONNY/zJcifw
 sup+NbajEe9MbW+SNT350Qvv/iOEhzLnNa9LfW9OFsz0CpvskeRONC+P5wWARKohULcf
 PGYA7F57XXDFmr/l6HD7vfMF+ZlCtjjQhuE1eEuzfGVr5Ngz9GzCo8mTXrl2WxWtNCUq Cg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3k769qsb5v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Oct 2022 16:16:50 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 58F83100034;
 Fri, 14 Oct 2022 16:16:45 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 53E2B231505;
 Fri, 14 Oct 2022 16:16:45 +0200 (CEST)
Received: from localhost (10.75.127.45) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Fri, 14 Oct
 2022 16:16:44 +0200
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
To: <alexandre.torgue@foss.st.com>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>
Date: Fri, 14 Oct 2022 16:15:05 +0200
Message-ID: <20221014141509.211149-7-fabrice.gasnier@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221014141509.211149-1-fabrice.gasnier@foss.st.com>
References: <20221014141509.211149-1-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-14_08,2022-10-14_01,2022-06-22_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 06/10] ARM: dts: stm32: enable USB HS phys
	on stm32mp135f-dk
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

From: Amelie Delaunay <amelie.delaunay@foss.st.com>

USBPHYC manages the two USB High-Speed phys. port0 is used by USBH and
port1 is used by USBOTG.
Enable and tune both PHYs on stm32mp135f-dk.

Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
---
 arch/arm/boot/dts/stm32mp135f-dk.dts | 32 ++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm/boot/dts/stm32mp135f-dk.dts b/arch/arm/boot/dts/stm32mp135f-dk.dts
index 291f05a958fd..af87fb36eabc 100644
--- a/arch/arm/boot/dts/stm32mp135f-dk.dts
+++ b/arch/arm/boot/dts/stm32mp135f-dk.dts
@@ -144,3 +144,35 @@ &uart4 {
 	pinctrl-0 = <&uart4_pins_a>;
 	status = "okay";
 };
+
+&usbphyc {
+	status = "okay";
+};
+
+&usbphyc_port0 {
+	phy-supply = <&vdd_usb>;
+	st,current-boost-microamp = <1000>;
+	st,decrease-hs-slew-rate;
+	st,tune-hs-dc-level = <2>;
+	st,enable-hs-rftime-reduction;
+	st,trim-hs-current = <11>;
+	st,trim-hs-impedance = <2>;
+	st,tune-squelch-level = <1>;
+	st,enable-hs-rx-gain-eq;
+	st,no-hs-ftime-ctrl;
+	st,no-lsfs-sc;
+};
+
+&usbphyc_port1 {
+	phy-supply = <&vdd_usb>;
+	st,current-boost-microamp = <1000>;
+	st,decrease-hs-slew-rate;
+	st,tune-hs-dc-level = <2>;
+	st,enable-hs-rftime-reduction;
+	st,trim-hs-current = <11>;
+	st,trim-hs-impedance = <2>;
+	st,tune-squelch-level = <1>;
+	st,enable-hs-rx-gain-eq;
+	st,no-hs-ftime-ctrl;
+	st,no-lsfs-sc;
+};
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
