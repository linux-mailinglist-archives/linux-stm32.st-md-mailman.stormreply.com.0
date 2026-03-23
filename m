Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cMOIKuYcwWlaQwQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 23 Mar 2026 11:58:46 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C81B2F0AF2
	for <lists+linux-stm32@lfdr.de>; Mon, 23 Mar 2026 11:58:46 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DF7B4C87EC5;
	Mon, 23 Mar 2026 10:58:45 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11013059.outbound.protection.outlook.com
 [40.107.162.59])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 81DFFC36B30
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Mar 2026 10:58:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j1IW0beIyrCeIKowKkM139DFC5gtL6y+pgH5mseJHyUw82jHd0Yt/7k1IxeF/tQaRwqQ9nLd+L7JPo4gHt4TkSBf9qWs6zNbaBUxTV8dosfPwfgnPoqDLeUbqhSsjneqQcyIy9DRceRvFM74vJjtV7vCciY2ZXhbSjgWAFDZGES5D1yw1n1lixGT5MXmBHqvlNsvea8u+qbMIywfECXhfCeUY/jsKAvHdrc3n0Zxxtk0R6p00dedI41jdlamtd+uR2FwiQhHh/hZh0B1mYlqR1KLlGvFx8D+kOXCBDdtXKuhnQzZBKYtU/8FBAMObKDwcu+tZT6RIMV1V7brmWd3Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rWn6mI0wWT3Uou3PQ6c89u9FniXgctkYSOnSgYCZ6sE=;
 b=TYvMDvijy06tmWgeqHkhDyOu0ALRrZPIx6B0PvpIhLLI984qYtqMJyP5PPqaoGPHLCqQCj2eIJ9Q9+/6OA91KuR3VFca8gEZb1JWjsmfvWP7wWoZN58JaT88uZLZ228evun0r1gqjnsogJwtx/EJNgNarSlMKMygaIHQgYu1GOsU4dypU4nCPXH2QZ7W+j7BRJ323zaROfQYhmh8Mki1JULvRcbcWwPsErJTq/hkvu6G8rBAPkQhEfSn+iQjs/YM735g5j5m0MOwPwvmUkOVU4MpopDH/WN6hnjR6GX2r8gTRGpmTmA/BevNh+RGTelmzqFnFarlNO2eveLGNyv49g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rWn6mI0wWT3Uou3PQ6c89u9FniXgctkYSOnSgYCZ6sE=;
 b=f3fzZHc5xclAANwWElz1AsFXWJeD4ECAR10n322GM1IA+b2eQ9rrokMua6rdAJjw1oZsaFNtuKukzOIyEMq/1Bzu+kBzzZRpOA/UX/pOfEQKdej5D8yOC3gRmPYOvCRBXqAOZLUfZeFdf1HhoKTgIK5ubyhLZ+TqFD446xhMUgnGY8GnBgbrlMI0n179xM5QtXrtWtzo+gzck17w3pkKdDlVDD4mCGikr9n8wmTFcfiLdpSKoj1EP+9Q6GwHjCFDbKoIq7guSEIHOy1p4JMklRPNZXYoSHQqCZGdDva5aMAor3U7bI4XZSxwvdMc/qJ2o7ztxCAy0YyY8eEtNawCHQ==
Received: from AS4P251CA0030.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:5d3::18)
 by PA2PR10MB9077.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:41a::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.23; Mon, 23 Mar
 2026 10:58:41 +0000
