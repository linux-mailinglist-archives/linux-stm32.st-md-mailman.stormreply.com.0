Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 068ECB21FE
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Sep 2019 16:35:13 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BEE49C35E04;
	Fri, 13 Sep 2019 14:35:12 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B9DBBC36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Sep 2019 14:35:10 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x8DEV1EQ017893; Fri, 13 Sep 2019 16:35:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=WcH/XeLRXrchzGM2oayh6FpZp9ixOv6Rjd72cfZUEDM=;
 b=dEdNnG1PFncizfoScByurpL+4XLDP78kKGX2VXj5XAwHuJItlL96iVQhZhLXsannVizP
 tyFEJpueQyblheGUGcSM8Xr7yB85XlCUlg0uoJJAH05Cprzm2aOZ3fy2ENaR7uNxtzx9
 sbxpyCI0T0CMVizoc1HWiw0SqH/yvCGXukCoFA/PgrZbxZNm0v32vUEU9HidLEhHLryD
 Ur3ghBBLiZCPpay1hXWNRI26JRn/GmWqqvsBWGRLzmUO0Bs0jt/nA1/5iF5+MKdQhBYx
 INkWAyqKg11YTeFrkP4ux+w/Mvpzg2/dIjAIY65SGCQq0HjT/3aUm+D9efC8t0neqqF3 pg== 
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx08-00178001.pphosted.com with ESMTP id 2uytdx5n81-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 13 Sep 2019 16:35:01 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 2581F4B;
 Fri, 13 Sep 2019 14:34:57 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas24.st.com [10.75.90.94])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3853E2C86AE;
 Fri, 13 Sep 2019 16:34:57 +0200 (CEST)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.92) by Safex1hubcas24.st.com
 (10.75.90.94) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 13 Sep
 2019 16:34:57 +0200
Received: from localhost (10.48.1.232) by Webmail-ga.st.com (10.75.90.48) with
 Microsoft SMTP Server (TLS) id 14.3.439.0;
 Fri, 13 Sep 2019 16:34:56 +0200
From: Fabrice Gasnier <fabrice.gasnier@st.com>
To: <alexandre.torgue@st.com>
Date: Fri, 13 Sep 2019 16:34:37 +0200
Message-ID: <1568385280-2633-1-git-send-email-fabrice.gasnier@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.48.1.232]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.70,1.0.8
 definitions=2019-09-13_07:2019-09-11,2019-09-13 signatures=0
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, mcoquelin.stm32@gmail.com,
 fabrice.gasnier@st.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 0/3] Add support for ADC on stm32mp157a-dk1
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

This series adds support for ADC on stm32mp157a-dk1 board:
- enable vrefbuf regulator used as reference voltage
- define ADC pins for AIN connector and USB Type-C CC pins
- configure ADC1 and ADC2 to use these

Fabrice Gasnier (3):
  ARM: dts: stm32: Enable VREFBUF on stm32mp157a-dk1
  ARM: dts: stm32: add ADC pins used on stm32mp157a-dk1
  ARM: dts: stm32: enable ADC support on stm32mp157a-dk1

 arch/arm/boot/dts/stm32mp157-pinctrl.dtsi | 16 +++++++++++++++
 arch/arm/boot/dts/stm32mp157a-dk1.dts     | 34 +++++++++++++++++++++++++++++++
 2 files changed, 50 insertions(+)

-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
