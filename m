Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AM8nO1TjVGoWggAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Jul 2026 15:08:36 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C9F374B517
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Jul 2026 15:08:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=vivo.com header.s=selector2 header.b=ZxdDPtYI;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=vivo.com (policy=quarantine);
	arc=reject ("signature check failed: fail, {[1] = sig:microsoft.com:reject}")
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 08BD9CA8E42;
	Mon, 13 Jul 2026 13:08:36 +0000 (UTC)
Received: from SEYPR02CU001.outbound.protection.outlook.com
 (mail-koreacentralazon11013000.outbound.protection.outlook.com [40.107.44.0])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C58BEC7A83A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Jul 2026 13:08:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uxyH++akPmFLmz1mS1BNgLQtcy7d+BgXYSHM3VNjJxrk7zQBWgSU99Psb+cth7UIvNaHtC8I9MTW49UvCG4Uv1Dvz1iTtg/L8i3+pLBB/LRR/PxU2YhzAG+oNeTpZgSy3aPZaP06FzyF9gOVzo4+Nlili5khqnZjHBLfehZev/SbiZQBFbDG4suiE7HTmxajUY1j+AzFkQ/gZDoZGuIGsllMMIWfsxInNW481mZaXQGq8He/fNZO992YpglvwilercuPfv0llp1noG4Y70O/NP0vRcEkzJ1xxV7caqxHZfNtfcatakdUTiZ3LYk3+bEz7xPZoLUdgLbdjh84GECMyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cIJfD2AbPVHYUPeyZkYQ2XpDRNSrxa9S4jmZWvLB9rQ=;
 b=lH/FpUl0o5SkGk64MuIABAnmI1VlJ5ppeT+U/T2oXeeNEkia1u5cqiKpwMsmYKp2Y0PaDHM/ftQDZIFprfzTvucgFU6AyY0sqR3G4sR2Y6e9KfaY4ttY5CwMV6ChZokwk+hf/Zzgu63KOEIgXzvlgqqXjf/SKYn8kjoXSIsjG9wl3nyPPlYHNPmZuoU7fM8ROu1g850pfGXFsrHkssWGIWE77XUIJw45mn0xxefBIzXMyWW9JgTNEJ+i/H4U/TzO+jys/AK/YT5g0Jf2u3mTIgKg0kmk5IG7dHkuCEo8usFKo9nTfyRnfUhPtt82xYXXNu4+Hs01tNa96MEppbCOPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cIJfD2AbPVHYUPeyZkYQ2XpDRNSrxa9S4jmZWvLB9rQ=;
 b=ZxdDPtYI4mP8EnqVUUy8Rdw2zZgG/hOd4tNsL+OnZvDtueJYFFiIC8brm/xp+h0f1WHj5PsCorpd/XK3vlHnx/ljL6kfE7gi4jsUZRxrrGMnZRFIfmvDmtNmAdBkKcfCIOmMnvF1qNXtx/O2OJOKgXiyaBeY88BTe7MRj6FlfsQkx3f8sPI/IH+aN7KnPc6wfccNj5nbJW4TWeTJUcC2GV6xdH0dYCh4CCExtFGXXYIKNub+LFv0RFspJDhDdX7rScgn1ShvqjdepHEKaivXTcJYvLAfElGCgensVrbswmwWyj7w5wVYSbOSbeYvICGv6BGJTgTfW7TtJCjFs4ZC5A==
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com (2603:1096:101:c8::12)
 by SE1PPF50B2D80A0.apcprd06.prod.outlook.com (2603:1096:108:1::415)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.14; Mon, 13 Jul
 2026 13:08:24 +0000
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b]) by SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b%6]) with mapi id 15.21.0202.014; Mon, 13 Jul 2026
 13:08:24 +0000
