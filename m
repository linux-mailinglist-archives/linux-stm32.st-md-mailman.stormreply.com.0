Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E39BA741423
	for <lists+linux-stm32@lfdr.de>; Wed, 28 Jun 2023 16:48:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A3D20C6C822;
	Wed, 28 Jun 2023 14:48:34 +0000 (UTC)
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2126.outbound.protection.outlook.com [40.107.215.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6C7FEC6905A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Jun 2023 10:12:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YjqfaqlsJ9jBHJFlFLnhEyqgEuauE0SL4yHP4RXK/+DgtQnltmXynMSUAsDcs7mbcNZjix6d5jJ2SInaFWQS4OEvB1tMxyMonyNrEF37TBtty0jbmT0u2YglZ3eIQpLe5ovKOjZtTUKhSDx7csJdiYp9w4YH4uubWI3XPTk3kVl9Hn11/bDJeBZAqi2J+xomuMzNlAuXO5lmUk08cG+fM1PvyT3ighWP2EsI+0sZa+240uCrdv6iSRn2YGCzc/7mzk4oN0m8WR6tUg8ilxNsiJcQUO0WyFC8gPFWcZtHM1N96fm0nw1iAhErCUjAjXIsOLnQAR7hhRJ1aDsOzMtxYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sfY1vzl3NwLuD7E+/kToAKqFImiCj6mun7u3yCK7iRo=;
 b=nqaUjglo5OsLjT14Gn3dZ/6mJ3w4g4iL6sw9KDATEl6weT3asnWeMYThsVTthKkS4PRTQd+WuS85xubLkh6laCu/UHn4ec58ZqDD4YXPUOrPq3C9GqauUJJKpbJInjXr84m/IloyzDe2ZX7i3KyMCHNAt+OuyVjxHwJcZ25OYc6aW8HR2NgF6V3NeVrKh/P3rt++04GumW5vd/ZTKpXme1+hpXW2HrfeImBu9NUj4PktX+ZRAzTmOzX6859eYruj+wRC6AE2LxjSQxtmTVKSOfXLW8eeMsWi0XSVDjm+5pFM+K+ZQZUG+2jQD0t2KERlBrJ88cVdXp13NWeD5l01PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sfY1vzl3NwLuD7E+/kToAKqFImiCj6mun7u3yCK7iRo=;
 b=ZOuLm5AvDu1K3BL00kDQMb5ZtQq7aRgtSJzGG8eOk/RWGhuCOPn3HmnygQCbty11Dm004DB/RoVqem+KVi8jhqJFPfJ9AOQZOjnZ4ntgIc6oRz8qefz40aCn041pLQX2BhdfIa2wzUyQU2unALytA0UaGlTyoHslKTKbs74ao2BvuL9vk/K3hz0LE1UrPoNrgA9Nrh5FTkkELzEMX10d4t0hekb22H/m8bqMRorATANXSyDlbJz52WpcDo6Ic+LSDVx0Bt8wFwzmSi0xzGE2yhkvZoP9yzLrk0xvgbAIKgPBRhzZND2cQGvlKcF90i3xsw7r3oLpuo2Fc6pvBLES3g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SEYPR06MB6661.apcprd06.prod.outlook.com (2603:1096:101:168::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.35; Tue, 27 Jun
 2023 10:12:32 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c%5]) with mapi id 15.20.6521.023; Tue, 27 Jun 2023
 10:12:32 +0000
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
Date: Tue, 27 Jun 2023 18:12:01 +0800
Message-Id: <20230627101215.58798-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.39.0
X-ClientProxiedBy: SI1PR02CA0012.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::8) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SEYPR06MB6661:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e44e26f-163e-4ff2-edd5-08db76f704e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 14/6qdGX9mxMVEt1HElkrQtsVmJFhRZIExHTDe6HMS09W75UKIy+sA0lX4lHK3Cb4ENcJsIFXdrwTcZp7/9/G+68zNFqQsf90E12eC6thtxzAQDSWSI3jF6A+zQGQPIk887ORETllaay4zKAvbP2cbHzLuLD2oWundOAl5dWG85tz8nLYjnVZrSF15tfTx7m/F8sfPWLR3KRurGFRso3fvLtWEaUkjdovDQAbpuPL8EDGqjcysAvb7RgC+Z7gAtpdoA7rzpKFjWd/PdHS0CgdTG1jJlCBh0TYTcPEmpMh3alFVtNlfZY7hl/xsOjCR80O0SCJctiK0O0mtvdvX5ORfEjVC/WqM4y4egIPyF9xGKh5hmvM+kvAxsRMvghHTV+KOLmm2w/O6rgJrVE60YrRIxSQT5uGQjjM0ELnN+stO56FrBSx1VYoEK/vsWeFJS9MoAqfmD5VvuTEPZyqIhva7nUK5Qe+Z1hjEFW25EsLXEDZZVOirwmbes05PlJfPvMB8+WQgDXBQj2tHLtnsHjFKXtXF2hbxxFibaI6Ej/Xat0JIysvM78sHg1c+cb/G2ZGfhbj42BNN7WqEFc6gKMwb3iIuFSPgnvMDl89+Nciig/AH39kwqGhCyR2372m7ZDf+SaT9Fvze33Bnt+hfHHoQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(396003)(39860400002)(376002)(366004)(136003)(451199021)(7416002)(7406005)(5660300002)(66946007)(66556008)(4326008)(66476007)(478600001)(36756003)(316002)(8676002)(8936002)(2906002)(86362001)(41300700001)(6486002)(52116002)(186003)(38350700002)(6506007)(6512007)(1076003)(26005)(6666004)(921005)(38100700002)(2616005)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6J4lW+KWb5n8C/zFigqL3stgcyxjqgFJ3L9rwEFwd7pDSzjBWQqbYKK6vC6w?=
 =?us-ascii?Q?sgaXPGRXUf/OExmhx+RD/wBV0RYJhyNLfBnZ6XCnKs/taDht6fak04GBX0Ch?=
 =?us-ascii?Q?o0PDGOynLcosvoMnVH7NoB8eQm5oDEFBuCKT+7+oMzUPlskTei8A9mP2XAFW?=
 =?us-ascii?Q?l/08VKpDVVLxMMV9lZhXN/X4xmX+bO6M7Ok0YzU9h157bM3sxmjBlQKtXg9T?=
 =?us-ascii?Q?XVwEee/OVpziMdVuCx5Ze21KeegstVs10AcvoTxd3QSyRajy9whJ3TLpRFO4?=
 =?us-ascii?Q?yZSGKL5YkxYuR9qYWiXat0cmKHiWAUc6OI5om7VicY7IawytPR6bN+2L/ur/?=
 =?us-ascii?Q?E7CaIzWn8q1wutHhYjOfuvnZq31CWKbK//trG5Ul/kZT9J/jqK4qqfso2Q9x?=
 =?us-ascii?Q?JoTY5kqJRq4LdAFWQGj/Cl03QmWqiK6FgwQJeBGf5oCH1G/yio9jTHXbvq+M?=
 =?us-ascii?Q?L3vA/ztGJTL2vb7N1NgmFyLXoGlFsTv8JybGidDy6MIeou9Wnm0Gsx8uYmvF?=
 =?us-ascii?Q?BDPncSEVfEByw4UrF5YKDq0+2sOuWV9Gh5e6YXkjQt5i5EB9nmieF6NZs78V?=
 =?us-ascii?Q?RHq6l2T7Vb91jwSwc4myEcFtED1EL+yQZ0jrBc0rq6y97rzIdkV1i6+7QGAD?=
 =?us-ascii?Q?bRvzEYvNuicdGHlhIb35RsCIxTEpEBDJNmiPhv7vkdWozW8UgUHnP8YO/Ey6?=
 =?us-ascii?Q?Q+eBlU96h038ZrJ+Eu3p1ifkyXfCoKQjyViRFYWNAO+NpDy4K57S2Io2tdnx?=
 =?us-ascii?Q?msHj+Z4xK3wb5DwZU6CqRv3DPUuxa7TQz41ulJ3b0eYZJuL9krJvzzdTp5pI?=
 =?us-ascii?Q?VeaoTlJVOwxSltzaJZbOqtud5jEb7S3kZOABgnSgXEghMPZdd3UxiTVhq5Y2?=
 =?us-ascii?Q?ReYiVLs7LWOPQaD2sFLsAgxxFHSw1+YZyQTWUDYaNdrbOQjxCU6qPxmw42Q6?=
 =?us-ascii?Q?thiUI1iYJF7MR4svJjimpIypO4xfrJLsbAo5uuJIGJlrVfjgSgRiBMsUGFqF?=
 =?us-ascii?Q?YvRn7EOKdWnJoxMGUjxQJDAt5su5bFyZCHNGOD8w7ipf+2lx8489lUmN30ML?=
 =?us-ascii?Q?7wfm03jl74Dad21d2vDfl5lrFphGHItShMv+/1kxwl9WLjtwDNR6qzY77XOV?=
 =?us-ascii?Q?TmY30Dkdk1XM7q9qUCVG0ZAqdNbN8lT855/6iNB1IAFJVH3QXrTtUTN9wRCv?=
 =?us-ascii?Q?SmeBtatNu2ZOxPNQMUI0FxVCOftRelwLLpRnOw5gjw3yn0f1CF+CLcjvD74f?=
 =?us-ascii?Q?F2Jcs6d3sjAlmO+48AaByivvY2eHS6EHn8sldXviwPa4isHRIJPP/LOQwUzc?=
 =?us-ascii?Q?Mh5P/afXS/YsHq+kK7cMzj/THP1iaK/VvWlM/b/4ml/ZR0XUHsA9bz02rWwK?=
 =?us-ascii?Q?+rVSkpUZVz+tpDyCI/BS5Ph6dWsUWaRCPKamQNFm5M/6Rxy9w8ujyb4ejAhi?=
 =?us-ascii?Q?flpTraUsv6u2hhwi2Q8T3Z5DgEJF4c6WIdj+30H3WGlG75B3OX3DvrH53XEA?=
 =?us-ascii?Q?7kjCTzghLQly/5OUEXbwPjCG2YPJSOyow4RA5MpcqU7LgEpxkQsJ8x1mcDB0?=
 =?us-ascii?Q?tgq/SFLMUpavRFC+P+qTwWQm47+8C1CqOXQxb4xf?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e44e26f-163e-4ff2-edd5-08db76f704e8
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2023 10:12:31.7394 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D5QHDmHMBzQnok7/pyAjEXUJqxHCiD25/wF9Ctx17eP35LN92samHbrfgstMVB2GMc3cyIuX6ZU+baabzrWUNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB6661
X-Mailman-Approved-At: Wed, 28 Jun 2023 14:48:29 +0000
Cc: linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 01/15] genirq/devres: Add error information
	printing for devm_request_threaded_irq()
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

