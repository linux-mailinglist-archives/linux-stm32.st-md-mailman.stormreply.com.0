Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B552962A60
	for <lists+linux-stm32@lfdr.de>; Wed, 28 Aug 2024 16:37:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B41B9C7801B;
	Wed, 28 Aug 2024 14:37:30 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B99FFC6DD9D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 Aug 2024 14:37:26 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47SDcCfo022823;
 Wed, 28 Aug 2024 16:37:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 ck4s9sjzRdFKY2yhhiCmjDcHrYqvSsSnJL3gyw79cpI=; b=d6Ck69EJgH4Hi8VP
 oFGQKmRMaYpJ7jhMcHd2BpspEApjVTSi/x1J9WlPcQE0Ii8+QVDBJ3hZycdtMDNS
 ChrdUyaINUyfOqam7Jzn0MZq+cR1+MaxJCBBfNp3YWE2WaJ2cdVy+zqNMHRzsDAF
 AObsUk/sk3gfH+ghntKqDSFHK9dw+xBNUXZ3i2R+GVmZhiJi2nMXIGuUOHMA964Y
 1zkbfNZI57VjsI0/KLwOt7GkzWZCKaWDpLgh2qP756gao/Vo8kOvnIwP4UY7zHhY
 5ueFFGhfP26d7UOT37MAjYjKZpVO5wGUFTZ3khvnGY2sjsoXsFyL9CdftjmFxk2m
 hExK1g==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 41a4y00b4n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Aug 2024 16:37:16 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 9F3864002D;
 Wed, 28 Aug 2024 16:37:12 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EAA9B26F247;
 Wed, 28 Aug 2024 16:36:25 +0200 (CEST)
Received: from localhost (10.129.178.212) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Wed, 28 Aug
 2024 16:36:25 +0200
From: Christian Bruel <christian.bruel@foss.st.com>
To: <vkoul@kernel.org>, <kishon@kernel.org>, <robh@kernel.org>,
 <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
 <mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>,
 <p.zabel@pengutronix.de>
Date: Wed, 28 Aug 2024 16:34:50 +0200
Message-ID: <20240828143452.1407532-4-christian.bruel@foss.st.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240828143452.1407532-1-christian.bruel@foss.st.com>
References: <20240828143452.1407532-1-christian.bruel@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.129.178.212]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-28_05,2024-08-27_01,2024-05-17_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Christian Bruel <christian.bruel@foss.st.com>, linux-phy@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v4 3/5] MAINTAINERS: add entry for ST
	STM32MP25 COMBOPHY driver
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

Add myself as STM32MP25 COMBOPHY maintainer

Signed-off-by: Christian Bruel <christian.bruel@foss.st.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f328373463b0..4dc304ba6f90 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21910,6 +21910,12 @@ F:	arch/m68k/kernel/*sun3*
 F:	arch/m68k/sun3*/
 F:	drivers/net/ethernet/i825xx/sun3*
 
+STMICROELECTRONICS STMP32MP25 USB3/PCIE COMBOPHY DRIVER
+M:	Christian Bruel <christian.bruel@foss.st.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/phy/st,stm32mp25-combophy.yaml
+F:	drivers/phy/st/phy-stm32-combophy.c
+
 SUN4I LOW RES ADC ATTACHED TABLET KEYS DRIVER
 M:	Hans de Goede <hdegoede@redhat.com>
 L:	linux-input@vger.kernel.org
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
