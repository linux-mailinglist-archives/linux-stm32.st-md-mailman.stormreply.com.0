Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 27DD9939225
	for <lists+linux-stm32@lfdr.de>; Mon, 22 Jul 2024 18:02:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ABD37C6DD66;
	Mon, 22 Jul 2024 16:02:05 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6E476C6C855
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Jul 2024 16:02:00 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46MB0jav014214;
 Mon, 22 Jul 2024 18:01:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=selector1; bh=+JVnZ5RexfRvHDFJf6ZIGo
 vlJ2rC2GSlwR/nIH1b+/c=; b=nKd4dsDyLHAKcqL/uR5HihqAgcBFZD/jUOMMIo
 Cmea+nInlLxEAYMRwu6Mx0dHpDJZJO3jsoYsAYwJU9GPh0mSAPaSa5IW3h9pJq49
 XN+ltpJepaRPzFkrNhwRkpXb1/wSIARv8798BARmNTaTC3P60+v8rkypagknG3WX
 xAXr/1A+mkhzCpNcGs9ntUm4FEAgB2K9gKHBtJn0WC/bWsITlL+euPLR+NXyD3th
 rjtwPB3AjbszLJTWLCa4p3N0O91s7prVY838Fkfxk/csHty5BIwo6aP+WXpzqzSt
 AEIW44seGgYy7hT0TJUV4nhtzI68BXS4x2i6wivdMJxdDKxg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 40g2ngxpxb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Jul 2024 18:01:41 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 9A8C340044;
 Mon, 22 Jul 2024 18:01:35 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 79D442786EA;
 Mon, 22 Jul 2024 18:00:58 +0200 (CEST)
Received: from localhost (10.48.86.111) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Mon, 22 Jul
 2024 18:00:58 +0200
From: Valentin Caron <valentin.caron@foss.st.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Mon, 22 Jul 2024 18:00:18 +0200
Message-ID: <20240722160022.454226-1-valentin.caron@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.48.86.111]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-22_10,2024-07-22_01,2024-05-17_01
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 0/4] rtc: stm32: add pinctrl interface to
	handle RTC outs
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

This series adds a pinctrl/pinmux interface to control STM32 RTC outputs.

Theses two signals output are possible:
 - LSCO (Low Speed Clock Output) that allow to output LSE clock on a pin.
   On STM32MPU Discovery boards, this feature is used to generate a clock
   to Wifi/Bluetooth module.
 - Alarm out that allow to send a pulse on a pin when alarm A of the RTC
   expires.

First attempt [1] was based on 'st,' vendor properties, this one is based
on pinctrl and pinmux framework.

As device-trees will be upstreamed separately, here is an example:

stm32-pinctrl {
    rtc_rsvd_pins_a: rtc-rsvd-0 {
        pins {
            pinmux = <STM32_PINMUX('B', 2, AF1)>, /* OUT2 */
                     <STM32_PINMUX('I', 8, ANALOG)>; /* OUT2_RMP */
        };
    };
};

stm32-rtc {
    pinctrl-0 = <&rtc_rsvd_pins_a &rtc_alarma_pins_a>;

    /* Enable by foo-device */
    rtc_lsco_pins_a: rtc-lsco-0 {
        pins = "out2_rmp";
        function = "lsco";
    };

    /* Enable by stm32-rtc hog */
    rtc_alarma_pins_a: rtc-alarma-0 {
        pins = "out2";
        function = "alarm-a";
    };
};

foo-device {
    pinctrl-0 = <&rtc_lsco_pins_a>;
};

[1] https://lore.kernel.org/linux-arm-kernel/20220504130617.331290-5-valentin.caron@foss.st.com/t/#m37935e92315e22bbe085775096175afc05b7ff09

Since v2:
 - Modify Kconfig after (a lot of) robots alert:
     + https://lore.kernel.org/oe-kbuild-all/202407190654.I3RI7WfP-lkp@intel.com/
     + https://lore.kernel.org/oe-kbuild-all/202407191258.1oitwwMV-lkp@intel.com/
     + https://lore.kernel.org/oe-kbuild-all/202407200400.NnW2fJ0q-lkp@intel.com/
     + https://lore.kernel.org/oe-kbuild-all/202407181525.BRNKqmNf-lkp@intel.com/
     + https://lore.kernel.org/oe-kbuild-all/202407191830.8bh5dJ09-lkp@intel.com/
   Make RTC_DRV_STM32 depends on OF, PINCTRL and COMMON_CLK as they are menuconfig entry.
   Make RTC_DRV_STM32 select PINCONF, PINCONF_GENERIC and PINMUX as they config entry.
   
Since v1:
 - Select PINMUX and PINCONF_GENERIC to solve:
   https://lore.kernel.org/oe-kbuild-all/202407130943.ie6n2Orh-lkp@intel.com/
 - Make stm32_rtc_pinctrl_pins as static to solve:
   https://lore.kernel.org/oe-kbuild-all/202407130612.OEicZbNE-lkp@intel.com/
 - Change "depends on" to "select" COMMON_CLK config
 - Modify regex in dt-binding to avoid properties like "rtc--123" as valid ones.

Valentin Caron (4):
  dt-bindings: rtc: stm32: describe pinmux nodes
  rtc: stm32: add pinctrl and pinmux interfaces
  rtc: stm32: add Low Speed Clock Output (LSCO) support
  rtc: stm32: add alarm A out feature

 .../devicetree/bindings/rtc/st,stm32-rtc.yaml |  28 ++
 drivers/rtc/Kconfig                           |   6 +
 drivers/rtc/rtc-stm32.c                       | 281 ++++++++++++++++++
 3 files changed, 315 insertions(+)

-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
