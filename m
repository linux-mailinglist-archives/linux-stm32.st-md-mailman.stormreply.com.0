Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 96099745BFB
	for <lists+linux-stm32@lfdr.de>; Mon,  3 Jul 2023 14:16:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3EAF0C6B45A;
	Mon,  3 Jul 2023 12:16:00 +0000 (UTC)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on2111.outbound.protection.outlook.com [40.107.117.111])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ABFC3C06F81
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Jul 2023 12:15:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gIbSWopspmw1EalAWislF9FdSSe0RUfUFzZyugLVRgv0XVAuUr/bC9R8QdOq3XBMHtQbgNMfNUPZENTdKtzY4wDioazX0Z73X02ljc3klXb1XusmzFAVadZ6g2rou1uDVUq3pv+reqaNwAtUMknOmtZ8lXUOYM6gPZgJZIbum+lcri9pb7Zf1Cv0T30c/j6HABasyMbfTlsTZHcGt5F03Fn2SFlJx1gBBpoOxfml+WBj/pZ+7XJeBX26HCJOoZf6oH6w2gsoyMqJ5twit7XyY8vdohKd52leJaXdzYI6gRhMI2PTZZDkxYjmv4MuyfdHbQMY8fODSwtEwrvdAbRYZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lmab9lxedtARErfW/eU77thoFuFbzoaAcpox67VHSVo=;
 b=Vl7VllKi7pr1y3HP0vdzbYGHpTHiYQEMPPHvMYQh/7I0+3/YO6XePJRjQCzXYJjtdczm5HCb40tozyO9CZUxt154KBic8ru0waG4p1awW06ubSRzAEJviu9HbEoN4j/ogxEVPwjAU4mHRENfLdJfgi5yxi4IDezaEWU1JJEqs8tWpfGuyzh2tMW2tFRMDSCD12PANhgsSAT/rXeesC5DK8kuA/uUHCDAjcvR1ru84cdmZKz5aA+yUHiLFuGHPalUqE+4T1k9CgnmKYFtzw0KGOWecMPjLqCNZeZl4hKRLtuwi/8wuRtSjDms6QR0c3f30U2Cr0MHfIIXDH5upKhn0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lmab9lxedtARErfW/eU77thoFuFbzoaAcpox67VHSVo=;
 b=kQMyXr7jT5yUDMySL5OKNT0X2Yu9GfDLw7CmddZ+oMntCQ1TKxnMf4VpDqXiVQEUVv5bZKXn6Wz2R8ZU8ekDQAgj9yKwGAPKj0MUvZr7m1dV2z0U+lhbcCIDFLqo7kRWJbT7N0DfO7OBzCLW6G8lEZs6rtK1emw0S/DmDedWJvKREiAXujNTSWEQ8bHPwcKAJGzaLa9kvhDx2Suk16hc0yl46eDlgx/ofYYGcuM5IYEktln+lYfPvvYhwWdafjdueEd5zDNr4V1o8EfSMDQsOJPclGvwBzeufIdg9yVKdH3tA75OQpmhXLvHa2z9jRjJHuyTNVvW7wiIPDoM3tsMZQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SI2PR06MB4361.apcprd06.prod.outlook.com (2603:1096:4:15e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Mon, 3 Jul
 2023 12:15:54 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c%5]) with mapi id 15.20.6544.024; Mon, 3 Jul 2023
 12:15:54 +0000
