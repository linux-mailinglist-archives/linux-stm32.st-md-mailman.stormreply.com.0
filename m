Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 36781751E84
	for <lists+linux-stm32@lfdr.de>; Thu, 13 Jul 2023 12:11:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D64C8C6B452;
	Thu, 13 Jul 2023 10:11:28 +0000 (UTC)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2102.outbound.protection.outlook.com [40.107.243.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 07ADCC6A61D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Jul 2023 10:11:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hY3lsrUPegQ5cVqFaxB8O/YS0E/rnFY+2zXqQBbKtQopUaYHMFJM/RCtAGwT48U7/b3kKGKYRxkVGBDv4s0196WxwEdHtukaOdvWZa0PQUUjAPWSodwl0VR8NwCscJK2kORk2SeF1eMoOSafTYU8ZBfvj1+y8p8JyAt330NFUsRPZp5YPIFx7+wELPDThTRSrdh2L9zkIIwQ9uAGIKC+WVbWkm3xL2pfSz9ajZRDgB9OXQ92Q56k753yScaCfaWuDMBRC2r5dATfflB77smBiAHDt0Q+j+s1FbabymD3a1X3hhE1imDxR6/tSULFgXD0punh3sq1rDPLgIpqCPwBQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y8tI1OnXJdJaGdxlYBmbEhxeLJrJM5aHUCaAtmj9n3w=;
 b=InOfFTCd7xxl0MsvQnGt3R8YePCcZvdRyLDo5l3/HhrvFN2PHMtbc+Qz2x/7uDSvPUQv3lXzOCD6N6ZPXf5ODxM9478K0y9VlIxTx1yjfmEiAkZQPRtUw9jIy7IhGoxSNV7M2gDjIitB9srGDG0t8daEzQNFNeK+J2D9uxXFMjOFTBtMEQRsWH2XCN772pbWrXda0aX+ExKLEm9WIbVEXT1bgXe0uHr8kJ2TFZxOxnfyvg6YW9MHTEgPWuz5R7cfoWaFaUoSplUbMzQXJs7cy10f77fBwxmMeWwmrCIAhMiZ4PnL+a9LMfW+5u1gZHBbSZgrsevzMJrNoE17BeE0SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=corigine.com; dmarc=pass action=none header.from=corigine.com;
 dkim=pass header.d=corigine.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=corigine.onmicrosoft.com; s=selector2-corigine-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y8tI1OnXJdJaGdxlYBmbEhxeLJrJM5aHUCaAtmj9n3w=;
 b=juAMdEjLvntGFEnd/P27gtuwPV8v4p/CXVBFD/SZJJJ1ofJDbsFX7hsv2AbMi/9wcl8o4EM8nviPp8Y7pWSVw1Dlmn96Qc6gfq4JPc7armdsaeaJw1PlE/Lgt7VFhlkxpf8Z7rM73p0EIUN48og5TrVWjTsEYLLI+dGKi7SqWc8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=corigine.com;
Received: from PH0PR13MB4842.namprd13.prod.outlook.com (2603:10b6:510:78::6)
 by DM8PR13MB5205.namprd13.prod.outlook.com (2603:10b6:8:e::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6588.24; Thu, 13 Jul 2023 10:11:22 +0000
Received: from PH0PR13MB4842.namprd13.prod.outlook.com
 ([fe80::d23a:8c12:d561:470]) by PH0PR13MB4842.namprd13.prod.outlook.com
 ([fe80::d23a:8c12:d561:470%6]) with mapi id 15.20.6588.024; Thu, 13 Jul 2023
 10:11:22 +0000
Date: Thu, 13 Jul 2023 11:11:12 +0100
From: Simon Horman <simon.horman@corigine.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Message-ID: <ZK/NwLiIgEDNMAm9@corigine.com>
References: <20230710090001.303225-1-brgl@bgdev.pl>
Content-Disposition: inline
In-Reply-To: <20230710090001.303225-1-brgl@bgdev.pl>
X-ClientProxiedBy: LO4P123CA0414.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:189::23) To PH0PR13MB4842.namprd13.prod.outlook.com
 (2603:10b6:510:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR13MB4842:EE_|DM8PR13MB5205:EE_
X-MS-Office365-Filtering-Correlation-Id: b40a3719-3124-46e7-058e-08db83898239
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2pLlvAQULAPO2uHBVLygQ6F1/3K36IE1QbLYS4kAzp6oq0uXcwYIg8mSAg0O8upGMRKkvhcE8KKdbU3pHzd3KgSwjzskkHbU0d4dXZZnqCWgwDa3Abt3DXXQK9tDJAGxSNoFH6sAyjHCdVSOv2E+5orWdfc56b4AbnHju5z/rSbYyHU1DsAigniMfFO/9SRrGudZzVVycINjV5Zh6KhJtClDh+3uWR3c5Mw5xtVYzEUiivp9zAhoXvrdijtgZlS39n9W76dwZAxIKtYpGJJ0M2lQ2MHiDVypNxAGQhjuAr0Rb4yFZk1ptWXBLNfzn6QU82mSSJQ3nDXafkeNodUo25bl4eHz29XktWXXJu+GNEYIeOk1F+WQjGOf7ieELrzjFAY7sa5LoAHvjIVb38bdUu+Sv7u1W9E9xKUOf7ScZVZkjWw6nTT1TVn5PWHzjn5ztsr834b2ViyWZIQkh3yL40ivV/q2kmKwwdhLX5+lIo4N2gQ1VPSM7TQsB6JizTvZeQq0ls/09YgU03p4dosaQRbIBpWPLSunTlvRwIYiLlpJsdv8Kj9VwbCR0D1smlT7VDXM9+wcn7eqle0JynWMgP1ht/sFh/b+siUVyJtlBNs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR13MB4842.namprd13.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(366004)(136003)(346002)(39840400004)(376002)(451199021)(8676002)(8936002)(6916009)(6506007)(26005)(4326008)(4744005)(66946007)(66556008)(66476007)(86362001)(316002)(6486002)(2906002)(186003)(6512007)(7416002)(44832011)(38100700002)(54906003)(41300700001)(2616005)(5660300002)(6666004)(478600001)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SYB2ysZcVCQUvevh0ELmLt2LSdr625KKpFs6VArvU3XVxfrULC21wgyn7H0n?=
 =?us-ascii?Q?1IYeE4wvX6EjoBF2pHdsozRyPreC87xQ+BDNHMYYMNu96UtilVBwITIuS46K?=
 =?us-ascii?Q?BPaUT4aRONCDdqyuOO6L90GOtkR76y9aNIcRegOwuVw5aUN9Y0bUzCP5rjrB?=
 =?us-ascii?Q?o3KQ2BbaUEnAv5Ep9UNmlKBBqYr9HPhY4eqTcSO7uTAkn6YswfDj2ptsJO8J?=
 =?us-ascii?Q?1bPQUylp7WJuQS/DGNkz/7giU2nds7egLjfKSjUQh6XcnIRMALFuwsJVzVzZ?=
 =?us-ascii?Q?BX4Ks6KT1tJ3nKPSudP3lP+P5jfajKi/SIqeApNUKyQ0LQfzEAAXFJYKfUV+?=
 =?us-ascii?Q?kvV18CXb62JfMZQOyQNq5jROyFERp4pJ/j8wTOhDUlonTzjnTonUghQwGP6F?=
 =?us-ascii?Q?TBclFZJl/7/KKh3/cHS51WVX2pVsMMyVQFIXmbWC7tCQYvgWP+k3Ka0U1BxY?=
 =?us-ascii?Q?StkyLyL9jJOxGoUqcZanbB6iZsUjAbsXy5/maMgPH/cM2M8rc8IDRGGReqoR?=
 =?us-ascii?Q?Cdmz1yigaZNSKlt0OTmZ0/2R+b44G21bQ7yN41qclzJ8M+MiiAu6xv4WdVJV?=
 =?us-ascii?Q?HhfR/iTmryPD4DbbwoWJizbzYNHcDhybiZgyUeblh9/WgwTAN9S83CnZ2ajB?=
 =?us-ascii?Q?UrLk+KsUQlL+zxyCymPE4A8E/udIzTpL92Zj3PPzV4oa6VyBHckUQ8L/aYVp?=
 =?us-ascii?Q?nF5/GihB+MkqhZl0uqkDFmP9A/N05Me9tVQfcmu9UQDLqDk46qIsNrpkh57d?=
 =?us-ascii?Q?ftXkzi1/YqE/BzTCBUJzQrROVJDPyfImqpjJ0DncYwWP/aa+YXmHD0UCABkD?=
 =?us-ascii?Q?Dcki2bsDPaQJXimGF7AljS4Ur7gir4Bds5pO1pKYQQDWgKfqAMK0NA+dI3xa?=
 =?us-ascii?Q?Z3v2yBR8/sORs56kpPGtH3oJoElbYr7MGZXrgoLEopOvOymwoDM+nm4f/2Rb?=
 =?us-ascii?Q?qRhCtAyM2b7ZkTGoMqZzTWmoNDenH1QRHHOjOplUlCQEkeZkIq5jHs8fwKuI?=
 =?us-ascii?Q?qFjrBq3T0eaTGY4J6iMeo5AEp1VoBnJeCIAay66pAxHtW1UsruuaoFuqSHYk?=
 =?us-ascii?Q?7wftzOX5IuqvBDQZ/IycX2KgKduIVwKJr7a6o2EN1SMebevLxNCnz1m0UMDz?=
 =?us-ascii?Q?XPI6unQMD5HJ95CkdrjBQotzRHNM/0dkMYQHq+0zFktgNyCttkARfmsXLuAR?=
 =?us-ascii?Q?3cPVD6jCxn8oPvU7zDHFPwzhsvizGkGllt4ydZeFSsFKzzUW5+Vna+GfYPvh?=
 =?us-ascii?Q?qFgRHVQWqMiO0FAu6fJe8y0bOYZjAx8C2DegHC3Hwz3HI8o+1CgTIbP1XSo0?=
 =?us-ascii?Q?MTfmYL2RtKs7zg9K1nixMa8Clo0VJ62z6ccp2XEZuXZHq6L1cRiEroh3N84A?=
 =?us-ascii?Q?JIHAzbStRZs2lhI31MJMNsVU/VlwNapbO7fy6h4Hy77vhRBmqn9aZgXk5xWh?=
 =?us-ascii?Q?OpEW0jCRPcfPgqrbvoZVaRxdxmuMNN8yI6YwEkDCjX3NzrSOkgCuIOdHjLRx?=
 =?us-ascii?Q?Wwu53U5TwPzoEpqgeUVc/7k72MgASnhCRhBUT0oFmG4e+sjgWlSN23YKSP17?=
 =?us-ascii?Q?nul0XctYXTS2GmoxC3TamD8EGk6s374qjujQDraFfKqS64U52TpPzLEV/xJs?=
 =?us-ascii?Q?iw=3D=3D?=
X-OriginatorOrg: corigine.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b40a3719-3124-46e7-058e-08db83898239
X-MS-Exchange-CrossTenant-AuthSource: PH0PR13MB4842.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2023 10:11:22.3500 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fe128f2c-073b-4c20-818e-7246a585940c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sEHw8PZ/q1iEPCxGgN4VrAyfSz/tTkZxAElf1xAmytYOpQm9o9xRNO8oT0+eL7It2LPoum4gpYHApNdvz6ty1TXGPdnu/2YzlDnMjMvSl6M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR13MB5205
Cc: linux-tegra@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Chen-Yu Tsai <wens@csie.org>,
 Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-sunxi@lists.linux.dev,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>,
 Richard Cochran <richardcochran@gmail.com>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 netdev@vger.kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S . Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next v3 00/12] net: stmmac: replace
 boolean fields in plat_stmmacenet_data with flags
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

On Mon, Jul 10, 2023 at 10:59:49AM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> As suggested by Jose Abreu: let's drop all 12 boolean fields in
> plat_stmmacenet_data and replace them with a common bitfield.

Reviewed-by: Simon Horman <simon.horman@corigine.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
