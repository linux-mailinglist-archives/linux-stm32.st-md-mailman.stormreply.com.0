Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MHgANGk2GWrzswgAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 29 May 2026 08:47:05 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 708525FE1E1
	for <lists+linux-stm32@lfdr.de>; Fri, 29 May 2026 08:47:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E1D78C8F291;
	Fri, 29 May 2026 06:47:04 +0000 (UTC)
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010053.outbound.protection.outlook.com
 [52.101.193.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B14E2C87EC6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 29 May 2026 06:47:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ueM2Vl6rjt1YixRLl9sAtCbJOKQ8ZMqyQb7kCAYlxHVr/1Z1/mfv4Cz5k3l80zE2ZxxgAPzAeq0qg5xCLVaNCkh+u8tXvYLSwpe8iJYtMme0WVMaLlYjTOHkeEKqksfHXvmSqegBX0sxcHRgOAoVmHX6+gufbqhWe5UJ2w9X5eh6kyNu/ijx6wjkDkXl9jry9UhQQVpXeSQSisXXywNLcW66uWqvep0K6nJMG8RSnAaTNTEL94FY2Mw3uVi1znM8UjZtW+2LW5POTBMfyyrpdcPppwyFUyAnDL0GY5SvYP/gG1FYOtAjpDygde5+sHirBmwb6Vr8ziwdj1MK9XmlYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0uIOdmH2gf4n0/FdjEI3JVnme1HnFWdBnkUzUk34F7o=;
 b=T4CW5kiURcurrOn8d9TJqc/CjyC0K3zaHSpaES2S4GvNmfMGFVkDQDJD2/uRL6GudZ3tAQGMHDT4RYJKgXH7na2YO2sTf2FmH2B4ANGv2W4wmWtdKBqqKnje9nfxUgePTWBiXGCU10FxHXdCPK8eJjj5MFgW6VJZ9vpzg4ux1fhCThva2pfVeTWpTyLxJrCEFHPpDArtftIHzc9DnnrpjZRAufkd2l9dnZRTLL80VPtGgIoevlSmS61Xl64fAppsEaD4VMxKilqwExJ0ZcOGRqphWDADTv6G/vp2RaWcYzunu9s5pzCYbZrkbH7yn/Ae8aPd/seUk0PMvFGO784EOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0uIOdmH2gf4n0/FdjEI3JVnme1HnFWdBnkUzUk34F7o=;
 b=LQGfoe+Fjhg53Z0QWYoI+hx9/MbmFruj9EEONSoLZmasUPcjI8k5cLmll7Bd1buWGzfxsT3iLswoLRnYMrYT0sUEVEt4EwZWMOTQDe1lENLS8jzSVhqzKUS+E4D9+U2/+BEYAm9PDCETXSmCcc7d9JExmTwVhICrDpCGgWsELxM1h/8CXEr749NzdZvjms/cQFnhQmp7iftnZdhe78I7YNSP3t2kTuXpKpJU7YKDFAgh/Y9zPqOdE9n+ggE0lmCg8EgUI9KPFLbcI+FOQ5BEiOyIvQ1tv+xSnd2e6RQobha7JJZZj8ccTvB2Qsf5d3UeB1UVv8CFhOytIjIzLbWE5g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com (2603:10b6:a03:432::18)
 by DS0PR03MB8200.namprd03.prod.outlook.com (2603:10b6:8:293::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Fri, 29 May
 2026 06:47:01 +0000
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775]) by SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775%6]) with mapi id 15.21.0071.011; Fri, 29 May 2026
 06:47:01 +0000
