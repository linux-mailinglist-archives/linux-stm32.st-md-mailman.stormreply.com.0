Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 62651F5146
	for <lists+linux-stm32@lfdr.de>; Fri,  8 Nov 2019 17:38:00 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 24A21C36B0E;
	Fri,  8 Nov 2019 16:38:00 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C2C2CC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 Nov 2019 16:37:58 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xA8GMQZi012507; Fri, 8 Nov 2019 17:37:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=9lW6n8rFOgqzJMfjsHiMgS0ryYK11DszppfOslpW2ug=;
 b=WWtCrMZiAzJ2PyStqJMJLmZU7b3AE3X1w3ARQJit4KN+/jMv6n6FVrWM2H7SLocRuyF9
 xTAKZUhKLseSHeQKrflhFXi+TTMPb/3vWnNm7mu/65LZmB5m4sgaGxg3mq2OlFjXvkC1
 kmS19lSHSBpSU/W6OB0gbbNBINzPA6OBFtNcBp2jGRkLRMeF6vW2aLeK9Hm8C4PACsN2
 NaV+Io86QC3FPiE0EzWvM5O0QJ3EfRyYBSUKjeefOOsOxBkYcx/90uOVCs8JwZ5VXrHH
 OaL3WA3udoxxzLTabKflxRFBiwtbIylvgAaP8VZPU1LZnW5ncE/lSvQbpztxDaC2de3p Hg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2w41vh4nuk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Nov 2019 17:37:47 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1302710002A;
 Fri,  8 Nov 2019 17:37:46 +0100 (CET)
Received: from Webmail-eu.st.com (Safex1hubcas22.st.com [10.75.90.92])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D804E2C38AC;
 Fri,  8 Nov 2019 17:37:46 +0100 (CET)
Received: from SAFEX1HUBCAS23.st.com (10.75.90.46) by Safex1hubcas22.st.com
 (10.75.90.92) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 8 Nov 2019
 17:37:46 +0100
Received: from localhost (10.48.0.192) by webmail-ga.st.com (10.75.90.48) with
 Microsoft SMTP Server (TLS) id 14.3.439.0;
 Fri, 8 Nov 2019 17:37:46 +0100
From: Fabrice Gasnier <fabrice.gasnier@st.com>
To: <alexandre.torgue@st.com>
Date: Fri, 8 Nov 2019 17:37:37 +0100
Message-ID: <1573231059-395-1-git-send-email-fabrice.gasnier@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.48.0.192]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-08_05:2019-11-08,2019-11-08 signatures=0
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, mcoquelin.stm32@gmail.com,
 fabrice.gasnier@st.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 0/2] Add support for ADC on stm32mp157c-ed1
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

This series adds support for digital-to-analog converter on
stm32mp157c-ed1 board:
- define pins that can be used for ADC
- configure ADC channels to use these

Fabrice Gasnier (2):
  ARM: dts: stm32: add ADC pins used for stm32mp157c-ed1
  ARM: dts: stm32: add ADC support to stm32mp157c-ed1

 arch/arm/boot/dts/stm32mp157-pinctrl.dtsi |  6 ++++++
 arch/arm/boot/dts/stm32mp157c-ed1.dts     | 16 ++++++++++++++++
 2 files changed, 22 insertions(+)

-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
