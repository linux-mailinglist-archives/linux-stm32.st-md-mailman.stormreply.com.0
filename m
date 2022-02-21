Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B2204BD9F5
	for <lists+linux-stm32@lfdr.de>; Mon, 21 Feb 2022 14:38:16 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2CEF9C60473;
	Mon, 21 Feb 2022 13:38:16 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3D7C9C60463
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Feb 2022 13:38:15 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 21LCjG3k002334;
 Mon, 21 Feb 2022 14:37:55 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=98j3uGLmj33OK+/665DQtkEMyBwIaDlMKW+jkpdU1TM=;
 b=Vb/jqUnVGN3ob4XyHIF0tzlPrgVqEXNa4naZDcql/WKygA9XMVdlQnPNgU0OTjrK1OyE
 nUNgb5jBoDHIlx1PQH2d/B2AWVndyd2iw1NjyGAegLHClqNsg8TZBq9+J4ckisi+42Y9
 lbpjHChikaXXiL5FvdfXKTLwR5KdNhrDXx1ux4Cw5pnGGxA6uTZxuZxNwKMukz04Hv/D
 tSAp1U7VnnTBJCdyBremNgY/eSqSYzyzAg2L37qHDx9VtZ5II+/MZaE9Qqe49xFfYcnR
 NnkKvIlegA4QZPY/NwyMofmgCLEn4SvRaGOkxGtf8OdoHCC2a8E/M6agbxiSJIYEVW74 1Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ebsqxcdbp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Feb 2022 14:37:55 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9BBB010002A;
 Mon, 21 Feb 2022 14:37:53 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 902DB229A81;
 Mon, 21 Feb 2022 14:37:53 +0100 (CET)
Received: from localhost (10.75.127.48) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Mon, 21 Feb 2022 14:37:52
 +0100
From: Alexandre Torgue <alexandre.torgue@foss.st.com>
To: <arnd@arndb.de>, <robh+dt@kernel.org>
Date: Mon, 21 Feb 2022 14:37:48 +0100
Message-ID: <20220221133750.20297-1-alexandre.torgue@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-21_07,2022-02-21_01,2021-12-02_01
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Marcin Sloniewski <marcin.sloniewski@gmail.com>, jagan@amarulasolutions.com,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 0/2] ARM: dts: stm32: Correct masks for GIC
	PPI interrupts on stm32mp
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

Using GIC_CPU_MASK_SIMPLE(x), x should reflect the number of CPUs.

regards
alex

Alexandre Torgue (2):
  ARM: dts: stm32: Correct masks for GIC PPI interrupts on stm32mp13
  ARM: dts: stm32: Correct masks for GIC PPI interrupts on stm32mp15

 arch/arm/boot/dts/stm32mp131.dtsi | 8 ++++----
 arch/arm/boot/dts/stm32mp151.dtsi | 8 ++++----
 arch/arm/boot/dts/stm32mp153.dtsi | 7 +++++++
 3 files changed, 15 insertions(+), 8 deletions(-)

-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