From: muhammad.nazim.amirul.nazle.asmade@altera.com
To: netdev@vger.kernel.org
Date: Thu, 28 May 2026 23:46:59 -0700
Message-ID: <20260529064659.32287-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
X-Mailer: git-send-email 2.43.7
X-ClientProxiedBy: SJ0PR13CA0113.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::28) To SJ0PR03MB6964.namprd03.prod.outlook.com
 (2603:10b6:a03:432::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6964:EE_|DS0PR03MB8200:EE_
X-MS-Office365-Filtering-Correlation-Id: ab49e06a-a7fc-40e5-ba3d-08debd4e1626
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|18002099003|55112099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 9v+2rYosFelVEvr8xa3umopqLUeXAuNwefYGcS9Goxdl2cHpk52DRqcosbKbgzFvfs0qDO8KVISg1GaN7g2PNuG/ku5RLzP/1bZ31+AeEEydB1oPbRiRus7TjjxNisBpLvtn7yL/ab7+BIsXP6omE9Jk5DFZFKCHWIdW569nE211nXbbVLsiAlqQdO0aCSTHadA/uPii06+agLyvFDU2ezPNr0p/V9FvWSf/AcT9u9GyPjQKfNN0xtmzFdTL/sm7qbeEx4+uY7lXlWXaFtQbwYsOuJZu6+wMdvmxbTFeAqPsh1bfb2MOmihQfE1tPCVEHb8B1Pr78LyaFfG3tfKXKPK8vgKzic/tUvY5wYRMz3oswte1XKf+gVJiYcXcQKV/9fWPaDYqkkdUwJEkVqSRxbw0emoVi89SD17v+25gEZtTKukTL9tXz4KmAYfr8BIT1mk3EorSGq2PaZG15y/q+fBbu6DRSeDG7BW6ZwfR9F7RnqxntPMYU9TpC7HS9tlNmxt2bISOEPbDI7BOebJqwLszYrhQRwzxeKfLz4Soo1JZuRskMQyeBySjVdUGX63r/K8UkopetzfofO1aQBUHewXf8gNXun1j8UGXY6BqVhZULSYohD40qO5pjrBgmxswceHF1KA6Tc+LZs+QYjt3AjKDMYP1AhgRkZVnhbajV/ZeGHFuUzCJMIx6mSwl2MOr
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR03MB6964.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(18002099003)(55112099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?a0n/XF5LAIhxdTRiuaBSwBJanXkmnmRxg/iHl5H/0Po/4+RIISatR2+EcUrS?=
 =?us-ascii?Q?TSB1g+0FOqIpQkLmPYGRLSmBeCpiQdI97blDzQXDTnMufig7c8WQ37R3EAmM?=
 =?us-ascii?Q?XCcUtMGPxBn+6KwbEmIjd6SY2AIZkrj+DBqgQSCqaF1FmDtje3baEVg0B8/m?=
 =?us-ascii?Q?fIo+95t0WvHv086Al5P2s3vv7CXX9lny/ZuTJD7EyVSjnEI71futxh0o+jLr?=
 =?us-ascii?Q?lvA84eZZIW0vqAaphuOcOSoeAkKZFEuS2lbYo8hMoEjTI65NRO3f4/hYVgDh?=
 =?us-ascii?Q?QndG3A93Bk37GOSQg4IDL5+7+JrK2upeyZyNS3sdQ83Ul4HnM6OPnDZ/JWzV?=
 =?us-ascii?Q?cR5RiRLgRArs5VRLvg9YEufZa64ISmoe9tayo+8bfQ/YxrjVaUr6RvTPykxj?=
 =?us-ascii?Q?AKClYUy4Wn7nVDQnUJ0udiMI0F8TwW9xfULwNqBHVEe+vxi8GsuA+rYlMVLX?=
 =?us-ascii?Q?4OqBeoLvntkgS8wjO23XZKTx9IYumCyeW9n/unMzTWlDS+T/6dzj7PD0rFp2?=
 =?us-ascii?Q?+PogxGs/7Ohj++zji7V7VVmmCYsznHq2c0StxtwC+j4/vi63DsL9bAALVg8T?=
 =?us-ascii?Q?NeHLPVMJo8B7wk8LK3PC7CdrTdDgcQX+4cyl4+27Da4kaP0WF7Lhwxsif4MT?=
 =?us-ascii?Q?C6P9FviyRvi5YMN/khzLskwNzyEyNxLrjFJVMyzZMFGyU9i3E2g5YWkkg5Ia?=
 =?us-ascii?Q?16jo9vw1it9rRzM9a4kcio8nn4H0nDBO6ABwRxS4aup5GVJ1iVphThAc3tyO?=
 =?us-ascii?Q?GUUMzLfw3ojmUHV1NVKB4C6leXBiHg1sKxh3itvjisLVko3ctbkCuYOUn1Bn?=
 =?us-ascii?Q?gBZ9PDkBR1C7fE5d03jhvXT+n2LWckflwO9nKdpe6T6gjqIvqSWbPVeAKmol?=
 =?us-ascii?Q?IkTjIogXFYE/V5DZC7mGFcYR8D/+lrcEANljlAI7iFZ/VseVIlDvoARfukFa?=
 =?us-ascii?Q?XNpgoIycRi3JRO8dOC2buNAKSWyArhD/ZsVvqTwkKatQeE8YgAmDfGxy98BM?=
 =?us-ascii?Q?S3DLAE/lvBZFkAUwzbMefVtzmhY+nvl9c71RgKhZRj+wIqZcXPcY6cmZHVTX?=
 =?us-ascii?Q?RoLf9h/Hg9+QuzCcnZMZTWZ/+gU/R7NRXJI3bAZqp6ur/ub+hLvVG3Tr7bqn?=
 =?us-ascii?Q?HwcQb6zTQ+930Pm+hqxq4RpA5Wa9W3QyxX+5PhEo4I+z2O1jJzwV/B/vsfuW?=
 =?us-ascii?Q?hX1FLuu9KkAu2dWO1lPZf7aF31wVknd9owAMJr/ldNrIwd9HAHmNH61K+eSP?=
 =?us-ascii?Q?/edzNCf6aV08ODEWfcRlhDBXLj04dLj2VjKgfVJHo2P60c+oFLCRfww3hm4J?=
 =?us-ascii?Q?wfVXhB5CLEuEZg5gRuIN6jXFsMWALY/vB71ikd1jMBaIoDs+eNNrPTSJ0HOj?=
 =?us-ascii?Q?f9Sk3jXahpq/ujMXzFdoSZ1KgSbuOgqMcRvZ6zfghKE2ZQmNo13dT95MM024?=
 =?us-ascii?Q?Zsbiw+6Vuaql3O8G9kd690RI2lujNgZHJDC1hSaWDPN5RCD7HWo8Ub9TJA2b?=
 =?us-ascii?Q?xlRLKkhYXi06N00+7he8FA4YvNWhLUMB2+Sw8Y2PvppJ4m5VCAYHAYE/25mi?=
 =?us-ascii?Q?NPVQRYtObCkPCUtkhB+69Znj9e2zwI9H6SJA2NmTiowtGTmuWnUjST9xnJIm?=
 =?us-ascii?Q?ptwosCChJX3PGR6h2MHqzU2scaijYtrKwYH+1PQ4xs/8zWu+Vh7ZNnAa6u92?=
 =?us-ascii?Q?VagfJW3eaTpqTpvKZfD+O1AW3/d0XEWvJpMW2AWfQHLHkiMVhyXrNibgtS7f?=
 =?us-ascii?Q?fAjzXfSAspVOjnWhZo/fg0bLBKNTpoVr0xVSAU3MZln3D9qHiOM2pKj0BbQ2?=
X-MS-Exchange-AntiSpam-MessageData-1: 9RvWgty58n5psw==
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab49e06a-a7fc-40e5-ba3d-08debd4e1626
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6964.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2026 06:47:01.2058 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RdDJ/d8CS2zvjZWhKuLdWhwvaO/4KLFEl4o1a7uIg0QrEfMMGMXf71naMzzB13tPAd3gKtoufcaxOThB36M1QomGo384shrrKJSevMipEheh98FHaG9qNLb87Z8bTSJBHqMn5zlfe3zHHjB321RkXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR03MB8200
Cc: linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, edumazet@google.com,
 mcoquelin.stm32@gmail.com, kuba@kernel.org, pabeni@redhat.com,
 rmk+kernel@armlinux.org.uk, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3] net: stmmac: Improve Tx timer arm logic
	further
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
X-Spamd-Result: default: False [7.29 / 15.00];
	DMARC_POLICY_REJECT(2.00)[altera.com : SPF not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	R_DKIM_REJECT(1.00)[altera.com:s=selector2];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:maxime.chevallier@bootlin.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:mcoquelin.stm32@gmail.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:rmk+kernel@armlinux.org.uk,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:rmk@armlinux.org.uk,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[muhammad.nazim.amirul.nazle.asmade@altera.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,st-md-mailman.stormreply.com,bootlin.com,lunn.ch,google.com,gmail.com,kernel.org,redhat.com,armlinux.org.uk,davemloft.net,lists.infradead.org];
	DKIM_TRACE(0.00)[altera.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[muhammad.nazim.amirul.nazle.asmade@altera.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	NEURAL_HAM(-0.00)[-0.743];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,kernel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[altera.com:mid,altera.com:email,intel.com:email,bootlin.com:email,st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 708525FE1E1
X-Rspamd-Action: add header
X-Rspamd-Server: lfdr
X-Spam: Yes

From: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>

Calling hrtimer_start() on an already-active txtimer is unnecessary
and expensive. Skip the restart if the timer is already active by
adding an hrtimer_active() check before hrtimer_start().

Previously, each packet reset the timer to tx_coal_timer in the future,
acting as a sliding window that delayed NAPI under burst traffic. With
this change, an already-active timer is left to fire sooner, scheduling
NAPI within tx_coal_timer of the first packet and freeing TX descriptors
earlier.

There is no race concern: hrtimer_start() is internally serialized and
safe to call on an active timer. In the event of a race between
hrtimer_active() and hrtimer_start(), the worst case is calling
hrtimer_start() on an already-active timer, which is identical to the
pre-patch behaviour.

Performance on Cyclone V with dwmac-socfpga (iperf3 -u -b 0 -l 64):
  Before: ~45200 pps
  After:  ~52300 pps (~15% improvement)

Additionally, ~10% improvement in UDP throughput observed on Agilex5,
with hrtimer CPU usage reduced from ~8% to ~0.6%.

Signed-off-by: Rohan G Thomas <rohan.g.thomas@altera.com>
Tested-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>
Signed-off-by: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
---
Changes in v3:
 - Corrected commit message to accurately describe timer behaviour change:
   timer now fires sooner under burst traffic, not "unchanged" (Andrew Lunn)
 - Added Reviewed-by from Jacob Keller

Changes in v2:
 - Expanded commit message to address race condition concern and clarify
   tx_coal_timer semantics (Andrew Lunn)
 - Added performance numbers to commit message (Andrew Lunn)
 - Added Agilex5 performance data with hrtimer CPU usage improvement
 - Added Tested-by and Reviewed-by from Maxime Chevallier
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions()

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 3591755ea30b..35da51c26248 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3341,12 +3341,14 @@ static void stmmac_tx_timer_arm(struct stmmac_priv *priv, u32 queue)
 	 * Try to cancel any timer if napi is scheduled, timer will be armed
 	 * again in the next scheduled napi.
 	 */
-	if (unlikely(!napi_is_scheduled(napi)))
-		hrtimer_start(&tx_q->txtimer,
-			      STMMAC_COAL_TIMER(tx_coal_timer),
-			      HRTIMER_MODE_REL);
-	else
+	if (unlikely(!napi_is_scheduled(napi))) {
+		if (unlikely(!(hrtimer_active(&tx_q->txtimer))))
+			hrtimer_start(&tx_q->txtimer,
+				      STMMAC_COAL_TIMER(tx_coal_timer),
+				      HRTIMER_MODE_REL);
+	} else {
 		hrtimer_try_to_cancel(&tx_q->txtimer);
+	}
 }
 
 /**
-- 
2.43.7

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
