Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 357B16DF9A0
	for <lists+linux-stm32@lfdr.de>; Wed, 12 Apr 2023 17:18:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E95E1C69065;
	Wed, 12 Apr 2023 15:18:56 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1CC44C62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Apr 2023 15:18:56 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33CCPPG2006667; Wed, 12 Apr 2023 17:18:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=PX57JNcwvp07eFhn2E9eab0nHyYZ1zoB73DVeo39Wco=;
 b=6kI8daGNHE5u1uhKBja5dnhTUWFUkF+zO94YG4KZaPqIZNFTJq1hKHlF+ZHb3nwqfzge
 n9wZ9LGbwMwx9K9fegjfhL2IeeVrGEeITlPaoZ+z0lY9FhqyfDassAx4YZGzCDgck9tz
 7MK4NWIbT66CAmS3kUHHUYKun42IjUKLaZ1C+fW9EffbA5yGsGHVQkJoUJACC+XJM19I
 qBu724jm4MPst/c7/nxt08eZMQZbcAt9hLBeWL2F8Xt47uhKFSdD6lqG/8LjL7/ZGE3l
 qIddrLOALxSPp2VQQE5DNzdwJYnKgymRQ+gcTRf57dr/jUFs9+CIVJfhfWgdksD6Qegb 7w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3pwsgpak2t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Apr 2023 17:18:40 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B8F03100034;
 Wed, 12 Apr 2023 17:18:38 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B1662218612;
 Wed, 12 Apr 2023 17:18:37 +0200 (CEST)
Received: from localhost (10.48.1.102) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Wed, 12 Apr
 2023 17:18:37 +0200
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
To: <hminas@synopsys.com>, <gregkh@linuxfoundation.org>, <robh+dt@kernel.org>, 
 <krzysztof.kozlowski+dt@linaro.org>, <alexandre.torgue@foss.st.com>
Date: Wed, 12 Apr 2023 17:18:27 +0200
Message-ID: <20230412151831.3069211-1-fabrice.gasnier@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.48.1.102]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-12_07,2023-04-12_01,2023-02-09_01
Cc: devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 0/4] usb: dwc2: add optional clock used on
	stm32mp15
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

This series introduces an optional utmi clock that is used on stm32mp15,
in particular when using integrated full-speed PHY, managed by GGPIO
register.
A pre-cursor change improves error handling in the platform code.

Fabrice Gasnier (4):
  usb: dwc2: improve error handling in __dwc2_lowlevel_hw_enable
  dt-bindings: usb: dwc2: add utmi optional clock
  usb: dwc2: platform: add support for utmi optional clock
  ARM: dts: stm32: add USB OTG UTMI clock on stm32mp151

 .../devicetree/bindings/usb/dwc2.yaml         |  5 ++-
 arch/arm/boot/dts/stm32mp151.dtsi             |  4 +-
 drivers/usb/dwc2/core.h                       |  2 +
 drivers/usb/dwc2/platform.c                   | 37 ++++++++++++++++++-
 4 files changed, 43 insertions(+), 5 deletions(-)

-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
