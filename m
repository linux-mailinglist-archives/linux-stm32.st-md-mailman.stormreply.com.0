Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B3AFEFDAE
	for <lists+linux-stm32@lfdr.de>; Tue,  5 Nov 2019 13:52:45 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EE494C36B0B;
	Tue,  5 Nov 2019 12:52:44 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5C932C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 Nov 2019 12:52:44 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xA5Cq6Ga024537; Tue, 5 Nov 2019 13:52:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=EX94p2HyA3Y7EyZnwdjULwer7EInjO1VlhUrZLUYn9g=;
 b=IyYB0QNUCyGMqFUhUJSjt7NG3fgwbPN21qY0Oy6tt8zA3hfrybP5wllZb6mEOF3mSJd7
 aF9YJSwFasM+m2eWuQytRyTUxjLvrvbR/UiWMrksTlz62xSgb5Zya+wYHia/xro7CtuI
 jJTk5jA1pRZWTTA4bDNW1YFX2CVgWCPYppNPCK3gkwBlpVOBOwB2gGBioemzZf+yRqTQ
 EkfChjuJNM+w6EaGYEmeHLxV9DylEQ/St96V9hmZGAikB3zqUUk0CnsavwhZmjY/HpbF
 4IyAS7A13l/kMJETjG/VnqsS2e3Z/43iqeTeCvLJsII+h1jXLjQfbBNOcBohEQTi89SM sA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2w0ytcr0bd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 Nov 2019 13:52:34 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A9B3510002A;
 Tue,  5 Nov 2019 13:52:33 +0100 (CET)
Received: from Webmail-eu.st.com (Safex1hubcas21.st.com [10.75.90.44])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 942672BC5E5;
 Tue,  5 Nov 2019 13:52:33 +0100 (CET)
Received: from SAFEX1HUBCAS23.st.com (10.75.90.46) by SAFEX1HUBCAS21.st.com
 (10.75.90.44) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 5 Nov 2019
 13:52:33 +0100
Received: from localhost (10.48.0.192) by webmail-ga.st.com (10.75.90.48) with
 Microsoft SMTP Server (TLS) id 14.3.439.0;
 Tue, 5 Nov 2019 13:52:32 +0100
From: Fabrice Gasnier <fabrice.gasnier@st.com>
To: <alexandre.torgue@st.com>
Date: Tue, 5 Nov 2019 13:52:17 +0100
Message-ID: <1572958341-12404-1-git-send-email-fabrice.gasnier@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.48.0.192]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-11-05_04:2019-11-05,2019-11-05 signatures=0
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, mcoquelin.stm32@gmail.com,
 fabrice.gasnier@st.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 0/4] Update PWM support on stm32mp157 boards
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

This series update PWM support on stm32mp157c-ev1 and stm32mp157a-dk1
boards, e.g. add pinmuxing and use them in board device-tree.
- Add PWM sleep pins that can be used on stm32mp157c-ev1 board
- Add PWM pins that can be used on stm32mp157a-dk1 board
- Add PWM pinctrl sleep state on stm32mp157c-ev1 board
- Add PWM support on stm32mp157a-dk1 board

Fabrice Gasnier (4):
  ARM: dts: stm32: add pwm sleep pin muxing for stm32mp157c-ed1
  ARM: dts: stm32: add pwm pin muxing for stm32mp157a-dk1
  ARM: dts: stm32: add pwm sleep pins to stm32mp157c-ev1
  ARM: dts: stm32: add support for PWM on stm32mp157a-dk1

 arch/arm/boot/dts/stm32mp157-pinctrl.dtsi | 99 +++++++++++++++++++++++++++++++
 arch/arm/boot/dts/stm32mp157a-dk1.dts     | 85 ++++++++++++++++++++++++++
 arch/arm/boot/dts/stm32mp157c-ev1.dts     |  9 ++-
 3 files changed, 190 insertions(+), 3 deletions(-)

-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
