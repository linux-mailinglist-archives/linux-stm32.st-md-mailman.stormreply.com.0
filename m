Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lREEO694KmqcqAMAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Jun 2026 10:58:23 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 80F86670183
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Jun 2026 10:58:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=foss.st.com header.s=selector2 header.b=WwFxlWsc;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=foss.st.com (policy=none);
	arc=reject ("signature check failed: fail, {[1] = sig:microsoft.com:reject}")
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3250BC424DE;
	Thu, 11 Jun 2026 08:58:23 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11011054.outbound.protection.outlook.com [52.101.65.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D41FEC424DD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Jun 2026 08:58:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mFIxQ5Ga1Ix6Lx2YM9ucHlG8EzGd9Q/DQ2ERBlPXqZI+wtC7bX23QXGmYvJE/VYCu1qK0d3v19WKM8/4Fco/pXS8bBXzfq180IdDLY5uFfVGx96kKud+bGXszRvw5y70WvZaLsz9jTITEk1W30DY7hshnAKYrhEFFgI+EofnBqLA0uj0h84406e5phvGc8Bl3pa+9TLtRSa/PtObdz05CyRkhiO3B/Ddzn6agIEBxYhXkPGWgd4dlMx7dsK7hTRaacJ8bRFWclQOXBTXuIKrFzGZrtMkLEOWtUdnVFj5MY2qwyDer30NTypjjMrwAmhGfjm7KmV3n3+eHhzwFwLXgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6dqEHlphPiaQwMTpf9caERxy+1f8O+MoqKEeqQkjb34=;
 b=u7bgrRm7cVW8r08upgdveKjHb3p7qHuk0mFmeNHeeMbp6SkQN4Upr4bR/p9odX2oTuMaoVQEr7qlzta+nLlwF9IxV7IbTeqOvEhUHzClnB3dCvyorkwe6SIQQD3efWI73gFrtHCracb7YZqSC4TCgDtbEhJmVakvuCiB6tqo8iB4pzVMXH3JWcwI2VDkZS0SUS5ND3t9bNqZUt+HZr1nZHzonkOCVRqpMqIagx8Mkm/wsEUPR3iIouebDdEtqnkPhrCMii2tWPI4Lb6KDdoHAvvH3o3o/I76FObHNT28mHiikOUddH40iSD+YPp7NTj4Bp2v/GyQ1nDesUa3QFkTLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6dqEHlphPiaQwMTpf9caERxy+1f8O+MoqKEeqQkjb34=;
 b=WwFxlWsc3vRTBRnrn/SBB17LJMUJ9uUxRNDXuYUPAkfPFXZJ/FliPy3oPns7qD+n/GRXjpRBjCiC5qfloAdfdown2Qpv7PIW6+BnCq5IkDCVerqmAiI1eX72cZmN5s+8yj05bxa4heb2Cs+rkKDU+d4XZuGuKRlnYPB2JvHF+lBlpP2GQpbw3Licbv0f0L62weYENUl69vWE+HxMdzZfYp8KX+VX/M//e+/rsW7Q5ULW2/E9VzlhXACZZ3rzPUefg5G4OnHYffSJrwY85s4/4gosKHttycU9FnM/sZYk6OqcYFnteN7DAJY/p5AQHOkB4dnpD17HyapXByLRWKqoYQ==
Received: from DUZPR01CA0300.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b7::24) by VE1PR10MB3856.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:800:16d::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.17; Thu, 11 Jun
 2026 08:58:19 +0000
