Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 72BEEB1358D
	for <lists+linux-stm32@lfdr.de>; Mon, 28 Jul 2025 09:18:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 319CFC36B20;
	Mon, 28 Jul 2025 07:18:23 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11011052.outbound.protection.outlook.com [52.101.65.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C7958C36B1E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Jul 2025 07:18:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G6pBLKDIeJ3m8bPQxQHBn1lj4CDceaPtriYLv/2WNkidzUGx8n7wddeMcSV3TNRZXgUJf8QOE3SulvP09mH0ypHS838TN/43rHapGiOxSYycJ7ZUHbI/KHfjtcjdHieB/NGmPZIl4TT3XvAFRij6o4aM258OVBaZYwi12WaGxzyP60fypNMvO8x0cj5Kh1nJfslIaZAMH6lZhRB2+t2epZW4cq+sv1AEq/EmfqPjmm3vtZAn5rJWNjBLijLMW72qZw/bM/knIwvGMrqAYc4w5Yvd/hOeAvykLTO0IETgH6TWSAQZOBPB4fJki+iieS4sQxQCNEvKChMRCCjh1JZhdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=95nHT3ZXKs8Cdph/E4bdkCiPSGJK9NJdG6zGonkeHIc=;
 b=dqytSic35tkWFJsyCoR8pUMpafbyhX4/Sucn5eV4k0w0FtaC1kTTp9Dd3NxjnSILUzLfNISKCJEclYugdhiOrW6w3x26uatl+88ZMLi3Ju3IzB+tNgSHxBpnsPvFGIiun27YfQYWKX0IgQ2qIytQ9Fc9kxq92vZI/1DpoI+/81tKLL0Xj+06hGYoqalpxuDYh+NszbOcybIPBx1U+9RzajqaZtSftt3Ci9J9hjuAaO+wdtORvpMd5yyfRFrzBxnWRxFafeGwwaZTmBxe7NKGGXEoFKw8AjpTU4Cih7A44PiuCR2+uhydtcvkRsjqdvfgrvBIdZxlPhV8UBKAUhVG4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=95nHT3ZXKs8Cdph/E4bdkCiPSGJK9NJdG6zGonkeHIc=;
 b=U/5KBe6MJw3PNHZNe5E7T5JY3EamyA+NldskrHGIYMk9cOVseUgcxVn2Q5VOUq7T+/LdMhhXN3/C6dv9u2pNi4l8gOcqXuDFsKlY+Xj4qnlA5gHZWurYVWN1U/vT4oV+k4h0QeynkRVVU1D0uV4eiW68TBirBjKPhGCYYALntcliXfFzEKhAhvsmOBy+9IkE3NW1dQj+3NFNYob3Xslfl4J4RQMhnqMGS8UO34YFdfmjAEsbx3lRxK2qgCnQaopzesmkTaNL5H+Oz3FwkT8QyPDLcBAcIZ7TBnj4y/QvH7Pi+giM5yG2og6cd5kLBCMav7zcX9ZgocuNObn4SlWLtg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9386.eurprd04.prod.outlook.com (2603:10a6:20b:4e9::8)
 by DU6PR04MB11157.eurprd04.prod.outlook.com (2603:10a6:10:5c2::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Mon, 28 Jul
 2025 07:18:20 +0000
Received: from AS4PR04MB9386.eurprd04.prod.outlook.com
 ([fe80::261e:eaf4:f429:5e1c]) by AS4PR04MB9386.eurprd04.prod.outlook.com
 ([fe80::261e:eaf4:f429:5e1c%7]) with mapi id 15.20.8964.025; Mon, 28 Jul 2025
 07:18:20 +0000
From: Joy Zou <joy.zou@nxp.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, peng.fan@nxp.com, richardcochran@gmail.com,
 catalin.marinas@arm.com, will@kernel.org, ulf.hansson@linaro.org,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, frieder.schrempf@kontron.de,
 primoz.fiser@norik.com, othacehe@gnu.org, Markus.Niebel@ew.tq-group.com,
 alexander.stein@ew.tq-group.com
Date: Mon, 28 Jul 2025 15:14:36 +0800
Message-Id: <20250728071438.2332382-10-joy.zou@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20250728071438.2332382-1-joy.zou@nxp.com>
References: <20250728071438.2332382-1-joy.zou@nxp.com>
X-ClientProxiedBy: MW4PR04CA0172.namprd04.prod.outlook.com
 (2603:10b6:303:85::27) To AS4PR04MB9386.eurprd04.prod.outlook.com
 (2603:10a6:20b:4e9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9386:EE_|DU6PR04MB11157:EE_
X-MS-Office365-Filtering-Correlation-Id: d1f3aef2-7c83-4d0d-ceb8-08ddcda6ee04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|52116014|376014|19092799006|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?T7QS2802kdMG/wRQLJzRu23DZGlF+7zQMHUX5BX9UbgkBuF5uP+ZrI2ArQ+d?=
 =?us-ascii?Q?jLDjzvcr1GU4b7ddgAsiMNomaejLml/JTV9Ef4K2bhvkUtbSVZbkxAyrlVLa?=
 =?us-ascii?Q?+OXZtn+6JV6sdgr2F6d01bEtP8QEUhusnbzvKMcbD3DoVtDEIs22sdI7t3Ca?=
 =?us-ascii?Q?ePt/DvhFvae0cYeb0pjJK9FE4ypN0ERvjEklR9MxTVbh2V7yVbDB1PFeq0X1?=
 =?us-ascii?Q?dg4CN1CxNgbCOowM61qWzwo/dRdSsot/VC8A8p0SBFxnKd5Pq1QISTWY+kEd?=
 =?us-ascii?Q?fZLvEOmLNwlS7UjURg5hjasQgoZpMs/N8hJlU6P/KX8y0XkS/5Z7dtOgSqvn?=
 =?us-ascii?Q?VZYZyPLlgoFlADBAv7oAr2l+dnitbhfYJxDd892NXrnzwDCn/azhC1FgrHAS?=
 =?us-ascii?Q?pnhWrSZgo4a5yHfRRk1pcY8/pGjkNzUP62f7h+eMN1fkoQJFezHo5buqbmOZ?=
 =?us-ascii?Q?m7pm17M6yISH2yaPA8JYcZz0ZzA8+9Icv3ELcB035d/BBZ4CNJ+6OeEO7P4a?=
 =?us-ascii?Q?sT7zr/1mDVus9cpWUMwcBmrMXvuln6B5mtnHa6fIgHcIZ2mkI06+g1/PfNfj?=
 =?us-ascii?Q?FG+kFjOSmZsLFe2YtMkU2XF4mmx+jN1M8RmL4pG4vjG7+iXo6a4PxSuZNh5m?=
 =?us-ascii?Q?qN65Os0jhrFTIRbDhOz62wiRsutAeS+Z7e7Eq0Yf8QaRLaeITnam9tz0Z+FB?=
 =?us-ascii?Q?qBjDYwcWX5E+RkyV3ihXLPTF1kCUexBKGPMfg0/U/lU+CTv2wH/8iT38gVTx?=
 =?us-ascii?Q?m0onNCtJ4LDp6J9VZl8Rq4QU747LZVKmvr4sjmHi7yv0oMFa1d7D2ZeDlZpT?=
 =?us-ascii?Q?sIPXL/y2nCSoiIvyNqB95nuQe6ykOyCBXcDvxIu1nLuB4vHn8Ews+ErECBHM?=
 =?us-ascii?Q?Wuv1eObKatlbnKeiUOWr8FFj0pdGld08BmOvCD30MTj+jKjGJhfwaa5oayAj?=
 =?us-ascii?Q?5pq6HXd7MILTjcF0aYbzR40i7M9+dPlVPX2B00FOx7aUVJPD5GuT8AcJcZvg?=
 =?us-ascii?Q?oTns2Z3GusNkLqfUoY3WWRdo/6ZtSrfJBG1L7xE7BV8yMV84R8BcJDxgAISd?=
 =?us-ascii?Q?IAKeI9rdvl2997+efpsRnDEBz0gHFh2FCwJ//A8zHCY4+BVZJw1HTH4uxTSy?=
 =?us-ascii?Q?mr0w7rVRXoGsocwEtZnq70hyd6BjQB9HFOe8pfrwMR2Oz6h9pDpgU8ffHWnX?=
 =?us-ascii?Q?CzItBtHVUtWOsCVKLkfxUCp2aVEtFqxsCQjr7lJtrkeZfCC/QnqtJoywabNS?=
 =?us-ascii?Q?swxyop7kYziPPidTo0l9MmQIwDuMxbvMTMvVG657qMzAAFeQS6Sp2qyVgTFt?=
 =?us-ascii?Q?TCmh4SoPK8QPe86jOOtjgccIjHNHZIDV0k3bB9RpY4O2ufeX19Re+17NaOPe?=
 =?us-ascii?Q?y9XwACW55PM4i4+3aup/17CNfJFknaJdnOV0NvcAPpKppSRVgMicoYskSJ/F?=
 =?us-ascii?Q?qR5u6iuOhX/EOXqUBwMMqpAQMnRSAWDOPYSnvZ++4eppdPmu7QDOyoxk/xIJ?=
 =?us-ascii?Q?EpIAQUCp/80Jjkw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS4PR04MB9386.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(52116014)(376014)(19092799006)(1800799024)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BEqTtvh8mODDYtqgn4s5UChfl30CQM1g0S6eoVC3WmFlCN4/SDztYGRNxeGh?=
 =?us-ascii?Q?osEICmPad5AEcSL9tspvvwKXmAJa9yFruN2agPpAHWkE3E1mwEz5epn36peo?=
 =?us-ascii?Q?AHDZ4v2eys07SmHtiGS/OUhnOVNxbsvdETH+dVs0z5sI+0ymWR+m6wfeghhB?=
 =?us-ascii?Q?jYv+PVr22H10RNsUJM0zS/rBeC10t2Zn72UWjkDbEWXqgiFtm/XcdNhnU9Q9?=
 =?us-ascii?Q?mzJ/DdeV0XWAzaJhQWKmtlfH3BiTKUNH/h0fv1Uf+oIp6LCDia3I28BYgzNP?=
 =?us-ascii?Q?Igazlal7B9Nrr2em6weopWMOq9vLMEdfISJ0GsAbG++gWHdO/F2KACihHJpv?=
 =?us-ascii?Q?n9XonhwVJ1E2JeURMdUQfBeCNd6ZbUd0PGC+/RMLxZAQoqQswvN4b/ohEHho?=
 =?us-ascii?Q?jNocsqGVBahHGNpGScPSBwPfmGsAw5nTZ0AOqB3tND6n8olV28L5cWK60eA3?=
 =?us-ascii?Q?Zs6D6bQu4LzF7YIk21d04xDiBXrf91pk2jDg6aM1PU8sS/kt4Y9DI8S5Bszj?=
 =?us-ascii?Q?hLUlT3bdDeQz2u3pGOrmWb3XCxfnam4joilmUihOMPUZqgj0ITTqGUYeW1I3?=
 =?us-ascii?Q?qCdaDJ79OPS4jEg32Novqqn2qWAs55i9OjnsmYqwZnMQR+ZiWm7yoeO88fvJ?=
 =?us-ascii?Q?wg7ZYsyKvh272n1MZjz0M/VgGjcvGTY3Tq/bGVDFseMkcyQkdux+xMKJKlpJ?=
 =?us-ascii?Q?eFrbO3SFLtoUzHjw+IyvZcXBFvnZikqydMXer+CbnzEKPEVOH5i8pgHxEk90?=
 =?us-ascii?Q?527ExOlOQSA0z+6Cat4CpFJSoX1LL/wGq+98masGGjJ1DmtyOL+Ae0gpj4Ba?=
 =?us-ascii?Q?5w5OfcmhOVB4aQqnVeRdUcmi35k5CtNACKJr3LPYEb0Dyqq4GWvk5s84Bqk5?=
 =?us-ascii?Q?mRYyP303mqe5xA9w0/aB2PDDKqPTjI+OdKe2cscy0gNlLqZWvzBIWaLeFZ66?=
 =?us-ascii?Q?1oXIYKYrkjwfJ+31Vrh3Ui9iKTWvpdKOPesM4YEdHOaot4jlP+algys5u2kc?=
 =?us-ascii?Q?mHVpzFzMjA9CWBi/85gM61LX3WAFR1Ou7FLtdijgLRRHkTpa+nNnc8Fbn8u/?=
 =?us-ascii?Q?S+iJiMQVENc/msleKTpG8z48xwKJ6sn9AJbYAiAUVtpKxRmwplBddLlIdiDG?=
 =?us-ascii?Q?kxiU0QkfAax8qUZ7KyN2SBpFXbMmXmilmQAPjJpGg8lB16FVFm+DUU3vdcqy?=
 =?us-ascii?Q?wXiU+ZIFUf6gnukvWNhxEswTNLJhowgCzqX/jrH0W4ZwD6yspVsMJhK+hLi1?=
 =?us-ascii?Q?8drS8tu6pjUUWHhTRq+2FfsCQnqwJHCS0Mkvsq/QJAIYdtoOtRPkRGmeGCxH?=
 =?us-ascii?Q?TA+TnJ83zu/Pl2wfFg6JxHAodiUkAqgFqJ7/61kk3fNsqHdMAJz2lfk7kee+?=
 =?us-ascii?Q?SVQfRrKLdHCIcDpqD61LSKUnvc6smP5zhdOWnbUYYmzpnvgHob3o+H8pUytp?=
 =?us-ascii?Q?nkFGCjmCKt039qOs5KO5F/1tKJt40BIDR/CldsvaGR8SQJ5EsNuKdAFXI8Zp?=
 =?us-ascii?Q?BlbMgk1qwgM34b7VylBx8PJRNEFLqSyUKc6YKgptzb6DWPz7ZFU8FSicej5h?=
 =?us-ascii?Q?hFAdFcuaJC4kkPTXiKSQoYdCyXf4C6zKW/X4fNTu?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1f3aef2-7c83-4d0d-ceb8-08ddcda6ee04
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9386.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2025 07:18:20.2587 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nt089XF7LWEmJ5VClvtaLm49WPf+TR2yfE6NJrsd1+M7QJUxcJABRmFXwTZ1dJt6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU6PR04MB11157
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, netdev@vger.kernel.org,
 linux-pm@vger.kernel.org, Frank.Li@nxp.com, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux@ew.tq-group.com
Subject: [Linux-stm32] [PATCH v7 09/11] pmdomain: imx93-blk-ctrl: use
	ARRAY_SIZE() instead of hardcode number
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

Optimize i.MX93 num_clks hardcode with ARRAY_SIZE().

Signed-off-by: Joy Zou <joy.zou@nxp.com>
---
Changes for v7:
1. Add new patch in order to optimize i.MX93 num_clks hardcode
   with ARRAY_SIZE().
---
 drivers/pmdomain/imx/imx93-blk-ctrl.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/pmdomain/imx/imx93-blk-ctrl.c b/drivers/pmdomain/imx/imx93-blk-ctrl.c
index 0e2ba8ec55d7..1dcb84593e01 100644
--- a/drivers/pmdomain/imx/imx93-blk-ctrl.c
+++ b/drivers/pmdomain/imx/imx93-blk-ctrl.c
@@ -418,11 +418,15 @@ static const struct regmap_access_table imx93_media_blk_ctl_access_table = {
 	.n_yes_ranges = ARRAY_SIZE(imx93_media_blk_ctl_yes_ranges),
 };
 
+static const char * const media_blk_clk_names[] = {
+	"axi", "apb", "nic"
+};
+
 static const struct imx93_blk_ctrl_data imx93_media_blk_ctl_dev_data = {
 	.domains = imx93_media_blk_ctl_domain_data,
 	.num_domains = ARRAY_SIZE(imx93_media_blk_ctl_domain_data),
-	.clk_names = (const char *[]){ "axi", "apb", "nic", },
-	.num_clks = 3,
+	.clk_names = media_blk_clk_names,
+	.num_clks = ARRAY_SIZE(media_blk_clk_names),
 	.reg_access_table = &imx93_media_blk_ctl_access_table,
 };
 
-- 
2.37.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
