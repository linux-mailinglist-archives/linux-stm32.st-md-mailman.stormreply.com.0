Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB3E39891C
	for <lists+linux-stm32@lfdr.de>; Wed,  2 Jun 2021 14:13:17 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 97DCDC57B78;
	Wed,  2 Jun 2021 12:13:17 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2055.outbound.protection.outlook.com [40.107.22.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 39EFDC57B79
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  2 Jun 2021 12:13:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lSGaPOtv2prNqIcsEBFEYO25iu137zz6u7PndpDeO3GJ66YtpSqWPMM5jjgspisYyrR6Kr7e5cwBq5Nkxv3J7v6DVFSylAJUpFOJMpqa230FMc1VDiQhk4jw3LYReWJ86qhlrmPcpXDIq7JEkUgQ0a13g9Hpywqtv02CS0tSZf/B+VxTXVdKNQiFRNDnJ06lOgKguLH5vGJChg4sAF0ZP15VxQ/HQCWEgUn5IVI/H4ac+7he6u0Q+g0+OHR0HRS9nuS1+mj+WjqExfeNjHYX6oDqneR/LOhoJEVrKf34z4kT16m3NcDtYEixB2QOdjBWR2OZueL5Y6u3zsxuuO7c8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GUl1y4Jg7eMgXIC0FjWdnqzMrqLRLNIwrz3uZb/tj9o=;
 b=gcnRPiZmdlYBTOcBkgZ1428jxzKBhyzDEeVHSSzbSq8xLuX8pbWxaTXWVeH/yTQLXgpkOYWldmpQ5XF2tFiR5n90qtVwHZMtupggyElLYSP6BFleGmg29ZJMFgfLrrjqfNIXE1OpWQ0fjYLG3y4R9PG2krA8F0w8VgzXs/qb9IZOv4JKshSw4YmIdZRRGFkW/OxQuWpaNCRRg1OyoX0WwkT2LghjlPLyv+2BwJlswpCeb7zZXet5SfZn5rP/13xmCJSlbbh7BfeaQuujdin2Bk1a8iIREbiQ3AmxXmoRmoP2jSJRy2Qy7bkXi8vPyciLSi/iV6j3zWf00okMgS5GuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GUl1y4Jg7eMgXIC0FjWdnqzMrqLRLNIwrz3uZb/tj9o=;
 b=qdhZ9v++cDGg5bhKVi0hJfU4FzgCSqJ4QslNwSswV3vEdSnpCPADLazEjkvKCZIUJZ5bFaGPJobkxSwRYpNwYS3iJELcbm7WCdbbtB5LWRkNzJw4ek7dSDIPZndksffvOvD/Gxy0AGnxWQuRPqkt2hms3/4i3XFD/7L7RMIoNgI=
Authentication-Results: davemloft.net; dkim=none (message not signed)
 header.d=none;davemloft.net; dmarc=none action=none header.from=nxp.com;
Received: from DB8PR04MB6795.eurprd04.prod.outlook.com (2603:10a6:10:fa::15)
 by DB6PR04MB3208.eurprd04.prod.outlook.com (2603:10a6:6:3::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.24; Wed, 2 Jun 2021 12:13:12 +0000
Received: from DB8PR04MB6795.eurprd04.prod.outlook.com
 ([fe80::3400:b139:f681:c8cf]) by DB8PR04MB6795.eurprd04.prod.outlook.com
 ([fe80::3400:b139:f681:c8cf%9]) with mapi id 15.20.4173.030; Wed, 2 Jun 2021
 12:13:12 +0000
From: Joakim Zhang <qiangqing.zhang@nxp.com>
To: davem@davemloft.net, kuba@kernel.org, peppe.cavallaro@st.com,
 alexandre.torgue@foss.st.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com
Date: Wed,  2 Jun 2021 20:12:38 +0800
Message-Id: <20210602121238.12693-4-qiangqing.zhang@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210602121238.12693-1-qiangqing.zhang@nxp.com>
References: <20210602121238.12693-1-qiangqing.zhang@nxp.com>
X-Originating-IP: [119.31.174.71]
X-ClientProxiedBy: SG2PR02CA0119.apcprd02.prod.outlook.com
 (2603:1096:4:92::35) To DB8PR04MB6795.eurprd04.prod.outlook.com
 (2603:10a6:10:fa::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.71) by
 SG2PR02CA0119.apcprd02.prod.outlook.com (2603:1096:4:92::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.20 via Frontend Transport; Wed, 2 Jun 2021 12:13:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9b3cde4c-b2d9-4c2b-3bb1-08d925bfcb14
X-MS-TrafficTypeDiagnostic: DB6PR04MB3208:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB6PR04MB3208FE2222C3353216CB4223E63D9@DB6PR04MB3208.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:88;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rnwjSHmIVkmJtyJD5lnX6HDjYSgN9q3FnS05Ce0iXGyB7BiJ6eNyxBBkqY2M1XCnJzqAV++yPOVaxFrlQnQ7lhwgypaJgR0nLtdtKIuCr73PU7f30pfbTSEcOx7KWqOvLU6iy8+hEcxeTFKMDZ/OHGuIKV8p/pbIoldfdqb4r3XaFMtGnIfHsJpJQA2rDokZ7cF+SYkqVxs8CBI55jyx+nT8OrO1sjPXRztfuuwFkiErCcMQix3sM42I3ys/tmli3hcAIH0tFeYvzDglx9PSSJwJfl+FGuFDT4hFihpxvlJ5RonBBF0pPacoHQeXOkGQ2KiUrc1MwJt1DvEHN9jdMk9JYe093FaLuEMlOSyQdtfnw7Y9h/q2hPkARO5SXx0StfaGxxaVLv/Ix7d6AxEnGwNzjwnzxa6YaA1NbBJtEQIT51riwfw3N7Wq8NxCce63WZnz/U5y2gD4Je31GfGbRS4gyGm3k8WvIxR8CsCLzUonOWus0DUMFsIjiVN/AOz3qMQgommzYdP5zI+mK313WLtJujXHF7krKXpxVJyPBeBC0pmQSSoxDU2ALFWDjNIz2YehFwuX7DsreuaCpArHZLA3l074+nPGfqMobfM6tcmb8oGo+VvvLd7s3QyXNvVtw6G9EfKG3tsKFMgVPdDRGQdLi2p0bPZxx//ahBJFRrqfLnmtkRIXxv5q5ry2g7Zs
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB8PR04MB6795.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(136003)(346002)(396003)(376002)(66556008)(5660300002)(66476007)(4744005)(4326008)(2616005)(66946007)(16526019)(38350700002)(956004)(8676002)(36756003)(316002)(26005)(1076003)(83380400001)(478600001)(6512007)(6666004)(8936002)(6506007)(186003)(38100700002)(52116002)(2906002)(86362001)(7416002)(6486002)(69590400013);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?E/Kq5vGOM+HG7l8qQVrghtLoRPnpUDBpNXqK+NGpj6ByB2LyumTtAe8IIo0Q?=
 =?us-ascii?Q?doljXWotroQJcdYibxNq3pui9E2wlc8uWRYqDm/jKTKuzy97vpZUqn4ztU01?=
 =?us-ascii?Q?qbgFlUbXbKPDXpmwXoSxRqtQiNBHOBZ3sEqmzI6awmH8GAST+9amkIQryfEt?=
 =?us-ascii?Q?Bsrb83ohX+tfBMsMmlNySQqwGDOol2Sd4PU2Nsk7OVhYQ5sSd3J5/c5IjL8W?=
 =?us-ascii?Q?NDl/Zl5SFYFU7BAc3kDromoFj9eeyinbd2qyYyUEt7/oL/C+GsfjPm81/2uu?=
 =?us-ascii?Q?leVKPmVjw9hTh1NRVKUyZUvbWRTq2Tz9qetCG0ks3x2lszmtfjCsQVaIoGk4?=
 =?us-ascii?Q?+LRPdKlCaz+HbKrQpQVgg5qQbDm4aPmYMFxttOqC8FRJaueqbfnahQVgvIzS?=
 =?us-ascii?Q?TzuQVMRRYXSA9zI2tDXnPB9BonCm3MV9KBRkS5f1vjPNacp+K2IGLnrs7zWg?=
 =?us-ascii?Q?BdjfYWPI+p+rRLAbxIel2ge7pVFssr38j+xO25aM/fZSgA8nDvzqw0g4oL2e?=
 =?us-ascii?Q?DeQXgS57hLTlCeUO4xmFdaaJwIpRI0hlPKhQTYZyCCRIPcJD7zT6Yu6HJHPG?=
 =?us-ascii?Q?S3YbJPZdSLf/V6jXzFIXfEhovHZqaaZGnTxSmndzcT2JhZmj48kJna1v1LDr?=
 =?us-ascii?Q?lYlAve8ZFAgoE5/wGa41gev//wVSwAZRkIl1F0HSMfyQ0uVIAvuAXz/rSieC?=
 =?us-ascii?Q?8Pl3AcYgUpKXmHx3eP3W9pVj/FeOSjiKfnTbIT81Ctfn6h8kVXB9pQj0NjHd?=
 =?us-ascii?Q?NOnA6YnK4Ua48jAd9WU+LQ1haKnVi+bay0MrEgNFTqVgMCfgKb7PoMH0eJTx?=
 =?us-ascii?Q?LSEWsWA6Tx5PPXPFHiwogfT4dk4NizQCkN6mwAtbeNuWX6c+RNsp7Cvl23Xo?=
 =?us-ascii?Q?KXzgTjwlnGwRW/RNxlLy7Y3C+ZxqID9GAvuLXmkM1Cd9j1TB8rZg09IhBmJ2?=
 =?us-ascii?Q?Gi8H9UVmaXtyJk3zvJwbdckJgGpJ0Imp8c/CM1iYkgvrMKmTFf0bCi29zqW0?=
 =?us-ascii?Q?7qBEEA51hboexaL4gUYn3gKynFAKuzK+5atpZ0mA6Ch+0uqezfMYGEpy0CH3?=
 =?us-ascii?Q?dorvV9yNhpYuCowIozLwiLogNYC/HJUhqZQ9Sfka7yp+7MzNYLpmm/r4b3I3?=
 =?us-ascii?Q?rvI2soPR+SDvCk2oy036F9+wxdYhJKG5U2mlr8pidiaZB66fasNTw75DRwYe?=
 =?us-ascii?Q?TFdawiJy2bVsZGvxreUUNISnsH0N0I2UeEV4UOsaXMAhBcU80OWrC7SiXBcf?=
 =?us-ascii?Q?zMR/mFCiaAKayYeaVjP816JBRNA8WzDqd1xt9D96yvTTzIQV6JWKqY5uDBM4?=
 =?us-ascii?Q?6uUaEEkYKBf1FP9VjqTNknAB?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b3cde4c-b2d9-4c2b-3bb1-08d925bfcb14
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6795.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2021 12:13:12.8555 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CftFBac7qEo5u2uRxmA4s40KW4dQIcdYajJUpfUpOqI8rbxug99J3jeSqlVcDLXTNVnv2e/Z9h69itzDb8GZzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR04MB3208
Cc: netdev@vger.kernel.org, linux-imx@nxp.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH net 3/3] net: fec_ptp: add clock rate zero
	check
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

From: Fugang Duan <fugang.duan@nxp.com>

Add clock rate zero check to fix coverity issue of "divide by 0".

Fixes: commit 85bd1798b24a ("net: fec: fix spin_lock dead lock")
Signed-off-by: Fugang Duan <fugang.duan@nxp.com>
Signed-off-by: Joakim Zhang <qiangqing.zhang@nxp.com>
---
 drivers/net/ethernet/freescale/fec_ptp.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/ethernet/freescale/fec_ptp.c b/drivers/net/ethernet/freescale/fec_ptp.c
index 1753807cbf97..7326a0612823 100644
--- a/drivers/net/ethernet/freescale/fec_ptp.c
+++ b/drivers/net/ethernet/freescale/fec_ptp.c
@@ -604,6 +604,10 @@ void fec_ptp_init(struct platform_device *pdev, int irq_idx)
 	fep->ptp_caps.enable = fec_ptp_enable;
 
 	fep->cycle_speed = clk_get_rate(fep->clk_ptp);
+	if (!fep->cycle_speed) {
+		fep->cycle_speed = NSEC_PER_SEC;
+		dev_err(&fep->pdev->dev, "clk_ptp clock rate is zero\n");
+	}
 	fep->ptp_inc = NSEC_PER_SEC / fep->cycle_speed;
 
 	spin_lock_init(&fep->tmreg_lock);
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
