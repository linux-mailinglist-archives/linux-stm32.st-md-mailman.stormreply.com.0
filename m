Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 77373CFAECD
	for <lists+linux-stm32@lfdr.de>; Tue, 06 Jan 2026 21:31:33 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 476DFC8F279;
	Tue,  6 Jan 2026 20:31:33 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A9056C8F277
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Jan 2026 20:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ow5Q2oTlOwpy0d3Ggl1dyllFWj7dmZKHddfFehUm0pg=; b=M1fFK2Q6InDyrObeQZFE36jNAa
 9K9cm2S3n/9KCCGPT1VcGzK+Nd0ueI5kB79WiwO/0/bvOs3GBQQ8GetQZl3nPFYIktVjyVhG06mG+
 82LDz+Ip2sDFrSXins7vZ08+LKV/U38zDMgDlIZfmdRks9XNw0PHqmiTTN6PPESu/ghV+Pyy3KhaH
 ZwCdNrLVllm6rFBytaDO3m2UEMXGvU6ILPt83isZVBGjoyyR75ChqWnO/mcmp7G7tRh2B+kc2Npds
 sXZRcbTabaht3NHHvTpC/n4vrx4A0M0kmfxGbzLd3sFMahgHHRGMttL9Ut0C3pRK7Lj3mfDrecF5U
 n1B1SP4Q==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:46294 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1vdDiB-00000000113-2ukq;
 Tue, 06 Jan 2026 20:31:27 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1vdDiA-00000002E1W-2X6U; Tue, 06 Jan 2026 20:31:26 +0000
In-Reply-To: <aV1w9yxPwL990yZJ@shell.armlinux.org.uk>
References: <aV1w9yxPwL990yZJ@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1vdDiA-00000002E1W-2X6U@rmk-PC.armlinux.org.uk>
Date: Tue, 06 Jan 2026 20:31:26 +0000
Cc: Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 3/9] net: stmmac: dwmac4: fix PTP
 message type field extraction
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

In dwmac4_wrback_get_rx_status(), the code extracts the PTP message
type from receive descriptor 1 using the dwmac enhanced descriptor
definitions:

	message_type = (rdes1 & ERDES4_MSG_TYPE_MASK) >> 8;

This is defined as:

 #define ERDES4_MSG_TYPE_MASK            GENMASK(11, 8)

The correct definition is RDES1_PTP_MSG_TYPE_MASK, which is also
defined as:

 #define RDES1_PTP_MSG_TYPE_MASK         GENMASK(11, 8)

Use the correct definition, converting to use FIELD_GET() to extract
it without needing an open-coded shift right that is dependent on the
mask definition.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c
index aac68dc28dc1..c84b26d51760 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c
@@ -108,7 +108,7 @@ static int dwmac4_wrback_get_rx_status(struct stmmac_extra_stats *x,
 		ret = discard_frame;
 	}
 
-	message_type = (rdes1 & ERDES4_MSG_TYPE_MASK) >> 8;
+	message_type = FIELD_GET(RDES1_PTP_MSG_TYPE_MASK, rdes1);
 
 	if (rdes1 & RDES1_IP_HDR_ERROR) {
 		x->ip_hdr_err++;
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
