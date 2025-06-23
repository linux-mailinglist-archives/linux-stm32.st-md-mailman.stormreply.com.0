Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 198C9AE3B68
	for <lists+linux-stm32@lfdr.de>; Mon, 23 Jun 2025 12:00:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D69E1C3F956;
	Mon, 23 Jun 2025 10:00:42 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11011018.outbound.protection.outlook.com [52.101.65.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5C148C36B2B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Jun 2025 10:00:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DI5pCpMd5/o7Zkg5y6S/pBi+FM3s3i9lk5YOL0WPeFA/2ZI1iU3GH7xHyr396rT56R2/NIamMpkkODrzmsPPmmrkeDQi46sar7VMrf9q0Bce3BR5dYmr9XhuB4CWKjsTfmz26y5nt52w4tKwnMWYXYuzk69vrI4beLo+n9rDa2SsUCROr/WSwYlIOtuN/aGYPsbWmgzwA1a953QVeJVAvtCw4+QRKyLqk5BWROPNS8eHjWXvVfUXOy/bS3J1LPsH2q8FviFmOJ/Vg2Vv7X6RWTB37rChOYxVf4E0TaA7HcRq5+uro2W7za8mI9gYuh2Bn952n98HZAPNWkn1B3S94A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bqB4wUHixpCre8wzmEniBIBtzGuAS2riaOkSF5iFvtI=;
 b=SYpmuEil5WKVdoMZwOC9IvWr9Z+OaGeJYeKohARFD0RrlV3Brdh9W/X+Qd4E2taVPLTT2ewdrDEgxx/866WkinagKq0aZz9seitpu2GipFDOQ7u7jrW9+TVaaf5MlntzqVqxhthLhUDCMaxgCxGTSRmZcTdEW9JcjzQ7RxupdWtYc9OCo3VmEM2xol9TRMcKiH7pGb/f8rhRK/ye3zDhtuWC3sdT+FI66r/7Q2EMQBtMlom6En36spkG7csdBNIAcSm+cHYGCIvqlTfELGv4Y+6jxfpP7lrbONdKT4QyjXko7hWwg8SIj5HPfCfm19/U8XAWRdJ84OlLVVjnAzrKoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bqB4wUHixpCre8wzmEniBIBtzGuAS2riaOkSF5iFvtI=;
 b=Aj5ewtVgl/F1aoSq75hmXJy9C941c6ihfXEe+MjOMrK1H1ZBdqBKDDVGHf/vG7+Due7YvgGtpj+zM81eTr52QXFNZAnw2P38RpQ4I/oiHq4YmsXMV6z9fhHun7OioKc4ksz+am5/jt++3alFUYleWsPTvwuGhR/fPZsHcWz5Z5rPO/BI5N4BRB71JcmQuxP4gaXUsIdeQvIE3ZjuYr9Opg+xdKcdp1cjFXxX+GiTJs4FYejs8DKpn1Hxj5c6IoiD8/Ci7Tb6lL744O3/CVswDeDhGKNMfFFRYn1GF+kPRV/mAHWpdXEY5O+EnNnVqyliqYQOTkVJYDqFE0usqNU87w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9386.eurprd04.prod.outlook.com (2603:10a6:20b:4e9::8)
 by PAXPR04MB8256.eurprd04.prod.outlook.com (2603:10a6:102:1c6::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Mon, 23 Jun
 2025 10:00:40 +0000
Received: from AS4PR04MB9386.eurprd04.prod.outlook.com
 ([fe80::261e:eaf4:f429:5e1c]) by AS4PR04MB9386.eurprd04.prod.outlook.com
 ([fe80::261e:eaf4:f429:5e1c%7]) with mapi id 15.20.8857.026; Mon, 23 Jun 2025
 10:00:40 +0000
From: Joy Zou <joy.zou@nxp.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, catalin.marinas@arm.com,
 will@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 ulf.hansson@linaro.org, richardcochran@gmail.com, kernel@pengutronix.de,
 festevam@gmail.com
Date: Mon, 23 Jun 2025 17:57:30 +0800
Message-Id: <20250623095732.2139853-8-joy.zou@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20250623095732.2139853-1-joy.zou@nxp.com>
References: <20250623095732.2139853-1-joy.zou@nxp.com>
X-ClientProxiedBy: SG2PR04CA0159.apcprd04.prod.outlook.com (2603:1096:4::21)
 To AS4PR04MB9386.eurprd04.prod.outlook.com (2603:10a6:20b:4e9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9386:EE_|PAXPR04MB8256:EE_
X-MS-Office365-Filtering-Correlation-Id: 191c10bf-869d-45a2-f435-08ddb23ccf0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|52116014|1800799024|38350700014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?GPn/Pwk6h8dI/qqu53m8xDHFklhAgykKgb2vHfM801JGkEhdhHbhOcNKRICI?=
 =?us-ascii?Q?A86t1LrrojMKTMLYNlLK9LX/UvcwukD6KTVN2FGzxXVpB4UWwGWlcdINBwHA?=
 =?us-ascii?Q?HfqgiEc7ozFpYXBOaLn3evL707jbzaKZcRphXLBTqPzpkbsE1C9aPwR1HpSa?=
 =?us-ascii?Q?OuWgfgWoh9Jg50jFEw9JuNGwpuqCcQFsyje4laM21KeH4ng2lfgohC8tIq89?=
 =?us-ascii?Q?VL2BiHNL014ubLBKOwDtWrEHHU+uJhBNUUcxPwrYoEnZTW/V13sqg8rA4i3b?=
 =?us-ascii?Q?Ju/egKFF1KPPu3qqAK/bbVpjUEyKbEapxAEBtnzcXhjRWThYNyMvYURHspjf?=
 =?us-ascii?Q?jfT0kTtdAdy5Vr4pTsJ/EbLtEx94a/tPMNLP0TjvLAdinHRY5w0goKF0NW58?=
 =?us-ascii?Q?Z22RmN3tzGzTxYd10lTsy/D0uytka11WALrOxj6J5xCLf1c2h27JfS9tjsb5?=
 =?us-ascii?Q?RXHMRalFjm+aSfr4hsBQi2lASgfyWNY44OqXKK5DdytTkVNzCHw0UD+hLtjK?=
 =?us-ascii?Q?5jRo3RxlBRxuLOr/gyzdL5Bk0/c6H7zv4B8ixo9bs6MBkG2ON/BxFiL4Wsgf?=
 =?us-ascii?Q?VWih9IjjK9B72iyF96x6n9Pijx6vQdl5rz56uJ8SJXZqHqk47R15exFv9Zvz?=
 =?us-ascii?Q?N8ixJ3RD3uS5VTxs0CgnFKGcOJbNMUCvSRSMVNbN7es4riADTZBnQ3mUDMzd?=
 =?us-ascii?Q?w+c0MDNq1Qnk+qRrpa04p9ccVnZ9ijhVX898Zg6gj+axpznNM8Mcsu2LRCw1?=
 =?us-ascii?Q?Pghp/abQjy8GCq+T3w/ni8Jzk5dyINe5iuPHx6scPzP0C9Sra6HAl9/E7+rQ?=
 =?us-ascii?Q?S8LFl1ksQYSotXbdlbpcAthxVZV6I6mp+sjvMjL4qjmNP9sS62TcZ8CUG+62?=
 =?us-ascii?Q?wZPbm80MZLJ2qhiP+fGVPR98iCRiyKXpksRiD8beeLM5ZkotOmh76Nn2PSdv?=
 =?us-ascii?Q?OFJbCGear+KnIo9NbkB2hfJbGLnwIT+uNIKvwxALEyZg5p0JPnuERN4yjJp2?=
 =?us-ascii?Q?X/584EOgiiq3TnyTM3u9pEa/l70HKrNoBuK8Kgb6VGXRmdYQLqoJSjv+GfPg?=
 =?us-ascii?Q?uzLWhFGM/awGUG3Gy69uFLiTez6opO51IpUCSSzwO3nPq5LkGdOBUZpJYkYl?=
 =?us-ascii?Q?pjRxlxW6uwZjgrQVoAJFFv1sz1bdm/ipsus2Jaa3npal57jnRaPidyd1YRdK?=
 =?us-ascii?Q?aiMQnVddvykAAO4U33cWtFreUTVPhbqtZ3eGLV9kVIGvaTyjJUFvhkVZ4f9G?=
 =?us-ascii?Q?HOKIJQq9PHdqcQ7g+xLL6USMCVcETzB7VES+aOpE3sZKhfrWcRdl+aWGEwMs?=
 =?us-ascii?Q?0FfKlwXsU1tylOOzMQzcW4sn/r9wqy+LtXXVyd/G2lNvwi+C+Vl93OQjdxcz?=
 =?us-ascii?Q?n0bjnM79xOPa+JxeumupHOafhG0noyQI6/MGmQ3WbQXMQdS/yW1FZ64fmiSk?=
 =?us-ascii?Q?TS+e2qojnBb6UH50Qe6Biww2UJsBcj+kdY6uylcM4RcCyoyyJmrEgyfVBOB8?=
 =?us-ascii?Q?AkbXghBEXvP/u9k=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS4PR04MB9386.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(52116014)(1800799024)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VnD5tZBDbIEmsS7k428pLHTZnjWyfi99VzVn4gXn/Ox6DKLuDtOfskLCP/XV?=
 =?us-ascii?Q?1OIoh/IO2kRcx4sZqcxnDop9VVmq6sac7OHa5xjlrUowSW3aAPphumYcZP/i?=
 =?us-ascii?Q?K8le1KPPdsCja3ffGZLxXEHN8XwSRaqT/R8xU/ui+VOn0GzgxEApktFdZzDB?=
 =?us-ascii?Q?GiCHMEuGXH293UuFlShhdDCihwoBRIvNACc1BaJIgcbvPQRrrydyEw+lEQxd?=
 =?us-ascii?Q?a3MnzjrFhymdt6eniY1gxpdm6LfJF6ploj+0JUIiBOgpCikOSqy7FhhKeU35?=
 =?us-ascii?Q?P3hZOp5rhhy/Pt4IVUeWBxcY5LK8Qk+hxqbpj/uRIi/OMhYjwWmee0C2wX/n?=
 =?us-ascii?Q?U/Z3Sqvxs88gp6OQGhX9559GrI7mbqRchleI1ftqEwsfQKesQTbLz9ewGxE5?=
 =?us-ascii?Q?6pa9h01LXsZMcqHaP3enG89Wsved0K1plpnYLSaN4Gyeac6lcdMMCHikZi5K?=
 =?us-ascii?Q?8/tBliczTVh1L1gU/obt1uMUj8OnZFs6TdLWOUfheIk+VXFQPbfE5ujWR94I?=
 =?us-ascii?Q?DY90fa73JuYr2XcM7gGqN9vgkmDSC6v80dcAv6Y7KWDT+g8hBvlY8GZpptNm?=
 =?us-ascii?Q?oH35Fk/1h5BV7/XHsqGbzF91QzozlYG/5Ih40wRCmMxq08xnxB9aADDybLvt?=
 =?us-ascii?Q?bR+QgzhbKo2yAXl6ZHbWRFGntfDqoLoHmt36RxI1k826hHO/D15wTD4L5mTO?=
 =?us-ascii?Q?ul+KIk3oH/qwtc1JDKQA147mVljdj/ULnnUlAqFqrZOwzGr90GKlJFdYHmGa?=
 =?us-ascii?Q?HYs6+gQRlxL7mZXOQrK6bAzJk/Kb0LaIreDZE/yD2L/xln9F6C+IKiVKMu/m?=
 =?us-ascii?Q?zvl+Q/z9vLNdWCnoUjoxpQkvkkk6De3EeiFby5XfzmtgdVGgIxaPeaM/AzEw?=
 =?us-ascii?Q?IuBv5li7sw8r/Ib1pQ8Mv4yDgniCrGU2u/wCpAwSjkQbPN09m2/IL3KLFnTD?=
 =?us-ascii?Q?qlO2C7l53/P/Ni42GaonKvpQqAIz+ojL1EXHyYH1ZvCoHxtBzJeOinHe8IX4?=
 =?us-ascii?Q?1vgkWaiMgDCTbaacn3knAr4iNNCxSvxKbsC1ULu3Kc2BK3M13A8EualfsSg+?=
 =?us-ascii?Q?0+u+Hq2J9i8YITvAi7cT3WSrcpJ6rUo8KkjCvL9tjWsslXDgrAg0nQ49DsPj?=
 =?us-ascii?Q?GfWYHIKXB/Vvc4FimfnhIgWv+0PePSuU8AY3yMSUgK+ZlegV1fUlAonOsTs+?=
 =?us-ascii?Q?6/FvlYZ+zGvaEDe0FJXbjfNzflTbbLh79MxOTGAX0lhviJp+0rgNBlb1Ji54?=
 =?us-ascii?Q?uWSKX86wEjtRpDtJgxNbET6/bDlmjB/BTowDNRQ/TQ+S5QU0Df8Pu6DZhySC?=
 =?us-ascii?Q?RVv6lzPyf1BwI+ZxBfhn+KHFCxhwxLRIDk5ZuBiFaBuw54Mz5GWLUY2vN8A2?=
 =?us-ascii?Q?EDEFZWzmIpQRAxZjhCGF0MOfm/QeinetnKRcu2XnKaswzWy0HlOUZFpbEkHb?=
 =?us-ascii?Q?Oh+/B7/sXgldHA+re3UjIYISSAOx9Hg2YK9hmvBQXifnVIkiCe5Y3ludcu7n?=
 =?us-ascii?Q?GWAZiH+Ib5R7JfAEVUFEBsIg/KWsVfpbApzvdtX0PAzkK/fofXsGXS+MC6Iu?=
 =?us-ascii?Q?vh4WjrftRw6ZBv1yahnlq+o3CmpDrs4RqrOVz1od?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 191c10bf-869d-45a2-f435-08ddb23ccf0e
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9386.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 10:00:40.1831 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wFcygXzVZXMcXtFkLdSuG2mGp0MZsM+eUjqgj0XGNePnyVFZUERhn3lqnLWJProI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8256
Cc: aisheng.dong@nxp.com, devicetree@vger.kernel.org, ye.li@nxp.com,
 ping.bai@nxp.com, imx@lists.linux.dev, netdev@vger.kernel.org,
 frank.li@nxp.com, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-pm@vger.kernel.or
Subject: [Linux-stm32] [PATCH v6 7/9] arm64: defconfig: enable i.MX91 pinctrl
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

Enable i.MX91 pinctrl driver for booting the system.

Signed-off-by: Pengfei Li <pengfei.li_1@nxp.com>
Signed-off-by: Joy Zou <joy.zou@nxp.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 1052af7c9860..2ae60f66ceb3 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -602,6 +602,7 @@ CONFIG_PINCTRL_IMX8QM=y
 CONFIG_PINCTRL_IMX8QXP=y
 CONFIG_PINCTRL_IMX8DXL=y
 CONFIG_PINCTRL_IMX8ULP=y
+CONFIG_PINCTRL_IMX91=y
 CONFIG_PINCTRL_IMX93=y
 CONFIG_PINCTRL_MSM=y
 CONFIG_PINCTRL_IPQ5018=y
-- 
2.37.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
