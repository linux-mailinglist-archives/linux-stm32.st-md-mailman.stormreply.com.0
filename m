Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EDCB21BA0AB
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Apr 2020 12:01:06 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A034FC36B0B;
	Mon, 27 Apr 2020 10:01:05 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5F110C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Apr 2020 10:01:02 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03R9w61t018343; Mon, 27 Apr 2020 12:00:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=vRrhq9Wy/QYvVJWvXZIasd5JyX/yiLS74yAccMkmaf0=;
 b=UQg6by3AJhirVkC+Z222kbrTa95g0DgcJkkMATJNElRc+Hmh+cRaqq8AMKrpnOxkBC++
 sS1eEmku4dxKXc3AnSXR6iViTqOX23WNtTKfWmJ4NM1BA7n4FIrFE1RD/tmtWdgTeNgz
 m7izw5ADzdpvxyX0R+F2xuS7XWACBF8F6gXhKOkVs+uzhh+jYb87DGG83IkY3CTkjIFX
 DdZQwr0yV31Z9UcQyjafufqRWpK2g6IX0oh8D11KWAyich5XoDJKTNSE5cTV0M7nSfFx
 E538B1GN5v98+BmBMo4wrZo9Q0o6ZYMunxh28hm+Fzcnm3L+EsIWGp6CMZTWdVdTiiA4 9Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30mhjwh4u5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Apr 2020 12:00:46 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 55CC9100038;
 Mon, 27 Apr 2020 12:00:44 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag5node3.st.com [10.75.127.15])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 354902B8A30;
 Mon, 27 Apr 2020 12:00:44 +0200 (CEST)
Received: from localhost (10.75.127.45) by SFHDAG5NODE3.st.com (10.75.127.15)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Mon, 27 Apr 2020 12:00:43 +0200
From: Christophe Roullier <christophe.roullier@st.com>
To: <robh@kernel.org>, <davem@davemloft.net>, <joabreu@synopsys.com>,
 <mark.rutland@arm.com>, <mcoquelin.stm32@gmail.com>,
 <alexandre.torgue@st.com>, <peppe.cavallaro@st.com>
Date: Mon, 27 Apr 2020 12:00:37 +0200
Message-ID: <20200427100038.19252-1-christophe.roullier@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG5NODE3.st.com
 (10.75.127.15)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-27_05:2020-04-24,
 2020-04-27 signatures=0
Cc: devicetree@vger.kernel.org, andrew@lunn.ch, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 0/1] net: ethernet: stmmac: simplify phy
	modes management for stm32
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

No new feature, just to simplify stm32 part to be easier to use.
Add by default all Ethernet clocks in DT, and activate or not in function
of phy mode, clock frequency, if property "st,ext-phyclk" is set or not.
Keep backward compatibility

version 3:
Add acked from Alexandre Torgue
Rebased on top of v5.7-rc2

Christophe Roullier (1):
  net: ethernet: stmmac: simplify phy modes management for stm32

 .../net/ethernet/stmicro/stmmac/dwmac-stm32.c | 74 +++++++++++--------
 1 file changed, 44 insertions(+), 30 deletions(-)

-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