From: Pan Chuang <panchuang@vivo.com>
To: Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>,
 Daniel Lezcano <daniel.lezcano@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Thierry Reding <thierry.reding@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 linux-arm-kernel@lists.infradead.org (moderated list:ARM ARCHITECTED TIMER
 DRIVER), 
 linux-kernel@vger.kernel.org (open list:CLOCKSOURCE, CLOCKEVENT DRIVERS),
 linux-stm32@st-md-mailman.stormreply.com (moderated list:ARM/STM32
 ARCHITECTURE), 
 linux-sunxi@lists.linux.dev (open list:ARM/Allwinner sunXi SoC support),
 linux-tegra@vger.kernel.org (open list:TEGRA ARCHITECTURE SUPPORT)
Date: Mon, 13 Jul 2026 21:07:39 +0800
Message-Id: <20260713130740.293502-1-panchuang@vivo.com>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: SI1PR02CA0058.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::9) To SEZPR06MB5832.apcprd06.prod.outlook.com
 (2603:1096:101:c8::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5832:EE_|SE1PPF50B2D80A0:EE_
X-MS-Office365-Filtering-Correlation-Id: 3abc10ae-ae71-442f-e004-08dee0dfd20d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|52116014|7416014|376014|18002099003|56012099006|11063799006|6133799003|921020|38350700014;
X-Microsoft-Antispam-Message-Info: js8svtIINX1ETYEpeKJCBgN5MJfgWGuP3Z6nnMRsudxw/V3QXUwJ0UwNv2o17OZv4m//MjsE0ZS7UAFAcQuCmCPEfxlhUf0NX5sJJulAcfAZHq/N6Jf1MgjIPal0IexutmruemKr1ejCkYdzAW8HpqcKiz+xVlORV8wrtLm6Q6ZQoG0iwewdQKzWvbBykIXcGRYNOrx0aBIbMEqe22uHgDk6U+HVunkHr357vejvcLSYnqXxH1n+ti+FpimbGDfP3cVSKt4Eti3w3GbJ8C3KQpoojvB9svur/SfcidFSeWbuGTZPpIjBOO1qi7ZZTvorRUf+TeQUXzPGT9XagVH2z4W0UMQEqjC6W/at+9ChVbnI+t01s0gjM6r1jEUZ/ypYpGmNhQwObxpSFSiato9FC1VrZ48bb+5UcSzlVWMgdPU+Vmzrqeri9GpXu4VcWHwZU6wzI1volIYnKqN17isZDlDUUOZKGFz9rA9B3TIOpgXudPvyREoWBiYQtk3sqU7Cf+yozEQ0VNd+P7lEDNuoaHs80Gu+yynchczX2dgWccL0EvpOLtvca6/kmw4Maq3cICicZ0r5FYRkQZC2R/6JKALYWhBk6Ke7S6MnV6VRcCwNGSrUCeryAB1QEsHhUdSqlhbVWyzlcurLB30tZItFKuLPzmLyzlCs96r1AsXF65kiaUozA7JpfplVAcSveIol0rtuHsaqNjaxrux1+mL7e3yPrpesRSe2lE7xj1M+g516YW0pci1BPrT7rvlPEfjg
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5832.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(52116014)(7416014)(376014)(18002099003)(56012099006)(11063799006)(6133799003)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Gm1qA+hNhGduEAZL/di9FbpsxGIQxRRbdkiTQFI5Yt+nCy3yYoWu+lHGvPrF?=
 =?us-ascii?Q?0EpcdJWqtGcmQ9ZwltJgNv0I0U/D9xnvUagH2PUE60VUQ3TRSDsp7jyFMq22?=
 =?us-ascii?Q?fQay+CYFXqzuEcqCdwPDvvFJlVsu0WDwwTEWfRnxH5lHV6ruiw8OP9FeaRH/?=
 =?us-ascii?Q?NNyd0pxtDJytWjVYPsYfHAgFKIBLbGCHMtE47T3UAUljSW0V3XahrcI25Cw3?=
 =?us-ascii?Q?mj5cSE+bxkiRVDXBNNPU0vFaCvwe1F17B2oR+Ka6cgYZSte7pNWC+dMyepqg?=
 =?us-ascii?Q?+hwPjD8ZO5YrT1G0JUb/95o8nuuuXJNoNpO1G5QqQKISUtJkDok7Tfnmu/P5?=
 =?us-ascii?Q?Y9p6ApL1yPBwJIDGLJj3eSJqH3yiAXpUiHdkTocy5+Xp9mz9sPkpBcbORbvp?=
 =?us-ascii?Q?LVWQK6Li1LK0omR4Owm1omt0A2dC2wCa3P/y8Vxjq7qWW2aeQ3ayrdmjBihu?=
 =?us-ascii?Q?de7oIb35jpKLEy/0ZKn+Pet5/gqDsH61PHoQSgQ0ta1pq3CJ67iTFQE4pAFX?=
 =?us-ascii?Q?0wGTcCzlD/kGdYVsf3ufLYQ7wUEwKVQwmzcWr90b8+oVMbjqN9xoLNS3SmIJ?=
 =?us-ascii?Q?ZC6bb5sm/6cFKEQIzD9kyOBmGRqqGi8tg44mUXyZhCbhQVUaVKH8ezGwxaHq?=
 =?us-ascii?Q?m+ynCvVLeMXVfuiaSmby+CQ/Zwz8dNFkeEJbauhqW4iVLUt3V+SWzU4RNUhj?=
 =?us-ascii?Q?aZPaJUJjy2qVveN6HiZutMiX9WDCaZk/+fd2AQvpwSBoxGFLD3Ju3fSCuK7W?=
 =?us-ascii?Q?JNFz9wKDK7ATnHrEgZwRgACja1dEknFvym3YsDUwKHU8Fw4jIv01Nb/QJdM3?=
 =?us-ascii?Q?D+ImQ0E7P8h46Bmwx3AZERZJ/nBjH+WbzNvvb6ywcbxjAFHWHyXq0VHcfkpe?=
 =?us-ascii?Q?5W6W3gyyfGPPl/kMQKhC4tAgPd59EHkZzmqOMZv1NWrIltxG3aOesqsdlMdJ?=
 =?us-ascii?Q?4foqHKv05GXpkXolTf2AR1IQ9Lxgyu78cwIzkLUX3mguhztmX2TCkjrKXeGp?=
 =?us-ascii?Q?Q05HDwT3dUJG/7m+4uIRGf42ssdpemxw/e+AXH+LdGDnbu9Ld9puZLENygku?=
 =?us-ascii?Q?dxyoKuNDxQJ7fx666JCvr5zD4Yk31QZhXM+JM4ufQS162E+lxRgE5fbJ7P4l?=
 =?us-ascii?Q?SDJ+y3kczMsD7hXxEOPHXq5OYGDxPwnA2ne9Gj0/OVQ1iFLaL/uXAcAIWTwe?=
 =?us-ascii?Q?2bjgQtHoipOJeewSDm7t0WYc7VUAsM3EPGGtXSUrKRwDibwTTa/lvcCs27NX?=
 =?us-ascii?Q?RZnWZYF5M7h/L1XV1SeHghScxQn1zu3P5s5td60uafgzJdR9fLrXtjql9rGV?=
 =?us-ascii?Q?LgGBFEZLHK0yLC8DLuD3+O6UnfPaw2kP/l2U+KQHYrKL8l0n0T4fhrRdnga4?=
 =?us-ascii?Q?Cir/4FonX50zMkG7rnM9IlRimh9uwygE1VUsmujpUsN0Z3B6+lvUzWRbk/Qu?=
 =?us-ascii?Q?Z9Cbpds3XuWRbCS0W6fcZwFLaQ6dBXFOAkHqw2cEWndmd35RKFwyaL9xPor5?=
 =?us-ascii?Q?6ZwHzc2U447tMrGXD1pCoW+76auWiEjtm4Llm19GfTEeK/Z3kW2Iaakg2wvI?=
 =?us-ascii?Q?pLRcP/XPtraus+rIks8HTzyvSAbqzWxBeA+yWqOqMnUp3F4D+io2iWQLW0Qm?=
 =?us-ascii?Q?wfWaFPefeYpcXLkM1MnqQ/XwQ8Wa4kV1z9Me5gftuqxZzMBqIYRh1lDQWLQc?=
 =?us-ascii?Q?OwwPqpxRjUMvukYqYfRcPHGyn8QyM5DUba9XzLvM32q1wWZmAuyYVblI3wCI?=
 =?us-ascii?Q?wuh4cdDCcQ=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3abc10ae-ae71-442f-e004-08dee0dfd20d
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5832.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 13:08:24.3204 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X4MvBVw+BY8pjuAhWJriisPdUvsevuSVvJagKIyU6cKOK502kgk+BkPCUrsy3TrdDi6IONBnNgDdV8qOpnb44g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE1PPF50B2D80A0
Cc: Pan Chuang <panchuang@vivo.com>
Subject: [Linux-stm32] [PATCH] clocksource: Remove redundant
	dev_err()/dev_err_probe()
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
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[vivo.com:s=selector2];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:mark.rutland@arm.com,m:maz@kernel.org,m:daniel.lezcano@kernel.org,m:tglx@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:wens@kernel.org,m:jernej.skrabec@gmail.com,m:samuel@sholland.org,m:thierry.reding@kernel.org,m:jonathanh@nvidia.com,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-sunxi@lists.linux.dev,m:linux-tegra@vger.kernel.org,m:panchuang@vivo.com,m:mcoquelinstm32@gmail.com,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_TO(0.00)[arm.com,kernel.org,gmail.com,foss.st.com,sholland.org,nvidia.com,lists.infradead.org,vger.kernel.org,st-md-mailman.stormreply.com,lists.linux.dev];
	FORGED_SENDER(0.00)[panchuang@vivo.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[vivo.com:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[panchuang@vivo.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vivo.com:from_mime,vivo.com:email,vivo.com:mid,stormreply.com:email,stormreply.com:url,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6C9F374B517
X-Spam: Yes

Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
devm_request_*_irq()"), devm_request_irq() automatically logs
detailed error messages on failure. Remove the now-redundant
driver-specific dev_err() and dev_err_probe() calls.

Signed-off-by: Pan Chuang <panchuang@vivo.com>
---
 drivers/clocksource/arm_arch_timer_mmio.c | 4 +---
 drivers/clocksource/em_sti.c              | 4 +---
 drivers/clocksource/timer-nxp-stm.c       | 2 +-
 drivers/clocksource/timer-sun5i.c         | 4 +---
 drivers/clocksource/timer-tegra186.c      | 4 +---
 drivers/clocksource/timer-ti-dm.c         | 4 +---
 6 files changed, 6 insertions(+), 16 deletions(-)

diff --git a/drivers/clocksource/arm_arch_timer_mmio.c b/drivers/clocksource/arm_arch_timer_mmio.c
index d10362692fdd..d678f764d3bb 100644
--- a/drivers/clocksource/arm_arch_timer_mmio.c
+++ b/drivers/clocksource/arm_arch_timer_mmio.c
@@ -313,10 +313,8 @@ static int arch_timer_mmio_frame_register(struct platform_device *pdev,
 	ret = devm_request_irq(&pdev->dev, irq, arch_timer_mmio_handler,
 			       IRQF_TIMER | IRQF_NO_AUTOEN, "arch_mem_timer",
 			       &at->evt);
-	if (ret) {
-		dev_err(&pdev->dev, "Failed to request mem timer irq\n");
+	if (ret)
 		return ret;
-	}
 
 	/* Afer this point, we're not allowed to fail anymore */
 	arch_timer_mmio_setup(at, irq);
diff --git a/drivers/clocksource/em_sti.c b/drivers/clocksource/em_sti.c
index ca8d29ab70da..73a3357d173d 100644
--- a/drivers/clocksource/em_sti.c
+++ b/drivers/clocksource/em_sti.c
@@ -300,10 +300,8 @@ static int em_sti_probe(struct platform_device *pdev)
 	ret = devm_request_irq(&pdev->dev, irq, em_sti_interrupt,
 			       IRQF_TIMER | IRQF_IRQPOLL | IRQF_NOBALANCING,
 			       dev_name(&pdev->dev), p);
-	if (ret) {
-		dev_err(&pdev->dev, "failed to request low IRQ\n");
+	if (ret)
 		return ret;
-	}
 
 	/* get hold of clock */
 	p->clk = devm_clk_get(&pdev->dev, "sclk");
diff --git a/drivers/clocksource/timer-nxp-stm.c b/drivers/clocksource/timer-nxp-stm.c
index 1ab907233f48..6fe098a4a33f 100644
--- a/drivers/clocksource/timer-nxp-stm.c
+++ b/drivers/clocksource/timer-nxp-stm.c
@@ -441,7 +441,7 @@ static int nxp_stm_timer_probe(struct platform_device *pdev)
 	ret = devm_request_irq(dev, irq, nxp_stm_module_interrupt,
 			       IRQF_TIMER | IRQF_NOBALANCING, name, stm_timer);
 	if (ret)
-		return dev_err_probe(dev, ret, "Unable to allocate interrupt line\n");
+		return ret;
 
 	ret = nxp_stm_clocksource_init(dev, stm_timer, name, base, clk);
 	if (ret)
diff --git a/drivers/clocksource/timer-sun5i.c b/drivers/clocksource/timer-sun5i.c
index 6ab300d22621..bcf155fb9cac 100644
--- a/drivers/clocksource/timer-sun5i.c
+++ b/drivers/clocksource/timer-sun5i.c
@@ -247,10 +247,8 @@ static int sun5i_setup_clockevent(struct platform_device *pdev,
 	ret = devm_request_irq(dev, irq, sun5i_timer_interrupt,
 			       IRQF_TIMER | IRQF_IRQPOLL,
 			       "sun5i_timer0", ce);
-	if (ret) {
-		dev_err(dev, "Unable to register interrupt\n");
+	if (ret)
 		return ret;
-	}
 
 	return 0;
 }
diff --git a/drivers/clocksource/timer-tegra186.c b/drivers/clocksource/timer-tegra186.c
index 78600ddeb1c6..0f626ecf61b0 100644
--- a/drivers/clocksource/timer-tegra186.c
+++ b/drivers/clocksource/timer-tegra186.c
@@ -532,10 +532,8 @@ static int tegra186_timer_probe(struct platform_device *pdev)
 	if (kernel_wdt) {
 		err = devm_request_irq(dev, irq, tegra186_wdt_irq, 0,
 				       dev_name(dev), kernel_wdt);
-		if (err < 0) {
-			dev_err(dev, "failed to request kernel WDT IRQ: %d\n", err);
+		if (err < 0)
 			goto unregister_usec;
-		}
 
 		tegra186_wdt_set_timeout(&kernel_wdt->base, TEGRA186_KERNEL_WDT_TIMEOUT);
 		tegra186_wdt_enable(kernel_wdt);
diff --git a/drivers/clocksource/timer-ti-dm.c b/drivers/clocksource/timer-ti-dm.c
index bd06afb7d522..6787acac9a43 100644
--- a/drivers/clocksource/timer-ti-dm.c
+++ b/drivers/clocksource/timer-ti-dm.c
@@ -1375,10 +1375,8 @@ static int omap_dm_timer_setup_clockevent(struct dmtimer *timer)
 
 	ret = devm_request_irq(dev, timer->irq, omap_dm_timer_evt_interrupt,
 			       IRQF_TIMER, "omap_dm_timer_clockevent", clkevt);
-	if (ret) {
-		dev_err(dev, "Failed to request interrupt: %d\n", ret);
+	if (ret)
 		return ret;
-	}
 
 	__omap_dm_timer_int_enable(timer, OMAP_TIMER_INT_OVERFLOW);
 
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
