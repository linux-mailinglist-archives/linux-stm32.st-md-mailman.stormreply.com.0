Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ODofHh5U72llAQEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Apr 2026 14:18:38 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A95BC47259A
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Apr 2026 14:18:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 57196C57A51;
	Mon, 27 Apr 2026 12:18:37 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazon11011032.outbound.protection.outlook.com
 [40.107.130.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 79E30C57A50
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Apr 2026 12:18:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uB8CF0Pr5oIC/IgCB00V2j/J8QhRvZJB0BpdJa9+AMEOic+HPqw+o+mmQeA6fvzRaDG0VWxbfO6/TsDNkHy8R8JcOOhdkeuBLhtymhSmh+Sk3ZA11HgIUivK40D+kC0LwX1p4lWhrJ7VaPnvdU0Xuhy5reng182C2nHp+UBK8m3F1tMpX1KeCple3x3eGedsuF9FCJIP8Blb3OxQEJMkfmnJpLKCGfIxRa1ywOXfUcmUnZl50Lk/u3MLfzU5izh39ebdz8dKj2llwINIg3aCVOT7/Tu3unzCtFCd+ZjtFD/KcX/2XF5BFsAoQHbkvKd9P6i13cLlBfy4NRpxrAuUHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cCjcSX3GZD+C81gV+7xIcvFnQJcnYwqQkqPlsPkzXWA=;
 b=KUdlnlXm2jvGZ8Otcb1mmSxLeKc8uti/2oWimGSt0D37Vgu9eopudyeGqgqvyDDFXdXIEQeadZFA2a6fJF+bR4Lubc1AvSB4AkWj9P1b/6wPz7GWe0FmjbJDbnC+x+Ub0KiypJg/6CsD50hDJNhDnImWr6fMJuvphbFFapGK2yPvxJpBC9NIGoIUfB+nsOwdoXkDqwlt64k8Uy9QMKGBPCkKNQ/0V/nSdOBRd43MRaLT2W8CJ+um1blziaXh6UanEfsWS+GtJ21uIuaPSFpb3nIwaNkJAS95yAhdrr+1y2lgYJrIytiaFi8dKAaw5uAbFt1m7lCyjVOhPdzjReY+7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=canonical.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cCjcSX3GZD+C81gV+7xIcvFnQJcnYwqQkqPlsPkzXWA=;
 b=osJ5UrpqBq/92NoH/GNmahSZQ5+NzQ+mSdm/iPOun+AdU6VWC+N7ZpfAuCuAFP+KYGr7JkZpqXcbwjNM1QKswdALtdNtNIbzUB1mh0O3iQT2fwjgYvae46s7fYpRON8zVN6SCcsF4SDpQRXuS97MJVQazEwM0OMox4XndhI5GmesT1LgEd4veeBb1UZTh+5gICiVHYlWfUcRmVA6u/f7+DJL+TCDo18XPCuaS7dZXrqr7h6QXKa5zBSnc2qgk0VnNjZ2qA3T32glsFsBavobpKLSOnIZi9cViyJ1kj0Npn4TuHS6UmkjyQFR8CZBdKy7ABmx4xdzOHExpwFb9c5tKQ==
Received: from AM6P194CA0080.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:8f::21)
 by PAVPR10MB7114.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:318::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Mon, 27 Apr
 2026 12:18:25 +0000
