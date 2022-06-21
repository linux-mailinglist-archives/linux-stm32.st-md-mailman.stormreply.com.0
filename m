Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B225532E5
	for <lists+linux-stm32@lfdr.de>; Tue, 21 Jun 2022 15:05:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AE7B5C57B6C;
	Tue, 21 Jun 2022 13:05:46 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CBD4BC56630
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Jun 2022 13:05:45 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25L8oUWh018369;
 Tue, 21 Jun 2022 15:05:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=Fp2la6PbcDqoHzVfECKWbHyqaieoleTk0b1rFBS6Uck=;
 b=YdTf9NwnQkWUjN1W1n6lzrKhbRHqoEDozYOvAlXhTep8lmYYS6C/lkIe3UhC/sdbJRc5
 2oJwlOsMKlExIUU1otOawjw01lL2Zp/973nXSq+fsqlVTDuVTENTVJF8fzEbjv4L0U79
 RZhSNBdTOMNDiGwx2+wrj7aFA0Pk6vhyMVEJ4SuGW9gTJRcyU2A91gzufrexP7S94Ppq
 J2ziXthv1oEPaSF8GVNyPon/2sxvW6NbcwSsi8h1vsWh3v9E6We/1Te++wONSo4mOQsp
 sGeMkmjVLgw0FcpEFHhEUNLMJUSRWGSdeu6+2bhx1uk3Avdk6liQfwmev40TJOPl7vMY uQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3guau51ny1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Jun 2022 15:05:32 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0EA3210002A;
 Tue, 21 Jun 2022 15:05:29 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EB7D22248AA;
 Tue, 21 Jun 2022 15:05:29 +0200 (CEST)
Received: from localhost (10.75.127.116) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Tue, 21 Jun
 2022 15:05:29 +0200
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
To: <hminas@synopsys.com>, <gregkh@linuxfoundation.org>,
 <stern@rowland.harvard.edu>
Date: Tue, 21 Jun 2022 15:05:03 +0200
Message-ID: <20220621130506.85424-1-fabrice.gasnier@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.116]
X-ClientProxiedBy: GPXDAG2NODE5.st.com (10.75.127.69) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-21_05,2022-06-21_01,2022-02-23_01
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 0/3] usb: host: add TPL support to ehci ohci
	and dwc2
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

The TPL support is used to identify targeted devices during EH compliance
testing. Add TPL support setting from device tree on ehci-platform,
ohci-platform and dwc2 drivers.

Amelie Delaunay (3):
  usb: host: ohci-platform: add TPL support
  usb: host: ehci-platform: add TPL support
  usb: dwc2: host: add TPL support

 drivers/usb/dwc2/hcd.c           | 3 +++
 drivers/usb/host/ehci-platform.c | 2 ++
 drivers/usb/host/ohci-platform.c | 3 +++
 3 files changed, 8 insertions(+)

-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
