Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F3123C04
	for <lists+linux-stm32@lfdr.de>; Mon, 20 May 2019 17:27:47 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 61185C5E2CE
	for <lists+linux-stm32@lfdr.de>; Mon, 20 May 2019 15:27:47 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 93AA4C5E2CC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 May 2019 15:27:44 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4KFM4a9003544; Mon, 20 May 2019 17:27:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=U2Xk/tSGjSdT7ACCOz9neNN8wNEdQxVmj3R4DrYe6zY=;
 b=q4IlvcAzVtwOzwPjvWbTHC37IRm3pJs47Hz65n3iAeuDTMalPwfXNikzCODzQbsmemcg
 F+oK4TNEe1i0vQ8r5w2xZrufz+KxTmWpSnkwHgawMW020IbQ2+1JqZOSGYHip4QJvZam
 5Ghe9tqpEzhlAjfF23tgBZbhD/NbBRXY+I28pU9ZhU2QC7Cbc0HaKOn1sd3VqniLjw0D
 olGetIoUcWKZzhv/u6P0YdmcLHqWgdc/zZiz0DTv+tY1r4RQVfe7/Uiuv1LQ+yDCcPnh
 jw51izDvusGXOztwtC227PQmosTJa/aD7xJA8DRpcDEW1kz5ceMRk2aPRgRyW8SkbwAV EA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2sj773vj63-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 20 May 2019 17:27:19 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A439034;
 Mon, 20 May 2019 15:27:18 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag5node2.st.com [10.75.127.14])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 73CBA2BAD;
 Mon, 20 May 2019 15:27:18 +0000 (GMT)
Received: from SFHDAG5NODE1.st.com (10.75.127.13) by SFHDAG5NODE2.st.com
 (10.75.127.14) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 20 May
 2019 17:27:18 +0200
Received: from SFHDAG5NODE1.st.com ([fe80::cc53:528c:36c8:95f6]) by
 SFHDAG5NODE1.st.com ([fe80::cc53:528c:36c8:95f6%20]) with mapi id
 15.00.1347.000; Mon, 20 May 2019 17:27:17 +0200
From: Gerald BAEZA <gerald.baeza@st.com>
To: "will.deacon@arm.com" <will.deacon@arm.com>, "mark.rutland@arm.com"
 <mark.rutland@arm.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>, Alexandre TORGUE
 <alexandre.torgue@st.com>, "corbet@lwn.net" <corbet@lwn.net>,
 "linux@armlinux.org.uk" <linux@armlinux.org.uk>, "olof@lixom.net"
 <olof@lixom.net>,
 "horms+renesas@verge.net.au" <horms+renesas@verge.net.au>,
 "arnd@arndb.de" <arnd@arndb.de>
Thread-Topic: [PATCH v2 4/5] ARM: configs: enable STM32_DDR_PMU
Thread-Index: AQHVDyCC+z9rDopJM0iiSqzcMwe2cA==
Date: Mon, 20 May 2019 15:27:17 +0000
Message-ID: <1558366019-24214-5-git-send-email-gerald.baeza@st.com>
References: <1558366019-24214-1-git-send-email-gerald.baeza@st.com>
In-Reply-To: <1558366019-24214-1-git-send-email-gerald.baeza@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.45]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-20_07:, , signatures=0
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Gerald BAEZA <gerald.baeza@st.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: [Linux-stm32] [PATCH v2 4/5] ARM: configs: enable STM32_DDR_PMU
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

STM32_DDR_PMU enables the perf driver that
controls the DDR Performance Monitor (DDRPERFM)

Signed-off-by: Gerald Baeza <gerald.baeza@st.com>
---
 arch/arm/configs/multi_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 6b748f2..059b1b9 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -1009,6 +1009,7 @@ CONFIG_PHY_DM816X_USB=m
 CONFIG_OMAP_USB2=y
 CONFIG_TI_PIPE3=y
 CONFIG_TWL4030_USB=m
+CONFIG_STM32_DDR_PMU=m
 CONFIG_MESON_MX_EFUSE=m
 CONFIG_ROCKCHIP_EFUSE=m
 CONFIG_NVMEM_IMX_OCOTP=y
-- 
2.7.4
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
