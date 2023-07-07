Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 28FFF74ABC9
	for <lists+linux-stm32@lfdr.de>; Fri,  7 Jul 2023 09:21:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C3D69C6B442;
	Fri,  7 Jul 2023 07:21:28 +0000 (UTC)
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2098.outbound.protection.outlook.com [40.107.255.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 73C04C04B10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 Jul 2023 07:21:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WkuKsaw4t9RfTCTlfXfQ2K0ZoZSP2Q/OO86jgMFjz5YHIVOWSxCd9Uz7S8M/6Cvpec/Ll8w9fkwZhMnGrrYe4bNLfTaUpPd+7CDBISUbfrGM5YKGGhqCNYi1OtQb2IuD4+pbQMrmkbPM1K4C1u7kh5gFRPUoDqc8HTkj/iyp+AoTOtgq7bmkFVaIFMuJcq6Zrz036bsJVBHtKxdBz9H69SZaKtopK6KO9U48cnJzbQJboDt0YCr7N8nLjQ7QwC8itbLVQ5VzLnihKC4clFgblFlF6V/plhvLINkAySCvMluZlcEgL4NWHmLpTF5sswLCVDzq5vD3RJIhCHXegIHbpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B+UVYT/rqgG5zKmArlTCtLu7jKlSTrIahzylYaJ8ZGU=;
 b=Alv4XPT1riPg3QklmntaPsjJmPfvd999tSEp1ubMQz3Po/XT1+OGyjL894GZNyrMMToAg0BwixYQp1Q2y50NPT+yIYWgwKdZXuvpwcLVfAH4J9gr2sbUgS9CUJ+KE815HHUt55kBzfOHpCHYfd6b0PXuQo/EmBlxpiM/bKceSc9SwYbu+bJbnT1gw5hnS1qFIroOxVWQNzvpcGZVuGz5uyAKWcq4TPvz0XWHkvipM6Yp72JpXCbVmHO5elbuKAmc0t8TkgWYxH3uyiFXoIptBqcDKJ/DuoE9nDb0rwmYSzupOw3pQ3L9t+fOyjye37kUL+W5HpqBNpMV6YffcMCIgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B+UVYT/rqgG5zKmArlTCtLu7jKlSTrIahzylYaJ8ZGU=;
 b=LCwvKVPX0XMxYX81rjOJHkTU4krXJ561h89qbKKejO2IhQGvR7T+BhhV7h6Dk/RiaircyNTxDCmPXJrqW601OX2LPgqVdgCe+LPi9/MZYK0wY9Is6885DbNcIi3V33w4rDr9zMbScruM6x11C2cRVN6NOiHTbdfd6q3d9qa9ABsbhYnNtdfxWzYqnLopIpR5q1scEK73N1B1qVYmYv/dU1O8ZWJHY3x51mGFI3Txc06Zm7hhItSsSJpH7Y1KBi6hNpe0eGp+nGgYOOxT/yg8NeZvk6xWMeL3S4Ie5M5nQUZKF1nMkNafw+WVgJ4o4uIjz9f7kd6/PgU37Ht22liAmQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by KL1PR0601MB3954.apcprd06.prod.outlook.com (2603:1096:820:2d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.25; Fri, 7 Jul
 2023 07:21:22 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c%5]) with mapi id 15.20.6565.025; Fri, 7 Jul 2023
 07:21:22 +0000
