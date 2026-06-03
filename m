Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZJDbL0xmIGrt2gAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 03 Jun 2026 19:37:16 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 55E7763A349
	for <lists+linux-stm32@lfdr.de>; Wed, 03 Jun 2026 19:37:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=renesas.com header.s=selector1 header.b=mYg+rKeN;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=renesas.com (policy=none);
	arc=reject ("signature check failed: fail, {[1] = sig:microsoft.com:reject}")
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 00627C8F272;
	Wed,  3 Jun 2026 17:37:15 +0000 (UTC)
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11010048.outbound.protection.outlook.com [52.101.229.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F08A8C87EDE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Jun 2026 17:37:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fQxU7EdWItUnoHsSBkyU2fkZxlF8gJQ7BiueDN343fTjoVZcYWvSf4mPQ+22cWIkbLOdNJVghbPI9TCFbQRzzbpZVTh9YOrcS4Q3xJAzebfKJjA48PEwH1amyScEhbtjDtsjOAi7W8KykFHqjtivjSJTpiFJfx7A+Bon5ExYb6xOaUNOXafwwmIa9oZGdDl3QxnkraNN0FJQnfUMyrgqV0nlZ89XOiClp00UBeOzE3jcQd48QuCuK2D4ySnxSn1bggSNaWoq02lSziSRTUBV+bqCiEcVdPWPX/M94LvNDfMxAqx8qiERvYWat4zFEqjZoPSIE8VsHYXpZNTgljFzTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xQSqvgIh3JfDd8+sWsT+tPLti0JbgQXsRemk7Tn4+r0=;
 b=xnkP3qicD8EzqJthJtlXzYU9L0YWD15kKp3DQXxrOabi0rE1FshyisLptIUlCE3THafoMg0LI5vubV89kBzFq6brUSDqjz0Q/pvRdWDSXepKMkVntYsZC6+STQgBa4arXo03vB0tfHbjZBDB9NT7Xx81SNK7a5UYs29TWIO4M4fOuSCiBgIH+fUdRoiKpeaFgzxx49obHT/mtTGse7ZnRCrWvyNxaWaXRI3nxUHqonxIC5FmxM7UMtvBoeQT2fVfJAKLq9rA5ouxehM8j7P51CB4H/g/5LnnfCvkn19ei0FxAe6y9V7RB2tX1uSdtG3Mvo7RAYM8Ef4CnlwNB7+9zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=armlinux.org.uk smtp.mailfrom=renesas.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=renesas.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xQSqvgIh3JfDd8+sWsT+tPLti0JbgQXsRemk7Tn4+r0=;
 b=mYg+rKeNqIgM7sC6feUbW7mhlG6fKZ3lIWmQMdI24/1n0qCDdEb8T1scSzdo6eTBWH3uPP4Zzf3sRaXVszeKzkJfDml8RB/zv6rQ5mF7PmpOStDPY/va57PO1yHw+zTejrNGXym2+EDy86Pg7Q3aIatZbVuHAXemwD+MIQCSjzI=
Received: from TY4P286CA0109.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:380::15)
 by TYTPR01MB10936.jpnprd01.prod.outlook.com (2603:1096:400:39f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 17:37:09 +0000
Received: from TYO1EPF00005024.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:380:cafe::a3) by TY4P286CA0109.outlook.office365.com
 (2603:1096:405:380::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.7 via Frontend Transport; Wed, 3
 Jun 2026 17:37:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 8.62.32.50)
 smtp.mailfrom=renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of renesas.com designates
 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay005p.adwin.renesas.com; pr=E
Received: from ejcrelay005p.adwin.renesas.com (8.62.32.50) by
 TYO1EPF00005024.mail.protection.outlook.com (10.167.240.21) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.5 via
 Frontend Transport; Wed, 3 Jun 2026 17:37:08 +0000
Received: from vm01.adwin.renesas.com (DEU-5CG20946WF.adwin.renesas.com
 [10.226.92.182])
 by ejcrelay005p.adwin.renesas.com (Postfix) with ESMTP id E834F3000284;
 Thu,  4 Jun 2026 02:37:03 +0900 (JST)
From: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
To: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, rmk+kernel@armlinux.org.uk,
 maxime.chevallier@bootlin.com, o.rempel@pengutronix.de
