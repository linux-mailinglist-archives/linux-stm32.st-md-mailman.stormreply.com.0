Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +ITwFIKUtWnL2AAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sat, 14 Mar 2026 18:01:54 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B828B28E05D
	for <lists+linux-stm32@lfdr.de>; Sat, 14 Mar 2026 18:01:53 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 595CAC8F26F;
	Sat, 14 Mar 2026 17:01:53 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010057.outbound.protection.outlook.com [52.101.69.57])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AAEA0C87ED6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 14 Mar 2026 17:01:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dam1BacrLcWzXafcTBM+nWfAQwMOXcktStylRE5GIGlF3NuNCBXMhS/Ctap7O48uPfIinsRHirvqjQOyhRnZjCY9V0bLcVFL1sAmh4MAgpIMazdOuWpNE3azvoWfc3LsPl68R0nneUIsMsR7FUKr0smGHsCHedIJMJJlAq6vc3r9RjhchescHyqBtyr6q8ze104ixCDL9KThRnaSqNO5anlAGgjurJl+yaDSwuRU3OIkyiuIfgfNlinHk6q7f8UPxvGxrO3UuEdusRb0GnTv00XP+PSGDQzlPkeI1EnBsewUT1zN0jkbNtLq9o61OUgwmNdr0rjpTb24AH4OC0kGPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hCYGdF4ICOU0i+x0SN2l4RKaQzjGXLF/BR+kZyfkJ00=;
 b=HAnwn/2PmVXJ95l5qDDmsx1Im6t+JjXSI12dFu9lG/j7ZuiwytI4f7G2CI+iLkd0vNCbp26ErEUUupcoFYpap20/gn3UIS5QsOg3G6+lv1uIdrHKgbxg6nLJgVN9f5g2EmoC1XyZADTnVqRGJONoYbYFtfngfnHC8QSv1jBsB6dTKf5qZVtBT2LxICHXT7DjY0qTgzWP0h9lmYzDyFTuq+LkHoo/Ghd8uLGEIECsTH+kD0bNcKFO2L3bEXzilJ+TMLFbpCBVtvmeMHKR5w+liacXUUwh0Yby05gjAdMm7on+QvpAo/OlehBBudV1ysLQrvSIBvjcd3JU8J6WdqGxaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hCYGdF4ICOU0i+x0SN2l4RKaQzjGXLF/BR+kZyfkJ00=;
 b=lhdrI/ckx+FKHOt2aZ5CMmAnY6K84L1MrLnjiOWWIm5A8iIsFHGZjKEarvxqUoelxlGfRcomzErsFlH8LnkY5NTmkJd4D8UzMrJUSuxUmuMftGx/k0Z0ccoJ3H3ZBJhlQtBVx2Mvx5mIdSdyKECNfdG+ttJ1WUtpWMYGZJM+oWvD4acCYOaJ9yyrkU+xfedl6Ie1gXrfHFR9gH04ueu7WanOahrshuJ2GMOLbu92qw8L5dDcH17XhIlb3t88sxI+sLQY9T2zCj8FOHutIyxOWLf5hqZTsw3tz/40quI4BPSHxtIGoCHamhpOmwTwhbGmEVFlYtl5td9jIhq2Fly09Q==
Received: from DUZPR01CA0055.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:469::19) by PR3PR10MB3962.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:4f::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Sat, 14 Mar
 2026 17:01:48 +0000
