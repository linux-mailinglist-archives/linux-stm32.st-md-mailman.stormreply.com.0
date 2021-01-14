Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 038FB2F66ED
	for <lists+linux-stm32@lfdr.de>; Thu, 14 Jan 2021 18:13:34 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B63E6C5717E;
	Thu, 14 Jan 2021 17:13:33 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B5D38C56630
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Jan 2021 17:13:31 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10EHCP6A025352; Thu, 14 Jan 2021 18:13:24 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=3qm5+ziSJmOx60P4m0eCmCjt/SRkufZ9u7tOF+OzpGc=;
 b=QS8+DVA1UI0OfflSboIBC5zAGrq7n+iPMlJ4hTrnz6ezfS77erVKwaAv5mJh9S9D7xcV
 yTBIlFPED5r6H8WJ2ekdMGQzbRr+Dikydbi8xGMDY2xXUgmeOQXuXD9seKIFk+5/LW7A
 eiGoBjCZsOyEgTFj4OJ3ReuNkBxa51OJtmSQ9BTJtFbboPoTCFHSgcxSKHyX17KFVEFu
 tzIFDR0gW7kPirKXNANfXtwvoflgUf9unNM/Cxjtn52263tiZk+tEfpIGP9xn/L0v/oW
 OUQKUIFbfIk5/u0bUZ4vIgQRtWVAClfXdZqsN7CuqP27FPcPZXoRMYSXs6sOBjCGHJgF bA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 362379ettw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Jan 2021 18:13:24 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0765F10002A;
 Thu, 14 Jan 2021 18:13:24 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EA38D25D03A;
 Thu, 14 Jan 2021 18:13:23 +0100 (CET)
Received: from localhost (10.75.127.47) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 14 Jan 2021 18:13:23
 +0100
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
To: Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>, Rob
 Herring <robh+dt@kernel.org>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Thu, 14 Jan 2021 18:13:12 +0100
Message-ID: <20210114171314.18946-1-amelie.delaunay@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-14_06:2021-01-14,
 2021-01-14 signatures=0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v2 0/2] STM32 USBPHYC ck_usbo_48m clock
	provider
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

STM32 USBPHYC provides clocks to STM32 RCC pour STM32 USB controllers.
Specifically, ck_usbo_48m is a possible clock parent for USB OTG clock,
during OTG Full-Speed operation.

This series registers the usbphyc as clock provider of this ck_usbo_48m clock.

---
Changes in v2:
- fix COMMON_CLK dependency issue reported by kernel test robot
---
Amelie Delaunay (2):
  dt-bindings: phy: phy-stm32-usbphyc: add #clock-cells required
    property
  phy: stm32: register usbphyc as clock provider of ck_usbo_48m clock

 .../bindings/phy/phy-stm32-usbphyc.yaml       |  6 ++
 drivers/phy/st/Kconfig                        |  1 +
 drivers/phy/st/phy-stm32-usbphyc.c            | 66 +++++++++++++++++++
 3 files changed, 73 insertions(+)

-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
