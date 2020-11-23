Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 734D92C020B
	for <lists+linux-stm32@lfdr.de>; Mon, 23 Nov 2020 10:09:05 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3D33EC5663F;
	Mon, 23 Nov 2020 09:09:05 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3665EC56630
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Nov 2020 09:02:18 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0AN8wQg7011534; Mon, 23 Nov 2020 10:02:15 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=LXvgTHQI0eYF62IvHYLnCBkMkZy/vMxDWx34Jatxj7E=;
 b=MnSKVDDQGr/07oiBcRpzYuizM5aCnRaV3BNM0Gqqu1oMjf/S+ygjy7EWPxquFZZ/4/Hg
 +9weMb0+Znu/xWYIM0eZRW7lA6wgw4Dm+lCo1AQLVSRaK1biaCxfGK7hBLw3GyjUJv0P
 zbeJN72qTP8DEISPnk+ddfb/4TFh2E5ehYa8OuQDf8mlaREQRvnanKwUU26pnXTMclGK
 TkY+jtRdiuNkWIvogS1DjHTRIox4OE+B33kRewlVSsJk2PyweV31EGdrQzGKakPRNhQA
 bM2CdLqPVfVyG6R+PNrSQXtzkx2c2xt0wD7kaoEH3EDjD1soEe4fM9pOviV46NYDnCI/ dA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34y0fgh61a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Nov 2020 10:02:15 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4664B100038;
 Mon, 23 Nov 2020 10:02:10 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2BF5423129F;
 Mon, 23 Nov 2020 10:02:10 +0100 (CET)
Received: from localhost (10.75.127.47) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 23 Nov 2020 10:01:17
 +0100
From: Amelie Delaunay <amelie.delaunay@st.com>
To: Minas Harutyunyan <hminas@synopsys.com>, Felipe Balbi <balbi@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Mon, 23 Nov 2020 10:01:11 +0100
Message-ID: <20201123090114.12641-1-amelie.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-23_02:2020-11-20,
 2020-11-23 signatures=0
X-Mailman-Approved-At: Mon, 23 Nov 2020 09:09:03 +0000
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Fabrice Gasnier <fabrice.gasnier@st.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 0/3] STM32MP15 OTG params updates
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

This patchset brings some updates on STM32MP15 OTG HS and FS.
It sets ahbcfg parameter for both HS and FS as the value reported by the
hardware is not recommended.
It also disables Link Power Management on OTG HS because with some Host
controllers (at least seen with some USB 3.2 Gen2 controllers), OTG doesn't
succeed to exit L1 state.
It also enables FS/LS PHY clock selection when the Core is in FS Host mode,
to have 6MHz PHY clock when the connected device is LS, and 48Mhz PHY clock
otherwise. 

Amelie Delaunay (3):
  usb: dwc2: set ahbcfg parameter for STM32MP15 OTG HS and FS
  usb: dwc2: enable FS/LS PHY clock select on STM32MP15 FS OTG
  usb: dwc2: disable Link Power Management on STM32MP15 HS OTG

 drivers/usb/dwc2/params.c | 8 ++++++++
 1 file changed, 8 insertions(+)

-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
