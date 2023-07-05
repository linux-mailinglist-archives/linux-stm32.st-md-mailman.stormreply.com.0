Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F33174856C
	for <lists+linux-stm32@lfdr.de>; Wed,  5 Jul 2023 15:52:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DECEAC6B45C;
	Wed,  5 Jul 2023 13:52:18 +0000 (UTC)
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2132.outbound.protection.outlook.com [40.107.255.132])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D9840C6B45A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Jul 2023 13:52:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=No0MNdypCbYdZDhBKyPba7PHE1nqr0ybKcncQQasjcU+GTyGYX5QxfqR95R//C6uVO4sjJQkITBgwVEtvYlqlT0bYO30grNIbtNDJIpiXTN4gtp23zePWoThB+F3VcX9JS9HPwRCTiKSDKtj0S1QfA8HzIDlysj1uANx32lQ6ywsGnws+CEMSAjCcW0bn9nLIof/4VkbOOdnlr6k54jamcYUZhGteRjH1588EQ74Vn4DnqLCs28Hu1Ysx31xrX4Le7AcsOEgBSn6Jh0dsory1erYML6DWbVvd+Wnqh/etNjIuniUeANNRLW7SNcHC7/sI82b2zRGXzlArWP8pHApNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+f1vLbTi9fKLjup7MkbKDY5dDT1cFKNHL28OvmqBpRc=;
 b=Sg+GD3NRPZJGKMWu2s2rIaAeGjq9ooIbXWPEcmaGwWLfYEZi9RLOr9N5eJjJV4AdN2i6XZJGUnF9ayI5F+EI6uQ48mgrMc9UEpI16vPlkrRL0oCboPCWcdUbYEjhH5zjEJvr3cWiI5Xh2V5rQx8Vy/8yW+kvwSAAPeHCBsPFP5YKaELtVsMO9QyrpIBi3gfNtiJF8IcfwAkTSE3mWzKLTFWSh6A6u698Es6fhQSLBYFYlS7u7A1LnwwhojvavrrZJOBik/U8GsWQN3B0o/Y7U6nwij/+5P8db4DGkTqGxvwav40YzIYC3sv8qpJJtO7yqqyHDDmZorQDNRMbXzi1Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+f1vLbTi9fKLjup7MkbKDY5dDT1cFKNHL28OvmqBpRc=;
 b=mUDBYTKBid8J+oKn8FC22ftwXa5TD71ZKKHzfHzScg4H3wByUZIKKGx9N6OssSo3lhmDfdWZInHiDPX3HmAnXcelg3n9mK75eV4vmoaCRWZFz8MtQC9J4vWCt9oOlUisEyWJkDIgKw/wzA0VNc0yPpoZVJdAEyWC+j1n4d1kwEZyDfi8Nc0PvQImQtNKpv7y24+V85kGyZnp+EZMgBILUF2I+as/tJozXOu4iqt7T0c6xYwTtTkQBK0p22gby0lSHgqZNSOelmm4mKRxjnyaRZdQyIP8KJTeSTYf7kmWffGhlWz5U28HStTKDFZpwc8StKkSrNu8rB8wPZsOnfyrow==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by PSAPR06MB3991.apcprd06.prod.outlook.com (2603:1096:301:38::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Wed, 5 Jul
 2023 13:52:14 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c%5]) with mapi id 15.20.6565.016; Wed, 5 Jul 2023
 13:52:13 +0000
From: Yangtao Li <frank.li@vivo.com>
To: Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Andi Shyti <andi.shyti@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Wed,  5 Jul 2023 21:51:52 +0800
Message-Id: <20230705135159.33327-5-frank.li@vivo.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230705135159.33327-1-frank.li@vivo.com>
References: <20230705135159.33327-1-frank.li@vivo.com>
X-ClientProxiedBy: TYCPR01CA0049.jpnprd01.prod.outlook.com
 (2603:1096:405:2::13) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|PSAPR06MB3991:EE_
