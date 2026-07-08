Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HsuRLTdATmqrJgIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 08 Jul 2026 14:19:03 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 369EF726393
	for <lists+linux-stm32@lfdr.de>; Wed, 08 Jul 2026 14:19:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=cirrus.com header.s=PODMain02222019 header.b=IkZBJ+ra;
	dkim=fail ("body hash did not verify") header.d=cirrus4.onmicrosoft.com header.s=selector2-cirrus4-onmicrosoft-com header.b=xBxoOesS;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=cirrus.com (policy=reject);
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	arc=reject ("signature check failed: fail, {[1] = sig:microsoft.com:reject}")
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DA8CFC8F283;
	Wed,  8 Jul 2026 12:19:02 +0000 (UTC)
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3B750C1A979
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Jul 2026 12:19:00 +0000 (UTC)
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 668934Ia3306096; Wed, 8 Jul 2026 07:18:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=
 PODMain02222019; bh=XGJUac9104TObIpNWbR9EWZ0V9tMEEp8kOa0oEcOx3w=; b=
 IkZBJ+raRb1vzrWXS3GjkgQwqZGv/I9JJhUN2fegKX7hcUbkRPfOq2Q/YyCjxh2Z
 2pstUZ5d45kPgW4C24jxT+3sSvqWVcYD+NBlOw2MiNaLfzg/9F2EA0w1jkmbvepx
 O+MIQ8ccSqWy10Ywkku/hOukZnqaCkg3daVJNw0/Nobz6sDAyuvWj5+nn6Ghcv3C
 UkekfD0ACRFmOp1mOT+wp5wJFQjOlMVZMlZ/wuY0dyNCqG4XGNIol/OjoaMIsIL0
 0ZQevavqyy0O5znxxDG35YwBYBKBTi1Pi98Wsif/ATgZAkS41POfPPTBTHfR6P5I
 m+Pz17YEduFt3YO4h7p8Dg==
Received: from sn4pr2101cu001.outbound.protection.outlook.com
 (mail-southcentralusazon11022136.outbound.protection.outlook.com
 [40.93.195.136])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4f6yjxp4bg-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Wed, 08 Jul 2026 07:18:44 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Za+dnQje+JZMp80ccp6WDxKTSEKZDUhQPTFGaWN3gneRCZEUWLjInvxRYrajjK/ZVX9u/Mb1i8i2/kbcSM0wnU5pDGAVkwdwSMLnSo02XdXHM95csgZtiysVqqfHhqvDRmYqSumSRe/KLxX/f/FK2K0cpgvLaI43P1HNZc1RgJowlut0xJe59STvWAYlZ9KtTxZ9aF3XVvNayZpBfgZFoUEE8tjJaHHn0fn6j4eCrDANoT67JL2LvLxZEIYoIoBi8xExMvwmgi/DwdFqPAAZXhL9XKsIKsZyAvMhF4VI4tknMccgmzhbyKBkuL7Rj588MeehnPbMuk16zCP1Fnhv7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BQz++E58YQqpGecUeeqhedx547eJTWVzup9T6XFgHeY=;
 b=EVIvcE0y9t2bFQpkBMeXqIw/frIfxlgot5QuvVQV37RXupvwraH7sb5/WfgSrMH2dFSNNtw606hpc0y+I5/opiDnerobIrIVP2SwJWF2QS0qrcRiS9LK0Coj63n8h6zm6DTQPRYrU2zjijRvmTFnnJrn97h7N4ZLHpjUQLvhwXSS4uJpNh4X9V/imBkFz55M7EBN7fSntoNbxcoT9TWue6w8riS3cE+hAYz007nsTL8FdO1YKJKCTs3iNDBZTORYScO3puZp+5At5VYmcbl0/Ln6kuKEPNSRKeDKBXfupfyPQwhYsRTeY18J7wkbIXy07e9yHxR68MvEQuuFMSMALw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BQz++E58YQqpGecUeeqhedx547eJTWVzup9T6XFgHeY=;
 b=xBxoOesSJUSbT7He9w4P77Knb4Q7VuH2vcE/koEN7BkjC1Pub72vvzUS4q0tAOpd/iI7CJeXkwk1s57BiKCXMmDGyl7M0ttDKCfpuzK91UsvkjLyxv/HZ1yrguCsGR0w9xrdBPqnNVrTUMiYi6qxPCsD5kt/Gw9KsMNUyHp5re0=
