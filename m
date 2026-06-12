Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 38/+EfYBLGrgJQQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 12 Jun 2026 14:56:22 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 251BB6798C3
	for <lists+linux-stm32@lfdr.de>; Fri, 12 Jun 2026 14:56:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=foss.st.com header.s=selector2 header.b=fpmJTlyL;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=foss.st.com (policy=none);
	arc=reject ("signature check failed: fail, {[1] = sig:microsoft.com:reject}")
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DD48AC8F297;
	Fri, 12 Jun 2026 12:56:21 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazon11013041.outbound.protection.outlook.com [52.101.72.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E6F7AC9AE34
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Jun 2026 12:56:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OhrHHIug05Tv3Y3F2X5Ru+sIHjQN+eJipQ4DCcmFiFYF25EPUNurAeJ7LBfgRUC6/VSoQe06oqFtvccWnfc4Nw2X3wW20Bn5Bxc6f9WNW2nzXvlzhd5VaIjj8H48iXpTSXpb1+HSnzDXlef8Mi8l77wuo6nU9s1gVRah8uOXWWlzVpj/2DRfCj9cWfsAlK4f5Yepeps00HCC7HT7630olEPpFYrsAN5S8PItjtPeyWLCyQ8spstzzSLM/umspJzIDzHxkYZhdt9xvs30kiGDv5Kl2+eWXQ0VBPbzaTF/VL8lL6GR9sqpjqZJeWpB9GXlezTmrhd+xMZW3D6L3DDDFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oOtJvHekvBqe134NJdsNaCbQFFdESqxgqDmFG7Pv4ic=;
 b=X19xc3xJumCTstes4gxr3XcXLtSpPFoR6Ofb4/RuJGWIKQ1d086YcwY+jANbYhtsHJUsEZRtaM2JD2ofeI+0c8oHBKs60YxjvySYl9T0LNTQNg357KqDb41O7W7cwxBFWjQ/RxvTvV6j5d4uAxseLF4iWaJ7OvgTdyaPAP5SghWv/sm5SJ5PhbavqEbec9dgaaI5pKZXEOjHH/lQUWW4yMIZYn7herwcsC/M+6q+d72L6QfHcfqkrlJ17xNFZQ7Y3rvalzEzMX+NejkJ0APNfyYwnGaPZEl6Q6ef3ZQrwKBpDuU/77RVu5gvTSASgiwL2shEZOI8ur4u+T9bMJuyUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oOtJvHekvBqe134NJdsNaCbQFFdESqxgqDmFG7Pv4ic=;
 b=fpmJTlyLgm0tKePZQpIg5aiNPm131SXN0slSwTC4GWSCVMvad5ikanZ2gbabKjVv72ONMRudJUKVShQIpH1KfX+uMk0sPOAhDWKbk6s1aboLEhvqAhPxADsUEkTLkEdJO5CUG7v76TwtGq2Jj0kK4+0TKK1kzMTCZXL+wDY8u9f+AhLRrSoZl/ho5713AA/n9avdqAX/My+hPJydbXf+S69jzo3MPKX/gzFvygKRLJkeYOsktQngt12WTpuSCm29qQzeqpIaBBFeLin0w7pSCA/H3BxCNBp+2ensSy/J/Gym8IZFIJV+YxcLZ0JVvz61h2QcLBID+qPnSU4a5Lf2wg==
Received: from DU2PR04CA0279.eurprd04.prod.outlook.com (2603:10a6:10:28c::14)
 by VI1PR10MB3744.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:803:135::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.14; Fri, 12 Jun
 2026 12:56:16 +0000
Received: from DU6PEPF0000B61C.eurprd02.prod.outlook.com
 (2603:10a6:10:28c:cafe::24) by DU2PR04CA0279.outlook.office365.com
 (2603:10a6:10:28c::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.13 via Frontend Transport; Fri,
 12 Jun 2026 12:56:16 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU6PEPF0000B61C.mail.protection.outlook.com (10.167.8.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Fri, 12 Jun 2026 12:56:15 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Fri, 12 Jun
 2026 15:00:30 +0200
Received: from localhost (10.48.87.71) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Fri, 12 Jun
 2026 14:56:15 +0200
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
Date: Fri, 12 Jun 2026 14:56:05 +0200
MIME-Version: 1.0
Message-ID: <20260612-node_reordering-v2-4-f68032ca3088@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: DU6PEPF0000B61C:EE_|VI1PR10MB3744:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ff3f890-017b-4ef3-4bbb-08dec881fd5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|36860700016|82310400026|1800799024|376014|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 0BbMJeUxFRpsZjBvbbOt2KgRkdJ1m2sUavuKzEeoy8Crt6oAR/V6txU9+yZPGoFMXtU3PCqGwFt/tZaUezv1qOr80fKsSaXWFqN+/jtFfKv0sYHWhzfhyChyjX3sciaGmZpwez4m7aHtaNYq/0RmdZjLJKQ0EWEn39reudfQK1vBAkIbMBO5EYyNxfAxMeG57CbtE0Ouu+8DlflAEwczc4/732uoHrkYFO4sXgH8pnMn8nmlgA8ocD8uZiZljhMPw9ck4rBW13TFD+ssJyYSAcTsaCQBLCPjyI7krQfvZdcH/36/4P39yvnLdaY0NeXkjsZ24UG6SfMVijJDN9T0YGcuYkzWyZ3e0qWyR3eT/SoqFiANvjwhcPBAp+0AGzoXjD0hUJ8QbqOLFRrNcmy+zkfEjwVtGNwVD1xnZdSU5Anvonx+gjxoGwhT1EYTEJsBZT9UbcBwmGemHPeyL25erMLRc+IgUYDRSZJ3rWJkZYZIEWDiUHsWPM2qguojoJXnfehiBsEUzvmiN2fwZ3c3pKvJISWl9oV8U1n4VY+eqH1KxS3ZKcEL0itNDH6GhF5qi70DRxDHJoYCSICUrQ+5rsRHqeZEeGTe+IR2e8CIFnu+PFW8vjVFhLouNSPJpjls5w9NMSus9p5c5ERi4HH8B8YvOH6kBJ7gSJEUeWpABOVyYgN8g5+QkgNuBIIdekSikLR4AcpmOA4XPLWL+hY+57JY09lpTrZswYWLvU/X/Ww=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(23010399003)(36860700016)(82310400026)(1800799024)(376014)(56012099006)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: lbri+Jr/Zaa1eTak2YrxxTnXHtu4lOWr3wbglCq5/WTjzVXy1Fb67xI9qGL3TFsvn+ptq5VoW8VLMJSw+Hp5G52F7GUQPH9IUZ28W3ZIp6Fyb7+INzqA1O+Fl9Aq3qWBrpDntBmo/LpRLVPKyRRpw9rGK2L+9m9J61PoSbj7PFurzfz1Lood+pyHXLkHsBF/KDuaumOSGDDOis2guzxxaHWqwq/R52SiYl828myqgUZ/jJGJKxOumndtFZrpFZt3TSXTXpmapeMGaUKeWJVmyfMaTSSj9g4GzF9Hibl7yy3j+rR5yOmC8y1Fk9j4vRnr2EAntNZpZJMOe6Z5U8wPmiO+3tdZAPxX6OnNNfflpE0FAE8dA3mRRxeBVEYji68iygjjTFyjOqPMmAdX0gp44QrDq1VE4NslcH7Pi5XAi26S75myMXpOCPejw7czQIxJ
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 12:56:15.8927 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ff3f890-017b-4ef3-4bbb-08dec881fd5a
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF0000B61C.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB3744
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH v2 4/5] ARM: dts: stm32: reorder cs_cti_trace
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
X-Rspamd-Queue-Id: 251BB6798C3

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
