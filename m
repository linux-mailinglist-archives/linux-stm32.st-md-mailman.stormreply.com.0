Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6711874141D
	for <lists+linux-stm32@lfdr.de>; Wed, 28 Jun 2023 16:48:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2EE63C6B470;
	Wed, 28 Jun 2023 14:48:34 +0000 (UTC)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on2120.outbound.protection.outlook.com [40.107.117.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DEC4BC6B44D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Jun 2023 07:19:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q+tgbYkL4yljv8NGMjH9MkubnXeMrz0q0CysBspRCVCDVaXodWyahqI0MEFdjcf8rSQKhiNhkDtULLcYdrhpbIpzjp2inZHD70oMAyA0QGDWz5Z10DjNVhJahfxxCeDYq1M1718xA8Hgi1GsMJEm/+wqzEMaPhaWGnq0e1ovked7pgIL7BOl2OK7HweHqAe1YL+cfFCa/dTzP/tJpfItNK4Zi7LItM0UADA2N85X8zKbSHYdbuNzor+pZcdg9qg0AN6YbHbIaM4ZOpdRL+aCwtIuUbc9WukfQx5VXd9nvs4ooFCnNmWpWCseNBS6+PyKLxQrZTZzrsS1VCgLI++xbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vjgKyXZeb4Pa++8I8gRPsqs0ePfqjO53OpDqWyzv/zo=;
 b=TDonwbf7patfiueABPEIGRA9lyLCImR+r1SYxygSe0TSkIa6yNcfrV3GjcF1DtYS8bAlRQygl+u3zskJL9S5yci3q8MJpxavRfg+ZICS3F91TJE2xkPN7hOYYNSHji7AM/WBMjHFGPDUw8vBdpNlCEyrs9/w55nz33dKEJfpvRkJXx+yYR7qPkdeH5wR99f5+zx8+vOCynpNqPbmMfD3e9Xbp1cAF8VcEZRf4tQ4fsKBrqwN7TOOS3pW2JsN4N9LzjnT+2ngSGevEmL3PtZTIbK1zKnCKjthQkVpodknxDZCdhXMUkRiN8vdL33fmHFJTtM1N3K6GQPpPzDaT3377A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vjgKyXZeb4Pa++8I8gRPsqs0ePfqjO53OpDqWyzv/zo=;
 b=Uy+FfDkw9WLXD71SnE8+1CBCdxc7PVBXfO/syaVOSpOHAjAAgB9fsZnB90+2ZXqDtJ9QRu1MOnFdiFN6pQvvYzzbndIzVTDDq4OrARMXym0WDXPZuCTTIIZcOxuTJonij4VKJJeI4R/cbTK1p+jixfgnVXTzf17VVkQZc056UqeC6oZrB6b8mZQitaV9YMm7J4wC+oLk4aLxj8M3wuBawwgrIvMVmitj2jDM/s+HKLXSSk1PCtfvGOmQkk0kkYj6g33zco6GZdUc5WXnoKAav+zNafv57rkMQT0KrAuIm7PrdBdZysHGBCMuoibUm19Ccj8b3AzPYt3y8XSkH0QTaw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by KL1PR0601MB4289.apcprd06.prod.outlook.com (2603:1096:820:78::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Tue, 27 Jun
 2023 07:19:25 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c%5]) with mapi id 15.20.6521.023; Tue, 27 Jun 2023
 07:19:25 +0000
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
Date: Tue, 27 Jun 2023 15:17:01 +0800
Message-Id: <20230627071707.77659-10-frank.li@vivo.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230627071707.77659-1-frank.li@vivo.com>
References: <20230627071707.77659-1-frank.li@vivo.com>
X-ClientProxiedBy: SG2PR02CA0098.apcprd02.prod.outlook.com
 (2603:1096:4:92::14) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|KL1PR0601MB4289:EE_
