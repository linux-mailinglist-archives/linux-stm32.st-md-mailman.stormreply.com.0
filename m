Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QWIyOlIuV2o5HAEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Jul 2026 08:53:06 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 695BC75B401
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Jul 2026 08:53:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=vivo.com header.s=selector2 header.b=hZJfuEgl;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=vivo.com (policy=quarantine);
	arc=reject ("signature check failed: fail, {[1] = sig:microsoft.com:reject}")
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1E75CC57A51;
	Wed, 15 Jul 2026 06:53:06 +0000 (UTC)
Received: from TYPPR03CU001.outbound.protection.outlook.com
 (mail-japaneastazon11012068.outbound.protection.outlook.com [52.101.126.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E9255C14549
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Jul 2026 06:53:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pGDseWPa8cIFXRok5Q4bthKWr5hu364j8KrqcrvqsVoGiZQBwxN10/q7d4suRBHHOFJbOoYnQPPWA1Lyk6wL0yDQqwvanPELEcurTrDTTQz5HIL3JAf+0J9B2/vfQn7dMAXXqLKs6MNM8A0gIhjAh/SA1bGvWQSji2WR6wVSR98/jS1Cr37nY0OC+9jUS6seX9cWJiEj1n0Oud5NrQCYwD/O9O345BedgFboxo3Rz9OZ17OsPPf4CdGY0RsIKvroPcNVZB/LPKjKS7fJBbGX3ZlwkWPmq5G6yEZhKPUxoxpaAcd+8tyLrOyQ5+Ibc1hwW2YyKglSMwdCjrvnsjYH1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jt4a6BVHgLriTp6UUkMfXDJZcYuE8QtiklPfJZ5KkFo=;
 b=aRt84hpF4Or730y6uyunviNZ7Rvw24N/ZLfEdI/7nYkc0egV0dx7slfgUJo3mBVmLJW1MsSBcI4mXaZLGfbOMiwwD7vcrT9cHXBZsKodjS8U4Fl2nB8KvXmrTaQ76MvnVN9PX6WbHpe7AfiCuI8PZ1KORHg9AP9DMZPzcGZxBLQss60dNhuTrcgIBjFKjr0IigyAOfXCppY3X3/OX0Rqlo2q1HwiPZbuGlLDYnYiaPqsgF2UMlpzzVjMazh1MbvKtJGv5Tis1ZHQ4zO0h83dUb5j7G0myrqwhpAwueQWn9CxPk6WAoaLwuphoozI2Q01Yjs5U40ojjeP3y/5BrFDkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jt4a6BVHgLriTp6UUkMfXDJZcYuE8QtiklPfJZ5KkFo=;
 b=hZJfuEgldLxKIqnvuy9JwQ9L3SlfmrjD8dSR1QGvWNMdTM2+6bu4OK320roVE5zXj0mZA3O4z/H8zsXrO2BsOF/5o00PE9oZEnEejbbehpTS2Z8KVJbrMPXZxrAs0lUxOFMugRwYsEil00v4F99LHt0g2Mu+a63HjooLJt8ZpXWatNF5fcyJb3bTyH2CyKveV00tmjWviZVD/Osgl4XpkRzzrRVVJ9i5IK4NF5s1w7YYeARemnqAadLiHQ7yt/lkkooT2MIK+6l5gDLH0d157fh+hTgXCJ5w5Qu1SDyi2QPj5JbQG++ceNLzXhzT4CtSzQtLWjDTA+BQArU/+xHiFQ==
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com (2603:1096:101:c8::12)
 by KUZPR06MB8025.apcprd06.prod.outlook.com (2603:1096:d10:4b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.19; Wed, 15 Jul
 2026 06:52:59 +0000
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b]) by SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b%6]) with mapi id 15.21.0223.008; Wed, 15 Jul 2026
 06:52:59 +0000