From: Yangtao Li <frank.li@vivo.com>
To: Yannick Fertre <yannick.fertre@foss.st.com>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Fri,  7 Jul 2023 15:20:29 +0800
Message-Id: <20230707072034.48977-13-frank.li@vivo.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230707072034.48977-1-frank.li@vivo.com>
References: <20230707072034.48977-1-frank.li@vivo.com>
X-ClientProxiedBy: SG2PR01CA0129.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::33) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|KL1PR0601MB3954:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e037f68-9cad-4e1c-3271-08db7ebac43f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NKCRamd1pNDC9dwTnXeVtjtxM6cUJNdoLOS3eOAkQjuae0kFYE4YGAawegOPBncabX1JfaemzcOwvGDur3S00uZLL8jkx3I9614uSN8HndHFJQeaUlLJZBwgsPQmMBym629tjs2Vk5aBau7qE6z5zHTFztSBRBT9/b+F1FPL3evt8UapY9klTp0ZGF+9mJrfrX5i8QZWw2UrusAEh4cGbvWE71dHCb7e24uUf9lZH7jztihYe1CSNHgSmoPoE4W8blq8vr0pFmcabAEG9SWjZLTuAZI9JX/JQ2jPruFf/e/rDsVozvz3nN91MgzOJ+wv/OPBrYACvjAojeBW/PlwKtxr5CqCbQSpUQx0zrpcsZrhs78RWmZ2QGNQOZs5SyBijRHU3bVy1NRSxIcNIDvbI9pGuRqJt1xTQWWBVKWqOUWRr5O20Zv6Ce7DiFdUoYxx7X0luNtMDYsYEtVv56xGfBKCU3rYxSuHWj1F9BlpoyZDnU3WrcUzQOtfHn0J5AiKa9K8CeoxRdqHBw9kKSIofqcbh1SsSuQBb7BEyMzdO8L/Y40b/LMxl3ruE2uaSz4PdsPaLbmrs7KzB6eZsLZjEAJ5ShBLw4GYjW7cIjQdXPZDoaCE5zeqtXf2VjBaiWkv
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(39860400002)(396003)(346002)(376002)(136003)(451199021)(4326008)(478600001)(316002)(38100700002)(38350700002)(36756003)(83380400001)(110136005)(66946007)(66476007)(66556008)(2616005)(8676002)(8936002)(6506007)(186003)(86362001)(4744005)(26005)(1076003)(7416002)(5660300002)(6486002)(52116002)(2906002)(41300700001)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8+XwPCFZ9xlFzdTvqiXh8PG8CZp5zEtoSlj+VrdVEVbKJ2ep2DEAz1zJu7Kk?=
 =?us-ascii?Q?kGtS5pklG+GsuewqyXSwKYdoVILR83OYsEqIdn7KwiQFyOlJHGz67tzgfwXG?=
 =?us-ascii?Q?kVhq6MhUEi8BaXtZ4tHYn2eU0piBBziPGvLp5XgAvyAVp983Ae/iDNUFfw1I?=
 =?us-ascii?Q?Vn1fF8S6v5rbkQ+HEquGpcYWtHhUKKY6EM7okOkvZUBbZh0IYuwgpp6+OMnA?=
 =?us-ascii?Q?tIDftlMO7qxFQ5V3a3dGyTWsOkjRlfOJWfvGbZNkm1ZZWmGJb2kCd29q4pr9?=
 =?us-ascii?Q?S/1rQdcBC82KLwS/+kHQlu2mdQ2b5Fkiofaoc9m+T2CKE3R8XvfHHnEaLiO3?=
 =?us-ascii?Q?LWat7Z5kPHm5KhaTmbzSeucyk0aZ2AAFZ1dHwa+BrsJ/2nNqI54Fe+0wGY9Q?=
 =?us-ascii?Q?r9E1SF6SBH9AfzybtmqVUl0qVv1K7QlJu84vbPnZtOaQws4U5/EznVnIXXIV?=
 =?us-ascii?Q?2flql+VvCS6rRexM4/02Ha5sIFl18ZtH1WHDard/jYoWWACB3DPZR+W/aVME?=
 =?us-ascii?Q?H4qDUxRbE3gdhcyGWoeRDaFcahMs8NQWjFWyLW8AI0UYm1VahY+12zX4USUd?=
 =?us-ascii?Q?AUXwUYm0vch6tr/LoOXn4D7u/82kD/igWehPPUd95DU2ySfZhEpAv3nYHUM1?=
 =?us-ascii?Q?7Ex4RmTu5uzOfrIqiLKwSEoPjdZ4oH75OkV1piB8UEZX109u6khxiAvkAh0c?=
 =?us-ascii?Q?08tCS9CANLkY5lL0xqxSWX5dafXuD9vIt4HxNTsmitcFN2shB/C6GfqMiSk1?=
 =?us-ascii?Q?wiXZFn8C6Z0N+kS8wvInUbyKW2hLOvnc+AkskoHUdAxYtuwX1VSq+i+cEULT?=
 =?us-ascii?Q?Y1jlUsne67cKzXhFWJAA+vh4Ihhk4RCh8OUWi+lRZf7jjhweUimzaiwcvDnS?=
 =?us-ascii?Q?e9+/cao1DADYTdqLPiOxyrWX2C3Y6+Njly3QtZ0+2XqQv6oG4fA6ZBJg/HfH?=
 =?us-ascii?Q?7axbI2BE+A3S504nKv+Td00FfrrFvdpQXGj6aAhhI0gGmtVwkehzyxpY75qk?=
 =?us-ascii?Q?GHulOyljKNZ2gR0jX+4mauagtff05o83PFQrZL2nSBRnT2M6VmxV1pZFaN1h?=
 =?us-ascii?Q?RakA8OjVoY5rd8NTE6upPBiEDAORXDw26UCySu2LCRVjlxYKtWMd0823dbpq?=
 =?us-ascii?Q?4sd5JF+ziKMjJMenMYTh8+PYPsie8fs9/nZdA+qu3TyGjPiCcYxRT8NTu36f?=
 =?us-ascii?Q?fBLrOS4KDIBPUxrNUwRHo3BqzYjMUsqX6fwCKxWEgukG57DuDd4aiH15jvjz?=
 =?us-ascii?Q?6BuJYXHQMn0gBbxJP/XucLZNByUq4KEG5Uwao0Rrv6bfeUKLuSjU6NULVEEc?=
 =?us-ascii?Q?lWpaxGr5odCRF7jWsWfQ6WnW2pHczsRidNUsTVj7lXCcJBZonaXM/uk2JV67?=
 =?us-ascii?Q?qtPaPUu2JKyowloF3w+e28lK3gowLzj0p36pZ+dczoWLP8UlQGPzr09rQqIl?=
 =?us-ascii?Q?tUeZubx5WgVh8YtW9zBBzLv3EtITqx4RZZlJXEY7sxDEYhAkuPg2/XIUrgGb?=
 =?us-ascii?Q?NYUgGMqz9iM3Zzy9j0CEo1fnh9ZyxO3ZWJd9o1faL5VLNjJfAeTjGp5yxib0?=
 =?us-ascii?Q?Asr/9XtTjE0RGGGCVqU693LRbEgOCehTwqIcBj+B?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e037f68-9cad-4e1c-3271-08db7ebac43f
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2023 07:21:22.6650 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A9I/S8EYVEs9um+QnfghzN6ztuMNH4IWWhU1SDik08pfnHw9kWS9LYU2OV3gP8m7RsWzBLFCVHc25wW8lml8mQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB3954
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, dri-devel@lists.freedesktop.org,
 Yangtao Li <frank.li@vivo.com>
Subject: [Linux-stm32] [PATCH 13/18] drm/stm: ltdc: Convert to
	devm_platform_ioremap_resource()
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

Use devm_platform_ioremap_resource() to simplify code.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 drivers/gpu/drm/stm/ltdc.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
index b8be4c1db423..734dca4d7dd8 100644
--- a/drivers/gpu/drm/stm/ltdc.c
+++ b/drivers/gpu/drm/stm/ltdc.c
@@ -1925,7 +1925,6 @@ int ltdc_load(struct drm_device *ddev)
 	struct drm_panel *panel;
 	struct drm_crtc *crtc;
 	struct reset_control *rstc;
-	struct resource *res;
 	int irq, i, nb_endpoints;
 	int ret = -ENODEV;
 
@@ -1992,8 +1991,7 @@ int ltdc_load(struct drm_device *ddev)
 		reset_control_deassert(rstc);
 	}
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	ldev->regs = devm_ioremap_resource(dev, res);
+	ldev->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(ldev->regs)) {
 		DRM_ERROR("Unable to get ltdc registers\n");
 		ret = PTR_ERR(ldev->regs);
-- 
2.39.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