Date: Wed,  3 Jun 2026 17:36:43 +0000
Message-ID: <20260603173644.24371-1-ovidiu.panait.rb@renesas.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYO1EPF00005024:EE_|TYTPR01MB10936:EE_
X-MS-Office365-Filtering-Correlation-Id: 825015ff-f2f2-463b-e82f-08dec196bc8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|376014|7416014|1800799024|82310400026|18002099003|921020|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: Z5Qn8VAu+OE0p2NU8NItprhcoZpTFMvRhtPERS17lzFrUR0xIFZSNVQrRwuvGY4kGR6L7QSEvpLkKl2CTvujUpS3zUM5qj0v+rXRxZ+Tro2Nbn2p5B1Ad5K6x/WUo6lmB47NqcS9tkhIn94e78jNs7zDL6tTrWrnXWvaokB/OdkrBqqnCBrswX3BtPD4kDaMSMjtqISyVO+S9QkYtu1A8oiH6lAYE0cSNncpAoIFtqbiKbvP4rAMj5RdEIf8VoEjE0xRHUHP0IhvKgKTKObibE67kAhoYkd0tCkR1pttmdpBCcqyJWiRsGyE9/Xb+1qLawged2NevhqXFOkUmlvVVju82kIMBiCP08V8RQA9c5/bEHMdGPZmmHtpYwWKtQ1aa4Y0ygDeWZ2DkUrGx+bI/sf5jhjaxW0EBp4YESIB/0tNNXYNSYxavBzb4C022bNCDMU3RV7HqE+z/Rr7RxWl6h57kOIo7mC+Ro3vTWZ45bmsPK8hOVFOxIVOkC8RPUR5N33nCGhBiDkPF4/0TXEStiDzJ0lxZSFCl2hExHpDlwMmHMONXxOzYTh6pJtW0bZgJS1coKjUlQGFd1IxQXDesAxx0oGI2IuJaxibPIZ3p4LIS2Pm+9OoIjjvLi+YQiTzqow67XSxjeZ2SXiKIRwUdZwa0X+KksnQIH9aWZ6kL0YV5MlU+n+fxMohL2igPyweSb2ijB/knsitMm/B8JWVC/6o1p4a3Wz5TovsBhbcp4GdaLV7+ahuP16unVRT2QqT2q2WcL0QMjjaOplMVI6B5w==
X-Forefront-Antispam-Report: CIP:8.62.32.50; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:ejcrelay005p.adwin.renesas.com; PTR:InfoDomainNonexistent;
 CAT:NONE;
 SFS:(13230040)(36860700016)(376014)(7416014)(1800799024)(82310400026)(18002099003)(921020)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: /p1NvTEKLmzvWEW4VAkmrDiOtbHl3g0rkrNrv/fAyncKfqgWeC3fcQuJ4LzuXoJ82XfLGgKFVdSikRpfMQXgHJ90pYzsOLwRm64KAGHn8fjkryALPuhxP6nAZnbi8/QXT6zXjVxGeE1a6cJHAHQO1kD5sug75Nh8cG4mfI/1Su8Zdf/OxpFrSW7D5aLtOBmphOdYbArrBxymzGJWhh/kgQWyc1iKObGhqCOk4aag8cPzvisCGmJVRjyT/1iRv3it6qi1puDwLUC09QKlzlm/sex8jpUvA8atEjXXgT9UkcMM+pi2WG4+LLqonOMq9yZHZS0mJLGi30EojgEs8o51WwjU6PX5offhA5/pn3O9wISbhjF7//Zzc91d9LxGoYGodwtK4qFvHDmfcRv6duXLY+zrDMRJ6+G4pSwVzvVl/flHU8rU8+/b2lgkenCizIMD
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 17:37:08.5354 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 825015ff-f2f2-463b-e82f-08dec196bc8d
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a; Ip=[8.62.32.50];
 Helo=[ejcrelay005p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: TYO1EPF00005024.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYTPR01MB10936
Cc: netdev@vger.kernel.org, Ovidiu Panait <ovidiu.panait.rb@renesas.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH net-next] net: stmmac: dwmac4: Report DCB
	feature capability
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [5.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	R_DKIM_REJECT(1.00)[renesas.com:s=selector1];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[renesas.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:rmk+kernel@armlinux.org.uk,m:maxime.chevallier@bootlin.com,m:o.rempel@pengutronix.de,m:netdev@vger.kernel.org,m:ovidiu.panait.rb@renesas.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:rmk@armlinux.org.uk,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com,foss.st.com,armlinux.org.uk,bootlin.com,pengutronix.de];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[ovidiu.panait.rb@renesas.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	GREYLIST(0.00)[pass,meta];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[renesas.com:-];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ovidiu.panait.rb@renesas.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,kernel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,renesas.com:mid,renesas.com:from_mime,renesas.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 55E7763A349

Bit 16 of the MAC HW Feature1 register reports the DCB (Data Centre
Bridging) feature. Read it so that dma_cap.dcben and the debugfs
report it accurately. Right now it is always reported as being disabled.

Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac4.h     | 1 +
 drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4.h b/drivers/net/ethernet/stmicro/stmmac/dwmac4.h
index ffcd036d4c02..6382836828ba 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4.h
@@ -198,6 +198,7 @@ enum power_event {
 #define GMAC_HW_FEAT_AVSEL		BIT(20)
 #define GMAC_HW_TSOEN			BIT(18)
 #define GMAC_HW_FEAT_SPHEN		BIT(17)
+#define GMAC_HW_FEAT_DCBEN		BIT(16)
 #define GMAC_HW_ADDR64			GENMASK(15, 14)
 #define GMAC_HW_TXFIFOSIZE		GENMASK(10, 6)
 #define GMAC_HW_RXFIFOSIZE		GENMASK(4, 0)
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c
index 28728271fbc9..829a23bdad01 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c
@@ -391,6 +391,7 @@ static int dwmac4_get_hw_feature(void __iomem *ioaddr,
 	dma_cap->av = (hw_cap & GMAC_HW_FEAT_AVSEL) >> 20;
 	dma_cap->tsoen = (hw_cap & GMAC_HW_TSOEN) >> 18;
 	dma_cap->sphen = (hw_cap & GMAC_HW_FEAT_SPHEN) >> 17;
+	dma_cap->dcben = (hw_cap & GMAC_HW_FEAT_DCBEN) >> 16;
 
 	dma_cap->addr64 = (hw_cap & GMAC_HW_ADDR64) >> 14;
 	switch (dma_cap->addr64) {
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