X-MS-Office365-Filtering-Correlation-Id: 955ecc9a-c71b-4083-80a2-08db7d5f097a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VXI03kB42pLOhQS5i47vwq4B7OmnBYLn5kcZeCayerJ8Png8DEzuk/DuxEWHjfZT/ZkqSx1OdcS+5RyVD0XoqK0Ea3uJ65ywh98yW+FfcGKIMCD7jblK2mwztKZsbTT51f7XRgWusIMte5AGwasZ3vX6/SFp1fveTyKQXDT7bj7zshRVS98ELd43OMVmWaizMfttBgywG0uk7dnVOyK12K/lVO9nN95Hk5lrIbAqMJR06csEgAbf4s9+oATruBhp3lr5JX9zYWXTzZ3PO0OQf+S+3ca6hXe/Mv9tV/6gfABVq5p3iVCJQ0Mk/r2helRxinFi8P/gqaNFBnzne3OtWEiNhuu3V9YuHyReYOvip8miIsJAZAX/jFPHmcHABhSlCmrodk526mejPGg3UZMZwKYcJuUsLMedoYr5+rQp2n66W8/kWCUHxYmiCmPNVHCvw6anVTll0nkv54d6gpca/OtdVA9lpfJMLHUzr5Jk07e/72GVp/oB6beuvoDM0l4Q9VR6FBizAzBV2qb0UZnEkEVc6ZcwGOVGjF4YsUohQQFG+H9O+6H3C7t6PR4lKV50Apgtv+VOiFK03Xvlk+jckwQolbUKEkawnqWJZwV2qX55hS73pAc/XvDnilqrD0d9
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(366004)(346002)(136003)(376002)(39860400002)(451199021)(38100700002)(38350700002)(66476007)(66556008)(4326008)(66946007)(2616005)(186003)(86362001)(6486002)(52116002)(6666004)(36756003)(6512007)(26005)(6506007)(478600001)(110136005)(1076003)(8936002)(8676002)(4744005)(5660300002)(316002)(2906002)(41300700001)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rr479FB2RqAs/6yVNZtNJMWanO0p0rHBx68xgGoYnrcbGDBCLJ+jpGHx+xb7?=
 =?us-ascii?Q?9LWoIpDPUxZmIYf8fyjnFXdMYnXEN0K0sND61SOA5r1TKCkWlXDIDH3vdReM?=
 =?us-ascii?Q?dhfW2+//pmOIb612EPgahvBk9Ej+lDcnhQFa1bMOkF04VbXCQFFqGNJMmV8L?=
 =?us-ascii?Q?uM727L1VsiJyfrJs0IRJICovwMzt0klMK6RQkTObXOzxGEVegoWzsukz03W0?=
 =?us-ascii?Q?I+uwBwZBCotGvGIbmQHJiXuYucLRUW2Rk+RerV2jWlHXKWnD1bZUUxYrNNE7?=
 =?us-ascii?Q?MWLS+hd2Iq3F1mvYyQOizzEDVsmAy4BQG7+RVDK7ZD8FHa/UU8USME/fGhlE?=
 =?us-ascii?Q?k9hTEYEuk1AtPQ6DBAzWl2OSOMOr+Vu/bHc1BpbHZP3v7Uh016YutiXh9cxE?=
 =?us-ascii?Q?zIm44kttT2jgeT7M8z0bhGKZwjtVxfryildhjZIqew2jWC6N3nBjG8Q2PYJR?=
 =?us-ascii?Q?9gnYqRqh1WxPKNyfeaM2SftyB+ihsh1Adu3ecInaLWSSzzf96Wq0tfuvBTKf?=
 =?us-ascii?Q?+jIDx+Xq0lEp8Q1yXR+5Oa3T7KJDc44wVDKam+osehWddjYBPCHh0q5jlrdL?=
 =?us-ascii?Q?LK2MmCCPn6q2KDc5LpvQZyAt387kO6PxMQY2n3RbppJm+0kgUpqsmj8TVGca?=
 =?us-ascii?Q?/36pAMwQIYXdkJM+Ez0BF4EVi3UvFLpy5TcwJ+RXKWJpiDYtFJ0VTS79s2H/?=
 =?us-ascii?Q?Cg0A0wuCOYjriUWX8LDBbGQtPfyOhFQjeZrVz+WZCdXj9OG/0nUj5+j2F+g8?=
 =?us-ascii?Q?B5yXRqS7jqMS3bbXTlTC5gdNFhVyRR066vUN0+ZT3DnU2dQ8c67i9hbeZAgV?=
 =?us-ascii?Q?gzdF5fkIeXIYk/bFy3h1E8EWHQY6TvV5qzMzcya2rDQSYG4tFlpZmEzejWOi?=
 =?us-ascii?Q?sSnFrWYy6oTsNPdzP4EboRKYsh79CZxpVwqzx7ksX2/S5QtKx2JUeRyrRfMI?=
 =?us-ascii?Q?pbdfT1URjk6xKUjtrl8IQ7TLRty6SzbS5mfMUodFxLz4Ssl7f09tisj3LuXk?=
 =?us-ascii?Q?Thd6pbSCxQyakBLR8pBbcH9oV6OAEa8YUxfBjG5sIocB9AaxK1geac79MnaB?=
 =?us-ascii?Q?hobocEyvfrQ3eWraENQVqx2Avr1xGmTzVJrStljF/CU9hY/JFTCDsW6OEkEw?=
 =?us-ascii?Q?Er26wgbHDD5tjnNR/Vr4W0vqCVY4wsSlqPvdRA/C1lK9FK8nUzGsz0DVhskM?=
 =?us-ascii?Q?pWApE6Nv3CyGjza17ASx6eJx4zzjOj7LKG5WdzV5dmSY+ZEG6tRW8WUITG7/?=
 =?us-ascii?Q?NNPyvY0q39rTTZVb8KPyY+baLZDI6otVeOyhKrNeoX4Rv1AHvXvmoAXowQes?=
 =?us-ascii?Q?E/0YzyBI8HD/3mQgrBoPN1nHBIMDEtxUTW0okU+kon4k819v6xKxPjJS+w5T?=
 =?us-ascii?Q?KNJjpxJ5OW2rO7fgg0Gyg5z4mqEtxKRpiYyp+vejAkzaxXQWAMv/sbEEq+Ky?=
 =?us-ascii?Q?7j8rCSslLqRbJVotWKxNtlZMMbwcqUQOZfgO50TCkcpSpu03f+Ad1D7fM1ri?=
 =?us-ascii?Q?1m3Gtuk0WiKzT+8RVKwxVQMm7E9Jh+qe3umvV5KS7IDQotdTgoCESsIcXUWo?=
 =?us-ascii?Q?/CtUdvkjXOXTR2nbYZh/K6g0QOkDmxn3/2l3pdPG?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 955ecc9a-c71b-4083-80a2-08db7d5f097a
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2023 13:52:13.9046 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 71zHGlxt2zWL9e4xWZZw2LDE/Q7CaYoS6DDoFgfP5etWL0ERV9tzuPlz5BTftkxGmSNs43wAJtoI8TGnSzZFNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PSAPR06MB3991
Cc: linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Yangtao Li <frank.li@vivo.com>
Subject: [Linux-stm32] [PATCH 05/11] i2c: stm32f4: Use
	devm_platform_get_and_ioremap_resource()
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

Convert platform_get_resource(), devm_ioremap_resource() to a single
call to devm_platform_get_and_ioremap_resource(), as this is exactly
what this function does.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 drivers/i2c/busses/i2c-stm32f4.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-stm32f4.c b/drivers/i2c/busses/i2c-stm32f4.c
index 6ad06a5a22b4..ecc54792a66f 100644
--- a/drivers/i2c/busses/i2c-stm32f4.c
+++ b/drivers/i2c/busses/i2c-stm32f4.c
@@ -767,8 +767,7 @@ static int stm32f4_i2c_probe(struct platform_device *pdev)
 	if (!i2c_dev)
 		return -ENOMEM;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	i2c_dev->base = devm_ioremap_resource(&pdev->dev, res);
+	i2c_dev->base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(i2c_dev->base))
 		return PTR_ERR(i2c_dev->base);
 
-- 
2.39.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
