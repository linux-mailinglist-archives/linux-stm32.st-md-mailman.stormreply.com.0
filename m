Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5AB835D5D
	for <lists+linux-stm32@lfdr.de>; Mon, 22 Jan 2024 09:55:42 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CA52AC6DD77;
	Mon, 22 Jan 2024 08:55:41 +0000 (UTC)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01olkn2054.outbound.protection.outlook.com [40.92.107.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1FAF1C6B457
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 21 Jan 2024 12:43:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hv0iS+rlatgYifFRt4zSf1EFcbMgghUjky/uMAdUn1pC0QoEF9PDKUJAxibVnKjsD6nIgCYOVQiuUMounu/1dIf2zlwdq/l/9BYh6MSCIzsy6mKugcyWGN6FNv29OOXMRMY2AsqoYWoav6ZSYKlUqLzyOPZZE5oXWx5KR/Y7IDngIbuexRQOJF8CLIoUaTKe/hVvnRecZMwXdwzFGlP9OIy/cXYaNgjJBlnnmLBYTGHMGV/SX4nWZGHcXSLMT1vrIt0UwQvUITcfY6gu8dMNDJBzcnWs69p9G73VqtVShcOos3kzuR6fycMiMPB6I3sKaQj2ORX6ebhYWLMC2t15eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x1jb92RmIt0dCPXHHflbc6kEI6Sa9rqMx59OPWcJtfg=;
 b=OQgoQXaixtpgncgi6lnclHR944jvzGogRN+sw6Zy/rp29V1fs4EYTKw3MFVQEOZzclH5cgrKeR/mwuLT091xz1aOEjmxI+myvrRUMqY3t6wWAku0F4idHM9T9P6MmuDfaDfLo0GHYGEaPbEfTwTgIf/Kl1irILuWqr2Y7hOMB75uCfBsziE52mb3VtPXwEo92An+h2PE4iVDCi1vFnXStNCdLG3crCdibLWhEz04AHziAhycf3aekagfffH/BIE9bhivit9C1RXO/TlaOS664G0FFmRrB/jNCrXklnK6i6BEF0+BXluM2q76UvHs+9BacGeGXCnJrmBT2l7lH2pTYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x1jb92RmIt0dCPXHHflbc6kEI6Sa9rqMx59OPWcJtfg=;
 b=QeEclU/dJ17aBOQJAUObnKVBCV2RXMOz1T6ODBYKdbJBToYhPGmJBbYuCgtyP+tesOroncYZN+4sZWn0BqivzbtH99+XQOobb+Fzdskd/1xHisFC1F0e+X3I7aZR118a7PBJeJejJWkcfjxaAXD1rooGeodZVyoVpYimA6bliehAgszz4U+6Gng4eSiXrWjhdZ7pxKOyE30R5BGCB49p1qRmjY5yxlU3VVg7SZPIj/M/u/X0MAohDrpcxxw7gmTE6E1PSvTrggpeMOPchcXCfDh1DrWiGUM98+VHxCRagAPGqxvqruxuNJlQBrDY4Vj+Rvu1huacFNtlPCna3AsD0A==
Received: from TYZPR01MB5556.apcprd01.prod.exchangelabs.com
 (2603:1096:400:363::9) by OSQPR01MB6119.apcprd01.prod.exchangelabs.com
 (2603:1096:604:27b::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.30; Sun, 21 Jan
 2024 12:43:20 +0000
Received: from TYZPR01MB5556.apcprd01.prod.exchangelabs.com
 ([fe80::bcb7:50f4:7a16:4ec0]) by TYZPR01MB5556.apcprd01.prod.exchangelabs.com
 ([fe80::bcb7:50f4:7a16:4ec0%7]) with mapi id 15.20.7181.019; Sun, 21 Jan 2024
 12:43:20 +0000
From: Ziyang Huang <hzyitc@outlook.com>
To: mcoquelin.stm32@gmail.com
Date: Sun, 21 Jan 2024 20:42:33 +0800
Message-ID: <TYZPR01MB555644D4AF2C3C528BC6E6C0C9762@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <TYZPR01MB55563BD6A2B78402E4BB44D4C9762@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
References: <TYZPR01MB55563BD6A2B78402E4BB44D4C9762@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
X-TMN: [ww+btxZZBQOC2wakAs5+sapyWmbpq5X6IyU85vlcnhJasKmaU1aNdw==]
X-ClientProxiedBy: PH8PR21CA0009.namprd21.prod.outlook.com
 (2603:10b6:510:2ce::26) To TYZPR01MB5556.apcprd01.prod.exchangelabs.com
 (2603:1096:400:363::9)
X-Microsoft-Original-Message-ID: <20240121124237.3328702-4-hzyitc@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR01MB5556:EE_|OSQPR01MB6119:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b4a16b5-8d74-4bac-8578-08dc1a7e8c1f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tHsYmrrJYKUXHcO8vMQtk366rZo0YRfSemU+NcvIf1HNhdu/7l2xKMpV4DqZ9mkonCYzyoirabBBjDPe9zYtu+pkE9EvU7mwRcs9mwmo4ptF1LHWtCOWaxp3da+NHrImdsEMzgrAN8gnGP5DmrV1TOSl82bhz9f4RcoNKu7FWVddUeS1l9to/BamJVjMJqx+Tm0rqWLtRk49IaKveRYHeIt5qX2cqSLZvFSV4Ox5mO6f9dvUU7pxNw8eQK8GAq5Va6aB5SoWCfZAn0hN2fiiWSWdXBrZ4d9BT04Rxkwb8JH4VJ1EtGweIDa+ECY2xlaMg9leHRxBbq6iOMFbV3nKs9QY4k+SoaKco1RtLdB6ej1X2EhQFftRYAojVOimk0cOoXjvIXCgbEmEPeEmwBngZeMIH8dbfg539CO/zmICUmMrk3xS/lSV+gPhHQj46g7oeAQTUgiMMimyzDdgZkIMQF/lNJwots9ISlK/CSY+jSFmqGEyuAYWwMGs2XsaiHVuJor/yGzBvX0eQQjGLR7PZ55OcAlx2FijylUny4P3M+lZoMzpYBCKpmcKLCwxKuprMXywSjEX3HeWf9tQcrQKEdkmBdqvUY64YwqCOfF66JsflFK6TbUxxreXpPI0uV1X
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lYNIfRswU0knkZ26ZjGOsumM7pb0W1MEu8YFdu3TNE2LCze5IStpK9cgldYU?=
 =?us-ascii?Q?atTIP8wactALuNtI6qmvvzVkX0bd7Vn3hIc2euq9Z9N+cMo+eZ42ubPxfkEO?=
 =?us-ascii?Q?d36endhQ5YWkIbkcQ+ZJjJV78M0AQAG3cdpqQyXsY3X1lXjfpay4pkS1mTA6?=
 =?us-ascii?Q?v1pwOq6HB+Qn2zS+OE/flDyTbXJoa2cO8NnVzz9dEVMOTIn8apoZcDVVdqng?=
 =?us-ascii?Q?RClDD2Sze8X79xxXOx42GmxYX1HYc22m65XjjJCjNF+FJF5rVX4uDVUeJwD2?=
 =?us-ascii?Q?/GM45e8l9ND0oS+vxP6ZhDmImjV0I8gQ++ziP0SoSdhw+U27pAOYwcoqZ5xa?=
 =?us-ascii?Q?31VhvnHsAlNKiESJV4JQkp6yHvHlzcvafvaPmJprKbpaGP4TkCDdiF7qgVC6?=
 =?us-ascii?Q?GGgP4G/lHxzhm35Pu6i8KjEvbW/9eVJQN5t69cMJFzg5Ieq3/NEAP75euulM?=
 =?us-ascii?Q?RlA61Z89eJmCF+9z2Xd95GJxdXTvo8M+0ZHJ47GfBbBxM78yopp/RiesKM6t?=
 =?us-ascii?Q?+gVvP0Kw5b0nQ4vnks9WamAkyTfWiXcekeS7uiDJsOIECpkR4UfAMDroxgYT?=
 =?us-ascii?Q?DckULLI/7RBl6uWjUbey4aAjiQCDPNNX8p7kHyDR7uNZf42gLs5Ole3CoAfU?=
 =?us-ascii?Q?M0mF6gYgbiMsiGL77ckR89Y6qMyegu6B2TUgeY9mKh9X38Ag7PGBQSKMELBQ?=
 =?us-ascii?Q?Ydlh8JAxV5Mcv5mKv+qJOGUQNajJmDTb1dmwdhhhvsOJuRn55LffVXT84wOu?=
 =?us-ascii?Q?uQhVYf09Xzkb60GcIdCO7RL3F45H4cRyzTehIZ5Px7QB3mwf00eraRFcEn9H?=
 =?us-ascii?Q?usl2Ou4RiJE7v+RLUtDdfD/q5RVr0xI40GbkemFEkgumVfbe0WsqMM14dHI+?=
 =?us-ascii?Q?ky5CgCs6cDdwYDLoBsEPN0WFzs/1bX1knrUgHT+zbrbJ02rjWl7qGTsatsBG?=
 =?us-ascii?Q?xL9dsyH1GOlAylpIYL+RdOP89IYIIhkIu1luSHP4M5h0O45SWM0tq52Z1zJZ?=
 =?us-ascii?Q?oZOez4lAVTY4mWq3GaDwj+8lGZylhbuYd5UrQD/3SlFyElchId93fUUvNTC6?=
 =?us-ascii?Q?L4c8UcHD//Op8e08u7T2hoUR4gIGQDixKJctmtMGgpCf3hRXz7XXiUPIQb7I?=
 =?us-ascii?Q?vCXDqZl0Hz/Y2CBdHEOCjLFMBFE8P1Un/0oP7OPQXYO37QSmzjvoC9pf1yPz?=
 =?us-ascii?Q?mUQkc9I/zu9nf/SEhtOHGp6mnpYrKR+nR9XtpEH+/7b0DwZGR73t7Rg/Wi9w?=
 =?us-ascii?Q?HJCzjxS2rlT/fpxd/2I/?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b4a16b5-8d74-4bac-8578-08dc1a7e8c1f
X-MS-Exchange-CrossTenant-AuthSource: TYZPR01MB5556.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2024 12:43:20.3138 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSQPR01MB6119
X-Mailman-Approved-At: Mon, 22 Jan 2024 08:55:40 +0000
Cc: netdev@vger.kernel.org, richardcochran@gmail.com,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Ziyang Huang <hzyitc@outlook.com>, p.zabel@pengutronix.de,
 matthias.bgg@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Subject: [Linux-stm32] [PATCH 4/8] clk: qcom: gcc-ipq5018: correct
	gcc_gmac0_sys_clk reg
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

Signed-off-by: Ziyang Huang <hzyitc@outlook.com>
---
 drivers/clk/qcom/gcc-ipq5018.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-ipq5018.c b/drivers/clk/qcom/gcc-ipq5018.c
index 19dc2b71cacf..3ba2fd53262d 100644
--- a/drivers/clk/qcom/gcc-ipq5018.c
+++ b/drivers/clk/qcom/gcc-ipq5018.c
@@ -1756,7 +1756,7 @@ static struct clk_branch gcc_gmac0_sys_clk = {
 	.halt_check = BRANCH_HALT_DELAY,
 	.halt_bit = 31,
 	.clkr = {
-		.enable_reg = 0x683190,
+		.enable_reg = 0x68190,
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data) {
 			.name = "gcc_gmac0_sys_clk",
-- 
2.40.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
