Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jFzhEZ1LMmogyQUAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 17 Jun 2026 09:24:13 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C26CE69726B
	for <lists+linux-stm32@lfdr.de>; Wed, 17 Jun 2026 09:24:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20201202 header.b=cgOIGL66;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=kernel.org (policy=quarantine)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 60DAFC8F28C;
	Wed, 17 Jun 2026 07:24:12 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6D18CC36B2A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Jun 2026 12:24:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 08E6443C5E;
 Mon, 15 Jun 2026 12:24:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D8A06C2BCB4;
 Mon, 15 Jun 2026 12:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1781526277;
 bh=U/229aDPygbK2f1IV17WG591ys3SZgvnwqf40Huk/S4=;
 h=From:Date:Subject:To:Cc:Reply-To:From;
 b=cgOIGL66GyRBFJh3ulPaHZzu78hTw6TEYU6zpzYlFLH+jneSK4MkPh947qRSB2FGU
 +WI1F1oaqYUC1AXk75ofb4AqueS8n/7AuTWsiu7Ys+ZgvxhUpo8Q//2m1I2OrzI7Rc
 dHjMfDCaSvuYsFHQ9OZStUb+IFsXB/ADwF60Cn7OY9MLpESB/VOxfmqXUUQ+ceAVM8
 7Wie0pC5LqdHPaBp0/jUo3FmOkrpwbCDEbt0cuOokWSzHnA79+6gmC19vmMQ/+eVdv
 FcWoVe1rY+N7YWSKbM9oSG/AqaQ+BT28p99z23QdNjRa7mm9n3Dg0kCdaUACxRAjs3
 alhzsG5fgAY+A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id B9CC8CD98DE;
 Mon, 15 Jun 2026 12:24:37 +0000 (UTC)
From: Keguang Zhang via B4 Relay <devnull+keguang.zhang.gmail.com@kernel.org>
Date: Mon, 15 Jun 2026 20:24:17 +0800
MIME-Version: 1.0
Message-Id: <20260615-dwmac-loongson1-v1-1-cbcf5bc01d9b@gmail.com>
X-B4-Tracking: v=1; b=H4sIAPDuL2oC/x3MQQqAIBBA0avIrBPUSKirRIvS0QZKQ6EC8e5Jy
 7f4v0DGRJhhYgUS3pQphgbZMTD7Gjxyss2ghNJCC8Xtc66GHzEGn2OQfEC5jdaZ3mgFrboSOnr
 /47zU+gHKAVm4YQAAAA==
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781526276; l=1168;
 i=keguang.zhang@gmail.com; s=20231129; h=from:subject:message-id;
 bh=2fl2OBxWH3wOcozENxrt6hZZsu8wzA6vdfleIZixEow=;
 b=/xcmeOq0CIVKL1BbVMNLoT/ceXxJcS0hTcnCvEZ6XK0jr4a/anBT54fyJswBJHk++djVHtRXn
 tJKVWnD0mutDflarcg2J1w0kDRCds4G4jYe4E9akQGFn9N6xspemEK7
X-Developer-Key: i=keguang.zhang@gmail.com; a=ed25519;
 pk=FMKGj/JgKll/MgClpNZ3frIIogsh5e5r8CeW2mr+WLs=
X-Endpoint-Received: by B4 Relay for keguang.zhang@gmail.com/20231129 with
 auth_id=102
X-Original-From: Keguang Zhang <keguang.zhang@gmail.com>
X-Mailman-Approved-At: Wed, 17 Jun 2026 07:24:11 +0000
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, Keguang Zhang <keguang.zhang@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] net: stmmac: loongson1: Use dev_err_probe()
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
Reply-To: keguang.zhang@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Rspamd-Action: add header
X-Spamd-Result: default: False [7.79 / 15.00];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	DATE_IN_PAST(1.00)[42];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-mips@vger.kernel.org,m:keguang.zhang@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:keguangzhang@gmail.com,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[keguang.zhang.gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,st-md-mailman.stormreply.com,lists.infradead.org];
	FREEMAIL_TO(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com,foss.st.com];
	FORGED_SENDER(0.00)[devnull@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,st-md-mailman.stormreply.com:from_smtp,stm-ict-prod-mailman-01.stormreply.prv:helo];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[keguang.zhang@gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	DKIM_TRACE(0.00)[kernel.org:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C26CE69726B
X-Spam: Yes

From: Keguang Zhang <keguang.zhang@gmail.com>

Use dev_err_probe() for the missing match data case to simplify
error handling.

Signed-off-by: Keguang Zhang <keguang.zhang@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c
index de9aba756aac..ec34adb63f61 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c
@@ -176,10 +176,8 @@ static int ls1x_dwmac_probe(struct platform_device *pdev)
 				     "Unable to find syscon\n");
 
 	data = of_device_get_match_data(&pdev->dev);
-	if (!data) {
-		dev_err(&pdev->dev, "No of match data provided\n");
-		return -EINVAL;
-	}
+	if (!data)
+		return dev_err_probe(&pdev->dev, -EINVAL, "No of match data provided\n");
 
 	dwmac = devm_kzalloc(&pdev->dev, sizeof(*dwmac), GFP_KERNEL);
 	if (!dwmac)

---
base-commit: ec039126b7fac4e3af35ebccaa7c6f9b6875ba81
change-id: 20260602-dwmac-loongson1-5e1b9dfc3c62

Best regards,
-- 
Keguang Zhang <keguang.zhang@gmail.com>


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
