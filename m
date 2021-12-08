Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 44AA346D116
	for <lists+linux-stm32@lfdr.de>; Wed,  8 Dec 2021 11:33:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EFE25C5F1F1;
	Wed,  8 Dec 2021 10:33:42 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 683DCC5F1E8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Dec 2021 10:33:41 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1B87q3lr026303;
 Wed, 8 Dec 2021 11:33:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=P36ACckomRJzc3ICzuCqXxXmZ50KyTa2Lr3uk/ttIpE=;
 b=tD2sZLFMRHB3Xy+QWKXT2RQSNRzyjkwaniZPp0R+ZIPra/u99V116iowJpFUXpglP3Fl
 XTnMR4xurk6w5XDlGByyTgtZGf1P5VyJNpeyutCO6OtSGNy9sdYP1M611X5fuginuf8B
 TaBVF6hRV8jNFAnjqDMJi8p/4N7l17vxEVwXbioSwjheKuTu2/ah4Ob3EWJ9beL4FMb7
 9xt7O+Mktbo9RdnvXFBHyRf0+KsS502A9eSbO4lKoDdRx8VeYXJr7ZXNLo2TMuY1INTG
 12ryU2qR7cJc9J4GXw1DR3KcFPnFLvEg1f5KZ+XKI4TM+oHKjptgFyMIv6og5Nr4G2n7 cw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ctrpq8x4d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Dec 2021 11:33:25 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 75EAD10002A;
 Wed,  8 Dec 2021 11:33:23 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6AF8E23153B;
 Wed,  8 Dec 2021 11:33:23 +0100 (CET)
Received: from localhost (10.75.127.48) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Wed, 8 Dec 2021 11:33:23
 +0100
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
To: <alexandre.torgue@foss.st.com>, <robh+dt@kernel.org>
Date: Wed, 8 Dec 2021 11:33:14 +0100
Message-ID: <1638959596-6656-1-git-send-email-fabrice.gasnier@foss.st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-08_03,2021-12-08_01,2021-12-02_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 0/2] ARM: dts: stm32: remove timer duplicate
	unit-address on stm32f4 series
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

Remove a series of warnings seen when building with W=1, like:
Warning (unique_unit_address): /soc/timer@40000c00: duplicate unit-address
(also used in node /soc/timers@40000c00)

This approach is based on some discussions[1], to restructure the dtsi
and dts files.
[1] https://lore.kernel.org/linux-arm-kernel/Yaf4jiZIp8+ndaXs@robh.at.kernel.org/

Fabrice Gasnier (2):
  ARM: dts: stm32: remove some timer duplicate unit-address on stm32f4
    series
  ARM: dts: stm32: remove timer5 duplicate unit-address on stm32f4
    series

 arch/arm/boot/dts/stm32429i-eval.dts  | 12 +++++++++
 arch/arm/boot/dts/stm32f429-disco.dts | 12 +++++++++
 arch/arm/boot/dts/stm32f429.dtsi      | 47 -----------------------------------
 arch/arm/boot/dts/stm32f469-disco.dts | 12 +++++++++
 4 files changed, 36 insertions(+), 47 deletions(-)

-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
