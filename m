Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 994A174141F
	for <lists+linux-stm32@lfdr.de>; Wed, 28 Jun 2023 16:48:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 53276C6B476;
	Wed, 28 Jun 2023 14:48:34 +0000 (UTC)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on2100.outbound.protection.outlook.com [40.107.117.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 07FE3C6B44D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Jun 2023 07:19:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SkuVWCP4iLMWT2srxDUCL32Em4ESwnnRm4ZJ/NLgzLU9bWgBWYw85T8nxca65Y/BMjYMLStKHoa6gcGkXHKIQnPqjpQtkMKugnftHmzZKR8CHmB6Ml8tObfWteP9WBsGcjUKn8XJmu9ECO9PRIsV4hc/ja7XFBJaBdtm/vrrp+8h4eDpvwzDDaM0klnQ+0M4kIfaims/rT12CvUzK/D5U/3X3po52WXoZRdn6gGY5sBWVDjq03zlThi4iEdsEzWXe4WSXLfPDPRwG0V+bqUy1+tX5NyVmuuyq/hy3yl54sqkhwelH7CTMToSpOXd89ePiiL1GVsz3qXWCKj+VdDjUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R//9pjElr6GXqcRfBcb9+5l4PmO3RnSag4PFoeNkLkE=;
 b=NFMQKDkDzE9zCEuY6Ivla5Z1VAeIQz+8d2OHs+bD5e5r7DmfdUzeEH1E+t7yvgjMDBLZBXu8F7nIjDFcCPSG9IgGlYLCvOrraeWhACjGK11fVOdNQRNhfrdEjVaBV9jXr3pLihOg++//mHqGe3BaqC/NL1bDBAxsmKEx0F+ytPoDMkubhnDz3WEg975785GHfwtG6PaWoQVU1EHgR9BOFAZF5YavVAsigD7W3do1UK4JdtApjj2GCy6OjxyXeQ1WIc1boa59dbjbwf45JC5yW25nz59OJbL5Jn0a2FyfoKdXKeHgKCPt8iEyCoh6+/crAyOgvlgAY46GSxslbf2+AQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R//9pjElr6GXqcRfBcb9+5l4PmO3RnSag4PFoeNkLkE=;
 b=P1tNslazf9JtdUadDRKLWZNdyq/MQbmNkMLiEHtISGDuXY1inY7ol/sDvbQ1WTNmKiF8hQHWtfko5u/FYDBT3temLDjt/F62M5ii4E/wpKcKv84nxoIlngYhQ7xMvkvdq4IPhKDOIECaOeUJk5oUQl4dLGKIz/FapNPuyRzkJLPU6PqQ9Ut+voApCxdvLh2NyvC4kNlVisUxAbSyjrjoF5CMvcKzQJ+raxaT+vQFgF2UdKHXbZMLQ5SS/a40PmceaJITXHTXFgsXc/7eFQMWJ28r82rnxf8pzGYfeKrKU4wLB+sFrlpQovHGTAIxrCeJlMI6rbqeypegfm2aTQOn4w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by KL1PR0601MB4289.apcprd06.prod.outlook.com (2603:1096:820:78::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Tue, 27 Jun
 2023 07:19:38 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c%5]) with mapi id 15.20.6521.023; Tue, 27 Jun 2023
 07:19:38 +0000
From: Yangtao Li <frank.li@vivo.com>
To: miquel.raynal@bootlin.com, rafael@kernel.org, daniel.lezcano@linaro.org,
 amitk@kernel.org, rui.zhang@intel.com, mmayer@broadcom.com,
 bcm-kernel-feedback-list@broadcom.com, florian.fainelli@broadcom.com,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, linux-imx@nxp.com, agross@kernel.org,
 andersson@kernel.org, konrad.dybcio@linaro.org, thara.gopinath@gmail.com,
 heiko@sntech.de, mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 thierry.reding@gmail.com, jonathanh@nvidia.com, tglx@linutronix.de,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 srinivas.pandruvada@linux.intel.com,
 DLG-Adam.Ward.opensource@dm.renesas.com, frank.li@vivo.com,
 shangxiaojing@huawei.com, bchihi@baylibre.com, wenst@chromium.org,
 u.kleine-koenig@pengutronix.de, hayashi.kunihiko@socionext.com,
 niklas.soderlund+renesas@ragnatech.se, chi.minghao@zte.com.cn,
 johan+linaro@kernel.org, jernej.skrabec@gmail.com
Date: Tue, 27 Jun 2023 15:17:03 +0800
Message-Id: <20230627071707.77659-12-frank.li@vivo.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230627071707.77659-1-frank.li@vivo.com>
References: <20230627071707.77659-1-frank.li@vivo.com>
X-ClientProxiedBy: SG2PR02CA0098.apcprd02.prod.outlook.com
 (2603:1096:4:92::14) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|KL1PR0601MB4289:EE_
