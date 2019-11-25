Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 412AD108B98
	for <lists+linux-stm32@lfdr.de>; Mon, 25 Nov 2019 11:27:19 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 03E5EC36B0E;
	Mon, 25 Nov 2019 10:27:19 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 182E5C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Nov 2019 10:27:16 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAPAR8Jf008268; Mon, 25 Nov 2019 11:27:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=JQQc+TZBsDysMWIa2Q9eivvaXwP3EA8yawln7WVtzwo=;
 b=QAJLln2KJAVwx3plWGTXdhZfpOLmJfkuxW/s0PWJ7QPNTdeuXsrF3NzSCVuLIpicpw2p
 dgi38Bt3m05T3PBg+VGkz7Sj9ki6IB93UsVcaQm0nGV+4a2Di8YvowxaBqfr0l3glKt2
 fUrK2qx/eGIqMBUJ4Yw3wDg1hgm1XsTQ7fl3VLdcBqOs9qZfcwYRl+hka9Np2T4VFqF+
 A9Vqbzrj3/SvL5cXIkcZkD1iZvSrwUxZADmPhqJkvuGRntIGPFshbaJAUgSkVJFOwOR9
 fEyMNI4oX17iXab0LIdstPazMFWiSM0m94fiPt0p6YLsm2TAkcA1R2SiOnTHe9lwBkw3 uw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2weu428m9r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Nov 2019 11:27:11 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EDF08100034;
 Mon, 25 Nov 2019 11:27:10 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B86092B0115;
 Mon, 25 Nov 2019 11:27:10 +0100 (CET)
Received: from localhost (10.75.127.47) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 25 Nov 2019 11:27:10
 +0100
From: Amelie Delaunay <amelie.delaunay@st.com>
To: Minas Harutyunyan <hminas@synopsys.com>, Felipe Balbi <balbi@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
 <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Date: Mon, 25 Nov 2019 11:26:57 +0100
Message-ID: <20191125102659.22853-1-amelie.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG8NODE2.st.com (10.75.127.23) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-25_02:2019-11-21,2019-11-25 signatures=0
Cc: devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Fabrice Gasnier <fabrice.gasnier@st.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 0/2] USB DWC2 support for STM32MP15 SoCs USB
	OTG
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

Adds support for STM32MP15 SoCs USB OTG HS and FS based on DWC2 IP.

STM32MP15 SoCs embeds a DWC2 IP that can be used in HS or in FS, and
uses an external Vbus and ID level detection to support OTG operations.

Amelie Delaunay (2):
  dt-bindings: usb: dwc2: add support for STM32MP15 SoCs USB OTG HS and
    FS
  usb: dwc2: add support for STM32MP15 SoCs USB OTG HS and FS

 .../devicetree/bindings/usb/dwc2.txt          |  5 +
 drivers/usb/dwc2/core.h                       |  8 ++
 drivers/usb/dwc2/hw.h                         |  8 ++
 drivers/usb/dwc2/params.c                     | 33 +++++++
 drivers/usb/dwc2/platform.c                   | 94 ++++++++++++++++++-
 5 files changed, 146 insertions(+), 2 deletions(-)

-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
