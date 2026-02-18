Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SA5PABF6lWnCRwIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Feb 2026 09:36:33 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C10BB154204
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Feb 2026 09:36:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 89AF7C87EC6;
	Wed, 18 Feb 2026 08:36:32 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazon11011034.outbound.protection.outlook.com
 [40.107.130.34])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4FA85C8F273
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Feb 2026 08:36:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CnJk/FqlFJ89T731YE2HmOeWRHHgkLDXNagkvPxseOrwXp+OOnDwmha91ctTcnYlSFLGuol3meqAlJCvi2+KBCLBIWggQAV7n9X6ryJWGy1e3m7kUBrKhA+57+5r7RnlYxVON8/vz33me4AVI3optZS+y3xjnOBkt6SP4D9YpAvDxRfrtOoezJZSBEVRsSIJsZsbftW580BEylLSZD0BUh3dIPP3Q+WpuyiHwAgngkMXrZ0LEYoeH8RRrOxWJY3HhXQUqI6uVOu4c62NUP1IdZaCvxAIGno2Fep3cuogH3xmv9cZW5WA4am3UTiAArFSa3CDxmC0/QqlvePVhxl+Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FdRqN9LmRWbrFSZ+SEujD3fkvb19JlYvgEjll31AiUk=;
 b=jVmQ/JHoj0dqHNWZPMMxBI8dync3PFEHeC7Zh5GnsmUn8yL5+yjQoKIAH+qWKONByrpJm717ng5m4JHVUHnQ3iihcPIzQCbZwFmqy3Spc1C8lxtk1vUblYnXQ8oslyZ6rpAzpbu23/92gs84QJ3E2NQg3pQt5uww43sihuqGnEg84RYVdYUKm65jpAghYMH5JS4QjuVC3eQCN9mJFKh0jeNLwpK6OpvhRzH7ZyLtUnVCPD1iXWJZ05mViGBFXZVuNUqCIXnM74MMJb+SZPSry4SDrwdyBHzkzn8Q5JHkM3d/B+3waznnwfKJVTzzQ/27Cu5KjLoxIv80CsaWXYprzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=lunn.ch smtp.mailfrom=foss.st.com; dmarc=fail
 (p=none sp=none pct=100) action=none header.from=foss.st.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FdRqN9LmRWbrFSZ+SEujD3fkvb19JlYvgEjll31AiUk=;
 b=QlypCfowmw0IY3tw4H5pX5n0Ys7Cv6YMlulle87p0bwwoRZGTXYXt+F4eCHraF0ILiWG3lGY3VqTiXRCIGq5/8Q7+YDg5ZyWhTPfMyug6l8HWXA/jMB+r/HhSlVt6pM3UuB91/c1IYq4SfgO/FzhgYOA1anNPC+BnxsikwoHDldUC8gN8o/ZywgL7XoONsO4qJQAKdZOC1XQwcVqjREeef4OGPjDpVTPEdloxIH7VAlRbY/qxpYsP71Id57MR9zCJTOBgsICg050gI7axFJpwhLyze54AXIAJvixTPzT5x2mn4NiAEtBWs6mSwBd4z7JwdQwL+qtNs/xpbkJ0lV+KA==
Received: from AM6P194CA0066.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:84::43)
 by AS8PR10MB7400.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:613::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Wed, 18 Feb
 2026 08:36:28 +0000
Received: from AM4PEPF00025F97.EURPRD83.prod.outlook.com
 (2603:10a6:209:84:cafe::f2) by AM6P194CA0066.outlook.office365.com
 (2603:10a6:209:84::43) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.16 via Frontend Transport; Wed,
 18 Feb 2026 08:36:27 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM4PEPF00025F97.mail.protection.outlook.com (10.167.16.6) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.0 via Frontend Transport; Wed, 18 Feb 2026 08:36:26 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 18 Feb
 2026 09:38:10 +0100
Received: from localhost (10.252.6.190) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 18 Feb
 2026 09:36:24 +0100