Received: from AMS0EPF000001A1.eurprd05.prod.outlook.com
 (2603:10a6:209:8f:cafe::48) by AM6P194CA0080.outlook.office365.com
 (2603:10a6:209:8f::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.26 via Frontend Transport; Mon,
 27 Apr 2026 12:18:25 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AMS0EPF000001A1.mail.protection.outlook.com (10.167.16.231) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Mon, 27 Apr 2026 12:18:25 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 27 Apr
 2026 14:21:30 +0200
Received: from localhost (10.48.86.253) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.29; Mon, 27 Apr
 2026 14:17:59 +0200
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>,
 Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn
 <lukas.bulwahn@gmail.com>
Date: Mon, 27 Apr 2026 14:17:50 +0200
Message-ID: <20260427121750.173712-1-antonio.borneo@foss.st.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.48.86.253]
X-ClientProxiedBy: SAFCAS1NODE2.st.com (10.75.90.13) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001A1:EE_|PAVPR10MB7114:EE_
X-MS-Office365-Filtering-Correlation-Id: ba097f57-c76f-493d-dd68-08dea45714e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700016|1800799024|82310400026|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: wPDANzxI9rQWd0Gi/+OcSoVmxtZZimTixlQu9p0en/umHJbIKAFddO7K6o52UUseH8UgOsuX0PeFHME4CnD7sXwRzFRG9/fm51o/OB016vU3qsQ+jn4VWZBPfBqxo6CpCTDpDZgjJCSK+7dna+NOnfBLlM8Y+D5fyoBDv3aeYAnU9vHJm4JxKMSZCTQp2ZyK11q4GExyP3oXK7DpPa+XYKv1H/rWH/yQ8sPl/5aIWIuX4BtUBlYgNayXDqWryMPVbzhCBfn2CQRNWfwg10X/jDYpMxcpWCMcx+P0qs9Hn2Qy/3BCDHmUVm1VEWadUo7LAYLgKSy5nPAQHGMraxum/NIkxHKqmXdcwTr/s8VeVWQZPgwEs2kN6LOnsle8q5F9g5x0HCSWKqQhy8nv2juTmptLT53xV4VQkVyxfiDcVVVwj51WFVW7fQXaAxvzZwyguJ8r8X6IExEYd4oAmjvyj3DU7jOUrBTGTZA5O8nC3vOo5W/RfYtc06Q0BJsRoXo5cBxfrsDgvLFqIHjRe/pwA0Lfvw81HJcmKsDENUursCQzfnZ+Rew0U7SbZGeEgP5oLHmhHFXyHxWoZg930dQ0XzzSKuqGIpe9NjHp2SEPBHlwNEbUACGhyU+tZtqLmEgpClKtzFOpS/Qw6TTsXZvetzJpAgbY/a86ELAjHjENYMEd2HNz0f+Wyo/rTDCaICXO5wB6YF7UGtKqqiuVQtBeVhJDwFhm+gnGdCeLdH/yqdPAcfThBoDvTqjYsB5fyxxE8uXYwqFINhbsMwY3kydx+Q==
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700016)(1800799024)(82310400026)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: OQebsguRuA9vIE1nA5JKSFBO0hfpu/RB+VZXwnAi9ciS5t5dhqK92vDU6EPvA4LQPvJxrWuxc7sIOuQ+8IkkPSShz3+yXnMS3oUZKfAAyJP8KM69pcnyfhrLAvBMMABc569KtoXXkYz99svEYYhM7CjVbHvZWda9U/s3+b5htDe0hbs1/dmhNBAYZIEr3zVwM8yxa3Rbk75DKTm/02IX0MAl+DT16HMQ9yyMuGrfSqZTf4uNyu3ulI2Wi4J0on/b2fmJTEBzXb4jUrk49juxQFOmMzimL9OU0LEenMzuW4JADVROzi+9bo9iQlyHB6IreTmQaHbUxJAeiDg+lOgGHhAvr7dZKk7kxVTMXSjekexFybI88QV4BrVwWWeReFx+KlohL4XqCGcnpFV/jnCna1NQtp+UxFQWlg3k9qxX/LeGm7Nj0jtuTsCMzz6DvJBw
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2026 12:18:25.1962 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ba097f57-c76f-493d-dd68-08dea45714e4
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001A1.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR10MB7114
Cc: linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Tomas Vanek <vanekt@fbl.cz>
Subject: [Linux-stm32] [PATCH] checkpatch: fix tab-size use on CODE_INDENT
	check
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
X-Rspamd-Queue-Id: A95BC47259A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [5.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[canonical.com,perches.com,gmail.com];
	GREYLIST(0.00)[pass,meta];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:apw@canonical.com,m:joe@perches.com,m:dwaipayanray1@gmail.com,m:lukas.bulwahn@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-kernel@vger.kernel.org,m:vanekt@fbl.cz,m:lukasbulwahn@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[antonio.borneo@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fbl.cz:email,stormreply.com:url,stormreply.com:email,foss.st.com:mid,st-md-mailman.stormreply.com:rdns];
	DKIM_TRACE(0.00)[foss.st.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[antonio.borneo@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	NEURAL_HAM(-0.00)[-0.986];
	TAGGED_RCPT(0.00)[linux-stm32];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[7]

From: Tomas Vanek <vanekt@fbl.cz>

Commit 713a09de9ca9 ("checkpatch: add command-line option for TAB
size") misses the check for CODE_INDENT where a fixed amount of 8
whitespaces is used in the regular expression.

Replace the fixed amount of whitespaces with the amount demanded
by the --tab-size option.

Signed-off-by: Tomas Vanek <vanekt@fbl.cz>
Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
---
 scripts/checkpatch.pl | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 0492d6afc9a1f..6f290595892f6 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -3960,7 +3960,7 @@ sub process {
 # at the beginning of a line any tabs must come first and anything
 # more than $tabsize must use tabs.
 		if ($rawline =~ /^\+\s* \t\s*\S/ ||
-		    $rawline =~ /^\+\s*        \s*/) {
+		    $rawline =~ /^\+\s* {$tabsize}\s*/) {
 			my $herevet = "$here\n" . cat_vet($rawline) . "\n";
 			$rpt_cleaners = 1;
 			if (ERROR("CODE_INDENT",

base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
