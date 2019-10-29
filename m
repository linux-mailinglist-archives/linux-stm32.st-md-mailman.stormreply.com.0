Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2224AE8898
	for <lists+linux-stm32@lfdr.de>; Tue, 29 Oct 2019 13:47:12 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D3782C36B0C;
	Tue, 29 Oct 2019 12:47:11 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 85FC8C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Oct 2019 12:47:10 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x9TCg9Eu004076; Tue, 29 Oct 2019 13:46:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=PCCjXX8CusN1LvKZ5WG/65Gg+OP0fFkvR4ovWeCP35E=;
 b=UvDQ0UxL7RFjoFqGtof5EcYaJ8mKZySVehljZXxjvRLUaeUd1gfDYvuRpUzWJg2pH2yV
 V1OrBGltg2bWpfWI+PyNYLj2HgHxioZnDASNXkeEQBa3/18oBVYDCm7qqvlUTuvy+stj
 inlGzmHsWZ5iefxsHbcErp2bYqzd03uHxmzEpFx8JxZI5tgEAuLCp8gYFxLXs+8cwJ9K
 AI/WeY3hOaVqAbxqEt8WXbsE5piPuL8c33tT6zSPCxSbT3LSHUgGsVEmuv6nLXhm883K
 ipXM7m/7mtXPnAl/WRRlwWAFx31ZqIis8I7yLTe1McgPCVfvW4DtESJbej54reLfnECV Fg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2vvd1gqd8x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Oct 2019 13:46:59 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 50C8010002A;
 Tue, 29 Oct 2019 13:46:59 +0100 (CET)
Received: from Webmail-eu.st.com (Safex1hubcas23.st.com [10.75.90.46])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 236FD2BE234;
 Tue, 29 Oct 2019 13:46:59 +0100 (CET)
Received: from SAFEX1HUBCAS21.st.com (10.75.90.44) by SAFEX1HUBCAS23.st.com
 (10.75.90.46) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 29 Oct
 2019 13:46:59 +0100
Received: from localhost (10.201.22.141) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 29 Oct 2019 13:46:57
 +0100
From: Amelie Delaunay <amelie.delaunay@st.com>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@st.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>
Date: Tue, 29 Oct 2019 13:46:49 +0100
Message-ID: <20191029124651.12625-1-amelie.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.201.22.141]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-29_04:2019-10-28,2019-10-29 signatures=0
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH 0/2] STMFX pinctrl definition updates
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

Since a502b343eb ("pinctrl: stmfx: update pinconf settings"), pin
confuguration has been fixed in STMFX pinctrl driver. Moreover, gpiolib now
fully handles "push-pull" configuration.
This series cleans up stm32mp157c-ev1 stmfx pins use.

Amelie Delaunay (2):
  ARM: dts: stm32: remove OV5640 pinctrl definition on stm32mp157c-ev1
  ARM: dts: stm32: change joystick pinctrl definition on stm32mp157c-ev1

 arch/arm/boot/dts/stm32mp157c-ev1.dts | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
