Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CC69670500
	for <lists+linux-stm32@lfdr.de>; Mon, 22 Jul 2019 18:06:36 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8D14DCD6214;
	Mon, 22 Jul 2019 16:06:36 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 79B5AC064F7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Jul 2019 16:06:33 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6MG65hm016172; Mon, 22 Jul 2019 18:06:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : subject :
 date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=tUyFF2dLFUND6HSCHRKN4a+J8+L0QNOSCuz5edjnQdI=;
 b=pVx177ZLmPbDmrPaz6AKQXlRGdiOL2ctfNMtl4BiexOt4zilvs7BIDxCJ9Je/mc5xavj
 YVcLd1nqYnoce0RRHqe4bwpGRxaQ30NyAg9OFc0Nk+GJuDYmREeeH3amg70dt/5zK1R8
 p6trXidCt/SvztRTcJUI/nq6reKG2KUcMIyepuX5jO85rOaG/4EdaDYQ6VYzo1XgVwkG
 PGRyU0QnYt1s0d56InkKqqHXUuOS0xKUBL74Fb0gI5xaNm0X746TGeXN9ItMycjjKq+8
 rM4tVMBhw+PK/MCGYq7g2lsDOZmZ8t2zQLnhoDsGUPbipQ4xBE5NlQLoK4Slx4HvspAv 1A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2ture1chdq-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 22 Jul 2019 18:06:05 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2982631;
 Mon, 22 Jul 2019 16:06:02 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas23.st.com [10.75.90.46])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C274452BB;
 Mon, 22 Jul 2019 16:06:02 +0000 (GMT)
Received: from SAFEX1HUBCAS21.st.com (10.75.90.45) by SAFEX1HUBCAS23.st.com
 (10.75.90.46) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 22 Jul
 2019 18:06:02 +0200
Received: from localhost (10.201.23.16) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 22 Jul 2019 18:06:02
 +0200
From: Olivier Moysan <olivier.moysan@st.com>
To: <a.hajda@samsung.com>, <narmstrong@baylibre.com>,
 <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@siol.net>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <benjamin.gaignard@st.com>, <alexandre.torgue@st.com>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-stm32@st-md-mailman.stormreply.com>, <olivier.moysan@st.com>,
 <jsarha@ti.com>, <robh+dt@kernel.org>, <mark.rutland@arm.com>,
 <devicetree@vger.kernel.org>
Date: Mon, 22 Jul 2019 18:05:57 +0200
Message-ID: <1563811560-29589-1-git-send-email-olivier.moysan@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.201.23.16]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-22_12:, , signatures=0
Subject: [Linux-stm32] [PATCH v2 0/3] drm/bridge: sii902x: fix audio mclk
	management
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

Fix audio master clock use for Silab sii902x HDMI transceiver.
Make audio master clock optional, as this clock is not mandatory.

Changes in v2:
- Rely on clk framework to manage undefined mclk case.
- Use devm_clk_get_optional instead of devm_clk_get.

Olivier Moysan (3):
  drm/bridge: sii902x: fix missing reference to mclk clock
  dt-bindings: display: sii902x: Change audio mclk binding
  drm/bridge: sii902x: make audio mclk optional

 .../devicetree/bindings/display/bridge/sii902x.txt     |  5 ++---
 drivers/gpu/drm/bridge/sii902x.c                       | 18 ++++++++++--------
 2 files changed, 12 insertions(+), 11 deletions(-)

-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
