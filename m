Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BhuzNtboHmrpYwAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 02 Jun 2026 16:29:42 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D2762F4A1
	for <lists+linux-stm32@lfdr.de>; Tue, 02 Jun 2026 16:29:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=foss.st.com header.s=selector2 header.b=eUA1Apos;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=foss.st.com (policy=none);
	arc=reject ("signature check failed: fail, {[1] = sig:microsoft.com:reject}")
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 19272C8F271;
	Tue,  2 Jun 2026 14:29:42 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010052.outbound.protection.outlook.com [52.101.69.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1C148C57A50
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  2 Jun 2026 14:29:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nAjC7cViLDG/A+FtzEsWD40JzJhWGHc24dS8Nfaez/jCMKtoN7Vo+Fiqn4tmuhHV+hUAEWv6z2C8gog/8uBoujgU8xnw7VSZv7sXf9UY3e8FmuLJdenO9mRgjlPEFHlrd6ukfsaCH6QL5yVzoZs6RVCNnjFUw5BYxp5thd374zmNDjZ5RP9VGHbI84DvcqEbFma80NBluH4BtDRRWNvaDDcyPAFSZE8+uw/0InWtwzfLawNW9m1AKWkWNC1FzELiIqfXGOYXkE5lm0pwJ79dMYDf1HXQOUKX9GaLlnHrFUNfBgEPBFeyQfWAZaQ5DshBCumvkPsZkpCkEMx9OmNhuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/DFoeL/DBkSdNltDI2+oyIzqYORaDpNnOZX+SZizLn0=;
 b=VI0FGGtZwdSN6Kogp6RRIOi7G/aMwOVvOxWZO5dBoI9mwUT3+Rf1tyyS7iEBnzo43q7BH2doEMOPsa7RiZ/QelWC192paHuVb0U/dnqnRU+xePK//9x3W/BSpU8stNl62FImUlCJdOoH1eo329BRBy5KujjcNZH86U84EFhX+KLtTozPF+lFNCCEKCLmSjVIbyIZURfYAKjYco7/QU6VDZyin88v1NwcR1yWyCcYSfdIJ6BqiZts4PwXlDiPamJesGw1G6tiD0unb0py3GVvcUClPkNj1hoJ1Uu22y/upCberkjKOGE7/sis5DjfESQIk7i8VE7JjxMXsMfKPyYF3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/DFoeL/DBkSdNltDI2+oyIzqYORaDpNnOZX+SZizLn0=;
 b=eUA1AposxWT75qtkT6GUYvdB+9Ir3YCiWqk2qPr7TMy/FsxkiHdB48k8+dsi3J2popcWyNJOk5vaq46g1BgKzgvtEYqt+Xu3npQcB9VfBRiOlThzGtE7XeFUscikNqL2Hb2yqFbHBVo48AResFP0SGvw9t/WtfnGizvzYALXTSCPsomOaQUhhLJUe3yaDLQJ1rJLfZihUe1+UEhbmLK7LSPVNxtWXpjmmbPmHDxSOPN5N85lqPdj8WzEEAo2C2xK2VgbA1kRDOwRuUXLoQd8p0qbv6fi8yAi0iDZCkhYKlyo56CFr6FV28ccjXryDSB68kFS4qRI/+j2CWqp791DwQ==
Received: from DU2PR04CA0246.eurprd04.prod.outlook.com (2603:10a6:10:28e::11)
 by AMBPR10MB9320.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:6a9::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Tue, 2 Jun 2026
 14:29:38 +0000
Received: from DB1PEPF000509F5.eurprd02.prod.outlook.com
 (2603:10a6:10:28e:cafe::5c) by DU2PR04CA0246.outlook.office365.com
 (2603:10a6:10:28e::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.16 via Frontend Transport; Tue, 2
 Jun 2026 14:29:38 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB1PEPF000509F5.mail.protection.outlook.com (10.167.242.151) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Tue, 2 Jun 2026 14:29:37 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Tue, 2 Jun
 2026 16:33:46 +0200
Received: from [10.48.87.71] (10.48.87.71) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Tue, 2 Jun
 2026 16:29:33 +0200
Message-ID: <14358d35-2ce1-4d7d-8bc6-e40da4d9b75f@foss.st.com>
Date: Tue, 2 Jun 2026 16:29:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Rob Herring (Arm)" <robh@kernel.org>
References: <20260511165942.2774868-1-robh@kernel.org>
Content-Language: en-US
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
In-Reply-To: <20260511165942.2774868-1-robh@kernel.org>
X-Originating-IP: [10.48.87.71]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F5:EE_|AMBPR10MB9320:EE_
X-MS-Office365-Filtering-Correlation-Id: b0cde00e-6949-49f5-f185-08dec0b3601e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|36860700016|82310400026|376014|18002099003|3023799007|11063799006|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info: WoiZQnXY9lhhRT/z5Y5Rj899Io6tIuOZN55x3x58LjDRWY5RlNk9AQa4IA7TQ3NNzyyqW9LngKLlE+LfMfTR0dRgMVizKHQ67jyGzVEcx1nK+HmDoUMgFal0lIpnGix/1zOLQG5Y8vcnY/IH0SQRqUYNJ7ebfq4dm+PhftmCxOZZAdzPOFF0GdcT6LdnuiDTNYoNenB7QbBDKtB197gnjxCIt7RbxZ/YTygbe1CURVoiPGdoc6uzGaV9GtRYNdWWyEhXnbhu4DEmlKpVxjYR4r+M4stbcGWUnMdog+DiyPsuYWvIKRf9gPkGVUzVnZvoffUKFrGLQrTFk+3xOogq+KxJUenHqYlUqjRQPVM3Bt7DD3+3ZCArV3uxqIz1WX1z6pGmUIdSqDIDt8SrHg8lwgxcwKko/GQWlrCdmDc0RZhTgXAMNRFxTbGi2QcLg8azQAjeRhrKy1fkncIz/cfRhsHUh+LyvJPUmc7raaI6pypyuw9lflSGzFMvk5DLYD+scxdW5Uvm2vPdFsameWpCLSK3hEC3mgzZWjlXtZs3mtrYwg59ey8PL51pn0R24iw5sJif1caCl82GdS8VVBKugGJYgbOTE8RBNrglBvUedmb9ueDS79yHFNNPLIwS++lnmo1DAlJgXLutRxnGGwkC+o/2PjcDyt6Xc//Iz2pANUTFtX/h6JzYhg4oHr1qDuvrfoEwxls8HoqElVmqXbDoUnL2666hSnS+XP1FYqU+tZY=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(36860700016)(82310400026)(376014)(18002099003)(3023799007)(11063799006)(22082099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: jagGbSISWk6WVljYbqvzNZeMQmXF8wnwolT1poC4IPw+kZnaJWOAvae+By8ALFkwZX3ScvkRDexX+MC/qfuFMgZCeNiCBhpQNcNK5wR+JpMVswGDWFPorUXjO+JGL+08nUJuRwfjG+Od8WcO/J1GzR+70eGjwwmAQYajjOni8eY72yCWfs3LtMwQptyN+8b3YfsncxwDsZHV5F6M+6+Gavs1T6oCEacPSj3XuKq0QIu/zBvVpZSpaLUVOCeu3EYYGUV/vT9VAtzdiHSMUAhWJXzKRE26xqOT0WXe6QkuS/U+A8fSLo8e3jViDM/StnOJcbR4rNhh/tKgU3zmTiWbnhYcXE61cRDTKGsLGOKauXdsZ6JkozjOta7d+c0Wo/RJX4bxubydVeIG27LcE2Xe/yHiWw0YXCWaKo9/8iANXE7tJFn+kIM27xOO9u5cQx5e
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 14:29:37.6730 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b0cde00e-6949-49f5-f185-08dec0b3601e
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509F5.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR10MB9320
Cc: imx@lists.linux.dev, Heiko Stuebner <heiko@sntech.de>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>, Tanmay Shah <tanmay.shah@amd.com>,
 linux-remoteproc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Mirela Rabulea <mirela.rabulea@nxp.com>, Eric
 Dumazet <edumazet@google.com>, Marijn Suijten <marijn.suijten@somainline.org>,
 Mohan Reddy Putluru <pmohan@couthit.com>, "Andrew F. Davis" <afd@ti.com>,
 David Airlie <airlied@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Jerome Brunet <jbrunet@baylibre.com>, Simona Vetter <simona@ffwll.ch>,
 Detlev Casanova <detlev.casanova@collabora.com>, Suman Anna <s-anna@ti.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Fabio Estevam <festevam@gmail.com>,
 Jackson Lee <jackson.lee@chipsnmedia.com>,
 Parvathi Pudi <parvathi@couthit.com>, Nas Chung <nas.chung@chipsnmedia.com>,
 linux-rockchip@lists.infradead.org, Ben Levinsky <ben.levinsky@amd.com>,
 Michal Simek <michal.simek@amd.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Hussain Khaja <basharath@couthit.com>, Paolo Abeni <pabeni@redhat.com>,
 Konrad Dybcio <konradybcio@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 linux-media@vger.kernel.org, Linus
 Walleij <linusw@kernel.org>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Neil Armstrong <neil.armstrong@linaro.org>, Liu
 Ying <victor.liu@nxp.com>, linux-arm-msm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Roger Quadros <rogerq@kernel.org>, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org, Frank Li <Frank.Li@nxp.com>,
 Jakub Kicinski <kuba@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-amlogic@lists.infradead.org, Rob Clark <robin.clark@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Sean Paul <sean@poorly.run>,
 Pengutronix
 Kernel Team <kernel@pengutronix.de>, linux-arm-kernel@lists.infradead.org,
 Roger Quadros <rogerq@ti.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Lorenzo Bianconi <lorenzo@kernel.org>, netdev@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 MD Danish Anwar <danishanwar@ti.com>, linux-spi@vger.kernel.org,
 Jessica Zhang <jesszhan0024@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>, dmaengine@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, freedreno@lists.freedesktop.org,
 "David S. Miller" <davem@davemloft.net>, Felix Fietkau <nbd@nbd.name>
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: Consolidate "sram" property
 definition
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st.com:email,stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:from_smtp,st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:imx@lists.linux.dev,m:heiko@sntech.de,m:akhilpo@oss.qualcomm.com,m:tanmay.shah@amd.com,m:linux-remoteproc@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:mirela.rabulea@nxp.com,m:edumazet@google.com,m:marijn.suijten@somainline.org,m:pmohan@couthit.com,m:afd@ti.com,m:airlied@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:jbrunet@baylibre.com,m:simona@ffwll.ch,m:detlev.casanova@collabora.com,m:s-anna@ti.com,m:angelogioacchino.delregno@collabora.com,m:andrew+netdev@lunn.ch,m:festevam@gmail.com,m:jackson.lee@chipsnmedia.com,m:parvathi@couthit.com,m:nas.chung@chipsnmedia.com,m:linux-rockchip@lists.infradead.org,m:ben.levinsky@amd.com,m:michal.simek@amd.com,m:ezequiel@vanguardiasur.com.ar,m:basharath@couthit.com,m:pabeni@redhat.com,m:konradybcio@kernel.org,m:khilman@baylibre.com,m:linux-media@vger.kernel.org,m:linusw@kernel.org,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:p.zabel@pengutronix.de,m:neil.armstrong@linaro.org,m:v
 ictor.liu@nxp.com,m:linux-arm-msm@vger.kernel.org,m:s.hauer@pengutronix.de,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:abhinav.kumar@linux.dev,m:rogerq@kernel.org,m:broonie@kernel.org,m:linux-mediatek@lists.infradead.org,m:Frank.Li@nxp.com,m:kuba@kernel.org,m:matthias.bgg@gmail.com,m:linux-amlogic@lists.infradead.org,m:robin.clark@oss.qualcomm.com,m:mchehab@kernel.org,m:sean@poorly.run,m:kernel@pengutronix.de,m:linux-arm-kernel@lists.infradead.org,m:rogerq@ti.com,m:mcoquelin.stm32@gmail.com,m:martin.blumenstingl@googlemail.com,m:lumag@kernel.org,m:mathieu.poirier@linaro.org,m:lorenzo@kernel.org,m:netdev@vger.kernel.org,m:andersson@kernel.org,m:linux-kernel@vger.kernel.org,m:danishanwar@ti.com,m:linux-spi@vger.kernel.org,m:jesszhan0024@gmail.com,m:vkoul@kernel.org,m:tzimmermann@suse.de,m:hugues.fruchet@foss.st.com,m:dmaengine@vger.kernel.org,m:krzk+dt@kernel.org,m:freedreno@lists.freedesktop.org,m:davem@davemloft.net,m:nbd@nbd.name,m:andrew@lunn.ch,s:lists@lfdr.de];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	GREYLIST(0.00)[pass,meta];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[amelie.delaunay@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lists.linux.dev,sntech.de,oss.qualcomm.com,amd.com,vger.kernel.org,lists.freedesktop.org,nxp.com,google.com,somainline.org,couthit.com,ti.com,gmail.com,st-md-mailman.stormreply.com,baylibre.com,ffwll.ch,collabora.com,lunn.ch,chipsnmedia.com,lists.infradead.org,vanguardiasur.com.ar,redhat.com,kernel.org,pengutronix.de,linaro.org,linux.intel.com,linux.dev,poorly.run,googlemail.com,suse.de,foss.st.com,davemloft.net,nbd.name];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCPT_COUNT_GT_50(0.00)[76];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[amelie.delaunay@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[foss.st.com:-];
	HAS_XOIP(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 66D2762F4A1



On 5/11/26 18:59, Rob Herring (Arm) wrote:
> The "sram" property has become a de facto standard property, so create a
> common schema for it and drop all the duplicated definitions.
> 
> Signed-off-by: Rob Herring (Arm)<robh@kernel.org>
> ---
>   .../devicetree/bindings/spi/st,stm32-spi.yaml | 10 +++----

Acked-by: Amelie Delaunay <amelie.delaunay@foss.st.com> #st,stm32-spi.yaml
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