Received: from MN0P221CA0004.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:52a::11)
 by DS7PR19MB4437.namprd19.prod.outlook.com (2603:10b6:5:2c4::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Wed, 8 Jul
 2026 12:18:37 +0000
Received: from BL02EPF0002992C.namprd02.prod.outlook.com
 (2603:10b6:208:52a:cafe::61) by MN0P221CA0004.outlook.office365.com
 (2603:10b6:208:52a::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.10 via Frontend Transport; Wed, 8
 Jul 2026 12:18:37 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com;
 dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL02EPF0002992C.mail.protection.outlook.com (10.167.249.57) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.6
 via Frontend Transport; Wed, 8 Jul 2026 12:18:37 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com
 [198.61.86.93])
 by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 4FC30406542;
 Wed,  8 Jul 2026 12:18:36 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
 by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 2948282025A;
 Wed,  8 Jul 2026 12:18:36 +0000 (UTC)
Date: Wed, 8 Jul 2026 13:18:35 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?=
 <u.kleine-koenig@baylibre.com>
Message-ID: <ak5AG3ReEVvDsAAC@opensource.cirrus.com>
References: <cover.1783507945.git.u.kleine-koenig@baylibre.com>
 <ce43f6ec640a7835d64d3d696ff09229c3d31075.1783507945.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ce43f6ec640a7835d64d3d696ff09229c3d31075.1783507945.git.u.kleine-koenig@baylibre.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0002992C:EE_|DS7PR19MB4437:EE_
X-MS-Office365-Filtering-Correlation-Id: 68a28bc5-46db-42c1-1932-08dedceb09dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|61400799027|23010399003|7416014|376014|82310400026|11063799006|56012099006|5023799004|4143699003|22082099003|16102099003|18002099003;
X-Microsoft-Antispam-Message-Info: dNN+PCMXP3dNBGx2Acjn7RSsQiqZp8uFLYQgGEMzLAzvXJ7UA2OpJI00vgG7oZi4G2Zd4HlNIsIW5jR+p9GNmHaERVwbkdsi1+YcrlGEycOrNmMfXJyffBqMwWOM11E21kf52MlI3oNg5yXLzK7T28PeLY9II/NnMF62ua7Nt+UQjoIvG3NOfEwSIlbSDzL8LTQrL2tKIQIKXzGRqRqjT045mhhZEMU3TViEUlp1CmvCDFdtKGD6S8nLU+KvCXPepBD6h/HWhe84zCf/VW3Q2C0V97ToZ9sUdV/yaSXUC1g44yo5ftPxxx07fBezQnjOpMMgoN/EoqYBtcEwVFIfSvV0A5bK/k6IZ9PAPGnmT99MxZMRxNG2TeeEw9bLXwpMYutz0pQSevUdVgZ31XERHi1g+p7t5yGbLcuwu6zX/Km1z7QKXYL03Nm50Bpp5K0IpcL47rxZt2Zupfr6A3GNWLrkkeJhSixCJHnph9cTLirGwqlydjRLVJ+Zsxinwe5Tn1iRia6+p4pFuS7JHCZPXq0zUmQtst8r8Gcex6vWgMe5UaQt43So+pKJR+FrcELJJ8jVPztxoo6/EPd7MiI1K+OZ3a9qgSSpllqZkk381KdCrBJ2FJvdDxuxFcmvXuMAWjxrkpdodc9ZCGnCwqL6T8n4h0EGCa8sQOA6BNXkIvLxqguYmPj9lJtFBwC3s97bY1yLcAfF+g0mC4ryCaSsYg==
X-Forefront-Antispam-Report: CIP:84.19.233.75; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:edirelay1.ad.cirrus.com; PTR:InfoDomainNonexistent;
 CAT:NONE;
 SFS:(13230040)(36860700016)(61400799027)(23010399003)(7416014)(376014)(82310400026)(11063799006)(56012099006)(5023799004)(4143699003)(22082099003)(16102099003)(18002099003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Y+W/UKYfxPi2pz5l8SMpCjvaZeNsEDM1v4bzL3wNk6mO/iVxe3AHF4M6p3HnwOWD5tFVSsodiRyTWvG/41yb/qowp7nnmd1iJ3AlzanXM4M0XRX+9a46Iern16VtE/dctOjuw/BorQ8m04yonxFXZ6d7p1IyWCyNzEo5NFG9X7rNDUEko29DsY2k8Nlz5XKkOLAg8Wyg3EKRsX6U5UpFm89N8C4o1scffH2oJ+r/bzPe2qqH21XdQgroQgAS/+k0sId3dQBkx5nYIYknrIVwGgvkmgEaJa0P2j32JUpi3ZDTSVnPAmisyyCOg5d7v31aOOiPC09SVPKr2hLg1d0VkRrTLhRGlU9uThdjH7BD149Mwki1ueyrZ7BLu5bVgFPBOH0hycznJ0J8x1U909+k3ejdUPctUGqn6+X4YZrPpaku3cqS79PaCgXRID6zuEr1
X-Exchange-RoutingPolicyChecked: YlW4LBdvqj8Vkw6H2aPWjK/IZsmXvBongAE14JgyeUxzWwqsh6DYxxMGDx1Ph/G7szI2AfO4BgmlUnhgBgi4glRKZXLLZSv8C0LoTDrkLkqos6KLSLccDIGobWh3O8MeAMcBDp0rQ3tJm87/UiAjr4YA93aqXrTIbEbNMQh91hyKTI/+btdasaAgk/QPDPBHQ9ciBYpk+YxNxMDumyjLtEwiQ0aldnqtBV5uW8j8reuLMTPVqaB8KraEyrnITx0dA8Q7t/GdvfHDlv/mg0DXpBBbJRC4J15UUkhHn98qzx8TsP1fMAYh0txOs4WeH9RCgrKUaf2PLbr6EBoGxcbl1A==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 12:18:37.1994 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 68a28bc5-46db-42c1-1932-08dedceb09dc
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8; Ip=[84.19.233.75];
 Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL02EPF0002992C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR19MB4437
X-Authority-Analysis: v=2.4 cv=Fo81OWrq c=1 sm=1 tr=0 ts=6a4e4024 cx=c_pps
 a=2hJN3FG5vRdYsizhUtvj5Q==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=8nJEP1OIZ-IA:10 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=IpJZQVW2AAAA:8 a=w1d2syhTAAAA:8 a=Dc1nfGASFo0QrZ5EXQ8A:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDEyMCBTYWx0ZWRfX1uloLmf0t/ao
 761/Ct/lnjjBxRUW7PnQYIp0stqXGPTVksQUAK6+4drkMLSm1GWEAwb5JeZgSXaNeaDu6dGlM9K
 N/Sk0F/RO5lgb3XJ9N4AIsHDdXL6ELw=
X-Proofpoint-GUID: n02IjOAvDwPUpUShZRVgjN3fPeAOoOT3
X-Proofpoint-ORIG-GUID: n02IjOAvDwPUpUShZRVgjN3fPeAOoOT3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDEyMCBTYWx0ZWRfX6+Ougbz0z3yr
 zmG8ifQvARHtBJS2OmIBQRIKjwzBUnyRhLiykaHBzw4QwXi9fCb1hLt7JOhBRbi3Sj56Qpt3Ah5
 ST02bg9FoXNimO3QplpBQSFpBYl42MuuIJF8Qcy+Iy7v7MC2pgFBl6tl+8jaZmrSZkjjCSptlb2
 c51D2AleKfytcXfoKSKlggvUEAm0cmqi6ZTIY7hpBiBHrNC/s+5Oz0roWyv5pYJKSrz21lnpwKO
 LoFgllcgh9s97gVDnWM5kxizKnDOIhX1WQDkS6mdJjcU8rC7bJP7c9fPIlkqFcnb50qEJIiFZCs
 lWPhoglyYZ2ncVrhZRCbQuXjBFi65KnJtp/Z2H7yQuj6zT7P6J8sgB2k7NtTP56Xmp3UnXS1od5
 SDzrF0E9WJE+m4ZgYuDfEVhYdYwmdMU6/yk0eXEZzezcCAYS9WchAEMzLxxMqsE5HgiOA90Smv/
 1Y+xgdg7KTabZvnms0g==
X-Proofpoint-Spam-Reason: safe
Cc: imx@lists.linux.dev, Alexandre Belloni <alexandre.belloni@bootlin.com>,
 =?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Tony Lindgren <tony@atomide.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, patches@opensource.cirrus.com,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, Fred Treven <fred.treven@cirrus.com>,
 Janne Grunau <j@jannau.net>, linux-stm32@st-md-mailman.stormreply.com,
 Marek Vasut <marek.vasut+renesas@gmail.com>, linux-samsung-soc@vger.kernel.org,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Aaro Koskinen <aaro.koskinen@iki.fi>, Fabio Estevam <festevam@gmail.com>,
 Lee Jones <lee@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>, Chanwoo Choi <cw00.choi@samsung.com>,
 linux-omap@vger.kernel.org, Andreas Kemnade <andreas@kemnade.info>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-arm-msm@vger.kernel.org,
 Orson Zhai <orsonzhai@gmail.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Saravanan Sekar <sravanhome@gmail.com>,
 Matti Vaittinen <mazziesaccount@gmail.com>, Ray Jui <rjui@broadcom.com>,
 Tim Harvey <tharvey@gateworks.com>, mfd@lists.linux.dev,
 Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>,
 linux-sound@vger.kernel.org, Roger Quadros <rogerq@kernel.org>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-amlogic@lists.infradead.org,
 Sven Peter <sven@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 James Ogletree <jogletre@opensource.cirrus.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Support Opensource <support.opensource@diasemi.com>,
 Scott Branden <sbranden@broadcom.com>, Sudeep Holla <sudeep.holla@kernel.org>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Linus Walleij <linusw@kernel.org>,
 Samuel Holland <samuel@sholland.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, asahi@lists.linux.dev,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
 Ben Bright <ben.bright@cirrus.com>, Neal Gompa <neal@gompa.dev>,
 David Rhodes <david.rhodes@cirrus.com>, linux-sunxi@lists.linux.dev
Subject: Re: [Linux-stm32] [PATCH v2 21/23] mfd: Unify style of of_device_id
	arrays
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Rspamd-Action: add header
X-Spamd-Result: default: False [6.29 / 15.00];
	DMARC_POLICY_REJECT(2.00)[cirrus.com : SPF not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[cirrus.com:s=PODMain02222019,cirrus4.onmicrosoft.com:s=selector2-cirrus4-onmicrosoft-com];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.linux.dev,bootlin.com,linaro.org,glider.be,atomide.com,kernel.org,nxp.com,tuxon.dev,opensource.cirrus.com,gmail.com,samsung.com,cirrus.com,jannau.net,st-md-mailman.stormreply.com,vger.kernel.org,broadcom.com,iki.fi,kemnade.info,baylibre.com,arm.com,pengutronix.de,gateworks.com,gmx.net,lists.infradead.org,linux.alibaba.com,collabora.com,diasemi.com,sholland.org,microchip.com,gompa.dev];
	DKIM_TRACE(0.00)[cirrus.com:-,cirrus4.onmicrosoft.com:-];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:u.kleine-koenig@baylibre.com,m:imx@lists.linux.dev,m:alexandre.belloni@bootlin.com,m:andre.draszik@linaro.org,m:geert+renesas@glider.be,m:tony@atomide.com,m:lpieralisi@kernel.org,m:Frank.Li@nxp.com,m:claudiu.beznea@tuxon.dev,m:patches@opensource.cirrus.com,m:jernej.skrabec@gmail.com,m:alim.akhtar@samsung.com,m:fred.treven@cirrus.com,m:j@jannau.net,m:linux-stm32@st-md-mailman.stormreply.com,m:marek.vasut+renesas@gmail.com,m:linux-samsung-soc@vger.kernel.org,m:florian.fainelli@broadcom.com,m:aaro.koskinen@iki.fi,m:festevam@gmail.com,m:lee@kernel.org,m:magnus.damm@gmail.com,m:krzk@kernel.org,m:peter.griffin@linaro.org,m:cw00.choi@samsung.com,m:linux-omap@vger.kernel.org,m:andreas@kemnade.info,m:bcm-kernel-feedback-list@broadcom.com,m:khilman@baylibre.com,m:linux-arm-msm@vger.kernel.org,m:orsonzhai@gmail.com,m:liviu.dudau@arm.com,m:luca.ceresoli@bootlin.com,m:s.hauer@pengutronix.de,m:mcoquelin.stm32@gmail.com,m:sravanhome@gmail.com,m:mazziesaccount@gmail.com,m:
 rjui@broadcom.com,m:tharvey@gateworks.com,m:mfd@lists.linux.dev,m:j.neuschaefer@gmx.net,m:linux-sound@vger.kernel.org,m:rogerq@kernel.org,m:rf@opensource.cirrus.com,m:linux-mediatek@lists.infradead.org,m:linux-rpi-kernel@lists.infradead.org,m:baolin.wang@linux.alibaba.com,m:matthias.bgg@gmail.com,m:linux-amlogic@lists.infradead.org,m:sven@kernel.org,m:wens@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:angelogioacchino.delregno@collabora.com,m:jogletre@opensource.cirrus.com,m:neil.armstrong@linaro.org,m:support.opensource@diasemi.com,m:sbranden@broadcom.com,m:sudeep.holla@kernel.org,m:zhang.lyra@gmail.com,m:linusw@kernel.org,m:samuel@sholland.org,m:nicolas.ferre@microchip.com,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:asahi@lists.linux.dev,m:kernel@pengutronix.de,m:mathieu.dubois-briand@bootlin.com,m:ben.bright@cirrus.com,m:neal@gompa.dev,m:david.rhodes@cirrus.com,m:linux-sunxi@lists.linux.dev,m:geert@glider.be,m:jernejskrabec@gmail.com,m:marekvasut@gm
 ail.com,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[ckeepax@opensource.cirrus.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[cirrus.com:email,opensource.cirrus.com:mid,opensource.cirrus.com:from_mime,baylibre.com:email,stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:from_smtp,st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ckeepax@opensource.cirrus.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_GT_50(0.00)[71];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 369EF726393
X-Spam: Yes

On Wed, Jul 08, 2026 at 01:15:28PM +0200, Uwe Kleine-K=F6nig (The Capable H=
ub) wrote:
> These arrays already mostly match the most used and generally
> recommended coding style. That is:
> =

>  - no comma after the list terminator;
>  - a comma after an initializer if (and only if) the closing } is not
>    directly following;
>  - no explicit zeros in the list terminator;
>  - a space after an opening { and before a closing }, a single space in
>    the list terminator;
> =

> Adapt the offenders accordingly.
> =

> Signed-off-by: Uwe Kleine-K=F6nig (The Capable Hub) <u.kleine-koenig@bayl=
ibre.com>
> ---
>  drivers/mfd/arizona-i2c.c      |  2 +-
>  drivers/mfd/arizona-spi.c      |  2 +-
>  drivers/mfd/cs40l50-i2c.c      |  2 +-
>  drivers/mfd/cs40l50-spi.c      |  2 +-
>  drivers/mfd/cs42l43-i2c.c      |  2 +-
>  drivers/mfd/lochnagar-i2c.c    |  2 +-
>  drivers/mfd/madera-core.c      |  2 +-
>  drivers/mfd/wm831x-core.c      |  2 +-

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
