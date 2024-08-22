Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 66AD695AE32
	for <lists+linux-stm32@lfdr.de>; Thu, 22 Aug 2024 08:55:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0E036C7802C;
	Thu, 22 Aug 2024 06:55:35 +0000 (UTC)
Received: from HK2PR02CU002.outbound.protection.outlook.com
 (mail-eastasiaazon11010023.outbound.protection.outlook.com [52.101.128.23])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EC270C71282
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Aug 2024 03:41:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=so4oRbI6MmJWVuUS2qZNDk7CeGKbBooHM/kAv94ENeeVHznCggywQsYaXuONE5NS+lf0BYwfUfilxiJmxc3bRxhy3+xMkeGhvPGJdhb6fkFdYwbdKUVzwDWVSiA6BFBEPqWEkky4T8xPhdJGjJGOdeZCCaf/OMPXcWgF2VRv7LkwUpFZPPRKnjHNiugC8+mQI36DevUE+n14Wvwi3xE52rUuDyvPUqExOk+mExMjUfVLO1KDDbvCyMglAYz8pA60/eMpk9+LTYAnLHRwYygdCWUN1I6i1sQuufrtE6iO+hQenLxOvfYzbFfG3jMNVpcoiQ2JFU8cJoam8QSVgw7RWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DXaO/BUgBs5CEaRD0e7GzAh/qeZYiJTZA+WMYjS5elI=;
 b=unGJSGN4yW/mOGwbIJDbrfyVc4mkI9fqyMSagpPhYRejR3HFxzqxteiNfg8dUtzLiRmqeQil3sYCFJeabsox/Uxb8HVWqMzwlpaVGhn/9NJ4Q7MO6JZ0RxtA0JpQ9gZIYVkjD2ZLWCWV2HcJSsRV5We17twSv9mMguuOAVgKMOwlCcoQ5AV3TYu7a2JN5MWerGHOSIAp7Rs+p9CZl56Lfe197tVVP51skbT6l/cD1fHqbLH/Q9w7bYSI/hLgrg3EszP7l7eqzU7CVUdYoBRZQSxZxTLDDp28R8G8eyOS6NsKF5TmSAhfPQY6sx/75AB3qk0s4WM51FEE70pRn3QiaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DXaO/BUgBs5CEaRD0e7GzAh/qeZYiJTZA+WMYjS5elI=;
 b=NApVhBQP6G4GRGy4LpWAfBKNe80TA4Pjjjuh1zUWbhe+DH2SxTXI4jsB3yjM3HHl1TED61inoPOJsMheCCeOggx427Ki8XX9kQhqErKQC9bSFAz0BN9upavvOASH18/3qvxIwPeVtMdtx/G0fOvoK1uFyWM4i0DPzlrhR58pJ/AZbcIw5fMbd2bxqdW+5LbcoaJ7U40ur9kW3M1P9UaApJZzCGKs3BQXlYwE13VUlOUx6rTfLibSSFafQnU0iZEdcu9XW13eq5tbJBfB7+oGrJIOULx7fOwvZWr9aSpY+q4LnDoP5xloRiPhVxhdwnX8QQNXfyoiDktUXPSXrX8KsA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5620.apcprd06.prod.outlook.com (2603:1096:301:ee::9)
 by SEYPR06MB5892.apcprd06.prod.outlook.com (2603:1096:101:d5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.18; Thu, 22 Aug
 2024 03:41:39 +0000
Received: from PUZPR06MB5620.apcprd06.prod.outlook.com
 ([fe80::b771:8e9f:2fb:ee83]) by PUZPR06MB5620.apcprd06.prod.outlook.com
 ([fe80::b771:8e9f:2fb:ee83%7]) with mapi id 15.20.7897.014; Thu, 22 Aug 2024
 03:41:39 +0000
From: Lei Liu <liulei.rjpt@vivo.com>
To: Paul Cercueil <paul@crapouillou.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Richard Genoud <richard.genoud@bootlin.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Lei Liu <liulei.rjpt@vivo.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 John Ogness <john.ogness@linutronix.de>,
 Thomas Gleixner <tglx@linutronix.de>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Jeff Johnson <quic_jjohnson@quicinc.com>,
 Valentin Caron <valentin.caron@foss.st.com>,
 Lino Sanfilippo <l.sanfilippo@kunbus.com>,
 Erwan Le Ray <erwan.leray@foss.st.com>, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-actions@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Date: Thu, 22 Aug 2024 11:39:11 +0800
Message-Id: <20240822033924.32397-8-liulei.rjpt@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240822033924.32397-1-liulei.rjpt@vivo.com>
References: <20240822033924.32397-1-liulei.rjpt@vivo.com>
X-ClientProxiedBy: TYAPR01CA0108.jpnprd01.prod.outlook.com
 (2603:1096:404:2a::24) To PUZPR06MB5620.apcprd06.prod.outlook.com
 (2603:1096:301:ee::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR06MB5620:EE_|SEYPR06MB5892:EE_
X-MS-Office365-Filtering-Correlation-Id: edaccbd1-4604-4120-76fc-08dcc25c54c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|52116014|7416014|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8raaJyoT9l41r84Yz4aonNVR+MCzHjFN5o7qE5mMiKhKGeUkmBRWzIsfr34r?=
 =?us-ascii?Q?Ks4A8hjdCF3qJxPDj4YGCWZFysgoZjpw0FW606gtOcchxcdot/xSGdt53diI?=
 =?us-ascii?Q?3OoDTXfjfvBfxgPmoxDwksMrYfT6OZzq4VbFGlgz7jvDiuZ0bFEMYxyPXSo7?=
 =?us-ascii?Q?YFkxbO/mUeDhbt3ofqdh2NuDLqeIZG306sK34YgqiX3T+IedqrvmZdP2FPga?=
 =?us-ascii?Q?qNENaDChpv7eoVEaOTQu8fsjADg7hE/04BcD565jmmVdhJaDIBvlK/XmTMtM?=
 =?us-ascii?Q?wf5KScKqIj//t7RtV5I5rza/5IZ8cjglVocxyxdJoy4QTSborKih3JQ+E/N5?=
 =?us-ascii?Q?IaDgxkw0JyZZ8qPPTTwfPEdz0zp/WvB4owFKYdfPU/XSCdaKVhIAmDzDocXl?=
 =?us-ascii?Q?ntauMayhbPyd5yoXdG05sSOPSOMPZWzuqOat8C8F4ayXoPDcafoW33SjOuis?=
 =?us-ascii?Q?opBPWWAzAs4ii760m0bScv6lcAKDplYVJ72DDwRSunsOfTQDavZygbMRm0WV?=
 =?us-ascii?Q?9iorUfThkSSnXF0cgI1tjTNFu2CuMzYwaGTnOJ6ALJWRvMraQj+Vzy0r0QIE?=
 =?us-ascii?Q?W4vfxqXlSsiWHO9bpLGjItis/fQJ4SrlHDbHHjb7CYqMt+uvADJdOnqxC4OK?=
 =?us-ascii?Q?nhKDK3o2hSZVrpJ3kPi0IwgwpsGWxBRBBZklgVsIjGhh7E+clOQbwW+9QzJA?=
 =?us-ascii?Q?Jsq64uwtTlDeR1TzpSc4E4urtBQv2DAgBTJcolygwc8yitTVj53isL3nUauv?=
 =?us-ascii?Q?LWCh9nE87eXTVw+y8CRAKSpzgjF4F27z2u4CLYRTVvQbFEZrA1CcTMKv6MnB?=
 =?us-ascii?Q?zjeQTI4h37KDM2VVM0rqqdc3S/jIWXvBFauCk2EiJrmfLn81ZUUP/RSlobWX?=
 =?us-ascii?Q?d0wxB7cDGcSVmeGzuvH9tLmNpP4gO2w8zf4AcXk6QRoxxN1nKos8i7PBjhi2?=
 =?us-ascii?Q?QyAH3Ds8EnhrYXweA3LQH1XeJrYtviNWC3ppvpKRaPd5CIhNSh0tCpf1KU6Q?=
 =?us-ascii?Q?MZoFkyEcCgMBxqSLzEgBvUSF3Yux9uX5GW7iIp5nz0DZkVUkjUyB2waZNTTr?=
 =?us-ascii?Q?lBMsVqNhRBjTE2cD1cTyQ9/L/VHOiErYbO9naFrwSHMYqeasanlfFcSWsq24?=
 =?us-ascii?Q?q67W4GCKXnk4H0QIn91s16sbUUUQknG5rcTj0kKixcslQ3jBXw0c4x12a7jU?=
 =?us-ascii?Q?bjUbnOkWQDLaBjXS+9HIHCoduL71EWBGZ3N4BvY05J8FVvzba2FWabi3M/8E?=
 =?us-ascii?Q?KvYcGLXIP7NvdqfRImCH6ZRUnUNPGxkV9lBv4mywBTqIXxfLL1vV71Zk5ARa?=
 =?us-ascii?Q?A94R0LB59naCjkemwHrZ8q9IMb+UmhG2G9sIbho1pC+Xn/bLVDuzkcpxMFjB?=
 =?us-ascii?Q?pvx3wNL3SlMmf9XDFvrjqRMpGKkOWdtigtd1ywfnwdBNg50TeZaN/DAXnjSG?=
 =?us-ascii?Q?nsWQSWaEA+0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PUZPR06MB5620.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(52116014)(7416014)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?j86vPhCuL2uHXBEazyGe7I3fJtkvoPacFfILH/A9yvXMOX8LbacKpj9yqEwB?=
 =?us-ascii?Q?YA+kf+gUeaU1YU3lQA+SnTA1QRZWIWuOyIYI2Q8yNeuAWEZ2/vA7fWT/ajKQ?=
 =?us-ascii?Q?URDL0eBfmXBYumWuyJKIv9Di+eWeiUF3oNf78ADXtWRpNy57s4v1r0Ihozwe?=
 =?us-ascii?Q?sh0jsIGKZzqwVQpN63I1rINxULp6Nj+ZqNOzGuNMswQRr1BNWrixVZb23y7g?=
 =?us-ascii?Q?ULY2kRRUl4fkFgxihugc/6brlfADyk+gve5wBxVcpCwvXGVDC/U5T8Hcw3I+?=
 =?us-ascii?Q?eUNSXhZPXYb3RdPxEwGCBHkwRUwl7CIsL82GgI85owrtYcYmeu5Zs0tvCvcC?=
 =?us-ascii?Q?k6nYjOb2MLfbLPQQ5MSTRKfsO1oRnIQSjxhdl8hZ2HRcfOW7OH/Ts6MXNS/+?=
 =?us-ascii?Q?6G/RDHmj6ZBlsqh5OWfSs2/sl2jhC/E29xfFToiJOVebBpLMi18N8K4EhG91?=
 =?us-ascii?Q?V06o2u5XneCHiimPiohj7LqHWf2ICNSOgz7/Qf6/asjbF5M80g8FPjEVsc/1?=
 =?us-ascii?Q?DpcudfRrHtXjbOYYaxPzazedIDWsV3YCNymfYw6tAAyF8/t2nqrobO2Rq9Gs?=
 =?us-ascii?Q?dhvvSH4SZUeyhY9uralCZjD2bdsjJudBpBN+gMG2A1legLNx2Kb4OLiyfstc?=
 =?us-ascii?Q?UtDhrlJWRC7Z9jdfUyRB2EwxsJumF7UAVZpgw7VRza+/CYZwo4vCk32xOzWy?=
 =?us-ascii?Q?IVBcyplVVo1BwjrVCHKy3OQj12Lf+DhZ03Fi9hMCx8BgjYX/DzklV8qee8KB?=
 =?us-ascii?Q?MORaQUvg3daWSbddr4EUVxZmyo0BJTJLKuFAuqFN+izH2GkGKMXEbb4x/3cy?=
 =?us-ascii?Q?K8E6/Rl8GUgreMDj8vuUeSmPUFdf2un3QOyqIKeGopMq9frlB7j6hwlL0Mmt?=
 =?us-ascii?Q?EpjK77HWOoP3yRdY/+MdQfxauo6E5Ohq617nMdw+Vpqwtd7MIVR3O+bC2Zvc?=
 =?us-ascii?Q?xNJs68h1FWUL3QW/T7Lry1vFcJvNZ7nJRmBrMpRZVXjEQxLmcMRQi57q2N7M?=
 =?us-ascii?Q?FytpmCTi5EBYUGv+epOcJXZsy00eoSjkiQshndEoGn8oxnpRTt7fJ51fTdUe?=
 =?us-ascii?Q?F+NJcmmVhD0saauOleO7ky6ihiWtHYWzUE+mu5I1rnQYjRNXdiIWn2eQtvxi?=
 =?us-ascii?Q?V0l96SYjPLxz1CVmWhEsEAqJydbx1k+qtYmwaYIuI7rR4v/JVN9Y1yLMVSxF?=
 =?us-ascii?Q?wa36u7KXUfecKhn1hl59kU4Ayo7optOPeXztk6RLccDP/JjVs7qGnQMU2wW3?=
 =?us-ascii?Q?MJcG+or5OwrxPRXDLR3I2ilMKcjUFoWj7odwa2WggJYWFWK2BuFWjygmwsFH?=
 =?us-ascii?Q?uoFwGgunz6A98zJBS9Iz6pcOetaSH1xLA1x1B+X171x1xHm2CK/xr4PAIN2+?=
 =?us-ascii?Q?TdiNdnOlCi5bOGuYD3qM5QFLMKZ9EfBcOBuAYV4dUSfcQDpyOz/vmZgzG8JM?=
 =?us-ascii?Q?KsLo4SLS6ShOJ6dOVrKELTP1l8HHz+Wd7ITos7dSlUy24lk6WaSYZrZ2Kinq?=
 =?us-ascii?Q?adXuK1riOXAUprY+sDbS89Jhrf8hdJ/t+mG0VCWDi1Xwtlg3UvpTzUEQr194?=
 =?us-ascii?Q?EmjnracxNULJpPwjYcgZV/n7a8qQZ390ixGIJCqp?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: edaccbd1-4604-4120-76fc-08dcc25c54c4
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5620.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 03:41:39.6506 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VD+EhJpekOgGiERZ2cAKMMyaWBNWItyWTeDohYJz8VSXYeZpGVbxICIQSIc3DM2DycVy40Fu91co92EXkHvnkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5892
X-Mailman-Approved-At: Thu, 22 Aug 2024 06:55:33 +0000
Cc: opensource.kernel@vivo.com
Subject: [Linux-stm32] [PATCH 7/8] tty: st-asc: Use devm_clk_get_enabled()
	helpers
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

The devm_clk_get_enabled() helpers:
    - call devm_clk_get()
    - call clk_prepare_enable() and register what is needed in order to
     call clk_disable_unprepare() when needed, as a managed resource.

This simplifies the code and avoids calls to clk_disable_unprepare().

Signed-off-by: Lei Liu <liulei.rjpt@vivo.com>
---
 drivers/tty/serial/st-asc.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/tty/serial/st-asc.c b/drivers/tty/serial/st-asc.c
index f91753a40a69..df666766d50e 100644
--- a/drivers/tty/serial/st-asc.c
+++ b/drivers/tty/serial/st-asc.c
@@ -706,17 +706,13 @@ static int asc_init_port(struct asc_port *ascport,
 
 	spin_lock_init(&port->lock);
 
-	ascport->clk = devm_clk_get(&pdev->dev, NULL);
+	ascport->clk = devm_clk_get_enabled(&pdev->dev, NULL);
 
 	if (WARN_ON(IS_ERR(ascport->clk)))
 		return -EINVAL;
-	/* ensure that clk rate is correct by enabling the clk */
-	ret = clk_prepare_enable(ascport->clk);
-	if (ret)
-		return ret;
+
 	ascport->port.uartclk = clk_get_rate(ascport->clk);
 	WARN_ON(ascport->port.uartclk == 0);
-	clk_disable_unprepare(ascport->clk);
 
 	ascport->pinctrl = devm_pinctrl_get(&pdev->dev);
 	if (IS_ERR(ascport->pinctrl)) {
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
