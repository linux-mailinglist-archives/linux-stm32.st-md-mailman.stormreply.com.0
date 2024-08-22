Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F92395AE2C
	for <lists+linux-stm32@lfdr.de>; Thu, 22 Aug 2024 08:55:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 921CEC7128A;
	Thu, 22 Aug 2024 06:55:34 +0000 (UTC)
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2052.outbound.protection.outlook.com [40.107.215.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7C796C71287
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Aug 2024 03:40:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YgAGFxZZIwEwnFhSsOYH/jGPjzCExollyjto5KvgAtGHE41iLRhstl/7RV5Nu694m7AQTc873gjE2I/6r8FhRMvnMGT+NAbqW6MRVUflWVXTmX1Z+C9kWC4SPJYwZWMr2l1gS2qhNpzhUWMhGCrrTIYa69k589Iw9QuHVZO8o9XExMaUR9L6FWHlAmhaP0QEPl0hglnjp0jmhUzKfkGDeWEdKwaYeR/WlC2pJaDflJZhGXxZJRZasRXxNedw7e13kropmKGQexxSkro9+6pWi4xInSpJVwLtRysBXGeDOyQaALc/OB/fkUu5s4OV+VISY6hUyhJ9cIlpFP7BSTSMFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UiZVK6mFjVNSqR1S8r8LmfxlCe/JeulgxB2FxD2lQ18=;
 b=pJZGtXX942Rz0eAPyslr0CWpWvjJkL9Y6hg9zvWNu0chzTrZk8jTj/q6BVzErqWujd8WUQdootH4GKTmaE3jyabAxG37QSbK20KIrX2dbU3EXcNNnDikANbEsPIB9r2EBflXXrBtRy6bM+wTes+yE8TQ4lLHAgRy/3Mgh27aWIaFWFnrXWlNFg7UbBb0PrlZytVkP/e9NSNTsEkBiKhmD+TsHPgDwSLzrKoyzkgTFEDhE/rhnYbvWKngovA9N2bzD4cAdeyrW0KUDTn3UZ4aI2/l4mPN+g2Ya82XdH38HX6omRS2R2Aghily3UwRxEhGVscDC7wpeockN6y3/0n1Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UiZVK6mFjVNSqR1S8r8LmfxlCe/JeulgxB2FxD2lQ18=;
 b=nZSgbW62F5KfDuQREXHu0FJKelvk8GJLAdbfeCSscXyAQ1Zp3pPT3FyHmoe1UmOF4nY4hpSiCE8JLIoPR8/9NaudipmDWmJ8ChwkFeMIL6KAGhCxGisCTYz58lT8tgd48xrWC3ZboeDzbZpUr5tAJv/P3UU2KeCFHPunS9v9/x9AUxe71s9rExyTuv3U4/aT2PzitH0ZOzckzAgHR2jkw2Bv+GNkKREYcpsrEbaDCfPkDAglKwkOwmT8hIVC+CjfAf9pQozHmSDV/DUuS6nuvlnNnUCXgIFt37nGaL/dLlGcnCVxBogph7x7Y2floS8PsJK6kqyq8+A13rjgjRwiXw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5620.apcprd06.prod.outlook.com (2603:1096:301:ee::9)
 by TY0PR06MB4982.apcprd06.prod.outlook.com (2603:1096:400:1ae::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.18; Thu, 22 Aug
 2024 03:39:59 +0000
Received: from PUZPR06MB5620.apcprd06.prod.outlook.com
 ([fe80::b771:8e9f:2fb:ee83]) by PUZPR06MB5620.apcprd06.prod.outlook.com
 ([fe80::b771:8e9f:2fb:ee83%7]) with mapi id 15.20.7897.014; Thu, 22 Aug 2024
 03:39:59 +0000
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
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Lei Liu <liulei.rjpt@vivo.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Thomas Gleixner <tglx@linutronix.de>,
 John Ogness <john.ogness@linutronix.de>,
 Jeff Johnson <quic_jjohnson@quicinc.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Valentin Caron <valentin.caron@foss.st.com>,
 Lino Sanfilippo <l.sanfilippo@kunbus.com>, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-actions@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Date: Thu, 22 Aug 2024 11:39:05 +0800
Message-Id: <20240822033924.32397-2-liulei.rjpt@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240822033924.32397-1-liulei.rjpt@vivo.com>
References: <20240822033924.32397-1-liulei.rjpt@vivo.com>
X-ClientProxiedBy: TYAPR01CA0108.jpnprd01.prod.outlook.com
 (2603:1096:404:2a::24) To PUZPR06MB5620.apcprd06.prod.outlook.com
 (2603:1096:301:ee::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR06MB5620:EE_|TY0PR06MB4982:EE_
X-MS-Office365-Filtering-Correlation-Id: 70796efc-0ab1-4b23-630e-08dcc25c18cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|52116014|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Eu0ziXW3d9LmtmkrMRGEssfWDIDxJDS7bTxQ8hZcegPzRpLVudrusRscVWnO?=
 =?us-ascii?Q?k+LiSs35I5eaDrhLH9fx7g3aW1b4JmqdWfjaTRiHi8m2V1v13rrKA9Z+IizR?=
 =?us-ascii?Q?VKnVG7/TJ4koZ6X4VmP7mMXQT3Qagy0SRIZtR7V+FqkdwSOre6Hnf3HgENbn?=
 =?us-ascii?Q?n3SYSBmsG6BT2lcN3ZupCsZIgfTbK5ELw9byPXTEVj3doECGVRtxO4mC1Bqo?=
 =?us-ascii?Q?a8k0DrcHTpwsJYwEEnEf+5FvAr4ITMDbqZqOPp3JQ6Xu4f72q8FU6/UkXr+9?=
 =?us-ascii?Q?MqdkR+xle2LDl6W4p/poovcsY01VXm6qAkinvcxzn31gNK6NZNSpEkMx5RPU?=
 =?us-ascii?Q?epdvjizk0JjMVQcSSWqJowUBoZuznR8A45Rh1jnkv/59tlnjSYes0wJuX41e?=
 =?us-ascii?Q?4ubaMPthFAxi/uZAilJCbYLZ+g7gUqT/jEbnV83Enox+B1CHHTt4aUB1Rr35?=
 =?us-ascii?Q?UDcWB8c0WR2EeSY7lvFsIoUdh1sVT0pHAwHxAtckucTtE6kS/fYdHwqrKvfH?=
 =?us-ascii?Q?PrXkSFa6HuIGKozkz4/AkSNaB2Q54yQGGBxT4NDQ/aqXJStzUC2Zn8UEKZLr?=
 =?us-ascii?Q?Zrcr2gM4lrkL5ac/TqlHufeiq5kg6PK4QDq2jhsYFLDdjjvwa0l0Zjgdi9Gn?=
 =?us-ascii?Q?jHtUYOuPfQzgH0983PHNE7JCepHkRJHWSsqf5a5aBCiXE1JCfbftkM+xgZz1?=
 =?us-ascii?Q?ledpG94orlg88v6KeP4HEzBn/QLOk20NVte4HVmjYYyN6fFcZ49Aqadm96GC?=
 =?us-ascii?Q?504XU0cKbEcTk2iY2jtVvPqhfPrBTkdDSkiodq3aqhrbKjkI9gBQa/cT38N8?=
 =?us-ascii?Q?OZt7Q+Yxu5bbvAbep5QDJtXo2TyZDGre/yjWLUj6fTr9D1LAuMqjHMhG1ovN?=
 =?us-ascii?Q?lea6pZkxoNDl73BzxFtVYaQxD9ILIMcAkvyJQqzoQMSDCB9V3kz8//XJYabA?=
 =?us-ascii?Q?A9KDqsq8aWj5ls2Ff0wa6knDnWo80pNrslX15zcH3h5cAkjY8eITCeuzRsis?=
 =?us-ascii?Q?AJPFfF2W4+Fvx3vLgFhubO7T5rcwH93XobHAtKoJZid3vTIIF5lT80qGmthg?=
 =?us-ascii?Q?nH0Kaj2PZUgLJY/gaPaMCpqDg11RTaMGprkFkiaOdoC5XilPnVS1sGRWbujh?=
 =?us-ascii?Q?8157dLW8iVWW8MVGVpoT7kg6oqRKJbpeEZXNC5a69eDNLkhkPCIJrvsq3KDF?=
 =?us-ascii?Q?D0SKx+0CghZSIhvBV4xnzg/FcPaddbJai7s7GcXMbvgQnJYroDsPVtyLe1lh?=
 =?us-ascii?Q?Vu3lDWr/g/uoDO5zpIL6hy6m4/7wpBF8EouskecyXs7LxXGvmJAbtrDBo9h/?=
 =?us-ascii?Q?h9poOJgRK/9y1vTeRna7hZT2AoljbkFCTBC5es/6nNB/k4PgVk5Lzpauh+dQ?=
 =?us-ascii?Q?i6qBVQ7ZoL6XVv3ihhqagBBTtzq5Bhg0iKGQKmbSCJ6mV+Q9770xJmX2FgQw?=
 =?us-ascii?Q?7pM3fllN3E4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PUZPR06MB5620.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(52116014)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zilX5i/S0EK2BJZP9PCzezZhJud1jrQ2ypprTDCIk3lAFGnuNCnmo475QOTq?=
 =?us-ascii?Q?2SeKRr/s8pTIT72qkIpA5kge1pbCSgXdAuaveJZskUByF8vdAXYDxjZUx4fW?=
 =?us-ascii?Q?4bXQ5jVa9FUrsCLCe4zKFpStpcHUEeDIq9Wi+J5LsC4X7HiCV1ULex8lnasR?=
 =?us-ascii?Q?sJAxRxKZnmIay0hmtNkJRCyDdy8DTyB7lhetu8Mu//xeb7rFndpkxgVjb6Y3?=
 =?us-ascii?Q?E2yoooYm08nvcOvORpNSd8qoOMW6bIEN7RZq2gh5f8O+Q2bLAtvxIJDIDy3q?=
 =?us-ascii?Q?91RFuQA19njlLpL1+WSSl0lc6OpV3MED+bg1tS7URvimxdQppBRloc5iMuXn?=
 =?us-ascii?Q?1nMtnnvdk6U/2VbRiES8jQF8/PSmiKoPvObeLjtbCaPjzqlweK1VyrbxmA5v?=
 =?us-ascii?Q?5EuAvtMtkRd6OEk3tV4EMeIvgZa5gPzMOtIn53bHrGKBYAC5o7Kttj/BE+sd?=
 =?us-ascii?Q?2v0cdVIwKzQLj9DVYlw5oPmONZ7s/yh03QI0iISh7tj2zHw66sgsrZvUC9GY?=
 =?us-ascii?Q?w5nL2nbwlEkYU95lzA8pdYkeFjARDhfnBvcv1Hz9BTZvSvpw2wsD2p0guq/p?=
 =?us-ascii?Q?IxFntpgRVn9jHnvKbmXWDIODgZbND/D4IzA8fqpRBRHQSlVvRswTGsy+X37b?=
 =?us-ascii?Q?XVNHFV/VKZ4fpSQV16LblbMEd41zwgTKDY1SIRd8e/ReN8aKykKUhc9r8wni?=
 =?us-ascii?Q?McTT5pxYgtCVKH8Dqf0EzQaBDeMqkQOg/Ey2/oJrYQ1KWJuIy1ssA5aLgAyq?=
 =?us-ascii?Q?Gxaolq0IrJHAGSZkIZndVzO0LGLKL8EjHGYnnxO/cTH658ogGSdV3UT4Os7/?=
 =?us-ascii?Q?Mz2GrL61tcawrpiXyGlg7kPvraluaoliwMU1PUc+5Y/+M9DmwGWx3nJo7pfB?=
 =?us-ascii?Q?+dPffGb0wskqVqLiH3K+eHWFETdOWpfHKV2bii0Q8Xj4el56xhozCfr41T8X?=
 =?us-ascii?Q?1Il4aVf690b9i8GQ8DW1rBXxrMjmKvH7nuLvXmWSO+L5MW+dACSoH4UOaYyy?=
 =?us-ascii?Q?zRb1pKyK/bt6qaMSgrah9W0ghVL4JKeeJcqRMQ2rPfEUm6oSd2YbjAEOJCjK?=
 =?us-ascii?Q?IQfZaxPMykg2pPmIpK/uksEFA6NT0C9E+lry4PSbEWwATD/gxywI8Q8YlszF?=
 =?us-ascii?Q?wI1Cll1De+jy80JSGsXqI1QNKaiTH8UVlosbmFNSbmHlxdT0Sz1/uvsF+74C?=
 =?us-ascii?Q?31/lmbvIyLi8x02mE6pIu9zpmpTT+WpIs8aUdUTOB7S1ONoVjmq6ecWcMsO2?=
 =?us-ascii?Q?q7vmjibkysiyOdu5U4BgCNSvQMxDh98lG+GymIF3DiwTdZo35UE55Sfm81J4?=
 =?us-ascii?Q?m+qvN93MNE1zUgGZFk0Ot2cvelkamMVbxTwCuvEzw5uhRisceQq/kjCszbjs?=
 =?us-ascii?Q?bsxOvuBrTgoA8x6TF2dffR6+JtPocXx2krZ9m97qHRJe0kgNWRyN3t77bo0z?=
 =?us-ascii?Q?+VTYfgX+I/8kbvWiChU87XvfOKgUTAUfKG19dmuwGylvtP051Hlc7+jm9HSs?=
 =?us-ascii?Q?I+ipa/52Fm3Wj+9+SqwmDrn6bNIJfInQxV8LSjSB3hmtlNrZ/vcIYSCSW2NG?=
 =?us-ascii?Q?afiz8KPasLtpusUHgwMOxZ5BwprQkOzkrsTO5IBa?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70796efc-0ab1-4b23-630e-08dcc25c18cd
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5620.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 03:39:59.1991 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r2UMZpRAk2ao4UQFIy0cr43pbAs0BmlkXfOgYlnBXazjnmBB9sf6Iyoxoac0oeTfzHRmSCjM/S2lT0ORViAlKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB4982
X-Mailman-Approved-At: Thu, 22 Aug 2024 06:55:33 +0000
Cc: opensource.kernel@vivo.com
Subject: [Linux-stm32] [PATCH 1/8] tty: 8250_ingenic: Use
	devm_clk_get_enabled() helpers
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
 drivers/tty/serial/8250/8250_ingenic.c | 26 +++-----------------------
 1 file changed, 3 insertions(+), 23 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_ingenic.c b/drivers/tty/serial/8250/8250_ingenic.c
index a2783e38a2e3..5f8787309064 100644
--- a/drivers/tty/serial/8250/8250_ingenic.c
+++ b/drivers/tty/serial/8250/8250_ingenic.c
@@ -274,44 +274,26 @@ static int ingenic_uart_probe(struct platform_device *pdev)
 	if (!uart.port.membase)
 		return -ENOMEM;
 
-	data->clk_module = devm_clk_get(&pdev->dev, "module");
+	data->clk_module = devm_clk_get_enabled(&pdev->dev, "module");
 	if (IS_ERR(data->clk_module))
 		return dev_err_probe(&pdev->dev, PTR_ERR(data->clk_module),
 				     "unable to get module clock\n");
 
-	data->clk_baud = devm_clk_get(&pdev->dev, "baud");
+	data->clk_baud = devm_clk_get_enabled(&pdev->dev, "baud");
 	if (IS_ERR(data->clk_baud))
 		return dev_err_probe(&pdev->dev, PTR_ERR(data->clk_baud),
 				     "unable to get baud clock\n");
 
-	err = clk_prepare_enable(data->clk_module);
-	if (err) {
-		dev_err(&pdev->dev, "could not enable module clock: %d\n", err);
-		goto out;
-	}
-
-	err = clk_prepare_enable(data->clk_baud);
-	if (err) {
-		dev_err(&pdev->dev, "could not enable baud clock: %d\n", err);
-		goto out_disable_moduleclk;
-	}
 	uart.port.uartclk = clk_get_rate(data->clk_baud);
 
 	data->line = serial8250_register_8250_port(&uart);
 	if (data->line < 0) {
 		err = data->line;
-		goto out_disable_baudclk;
+		return err;
 	}
 
 	platform_set_drvdata(pdev, data);
 	return 0;
-
-out_disable_baudclk:
-	clk_disable_unprepare(data->clk_baud);
-out_disable_moduleclk:
-	clk_disable_unprepare(data->clk_module);
-out:
-	return err;
 }
 
 static void ingenic_uart_remove(struct platform_device *pdev)
@@ -319,8 +301,6 @@ static void ingenic_uart_remove(struct platform_device *pdev)
 	struct ingenic_uart_data *data = platform_get_drvdata(pdev);
 
 	serial8250_unregister_port(data->line);
-	clk_disable_unprepare(data->clk_module);
-	clk_disable_unprepare(data->clk_baud);
 }
 
 static const struct ingenic_uart_config jz4740_uart_config = {
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
