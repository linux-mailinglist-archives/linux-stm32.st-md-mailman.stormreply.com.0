Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GApmO4uUtWnL2AAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sat, 14 Mar 2026 18:02:03 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A401F28E073
	for <lists+linux-stm32@lfdr.de>; Sat, 14 Mar 2026 18:02:03 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 670CBC8F26F;
	Sat, 14 Mar 2026 17:02:03 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11011036.outbound.protection.outlook.com [52.101.65.36])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4F671C87ED6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 14 Mar 2026 17:02:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xz5lZZ55QqrcPoZ7gXBRLd++QXruE03NmKbYSt9Ncet0u3YvjpZVtO3CZ8d0WAY07TC3H0T4JrJTBR8vnIeBdZl/81r8hi/fMeg016jwB/v7RtRFfLZJ40t8ucntX36fp9hmHTDeuql/kqsdrVYFn42PxHSl3zWBfZo64vX5CZitXQ6fTtoIKofrHTBdRdUFCtRnwgkVUjIa0AdlZTESkaeqvxgwp0k6KUg6lgPU8YjtRBWMNQgT3glCg6pQMAy5CF+0AlyP3pHe4XVWjtS6i18BZ/qtXp8F92UGbXqVbsKBSV4q0zgwVwb5W5gljTO2jBKcZuf/yFEwqIYD8eLy6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R3cHtxDMxizvF8Rt0l8cvDDuYEqMvByNIz9WMEHOOA0=;
 b=l5DD1MrjLp99owOqzh9l3DbcmKZeDYFkWGbjVwGH7P6H0J2bMNyhhVPql85BzfC7E2d/vUBdoUZmY4LEqGAuHTJ6agBzlPBPEOxaIp7aNh0+2hnpZufDUL9WefWkkrKR6mBsImK1W09H9T8fj6hOTQkcewStJzutWhB/92IhSa7ueTleOXS6UC2ZbXs22ANTu9zDGisrdIkyvcP41ZCeFOz11wCS4/lOIjRYOcXO7X6OljkNyz+aH+gyfldYzEaYlpMBe2kuWMAVFKY2YFUB9zrrKfpLwpyxNbCK2nX6odEUroKxjypZbUow/g3IvfMJtGy1As4tGe7ihuFgaw725g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R3cHtxDMxizvF8Rt0l8cvDDuYEqMvByNIz9WMEHOOA0=;
 b=RSW1M9AuTK3HS77XKcsy8secASwUnRsycv1NObJtJAVFOPpuyivWsylFSGGYoQovsNDpBiU56fJuUU1ulVfyqlNOkopao3TsxNZgjuVmwc81lVWJbXdF67qA53qT0afBYFS6MroMn6olbKgRba6nDCDJsNxspkJ8phgksMZ+Fw/a757QcWCOufj4H8Cp+1ggX0awkEwp+sj7G62kic+XFvGuZNQvX4gb5tDqtmLeG2J3XJHORTkplFgbmDMKxojIY5aNrqOzvwqJOtUJyCmIO83s/OChBdJtxoFMmKuUFMIMGHDeSCaOK+Y7uRNi8f+ww2kKZvBAlHBd1H3jUDVE9Q==
Received: from AS4P192CA0001.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:5da::15)
 by GV1PR10MB8660.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:1d6::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.18; Sat, 14 Mar
 2026 17:01:56 +0000
