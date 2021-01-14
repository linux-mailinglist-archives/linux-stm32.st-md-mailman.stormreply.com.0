Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 628222F61A6
	for <lists+linux-stm32@lfdr.de>; Thu, 14 Jan 2021 14:16:02 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 20772C56635;
	Thu, 14 Jan 2021 13:16:02 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BBAC6C36B37
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Jan 2021 13:15:59 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10ED2bID016430; Thu, 14 Jan 2021 14:15:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=dE1TUuVGYcUczJw86WcXEkSTgFgz2gMWVXOhCYrwAEI=;
 b=RbbyH+XiQ4AzI0iJTjK5eW7p8vXySbcEHv/xolEjuXRU4qhWE9JYuCGC8qF8yEYOL9kn
 BXn52AAL6GHwgTGCsADaLbXN1xa3DtkLxWRFZ4dXfoKwCWelyavR8Wrhv5BC0FeUz96T
 6iib/LCmHEz8pBQ3PqY+LA0zXr2Qs4Rz34QCh5ZO2hzaROnVvBFlNAnV5wWOErgjg8g5
 oaT3C8ZPGcqByR1blrhiBIvdNBm+UXuv3NeY7faQpcFcpTr9qFFwajp1U1zU35w5UgRo
 NJZ4ZsnHDxQb4ISR71+6KyBtZoLSVqfqac6EKW7NduJhb+C84MHl/eb4ePua2iQzjeDO ww== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 35y5kywwmv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Jan 2021 14:15:49 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A31A110002A;
 Thu, 14 Jan 2021 14:15:48 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 92770246DB4;
 Thu, 14 Jan 2021 14:15:48 +0100 (CET)
Received: from localhost (10.75.127.45) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 14 Jan 2021 14:15:48
 +0100
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Rob Herring <robh+dt@kernel.org>
Date: Thu, 14 Jan 2021 14:15:21 +0100
Message-ID: <20210114131524.3298-1-amelie.delaunay@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-14_04:2021-01-14,
 2021-01-14 signatures=0
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH v2 0/3] ARM: stm32: USBPHYC updates on
	stm32mp15
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

This series updates usbphyc parent and child nodes to follow latest DT
bindings.

---
Changes in v2:
- squash all DT board patches in one patch
- update also non-ST DT

Amelie Delaunay (3):
  ARM: dts: stm32: add usbphyc vdda1v1 and vdda1v8 supplies on
    stm32mp151
  ARM: dts: stm32: remove usbphyc ports vdda1v1 & vdda1v8 on stm32mp15
    boards
  ARM: dts: stm32: add #clock-cells property to usbphyc node on
    stm32mp151

 arch/arm/boot/dts/stm32mp151.dtsi                  | 3 +++
 arch/arm/boot/dts/stm32mp157a-stinger96.dtsi       | 4 ----
 arch/arm/boot/dts/stm32mp157c-ed1.dts              | 4 ----
 arch/arm/boot/dts/stm32mp15xx-dhcom-drc02.dtsi     | 2 --
 arch/arm/boot/dts/stm32mp15xx-dhcom-pdk2.dtsi      | 4 ----
 arch/arm/boot/dts/stm32mp15xx-dhcom-picoitx.dtsi   | 4 ----
 arch/arm/boot/dts/stm32mp15xx-dhcor-avenger96.dtsi | 4 ----
 arch/arm/boot/dts/stm32mp15xx-dkx.dtsi             | 4 ----
 8 files changed, 3 insertions(+), 26 deletions(-)

-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
