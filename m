Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB32580E8A
	for <lists+linux-stm32@lfdr.de>; Tue, 26 Jul 2022 10:08:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C6656C640F4;
	Tue, 26 Jul 2022 08:08:00 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8B510C035BE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Jul 2022 08:07:58 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26Q6Zgok008998;
 Tue, 26 Jul 2022 10:07:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=HVvobxygxJWw+3L3+H2mjH9wVwihqtM6fjUpIWckSr0=;
 b=0eOSvSD6ZebQSx5nuxxu2Cd4cqj9q4mxGTMdkLuLCclGcNRaBRSUdr43ifPf4PGk/8+d
 +JOtYZzj+J9gwlpDceC8PvPisoPpJBw/RSeb3k8l2Qcc/1N6PFLuMJ9KKgQaLnYG6q/T
 /fc2cxrUZjbUQCFKP3D4+1KPqZj/gRTrz2rL6bhQCGVKpts6Sdg0kB66XCmHApIo6rR/
 PCaDdu/gpUtQIdH9f/ub85PFjrGyYR0kX9wbM79/6EU19mw2heOSA6PNQdTxWVlrYj8R
 q32Rj3r7UfP7NrWkShitdpwASfYEoCkQXeuNVFzLC7PsePsGM0WYuwh4CIRSNlv/vmid 3g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3hg7vhen7f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Jul 2022 10:07:33 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8ED1610002A;
 Tue, 26 Jul 2022 10:07:30 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C55412128A3;
 Tue, 26 Jul 2022 10:07:30 +0200 (CEST)
Received: from localhost (10.75.127.47) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Tue, 26 Jul
 2022 10:07:29 +0200
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
To: <gregkh@linuxfoundation.org>, <robh+dt@kernel.org>, <mka@chromium.org>,
 <alexandre.torgue@foss.st.com>
Date: Tue, 26 Jul 2022 10:07:04 +0200
Message-ID: <20220726080708.162547-1-fabrice.gasnier@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-26_02,2022-07-25_03,2022-06-22_01
Cc: devicetree@vger.kernel.org, arnd@arndb.de, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 0/4] usb: misc: adopt onboard hub support
	on stm32mp1 boards
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

Add support for USB2514B HUB found on stm32mp1 boards:
- Extend the ehci-generic dt-binding to fully use the usb-hcd.yaml, and so
  the usb-device.yaml.
- Add usb-device compatible ("usbVID,PID") for the USB2514B USB2.0 HUB to
  the onboard_usb_hub driver.
- Add relevant device tree node to stm32mp15 DK boards.
- Enable the onboard_usb_hub driver on multi_v7 platforms.

Changes in v2:
- Follow Matthias review comments
- dt-bindings reviewed by Rob

Fabrice Gasnier (4):
  dt-bindings: usb: generic-ehci: allow usb-hcd schema properties
  usb: misc: onboard-hub: add support for Microchip USB2514B USB 2.0 hub
  ARM: dts: stm32: add support for USB2514B onboard hub on
    stm32mp15xx-dkx
  ARM: multi_v7_defconfig: enable USB onboard HUB driver

 Documentation/devicetree/bindings/usb/generic-ehci.yaml | 7 +------
 arch/arm/boot/dts/stm32mp15xx-dkx.dtsi                  | 8 ++++++++
 arch/arm/configs/multi_v7_defconfig                     | 1 +
 drivers/usb/misc/onboard_usb_hub.c                      | 2 ++
 drivers/usb/misc/onboard_usb_hub.h                      | 1 +
 5 files changed, 13 insertions(+), 6 deletions(-)

-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