From: Yangtao Li <frank.li@vivo.com>
To: tglx@linutronix.de
Date: Mon,  3 Jul 2023 20:15:41 +0800
Message-Id: <20230703121541.17726-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <87h6qpyzkd.ffs@tglx>
References: <87h6qpyzkd.ffs@tglx>
X-ClientProxiedBy: SI1PR02CA0014.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::9) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SI2PR06MB4361:EE_
X-MS-Office365-Filtering-Correlation-Id: 9445644c-7d5a-4b08-7da0-08db7bbf3fbd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fK1Zkh18aiWB4pcdzjNZL/mMfNhqoiKAdDjZ2z1GGa8FvDCvs7/gPptuZXOUPLJUPZMEPW6ddOfC++zsx+r0yK5skJbEZ3Vom6tUdx8QSP3J8rkhCAFpHeB2fp4CLEaP+qfBYLfmXdBkzlW5kwHauSRlzSfVdzlbtHyT6RxK9NfM4j5yAqp4CU2+40oxn7ca6o52PKskme4iXaUE+ZuQxC6l5MoFCeIjzRcsLWsurxHKU385pG9UcUf4RW4Qlp6p+TQeACUNeycVBmPnOsKNDG+avEg5CtOy2Um0YxIcEUJfg5SXFx971l8p/YB5nLrgfL/4hM4g1Moayp6Lwc4cDejr0AZBqFf1Jysnk+Spox5MvN6ZvoKOIaPrMUQfzJG6oJmpAb6ieWotUN5/+0T6u1tKLtnU49V8A3SGpPETIYfU0vnT6aG7iqmkWRaeM/z1BHnqrs2dPA3SYST6WuYf6koV/hL0dcU4+5x2ql9lgONEDzluJJl3SN5/H4CUsNDftaR9HXLWYM/ys7lr+z3PqXR7PKebUAjX8ovv1ASH/9iNfoz6NKcWFBPC42IeFhFQ42oMN8KaRqFGjgb6KfePrmePY+G0R/Zh9n030xRMu9N5z+Kgn43U7QO/4W+xHcDp
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(366004)(136003)(346002)(39860400002)(376002)(451199021)(2906002)(41300700001)(5660300002)(8676002)(8936002)(7416002)(7406005)(558084003)(36756003)(86362001)(186003)(2616005)(478600001)(26005)(6512007)(6506007)(1076003)(6666004)(6486002)(52116002)(316002)(6916009)(4326008)(66476007)(66556008)(66946007)(38100700002)(38350700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fiNWTkYcXzDDXUuPlk5DUDkgNsZa7dpDfgxJ9nPBL1gmGcsC8muF7TZMkgXz?=
 =?us-ascii?Q?450wJrtub+VTkhJTVekNK39cEMtGUJvId2U5EaXWQVRY0HZ6j9RguyQl6AAh?=
 =?us-ascii?Q?8gQ1ki6rkmuScHUjYuFQ7TWa4AfwL4MKk4DvOpVF1SaLJ1mdOJoJTwnFDJQ2?=
 =?us-ascii?Q?ofbmXrXpGd+hOc5hhcF2P7BNGX9UlBZYELRMBlNV5U+yF3COmRcjj1E3QIXy?=
 =?us-ascii?Q?Kf07T5mKDvQ1qLyfm10w8uGuT39GUHIRCPIyEJ8ycXhylLddnMUk2yXRPEaX?=
 =?us-ascii?Q?HuEArgofSGwZ0AR1sk9H/sjq3Bib91DEcQxIfwTGo0fpPnDuKCon9g2UpNS5?=
 =?us-ascii?Q?uuQrkxSFBhhe/0Bd+GhEs67liiWGQu5Rt2md10oJvQBFuDIAr8Eo9557djBF?=
 =?us-ascii?Q?PnXAjNO4XQdcaBlipu3Ht8XPSGyYMHFPCpclOu1pLSsa6ipAVrOBt96VSan+?=
 =?us-ascii?Q?8QBI5bxpkzUyjyg5JKbWIjaVaky90goEsCJgnWfv1d/A/KramQaYpQiwP8l/?=
 =?us-ascii?Q?DpoW0ONwc6xhvRpdvwP8jksjJv9WLP1KsSSVRtHCkWgOXcJqntHQbYuvm2Cr?=
 =?us-ascii?Q?nkEqOEVKZSCUc0V0d5nR1tLZqiESk4B7+IDBbJ6pBuGL9hNNnZTW6xwIL8f9?=
 =?us-ascii?Q?sTdZCF6ApWzRu6QGBeBWCdz1OYb9mFTpUc7/htyRxPDKOPAs9+oePnXEmYY3?=
 =?us-ascii?Q?qroF8ehMsXeBfNEBtx8w7UuK0zGqIWL0ZzroZvNPpurGv0S+QiW2Kfskch93?=
 =?us-ascii?Q?0LSgdTD2WD050tlHmEDg0ozUJ6JXLr1UNCqW3rDb8hNUxBf3GHKu+DaCLA0u?=
 =?us-ascii?Q?dwNywEW4++qKnamiyIiEQNpAu0QFuVww65TFFIvtGgByraynyIjaLLAKiWz3?=
 =?us-ascii?Q?9TTIJLx6qZtbjezOE0J2BQgYcxCvJxeE7E1WePNT9dv71lIzFgfsBOU4FMz3?=
 =?us-ascii?Q?91EnobXywix4sPj6XxqhzbCmChyjrkayfhj79eHiUF58ca/IHLZZz1HapgMK?=
 =?us-ascii?Q?WbskaiK+bxRGBqbufLh+CgUpffCli3EvI4A66n7FWhzgGh8oiDTcTEdTzGf7?=
 =?us-ascii?Q?rYGUUOY9XxYh7K94/IjmfOzJ2IgJcRDYrLkjCplsBgnrRMFzj9GSunw7PhmD?=
 =?us-ascii?Q?/+QpMQwebpwX1A2yIDUlvcHxULjaHctuBZzsaHCb5PMeiRTiK+Ot8K0Th5FE?=
 =?us-ascii?Q?YwU0tdY6O2dseBU921c9OjX18GQ3QBRVkXSYx82KkxE8FWOd7UHDt6bU2+uP?=
 =?us-ascii?Q?z/D556121gwcYzeBh/IMg7C2T3IwiNK1lQcUYJGKZhGJ2shMV5R+NlgOt6ON?=
 =?us-ascii?Q?gT8VdZ1oHZC6G97+uEOzu9RxDExr/lQN82HF2qvSYQajKD5TLRWS2ZwEAjQl?=
 =?us-ascii?Q?7tmX/RrKB+NeTMI8DI1dXD0fKR+kaaGFVU52fcMZfCJ9vwlhxNddHsPwTcLd?=
 =?us-ascii?Q?nZZgWQ3yAdi3h7kJbMPDjHkMGXGWAKc99lyYhiXs2Cyj8Gx+ktbB0v5K0OO4?=
 =?us-ascii?Q?6n99wJxrFSBIZbVknVNb3naze/uFiH7dVQI9CtTGq/2X4U1rnGYicNT7rVeD?=
 =?us-ascii?Q?NqzPdkrvL0hL7uBYh32phBt8GpcjiOonu8f4NAjj?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9445644c-7d5a-4b08-7da0-08db7bbf3fbd
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2023 12:15:54.3356 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PbVh1lGJvenpl+KY8srJpEJq8y207ZdYP3xXMmEfy6ADffGZFGElUjMSUmgPFWRb17vgS231zfkSkAAkZc6Ytw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB4361
Cc: heiko@sntech.de, hayashi.kunihiko@socionext.com, rafael@kernel.org,
 amitk@kernel.org, matthias.bgg@gmail.com, thierry.reding@gmail.com,
 jernej.skrabec@gmail.com, linux-pm@vger.kernel.org,
 srinivas.pandruvada@linux.intel.com, festevam@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, bchihi@baylibre.com,
 florian.fainelli@broadcom.com, daniel.lezcano@linaro.org,
 chi.minghao@zte.com.cn, jonathanh@nvidia.com,
 linux-rockchip@lists.infradead.org, agross@kernel.org,
 bcm-kernel-feedback-list@broadcom.com, johan+linaro@kernel.org,
 u.kleine-koenig@pengutronix.de, DLG-Adam.Ward.opensource@dm.renesas.com,
 linux-imx@nxp.com, thara.gopinath@gmail.com, mcoquelin.stm32@gmail.com,
 frank.li@vivo.com, miquel.raynal@bootlin.com, linux-arm-msm@vger.kernel.org,
 s.hauer@pengutronix.de, wenst@chromium.org, linux-mediatek@lists.infradead.org,
 mmayer@broadcom.com, linux-tegra@vger.kernel.org, rui.zhang@intel.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com,
 niklas.soderlund+renesas@ragnatech.se, andersson@kernel.org,
 linux-kernel@vger.kernel.org, shangxiaojing@huawei.com,
 konrad.dybcio@linaro.org, kernel@pengutronix.de, shawnguo@kernel.org
Subject: Re: [Linux-stm32] [PATCH v2 01/15] genirq/devres: Add error
	information printing for devm_request_threaded_irq()
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

Hi Krzysztof,

Here. V3 was modified according to tglx's suggestion, if there is any problem, please point out.

Thx,
Yangtao
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
