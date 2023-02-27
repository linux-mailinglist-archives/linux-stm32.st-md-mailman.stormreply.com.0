Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D8E36A461B
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Feb 2023 16:31:58 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3ABF6C6A5E7;
	Mon, 27 Feb 2023 15:31:58 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1A09AC6904C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Feb 2023 15:14:29 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mgr@pengutronix.de>)
 id 1pWfCh-00082t-00; Mon, 27 Feb 2023 16:14:15 +0100
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <mgr@pengutronix.de>)
 id 1pWfCe-000exp-R1; Mon, 27 Feb 2023 16:14:12 +0100
Received: from mgr by dude04.red.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <mgr@pengutronix.de>)
 id 1pWfCe-007x7a-0a; Mon, 27 Feb 2023 16:14:12 +0100
From: Michael Grzeschik <m.grzeschik@pengutronix.de>
To: linux-arm-kernel@lists.infradead.org
Date: Mon, 27 Feb 2023 16:13:19 +0100
Message-Id: <20230227151318.1894938-1-m.grzeschik@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <1869feff-06b1-17f1-4628-b433c858ad79@foss.st.com>
References: <1869feff-06b1-17f1-4628-b433c858ad79@foss.st.com>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
X-Mailman-Approved-At: Mon, 27 Feb 2023 15:31:56 +0000
Cc: kishon@kernel.org, error27@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, vkoul@kernel.org,
 mcoquelin.stm32@gmail.com, linux-phy@lists.infradead.org,
 kernel@pengutronix.de
Subject: [Linux-stm32] [PATCH v2] phy: stm32-usphyc: add 200 to 300 us delay
	to fix timeout on some machines
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

An minimum udelay of 200 us seems to be necessary on some machines. After
the setup of the pll, which needs about 100 us to be locked there seem
to be additional 100 us to get the phy really functional. Without this
delay the usb runs not functional. With this additional short udelay
this issue was not reported again.

Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>

---
v1 -> v2: - changed the mdelay to udelay_range(200, 300), like suggested by fabrice
          - moved the delay to pll enable so it will only be triggered once

 drivers/phy/st/phy-stm32-usbphyc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/phy/st/phy-stm32-usbphyc.c b/drivers/phy/st/phy-stm32-usbphyc.c
index 5bb9647b078f12..dd469f57fba7eb 100644
--- a/drivers/phy/st/phy-stm32-usbphyc.c
+++ b/drivers/phy/st/phy-stm32-usbphyc.c
@@ -317,6 +317,9 @@ static int stm32_usbphyc_pll_enable(struct stm32_usbphyc *usbphyc)
 
 	stm32_usbphyc_set_bits(pll_reg, PLLEN);
 
+	/* Wait for maximum lock time */
+	usleep_range(200, 300);
+
 	return 0;
 
 reg_disable:
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