From: Pan Chuang <panchuang@vivo.com>
To: wsa+renesas@sang-engineering.com
Date: Wed, 15 Jul 2026 14:52:48 +0800
Message-Id: <20260715065248.564211-1-panchuang@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <ak9MldvSmaDyJn42@shikoro>
References: <ak9MldvSmaDyJn42@shikoro>
X-ClientProxiedBy: SE2P216CA0113.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c9::17) To SEZPR06MB5832.apcprd06.prod.outlook.com
 (2603:1096:101:c8::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5832:EE_|KUZPR06MB8025:EE_
X-MS-Office365-Filtering-Correlation-Id: dd127d35-3bcb-45ce-a171-08dee23db4c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|52116014|366016|1800799024|23010399003|38350700014|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: QrT28/4+OdI4Etz4nGUYIkUst/HskiHodApxnhmNvZgy8HkIVhPEcL4BuFkAmzw62CfXObL6nCW9IxU17Iccaw17HpXcZxliBC8uQZR2ZhuTZXDbJUPTxBM+Z37vT1OKnascENBU9xV1E+ZCL6/FuUCtkV2l1MuZaJhLZxviGl/7bcLwO0r06lozco3QvgKc7SIKn1JKg833j+lrG1LsC2VoisZc3tyzTcelaeNXwqB5tfjTv6OnFdBGmORW4A5ObHIaYC2fTFgGyrmMjBYm4LVLIwNRAMN709fLIfdAmJOSSCATJnTPN3XmdXcHvlSelfAPbKq9yXk3OjFiFfQkPykxcrlc+yRauaPPQz49hqvvqRTttD7PVY52y9fC5eQ/sTeswx1sRtAfMLymYnSRQR1GMmpR90BZJJpTkCtAOzHTM3ePR4P67OcD/RSpWS4S5W5rTnmLb9Yn9M3V1NfOPJXWuSkhCtEMQtjyWgpk/S4AroVSsFAzJngLb8uvglIWGQk1AR6aWQtMo8mKCQZxwIfQ7efprmeRJT7QpNE90KbtdnzNf5EAfTQFNKGoWVPeS/w0mA71LONNL+kxSp7D8VR1TM6HajDpI8cxVB0uqAAeLRTYK22fThJqSTsrYHL5LcgyJZ+cwErk9Ovrc4W2N0GO/AzIIZyf+dRis/yCOJdNHCLmjxTiEbL6Ygoy4168qxmI3w8WqCeld3BsFFcgMV2X4khzF8SoR7qhzXzsivc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5832.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(23010399003)(38350700014)(18002099003)(22082099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pgFUuHitPzGyG8Utc3kVLM9fc7LMPqiDC+cO9/J8YnI92/Oz+qlRcnw/KCiS?=
 =?us-ascii?Q?+bfdEb3MS9HHMoOOXDey9aJ5EWcKTCp2VYMLKvBL3Z861ll4UOoxCBGZ1Lbl?=
 =?us-ascii?Q?POfeZ0/uMW0zSJXSLPi8jX0jcIrLzGtSFgLgOnrvqJ0d5+ZLg7T833JQ/1kk?=
 =?us-ascii?Q?rW9rHh9KUqIOXaHTQ540O3zU0XQZuJGxK13qTyMTrzx+2ECoUUZGDcZvVo1K?=
 =?us-ascii?Q?S6B1poSjgQpi07YxXYTIy8BZ7g5LW7/MXWfPxUuz94bq5IOoh9g4j6YHMGLa?=
 =?us-ascii?Q?36JKIIodCU36FrDWdSF4ESFBfuFWdDPY38eSynqo49EtdCzhPwuS97gaDk6y?=
 =?us-ascii?Q?FY0xKPx4PK8pm+8lYjmQtsKciltFh9e2BTA37G+WJI2W+emvkxL9+G162wm2?=
 =?us-ascii?Q?Xp7tTeN0egpsVuWc1al4mGyQBWBiX2KGourm88m0+jaGvNrlvPvcjfdPMo55?=
 =?us-ascii?Q?cE5WDeqHx6VP02nxOWD7viFgzxF1SKfYNTHSTQtEONigjPZ6o1oWnvQUYetX?=
 =?us-ascii?Q?bbk2LMHh/UDxOFKGt2HYNr+LVcbajrTEBnjy6rthMBnJ9Crr+1JDWYNzHTTH?=
 =?us-ascii?Q?dv1kmys4C9bllmHt2Ad5jgWJ/SP8+aeLnsv8/lfXZ2C8m8B35kb/eDHjt5rR?=
 =?us-ascii?Q?l9b6U+2dz6efGCwEalGNxhK+xjMtHc6YnIOmMO1cbVomZMadm5z5nmo8pR4J?=
 =?us-ascii?Q?BHKMj4Po2dZYtUCcL2GFOOT7vOvVTOcUxkB9Pfb1J55nS1pG9ftnPtH1a0LC?=
 =?us-ascii?Q?A0e5JAKaL+DTdHgbzuCkFhhnSUsCiIDrGOXIsAzMFlF9/kfs1gU+mrapWFjG?=
 =?us-ascii?Q?ZYE5/YbYnek2gS65ccY18C/r1P7aqSRTx216BA84VFZb2mbdZXfBEpHuxokW?=
 =?us-ascii?Q?Gr+sjYPIA52PQ6jDTgA3p3bMuUFhbtQhuHBeVURSFEH+J39iDKMVqKvJMyPc?=
 =?us-ascii?Q?ImzXlzCm1iYza0Oud4VN2BuPxklAlj19XItZWTYdR/5s2wIQxhhmg8CBcPZf?=
 =?us-ascii?Q?KJqB5IOVOtC6h0snxunyVGevkexT2a8f4RDC3BhQPedOORZsrxi8q71Qv3Bf?=
 =?us-ascii?Q?Pcfi4K9xDIz8M5ezErVA7OvLMGw0ZeE12zWfiHjl3w13q6wZcUoJp9pWPWD/?=
 =?us-ascii?Q?opYRApEA3R3pPn6cFFWDO6PbN+DOpoZUDe7jA9g6T0QI8ZNxd09ZJGOttDW/?=
 =?us-ascii?Q?IO7XRh3nXeKfikKTaWMRSetXvC38EhzFbWxoi5DisqA8pt08y9uefQwJeA5V?=
 =?us-ascii?Q?cg9BFNvzHVoGhWtIC055R/Ln88DXKAyJJkCXcMW/MvIGqSASdWskrwE7F/ZY?=
 =?us-ascii?Q?146ePReeGI7rDuAJaRTwG6nt5nnvjtGs4jsF4LW+uv2y48ZrzGufdtVtOUx3?=
 =?us-ascii?Q?LBqtHRgfagKeMqMMZHqx54G5GWwZs2dLiPToyf8+mNzk6KgGgPrHBo4N0C6n?=
 =?us-ascii?Q?u9/gHiee816KcEcNvd2+DmXvdhmSMUKawnQIw8f+AO6dIr+2uthG9Fi7L4pb?=
 =?us-ascii?Q?QnC4ErzuNNBZCRn3kRU1J22vG9TON4WS71vpN+MXVkm+iYY+m99M4+pccvkm?=
 =?us-ascii?Q?7lwBmfpiSlEsBYirT1gVE19gfRtQrz9L3YOWrt67B0hygBcyag9QvWceb+sW?=
 =?us-ascii?Q?0HKFbuQs2h3rp8LZk4+P2a+DK2O3BQZAzC22keB1gk73efSE0ml1YSlbIbNx?=
 =?us-ascii?Q?yz3KOBv57E16ZnPZNck4d/XAoALyXIvMWvCH8oe2w+fD+qtjbWPQmAejHvpt?=
 =?us-ascii?Q?vSvWzIt0FA=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd127d35-3bcb-45ce-a171-08dee23db4c6
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5832.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 06:52:58.9363 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LcysCyivOyx7sIoh6Sa5nLo/TMmuDdkTngUJhcniphVIvPzELXC5/xte+rYOfQf/fBrTbk7v8yjbJwo01XDfmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUZPR06MB8025
Cc: imx@lists.linux.dev, heiko@sntech.de, bzolnier@gmail.com,
 fshao@chromium.org, amitk@kernel.org, Frank.Li@nxp.com, matthias.bgg@gmail.com,
 laura.nao@collabora.com, zhuyinbo@loongson.cn, alim.akhtar@samsung.com,
 miquel.raynal@bootlin.com, srinivas.pandruvada@linux.intel.com,
 jirislaby@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 rafael@kernel.org, jiapeng.chong@linux.alibaba.com,
 mason-cw.chang@mediatek.com, linux-samsung-soc@vger.kernel.org,
 geert+renesas@glider.be, florian.fainelli@broadcom.com, festevam@gmail.com,
 linux-pm@vger.kernel.org, magnus.damm@gmail.com, krzk@kernel.org,
 jonathanh@nvidia.com, john.madieu.xa@bp.renesas.com,
 linux-rockchip@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com,
 rui.zhang@intel.com, thara.gopinath@gmail.com, mcoquelin.stm32@gmail.com,
 frank-w@public-files.de, linux-arm-msm@vger.kernel.org, s.hauer@pengutronix.de,
 thierry.reding@kernel.org, linux-mediatek@lists.infradead.org,
 mmayer@broadcom.com, daniel.lezcano@kernel.org, linux-tegra@vger.kernel.org,
 andriy.shevchenko@linux.intel.com, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com, peter.griffin@linaro.org,
 zhanghongchen@loongson.cn, clamor95@gmail.com, panchuang@vivo.com,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 kernel@pengutronix.de, niklas.soderlund@ragnatech.se, lukasz.luba@arm.com
Subject: Re: [Linux-stm32] [PATCH 00/18] thermal/drivers: Remove redundant
	error messages on IRQ request failure
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
X-Rspamd-Action: add header
X-Spamd-Result: default: False [6.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[vivo.com : SPF not aligned (relaxed),quarantine];
	R_DKIM_REJECT(1.00)[vivo.com:s=selector2];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[panchuang@vivo.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	GREYLIST(0.00)[pass,meta];
	FORGED_RECIPIENTS(0.00)[m:wsa+renesas@sang-engineering.com,m:imx@lists.linux.dev,m:heiko@sntech.de,m:bzolnier@gmail.com,m:fshao@chromium.org,m:amitk@kernel.org,m:Frank.Li@nxp.com,m:matthias.bgg@gmail.com,m:laura.nao@collabora.com,m:zhuyinbo@loongson.cn,m:alim.akhtar@samsung.com,m:miquel.raynal@bootlin.com,m:srinivas.pandruvada@linux.intel.com,m:jirislaby@kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:rafael@kernel.org,m:jiapeng.chong@linux.alibaba.com,m:mason-cw.chang@mediatek.com,m:linux-samsung-soc@vger.kernel.org,m:geert+renesas@glider.be,m:florian.fainelli@broadcom.com,m:festevam@gmail.com,m:linux-pm@vger.kernel.org,m:magnus.damm@gmail.com,m:krzk@kernel.org,m:jonathanh@nvidia.com,m:john.madieu.xa@bp.renesas.com,m:linux-rockchip@lists.infradead.org,m:bcm-kernel-feedback-list@broadcom.com,m:rui.zhang@intel.com,m:thara.gopinath@gmail.com,m:mcoquelin.stm32@gmail.com,m:frank-w@public-files.de,m:linux-arm-msm@vger.kernel.org,m:s.hauer@pengutronix.de,m:thierry.reding@kernel.or
 g,m:linux-mediatek@lists.infradead.org,m:mmayer@broadcom.com,m:daniel.lezcano@kernel.org,m:linux-tegra@vger.kernel.org,m:andriy.shevchenko@linux.intel.com,m:linux-arm-kernel@lists.infradead.org,m:angelogioacchino.delregno@collabora.com,m:peter.griffin@linaro.org,m:zhanghongchen@loongson.cn,m:clamor95@gmail.com,m:panchuang@vivo.com,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:kernel@pengutronix.de,m:niklas.soderlund@ragnatech.se,m:lukasz.luba@arm.com,m:wsa@sang-engineering.com,m:matthiasbgg@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,m:tharagopinath@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[vivo.com:-];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[panchuang@vivo.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[lists.linux.dev,sntech.de,gmail.com,chromium.org,kernel.org,nxp.com,collabora.com,loongson.cn,samsung.com,bootlin.com,linux.intel.com,st-md-mailman.stormreply.com,linux.alibaba.com,mediatek.com,vger.kernel.org,glider.be,broadcom.com,nvidia.com,bp.renesas.com,lists.infradead.org,intel.com,public-files.de,pengutronix.de,linaro.org,vivo.com,ragnatech.se,arm.com];
	RCPT_COUNT_GT_50(0.00)[52];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:email,stormreply.com:url,stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns,st-md-mailman.stormreply.com:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 695BC75B401
X-Spam: Yes

On 2026/7/9 15:24, Wolfram Sang wrote:
>
>> all of these 18 are just one commit, no?
>
> I think so, too.
>
Thanks, I'll merge them in v2.

Best Regards,
PanChuang
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
