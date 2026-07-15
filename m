Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +sznHHIsV2qyGwEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Jul 2026 08:45:06 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BC48275B30A
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Jul 2026 08:45:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=vivo.com header.s=selector2 header.b=h34pInHa;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=vivo.com (policy=quarantine);
	arc=reject ("signature check failed: fail, {[1] = sig:microsoft.com:reject}")
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 77D18C57A51;
	Wed, 15 Jul 2026 06:45:05 +0000 (UTC)
Received: from TYDPR03CU002.outbound.protection.outlook.com
 (mail-japaneastazon11013030.outbound.protection.outlook.com [52.101.127.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3A234C14549
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Jul 2026 06:45:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n1/6Z3VoJIXc/UuF229/0tDEru66wok/Fr/6Q2rXXK4pBiOaoBKfBMqyLUTvQ5j0g8+HRXsM34lOfUAZ/9KOhgBo+YvNRrq2PEI72XSu5kwo1DYNYo2VLxMTMQYEAUjHzn/X2+uWASk0vtADuoOsUoGoNxCJSuI+5qvm5mSZ3e4FnLQX3fU4ds7LLXx+M3o/3Uxsc0htT9mxvsM2rxd0EZtx8uoXkR93EBYHLbty0Cs4A5DrcrX9PBlJyxFg+6B05BefFr4vzYvfEmd305VDBBBBQKm+QIqWZApgdzB++dj5r106rt8Cof20Cpz7FcwJupQGpH6Rs03x0ty3szrMJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/YFeYk5xw3Boy/uxWkTtMdNPJjZVZwbmeuLoGuj3ujw=;
 b=L9+LsQFgZ8u0XGwgOlt6saJwJQFM5aLMgY0Hk8XlrQWNV2Ce/1bfwXRD0xuGO1A2OXLSilAsIRSIrPhdnDvX37Y9DJSw2NsJ7a+dLhK2nnJ7Xt+vqBaNEFK6OPw/4pSAHzg88FVXs5JOKnWiwemJEZqghfXu07GhtrrBScLvA4wmT3hG8Uq94MoZtJzpYRZMiR0Q3cGngHcicH7Y+MkE91Tww62rZAl2tdybG2+2DJ3r8eFJMk5oCtTE6jcTIn07+6qQi56A0UZtoUmgbHHYDzGlcXTz38DZpw9HCXMeW9s4m0nqI4F0sUSlb2QokyLWf3LYaSkAQwX1VfEwwT68ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/YFeYk5xw3Boy/uxWkTtMdNPJjZVZwbmeuLoGuj3ujw=;
 b=h34pInHaiepLDLqZECA43/EhYdisi8vD/eFRPLK5buu6hFdhlR0GZ6++DYoCSokJalHJZeGJqLlek0f/J7m7CYnlJT5tDG5XgubvFGQ//Q6tL4kB3dMHZOH3/GOrfAoXFi4gy41sYI1QEEMoACM7tjG0caDFw7eFdHD/qMcsAMbZ65x64MG1KqhmciPibRinXIyxuvxI6yEazaQI1coQrPvuMuoCFgaKg5+4PfBWHKrU81Vt+ELdOVewv064uDpPOs0EDvqlQMqeNdSXwHWum1eORpDq9AcU2oLpudfi6NcdAmFQg+e01MHUh4yykWX7Wrz/Hxvs4yvn3NlSKh51HA==
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com (2603:1096:101:c8::12)
 by KUZPR06MB8991.apcprd06.prod.outlook.com (2603:1096:d10:88::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.11; Wed, 15 Jul
 2026 06:44:58 +0000
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b]) by SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b%6]) with mapi id 15.21.0223.008; Wed, 15 Jul 2026
 06:44:58 +0000
