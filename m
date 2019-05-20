Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B692D23C06
	for <lists+linux-stm32@lfdr.de>; Mon, 20 May 2019 17:27:47 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 774C6C5E2D2
	for <lists+linux-stm32@lfdr.de>; Mon, 20 May 2019 15:27:47 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D2502C5E2CD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 May 2019 15:27:45 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4KFLead012608; Mon, 20 May 2019 17:27:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=STMicroelectronics;
 bh=g7uJcx07z3bWTIfepNMx6DxFWWSkzUQXRKhfA3a47Tg=;
 b=e7mQXsyF8vdXHzdtx+52HC8jYF7qyRlw4X0qOBaAESvHt3Ip+3aZ4o6/vHozSjFONiig
 NrqbVP1P/1cyyV73AkfgsiZKzboUTCelLytXlY004FdYABQ6fZw8TaunXLRPxcy0VxBV
 Ffe1ixxaBOaAjJFVsaxl3bncXihdMpAQU1Y2I02JEBVqcS7Rdx8lXxqsubiNx7gwtUFn
 Xc12mkPdLT9Scd43aV5XPFXMSr9IwrmNmuITQUmHFKiR4AYh5Fg9495Mg6c9hkcUW/SM
 Qi08taUsun2Ky+FqDp4+5mtWgSqHABgAc96SChYX7Hyp/I7W19FaAJlmy6+IHoWPWFml ow== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2sj7ttv8tn-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 20 May 2019 17:27:18 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1860734;
 Mon, 20 May 2019 15:27:15 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag5node1.st.com [10.75.127.13])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AEEE12BAC;
 Mon, 20 May 2019 15:27:15 +0000 (GMT)
Received: from SFHDAG5NODE1.st.com (10.75.127.13) by SFHDAG5NODE1.st.com
 (10.75.127.13) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 20 May
 2019 17:27:15 +0200
Received: from SFHDAG5NODE1.st.com ([fe80::cc53:528c:36c8:95f6]) by
 SFHDAG5NODE1.st.com ([fe80::cc53:528c:36c8:95f6%20]) with mapi id
 15.00.1347.000; Mon, 20 May 2019 17:27:15 +0200
From: Gerald BAEZA <gerald.baeza@st.com>
To: "will.deacon@arm.com" <will.deacon@arm.com>, "mark.rutland@arm.com"
 <mark.rutland@arm.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>, Alexandre TORGUE
 <alexandre.torgue@st.com>, "corbet@lwn.net" <corbet@lwn.net>,
 "linux@armlinux.org.uk" <linux@armlinux.org.uk>, "olof@lixom.net"
 <olof@lixom.net>,
 "horms+renesas@verge.net.au" <horms+renesas@verge.net.au>,
 "arnd@arndb.de" <arnd@arndb.de>
Thread-Topic: [PATCH v2 0/5] stm32-ddr-pmu driver creation
Thread-Index: AQHVDyCA+bIWujGZrUGYoRHYm+G4Sg==
Date: Mon, 20 May 2019 15:27:15 +0000
Message-ID: <1558366019-24214-1-git-send-email-gerald.baeza@st.com>
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
Subject: [Linux-stm32] [PATCH v2 0/5] stm32-ddr-pmu driver creation
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

The DDRPERFM is the DDR Performance Monitor embedded in STM32MP1 SOC.

This series adds support for the DDRPERFM via a new stm32-ddr-pmu driver,
registered into the perf framework.

This driver is inspired from arch/arm/mm/cache-l2x0-pmu.c

---
Changes from v1:
- add 'resets' description (bindings) and using (driver). Thanks Rob.
- rebase on 5.2-rc1 (that includes the ddrperfm clock control patch).

Gerald Baeza (5):
  Documentation: perf: stm32: ddrperfm support
  dt-bindings: perf: stm32: ddrperfm support
  perf: stm32: ddrperfm driver creation
  ARM: configs: enable STM32_DDR_PMU
  ARM: dts: stm32: add ddrperfm on stm32mp157c

 .../devicetree/bindings/perf/stm32-ddr-pmu.txt     |  20 +
 Documentation/perf/stm32-ddr-pmu.txt               |  41 ++
 arch/arm/boot/dts/stm32mp157c.dtsi                 |   9 +
 arch/arm/configs/multi_v7_defconfig                |   1 +
 drivers/perf/Kconfig                               |   6 +
 drivers/perf/Makefile                              |   1 +
 drivers/perf/stm32_ddr_pmu.c                       | 512 +++++++++++++++++++++
 7 files changed, 590 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/perf/stm32-ddr-pmu.txt
 create mode 100644 Documentation/perf/stm32-ddr-pmu.txt
 create mode 100644 drivers/perf/stm32_ddr_pmu.c

-- 
2.7.4
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
