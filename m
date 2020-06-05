Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C524B1EF324
	for <lists+linux-stm32@lfdr.de>; Fri,  5 Jun 2020 10:34:16 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 865ADC36B23;
	Fri,  5 Jun 2020 08:34:16 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 302A8C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Jun 2020 08:34:13 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0558WZDe029739; Fri, 5 Jun 2020 10:33:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=N34mf34zyNH9z+LguQ97xJdxyRAZPkEJBPLArQ3FE8Y=;
 b=ffT9jAG9sz9w3RTPQOMBMJyZbOlubEeufw8LbrMAnJ5vJaAuJOlvdx/JtIxBgAnSMaC/
 7huB9zhrmhe6gZHQQCuaBk3OlXibba5KtGWHE9cqS0JVfEmEUUqXM0F4xFVj8qGWGRQG
 O04XeLP/wajHH2+KW7VSPRb8emz/DyeI6bXxFc6sT9EUxDngXcDs2cs4ioVetA6U7FIq
 L4Rk9B02UPDYy5aoSAqflFSuRl6tjmeEr652yaDTjxsd296oQtnj9UEc8bobUlKrYYln
 /jz/aSKyQAzi9eiT4n0GuMEhSnUO+ZueD9YtntUTgftw/UPE44V+g+IvHqQicKh6Zn4y 5w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31fasma4f3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Jun 2020 10:33:54 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2DA55100038;
 Fri,  5 Jun 2020 10:33:51 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1E3F92B21C1;
 Fri,  5 Jun 2020 10:33:51 +0200 (CEST)
Received: from localhost (10.75.127.46) by SFHDAG3NODE3.st.com (10.75.127.9)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 5 Jun 2020 10:33:50
 +0200
From: Benjamin Gaignard <benjamin.gaignard@st.com>
To: <robh+dt@kernel.org>, <mcoquelin.stm32@gmail.com>,
 <alexandre.torgue@st.com>, <linus.walleij@linaro.org>,
 <gregkh@linuxfoundation.org>
Date: Fri, 5 Jun 2020 10:33:43 +0200
Message-ID: <20200605083348.13880-1-benjamin.gaignard@st.com>
X-Mailer: git-send-email 2.15.0
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG5NODE3.st.com (10.75.127.15) To SFHDAG3NODE3.st.com
 (10.75.127.9)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-05_01:2020-06-04,
 2020-06-05 signatures=0
Cc: tomase@xilinx.com, linux-kernel@vger.kernel.org,
 stefano.stabellini@xilinx.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v4 0/5] STM32 ETZPC bus controller
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

STM32 Extended TrustZone Protection controller act like a firewall on the
platform bus. Depending of its configuration devices could be accessible
by the TrustZone, the co-processor or the non-secure world. ETZPC
configuration could evolve at runtime for example to switch a device from
non-secure world to co-processor.

The series introduce 'firewall' helpers to handle the new devices-tree
properties. These properties are not dedicated to ETZPC and will be reused
for STM32 next generation of bus controller.

version 4:
- use bus API

version 3:
- add description in firewall consumer bindings
- add Linus reviewed-by tag

version 2:
- fix unit name into st,stm32-etzpc.yaml example and DT


Benjamin Gaignard (5):
  dt-bindings: bus: Add firewall bindings
  bus: stm32: Introduce firewall controller helpers
  dt-bindings: bus: Add STM32 ETZPC firewall controller
  bus: stm32: Add stm32 ETZPC firewall bus controller
  ARM: dts: stm32: Use ETZPC firewall bus

 .../bindings/bus/stm32/firewall-consumer.yaml      |  36 +++
 .../bindings/bus/stm32/firewall-provider.yaml      |  18 ++
 .../bindings/bus/stm32/st,stm32-etzpc.yaml         |  46 ++++
 arch/arm/boot/dts/stm32mp151.dtsi                  |   7 +-
 drivers/bus/Kconfig                                |   2 +
 drivers/bus/Makefile                               |   2 +
 drivers/bus/stm32/Kconfig                          |  11 +
 drivers/bus/stm32/Makefile                         |   2 +
 drivers/bus/stm32/firewall.c                       | 251 +++++++++++++++++++++
 drivers/bus/stm32/firewall.h                       |  66 ++++++
 drivers/bus/stm32/stm32-etzpc.c                    | 163 +++++++++++++
 include/dt-bindings/bus/stm32/stm32-etzpc.h        |  90 ++++++++
 12 files changed, 692 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/bus/stm32/firewall-consumer.yaml
 create mode 100644 Documentation/devicetree/bindings/bus/stm32/firewall-provider.yaml
 create mode 100644 Documentation/devicetree/bindings/bus/stm32/st,stm32-etzpc.yaml
 create mode 100644 drivers/bus/stm32/Kconfig
 create mode 100644 drivers/bus/stm32/Makefile
 create mode 100644 drivers/bus/stm32/firewall.c
 create mode 100644 drivers/bus/stm32/firewall.h
 create mode 100644 drivers/bus/stm32/stm32-etzpc.c
 create mode 100644 include/dt-bindings/bus/stm32/stm32-etzpc.h

-- 
2.15.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