Received: from DB1PEPF000509F2.eurprd02.prod.outlook.com
 (2603:10a6:10:4b7:cafe::2d) by DUZPR01CA0300.outlook.office365.com
 (2603:10a6:10:4b7::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.13 via Frontend Transport; Thu,
 11 Jun 2026 08:58:18 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB1PEPF000509F2.mail.protection.outlook.com (10.167.242.148) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Thu, 11 Jun 2026 08:58:18 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Thu, 11 Jun
 2026 11:02:32 +0200
Received: from localhost (10.48.87.71) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Thu, 11 Jun
 2026 10:58:17 +0200
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
Date: Thu, 11 Jun 2026 10:58:14 +0200
Message-ID: <20260611-node_reordering-v1-0-7e519f2cb456@foss.st.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAKZ4KmoC/x3MQQqAIBBA0avErBPUwqirRETmaLPRGCEC8e5Jy
 794v0BGJsywdAUYH8qUYgvVd3BeRwwoyLUGLbWRRikRk8OdMbFrMAYx2tmqQVspJw9N3Yye3v+
 4brV+emnEfWEAAAA=
X-Change-ID: 20260611-node_reordering-4b9b132b007f
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.48.87.71]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F2:EE_|VE1PR10MB3856:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c7bd977-a99a-4008-0fb6-08dec79794ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|376014|82310400026|36860700016|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 8ZRnrT2eG+3UZQerEi1qu2OWviQcwNh0oU0zTPalTr13aJrLUwe8BgMFuQv47JHc6WBENKjf64qyw8C15uLVXi0EMdA6r1s7CPfo+IPNjhyPYv+BcSomb3Mw+MrEIgmu1ILwqhhjAvadIgDS7MGisTMVf2mpBokUCWo43L7TLvs/tB4lOUNUp9bu0x/xzXcTLdOl8ocPSSa25KtUoStWpM1GaV9afA0aC/RgAQ3R1Q+AAwzMrU1tZkZX1lvn3V4aeewesaw5Swn2VDcUnVOxp/Z2wsttZ7dLEXKL8ibd1i5KT79Hk6QYhFJ00do2Yv/qsDJ8HBa2tBJ5hUE06CbQfrx+RCFqLC3ONy5g80g4PRWZ858MXjvvAP2I02IZ9kxDbAN6SxmdmStc5cJdyDwjIfUrC4yBg70Ao4Ppj4HbnAv0y92spADhAbDdqOQwkVWU76kpXyq5UFqwhsbqdJliF8uNPBFgiwqKP5zqGFqgL1g7BgJbxROzSN7r4Be2Mp44/m44GnMnVdzk2m9eCNnxxdUlvkmXWNaWJ9CLFrK3nEf2Q02Zpq3QawXeKoGJu37ZDDC+T6dUWaLHAtBoZOYZLeinSxMnZEzo7Mj9Sp9rLm2ngSj7vS59Mvoq4hBkSgcjtIHlbvLQRCnforfdaDxbPk4aN044ty21VHkozybZ0FWFlD3rWNkVJbxXfocsvLNyELOebE1tuwqe3+QHRcXy51wL278i6vL8i1YkjTRFqUE=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(376014)(82310400026)(36860700016)(18002099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: nqUNcAB17chJANI3cwn6dQqAygqPxJd953jtjWBrZeYQ9HDAeqfcDz6BfGlCIevR+SwLW29xP8PgAM3Vxq2BtMLAs2tdyJC8ubAQkl62y4pSPdIvhZ1C0DQnxrI8PdGavsNNbWnVpC6C7nRyT66ZMG4Pun4SdG49zNDJ9brFHKWpyAGXo3pcor3EArgjVSCLm8fhiDGrbW6xNKGyq3KWJgWljAPxX+4zbJhET3RpVudSJU8wwbzmPUd/4vL+5idmTG/yMTfJmnnd1cs324tvXXGuR8SNlERnE08hw6gPz8+ONH1x09aakynGAs2QNh7UXW6uVGGnxPnonHa3EKJPtaJ5RRXaRE2/xaIcIy/eGZ5pDmmwYpyLQ6NlvdL9VdL6ohM0mDu8jbo71FdYPuOKrEN/IWTaIMONH2RZO0ZuEEv6tWp9eD6PBtVVtBwgL4vf
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 08:58:18.5707 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c7bd977-a99a-4008-0fb6-08dec79794ff
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509F2.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR10MB3856
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH 0/5] ARM/arm64: dts: st: fix node ordering in
 ST board device trees
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
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
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
X-Rspamd-Queue-Id: 80F86670183

In the ST board DTS files, &label entries must be ordered
alphanumerically.
Over time, several nodes ended up out of order as a side effect of
adding new features or refactoring existing ones.
This series restores the correct alphanumeric ordering across
all ST board DTS files, with no functional change.

Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
---
Amelie Delaunay (5):
      arm64: dts: st: reorder ommanager node in stm32mp257f-ev1.dts
      ARM: dts: stm32: reorder cs_cti_trace node in stm32mp135f-dk.dts
      ARM: dts: stm32: reorder cs_cti_trace node in stm32mp15xx-dkx.dtsi
      ARM: dts: stm32: reorder cs_cti_trace node in stm32mp157c-ev1.dts
      ARM: dts: stm32: reorder mdma1 node in stm32mp15*-scmi.dts

 arch/arm/boot/dts/st/stm32mp135f-dk.dts       |  4 +-
 arch/arm/boot/dts/st/stm32mp157a-dk1-scmi.dts |  8 ++--
 arch/arm/boot/dts/st/stm32mp157c-dk2-scmi.dts |  8 ++--
 arch/arm/boot/dts/st/stm32mp157c-ed1-scmi.dts |  8 ++--
 arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dts |  8 ++--
 arch/arm/boot/dts/st/stm32mp157c-ev1.dts      |  6 +--
 arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi     |  6 +--
 arch/arm64/boot/dts/st/stm32mp257f-ev1.dts    | 56 +++++++++++++--------------
 8 files changed, 52 insertions(+), 52 deletions(-)
---
base-commit: fba4a31a7f3b6b29b01c83180f83e7ed4c398738
change-id: 20260611-node_reordering-4b9b132b007f

Best regards,
-- 
Amelie Delaunay <amelie.delaunay@foss.st.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
