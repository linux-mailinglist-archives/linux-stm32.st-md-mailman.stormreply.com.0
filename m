Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C0285535FB
	for <lists+linux-stm32@lfdr.de>; Tue, 21 Jun 2022 17:24:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 07ADDC5F1F0;
	Tue, 21 Jun 2022 15:24:58 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A0613C5F1EE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Jun 2022 15:24:56 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25LCQIIO032482;
 Tue, 21 Jun 2022 17:24:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=1DjHc8YrbaZYa2K0821Lb5I79I/6OnNRBe5v5W+s1JU=;
 b=Pq2DYeD/8pUdcymCVVOeGSCBbH1/E4xbkBFva0+FbL8lZo1k/0Q14hP4PHN7gtAnbt+J
 op+pEHSTIcNhbKzPvtCyp1yEqjJRNEPlnY9g4tkF3Ezr/iavQT/pQy7IEjSBlzSMc/Xh
 rYNMAsd5e82qL3fbIKld2Nyelu3I0Wz24gNLEgGtMb5YVIUgQcZLciZBGQ4RFu+ZzKsm
 8gFNK67iBklzO9x+UYcy/bMYz1eoZt4f1ihdD2bibq8ox3UPlJeusxd3W0mpHUboZk/S
 AyQKp/E1yyfWYkmGuNMc1KcF/IW2DjaVFSqqiuH763Sn1wrPm0sD+akLy8F0lfh4kStL yg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3gu9vcjtxx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Jun 2022 17:24:37 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 95E70100034;
 Tue, 21 Jun 2022 17:24:36 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8FB2722ECD8;
 Tue, 21 Jun 2022 17:24:36 +0200 (CEST)
Received: from localhost (10.75.127.50) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Tue, 21 Jun
 2022 17:24:34 +0200
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
To: <hminas@synopsys.com>, <gregkh@linuxfoundation.org>, <robh+dt@kernel.org>
Date: Tue, 21 Jun 2022 17:23:46 +0200
Message-ID: <20220621152350.145745-1-fabrice.gasnier@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-21_08,2022-06-21_01,2022-02-23_01
Cc: devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, stern@rowland.harvard.edu,
 krzysztof.kozlowski+dt@linaro.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 0/4] usb: host: add TPL support to ehci
	ohci and dwc2
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

The Target Peripheral List (TPL) support is used to identify targeted
devices during Embedded Host (EH) compliance testing. Add TPL support
setting from device tree on ehci-platform, ohci-platform and dwc2 drivers.
Also document TPL support in DWC2 dt-bindings.

Changes in v2:
- Document TPL support in DWC2 dt-bindings
- Spell TPL and EH
- Add collected ack

Amelie Delaunay (3):
  usb: host: ohci-platform: add TPL support
  usb: host: ehci-platform: add TPL support
  usb: dwc2: host: add TPL support

Fabrice Gasnier (1):
  dt-bindings: usb: dwc2: document TPL support

 Documentation/devicetree/bindings/usb/dwc2.yaml | 3 +++
 drivers/usb/dwc2/hcd.c                          | 3 +++
 drivers/usb/host/ehci-platform.c                | 2 ++
 drivers/usb/host/ohci-platform.c                | 3 +++
 4 files changed, 11 insertions(+)

-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