Ensure that all error handling branches print error information. In this
way, when this function fails, the upper-layer functions can directly
return an error code without missing debugging information. Otherwise,
the error message will be printed redundantly or missing.

There are more than 700 calls to the devm_request_threaded_irq method.
Most drivers only request one interrupt resource, and these error
messages are basically the same. If error messages are printed
everywhere, more than 1000 lines of code can be saved by removing the
msg in the driver.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 kernel/irq/devres.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/kernel/irq/devres.c b/kernel/irq/devres.c
index f6e5515ee077..fcb946ffb7ec 100644
--- a/kernel/irq/devres.c
+++ b/kernel/irq/devres.c
@@ -58,8 +58,10 @@ int devm_request_threaded_irq(struct device *dev, unsigned int irq,
 
 	dr = devres_alloc(devm_irq_release, sizeof(struct irq_devres),
 			  GFP_KERNEL);
-	if (!dr)
+	if (!dr) {
+		dev_err(dev, "Failed to allocate device resource data\n");
 		return -ENOMEM;
+	}
 
 	if (!devname)
 		devname = dev_name(dev);
@@ -67,6 +69,7 @@ int devm_request_threaded_irq(struct device *dev, unsigned int irq,
 	rc = request_threaded_irq(irq, handler, thread_fn, irqflags, devname,
 				  dev_id);
 	if (rc) {
+		dev_err_probe(dev, rc, "Failed to request threaded irq%d: %d\n", irq, rc);
 		devres_free(dr);
 		return rc;
 	}
-- 
2.39.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
