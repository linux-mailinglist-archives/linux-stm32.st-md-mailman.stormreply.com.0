Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C994DA6EA17
	for <lists+linux-stm32@lfdr.de>; Tue, 25 Mar 2025 08:04:09 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8E7A1C78F6A;
	Tue, 25 Mar 2025 07:04:09 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DA493C78F68
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Mar 2025 07:04:08 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52P0A5ga001404;
 Tue, 25 Mar 2025 08:03:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 umpdSL1RKDrcoeiEHF4TRnfTgu3+K+Z+OfPFiuVf284=; b=BDJDBk/uC2fTS7+B
 6msmrNmD72HJbQ3vzimICXB/O17aExo2nM8zjrrC0n10Z89v2UtzFP+ecrzBxQhs
 e2/ybX9fkfVSBj+WcCJktUEHkTvz0njnHH5B3MVhdDY3zWT9vsFZ0Dg4QOoFQxUh
 tSGvnm7nsrGEVYmMEBxUjZEt0wseqWu7SLGJof6EWFh5A7YZiT/RWg2Ip/S1hHD+
 TwiAy86L2MLjPkeEHMi/gvNwyDFaAFHmP+hFoO4J0DDzurdlcfYraU8hnJQ9L1BT
 JJp0LekoycfF11+0B1nqONIXnwPb0Va8Yt43Siym96HwrKHwWXHtXjoRINU8thWF
 htGzXA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45j7n88n3m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Mar 2025 08:03:49 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 469A540069;
 Tue, 25 Mar 2025 08:02:29 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B57D482D10A;
 Tue, 25 Mar 2025 08:01:16 +0100 (CET)
Received: from localhost (10.130.77.120) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 25 Mar
 2025 08:01:16 +0100
From: Christian Bruel <christian.bruel@foss.st.com>
To: <christian.bruel@foss.st.com>, <lpieralisi@kernel.org>, <kw@linux.com>,
 <manivannan.sadhasivam@linaro.org>, <robh@kernel.org>,
 <bhelgaas@google.com>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
 <mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>,
 <p.zabel@pengutronix.de>, <johan+linaro@kernel.org>,
 <cassel@kernel.org>, <quic_schintav@quicinc.com>
Date: Tue, 25 Mar 2025 07:59:34 +0100
Message-ID: <20250325065935.908886-9-christian.bruel@foss.st.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250325065935.908886-1-christian.bruel@foss.st.com>
References: <20250325065935.908886-1-christian.bruel@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.130.77.120]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-25_03,2025-03-21_01,2024-11-22_01
Cc: devicetree@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v5 8/9 RESEND] arm64: dts: st: Add PCIe
	Endpoint mode on stm32mp251
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

Add pcie_ep node to support STM32 MP25 PCIe driver based on the
DesignWare PCIe core configured as Endpoint mode

Signed-off-by: Christian Bruel <christian.bruel@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp251.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index a8abb13ab663..fe73161ed0d4 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -909,6 +909,19 @@ stmmac_axi_config_1: stmmac-axi-config {
 				};
 			};
 
+			pcie_ep: pcie-ep@48400000 {
+				compatible = "st,stm32mp25-pcie-ep";
+				reg = <0x48400000 0x400000>,
+				      <0x10000000 0x8000000>;
+				reg-names = "dbi", "addr_space";
+				clocks = <&rcc CK_BUS_PCIE>;
+				resets = <&rcc PCIE_R>;
+				phys = <&combophy PHY_TYPE_PCIE>;
+				access-controllers = <&rifsc 68>;
+				power-domains = <&CLUSTER_PD>;
+				status = "disabled";
+			};
+
 			pcie_rc: pcie@48400000 {
 				compatible = "st,stm32mp25-pcie-rc";
 				device_type = "pci";
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
