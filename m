Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 1+dfGvEkg2mIiQMAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 04 Feb 2026 11:52:33 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 49CD6E4CB4
	for <lists+linux-stm32@lfdr.de>; Wed, 04 Feb 2026 11:52:33 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F0C7DC87ECE;
	Wed,  4 Feb 2026 10:52:32 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11011051.outbound.protection.outlook.com [52.101.65.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 72C77C87ECB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Feb 2026 10:52:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=da/Iqt0AU26y+1cbvJx8MLBDBPRvYd8e/gAQEFgw39E47/EYwG+n+ZA8+2UDO8xyVrlwcKDOEe+LXSN3IQ1ziaRpLe5oMtYvv+tQ/syFY8f7EQ+IpJK8UiJFA3mIiFZ2k99OAfvKFB5VrmJhxHhmgFnneCSkF6tq4V6hy7rNBe6R0W0cgoxg/UOBqP5eVQ0pM3bdWvKUlDsK0NALptZGTAMakLsjF5JQipLAE1Gw4juH//QwGWwj+QZHJN5/pM3FI9V1unutDUizjUi2HHUDMbSwjqjK2YJ36Yv/Qu+OFK2iQFNFSSR7oSyOyZIpjJH2B/tPcpF1E2hGkknCcYQ2jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OlaE+07dXlPq+BZ5VheZ/M00No/+JHv8SyqC3pXU+Xg=;
 b=nouLoJHhz+OSixPTiAWQxLKlYd0qsxpIbU6EvYMNbc1OeFjfqqmGGlhylT4iXe/aWOTfo1r0Pw1kI+JZK0VaMV8cjfG4v3WXFLYjS9DPRfSlUYn/ws1zndL9dPNt8QhVmIVkVcflBKZKjheidNSeAQnbNc4BXRoRrvERLMzMJsAa7P98/EjtUXwrA5piwqQXxtCOvV3v0ZVaEL1AGFi0tQ61NYie+/LJcbHy7vHAZgAfxynqCgHKELwQNSdvv0RDPtXgaoTdOe2cSa3YyF/bHEO5j/0/OMatxHzL0xGKXj4E8xEb0AfXwgkI5YP1T7jYxGiEg571/PWlJyLFQ+BEAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OlaE+07dXlPq+BZ5VheZ/M00No/+JHv8SyqC3pXU+Xg=;
 b=h/EcvxJYO2pD/neyWcSRtAGuiRwuboJS98h77c5khd7KiGwfZEQuy767UmrFkGLii8080phJgVbk54A4bQwIOK4af46IHz3jJyadw07l2La648chJPSnSNl2j7kr90lw9uAMyEQsBxyiK4MHMJPfFS3orvMaYWScKmu0ZJAUIFoXCRNF8G+4zTSMPndd9bnDfnVIQDVUt5AS/PaCM1tEa7iRrxgLqFItP5eGYjd+Mjhhznv30NLdYGope5WJnK0l0YnDA6UXx/FXM4cKio7NMI8+NMlaHkukM2Hh0ZVitjUCJWkfm1VoMoAWdDVrxKCqsnajkea/Ot+m5Ga1YrPqZg==
Received: from DUZPR01CA0344.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b8::9) by PA1PR10MB8596.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:453::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Wed, 4 Feb
 2026 10:52:30 +0000
