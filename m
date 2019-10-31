Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB3EEB03C
	for <lists+linux-stm32@lfdr.de>; Thu, 31 Oct 2019 13:31:17 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 82E77C36B14;
	Thu, 31 Oct 2019 12:31:16 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D11B4C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 31 Oct 2019 12:31:14 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x9VCQaIl028820; Thu, 31 Oct 2019 13:30:50 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=L36yhhdynvYVY+TShwfA0Bhl1r4mffURb+EBrQF9gKk=;
 b=hZwNCeV0xEvhrGeulpsouJPO18vN4wZjzkNBh2T0NPOiJrfZJSXxflA/SpZVj8QjZTrp
 6ll8NBUTTZtsi6cCL2RFUN4M/tMFU9hBxf8Sg76ZsvbB/cf5QJHnTZ84EJD/1reV24Au
 kToKzeMtDgAfdV5iMrvyV/hXCmx8kTfkOA1G6trbZ75TeLNtTXTBTenqIk0oPuNC1GXb
 SkZTjuSDvD9vCFuc0zoXr4SnxiyAi3Vvz9jIbMLOvOfJw6A+9hepDA7tTKxnkBxrLOi4
 X0zTv7LHQk8uWTPL3x/1nRlRVI4FnGG6DIhJ+En2Ba9BD4opWcvdFQ6c0DgjIaTEgdcw wg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2vxwhusser-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 31 Oct 2019 13:30:50 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7F52D10002A;
 Thu, 31 Oct 2019 13:30:49 +0100 (CET)
Received: from Webmail-eu.st.com (Safex1hubcas23.st.com [10.75.90.46])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5EFBD2B7837;
 Thu, 31 Oct 2019 13:30:49 +0100 (CET)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by SAFEX1HUBCAS23.st.com
 (10.75.90.46) with Microsoft SMTP Server (TLS) id 14.3.439.0; Thu, 31 Oct
 2019 13:30:49 +0100
Received: from localhost (10.201.20.122) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Thu, 31 Oct 2019 13:30:48
 +0100
From: Benjamin Gaignard <benjamin.gaignard@st.com>
To: <robh+dt@kernel.org>, <mark.rutland@arm.com>, <alexandre.torgue@st.com>,
 <fabrice.gasnier@st.com>, <jic23@kernel.org>, <knaack.h@gmx.de>,
 <lars@metafoo.de>, <pmeerw@pmeerw.net>, <lee.jones@linaro.org>,
 <thierry.reding@gmail.com>, <u.kleine-koenig@pengutronix.de>,
 <benjamin.gaignard@st.com>
Date: Thu, 31 Oct 2019 13:30:36 +0100
Message-ID: <20191031123040.26316-1-benjamin.gaignard@st.com>
X-Mailer: git-send-email 2.15.0
MIME-Version: 1.0
X-Originating-IP: [10.201.20.122]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-31_05:2019-10-30,2019-10-31 signatures=0
Cc: devicetree@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 0/4] Convert STM32 Timer mdf bindings to yaml
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

This series converts STM32 Timer mfd bindings to json-schema.
The original binding split between all the subnode remains the same
that why subnode bindings are converted first and then included in
the mfd binding.

Benjamin Gaignard (4):
  dt-bindings: counter: Convert stm32 counter bindings to json-schema
  dt-bindings: iio: timer: Convert stm32 IIO trigger bindings to
    json-schema
  dt-bindings: pwm: Convert stm32 pwm bindings to json-schema
  dt-bindings: mfd: Convert stm32 timers bindings to json-schema

 .../bindings/counter/st,stm32-timer-cnt.yaml       | 38 +++++++++
 .../bindings/counter/stm32-timer-cnt.txt           | 31 --------
 .../bindings/iio/timer/st,stm32-timer-trigger.yaml | 44 +++++++++++
 .../bindings/iio/timer/stm32-timer-trigger.txt     | 25 ------
 .../devicetree/bindings/mfd/st,stm32-timers.yaml   | 91 ++++++++++++++++++++++
 .../devicetree/bindings/mfd/stm32-timers.txt       | 73 -----------------
 .../devicetree/bindings/pwm/pwm-stm32.txt          | 38 ---------
 .../devicetree/bindings/pwm/st,stm32-pwm.yaml      | 51 ++++++++++++
 8 files changed, 224 insertions(+), 167 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/counter/st,stm32-timer-cnt.yaml
 delete mode 100644 Documentation/devicetree/bindings/counter/stm32-timer-cnt.txt
 create mode 100644 Documentation/devicetree/bindings/iio/timer/st,stm32-timer-trigger.yaml
 delete mode 100644 Documentation/devicetree/bindings/iio/timer/stm32-timer-trigger.txt
 create mode 100644 Documentation/devicetree/bindings/mfd/st,stm32-timers.yaml
 delete mode 100644 Documentation/devicetree/bindings/mfd/stm32-timers.txt
 delete mode 100644 Documentation/devicetree/bindings/pwm/pwm-stm32.txt
 create mode 100644 Documentation/devicetree/bindings/pwm/st,stm32-pwm.yaml

-- 
2.15.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