Received: from AMS1EPF00000093.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d3:cafe::fb) by AS4P251CA0030.outlook.office365.com
 (2603:10a6:20b:5d3::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Mon,
 23 Mar 2026 10:58:41 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AMS1EPF00000093.mail.protection.outlook.com (10.167.242.90) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Mon, 23 Mar 2026 10:58:41 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 23 Mar
 2026 12:01:30 +0100
Received: from localhost (10.48.87.74) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.29; Mon, 23 Mar
 2026 11:58:40 +0100
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Bjorn Andersson <andersson@kernel.org>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Peter Zijlstra <peterz@infradead.org>, "Ingo
 Molnar" <mingo@redhat.com>, Will Deacon <will@kernel.org>, Boqun Feng
 <boqun@kernel.org>, Waiman Long <longman@redhat.com>, Jonathan Corbet
 <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Date: Mon, 23 Mar 2026 11:58:38 +0100
Message-ID: <20260323105838.230314-1-antonio.borneo@foss.st.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.48.87.74]
X-ClientProxiedBy: SAFCAS1NODE2.st.com (10.75.90.13) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000093:EE_|PA2PR10MB9077:EE_
X-MS-Office365-Filtering-Correlation-Id: 8acec780-33b9-42fd-92ee-08de88cb2521
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|82310400026|1800799024|376014|7416014|13003099007|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: dQw32piC3AM8vsWsDZlPCGCpRy3AwzpMPAQeGFgbr5Ti5tMSfgC+5hx72psi8OwVN1JnndzxLGTYb3b9xfLNtXz/MHd1JIwVlREIIZQgp5dwuykKlqI6EucDF84VCjjX2yDJqlQiTlVPGo1JQttIcgZdFnpwltEsNwxm07GJDPAsS/ZtciGodvLAWPyuniMP+nxwr6qoExIPFCXEf3+AU01IUiiQ0KjBcL/yNe09Jups98uos9M8c8elupd4r4HzlMkpNbw/qiadTEhllS6/0TN2piKPPI6xmKNPozyn1X8Evs6HSslD98BVoNEWOjW2ERRc0YenZXH9dT/4ZeW5YDXmdfKCsTg25c5HVPCmxoIWki5zJaHjXZEqElf0LysSBnOQlTXRsOAlva+l0pPCxELeh340vtOjRex+GRcrxgHtku60WZIhFiSU2JPx1xnpdf8lXry7xrNlntgZQzaET6Um+eybHWEpH1v/Siw3Ir+veH9HJ2tO8Tm2HTodBOvzyP8drWqMZ6G4f4xzRgRPL+JoJ0YKIs3eUp8TGI1fXXxsMAPRt/otRzSrS5vPw8vmEhJe9CpcJxJolr3FHWhQ2DvQ6yHIrCL4oTwS/5X+X/I1Yi9nr1KND3PGozb1o7RYZy3gTY6HjRtC+sO+cbqdXkFwTWN2IQT+lCZYF5BMii92uFuYC+3graMHr/KuC8eq3WbW6UZN605PByzz9fT8Dg==
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(82310400026)(1800799024)(376014)(7416014)(13003099007)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: alnXSdqaAV7zrI0OiqDIsOuMhvxQtoHoC/7bLtYHGplAyslBUNZHRdcw+yFxx+N4ybLviibEATqSr5qq0b5hOpnOKdRPFHtVQgsC8PbN+S8m0jOH8MWmGhCx0nlRUjqZJLZrvE6UYgKHuH/WCggnrHBktEfWagkPGArYTJ+tA6LNfz4owRI8b6DCNs+UgRTgSx+Tt7ZjEcQ/Km6B1uD1J/QMSgPjge9V8qf4lO4Poc9Z7sPLzZTBG9I4H8XN7n9tq8cnDETJ9PDFw+cQkF4AVnqsmDuVRBcTZdlYxKSvxPj8NFrwkOLz32c6d5j1cUUlFcMr5J3ak2Bez0APuew53m/Ka4finUK4LzXBrMe7nIsXwSn/KIva1Eag0doTkr8OJnB53TdTsq6KLqJWgNnIis6NX/ohEK0h2/2Rya3zzShlVZq6zBnUFDPG6i0umZlL
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 10:58:41.5018 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8acec780-33b9-42fd-92ee-08de88cb2521
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF00000093.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR10MB9077
Cc: linux-stm32@st-md-mailman.stormreply.com, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: [Linux-stm32] [PATCH v2] Documentation: locking: Document
	hwspinlock bust() callback
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,foss.st.com:mid,st.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns];
	DKIM_TRACE(0.00)[foss.st.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[antonio.borneo@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3C81B2F0AF2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the missing callback and the corresponding description in the
relevant chapter.

Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
---

Changes in v2:
- align with review from sashiko.dev:
  http://sashiko.dev/#/patchset/20260314170142.18290-1-antonio.borneo%40foss.st.com
  - update the number of callbacks;
  - report the returned value;
  - report it can sleep.
- rebase on v7.0-rc5
- v1 available at:
  https://lore.kernel.org/lkml/20260314170142.18290-1-antonio.borneo@foss.st.com/

---
 Documentation/locking/hwspinlock.rst | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/locking/hwspinlock.rst b/Documentation/locking/hwspinlock.rst
index a737c702a7d1d..a5fff33181c1b 100644
--- a/Documentation/locking/hwspinlock.rst
+++ b/Documentation/locking/hwspinlock.rst
@@ -420,11 +420,12 @@ initialized by the hwspinlock core itself.
 Implementation callbacks
 ========================
 
-There are three possible callbacks defined in 'struct hwspinlock_ops'::
+There are four possible callbacks defined in 'struct hwspinlock_ops'::
 
 	struct hwspinlock_ops {
 		int (*trylock)(struct hwspinlock *lock);
 		void (*unlock)(struct hwspinlock *lock);
+		int (*bust)(struct hwspinlock *lock, unsigned int id);
 		void (*relax)(struct hwspinlock *lock);
 	};
 
@@ -436,6 +437,11 @@ return 0 on failure and 1 on success. This callback may **not** sleep.
 The ->unlock() callback releases the lock. It always succeed, and it, too,
 may **not** sleep.
 
+The ->bust() callback is optional. It is called by hwspinlock core to bust a
+specific lock when the remote processor 'id' is not responding, e.g. due to a
+firmware crash. It return 0 on success and a negative error code on failure.
+It can sleep.
+
 The ->relax() callback is optional. It is called by hwspinlock core while
 spinning on a lock, and can be used by the underlying implementation to force
 a delay between two successive invocations of ->trylock(). It may **not** sleep.

base-commit: c369299895a591d96745d6492d4888259b004a9e
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
