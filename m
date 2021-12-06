Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8871446A038
	for <lists+linux-stm32@lfdr.de>; Mon,  6 Dec 2021 16:58:30 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3D331C5F1EA;
	Mon,  6 Dec 2021 15:58:30 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A7D61C5EC72
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 Dec 2021 15:58:28 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1B6AQR5W010379;
 Mon, 6 Dec 2021 16:58:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=6j4JfF7PbNsMncG3LrQqk6YgpvQ6hOU4ElFAtx3ffEM=;
 b=ZM9ZGLVdYE0/DUA5HJ3p9ahKRAbDyOel66t2LdNl1YNPuCcewhYtfNI4SLBXBZD5SyEB
 p/M5p7cOE8qadKdsur5r389hh/m0as+etEIVgkQjSvjIqVRciYXsvJQDsT1x4bwbzU5l
 YWhognaGjW22khtobrFlzCw83i5U9xcgB8pZG01Yyg3MUveK3DetQTnEEDE6PWVgMlcB
 Acpasp71la5dl8R2ZYJrGpB8gta4AnIFJ/041lvvNL0kkzpY+zynQbiKn2tvU/xxUKag
 FYon4hJx05n5GtaVL3Qfy7J3JT7VA9pnQtg2n4s7UzLnX11hcjs3l2mNeNVE2Zi4a43S 7w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3csb4j3dx1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Dec 2021 16:58:22 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2FA1510002A;
 Mon,  6 Dec 2021 16:58:21 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 23E6820930D;
 Mon,  6 Dec 2021 16:58:21 +0100 (CET)
Received: from localhost (10.75.127.49) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Mon, 6 Dec 2021 16:58:20
 +0100
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
To: <hminas@synopsys.com>, <gregkh@linuxfoundation.org>, <robh+dt@kernel.org>
Date: Mon, 6 Dec 2021 16:56:40 +0100
Message-ID: <1638806203-6624-1-git-send-email-fabrice.gasnier@foss.st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-06_05,2021-12-06_02,2021-12-02_01
Cc: devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, alexandre.torgue@foss.st.com,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 0/3] usb: dwc2: drd: add support for
	role-switch-default-mode
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

This series adds support for the role-switch-default-mode binding, to configure
the controller default mode, when the role is USB_ROLE_NONE.

This has been tested on STM32MP15 DK2 board, with:
 &usbotg_hs {
 	phys = <&usbphyc_port1 0>;
 	phy-names = "usb2-phy";
 	usb-role-switch;
 	dr_mode = "peripheral";
 	role-switch-default-mode = "peripheral";
 	status = "okay";
 }

Fabrice Gasnier (3):
  dt-bindings: usb: document role-switch-default-mode property in dwc2
  usb: dwc2: drd: add role-switch-default-node support
  usb: dwc2: drd: restore role and overrides upon resume

 Documentation/devicetree/bindings/usb/dwc2.yaml |  3 ++
 drivers/usb/dwc2/core.h                         |  3 ++
 drivers/usb/dwc2/drd.c                          | 51 ++++++++++++++++++++++++-
 drivers/usb/dwc2/platform.c                     | 10 +++--
 4 files changed, 61 insertions(+), 6 deletions(-)

-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
