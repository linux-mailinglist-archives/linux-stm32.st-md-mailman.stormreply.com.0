Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B682EA7DD
	for <lists+linux-stm32@lfdr.de>; Tue,  5 Jan 2021 10:49:14 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1ADDEC5718D;
	Tue,  5 Jan 2021 09:49:14 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 01050C32EA7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 Jan 2021 09:49:10 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1059lGvF002392; Tue, 5 Jan 2021 10:49:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=P6bqie7w0/hFqyjwRS5cr4EagH5X+V9yAXASQZyhJvY=;
 b=cI5AD3uw0aPsLMbHKfWj2s/i/+lTAHRjWMgVr0OI1dCmWwp7M3UCNbLEhf/7sSRwxOu8
 pKDM+Mk7Dtk+W5YE03wbsSoYKM6wqL/3zVGwXRv8jsiYg+xKyrx7RqB6OXkPGbCO3GmB
 MVvBWxcsaqx4KPRnWMs6j9d0S1l0MCLaHRIa2J2nzjA4mscpi85biRPhvTNv85Jv2rl9
 2INRC97yq2S1Z+5NSt7amJO4Rbv7BB9YbhvbP64bzvb9X3UkWr5JU4OFUKHuf4ZQyNus
 an+XZ3GDQt0YfvtZuu3Wcz0U67a9RspCdBlxlJeApvhgx1v39pRYEdKFZRuxVHvMfPCF nw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 35tf66v6yj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 Jan 2021 10:49:06 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1055C10002A;
 Tue,  5 Jan 2021 10:49:06 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0100F230519;
 Tue,  5 Jan 2021 10:49:05 +0100 (CET)
Received: from localhost (10.75.127.46) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 5 Jan 2021 10:49:05
 +0100
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
To: Minas Harutyunyan <hminas@synopsys.com>, Felipe Balbi <balbi@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Tue, 5 Jan 2021 10:48:52 +0100
Message-ID: <20210105094855.30763-1-amelie.delaunay@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG3NODE3.st.com (10.75.127.9) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-05_01:2021-01-05,
 2021-01-05 signatures=0
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v2 0/3] STM32MP15 OTG params updates
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

---
Changes in v2:
- Move author mail address from @st.com to @foss.st.com
- Add Minas' Reviewed-by on all patches

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