Received: from DU6PEPF0000952A.eurprd02.prod.outlook.com
 (2603:10a6:10:469:cafe::15) by DUZPR01CA0055.outlook.office365.com
 (2603:10a6:10:469::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.19 via Frontend Transport; Sat,
 14 Mar 2026 17:01:48 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU6PEPF0000952A.mail.protection.outlook.com (10.167.8.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Sat, 14 Mar 2026 17:01:48 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Sat, 14 Mar
 2026 18:04:19 +0100
Received: from localhost (10.252.24.255) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.29; Sat, 14 Mar
 2026 18:01:47 +0100
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Bjorn Andersson <andersson@kernel.org>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Peter Zijlstra <peterz@infradead.org>, "Ingo
 Molnar" <mingo@redhat.com>, Will Deacon <will@kernel.org>, Boqun Feng
 <boqun@kernel.org>, Waiman Long <longman@redhat.com>, Jonathan Corbet
 <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Date: Sat, 14 Mar 2026 18:01:42 +0100
Message-ID: <20260314170142.18290-1-antonio.borneo@foss.st.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.252.24.255]
X-ClientProxiedBy: SAFCAS1NODE2.st.com (10.75.90.13) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000952A:EE_|PR3PR10MB3962:EE_
X-MS-Office365-Filtering-Correlation-Id: 57dae2a5-a667-46de-a862-08de81eb6167
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700016|82310400026|376014|7416014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 90nwei/dTYMf8aGQwQbhlALq2IPB7BBzlJ0rkMHO1wRJFexTTvsZ5kydQ7Z/mn+0xWgkATvaOAdiMwHvyKNj+Gc4BSHl4d5MAAlGq57cleh6KTPOSsKYwkqSyfetLQAa+FtVMlr+nyJa/YuNEj06/o0hERWlK+Zhf0E8akZC5S/k+rysXbnAcfTEEzTRgcxa/IO+f15EnV8ocGmcPjDSTzeNW7XBncbk474iWtTIuwvMqxXqoDXsIgre3Bk+6vdhlmqiAbeidV1p5qX8pHynZcZJGoK8jPZPaMDXMJ0rhd0R+O5PFo6eVgUsBojcCYKa8Z4iKvUOQMGGm1zNiVXUccGwdRoJ//vRryW2v5vbFW9Grn9hYTQHBJqIHcRVVdl3Bo5PL6PYwRhbHJAFE4HqY5tgrHp27W241El9GJewrWA5EA8IgRkuzxEAZmOOzVDiQVaZnsb7d8EVojA+oyPRmCje9ePIehN7/Hj4V40P7YmIEdfltw2Tht7poT1wHeBnW+ool53xjxty/OgLjihU+F7/er5a02ztUv2vY8jkju/eymNMf6USLAa8B8Rap2qeNRl77nA9Alkk+v8HGagG0aiy37c68Q8ubw4Bbt3MqR4MpsrxaAMKWpER0Lmgc+PtujWDHCIPjMCSD/1BKvQrapp+Ra+nHDiLhLq8fyNEU4jOB5Fmoz5EdGeTHfiUQmn8U08lGsilp17v3Q7F6SAWb3G1a3S75ti8Mx43JEIjnRRzW0RlZASCQo80BEVF4BU0apgp3Nc5gGLJdMJFl2lu1w==
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700016)(82310400026)(376014)(7416014)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: UNhkQ0uIkNf+T9DCCs9KklGfxLvUPIihJvlzX0lZAmVI6ubKvqeP8Gk+fXxZSPZujgX2JoK/8TP0g4I4Yjk6mDoyAsKaoOVuFdndo6q9MgjRpk5xUMBqAdbBOgCqLsz+yOhcYp/dev8XzDE2cfGCWUo9KT4RqsPeZQZzIea98xrwg84nepiuAj9ENWHWkBAAg39+++qxCmUSAV8S4fiSaMH0lJQhsINoI5lO15giLlXBIzxnzA0KOPyxmusx8/t8v3Q5OTuvp24WQ1sjtuHKmbPaejLgNraAmyxTxlMmjqPGQwgA8S91ISC3CyJIbqjDa2rPU0Y6rTlOPs30mta1YDN1JfQLQGCVwHj7l4BybFGM3Ylnyg/lllGM+scf8TaaiwcscEusBOuUKUdbLfobmx0+ujKqr0pT5m9lIS2pDoOZoI4w2/9EiCrg3Gm2+fgF
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2026 17:01:48.3539 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 57dae2a5-a667-46de-a862-08de81eb6167
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF0000952A.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR10MB3962
Cc: linux-stm32@st-md-mailman.stormreply.com, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: [Linux-stm32] [PATCH] Documentation: locking: Document hwspinlock
	bust() callback
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
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[antonio.borneo@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:baolin.wang@linux.alibaba.com,m:peterz@infradead.org,m:mingo@redhat.com,m:will@kernel.org,m:boqun@kernel.org,m:longman@redhat.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-remoteproc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,s:lists@lfdr.de];
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
	TO_DN_SOME(0.00)[];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.926];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B828B28E05D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the missing callback and the corresponding description in the
relevant chapter.

Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
---
 Documentation/locking/hwspinlock.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/locking/hwspinlock.rst b/Documentation/locking/hwspinlock.rst
index a737c702a7d1d..fbca4e7bf4ceb 100644
--- a/Documentation/locking/hwspinlock.rst
+++ b/Documentation/locking/hwspinlock.rst
@@ -425,6 +425,7 @@ There are three possible callbacks defined in 'struct hwspinlock_ops'::
 	struct hwspinlock_ops {
 		int (*trylock)(struct hwspinlock *lock);
 		void (*unlock)(struct hwspinlock *lock);
+		int (*bust)(struct hwspinlock *lock, unsigned int id);
 		void (*relax)(struct hwspinlock *lock);
 	};
 
@@ -436,6 +437,10 @@ return 0 on failure and 1 on success. This callback may **not** sleep.
 The ->unlock() callback releases the lock. It always succeed, and it, too,
 may **not** sleep.
 
+The ->bust() callback is optional. It is called by hwspinlock core to bust a
+specific lock when the remote processor 'id' is not responding, e.g. due to a
+firmware crash.
+
 The ->relax() callback is optional. It is called by hwspinlock core while
 spinning on a lock, and can be used by the underlying implementation to force
 a delay between two successive invocations of ->trylock(). It may **not** sleep.

base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
