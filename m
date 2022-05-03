Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB2651876E
	for <lists+linux-stm32@lfdr.de>; Tue,  3 May 2022 16:56:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4B290C60467;
	Tue,  3 May 2022 14:56:08 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4B13BC5F1D3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 May 2022 14:56:07 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2439XtPB026397;
 Tue, 3 May 2022 16:55:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=ZMxFA8J6k2ZHjDdGldD6Mpf4+zfmwkih2pJgfqKGO2o=;
 b=WbbqGKLfLCcvGWX1NExy7bQjJsyXoqze5LhRXHgdcf351cszLxOPwSVL824Dhzdv5CDu
 Pq9ZCZO+sN6vF4co4dmOwDugZg/EHnNJXT1VYHRp8mFLXas4GsIze+hAdkQ/JMdM6rmy
 nyc6BFgF/aT/rJrig3Oy2cgGBjPsmz/Gfzrmbe60qJTmeaU95yGSkVJ+TW8JgN2t4cdS
 u/UlO9k8HfTG2SYhYFPWp5XgtvH8b2IobizcSRfdQCSF63hb5mbqXukp0XUBUyKE420t
 lqNRlgxvnuj/ktG09xEjlMVYh5R11+A4TmeUgDEAxFGP/f5Yk/pM40cQJNjREF5OsA7A Gw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3frthjq1t2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 May 2022 16:55:55 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4BA8310002A;
 Tue,  3 May 2022 16:55:55 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 453F9226FB4;
 Tue,  3 May 2022 16:55:55 +0200 (CEST)
Received: from localhost (10.75.127.50) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Tue, 3 May 2022 16:55:54
 +0200
From: Fabien Dessenne <fabien.dessenne@foss.st.com>
To: Rob Herring <robh+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, <linux-kernel@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>
Date: Tue, 3 May 2022 16:55:52 +0200
Message-ID: <20220503145552.525733-1-fabien.dessenne@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-03_06,2022-05-02_03,2022-02-23_01
Subject: [Linux-stm32] [PATCH 0/2] dt-bindings/ stm32 dts: remove the IPCC
	"wakeup" IRQ
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

The stm32 mailbox (ipcc) dt-bindings and dts define a "wakeup" interrupt which
is not used by the ipcc driver, so remove it.

Fabien Dessenne (2):
  dt-bindings: mailbox: remove the IPCC "wakeup" IRQ
  ARM: dts: stm32: remove the IPCC "wakeup" IRQ on stm32mp151

 .../devicetree/bindings/mailbox/st,stm32-ipcc.yaml    | 11 +++--------
 arch/arm/boot/dts/stm32mp151.dtsi                     |  7 +++----
 2 files changed, 6 insertions(+), 12 deletions(-)

-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
