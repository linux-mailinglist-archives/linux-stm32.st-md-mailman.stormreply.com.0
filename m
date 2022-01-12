Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 88FA848C857
	for <lists+linux-stm32@lfdr.de>; Wed, 12 Jan 2022 17:32:49 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4D23EC60464;
	Wed, 12 Jan 2022 16:32:49 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CBE5CC5F1FE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Jan 2022 16:32:47 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20CAfCAW018222;
 Wed, 12 Jan 2022 17:32:37 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=v6eYEgM1I0R4B/VduVkARxGZsJmH4TR8k7GEaaNj4RM=;
 b=wYosDKr2EwozQVSjdc1b4xkhJf2McOsgwzFALZiDSkZ09EE4jQC9w4TeYInb673vS6y9
 O1YACjBIw+ldt9rzmnnUxvqG5bJ3s7c6IbKBJLL24rTGjGuaWZDdZRm/v32qDO2GUoVN
 YV6DnyqBz2GxU1XuOXIi6s/2iNYlmOV4HgG4AAwGRdEPDU9w97JU83OPorb/pBt0N0SL
 1S0/mbVF3n0gBpkvYVDUmXAhGyAsILnmRgMYYjOdtWSTEZLBUbupX0QhGC86xwS9ZB/5
 WjNtT1oNA0rNQV66iT8bwZtEqf7cLCBeibzHGRdnrljwBGoCH7JV1TEOOOe3yDnqTILa GQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3dhssduggt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 17:32:37 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 82F76100034;
 Wed, 12 Jan 2022 17:32:36 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7B7EB24B8B1;
 Wed, 12 Jan 2022 17:32:36 +0100 (CET)
Received: from localhost (10.75.127.49) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Wed, 12 Jan 2022 17:32:36
 +0100
From: Yann Gautier <yann.gautier@foss.st.com>
To: Rob Herring <robh+dt@kernel.org>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, <devicetree@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>
Date: Wed, 12 Jan 2022 17:32:21 +0100
Message-ID: <20220112163226.25384-6-yann.gautier@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220112163226.25384-1-yann.gautier@foss.st.com>
References: <20220112163226.25384-1-yann.gautier@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-12_04,2022-01-11_01,2021-12-02_01
Cc: linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH 05/10] ARM: dts: stm32: update SDMMC clock
	slew-rate on STM32MP135F-DK board
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

Add sdmmc1_clk_pins_a in sdmmc1 pinctrl nodes, to properly manage
clock slew-rate.

Signed-off-by: Yann Gautier <yann.gautier@foss.st.com>
---
 arch/arm/boot/dts/stm32mp135f-dk.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/stm32mp135f-dk.dts b/arch/arm/boot/dts/stm32mp135f-dk.dts
index 7e96d9e36217..aae8d3512f4b 100644
--- a/arch/arm/boot/dts/stm32mp135f-dk.dts
+++ b/arch/arm/boot/dts/stm32mp135f-dk.dts
@@ -39,8 +39,8 @@
 
 &sdmmc1 {
 	pinctrl-names = "default", "opendrain";
-	pinctrl-0 = <&sdmmc1_b4_pins_a>;
-	pinctrl-1 = <&sdmmc1_b4_od_pins_a>;
+	pinctrl-0 = <&sdmmc1_b4_pins_a &sdmmc1_clk_pins_a>;
+	pinctrl-1 = <&sdmmc1_b4_od_pins_a &sdmmc1_clk_pins_a>;
 	broken-cd;
 	disable-wp;
 	st,neg-edge;
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