From: Christophe Roullier <christophe.roullier@foss.st.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Russell King <rmk+kernel@armlinux.org.uk>, Maxime Chevallier
 <maxime.chevallier@bootlin.com>, Vladimir Oltean <vladimir.oltean@nxp.com>,
 Christophe Roullier <christophe.roullier@foss.st.com>
Date: Wed, 18 Feb 2026 09:36:18 +0100
Message-ID: <20260218083618.67805-4-christophe.roullier@foss.st.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260218083618.67805-1-christophe.roullier@foss.st.com>
References: <20260218083618.67805-1-christophe.roullier@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.252.6.190]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00025F97:EE_|AS8PR10MB7400:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d215441-0562-4c29-69fb-08de6ec8cdf8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|7416014|36860700013|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zv55qgp0aAegee/l9zfzVUiNyT6m+2LqTlpRauEwFhydjf2hhO9MPzNJoOsg?=
 =?us-ascii?Q?uO7MTmmNriC1cndRLGlZ76WPUnSpWBUlCjkP+QxdJfSpSwGpsVinYlYpAx13?=
 =?us-ascii?Q?A2YNllYPUEGlfbUrPQzY7cefwT4+mb40zeB4IE0jE20Dc6D2mjUfU/wwX4PV?=
 =?us-ascii?Q?6JmvJOXOV/tnG8uJ31811UGegWNbpfcnlqJq7eTzwPOkTAaTW6Hr0fJUjrca?=
 =?us-ascii?Q?UodahuW2yAM4ILuqbjBGkwDTMLnL93qRaEMh+M/xxkkwYvKhkNBB2CtbTagF?=
 =?us-ascii?Q?ZzKyyDcd1ZWXj+khP2H22Iu3eERbk7VGv6wURjff4fqjCxUki0M01a/wc9ug?=
 =?us-ascii?Q?THYlS17NFdfbaPnj1D6p7SPflm6ErDCe8wHzL9L5KO70te5crvbpR8LijurF?=
 =?us-ascii?Q?Xt+/O2Wz7GCIE1uOc6Wq3n7C+P7+wfoV4led+7GtBa+GCJdazY4MBedMNFEq?=
 =?us-ascii?Q?eQPlu4nBrVDHvFX/uD4LujB81fpNqSDdvmsF3hMMi0WlcFdxz/NGcRuF0y6i?=
 =?us-ascii?Q?xvkJ/K4vVJbNkzx2Y1yr0ojyWbJRjEgBh1LNJtIa29fWfZlAqaSlU0uTZRek?=
 =?us-ascii?Q?ioroCBA2r1AyK/W3d7BQMvKhqH7FjcMqGvcRP0TKPB7N8BaoQHF3BfKfDB8u?=
 =?us-ascii?Q?uV0rJym/rmglcIVDsAVcZ9pEjymUys39KSpAJxSeMFpLcKOwoo+tgpMzIXfE?=
 =?us-ascii?Q?skGWEdtYNVofxlshI5CvDiGpzt+nP0cEFgmrpHlERtQboROMGalL3YDeOIrM?=
 =?us-ascii?Q?WuMB8hDVlI2LxK70fX2WwpLxYHzzNonHjnU/oV8RIJqIIn5Ed/aPSqpx2Hbk?=
 =?us-ascii?Q?UiwjEJ6eX65bfC6NivHivgJjF1d8IvYmRbCvGRCYeS8hugfLQfoLfhsCjSU7?=
 =?us-ascii?Q?HLyIAPIhm9tDBWFu5dihRkUW4tTNfsdipFyrPIAnSrcz/huE86vseNBNVUc4?=
 =?us-ascii?Q?jMl58zC4l/ynnhJ+W7qhF6v30H3/P/6YfX+bS+l69ciRGs4e2EvNZC0oCkp3?=
 =?us-ascii?Q?TKjj29NZZD2Unf3/Wf12cCwJs5k8S26gZ/87KBhNJQgmbGl1UHJz91NX/ly0?=
 =?us-ascii?Q?FKjLUmcGjF9B9cc7cEBV4hx3LsXx0CLhH97saUMI1exe4AbZ4L7EGEYf0gXG?=
 =?us-ascii?Q?zd5OehanU/s2URZDa6kF2XsHcxUW/6ZD6j/HnA3Pa3V/PueRucgpwMFCEOSl?=
 =?us-ascii?Q?9+iCycmG+aCk/ixHAFqPrt+yoHG7+S2vgHYA6lJHywirx0htMD73sN3LqFex?=
 =?us-ascii?Q?ti40qSmyvunupOlphObMIA0SRGjPfMLH41FCeMwmo54UTeDy+Bajeg26e5QF?=
 =?us-ascii?Q?9pTU++H6NT0OkF5oSoKO+ezagS3PqyPYE+XHe72xLIW8jQLcpymWNDB3n0fQ?=
 =?us-ascii?Q?E39xa0gsN+3X8PNCZl+VYI7LEymklAuNGDSPlR3OYWCqyAK1MgHLfALG2r/B?=
 =?us-ascii?Q?M2W0e143dqYJvnHPx5/9Sl0htCVuEBylnFMWVU4rfmjo4ddK+tleUr3Og0Ej?=
 =?us-ascii?Q?lrcoXd8lQxjRNsb0tFj4pAWZqE95xgxpxolBIpz9uS3sPWdxqvKQRu8Z6ooY?=
 =?us-ascii?Q?Ag5cV/kV7D5SFjyrQV683dpwOvttxg68qNGV/0Xxopi7/eRDGiXKDzdjLt1H?=
 =?us-ascii?Q?l22vvN+9B7KErSV65l9VXNvSGn5DQX90P1ZEN0Sktr2gYMeBfMscQiHEy+TD?=
 =?us-ascii?Q?34aj/Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(7416014)(36860700013)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: U9H9cl1TDt+8s6IMisbxBDnLTtyrvNscbvUwVP39PVRe47MgpqSDrDW7P5EmOcNgl4/ttgNpw39CMyawWAFmcpzTjXA6CCGqDjkEvWZAm1R5vlWacHH2ZrQFm9iKA9LyyDj5WTou+q1Di4WM2bCs4gIiRNBh7ofjqumd72AjbGepd8DF0BV9DmWz5f5zXpoGETALwNhr3+o4tEkHTFtJHuWPVoUzqyBXmKoMfM9zAhIQXvQAaUpLOJUWwfE55e6Hykcx+sxQE1kIy3egwlOsRrYS3eHvYVoY/at0hBdoQyJViAwlL/JE3OmFx04w6X9uNOkK9zn7d18gzd6h2eqLWTBjgLNL2RVqYInWXJDEdCaUSOWfS6o7BUapj/4T/FU8P3zgk2ODbvLLgCZO/3dxOC0p2xadzZJ6mPxwhQX5sMBAs2xzWR/7QLctIbNn3buK
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 08:36:26.0402 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d215441-0562-4c29-69fb-08de6ec8cdf8
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00025F97.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB7400
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH 3/3] net: stmmac: manage error case during
	stmmac_dvr_probe
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
X-Spamd-Result: default: False [5.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:rmk+kernel@armlinux.org.uk,m:maxime.chevallier@bootlin.com,m:vladimir.oltean@nxp.com,m:christophe.roullier@foss.st.com,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:rmk@armlinux.org.uk,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[christophe.roullier@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FREEMAIL_TO(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com,foss.st.com,armlinux.org.uk,bootlin.com,nxp.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christophe.roullier@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,kernel];
	DKIM_TRACE(0.00)[foss.st.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C10BB154204
X-Rspamd-Action: no action

In case of error during stmmac_mdio_register, pm_runtime is not
cleaning before exit probe.

Signed-off-by: Christophe Roullier <christophe.roullier@foss.st.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 3d4f0e4cb53fb..d8eff228f3971 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -7999,6 +7999,8 @@ static int __stmmac_dvr_probe(struct device *device,
 error_pcs_setup:
 	stmmac_mdio_unregister(ndev);
 error_mdio_register:
+	pm_runtime_put_sync(device);
+	pm_runtime_disable(device);
 	stmmac_napi_del(ndev);
 error_hw_init:
 	destroy_workqueue(priv->wq);
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
