Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E37AD2E2DD8
	for <lists+linux-stm32@lfdr.de>; Sat, 26 Dec 2020 10:47:50 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 77EBDC57184;
	Sat, 26 Dec 2020 09:47:50 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2099.outbound.protection.outlook.com [40.107.22.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1C024C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 26 Dec 2020 09:47:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XGamM9V5ckN8ZWXLhm8HXXptacX+FPA0hmr2y9T2u7BSBw8vlxHdTwiEzf9YRX4KfdrCgGd24+GJSbCEfODTPfliU3sw2wc7XR4P4SMDs30KHQ9qOyaUzxTbDFDT95iW7aNPUd0Z9NEzlYgKkyXuuB2Eo0Da353k7GH5a/1SqI/LbY9rwdWiTcq57JC7p/7DisehRbcSxJz1rc7XzBJ6og9Cjka8NjJHu+pCm6I88Ilf6Var+VcuOja3rmXTQUJInu3a4cjBocxoAz1A4eB1ngaveJU8zSB+vMmKr/oPU+aqkSPOWCI1/uW/4msqaxpcSM6XOHgMoSvfAzb5MK2zgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8inmsJ0xO+UkSc8CH07cCTTuOc+0OLeh4B6h6gNkUhM=;
 b=AFcAW3W/1rG5zB7VZyOg047Jpg5n6fexG+n/rJIXcSwlGWjE1OCMnxNFcvQyuLAjzAXzEl3x0jcTVt1jNORYUmTjqgP5zmr0XYlqVMXKUsKkAGqdmLvTCbu8VQXisySoh0H6Fy5wR1kWazN1YlSnxVkW+EWuH5pFPPCEMIH1qG3ipfNITfTMwtiWXak5ZxM2nUUldQ+PWlcJnvYkiALtUSICDwCKTuIIw/i3GRDsoO/N1niubxKLoTUbSQdYMxFKjW9g0H+BFghERqXYruT0zXw80w36G0wbHj8Z1VLIzgs81ciy5+SFX01XobuNtCLYyCvcj+iWcDZ2F57z54ayGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=toradex.com; dmarc=pass action=none header.from=toradex.com;
 dkim=pass header.d=toradex.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toradex.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8inmsJ0xO+UkSc8CH07cCTTuOc+0OLeh4B6h6gNkUhM=;
 b=tj8TlkCB6OdOkSaHBlwjI6Y3wntH29hTV27kS8lrGRDonf2ZWu1wor2VAbMc2vvNRmV4p4BUOTJpC6C4pNkzy+yxp1sZ2u8AbL2a9L7aYHKrDP7lezFWZiqSnVrtHnU8rytizxiKRCndmvm8bfsnHTFJj9QIUIfrHWZHBBP8Kp8=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=toradex.com;
Received: from AM0PR05MB6002.eurprd05.prod.outlook.com (2603:10a6:208:129::19)
 by AM0PR05MB6001.eurprd05.prod.outlook.com (2603:10a6:208:124::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.27; Sat, 26 Dec
 2020 09:47:39 +0000
Received: from AM0PR05MB6002.eurprd05.prod.outlook.com
 ([fe80::802f:1250:dd1c:9357]) by AM0PR05MB6002.eurprd05.prod.outlook.com
 ([fe80::802f:1250:dd1c:9357%3]) with mapi id 15.20.3700.031; Sat, 26 Dec 2020
 09:47:39 +0000
From: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
To: linux-next@vger.kernel.org
Date: Sat, 26 Dec 2020 11:47:22 +0200
Message-Id: <20201226094722.16580-1-oleksandr.suvorov@toradex.com>
X-Mailer: git-send-email 2.29.2
X-Originating-IP: [82.193.109.226]
X-ClientProxiedBy: AM3PR04CA0128.eurprd04.prod.outlook.com (2603:10a6:207::12)
 To AM0PR05MB6002.eurprd05.prod.outlook.com
 (2603:10a6:208:129::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from cryobook.toradex.int (82.193.109.226) by
 AM3PR04CA0128.eurprd04.prod.outlook.com (2603:10a6:207::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3700.27 via Frontend Transport; Sat, 26 Dec 2020 09:47:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2d3f1cb5-b4e6-413d-23b6-08d8a983489a
X-MS-TrafficTypeDiagnostic: AM0PR05MB6001:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR05MB6001784339258CED2C16177CF9DB0@AM0PR05MB6001.eurprd05.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2043;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 877WMVI+UpSc8GoCYZf6qi1d1/wVZWvhV3x+yXQztes+Uur0dsWx+ndTUMoRqSM77uGxtWORGhXuwvIhoGStsIQzSacs4LBCB3JuUcfIdTcggkcCYflJVCsYEZHNRTT82jO1QOBcUM0hPeL3bhot5YFvLaUyevD+Wh56/AbZq9VdZGp+Vm0zt/YhqPPjqJf2Skm1OQBPKC1gbCY667/kvfEg8V/bNaW9mjWqwgiOmR1npf6MEmnpoP3zW8/TOtuvR768E/I1B1BukE0UHF+WJhxj1WjGvTQobey6gzmfpNdgln32TWE91wGs1UtA/O5XB6t16SEdoCxTvttTWr/e2wVfZZ+4NXmG2yRJmsXuhCKsGHxiFpFD6KnQPHWlQoAQDEVqBDwayPtGPO18kovZ+Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR05MB6002.eurprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(136003)(366004)(39840400004)(376002)(55236004)(54906003)(2906002)(86362001)(66476007)(66556008)(66946007)(316002)(26005)(83380400001)(4326008)(8676002)(6486002)(16526019)(186003)(6506007)(6512007)(6666004)(1076003)(6916009)(52116002)(956004)(2616005)(44832011)(478600001)(36756003)(5660300002)(4744005)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?owtx3OeMpJQqN9fGSl8hUSjp2FBwo7IN9nRRGvQW+vy4AU0DoA5TPzfIBjxt?=
 =?us-ascii?Q?ZapHanRRQdWUS9f3Jj0czd6tAYaG2z5a28Jjq+f3SfRa7D/TbeHPdomn2/SF?=
 =?us-ascii?Q?UXr2Rzl4KTLziXw6vK07/Euus94zGFWyw52wO0FRBKETwpiVTcELnkrVnKOa?=
 =?us-ascii?Q?ziM06y3bVqLOiRQS5hYfHorK+q0TPGGVUh+wruImlNXC5QpiEG4tcJKqh/kS?=
 =?us-ascii?Q?vXRrp/QzTpEDWV5Zeg0MCROvZu1vIoiuUHhnwAO/MpHd8AduSubQdnaeg9Tx?=
 =?us-ascii?Q?3JInYIym9k0nzbJfKAl4Om3Qxn4MIsVl33xAwGCo+wC6bR2oP1Qh/+pXjjn7?=
 =?us-ascii?Q?v76GCUmkfQAm2gx9s3Gh/7/NgCBPpbXQk7ipGHoZoI0ZN/lI4Uzxo9GS5EVR?=
 =?us-ascii?Q?SlPawSI8NTvjlT99bIJ7wJFU5LxcDS5HCu2FNKf3O6SFyM9GhfKBUT5QVS02?=
 =?us-ascii?Q?p0S/kDAeJ0sI50BlZlGfLNYoA5ZweOjEoKKQlW0kbf0eJkQvc0+aJqulXm0n?=
 =?us-ascii?Q?pKtcO6b/d9MrUntyosET7GK3F75EdSLB+QFh5heyUnH/V1KxRHIgqy3hBToo?=
 =?us-ascii?Q?J2bj93J295AZf8Xs8JwbQkX6He1lpUVs/1Ec3U5f55f1Af/yu++9VhJhZHmq?=
 =?us-ascii?Q?dlAJ7P37qiNxOnXCmghw8hlFkuNESmqIXeWFzP2YGbTd3QgFLarip/KprFEF?=
 =?us-ascii?Q?p2B+FHflSP4G/z9zFE4GZH6yNjPWL63EperQVzKB1qFQ/EcpswnnfvQgYcVm?=
 =?us-ascii?Q?xUW3BD2DwBAzZcS7SSvzDyI1oBTltkyJlNylz4S1YU4otIA1PyJwQMqJG4W7?=
 =?us-ascii?Q?A9LdN9PJQLo2KAZzkLLz6ccbkAk2VYPmXNKvxZTs4bYqacv6b7GYrgePtlXl?=
 =?us-ascii?Q?ohFAqY59/hbmqumxLr4JFfxuPGo8KBlazAvbY//oeAX+h+Bzp9n+OhgVIxSu?=
 =?us-ascii?Q?hbWhphID4U4TlK5e3cpBwo6PKHf1e+eV360wAFSq7gfFY1hd225oMeuWrvbh?=
 =?us-ascii?Q?DsIf?=
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-AuthSource: AM0PR05MB6002.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Dec 2020 09:47:39.5996 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d3f1cb5-b4e6-413d-23b6-08d8a983489a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1IQlIgguQpVbuaMVwwbYIYB6VdLj1hewng0eSsEgSfwo2N7/E8Z6LYVtte65Poeez0wwNsp6Fou4x//mW1IbkkMfMVX2PvNVqUVv0DLR9hc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR05MB6001
Cc: Igor Opaniuk <igor.opaniuk@toradex.com>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>, linux-kernel@vger.kernel.org,
 Oleksandr Suvorov <oleksandr.suvorov@toradex.com>,
 Philippe Schenker <philippe.schenker@toradex.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] mfd: stmpe: Support disabling sub-functions
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

Add support of sub-functions disabling. It allows one to define
an stmpe sub-function device in devicetree, but keep it disabled.

Signed-off-by: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
---

 drivers/mfd/stmpe.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mfd/stmpe.c b/drivers/mfd/stmpe.c
index 90f3292230c9..2182607b75f6 100644
--- a/drivers/mfd/stmpe.c
+++ b/drivers/mfd/stmpe.c
@@ -1358,6 +1358,9 @@ static void stmpe_of_probe(struct stmpe_platform_data *pdata,
 	pdata->autosleep = (pdata->autosleep_timeout) ? true : false;
 
 	for_each_child_of_node(np, child) {
+		/* skip disabled sub-function */
+		if (!of_device_is_available(child))
+			continue;
 		if (of_node_name_eq(child, "stmpe_gpio")) {
 			pdata->blocks |= STMPE_BLOCK_GPIO;
 		} else if (of_node_name_eq(child, "stmpe_keypad")) {
-- 
2.29.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
