Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF965868CE
	for <lists+linux-stm32@lfdr.de>; Mon,  1 Aug 2022 13:53:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4BE6FC640EF;
	Mon,  1 Aug 2022 11:53:44 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 720B8C5C829
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Jul 2022 07:53:27 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26P7F7Ua006897;
 Mon, 25 Jul 2022 09:53:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=/c2SOaFDssMPCp7DtxoyF6Nnd04FfjVIa2AavwMvoS4=;
 b=mSuuRGMTt+KiljIA6hxz8GIqxmsBMwCLU98dLkRL5SlQorffUR1JvT5XphCDTlMhQb5c
 ORKbmxeVu5XBINqI4Z5sr5kWNfGWEl+Hp5Ebq22Ljhdk5yK1+QT2jSwUp2hD2WTmszVa
 G0o5K25b22Mh/S2nfEytfLeTpjUjq1X11KR5D6QNwluKFbKTfgxwR8GKv8U+zHXKR5uy
 UppWE/tKVagW5eNE75oXlmcgy5VTHwl2cMkfvAVMbwaIO6p1727npd55T71vYvsM3sEf
 o1Nyht1zgZkFcAsHf9RoZM905jlG31HJsG+bm1Pyal3Z/DnEq7nB/aZcAXqOeCYh1i20 gg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3hg6dkg5e4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Jul 2022 09:53:19 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B5EFE10002A;
 Mon, 25 Jul 2022 09:53:18 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AEF952122FA;
 Mon, 25 Jul 2022 09:53:18 +0200 (CEST)
Received: from localhost (10.75.127.49) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Mon, 25 Jul
 2022 09:53:18 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
To: <alexandre.torgue@foss.st.com>
Date: Mon, 25 Jul 2022 09:52:53 +0200
Message-ID: <20220725075255.429869-1-alain.volmat@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-23_02,2022-07-21_02,2022-06-22_01
X-Mailman-Approved-At: Mon, 01 Aug 2022 11:53:41 +0000
Cc: devicetree@vger.kernel.org, mcoquelin.stm32@gmail.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 0/2] ARM: dts: stm32: add SPI on STM32MP13
	platform
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

This series adds DT entries related to all spi nodes for the
STM32MP13 platform.

v2: reorder all node properties, starting with compatible and reg

Alain Volmat (2):
  ARM: dts: stm32: add spi nodes into stm32mp131.dtsi
  ARM: dts: stm32: add pinctrl and disabled spi5 node in stm32mp135f-dk

 arch/arm/boot/dts/stm32mp13-pinctrl.dtsi | 23 ++++++++
 arch/arm/boot/dts/stm32mp131.dtsi        | 70 ++++++++++++++++++++++++
 arch/arm/boot/dts/stm32mp135f-dk.dts     |  7 +++
 3 files changed, 100 insertions(+)

-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
