Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 541D0B13583
	for <lists+linux-stm32@lfdr.de>; Mon, 28 Jul 2025 09:17:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0A43FC36B20;
	Mon, 28 Jul 2025 07:17:49 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11012064.outbound.protection.outlook.com [52.101.66.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C1C94C36B1E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Jul 2025 07:17:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q7RMRFJCT01UnlWWmKelIZJVHZhfvRFv6mhn5EMdMmduzJfy6nAcfMbiRmGKkVfOPcjRrgbJz0LrBwJGGbEw6mjUrCsb9wh+6mE8ny9csvVzgKj0KR6VCpqvU8m7oULJ6+viOk+RoUdz2YhaZ48tQ/f+vbvPXzVwOw0fFj6IhvoD0StxHRXuRGBfj6jIt26yGNiYs9rIvWkUtIq10NS5Wrw5VKbbPPCIMFwncPks3h8G4gnFd7WjiccEWM3wFoN+wu8hT34TUhEwXsLgiWksr4ezlQj6pe9Vk2yheI6RZ+NqxS4ZJ3mETWfFdxs7sz8V8UlS2m+nWlmUTUxhrdinTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oNWuSSeyeW5I5KBxCzf8GjrhFkPii63HTaqO1cyAwic=;
 b=mMp7SptV0/3AuFqcm8npQ3Acvb2BX89ZvUIXbWaJoX11KnpMRnVla6/uJLwQl/oUajSGdt5nfmrfZshj2VgdJzRxM8CR5gCXqwzi9y7w/MJGSxc8j5AXPHbigFbZKzRVkY//L/S4EB5N8gVXHdtX4WnBrkKwMgQnn4yKSble2Z03YnZCx3fEurN4PBR+uIYYGyH2hNgMBPqjWKWyfP2K76gMcy2Uk7DQ09cu7fUV+PKx4shqLopuKKyT52zSsDsrCo/yqqqi2z+lhrDlnf6exKtTtG7vnNSBJyueHJGxDr7Ju8SVM9124ZCvmrpAhq47ECzG9bSPtCllyt/jXPXLPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oNWuSSeyeW5I5KBxCzf8GjrhFkPii63HTaqO1cyAwic=;
 b=Zhj1rneOpcL9uVdEB6eeKttGHNZ6xLxvF5e1L1E4VYL2O69ht8a6zQCgDWDd2dOy543icgIQOOvupD9Zd8d1CjWSm5WPVLBSqsNk/dLPnHm998diqLIr8WsvPr2xm1zsP9syOM62YEx3JXE1cQ+2jlpQ38iPBZloXL9BfM3+yvSznoffjlD0MKWmYXHlw6P3AjnBE6YD0cw57o27JdfmmTXAceCrmfXRO8ngPAz2noTnpShBWsm2AzGYmoCU3qPQ34vCKdflqcUwQj6bMGQpIc/KrmWoKy4eLORsDN9R8d1oD/JaGCSY9HAfqT6tU/EhZjyUOH0WiZCFgGbIFrHq0Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9386.eurprd04.prod.outlook.com (2603:10a6:20b:4e9::8)
 by DU6PR04MB11157.eurprd04.prod.outlook.com (2603:10a6:10:5c2::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Mon, 28 Jul
 2025 07:17:45 +0000
Received: from AS4PR04MB9386.eurprd04.prod.outlook.com
 ([fe80::261e:eaf4:f429:5e1c]) by AS4PR04MB9386.eurprd04.prod.outlook.com
 ([fe80::261e:eaf4:f429:5e1c%7]) with mapi id 15.20.8964.025; Mon, 28 Jul 2025
 07:17:45 +0000
From: Joy Zou <joy.zou@nxp.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, peng.fan@nxp.com, richardcochran@gmail.com,
 catalin.marinas@arm.com, will@kernel.org, ulf.hansson@linaro.org,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, frieder.schrempf@kontron.de,
 primoz.fiser@norik.com, othacehe@gnu.org, Markus.Niebel@ew.tq-group.com,
 alexander.stein@ew.tq-group.com
Date: Mon, 28 Jul 2025 15:14:34 +0800
Message-Id: <20250728071438.2332382-8-joy.zou@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20250728071438.2332382-1-joy.zou@nxp.com>
References: <20250728071438.2332382-1-joy.zou@nxp.com>
X-ClientProxiedBy: MW4PR04CA0172.namprd04.prod.outlook.com
 (2603:10b6:303:85::27) To AS4PR04MB9386.eurprd04.prod.outlook.com
 (2603:10a6:20b:4e9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9386:EE_|DU6PR04MB11157:EE_
X-MS-Office365-Filtering-Correlation-Id: 55eaebf9-e131-4a2b-939e-08ddcda6d906
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|52116014|376014|19092799006|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cfpwMBFefBBqyDHVPE+FPi7vo7UCkNB4yEQKEl2Wwxz/n/TqO2ilOB8rjwjh?=
 =?us-ascii?Q?Q7tbeZW7emU4JYrjEUQ9Gg8qh1j0XPBwLRDrgiYjx/758W+02uWzu0TD4Opv?=
 =?us-ascii?Q?Ruuke2OSyqRA6j3eAEdexrXBjNK3AtBxCqdXJHYC1MhwY2MA3PBpvxytEEH0?=
 =?us-ascii?Q?5E6wx33Aw2/t+2r43ua4DhCC5GdY0iyXdriPnH/etueFDNpexJb5nx1qHI6J?=
 =?us-ascii?Q?nXZdyqCisY0NA+HbSDFsnLQ7Tid4pNqeAIXxCv/cyhz4zW1dYuxkaMLYaNrm?=
 =?us-ascii?Q?CXmeJwkc1KAffWk86PPOUYE2wpKMhoqttQMFLr31GiefmYfJ8VBt4sXJHOxn?=
 =?us-ascii?Q?0m/MF6ZthbmsuiZOspNtC4rStPtsCwSGkFSd6tUGpowRJxEMYz59CTa7Uci8?=
 =?us-ascii?Q?pqGFOJ2MFnD4YKymCbWMHEKs//eVtzfgSITh7P/+ovRGf7OWuF2JsTk6aMe9?=
 =?us-ascii?Q?9oj+NgVzSOA+s1+mdayZBwheU2WMAhaymLAQIU/faw30p6F51SlobG0PKoSc?=
 =?us-ascii?Q?tEt2oekVQTAlF3GUT1ufPiOvpSu14JjAVZfEvQ/++Jw6sgDSY1EMIkd0wtQv?=
 =?us-ascii?Q?adIrNlytiIgEZ6HQfsvP/nKBmhMIWmnVWu3+DljrYLAUxc9B928lr7Bd3WF/?=
 =?us-ascii?Q?DKwwBWZJHBjLF++BOJt1le+uq4G2iwffdAGTC7X9wIP2bHBPa237a9hgGN2R?=
 =?us-ascii?Q?VoB/PBV41BJ6ApJHAd5tf7nMIhGmE0hev5GJNzF76JkSFpNXQ1mRQnM3C3KE?=
 =?us-ascii?Q?7u41RfmD+xU3GU23ijZ0pxPRm5lOLeQFTY51ZczPrLgy+/TJiVHwKhXB050w?=
 =?us-ascii?Q?MMrCt0ZRvRmaxRGbNE6L8rs37gD2O8DcLSOObE0QhEKI33eAZeY9mAx83UAe?=
 =?us-ascii?Q?75g1gn3h2xL4uYyKZJ9sOgs1rv5s1VbMRs0ar3IUdR66jnDp+PPeumixlxpN?=
 =?us-ascii?Q?o/MGqUSojFJPLXP0JxPFou+bNxhDpCWGu5aX1+Cj6XIm91Y+W3NKPmxLD0BW?=
 =?us-ascii?Q?jB6iBI6gSEaI/Nquo65UFXuIlMPxahKJ7xDrf9lcXmAoBgbwbLD7yIhuW5Di?=
 =?us-ascii?Q?lx2anaaVeTezXrQUxuOpicysE2HuryNin6hb3Ji6pDkauByZrbk1dkp1hkLi?=
 =?us-ascii?Q?B8aodUhiwoo//O9SLUTJBiPUHT6Re4+ZXd19BDR/4u/VuOEeS3j/mAT0eFDW?=
 =?us-ascii?Q?MjsmOBiWzXVIa0ueT/CHe3s2srxpQXzBc8X/poZrMQEspGU39k+YfDVpmrlQ?=
 =?us-ascii?Q?65u2UkdLcS4nQxst7g1wcb6I32p2WFnBMvkIio8pd7YYYUo3ySKl5J1bZRH9?=
 =?us-ascii?Q?sT2xRZDj2d7f8FW7tSk5K+xr7JUlSloD1yNQs1W0gchgoYfQn72B6b0E0lZJ?=
 =?us-ascii?Q?JP3Nbk52KXyxDR4m2BXFLLHaYcdx9FRWy1Ex7yYxEgsAMqj7x9T6mCWm72hL?=
 =?us-ascii?Q?wRjazDUMTzuM1qzskSlflnjgpZDibtecNWytsm2j+S5J+ggQmu+a55j8AT/y?=
 =?us-ascii?Q?wK0b97Z7duCdkGU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS4PR04MB9386.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(52116014)(376014)(19092799006)(1800799024)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+g2x0bPphK/4VNw1MAsY5ZgiSEIcAkwirkOTybgFz2fxppVczWBntGEeNObF?=
 =?us-ascii?Q?FZo/xQeWlUFitZIV7AegFsiWXD8BrU8FhaUy7QqYkH2JZ0hQNp0aD8IGfSHh?=
 =?us-ascii?Q?xRaRukBkAiMKsBjUv/6Wf1ntX4TCuydUCSoNtLZXeSylL89EIN4GxqXmv8NH?=
 =?us-ascii?Q?gocJbs5tnXduAffrMgcus7CrEQIccxPge/XNYWLti0dIQI3cAVQ1SpmeGu8b?=
 =?us-ascii?Q?Mk5kZf10xx2gFfyMu7Jatbe0Zds++OcUUVfwiAWP7oZChazZoN0vhdIqkQt+?=
 =?us-ascii?Q?dU6RrT+bA6IFrKmDJQheuqjtZr1meW+SmaHGYHf0NKartdrechV7h5o9Mc86?=
 =?us-ascii?Q?bwK36iBc7nBXdmTiLZ+Fx0NpqSqGP0UvNVQQVk+xRXW30VhgoL3QdIxJ0XMW?=
 =?us-ascii?Q?VA8VTmXF1xNOTCJOJnnz3GwDwwTOH6w6PJ4G86mCmo2XQTpvyo3q/7cPTZVM?=
 =?us-ascii?Q?ETQeGdarXwtStmN1H/jagV2flJA/0yN+y8cDsRn7BRh2WL+333cgKCcTW6AG?=
 =?us-ascii?Q?T034CerRnyjF9vEUFIiYlJAr4nI5xDCUVxlqOdre9s4Ru+iQR/GY6IT+qmI8?=
 =?us-ascii?Q?7d/U+CWHdF8eCc//3M5yyAZLc/ok7qP1FyBfBlaQy9goD/3pe5dw+DBPJbkm?=
 =?us-ascii?Q?HyR7gKnma4iPpqRp0r+9oj3z5AQ4usRKnhAEM9N0MNGd+1vFcsoqVabeUJLD?=
 =?us-ascii?Q?W0nEFUgx7EgsBfvUV+SWUpnuJ495EekRMbyiVaa/Sk8Dxw/WOWuEOxtqvt4r?=
 =?us-ascii?Q?I0VfPtb8tDuLu52TRAlB+VjdQe8AKy8rrqs7awi+OwEQBGassTWeQvOTLY0g?=
 =?us-ascii?Q?dNHyqiSBDoebWrZhM1DkioJm/t7TGcLq93lIZsEDBcAHeThoOHxsHF4Qx6dQ?=
 =?us-ascii?Q?w1xxFSKhMWHKSEPi8DX5hzHRI0ST34KhsN6s+DBMWPxr7MiWaFXt8usCmNCe?=
 =?us-ascii?Q?7l2+rKeFJYvh7s9jbGeBvwEZViRWPbHyooKGqvP0STqaTCS19CqCg1ROwlU/?=
 =?us-ascii?Q?PqLIksOZvPnZq+EPLQvPf2zil/D5KEvXyuqVIN7fhseVLBYn2wuBU9g3/WQR?=
 =?us-ascii?Q?uAjItsiencdEftTFthb4HBzeu8O629Z2tmuFO6x0O/4T9qgQiDl4Dp5o0DBw?=
 =?us-ascii?Q?sXoOxm11Js2mClnSfvJB6DMHZ9qAEJaAjmgGW/XThJW97v6PVrhH4VgY1/vW?=
 =?us-ascii?Q?qLbNkS/ltFfvM1Jm2Xjkad5Jfe9YHQwS6TD6wLdULbnaPRN+ThtTgUa/1wX0?=
 =?us-ascii?Q?QKGwnPTLIsF1HVGdQthtKNNQSW+e8/HqO+cLad3vnAXEsb/BN+y0I8aT9UG6?=
 =?us-ascii?Q?L03RMuj37i6vJiHtbseAqp/k0sOACTKHAZy3ZHcaVas4CRzSuzyck/T25uhN?=
 =?us-ascii?Q?dVJ7Cvtof3DNi74QZPDhjj9+l3IzSjpNv8zhDCmKaClrAHbjX/tpw9HcjhS5?=
 =?us-ascii?Q?yIMjnkXm+JX1DA64MgGktj0Lz+3jRVwl8ZpDWghcWhu4n+NqXl6soqc5NE1L?=
 =?us-ascii?Q?XqZPacJN/o427xWiQ59HTwwp9S1g1L6JviEwUm9RU8SMRA9+ifTURPvOW0EA?=
 =?us-ascii?Q?WnM64+H/j84wD40dyn4ECkiGgd+rFbcolqxJ/fl+?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55eaebf9-e131-4a2b-939e-08ddcda6d906
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9386.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2025 07:17:45.0664 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rsKPADWSS/eHTOtEDBvLOp+z8CLVm0L0rmKXKMMiFJsoha0CWmyZeAlljGsJULSX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU6PR04MB11157
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, netdev@vger.kernel.org,
 linux-pm@vger.kernel.org, Frank.Li@nxp.com, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux@ew.tq-group.com
Subject: [Linux-stm32] [PATCH v7 07/11] arm64: dts: imx93-11x11-evk: remove
	fec property eee-broken-1000t
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

The 'eee-broken-1000t' flag disables Energy-Efficient Ethernet (EEE) on 1G
links as a workaround for PTP sync issues on older i.MX6 platforms.

Remove it since the i.MX93 have not such issue.

Signed-off-by: Joy Zou <joy.zou@nxp.com>
---
Changes for v7:
1. add new patch to remove fec property eee-broken-1000t.
2. The property was added as a workaround for FEC to avoid issue of PTP sync.
   Remove it since the i.MX93 have not such issue.
---
 arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts b/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
index 674b2be900e6..5c26d96e421e 100644
--- a/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
@@ -260,7 +260,6 @@ mdio {
 
 		ethphy2: ethernet-phy@2 {
 			reg = <2>;
-			eee-broken-1000t;
 			reset-gpios = <&pcal6524 16 GPIO_ACTIVE_LOW>;
 			reset-assert-us = <10000>;
 			reset-deassert-us = <80000>;
-- 
2.37.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