Received: from DU6PEPF0000B621.eurprd02.prod.outlook.com
 (2603:10a6:10:4b8:cafe::11) by DUZPR01CA0344.outlook.office365.com
 (2603:10a6:10:4b8::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.14 via Frontend Transport; Wed,
 4 Feb 2026 10:52:28 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DU6PEPF0000B621.mail.protection.outlook.com (10.167.8.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Wed, 4 Feb 2026 10:52:29 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 4 Feb
 2026 11:54:08 +0100
Received: from localhost (10.48.87.127) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 4 Feb
 2026 11:52:29 +0100
From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
 <mathieu.poirier@linaro.org>
Date: Wed, 4 Feb 2026 11:52:16 +0100
Message-ID: <20260204105216.3929071-3-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260204105216.3929071-1-arnaud.pouliquen@foss.st.com>
References: <20260204105216.3929071-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.87.127]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000B621:EE_|PA1PR10MB8596:EE_
X-MS-Office365-Filtering-Correlation-Id: a400e86c-39af-463a-5981-08de63db7e47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?T6vEyjx9lDBrSys1gGoi5ZXWFBeJnSfmDDS83uSjspZwKsdMFLNN4YYtyoMA?=
 =?us-ascii?Q?Rjzn98kJ36JezshHGp53ZBmMai0Va1mdXUK2cdR9xmCd5T0EgZJ/t05dhAae?=
 =?us-ascii?Q?G/Ck1rYLzr7ve2FCnRib+qHY17e6FHOkJdtWM11NzLW8xXTh6ASb2itpqNQl?=
 =?us-ascii?Q?s/ipjH3nR2ozGPOjx9v9tlOdoyqhYCascfnnE3LGoJpJVREggVZOr/rkwUwW?=
 =?us-ascii?Q?+NXKVY2NDRP1wbVIQQ5v0EunkDVYX2E/CSod+ikBqfSRXgQvnV1wQrl3Yxn6?=
 =?us-ascii?Q?JgU7uCS3EQeTwTtkeCZMs47gTYCQeIQjE2ImX5V40l5pJ+Ef+u7e/LayWAEo?=
 =?us-ascii?Q?13cEMRJK8fB2JM6BJJgw/AgDqB0L2/t7z15/Mp46WB5/JF4Xk7KoyRNVTLd5?=
 =?us-ascii?Q?K2lsYL09BV0JDBJyLopYW1eZLadwXGPZ6WJDgMH3YkHTmHguxoLaH0zrV/Uv?=
 =?us-ascii?Q?K/Z7aIxeWfsPrRbKEkyq5rtC2rfR5ORet1ki6rhpSYCc/0YLY5hwFzdaYs6Q?=
 =?us-ascii?Q?jHsWqktwCUvgwBpo80sdkbDjwUOEUi6kd2NUJCzfLPi390855jRoKaJRudQW?=
 =?us-ascii?Q?C3LMaGfpDMYRf2SbxghxaxL0NEf75hXmOz3DKy5vwHpKOWNJXI3owUA3n4Ih?=
 =?us-ascii?Q?P7fkXWh/o+Jj4dRId/CTanBSOQ2wD98fqCQJc0CMrz/9hT4QVNOuRq9Z3PNp?=
 =?us-ascii?Q?5Kuhdme5wxo75r/w/ortW9x2XSHZsOqIFEdtPHE6kHYlKc8BWr6zgTd514SO?=
 =?us-ascii?Q?728XCFhJP2n5CFT5T0tKujFJVzpHlM7Sg1+dxoY9F9kvOXiNffAEUe51equM?=
 =?us-ascii?Q?xaoYj9N4r+sKpqD92yD/jMzaKvNwZ8PlwtTCWNlOZFReq5LF/ce1WpOHiFhq?=
 =?us-ascii?Q?pk8qXsqy8sRTTDspTU57rMtJZYlbgXzklqcGdp8ygKyfehWfNa0mnx/CgmcM?=
 =?us-ascii?Q?V3hN2Hqix1z10R8qGa6l8WPRE5cRH2O22mLTgCc2hvJL+zGGRfVjxGw1H3gC?=
 =?us-ascii?Q?cA0bL/BTaDu7/PWuGd2LpClIsRe9h7MQMAfrC4WEemUIURKTbCNa3nQlRK15?=
 =?us-ascii?Q?Xrhkai59KsQGx5RAxQMLpomhEYGdY9CGHb59cZLcbQcYFkiI6HQBa4U0bDii?=
 =?us-ascii?Q?SRQpU0PbfwgAoCE94eN9XDopL4H457mqhlebeIpEP4D+dbDw/IODJYZRL9lP?=
 =?us-ascii?Q?JZGrTYPaiVqBUDxXCJb3fvJBlMERNvfu0LhLpOip8/62HPc8XKI5J1vA616S?=
 =?us-ascii?Q?U8IpwLjidrRr7vfpkNXz/E/w46UGsKD9lw6458kpOxAdohYlgnZXjFeibl9B?=
 =?us-ascii?Q?4XtBP/6XfJKVEvXU/2Pr9vAjd1rE185nC7bIPWr1hSFKj6Rw1RWBVCBfer7P?=
 =?us-ascii?Q?TmxKAXKytURcTnx4XPHmKBeBSSZ8ZA6Jsl3dQlGvQ/Y/2/pU1h9S6ULfSnZh?=
 =?us-ascii?Q?q0Zuc0xNSl3J2JM/t0ThSW4Cf+GG1yQZNNQJwwyhq1NB89dBLa4CcRwBTMTw?=
 =?us-ascii?Q?sy9DVTWT8i5/odhZFmNT1FgcKKIMvTI2aqlQc4mqr/4bqqw6NZC7SVAHrdLq?=
 =?us-ascii?Q?d/vmgz+9jvxL6eQ0z2WhCrr4yKxrpLEfeYxtBi5tAG62G++TEEhmY9rcz/fV?=
 =?us-ascii?Q?wkL7Ki+inxgdOTEQ0tbq0m4ZnoZY2kkGcWjipRNsuYbVmbsDeBHat0O9/gIq?=
 =?us-ascii?Q?P63xdw=3D=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: EVOqv3bzENAuWWSp58cnekmjydLsdBbRGYvDbngzv2ly2savLkqxd+j9jRUqHh3jeV2GYgsLg67u4J/dMPulbrdXoaZCa9lIfOKCT0C2AveLTfHoS7D5/JhbLZp5ysYlWweYDXxVsauMEihJqWarpVpWjj+y+TMAxbDUv8IojyK8F71/6H6yuH/xXpvVT2e1IWU0TUGm7dIRfKWTjlIWvC9GW4XfBElfXoa+crAMMUa3GVylchKnwl9I5vLsFTgMlyVs6gNoI9G0vxocjfl2rmLlX6MG/FDja0lFmEpYiqQJV7PH1+7EbxXXZPhKUc6BBYVbvJvPyhPi83TsIaT8ZX7j23Yf5VIwyvmAouroAcYJX+SPlWjPcHzEqddPVOh9MU+mrUOEY6TO/r2n+iD/l1kX37F+Y+B5Ss0QQniNL292AS8kK4djF1TglrUYu3Pp
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 10:52:29.9609 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a400e86c-39af-463a-5981-08de63db7e47
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF0000B621.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR10MB8596
Cc: Andrew Davis <afd@ti.com>, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v3 2/2] remoteproc: keystone: use RPROC_ALIAS
	definition
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
X-Rspamd-Server: lfdr
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
	FORGED_SENDER(0.00)[arnaud.pouliquen@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:afd@ti.com,m:linux-remoteproc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st.com:email,stormreply.com:url,stormreply.com:email];
	DKIM_TRACE(0.00)[foss.st.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[arnaud.pouliquen@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 49CD6E4CB4
X-Rspamd-Action: no action

The RPROC_ALIAS definition was introduced in remoteproc.h.
Reuse it for of_alias_get_id()to to align alias handling across
the code.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
 drivers/remoteproc/keystone_remoteproc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/keystone_remoteproc.c b/drivers/remoteproc/keystone_remoteproc.c
index 4d6550b48567..cf8288d17afd 100644
--- a/drivers/remoteproc/keystone_remoteproc.c
+++ b/drivers/remoteproc/keystone_remoteproc.c
@@ -378,7 +378,7 @@ static int keystone_rproc_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	dsp_id = of_alias_get_id(np, "rproc");
+	dsp_id = of_alias_get_id(np, RPROC_ALIAS);
 	if (dsp_id < 0) {
 		dev_warn(dev, "device does not have an alias id\n");
 		return dsp_id;
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
