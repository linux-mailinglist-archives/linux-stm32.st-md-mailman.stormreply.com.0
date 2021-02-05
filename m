Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB47310898
	for <lists+linux-stm32@lfdr.de>; Fri,  5 Feb 2021 10:59:38 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 709FAC57B5E;
	Fri,  5 Feb 2021 09:59:38 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E18F7C57B52
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Feb 2021 08:52:21 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1158l1WR007611; Fri, 5 Feb 2021 09:52:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=KoN+yQlvSs0QDXzP0LKAFNH9utHipTRcikoBgtIN8lo=;
 b=e8kOMd+kETgkqyl4sIq8whYdqEBEdZjz+AKVGKs7p6sxePii7iHgmhJU9fRmDfO/Nu9I
 zazUUpps4ATPiOwzDtfT4q+7RNWA5GgxErCU6rBzqQEMX29DCM2j68RoTh18Vngnz8wq
 Uwy+WDRKJFIKTcREj1SO3GlG91aC/9mpD+qVsnyDAtiqWYuxTIiL4lmN2MRGZ1ZAfZeS
 TcLkSbGV1FdyAIUtRjPkJaZfo6oqDu16lfN4ekzBu3O+m6Kjw+rty1mubjTUPV3DQgwq
 LwtJDsH4hnCpOqHYprvoNoRrw8Mr6SxtMZH+GekcDA4JUWaMhRQoPDCb+NtvLEZc9kXf QQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 36d0nse4kf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Feb 2021 09:52:06 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2BCCF10002A;
 Fri,  5 Feb 2021 09:52:06 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EC4A8221793;
 Fri,  5 Feb 2021 09:52:05 +0100 (CET)
Received: from localhost (10.75.127.45) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 5 Feb 2021 09:52:05
 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
To: <wsa@kernel.org>, <robh+dt@kernel.org>
Date: Fri, 5 Feb 2021 09:51:39 +0100
Message-ID: <1612515104-838-1-git-send-email-alain.volmat@foss.st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-05_06:2021-02-05,
 2021-02-05 signatures=0
X-Mailman-Approved-At: Fri, 05 Feb 2021 09:59:37 +0000
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alexandre.torgue@foss.st.com, linux-kernel@vger.kernel.org,
 pierre-yves.mordret@foss.st.com, linux-i2c@vger.kernel.org,
 mcoquelin.stm32@gmail.com, alain.volmat@foss.st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 0/5] i2c: stm32: filter binding support &
	debug info
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

This serie add support for the analog and digital filter binding
for the stm32f7 i2c driver.
An additional patch add also debug informations, displayed in case
of errors.

Alain Volmat (5):
  i2c: stm32f7: fix configuration of the digital filter
  i2c: stm32f7: support DT binding i2c-analog-filter
  i2c: stm32f7: add support for DNF i2c-digital-filter binding
  ARM: dts: stm32: enable the analog filter for all I2C nodes in
    stm32mp151
  i2c: stm32f7: indicate the address being accessed on errors

 arch/arm/boot/dts/stm32mp151.dtsi |  6 +++
 drivers/i2c/busses/i2c-stm32f7.c  | 63 ++++++++++++++++++++-----------
 2 files changed, 46 insertions(+), 23 deletions(-)
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