X-MS-Office365-Filtering-Correlation-Id: bac76a8d-1d7b-4977-58b1-08db76ded618
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hg3/eumoAeHzpq514NsPNmcGQAy9yZhxeQKWzHByR/ejX3CPYuznYOCTPzmY6zjld+QdIEXbrxSpgh0WHinN68aZ3fBVRR7JCwc1anCjiICkG1w+tvhSeD7CTBTKHBB0ACbjm11UxD1yaIxUzriaUKtHyO4uxZxfKu4eUt9VueXhFvT2MB/cxPI7ATpOdpeGwdP5dDXBFUvswMspD2ZqECX6tukPIbPqwVnmI5tni1fwsqIdCz7mFR0X9y4SfyS3QXl4Ux9GLSH3Uvv31q9jzmpB6Wl84lkUNwsa3tVc413KUdjJz28pHL4gs7nm7SlBmSgEYU5WYpEG2EPCPaekm4LCzHkvCKKHXBe43v9WFCAbZHLZyRPOh7c6aAaJ5a9Aqp98oKtbM22nPOQB+xzAWf70wqcOelB6GjQJ+3+BIU27X48aleZXFmlaTC4F+DK7vhaYzMyD0Yt5/KDdy4pDdVpIqAZ1jFuafW6Nt2sMK/r2dM/qqOWTzA5Ec8Lu6dm4RexEhcjCyNei1TMFk04n47MF5RlKrB9eT9wmVP9LIIqJW4B8sgqeby7LIu64YABN2raJgL0fQLpWDVgUp0DW7ktivzLWSw36ELmx5JLF4W/Oa5xZlE+3aJ7RkbimIc+SHxj3pYDDvOzkfHzqFIBjcg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(136003)(366004)(396003)(346002)(39860400002)(451199021)(6506007)(36756003)(6486002)(478600001)(52116002)(2616005)(6666004)(83380400001)(2906002)(1076003)(26005)(6512007)(186003)(4744005)(5660300002)(316002)(86362001)(7416002)(7406005)(921005)(66476007)(38100700002)(38350700002)(66946007)(41300700001)(8936002)(4326008)(8676002)(66556008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?98r8NLdS+Wb8hRZQzJPF2FFeoX76fCjTYYw5ojdKRc+L4wZZAV3PLwIagkQd?=
 =?us-ascii?Q?4/qXMds0kU74XxH4c41zhXUGHaJ/JwO34Ym6jnuZdjmVN9U4N47IhX6c391j?=
 =?us-ascii?Q?2y9617ebG4j0yqjMXY1daVqISSjdHuJTXV+s5PhZNTTDPnMsv3dDjcc47E8U?=
 =?us-ascii?Q?ZSQAyT8UtJT6gtrvkZBYadDhNtoLb6CeumMa1iQVLG6ynxgIx3428PzB1v8l?=
 =?us-ascii?Q?oPmnvlSroi26EPyAMYmR7MCri3194Zr32Grf+IN+NPqRHG0qitWKWMgESAPK?=
 =?us-ascii?Q?sJuvDj26ZR0Ix/vgcjYa276OyUaYXUAqius5BrFh77IPnwwrxunFvN/k3Xbf?=
 =?us-ascii?Q?VlHpwNtvILGPxahPHYHOirykzdp3UUA2uSKMzeJpmPYVJwq9xSBi9yzgn3h/?=
 =?us-ascii?Q?ESFLkJ7WxPW+4fCS65H2CrvRmd2mcd1/JE+cfaaRbYgtt6RAVS8YdXEPGI7N?=
 =?us-ascii?Q?uWVR4bya7QcE66MjxGR0ZuicdOA1IF3+IAx3tkWfVu1UsNZNaTe67wystN0y?=
 =?us-ascii?Q?pVt7AF0QBwnWwhiH6PrSvyi6miyw6/MgoMxC2kEJ/DoaB0XXz8I+u1RJrzk3?=
 =?us-ascii?Q?ip2aleBHvPXf0VubWFEDumzeOBIZJJdd4HZbwcvXopY3Z/Y65umwoYCpcaFu?=
 =?us-ascii?Q?ppYa22Ntr21sFdU+rDLIQq0cyv9j3gpTZhhV1GsOhwVO6udmD9ffQe4o8AmY?=
 =?us-ascii?Q?YlXcsE9nbH9GE/RNw9gaJnHbpJfO/Tns1C7nzOPCkOB8beWOTCbmaIvHL7Fv?=
 =?us-ascii?Q?9I9sWHF3sLfONGvFyRoA+iSr8rOvAXbHyxXL2YJiivtujxDj9a+r/vFrO7u1?=
 =?us-ascii?Q?Igqf82OTNat4MXmURfvQTE0ccf7bdMo55zJsgU34EMNvJrTNXfi8ItstwuTx?=
 =?us-ascii?Q?ytLB8+qu/UGeRRM/tZRc8R9YpAeQ72FAmaOi1iKYBixSWy4NC1bjYUAWGfWM?=
 =?us-ascii?Q?4U3YP9cQkQvQKDlq5ZA7f2PrB0xu1rhvJgJpuq321oJBwY8im2eC6cVplm/9?=
 =?us-ascii?Q?3hrEZNYhiS7NvyYpH/tjf5VKwbwb/MOelbTo/4GtjsYj9QoxaauNav+vrhK5?=
 =?us-ascii?Q?7JEX+RFOy9kEEFq9PjAlEpOyx5pfdTaVhYh6Jiy7n8lpa98bV58OaIW5R8eh?=
 =?us-ascii?Q?zdKGkd5T/fv0hbYZ+W1/3x/2LRLMDJmzO5Ob2PwUX26uJkiBSNVb99gDa446?=
 =?us-ascii?Q?BLVemXrk8xg7KeonjHec6niwt9f29/RftAd9AN/hB/tmXGNdHKFUtz5hIsOj?=
 =?us-ascii?Q?p6d/YvEWdB96Ri57qL/bKgQAJub86ELhSmk/d3mtwZNV3gcxsf0tG9AUYnvD?=
 =?us-ascii?Q?3p7yZF6NQM4MylfKf6pHZ//SYiq2sVN31LfjVO8WUX1x6A27TGiEKgBux2yO?=
 =?us-ascii?Q?RiPlLnrBjU+0QnPs4W3juqQEh6MOTfOROFEtRKKc6kxBuU9XXWv2IwVUGHAA?=
 =?us-ascii?Q?HkQlPSmSNH2j7wL1uFTGr8d9IYsmz8+mdo//FtF9v2VPD+Y/BnzMrfz5f+ri?=
 =?us-ascii?Q?2lOi48ChPhwxJvDGQzOI8YvmjUzNaoOZD9OrXtWBwnhBRCZUcsmvo2RsJq/8?=
 =?us-ascii?Q?wUlhkAX9VmBwROGElGzgyTJhCc7QQQ1eZ23VbDRk?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bac76a8d-1d7b-4977-58b1-08db76ded618
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2023 07:19:25.1588 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n3CGjs7yyT2d10tcLxw7a7rEFAJFl7twUVghe/+ho1WZ5wIhVue4dm1sK3lv/44M575QgRDAShNqfP3XvhaopA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB4289
X-Mailman-Approved-At: Wed, 28 Jun 2023 14:48:29 +0000
Cc: linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 10/15] thermal/drivers/int340x: remove
	redundant msg
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
 .../intel/int340x_thermal/processor_thermal_device_pci.c      | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/thermal/intel/int340x_thermal/processor_thermal_device_pci.c b/drivers/thermal/intel/int340x_thermal/processor_thermal_device_pci.c
index 0d1e98007270..6ea9892b3660 100644
--- a/drivers/thermal/intel/int340x_thermal/processor_thermal_device_pci.c
+++ b/drivers/thermal/intel/int340x_thermal/processor_thermal_device_pci.c
@@ -261,10 +261,8 @@ static int proc_thermal_pci_probe(struct pci_dev *pdev, const struct pci_device_
 	ret = devm_request_threaded_irq(&pdev->dev, irq,
 					proc_thermal_irq_handler, NULL,
 					irq_flag, KBUILD_MODNAME, pci_info);
-	if (ret) {
-		dev_err(&pdev->dev, "Request IRQ %d failed\n", pdev->irq);
+	if (ret)
 		goto err_free_vectors;
-	}
 
 	ret = thermal_zone_device_enable(pci_info->tzone);
 	if (ret)
-- 
2.39.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