Received: from AM3PEPF0000A79A.eurprd04.prod.outlook.com
 (2603:10a6:20b:5da:cafe::a3) by AS4P192CA0001.outlook.office365.com
 (2603:10a6:20b:5da::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.21 via Frontend Transport; Sat,
 14 Mar 2026 17:01:56 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM3PEPF0000A79A.mail.protection.outlook.com (10.167.16.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Sat, 14 Mar 2026 17:01:55 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Sat, 14 Mar
 2026 18:04:12 +0100
Received: from localhost (10.252.24.255) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.29; Sat, 14 Mar
 2026 18:01:54 +0100
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Bjorn Andersson <andersson@kernel.org>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, <linux-kernel@vger.kernel.org>
Date: Sat, 14 Mar 2026 18:01:51 +0100
Message-ID: <20260314170151.18319-1-antonio.borneo@foss.st.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.252.24.255]
X-ClientProxiedBy: SAFCAS1NODE2.st.com (10.75.90.13) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A79A:EE_|GV1PR10MB8660:EE_
X-MS-Office365-Filtering-Correlation-Id: d00312d4-3edd-4dcd-e4de-08de81eb65c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|36860700016|13003099007|7053199007|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: XXetjihql6EcYHgXtqMcAoaELj/Pg2xHMrtJhAC6ftzwyNZVUXgpnK3TwsViVnEaPqP8+tNkAQ7Ur1R97kPCL+KdwzYYeYbnxe8d+jSQqHVARcMDhWVZmn6lgujUaJBHifImVYIAtLi4kS8AiK2G8TnsGKG42lt86Go2WnId8PYTYfmppDa167YYfUtWFdR/u8EZI3dOts5/DPt4Je6qjUBe+kmMipqpcnqS4zR8NQ7H41SCktiP0aJCHGLABruWpVMyvZziyYM7+INechSZjHC4VJTP5miQpbpI2VBbYUm6t9tELlE0kDP1pjTJfbnhLxLhWfdG29qlA31rHWAH+EtBj7RxAOti6iiE7wh2tISWjh2qlTGKhN4Wif3sVqdNBN8Y/NI13IxHtH7zTVAekRmk/8DhsXQ67sgy1n8zC9+A9DPnvXTXxOJPwbdqCDH0f3+tPgj25AAkwosdDmZSLJ/EEgnp/yLdzaxxi3WMqjBdUGBFzLaQO/OxM8dthSre0umiKdq9oPtXhkgtKXEuyYbvmz/q7FAv9NCsZfaA8+FmSTUKVvKpnxLWynLo1sQa5uu82uwPZbQoYhbLSBRae+bVUHszWHSuU5YMt/etbtGf+l0SxAmEDIIDyBbd0yW+j0Vz7q8MX/Hh0eYt8Ecx2kuF2yro9phpzypjS/nq4nL3Y9Ng8gwtOWM2cT5izLDwsPXlTwWQH4qAg/bE7XDWTg==
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(13003099007)(7053199007)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ZPBniuvYp61282OcwketbgaUZ4cWkcu2Wf9NDEeOJ9Q3ZdVV4olhxNQHBqtsX0jxJDhqKO+3wx3DY2UJo/Zr0g6x9DIHM3CdjNJwEnE6wttWbbL8/AoQYzD4OG4BobWf5+tck1zBuV+Ptq1G6aUD6qKTfQ74+3oRPtMYecx2F+UqqGWs1BXfUWGONZuVFl9ZtvRM6Wc/6vFNLypnIm3ci+6QWulnkStyYpjU/E77jIw4hFrvOsO8z5pZjXbW4ECMNzRL93fEK7/1DCDhbJHSkcch0Imh+YvOqxecgNgVsj9E9ZyhB+6qSu6S5k02Uoy6OaUzQgc/3rZR/7dlYMgkhYzMVy27VdzYpKrgbDEIGKZiQ4iTh7vwhHGgcxVsauRySAZjk4BVV+vlCFfNAfKXOuzXLP2BFDiXSxshie1YIvlLRb6J4e+g3+/MM3dXwiBY
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2026 17:01:55.6978 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d00312d4-3edd-4dcd-e4de-08de81eb65c3
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF0000A79A.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB8660
Cc: linux-remoteproc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH] MAINTAINERS: Update remoteproc repo url for
	hwspinlock
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
X-Spamd-Result: default: False [3.89 / 15.00];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[antonio.borneo@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:baolin.wang@linux.alibaba.com,m:linux-kernel@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[foss.st.com:mid,stm-ict-prod-mailman-01.stormreply.prv:helo];
	DKIM_TRACE(0.00)[foss.st.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[antonio.borneo@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.985];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A401F28E073
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Since 2021, the remoteproc repo is not hosted anymore in Bjorn's
personal namespace, but commit cc73f503f7ec ("MAINTAINERS: Update
remoteproc repo url") only updated the url for remoteproc and
rpmsg in MAINTAINERS file.
The old repository is still accessible, but it's not updated since
2021 and is not anymore listed in https://git.kernel.org/ .

Update the url for hwspinlock too.

Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 55af015174a54..4afb4a62589e2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11213,7 +11213,7 @@ M:	Bjorn Andersson <andersson@kernel.org>
 R:	Baolin Wang <baolin.wang7@gmail.com>
 L:	linux-remoteproc@vger.kernel.org
 S:	Maintained
-T:	git git://git.kernel.org/pub/scm/linux/kernel/git/andersson/remoteproc.git hwspinlock-next
+T:	git https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git hwspinlock-next
 F:	Documentation/devicetree/bindings/hwlock/
 F:	Documentation/locking/hwspinlock.rst
 F:	drivers/hwspinlock/

base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