X-MS-Office365-Filtering-Correlation-Id: 238a9d3d-9d16-441c-357e-08db76dede13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Alu9wwO8d4qguMnuiIcB5iWyAyG8i+IDY6Xtm9G4mQ+iIAeKsdLFJA3mN39QH9G6Fu3Tz/Hg8H8qNo6KdqI9RUajIxbQnR7bbQSZ1CueCS8gs6tzE1xUvUE4GMwY1tC3h9kSw0BtAuBTNcekjcYHS3gMyf4neqIfBPsBs7ytswQUAfpW7ZcdQXqweUIZTgrgUx97ysrpXXiBwiiIMDFzr1tF6GEzp38jk6+09koUPxaGriu9uBZY1ZBGQrYb81DhnQyeFS6MrSdDRsjy/XiCtrM0Nxgf5WljA4donBl25I26/zxsuuU3IHsUl8fMV8KQ3jWTD3UpV98K0zsvv4Mp4DfYorxpp9bfjQCp/YoMdGTvVe70DgaWWPeVBGjha/6ls3zyjfQ0aQrw9nfP9xhJdstrlzUwuDVfPA3zbgfEo+5QcEYZbCPb5HA1nlXjhtnhDWyP/PK4+j432uvyf5JLh8mBCWUTcEx6hwYyJFcTFyQXb6G5Omy2Z7zFc+0zJLF0F3uFZbTuhnQ4weqzT7vjitODajmmACOWXhFg93fQ5muUy3x1IconF+wnxFwdLOnUdgawinOBkHTItiQbcge51+Evwl+3tTq3dYuRYOhAgzlN156ZNSl0xD2pHDyJbxsDma291m64PsZj6ZHPwhBZSA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(136003)(366004)(396003)(346002)(39860400002)(451199021)(6506007)(36756003)(6486002)(478600001)(52116002)(2616005)(6666004)(83380400001)(2906002)(1076003)(26005)(6512007)(186003)(5660300002)(316002)(86362001)(7416002)(7406005)(921005)(66476007)(38100700002)(38350700002)(66946007)(41300700001)(8936002)(4326008)(8676002)(66556008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VbteQZcBmRpihIhsPUKH7DphdzmdYogfhDB6cyNJA8E8Z6J53XAqGh+qpXCp?=
 =?us-ascii?Q?JYRRVLzaAtEP9I8lCx9gP5hw2CohEHjZ+lJ85e+VB78aHCXxa+y8vBN0pBPK?=
 =?us-ascii?Q?TMoMB23q0e71pkQDe6au3w0qAjs8qPGVPd1cP850CKbQS+9liWrFVyhQRxbo?=
 =?us-ascii?Q?fxlA+If4JrKp/cJFq/zcJCSBnmObSU80cVWy5EiGqpybNL+WE2FjA8CjgAsD?=
 =?us-ascii?Q?LyQN+EPcRZdct2/c7mJw+dNIu2/6YZg0zGgOCa9JBcSo+6QsoHQeU0CS442k?=
 =?us-ascii?Q?EsuvEwx0KtcU0Xeg+OjPnpI6zWxe1/TV6b/zs+tFcCjQWzc15FVTMugR9bxS?=
 =?us-ascii?Q?IGUztiPiSESzc5Wy8Lrkr1rWhcBjLMm1l20inmq717oLhv3HnJYQUg5y7Zvz?=
 =?us-ascii?Q?Vk1H7ISSI0A9B2RtxE0t+V6XG6GeURT4mqwLzgYOQGEsJRwvvHfrTZB7SKG0?=
 =?us-ascii?Q?HnPSNnL9GxgDBi3wX4C5uUskTcHVBT16U16HpiMGqfykwOMWfVI/+RHGx72b?=
 =?us-ascii?Q?+VJq7tbXX1+Hip6PNBbJvAAOrCm6Xg2+Gy7TKZNc/xccaiRhqZkbsr9R9IK3?=
 =?us-ascii?Q?8ocm4g6PipW8Tz1X3gweUHpr6nNKAFXQFYAa2uWpSgiyrXZ9b4EYcVXS1k4H?=
 =?us-ascii?Q?ApmeKrqS8nqQ3n3WQNocNOZB62wotbkrT0ayKzN6uUlzwMgUfThRpXhjsjN3?=
 =?us-ascii?Q?YGSKmLjbGZ1NlcDx41vwkgvMqbs2Hrrla3LpqzEQDu22UX8gpaPzRHVEVj5o?=
 =?us-ascii?Q?GwEqaLyyQwuyA9LeXqQuKMMVmIYkOmI6zNAH/HyTr1xjtRShVkTQFKECuCg4?=
 =?us-ascii?Q?whBwCY3myS5GHpSFgQDKwYJiel8GLGikbxGdj/unpUgfOHErHf6iPyBb4icQ?=
 =?us-ascii?Q?ZNyPdsbI5GdLBacoftTws1k6bont1OdfsTS9e98Ps/azRH05srjjPWtgOdpu?=
 =?us-ascii?Q?HDspn5wAkQSenhAnk0/0GxSI5rmwsL0tsrrVv6lzsqrKoJlusxJz/1RNE3hi?=
 =?us-ascii?Q?wxWnv72DM0l4jSK1ttmFb8fDe7WiPhgGm7QWrjA1d/yC8afT/CpzIRF4TTxY?=
 =?us-ascii?Q?fd+nqnWyoDJqYn/NHF9ENe+UnBgyDFkLTDEhesT3SDM2ZkMo/bHYfjsIoALF?=
 =?us-ascii?Q?IClVHyqtCbNUtvUrUOFvYjEObeYMexHaJnOUHcXu2RVGv5Kilm7QwCkAQaSM?=
 =?us-ascii?Q?rdOcaz4+H67t0JFvw5pal8k2EmyLYtLL8fQWuqyBtrk3cuFnS+mCFsY+BbLr?=
 =?us-ascii?Q?S9yD1yThA+hh59KE6tkT0Q111qLmSXFZOdkV7k4uL0z/Y7gqcn4BcNeEVZFp?=
 =?us-ascii?Q?/fO6KM7h70E6/n3DV0Gvv3JvtsSJuuwdw8yeZfyAQ8ykOcPYL1yE3YMXrFin?=
 =?us-ascii?Q?pYSUQo4fnmOOzeQ3QyVvR/4nGAsN5PPGjSxTwmOQ5jfaocaIMQms8e4lLoh5?=
 =?us-ascii?Q?RbHYbSBvMeWMTuOxhUtHCz+jyi+VtBnPXMbszxqwX1FA5BpZsmjUDz8krc/3?=
 =?us-ascii?Q?Byi+Jn25t+zsc18rfAM+fy3q/gdDp1GHgd1XnKgPXbLLeGxU62w4QJCl23Z+?=
 =?us-ascii?Q?4s6QDz1Q+EL4PsK1FlIvIZXShAgUPXmk2t1O7Z0v?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 238a9d3d-9d16-441c-357e-08db76dede13
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2023 07:19:38.5083 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zaGkTf+kpo5J36+0y6atmuVDAZmd0fGA1dfGwzFgpdTDVxc4XgV6eLY22FxJGcew7dUPofKhixTJwMNGqTRICg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB4289
X-Mailman-Approved-At: Wed, 28 Jun 2023 14:48:29 +0000
Cc: linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 12/15] thermal/drivers/stm: remove redundant
	msg
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

