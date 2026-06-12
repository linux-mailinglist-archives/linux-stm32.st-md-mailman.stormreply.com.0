Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id K58bFPYBLGrhJQQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 12 Jun 2026 14:56:22 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E32D6798C4
	for <lists+linux-stm32@lfdr.de>; Fri, 12 Jun 2026 14:56:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=foss.st.com header.s=selector2 header.b=AlFIURSW;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=foss.st.com (policy=none);
	arc=reject ("signature check failed: fail, {[1] = sig:microsoft.com:reject}")
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EA2F8C9AE32;
	Fri, 12 Jun 2026 12:56:21 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010023.outbound.protection.outlook.com [52.101.69.23])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4E956C712B2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Jun 2026 12:56:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YLGW4SwbjGtqKqAn85EubzWZyMYPqSI9ywRNWbPvlYFXjLWo4xWseiJ16Uv0K67pUVgC6RWQsh/DDTGVXREk6PVAB0kk8pLsxNPAHGtq6sr95Le4HBfmjCTjzFEdBUv6NwMk5ZifQSvYds1zubus6r9W4+gMa76rmHoEBTizF+9uqEkiTyb/5uUTbd/uyt7hUPkHYaJyGrCd/29MkN1MR2Y1Nu6AqsGWnBFLmXX3xymi8N2p6RUwdhE3RTxD3g0jxUF/UyANBgqas6sip+QDcb+nuRdSE32RxjIyUy9hvZ3tttQXjwhqfDPo1LNugcHE5Gi0dD7IIKNCaovg8UO0Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HOyMSCwiLOj1tuFlD2t4jdWXePOZwhWzGQbecD60kVw=;
 b=F9hu9OR5Ttg/JSJ14cgWxmjd7fENl7GMj/bKALjcZU7ZFIAgewQvaSeJYAgrT54sHHBYM2Vk/rVJlkUW5+7vtG5EFhXTN4qx+YHE7nFEHOIOiFFOkq2CjIVYaWq8MKm8HKPyUWYbFW1OhHSYf80RCGqmg665JAp88lNYPSrQ4QiYHmdJsT4IgK9pPdSDN5TKaXRUFLsZhhIpg4cTCn+v9UC8dErNisYaEMUsJ7YgbGZYKSVy86qrUQKhrs2+b1v1GUoAQqmg6NqgGQhJnS6+OnyvVuVYOFBaDzs5kAeKTeJ8AP/o0in8idtTgSxt1ANjlHQ4W74cOEccn+qX65eomA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HOyMSCwiLOj1tuFlD2t4jdWXePOZwhWzGQbecD60kVw=;
 b=AlFIURSWZBdCamP25mo0ycX9Auch/ZrrsmHPfaNKm5oRafGd3fkKfLexXf3jFIK45sgoucP114ij4POoZtwUdnMsOwngq8YR4NXPlNS/qBdF3oHRZAS6U51EjnvmS60wGZzuKxrdFFZgJuIT6Tp6VvZN0nubHkOUaKPsosoLiwd7S2dN5AnCbCeI19/kUR1EmH1Hlp94lrJ1XQ4ZuLGvFZ5ZdElu6+ufFzXJ/tks+oG2FiWxasNMtq7GhRbJGVhQ7pae4bpd+fWB2ZBaXWrIEKdmLVhOcrVhXzC7C6unkpqPUmzjuvcPmZzA8G/qEVJhdt48wwfn66Z2CXikuTrsrg==
Received: from AS9PR05CA0336.eurprd05.prod.outlook.com (2603:10a6:20b:490::28)
 by DB8PR10MB3722.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:138::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Fri, 12 Jun
 2026 12:56:16 +0000
