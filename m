Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JbxNNLN4KmqjqAMAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Jun 2026 10:58:27 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B68F4670191
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Jun 2026 10:58:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=foss.st.com header.s=selector2 header.b=ibvX0Zk5;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=foss.st.com (policy=none);
	arc=reject ("signature check failed: fail, {[1] = sig:microsoft.com:reject}")
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7D16CC424DD;
	Thu, 11 Jun 2026 08:58:27 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011032.outbound.protection.outlook.com [52.101.70.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2845FC628D0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Jun 2026 08:58:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hwLr1SzGn+kIdYnGCJKORdOe/kXf2EEbuDmo5BYqsqI6FAwH06247pO9KTha5F6aGTpyP1jmSHwhocgACERT6v1fjYxJNC+zE+S/w46m8Shnm9OBfwewEwyN9NhQhYTzmOCycICydcpnKol0CwEN5EhW6WpWZvEX27gBg8egTTPAPADOyVIuH12ilZ0EXrkQPc+dEbevHOqUTQDUwv55hLKHKWQ71GCygYs5FGN+n+m2HCytZPUgEEvNrYzqZpAEBMG71k1wuXLSl0/DIAhtmo85XpNNBRJcUd6kDfSW3H2t3Vel7sQIpMLoLXPI3yW7+lWFYrP1tC9bA1MQmOR9kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HOyMSCwiLOj1tuFlD2t4jdWXePOZwhWzGQbecD60kVw=;
 b=zTW4GuuNxYAxoss5RFiMGesm6P/y2TJb0IOwZZRhyP3PT5ca3NqKjfqt5aTRY2DazIufeJ5ydtbYB9XpQx5cLU3KO7frjTgv46DCDX+KrxLiOH/b1MUR+aec/y4kxqIL8BSYhV3et9DHQeZMN15OrM2Kidvb9n+FyirHgYXJigZfwBFhAKQxzvM2aEEKUUe8YUcHiedB2NWxtC6erXvLHOj7bpM0svyZXe9vSYn2FEvKNfYy290xGCk12qgZVtFXVD9o+LNtybKrJwZbA4vgJRvVtBnd7oqAdPSLyeKw/C/UHBqhjmlot1G+GDtOOpm+kep5BCC4sdURfl1ZjCZttw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HOyMSCwiLOj1tuFlD2t4jdWXePOZwhWzGQbecD60kVw=;
 b=ibvX0Zk5VYsKaupO6RmnrV/MikkeP3nZPJ+fziEPMUIQL6w+hl3cuA6g1nj//XTvlZZRQEhBDxXEDyD+gElXUeYNC95nR+g9+hQ6BJjFvpfcjMVnefIQhujxAQN+/DTj5+k5Jc1De98Ar3tvAKcLtA/7rVX/8//+bKH1g9EHukaXwGXCPdt3sGxGFzblCrPi58fMXe5i4sUnO+hwgGrLCwxl9soF8/UXUYBYrGAFEy26rnrxjkQJbwqZZq/EOcWTPhnwDWEmVKua0irBNYRqPMuqEYovbNfMZd21lIPDxd2QJoEyyujEN4gvjFexaDQjfGOMjyVt51MAPCAl8cWyYw==
Received: from AS4P189CA0008.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5d7::9)
 by AS2PR10MB6776.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5f4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.17; Thu, 11 Jun
 2026 08:58:21 +0000
Received: from AMS1EPF0000008F.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d7:cafe::a4) by AS4P189CA0008.outlook.office365.com
 (2603:10a6:20b:5d7::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.13 via Frontend Transport; Thu,
 11 Jun 2026 08:58:21 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS1EPF0000008F.mail.protection.outlook.com (10.167.242.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Thu, 11 Jun 2026 08:58:21 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Thu, 11 Jun
 2026 11:02:08 +0200
Received: from localhost (10.48.87.71) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Thu, 11 Jun
 2026 10:58:19 +0200
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
Date: Thu, 11 Jun 2026 10:58:17 +0200
MIME-Version: 1.0
Message-ID: <20260611-node_reordering-v1-3-7e519f2cb456@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: AMS1EPF0000008F:EE_|AS2PR10MB6776:EE_
X-MS-Office365-Filtering-Correlation-Id: b0d554d6-eee2-46d4-1b25-08dec797968d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700016|23010399003|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: KvmcNMND9LDLzgt3GV1UMmWqZdVrG2eTiiu2DNn+1XBlDOYVUtdari36bjnoSAffW1Txb2wnEbRp050y012PixYs4J6lZ4Z0WFqBHnrrOtY51AQCcWVldRa33yG5c/kszY3TdXDoyZ9BTsT3flKRpHlWeesholHADerlUTNgQL9nUb7xOzd1feBz6m1pK7kaa78pM7MHMJ92B6TTJ8teOA2REBI+DZ0eAJVPUD5DTqEJQxUpEboSLkEOdxEfk0KRFpjiOPdRo0qul2sYzahlfyhkWxtNxVUkOLEhZ2nAGIOiF4GwKYINA2gRnV4xOzCkjIIFJxa05MgLo8GYMZAHTM3OBnugOT388q2xSMbVD5TcQ//9nsUXJfxi77WDtSGilrItBw5rETcrzjC++OTfq/fsUxYwruuUMx7kuvYASjp6XQ+9LP0xp+mBkbhFxgQ+ON3yLRfL6haf6PLb1OG+21Jqx+ERy29WRFhWmuZ1B34NB4fRZr6OrqMJTj+VgpFmLs8i1ygnaihC6b8Z3m9gi7xFC/RxqPspIKMZk/iSBLcJ28z2m9Z2Re5XduXdUF0TDkEXpXzk2kn84q1safToIKWG/MsPDMUWYEGMVEFULhONWEGgKogswxQT4LMVxXzluou4+JrvMm0YnwyoIo/ecLusokLpwdN+jy3SzC8CjDBlqaY5gY6Gc0REorISD7hFJ801WQifYtOGyq9rfc+bIS3HbivIHwG/86sl8Le6GNs=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700016)(23010399003)(18002099003)(22082099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: RHgeKuaHxhjl1Xp9PVUWmaTxaNtrI4L67i/YeFn+uxS2hfGlSece+dxU8sJgOfvyz+nb++zBO8R0Yskj4PvPxEYue9vGlzDhhRThMTveNF/trtT3GOo7WdHAeWDOIz3PVBHrHiWhOjF2JfD+mpsQjwqOSO8DvJT5FKtJ1ILK7SONkymlNtBfasfu92yLtIGpxm0x8siX0Z1/nfgoVKSCD2XZ3KVksFq8oSEc9XzwqPM9QDdiZBoENZdafhChzJL9CN6P5+moQZXBvuWwSBcW/xUXWjpJdXjI5uBIZg5kUe6rDL4WUYOwpJuOie5PVT6DJSl0j8P9fX2rorXByEptHvOydnEdGYKg87SeBCI6rHLYPxG+HuPOqlhrnl8BpZzQwK6NEal2RAmDSD7icvUT/Ny4xkgTep1RftTnBT/SjEn416tU7C8Bhxa5Qf1Pjwrf
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 08:58:21.2103 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b0d554d6-eee2-46d4-1b25-08dec797968d
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF0000008F.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB6776
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH 3/5] ARM: dts: stm32: reorder cs_cti_trace
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
X-Rspamd-Queue-Id: B68F4670191

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