The upper-layer devm_request_threaded_irq() function can directly
print error information.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 drivers/thermal/st/st_thermal_memmap.c | 4 +---
 drivers/thermal/st/stm_thermal.c       | 5 +----
 2 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/thermal/st/st_thermal_memmap.c b/drivers/thermal/st/st_thermal_memmap.c
index e8cfa83b724a..dd52e1b9d925 100644
--- a/drivers/thermal/st/st_thermal_memmap.c
+++ b/drivers/thermal/st/st_thermal_memmap.c
@@ -101,10 +101,8 @@ static int st_mmap_register_enable_irq(struct st_thermal_sensor *sensor)
 					NULL, st_mmap_thermal_trip_handler,
 					IRQF_TRIGGER_RISING | IRQF_ONESHOT,
 					dev->driver->name, sensor);
-	if (ret) {
-		dev_err(dev, "failed to register IRQ %d\n", sensor->irq);
+	if (ret)
 		return ret;
-	}
 
 	return st_mmap_enable_irq(sensor);
 }
diff --git a/drivers/thermal/st/stm_thermal.c b/drivers/thermal/st/stm_thermal.c
index 903fcf1763f1..d72e866c0ab9 100644
--- a/drivers/thermal/st/stm_thermal.c
+++ b/drivers/thermal/st/stm_thermal.c
@@ -392,11 +392,8 @@ static int stm_register_irq(struct stm_thermal_sensor *sensor)
 					stm_thermal_irq_handler,
 					IRQF_ONESHOT,
 					dev->driver->name, sensor);
-	if (ret) {
-		dev_err(dev, "%s: Failed to register IRQ %d\n", __func__,
-			sensor->irq);
+	if (ret)
 		return ret;
-	}
 
 	dev_dbg(dev, "%s: thermal IRQ registered", __func__);
 
-- 
2.39.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
