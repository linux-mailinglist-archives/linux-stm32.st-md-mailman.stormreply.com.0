Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DDC54B57E
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Jun 2019 11:52:38 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 98B21C593DA
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Jun 2019 09:52:37 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E9177C593D8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Jun 2019 09:52:36 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5J9l43Y004729; Wed, 19 Jun 2019 11:52:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=nty6ih6iIW5KM2QvYy/1B11xGsZE8DkrKWnNc/nyI6g=;
 b=oBzmJN2JkzWIsWm32xd5oVFIvuGHnSMLHytkTJpZ/MVxjXnWr5pLpieutjXJYRJ7iARO
 V6kHtLJIePQvjfRjFbPizBRVYa9j6OLQP12Z/t4tJBueeer4DFqWyDLmOqq2VlttP8j+
 4iQC+TSjXH8rFVdjvzSMOMLrHf7y+QxS9/J/nCJH4G3e66tpgYdHZWJcH9+PJ8TR3yD1
 ec0HnBjyh1W++pyUnauzGvgLyTQzwxcKuhRE/vvft8u3rqlj4c9z/hw0lvwf/H5igyV+
 uAOs71CXbF1DIsJZzLrmdc95WVlH9XG5nXEw2AHdQudPqpFNTXALrcnK1rJORk+5WzuI Hg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2t7812u73c-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Wed, 19 Jun 2019 11:52:14 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BAE6F38;
 Wed, 19 Jun 2019 09:52:13 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag5node3.st.com [10.75.127.15])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 78AD524CC;
 Wed, 19 Jun 2019 09:52:13 +0000 (GMT)
Received: from localhost (10.75.127.44) by SFHDAG5NODE3.st.com (10.75.127.15)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Wed, 19 Jun 2019 11:52:13 +0200
From: Fabrice Gasnier <fabrice.gasnier@st.com>
To: <thierry.reding@gmail.com>, <robh+dt@kernel.org>, <alexandre.torgue@st.com>
Date: Wed, 19 Jun 2019 11:52:00 +0200
Message-ID: <1560937925-8990-1-git-send-email-fabrice.gasnier@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG7NODE1.st.com (10.75.127.19) To SFHDAG5NODE3.st.com
 (10.75.127.15)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-19_05:, , signatures=0
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, benjamin.gaignard@st.com,
 linux-pwm@vger.kernel.org, linux@armlinux.org.uk, linux-kernel@vger.kernel.org,
 mcoquelin.stm32@gmail.com, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 0/5] Add missing pwm-cells to STM32 timers PWM
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

This series adds missing generic 3-cells PWM to STM32 timers dt-bindings,
PWM driver, and the relevant dtsi files for STM32F4, STM32F7 and STM32MP1.

Fabrice Gasnier (5):
  dt-bindings: pwm-stm32: add #pwm-cells
  pwm: stm32: use 3 cells ->of_xlate()
  ARM: dts: stm32: add pwm cells to stm32mp157c
  ARM: dts: stm32: add pwm cells to stm32f429
  ARM: dts: stm32: add pwm cells to stm32f746

 Documentation/devicetree/bindings/pwm/pwm-stm32.txt |  3 +++
 arch/arm/boot/dts/stm32f429.dtsi                    | 12 ++++++++++++
 arch/arm/boot/dts/stm32f746.dtsi                    | 12 ++++++++++++
 arch/arm/boot/dts/stm32mp157c.dtsi                  | 12 ++++++++++++
 drivers/pwm/pwm-stm32.c                             |  2 ++
 5 files changed, 41 insertions(+)

-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