Received: from AM3PEPF0000A795.eurprd04.prod.outlook.com
 (2603:10a6:20b:490:cafe::8f) by AS9PR05CA0336.outlook.office365.com
 (2603:10a6:20b:490::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.11 via Frontend Transport; Fri,
 12 Jun 2026 12:56:16 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM3PEPF0000A795.mail.protection.outlook.com (10.167.16.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Fri, 12 Jun 2026 12:56:15 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Fri, 12 Jun
 2026 15:00:03 +0200
Received: from localhost (10.48.87.71) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Fri, 12 Jun
 2026 14:56:14 +0200
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
Date: Fri, 12 Jun 2026 14:56:04 +0200
MIME-Version: 1.0
Message-ID: <20260612-node_reordering-v2-3-f68032ca3088@foss.st.com>
References: <20260612-node_reordering-v2-0-f68032ca3088@foss.st.com>
In-Reply-To: <20260612-node_reordering-v2-0-f68032ca3088@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.48.87.71]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A795:EE_|DB8PR10MB3722:EE_
X-MS-Office365-Filtering-Correlation-Id: af544954-38ce-4d83-992d-08dec881fd42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|82310400026|36860700016|23010399003|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: ihWe7RU3jywAppGMykSQAm2cg84TnlRBsS1sde/vMAl0YtfOzkxc911yb8qOb+zrO6YUBbOpfNcVtQ1n8HVm5n+6F8Q1wFaN3KWDosYOcqDD88fxSoN1vCDFaB6zbKAOI0VfjtL5AtPdMG8RWZQzMpJHAdOBzBzI1/ISgyCg2acrA/vucQb+Ji2RgiRtfrisLw1P+XLzCCSIXMlCHtacf4GktPFE6z7qK48dgYr+lrTWdhtxJmIeoB/Y8+5BxoG+3buIWYHsCFLqjy/0+cpSc4aIn0GIguacOEs5IzyZY7VVDtZ5jD51FTgPycJCNrnaethR7MrMhQ9bpH7qLXjO04HRg0/ZwVtv0yFU0JpL5KCWN02Atrv4yJPKI+ojmU9K7Rzxll+Hx4rpXZua6aPWXS+bvY87RFR9sZU28XvX4awe5YL5DnTBRkX2PZncw/lDty5OxYHSm7sZEyAMi35nupPs/UC0xxSqKRM2SvaaUwgrjiWSH9jknwlp0ck3E8ZmQi5ugaUDa1ms+yt29JZ26hQtVFuLxfJTZ2bN9X7QwFsO/cwNEPyH+/D9160N7ROb0tpptCw1QpvcnBCHIQjwLRbzmnp9/ehQ17JKnMT2l3Seg0wlZos8J6+SIXNlpcrceGVqQYVq6U3z160Oxd3nHkvZEmKiaecN7nvIk5nNtVMsIoprVoJCL/kMncgJ82oLhsa+v/nM1c0yLejjDYhmX+wF9QdyghaMQvQgXzpUB6c=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(82310400026)(36860700016)(23010399003)(22082099003)(18002099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: zltSlnKXPnjMQaZi1nqDqS9vupho6ykxRTFh2rEscNqkvc/mROAEunhjlSggaq1sj1SBmBu1h/90UiaCRq6cCeGMzokMSmA6mdERxAAqfLAEmz7GbskfR4cqUAK/Y8UMuUQDoQeMGv0A+ioVaZmJDvahb15HCmmTcvlBYff8Eo8sV7frmAUmVz+ro+6JDMy96K+fVb1dJajYvGgWxj2XkaHL8iwO3+OwgDaQSI3u67wl141ua4wi3gLk9byk3F4vietkUaWqdt+doBlCRDQY2WS5gIS+V83wEnMhwyvuty4+TAGyh3MEqLWvdqHNxmeahYY2sWankqssYzN+IeR9GBGqbAm0VC/3OUyoer8ZrYRa1xQJr0k4A8vqXKZQkwnMdvDDP6MvkFhwpezQ6RaAOtm6xRDmCkCDNCKJqzDp8kY8hRlVML7Nmn5sqx/kpBr5
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 12:56:15.7625 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: af544954-38ce-4d83-992d-08dec881fd42
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF0000A795.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3722
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH v2 3/5] ARM: dts: stm32: reorder cs_cti_trace
 node in stm32mp15xx-dkx.dtsi
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
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:devicetree@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,foss.st.com];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	GREYLIST(0.00)[pass,meta];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[amelie.delaunay@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st.com:email,stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo,foss.st.com:mid,foss.st.com:from_mime];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[amelie.delaunay@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[foss.st.com:-];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2E32D6798C4

In the ST board DTS files, the &label entries must be ordered
alphanumerically.
The nodes became misordered when Coresight support was added.

Move cs_cti_trace to the right place to avoid future misordering.

Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi b/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi
index 599ea07bdb19..956509cef321 100644
--- a/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi
@@ -155,15 +155,15 @@ &crc1 {
 	status = "okay";
 };
 
-&cs_cti_trace {
+&cs_cti_cpu0 {
 	status = "okay";
 };
 
-&cs_cti_cpu0 {
+&cs_cti_cpu1 {
 	status = "okay";
 };
 
-&cs_cti_cpu1 {
+&cs_cti_trace {
 	status = "okay";
 };
 

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
