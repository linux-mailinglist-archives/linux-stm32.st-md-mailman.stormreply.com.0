Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A9EB65FC3F6
	for <lists+linux-stm32@lfdr.de>; Wed, 12 Oct 2022 12:53:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 39945C640F9;
	Wed, 12 Oct 2022 10:53:32 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80071.outbound.protection.outlook.com [40.107.8.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 91F41C0D2BF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Oct 2022 10:53:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HoiHzBdF0cHHJaYxipuMFYoJtFqbezzJzU/H9q/t0cA3szGRpoNQvnqdjH+xfWbK4X1fuJwN2LAm4WFceVsuKXWUY0lSXA+J8rOoOFwgxCMMVuSJGTJdEY280qOjep/BeNPltVjLQe8tudkgG7ZXWcgd1rHVYsY2vReIJWEuqnbgnYxhyuRN37BMpyd3tyjBtl/BXsGfnjwhPdOiS8tHpqwS40um8vPy5ONmtAyFToBQOWLsAnWwglMWk/dAv3O6uiQ3lsvTwbnvjgFn7YQlCQh0tyyEdbPGT7zvFUZlvODdwzNzdbOGbp6iMbsyHVMo8JUCGelkoM8Hwus/kE9MsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e9dBqHZnU6V4iMK0krpjsTQscwjITlsAc9ia26C/hUw=;
 b=AmpFYjkPYv8bqwwSxfo9iZoMVjD6kfOoCSkdBWwSHh68jb49fVhGrgBeWzfdQrU/4OshFmYFKKTpaxwbaNLtzBVX9jqQGwmW7J3c80iMtDLczw9wR/0yyRetg/Q+Rizn6UwoYS1HMfPRNQylVQI5xS17wn8b3kWC1v4J2q31rL3aABkEW71L19mJHyhpiI+YNrp3+1J8UL55GuNvbxVPH6vMBooZGxsxKKEE7gXZ6P6EgskLo877fCCitod9kSPI5dH1xZlZJ+RYYoIdjW6BGa1vVy3HG8CK2VAJlAopOn+xX51JdbT0wnlfhrNStx5JMCow0FXyyvLe2LfrCF60sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e9dBqHZnU6V4iMK0krpjsTQscwjITlsAc9ia26C/hUw=;
 b=EmEJoYoPYhlAvJwsNQWbQlAJU57MgG7CNXuDWCe7O6cm2fA1pUl1oL380/kv93SSv7ILUMxRGpe0TWuw/9D7N5sdS8BDzwOiO4KsUTUNm2RjG43prvUJ5weJq5om4+h03GX1BSztTjFL0soIHwC6Y1h6fFFShLz37QnS2q+gzZU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from HE1PR0402MB2939.eurprd04.prod.outlook.com (2603:10a6:3:db::18)
 by DBBPR04MB7675.eurprd04.prod.outlook.com (2603:10a6:10:207::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15; Wed, 12 Oct
 2022 10:53:28 +0000
Received: from HE1PR0402MB2939.eurprd04.prod.outlook.com
 ([fe80::d8b1:a777:e29:7a5a]) by HE1PR0402MB2939.eurprd04.prod.outlook.com
 ([fe80::d8b1:a777:e29:7a5a%9]) with mapi id 15.20.5709.021; Wed, 12 Oct 2022
 10:53:28 +0000
From: Clark Wang <xiaoning.wang@nxp.com>
To: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
 peppe.cavallaro@st.com, alexandre.torgue@foss.st.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com
Date: Wed, 12 Oct 2022 18:51:26 +0800
Message-Id: <20221012105129.3706062-1-xiaoning.wang@nxp.com>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: SG2PR03CA0107.apcprd03.prod.outlook.com
 (2603:1096:4:7c::35) To HE1PR0402MB2939.eurprd04.prod.outlook.com
 (2603:10a6:3:db::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HE1PR0402MB2939:EE_|DBBPR04MB7675:EE_
X-MS-Office365-Filtering-Correlation-Id: 3dbbab5a-f33e-4cd2-c5d4-08daac3ffea5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BZCpVPTLhZlYv7wLW8BJHZ2Vm3MINDEfhHcbXy/rGwNTUQ79w+EwZzZEtj59+6Eaziwbi67deJmVPGIAfHKfMWLSGI03vvNMn2C4fPZkOZNdIctQSLdOAUw5+CjGZPREAYDRv0JmAZowbwzWEVbbz31OdgmGruZW5lOwN4vB85O38e9Gg1n2zpYpq+SFIAafik2A6E+6GBVcoDwL8FDt99OgVQf0ytKs1DjF+Dq/4Wvv8ML9wSiQ87eCp0ChL9Og4PopNsgNtV3ZVILSkW5AIGfIHfXBOBNeSuqdHgti71QTg4Q5LcGcYbzWmWYlLLFNMTTDnvNrnoDjbl4F8OsnUZuuYnSmMAx9y0wN9a+bpckRI/qXlXQmG0LGRSNNV/yCAHgbmkQNnQrB0jCdjWVb+NKWaV6Ih64boxDr1xd3PZPnrqMnqvQENFPn97P56JNFWe+8vXqGuFxpfriwkNSDbBvXwSqUTgr2tonn/4bAqBcXiupKiM248Rlpu2XLVP4bqvto3a2UR4sIsaHEbMgf/VDY2h2daet8iDaYBOsJ9ZXS8iPx3u5YxUVRBqkCuAQ+15QSGWli0fI6utP7KNABH6ihpM1e5Rpg2yEel5yI539JpHfk2CqP0X6LAXkgwTLp3twBOEAesX32JBrwp4U6QDDE5VukaNJpwwwL0sucN8c2+zAhGVhEbrSDfZZ9uOFaRO6QAnns3uiYpdGQxh5nWHkT1yjtRfG4FQ8vyTdz9meHI8ASSYx/WX7Yh+w6YY0AK45C7P2WKzT6OAZ2hHOhLluPJ6U6P7z6hh4jwHtYcAA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HE1PR0402MB2939.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(346002)(39860400002)(376002)(366004)(136003)(451199015)(921005)(478600001)(6506007)(36756003)(52116002)(6486002)(86362001)(38100700002)(38350700002)(2616005)(6512007)(186003)(1076003)(83380400001)(4326008)(2906002)(41300700001)(8676002)(316002)(26005)(5660300002)(66946007)(7416002)(66476007)(8936002)(4744005)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ttpfQ4wFavFNF6rrldplqBqahxiCNhGzkZCppdBc66WDm6FbsmdwmvR+UvDb?=
 =?us-ascii?Q?2UA4TOAYyv9TTnwJIUMKxatzcGC8CLlUDaTTQxQe1ZZRaHKVyA9NedjISvBN?=
 =?us-ascii?Q?kbhu7R0rY6uXIXNz7ZmxNInSnsOL12cg0r4AD7AYQEiNiFHaEH1Fz7PmpPtu?=
 =?us-ascii?Q?KF0qQeN50NDvRVw5n1nIJhmtLeFriuQyRWxB6dX3Qr4MSLOocQFt3849JBIn?=
 =?us-ascii?Q?w4Fk/OkGEWBJhRmBOPFkpq4DLvZL6xYd97uu0vw6i9W9Lzm66rpvDVvBTU/1?=
 =?us-ascii?Q?DJj65iIfemJsu5zf7aXbUzLzkxrGaGu653RT+eH57bT0tSDEfmRx8/6HJTqF?=
 =?us-ascii?Q?x/AdD7g2SQEOoaPZv9m09OVzAE99/vMvuuf+aIv9nu60J0cHxET13d/zWf+S?=
 =?us-ascii?Q?fzQvIAKvA4/Y+03cVZRokEVGZERG+42t0kmlP0SalxegTHk4qFJ41OGEYN9z?=
 =?us-ascii?Q?ixCdtCNaOJALcnwit7htR1CvMD3xUIwzky0b+gFf9lJH9PzSJOk2h5TyJ/DP?=
 =?us-ascii?Q?IOlQbK8R/Z7GuLiXE0Z05p+JbsRwqejY96vXuytW3vP6lBYTEYDkExBaqEtu?=
 =?us-ascii?Q?ZBVrBajB0za9+z+Uc3GufFD9hfSdZwEj8A6LtJ3i8yZQ3wBB6WW2Dxf6l5/n?=
 =?us-ascii?Q?+JHhixfZD78a67XMv1Q5jgnNrgyDRX1exsI9gIZg5IVclZrUFDqiXInzQv6X?=
 =?us-ascii?Q?n6amOtPheBRjdnVVh3+2xKzSfy5+Km21Tg6Yb7RKgPF3GFxpAZrbVNIJ7Mjf?=
 =?us-ascii?Q?XegbAD6dDX0RwcDvDTyOa0TIPtaQNGcw/lECHqbzkCS9LL2z54TsKZO+K21G?=
 =?us-ascii?Q?GM3tza54Yhyn5BLtnH4ofSYXjr4sTBNuTkewLj5533AonvWftWcnL8D1FLT1?=
 =?us-ascii?Q?YNhw6PLbsOLWpJ7i9lbOj9kYsHv0Rmu8X5P/5bPvBSVP1VF+3FKysn5Rycjy?=
 =?us-ascii?Q?32MEwf1y5IXZ4N5oEAa9s7uukJVijTUmyHV1bgT0FHbLPUnWo66Ef56ZCT9U?=
 =?us-ascii?Q?EOwgl+jArPax+obbol4v3HXW6lumvddPJDWkOfqnC+WvNMUJCYuthDUn/jWb?=
 =?us-ascii?Q?T+Tq3YuIOqjFeZZNpAcWxfGxMm8lNswsVt8jT7BUTUvGRvPTvhXpZodR76u3?=
 =?us-ascii?Q?OZeK1GshzDjHf7yeSGeq32dbkbc6EBDhBDr+VOrEy3bRrR6BzKg/QbhPAMCl?=
 =?us-ascii?Q?N9kLqH9/e+WnjMeflxPOnlMhKvg2mMPUFztf+GLgGuzmhWMYrYi4CNcRshtf?=
 =?us-ascii?Q?B0ZfQrvoY9NPf0V6/0/zYQ2Kzl0hL1nHTeV6A80zRzcqmC3S5XO80k0fhzoj?=
 =?us-ascii?Q?C5wzPFObMf4/2rnuk3dwcQdaFgYPEctTJS2n8k9rem2d0VPmQTyDszLj6AxV?=
 =?us-ascii?Q?jWNcf+rTIsi77Nw7QMpJyIBgaFcnjmo6Rhd3viJ4f82siYtB/V4Y5+dSN8eq?=
 =?us-ascii?Q?GYlEgqEA/f5rzPE0uh88gks8arAEBUbt+6AbMO+7FlAFLg5xOcRxUwiw8KFY?=
 =?us-ascii?Q?5QC82otlUhYzh9w19+V+ufqVJ2y8QFNngHL+elsb6dEI3tfel+4tNLJmdTWZ?=
 =?us-ascii?Q?t46Ra75XsmttsB4dblt6HVCEY6DtBys5x0XwDYwC?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dbbab5a-f33e-4cd2-c5d4-08daac3ffea5
X-MS-Exchange-CrossTenant-AuthSource: HE1PR0402MB2939.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2022 10:53:28.5290 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ts46iMdCmOVwndkW+v0oyb0J2tbE6+88BYnOGES0pvk5U7EKPQTVvGXMzZCrpW7kiNpaQ1qOn+M5r+WTlhjFVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7675
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@pengutronix.de,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 0/3] Add imx93 support for dwmac-imx
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

Hi,

This patchset add imx93 support for dwmac-imx glue driver.
There are some changes of GPR implement 

Clark Wang (3):
  net: stmmac: add imx93 platform support
  dt-bindings: add mx93 description
  arm64: dts: imx93: add fec and eqos support

 .../bindings/net/nxp,dwmac-imx.yaml           |  4 +-
 .../boot/dts/freescale/imx93-11x11-evk.dts    | 40 ++++++++++++++
 arch/arm64/boot/dts/freescale/imx93.dtsi      | 22 ++++++++
 .../net/ethernet/stmicro/stmmac/dwmac-imx.c   | 55 +++++++++++++++++--
 4 files changed, 115 insertions(+), 6 deletions(-)

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