From: Pan Chuang <panchuang@vivo.com>
To: vkoul@kernel.org
Date: Wed, 15 Jul 2026 14:44:43 +0800
Message-Id: <20260715064443.525836-1-panchuang@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <alYmNl--mxMK1-86@vaman>
References: <alYmNl--mxMK1-86@vaman>
X-ClientProxiedBy: TPYP295CA0042.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:7::20) To SEZPR06MB5832.apcprd06.prod.outlook.com
 (2603:1096:101:c8::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5832:EE_|KUZPR06MB8991:EE_
X-MS-Office365-Filtering-Correlation-Id: fbc5fe82-180b-4eea-939c-08dee23c9625
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|7416014|376014|52116014|1800799024|366016|38350700014|6133799003|56012099006|11063799006|22082099003|18002099003|41080700001;
X-Microsoft-Antispam-Message-Info: WYVFUGViK+AT6BFkkPqTRL8TgunUVYUvcmKa9R1UGcC8OuYQ/2Z1OdZS+tH9DVdv/a489oc9t9gx65if2FHp03cWAZWw6BgDnsMdMCGbi03vIU4bbFDzGktwFv0U6q5If/nmQUTBLlMpavxqgpfZ6bX6Z0KIQqiLTsCsioATcQ0Yp5v4M0iTRggz/jlGgvV4OPdfkVXnxbw3lEuwCHHU1J+1GN0Rg2zRslEqQeC0mwKNYv/fuqgKWOcVy4Dvkgrv5R0Xsfa9d6bPlT85TGm0WEvUQCKCbPgwwXRVT3EKjP6svoLlIDIGkISK5h2g9JZ8xzMOP74uSElmvkS/r+6HRqgceVTg8E5bC2S7z2fRdp41vX9eCYBPZh2slybArkvO8Bn0YQxraCSO+HwpQVPhVBQzmh4OF87dCV8pJKyvARhQCzKtUKjx5lkZE/cK8lpxDNzWsX0Gq0H6+nguZlZx1IMJb/OYLMFBoVDmSR1zf1GhCC2G3eRYxIW3VsSf6yZps7evsXVnywmBercgifvUK42Jd8GlrjZo1E89+BDf3/VP//HEV5w/K1BEtvaI9MKMQ6pPzd2c9Fsd6wHbZFFEDOHzSYG3Fgf/zihBT3qAaWtFGp6kfBEbTeUcVFq63EnqlkQCkGFm37Xq6AcQW9TuHvPRyHzjOQUNKFj3XHtpBIWndx9N6m/laiDR6mhg4R1XXj8WFSZHFnKTFUozQ/rpy/48o0ivaSmOItRC/9KvN//HnB2OSOpsJfRUGn7AQeTN
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5832.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(7416014)(376014)(52116014)(1800799024)(366016)(38350700014)(6133799003)(56012099006)(11063799006)(22082099003)(18002099003)(41080700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XX7d341lm0+hgQrKIp9/x9htYftyMTv5vZIOSom1XPuqtAw0vS6LILbpzaoV?=
 =?us-ascii?Q?j4In7qk7HasidjUHtvwZo/Ou8ZzMM7ibeXM8U5Lyv2GmrSEFNF6wZjgFRinj?=
 =?us-ascii?Q?xHPoJn/EenXJ4TmqsjmDPje4Vu3Es3Nv4HlYoTZ7UH0JyddTqx7aKjnGN9iR?=
 =?us-ascii?Q?Od8XCMoxR8/m7X/jTSf49L1j6lO/RBGPVRLNNWWJ57HWcYS6u8DO+71KXeoS?=
 =?us-ascii?Q?Kxchz1CEvP1f3qP+EMHVpzutKIkk1AVcXoqSy6+yG8sNl+GInBheb0xQhoL/?=
 =?us-ascii?Q?FXTl0BGHVTpjgpK2WyllcJIyC4yhw6ArgW+g6c7rkN3UgGaGxuBn3N/wThvO?=
 =?us-ascii?Q?JMTK3mIB11/Stjs2tswxFIAApbHKHZkAoLV4e39FJSxiCf5Y2fvkvmEhXmLG?=
 =?us-ascii?Q?MNnOAJd/DLT2B7QpvGETM6T9YtHTWgTP4tKLNKvlfR4/rPcL8lsZoA3RgFWI?=
 =?us-ascii?Q?70mg1q8ZEjoCQmn4ub5lalvXtSKiRtHAR5CQmGb9mqJ6tVvGOG+APEh/fETn?=
 =?us-ascii?Q?vlFAk2Y2tdDrm4zw0xtYgDOZuaq1M3Dw6BayVQ2w4AF7JFay6gdhAv7PsiT7?=
 =?us-ascii?Q?rkz+gWgSLaLvX9El3bSiQKdNoCTqVkU8ZQIO2Z1Po5fHZ6yzE0MTGgyNpgq8?=
 =?us-ascii?Q?FHyerwpCCE9KafITNVU8BE+xVceZ+bF1wFbBHmshWBKqfMm2GwhDiRXrN+nw?=
 =?us-ascii?Q?rLPcK8aM5MzwJoFeti17wXxwsgl0QmQt3sYaK/kaYu2N0dXNJ9fYZQRHYwF4?=
 =?us-ascii?Q?nfIhVT+0xyvvwUEQYc/WCavQnIEDX7h4kTuOV4UKQQrC04qvvsgY+/VP49bT?=
 =?us-ascii?Q?cEyy0s55/xt79oU2QWrind8HNcMd54szhis+YJh2vwhnsd2eTMDnUfG18MUN?=
 =?us-ascii?Q?oP6kBCDBk4E+v/+5v2p3w1SGCu2G0DF5JEXP1X02oCyDw0DBvqO6aZXakU6V?=
 =?us-ascii?Q?fJTkAqXI1Irh/ZMK80CIY1zHQRuxZHc2xNvMZ4MNJFXLFZnPqUmypaSboPfj?=
 =?us-ascii?Q?6ln0a4ZXeewlC5ZJtpvJ49WDCQ/sBZz9cLlPWl6Yjwu0ULUMjv2UlZHaBfCu?=
 =?us-ascii?Q?HrFcdl/4bQLSLB+A8BXLPYUGAKPamCctDPHG4UhtRA1FYtaO13V/kzDQfJkn?=
 =?us-ascii?Q?842rolaL/OSM7d6GrKHXPSyTgTBWbQgt11rlMba75ZXLACmoWnfrDuSKKUZE?=
 =?us-ascii?Q?VG0lBxMwRwnNNi6/5pVTsb5YGhbEx3cycv3S4W/boQeI1TZgReKWzZwFPzeD?=
 =?us-ascii?Q?G96r4CYgl1NMzoIBfc7ybzMGUuEbOmyslbcH1sofvF51jgV7R11DGCjK/zz1?=
 =?us-ascii?Q?3ve6NtsfCceGHs9FogujGBu7OLt7MLx33CeNA/U0OgTA4KAMDRR37zSJJaY4?=
 =?us-ascii?Q?7keYajo57njgq2VmXLWiz+DnJBrFgyFABSOVMpWzIXmrrSf3jvH19eu3UXzS?=
 =?us-ascii?Q?ul70UHnw9GA22eduMlZUsjB5W3qUU8/6rKupBQqGQzqz3po53sfw9Bais+/u?=
 =?us-ascii?Q?5fn9TGd437kGQmR5bi+RDtOZ+5aJyDCCjYCRQcS1O9rmJxtNuxFxY9yFjvTX?=
 =?us-ascii?Q?C0M3Fja+a6Nd3iMNUOikfV+lRrXxwtb4hGtJL6npZEtD81JwPLcJItYgxOj8?=
 =?us-ascii?Q?lM/8sTUpGnj/agT6ggU2XliFj419UFcRsM45JYAp7YZ9XSurQb6eiTZAlduM?=
 =?us-ascii?Q?AguyDZePmuxAG/z35nfDTGiXW5hTvQI2jMErqDU87ux9aOEiSs5D5iPtJaV+?=
 =?us-ascii?Q?UsvLz0J13g=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbc5fe82-180b-4eea-939c-08dee23c9625
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5832.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 06:44:58.0134 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IV1eCzCAFMOqLCkkSyOqdg4aBiGm3bqN16cYaZK3pY2/atV4o+JJKB2hQqnKR7xOETHjwRL0kbbzqvHpOlo6yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUZPR06MB8991
Cc: imx@lists.linux.dev, linmq006@gmail.com, claudiu.beznea.uj@bp.renesas.com,
 geert+renesas@glider.be, kees@kernel.org, Frank.Li@nxp.com,
 linux-mips@vger.kernel.org, linux-tegra@vger.kernel.org, ldewangan@nvidia.com,
 linux-riscv@lists.infradead.org, samuel.holland@sifive.com,
 robert.jarzmik@free.fr, linux-stm32@st-md-mailman.stormreply.com,
 vigneshr@ti.com, thierry.reding@kernel.org, hayashi.kunihiko@socionext.com,
 zhang.lyra@gmail.com, magnus.damm@gmail.com, jernej.skrabec@gmail.com,
 jonathanh@nvidia.com, john.madieu.xa@bp.renesas.com, matthias.bgg@gmail.com,
 orsonzhai@gmail.com, keguang.zhang@gmail.com, linux-sunxi@lists.linux.dev,
 mhiramat@kernel.org, mani@kernel.org, linux-arm-msm@vger.kernel.org,
 sean.wang@mediatek.com, linux-actions@lists.infradead.org,
 haojian.zhuang@gmail.com, linux-mediatek@lists.infradead.org,
 baolin.wang@linux.alibaba.com, biju.das.jz@bp.renesas.com,
 quic_jseerapu@quicinc.com, wens@kernel.org,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com,
 dmitry.baryshkov@oss.qualcomm.com, wsa+renesas@sang-engineering.com,
 andersson@kernel.org, panchuang@vivo.com, linux-kernel@vger.kernel.org,
 thomasandreatta2000@gmail.com, linux-renesas-soc@vger.kernel.org,
 zhengxingda@iscas.ac.cn, cosmin-gabriel.tanislav.xa@renesas.com,
 mcoquelin.stm32@gmail.com, dmaengine@vger.kernel.org, pjw@kernel.org,
 afaerber@suse.de, daniel@zonque.org
Subject: Re: [Linux-stm32] [PATCH 00/26] dmaengine: Remove redundant
	dev_err()/dev_err_probe() calls
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
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:imx@lists.linux.dev,m:linmq006@gmail.com,m:claudiu.beznea.uj@bp.renesas.com,m:geert+renesas@glider.be,m:kees@kernel.org,m:Frank.Li@nxp.com,m:linux-mips@vger.kernel.org,m:linux-tegra@vger.kernel.org,m:ldewangan@nvidia.com,m:linux-riscv@lists.infradead.org,m:samuel.holland@sifive.com,m:robert.jarzmik@free.fr,m:linux-stm32@st-md-mailman.stormreply.com,m:vigneshr@ti.com,m:thierry.reding@kernel.org,m:hayashi.kunihiko@socionext.com,m:zhang.lyra@gmail.com,m:magnus.damm@gmail.com,m:jernej.skrabec@gmail.com,m:jonathanh@nvidia.com,m:john.madieu.xa@bp.renesas.com,m:matthias.bgg@gmail.com,m:orsonzhai@gmail.com,m:keguang.zhang@gmail.com,m:linux-sunxi@lists.linux.dev,m:mhiramat@kernel.org,m:mani@kernel.org,m:linux-arm-msm@vger.kernel.org,m:sean.wang@mediatek.com,m:linux-actions@lists.infradead.org,m:haojian.zhuang@gmail.com,m:linux-mediatek@lists.infradead.org,m:baolin.wang@linux.alibaba.com,m:biju.das.jz@bp.renesas.com,m:quic_jseerapu@quicinc.com,m:we
 ns@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:angelogioacchino.delregno@collabora.com,m:dmitry.baryshkov@oss.qualcomm.com,m:wsa+renesas@sang-engineering.com,m:andersson@kernel.org,m:panchuang@vivo.com,m:linux-kernel@vger.kernel.org,m:thomasandreatta2000@gmail.com,m:linux-renesas-soc@vger.kernel.org,m:zhengxingda@iscas.ac.cn,m:cosmin-gabriel.tanislav.xa@renesas.com,m:mcoquelin.stm32@gmail.com,m:dmaengine@vger.kernel.org,m:pjw@kernel.org,m:afaerber@suse.de,m:daniel@zonque.org,m:geert@glider.be,m:zhanglyra@gmail.com,m:magnusdamm@gmail.com,m:jernejskrabec@gmail.com,m:matthiasbgg@gmail.com,m:keguangzhang@gmail.com,m:haojianzhuang@gmail.com,m:wsa@sang-engineering.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[vivo.com:-];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[panchuang@vivo.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[lists.linux.dev,gmail.com,bp.renesas.com,glider.be,kernel.org,nxp.com,vger.kernel.org,nvidia.com,lists.infradead.org,sifive.com,free.fr,st-md-mailman.stormreply.com,ti.com,socionext.com,mediatek.com,linux.alibaba.com,quicinc.com,collabora.com,oss.qualcomm.com,sang-engineering.com,vivo.com,iscas.ac.cn,renesas.com,suse.de,zonque.org];
	RCPT_COUNT_GT_50(0.00)[53];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vivo.com:from_mime,vivo.com:mid,st-md-mailman.stormreply.com:rdns,st-md-mailman.stormreply.com:from_smtp,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BC48275B30A
X-Spam: Yes

On 2026-07-14 20:06, Vinod Koul wrote:
> On 09-07-26, 16:26, Wolfram Sang wrote:
>> On Thu, Jul 09, 2026 at 09:58:04PM +0800, Pan Chuang wrote:
>>> Commit 55b48e23f5c4b6f5ca9b7ab09599b17dcf501c10 ("genirq/devres: Add
>>> error handling in devm_request_*_irq()") added automatic error logging
>>> to devm_request_threaded_irq() and devm_request_any_context_irq() via
>>> the new devm_request_result() helper. The helper prints device name,
>>> IRQ number, handler functions, and error code on failure.
>>>
>>> Since devm_request_irq() is a static inline wrapper around
>>> devm_request_threaded_irq(), it also benefits from this automatic
>>> logging.
>>>
>>> This series removes the now-redundant dev_err() and dev_err_probe() calls
>>> in dmaengine drivers that follow these devm_request_*_irq() functions,
>>> as the core now provides more detailed diagnostic information on failure.
>>>
>>> Pan Chuang (26):
>>>   dmaengine: fsl-edma-main: Remove redundant dev_err()/dev_err_probe()
>>>   dmaengine: fsl-qdma: Remove redundant dev_err()/dev_err_probe()
>>>   dmaengine: loongson-loongson1-apb-dma: Remove redundant
>>>     dev_err()/dev_err_probe()
>>>   dmaengine: mediatek-mtk-cqdma: Remove redundant
>>>     dev_err()/dev_err_probe()
>>>   dmaengine: mediatek-mtk-hsdma: Remove redundant
>>>     dev_err()/dev_err_probe()
>>>   dmaengine: mmp_pdma: Remove redundant dev_err()/dev_err_probe()
>>>   dmaengine: moxart-dma: Remove redundant dev_err()/dev_err_probe()
>>>   dmaengine: owl-dma: Remove redundant dev_err()/dev_err_probe()
>>>   dmaengine: pxa_dma: Remove redundant dev_err()/dev_err_probe()
>>>   dmaengine: qcom-gpi: Remove redundant dev_err()/dev_err_probe()
>>>   dmaengine: sf-pdma-sf-pdma: Remove redundant dev_err()/dev_err_probe()
>>>   dmaengine: sh-rcar-dmac: Remove redundant dev_err()/dev_err_probe()
>>>   dmaengine: sh-rz-dmac: Remove redundant dev_err()/dev_err_probe()
>>>   dmaengine: sh-shdmac: Remove redundant dev_err()/dev_err_probe()
>>>   dmaengine: sh-usb-dmac: Remove redundant dev_err()/dev_err_probe()
>>>   dmaengine: sprd-dma: Remove redundant dev_err()/dev_err_probe()
>>>   dmaengine: st_fdma: Remove redundant dev_err()/dev_err_probe()
>>>   dmaengine: stm32-stm32-dma: Remove redundant dev_err()/dev_err_probe()
>>>   dmaengine: stm32-stm32-dma3: Remove redundant
>>>     dev_err()/dev_err_probe()
>>>   dmaengine: stm32-stm32-mdma: Remove redundant
>>>     dev_err()/dev_err_probe()
>>>   dmaengine: sun4i-dma: Remove redundant dev_err()/dev_err_probe()
>>>   dmaengine: sun6i-dma: Remove redundant dev_err()/dev_err_probe()
>>>   dmaengine: tegra20-apb-dma: Remove redundant dev_err()/dev_err_probe()
>>>   dmaengine: ti-edma: Remove redundant dev_err()/dev_err_probe()
>>>   dmaengine: uniphier-xdmac: Remove redundant dev_err()/dev_err_probe()
>>>   dmaengine: xgene-dma: Remove redundant dev_err()/dev_err_probe()
>>
>> One patch per subsystem for such trivial changes, please.
>
> Yes pretty please
>
Thanks, I'll merge them in v2.

Best Regards,
PanChuang
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
