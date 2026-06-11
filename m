Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7mcKO7V4KmqmqAMAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Jun 2026 10:58:29 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C76C8670196
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Jun 2026 10:58:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=foss.st.com header.s=selector2 header.b=K6KCeDX8;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=foss.st.com (policy=none);
	arc=reject ("signature check failed: fail, {[1] = sig:microsoft.com:reject}")
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8C589C65073;
	Thu, 11 Jun 2026 08:58:29 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazon11011017.outbound.protection.outlook.com
 [40.107.130.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BD1D6C62ED0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Jun 2026 08:58:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h1vjPmerkdXgvimWFm7qkSmgfX2SzDWh3TKg1mfI/Tl9j0M0RXlkL7aK0xoN+LsykGkgP7S9L8ODnYDvt8YndoaFjlGIxaVWW6X765QaqtZuWWhHN571CcJhSj1HtYnH5WMQikLH71VDkrfVmTTPEAqojz+ksOu08SHY590qxRkflYIpqFaRFLwRC05pJeYFOPojydWAkeAuiV5BGQaQC7dEP1TlGG15NKcS6XzRC2tdg9w5EZwz1iHzvQ0GudXhdkmvzfmMtEHkTFp6L72xOEuTX1oedx3VxVemjvsoYptUtZzJbbd/g4URr6VjbPjeDZpWVCqgJ0JN3+ggweQO5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oOtJvHekvBqe134NJdsNaCbQFFdESqxgqDmFG7Pv4ic=;
 b=Rl4TfJpehbjy3swtdmX9DPF27Bdj/K8vGH5/uQnuw8KXbGeVz22zCMfNxQfH9A3vFw6oIE0DnrdfirjZ2TkgdSlhwe+wyObgY+55Z7tJgMOLzSBlJfC8hcDq09gDvf21+nc3jh/mrZCeDhYdtriufUx6Zwt8J/8U+itjtsvV3VV0rzgLirdYLLzDKgcwopuwmnPVKPijedlv1+81Cksj6y+Xtyv8OWldKrjxP5BN8UYDABKaMETGF9WJin5blkmvI1k9MQI++9hP1MCBK1UCe/2r81pj53uHbLgIq2yBJPK4QS5r7ifL/D/krv7qnQnKeeDTbXA0uZUGQtmmexiIPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oOtJvHekvBqe134NJdsNaCbQFFdESqxgqDmFG7Pv4ic=;
 b=K6KCeDX85tbfGUesBJt8cpep2B48n/Ce0uyqDt9YEFiYVOgluK/AsY5JPyRY+dFLBPJvR7itY8kFsVH2Ut0v8vM4eVptTFB5JkLCv03ksWZDhUlB6E0IKCidBPrPRkKk7BUSgtRNuLQ3Y04mGGb4QiVJ82CFK94WgIKDTNjJxpWQIlEzuzUohxLYT900Q40FISRw4xLDxhhJZGxag8qT6BB/QuS1xmXgrkxTwMu8/YkgyLVFyAlSgWUgU6DKxZtvzGxCKmqTisbiJWtLnfs+gu5ErKc0fxVeCKQ65QfHmFrjLoSgG+JEOUFVbjttOkfn1IniRTHOEBRpOB58kha8cg==
Received: from DU2PR04CA0181.eurprd04.prod.outlook.com (2603:10a6:10:28d::6)
 by VI1PR10MB7782.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:1be::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Thu, 11 Jun
 2026 08:58:22 +0000
Received: from DB1PEPF000509F5.eurprd02.prod.outlook.com
 (2603:10a6:10:28d:cafe::6c) by DU2PR04CA0181.outlook.office365.com
 (2603:10a6:10:28d::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.11 via Frontend Transport; Thu,
 11 Jun 2026 08:58:22 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB1PEPF000509F5.mail.protection.outlook.com (10.167.242.151) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Thu, 11 Jun 2026 08:58:21 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Thu, 11 Jun
 2026 11:02:35 +0200
Received: from localhost (10.48.87.71) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Thu, 11 Jun
 2026 10:58:20 +0200
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
Date: Thu, 11 Jun 2026 10:58:18 +0200
MIME-Version: 1.0
Message-ID: <20260611-node_reordering-v1-4-7e519f2cb456@foss.st.com>
References: <20260611-node_reordering-v1-0-7e519f2cb456@foss.st.com>
In-Reply-To: <20260611-node_reordering-v1-0-7e519f2cb456@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.48.87.71]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F5:EE_|VI1PR10MB7782:EE_
X-MS-Office365-Filtering-Correlation-Id: de22edd8-cbfd-4ccf-5735-08dec79796f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700016|23010399003|82310400026|1800799024|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: vzQ+ohkii3uop0Zv1hHKjnO92aco3cHvXtAEDOK3qajyiGsyLy/jvvMyiSJCx7xpSAKojPUx972DPGxS72/bbLq59bwEizDGa3GETimPfuQsvrEt5D2f52Qj5tDwc2WgO90nVfMKSDi+TB7TqwRjL6IrGgYkbksGXl9LgcGzdduOw0MqaX2hIZjA8jzcWiQ3BEEVOd5lUyl5dgQ7l4LEG+T1vi+UHP5d3XcnK5pTUT5iHFOeAwDEGUwxCHY1jBvdc7HlX38JEVumpREFqePiFUUyAnYL8EPMUTnWykb6HWLe/t4qBPj7flocxR8Xr2xifR16BPW6QixiuLcaUFOxUvmybHXysAYjvR5m5C+TzJ2DVnZfjL6mPoMNFLmNo874Zqr6KcjQSnN7Y/1RROo1zp1bYH1rawJU4PXHrZRGsTS48+jvasJugxqOSWyCWyWyKicDCbQoOo17CSQYLEDaiFH2nAfPDjW+Ghmcad+ZgexCf8kp5hp7NYUTirpFhnetor7f21og8n9EutBdg2CY+ucxpFyMj/fobMtYSCEXaHI8F109s05X+vtNE1LoIMKJhoCqEw5AuIPRprRQgStDgQz0iuMrAxmFMNWfCVHNQLCDgNYpiJYudVQa13FM2H3T8aeQH58yNowfXFBqsYH+9eiU7dgZAPw+FKQoVVPJGe1FJQ8u2pLSm15e3eqx2II+wzetSKYOI/5GQbR6y4hIdRKXlhjuQwPS+OwefkbO+h0=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700016)(23010399003)(82310400026)(1800799024)(56012099006)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: vGoF61tMc5CrlxoAZmukPdT0vyEAJEnNGfqM60y9tx9hTJnIzegIXCkmuU8XzWFjPl4kEhAp5xro/X0l3IBjxxkVS2olQ6Ig/SBVE54jAyV/MPohI2lrneWGkcrYFvWCaq1SWguQPHLrLA++FSKKSYSLRkt34YPZz3rOeRYs2dMYzGGYD2zyq3YgPQGLtIIeKziU2RyrSNOQ3F8UCRWaz3pfPorvOcrjw4KB45CN35MhfIY+IIUgxRSIgf9+WuQqq1V16u+/7N9xcKavdNRChjUExHTpEiRtv80x2SuYjGPYHR5sPKCPz5SpRMcm2fj0SAqQqEVIKIiDmEHuMyONXeVf/VEYc2RrB6s6NNkFxUF4eYLNHqZmexdrBmo0XZrE4/7FA6173WLf5zoH141OL8LdqefZ/Rsdz8qfJNhJnJuv+0WW14eiHialT220EN5r
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 08:58:21.8377 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: de22edd8-cbfd-4ccf-5735-08dec79796f0
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509F5.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB7782
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH 4/5] ARM: dts: stm32: reorder cs_cti_trace
 node in stm32mp157c-ev1.dts
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:rdns,st-md-mailman.stormreply.com:from_smtp];
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
X-Rspamd-Queue-Id: C76C8670196

In the ST board DTS files, the &label entries must be ordered
alphanumerically.
The nodes became misordered when Coresight support was added.

Move cs_cti_trace to the right place to avoid future misordering.

Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp157c-ev1.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/st/stm32mp157c-ev1.dts b/arch/arm/boot/dts/st/stm32mp157c-ev1.dts
index 0e65a1862eb5..eaab09e1755f 100644
--- a/arch/arm/boot/dts/st/stm32mp157c-ev1.dts
+++ b/arch/arm/boot/dts/st/stm32mp157c-ev1.dts
@@ -81,15 +81,15 @@ &cec {
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
