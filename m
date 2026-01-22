Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id rcEmJ5nkcWngMwAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 22 Jan 2026 09:49:29 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8872F636C1
	for <lists+linux-stm32@lfdr.de>; Thu, 22 Jan 2026 09:49:29 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4D283C87EDE;
	Thu, 22 Jan 2026 08:49:29 +0000 (UTC)
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazon11021135.outbound.protection.outlook.com [52.101.125.135])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 542C9C57B72
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Jan 2026 08:49:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ifg+ev79Q4V2XJQaYpWhjnY7PNEKfbYX6rwfhOnQYN3riE2ym+ac1ngC2PONwNhSCbni9KS3qtSDROTwzS162bQXGAo4w4V5WhjFyl/BKIDTtWePVZi3nuWOUivLCvwNw63UTR4020l3UuEnOSaSsgpgghCadY0dxdH/qp9c5wNezzaFS1f+J1L0fBeQ2CqIEUqNEclwdnmJrJ5Ic4PmBMhF4GgXfl5Y4BshoW71R//CTEAzVkI3PxboUxFDUZZjNTe0iYER70xGxVb3TfFO5gh6qFxmAHRMpgUhpHLZChbJ/Y2L9CJQfLcQ4WQJn50V/4gDCBMk2ZsfNCR1I+2JyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MSfDgrnt2cCrEyyJfuZXWDOIGtQenskOC5SrPBW2Y1I=;
 b=lw3PUGT7KYN7kPzmavFo/lBfTA0fRQrv84Sc/yza4pNKtpC3+zj0AbViB1D2KMTJPOwaXRDZuwGHRAhb+QeMPYemVtjlvruzDfrhcN4PAKWsY01A7pvHzAZa5HzgrWtjldbhPlGWI5jpOFWTj+1bz1WiSg5HXJFswxJ5p25Dc1U2wzsWAHeLNAr5He2gr1u3RT6Ds0yDMfNkzKwoLL0ErPHRagYYeSBHHTn7Ei5wLi1Oz1/bhM5gJ+WyP/CqOhqwe7LVHMp2UDC++P8i9dvj49/gHsnm6MpQzhJMgLmSMEWD00OXadXji97R6P9y/QH2UlYhk3dgBT+1Fiv+ESYjiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MSfDgrnt2cCrEyyJfuZXWDOIGtQenskOC5SrPBW2Y1I=;
 b=oYZYIQd1DQTVbn+ZGISQAsWF+tH7klkGOjMt07/Z+YfdxPIF7DEIb3ohuync6l8Fsd/jtoGkpHtuWSPqz6hmqtC60moZyaYZVTnCvPhN9ySm0m3JCmgjPv+SKvoa39x3hljPpO+bzeHqFK0+BsFXc9OoB+ajKpclRnGv1UOti5o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TY7P286MB5719.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:2c3::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Thu, 22 Jan
 2026 08:49:22 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%5]) with mapi id 15.20.9542.009; Thu, 22 Jan 2026
 08:49:22 +0000
From: Koichiro Den <den@valinux.co.jp>
To: jingoohan1@gmail.com, mani@kernel.org, lpieralisi@kernel.org,
 kwilczynski@kernel.org, robh@kernel.org, bhelgaas@google.com,
 cassel@kernel.org
Date: Thu, 22 Jan 2026 17:49:09 +0900
Message-ID: <20260122084909.2390865-6-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260122084909.2390865-1-den@valinux.co.jp>
References: <20260122084909.2390865-1-den@valinux.co.jp>
X-ClientProxiedBy: TYWPR01CA0012.jpnprd01.prod.outlook.com
 (2603:1096:400:a9::17) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TY7P286MB5719:EE_
X-MS-Office365-Filtering-Correlation-Id: 34817503-ba2a-42a4-7747-08de59932338
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|10070799003|376014|366016; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9Ij7jb9hP6KJCT/p3Y3sslO39PkjS682v276wP7dsmzK+5Gy6z8DZYXeOFlm?=
 =?us-ascii?Q?WbR0XS5Ni3q/91wTJs/5o1+hPsVm80cqybP3R1rjQM7sTwqmLgUOEqrgPDaU?=
 =?us-ascii?Q?m6vGDSpzZBLY+jsH69CZ9z4VwCZkeM3CSEWgM2GNEOmvkA7Pbv5IvbiWs5XW?=
 =?us-ascii?Q?WDrVLwCxrMvFfStkOtu3elqrSRv3xYkN2NLGOhmp3twaUofYcTXGKAJJK1iy?=
 =?us-ascii?Q?aqC6H8eQ6BnxEAGFKngi4X3zuQqdqM4RhxC6HAYVByN/x9dF/8DO48r3Ysle?=
 =?us-ascii?Q?gCBqYTZZaYn44zjVhOVuCRJN/5JhiYK6IzgdAWArIrXQ760fQ+OxtnWd+6yj?=
 =?us-ascii?Q?q3eMOS1gT4yYNIUBE/zt0K5WmHa0LvW5kHCi6KpeZyvVR+FC7jpzW3Bc1+Q6?=
 =?us-ascii?Q?rF+ms2dkwqUhgDT7pZT/Iu5sIWn0Dd0fYw063fBgFViJrSyGercnK1fB1wwU?=
 =?us-ascii?Q?YB379ldC9zl7nqPpT9Ad0FSCrb3/JXRvBdIH1TvhPLFnRfvO8arWzP2zw3VR?=
 =?us-ascii?Q?FxyzUkk5SK24AT/b4h0K2UGXQQmgeWdXp8oLAkSOimJ0+c5eCR+nEiXW8RLH?=
 =?us-ascii?Q?e0QLBACrQnex5SNWy/Fzs9nnTzaoNE6uYAPBRtWmEosCyyyBrxgcqATQ3+uY?=
 =?us-ascii?Q?Q36NKtM6O+rnXwN71Be2z+9PKgzGjdpC2V5B8IdNL5dOPCTafBGDdLzWwuWe?=
 =?us-ascii?Q?/VqYSjn4aRofItoJFLM1Di5LxYPVuNBGrBUHTm6necswZT/mWyM6LE+FU9lf?=
 =?us-ascii?Q?oNYXYHeZ6gfPYAuEfkBXNiXOnbo49E04HoVEE6Q6yDt+qfJmtlY0Fvcdz9Zt?=
 =?us-ascii?Q?F7HikxG4NtXYBuqo530SCCJKE5Kv1bM8XDNI6r5nLSY9Bs++6XoA9s+qtXvH?=
 =?us-ascii?Q?6CFSmEz9VAWoHkT0Zrq6nD1R6Mq+acF3ae9eTv8sk2JTQJG9Fhup/3uJFbo4?=
 =?us-ascii?Q?11BeZPro1mydBjyXxCsf87FKs59fgW+mW9xPIyBFBf7XLMddAEnHhkNVjDao?=
 =?us-ascii?Q?YmU+B/GzcAg+FpvwZ0Ji8CW8KuD7aRt2UADN5d58eiMdjRYzhCzkdn3OiHgn?=
 =?us-ascii?Q?oByuOYvxL7yHWRPhG6SAx5JABhSZVu7lVp3X2JkeQK3RTVsJaz9tzaGth1Rl?=
 =?us-ascii?Q?/5Csm9gUHSRm7C2d7NV7JPDAzp+UUKEZ3wZDXkDcka3GdMDMRM6wpWjVcRce?=
 =?us-ascii?Q?FqbXLFCM7/H7uCbHWVEA1bALOUzkDcz51C8D/QGzythpHwAKuYJ/7kPewofo?=
 =?us-ascii?Q?iTdVOctzPORsS16IfTQyvYgUJWIyuHT/a6xL/ML9mWtS2OfXO4etRuIVB+En?=
 =?us-ascii?Q?f+y8x12OdF2rIJ1WTS/XjHkvSDQBrY4CzATJTzpEfxppO1PL2SHx7KujuqD/?=
 =?us-ascii?Q?LzYPwzipHCKhHvMS333eGnPHtLzzGUv5AO13kuK3hXv15ZqfnhEGO1d0ogEN?=
 =?us-ascii?Q?IIWw3e8Q5AQ/5teXfZdBhDZtTaJTovw9S0KlXr3gHpCuPZ/GiyLm4M997Ls7?=
 =?us-ascii?Q?P7NV0gCwkFRFjHMIaHpJAtAio6DYazo8ujwHTi2t658YAHtjrpJNGtTktOdr?=
 =?us-ascii?Q?Q3wqONmCXxg6dPM69Jo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(10070799003)(376014)(366016); DIR:OUT;
 SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?p7k+e1NHMI9tkdSxF8NJ1NSiOWbnDoFhLSsv1cvj6fmLdSTs3voM43KHqGAm?=
 =?us-ascii?Q?C7zsquK/Z/8rP4pByE8qqymF8awCO3iUIOtYSE+a2lrfENWXhXip/Zk/MsMp?=
 =?us-ascii?Q?1ooWvM7Qgn8j7wx3r8v6Gy3hNcBp6qfaqCgnJvNwnZUrYxnZScdfpkn2IfIh?=
 =?us-ascii?Q?1HVzt5PkwCzNRfI94fuHL32ikeumUtLOKxC7al0ZGalAY8URAaVJbiZFWVVb?=
 =?us-ascii?Q?LCOJlnpEcoBdRkBhrenDcQdWCQCE72sjmIZZHTHxMrVDVocuTLjQiTmESf4E?=
 =?us-ascii?Q?OQ7NGwPtoaDTI223NHO3+1fvd8xv05zq99jcPcWbly36dtFd+MhHDJ5N2+r4?=
 =?us-ascii?Q?p6QOSOE0ZBY6kVRAbgRfYkJT51T9np7Kup28NTVpkA3QOqHcdGbOraSZralm?=
 =?us-ascii?Q?d+stBYrlKzJwEk68z6Hq0cgoZO6/E2WyT7OiT96BzlR8ve7Gz0OceFP2xdvz?=
 =?us-ascii?Q?6rMhhwQfZL54pJqIEhdTWLKQTbuv3wa65F7TRUCqLpDrFxLxNufCPH9J0hUz?=
 =?us-ascii?Q?5/VbhbH9IwduTNUjWLNoCZYPEoEQ759SLm0Uzq2096LT7pm3a2RZUSRo1QPP?=
 =?us-ascii?Q?56mgddfy2H0Vj0loaMdJjUrlaEzlSPQlxXCMFP847catmXzAOO99eBpImrSQ?=
 =?us-ascii?Q?m7sDoUtCsar7k/viKaihU58OI7HdHCZ9PfUBTKlEJ0802sAXO51WoC8g9DAj?=
 =?us-ascii?Q?lZI0DeAnZ8zco/z7GcK81S91u/npmtUHZe229ftsSq5pCtF2y71w0snbuyob?=
 =?us-ascii?Q?FeIcmgU0SSUO6xZkjHMcLbif+xK97JGwyMZ1vCo4QPm/9cGJHoBQqarsM70k?=
 =?us-ascii?Q?injTzwQhCns3ZRSRbSeHckVzGek9y0ftrDTUu2etd4+pwy8lG2CvfPAyOrr/?=
 =?us-ascii?Q?Fh8coC/TXAOJ1W0BkcROCO6pnaLKYEfSmDw5lB2esvzQv7UepK7S24wc5J4p?=
 =?us-ascii?Q?1m0Kog8CvsZa8E3+ZSeqdrI9Y+Rtw1IRgHXP/eyq0wTo7S/OdJkqsZTdBhEN?=
 =?us-ascii?Q?Q5XOi88yhYW4uRJ9lbZa3V1xXZBwqrhNGgh4IXm84wiFAgt1OZKVLzCQY3hJ?=
 =?us-ascii?Q?jTv4Ozrr5tzW2kSowvAry5DJOv8bVBXzHQv2XfAy2Ad2NkKRYnNM/d943R+B?=
 =?us-ascii?Q?NSH2G8tX3ieSVUVg2iLt92xen+LIGr+UoHzGN9vnpF2Uu61TNoVHwQyrf2eK?=
 =?us-ascii?Q?UxvNboosh2dL2kT+7xB2+Yy4k48+glMPVDObPeQenM76IPeGmy+ty+33FxW1?=
 =?us-ascii?Q?1mPwyX/VFLTTtHBU9cEogG7gTunTxl7UUn93xb+C8DA3x8jF6Au8n5Fy289q?=
 =?us-ascii?Q?gojwyLc1lwgGWRqvBpCgqiOWc66U/m7D1VvMwIhYe/TyrsV943mEZ+p9ITq5?=
 =?us-ascii?Q?ARcNO1s0MXsioaB2Zk5eyCBmIXPMf4uUYFu4C2TlrJYdzH6pzZlipcDNHuec?=
 =?us-ascii?Q?vEm0BU1rHKLg/vjKzDr2Nhjp3JPXX2agYBt+7IGw3V1cty0kwSTI06fzgahM?=
 =?us-ascii?Q?yOmEffEE1T7k9q5qvlQS9pknLn8b14RVcDpZ39IWtc+cf69nYdjEJOePi2Rj?=
 =?us-ascii?Q?xYZdUeKR5y0B88lestAZNZ2JqXDq+F88215R3nbWzyc3AUsAwIPq6dtVaUnD?=
 =?us-ascii?Q?kW4Y36VnR6bGd+PZ1c1OLdFJo4q43KOHAxPWqC6WkBjkAo0H8LidqJi+/MNr?=
 =?us-ascii?Q?CQghwuOcH0/yeog8xyr00F53p/cIEvZrqjvMbbjjg8rB3VBGqBpuEPsNflgw?=
 =?us-ascii?Q?3Y6viTuTUj1DR/+gvY//ubeDVEgt7gzFDND2Zin7HMo9oFD788oz?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 34817503-ba2a-42a4-7747-08de59932338
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 08:49:21.9827 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qg7U82yx8Pwqn64imMogtQ1OiEbB49d932mPHmGxS5TiGArDGUnvcwHhjg7qjikkBHptsOYPWG4nZhBjm6T6Jw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7P286MB5719
Cc: imx@lists.linux.dev, vigneshr@ti.com, geert+renesas@glider.be,
 linux-pci@vger.kernel.org, shawn.lin@rock-chips.com, Frank.Li@nxp.com,
 christian.bruel@foss.st.com, thierry.reding@gmail.com, festevam@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, heiko@sntech.de, kishon@kernel.org,
 srikanth.thokala@intel.com, jesper.nilsson@axis.com,
 hayashi.kunihiko@socionext.com, jirislaby@kernel.org, magnus.damm@gmail.com,
 linux-arm-kernel@axis.com, jonathanh@nvidia.com,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 18255117159@163.com, s-vadapalli@ti.com, marek.vasut+renesas@gmail.com,
 hongxing.zhu@nxp.com, kernel@pengutronix.de, linux-arm-msm@vger.kernel.org,
 s.hauer@pengutronix.de, linux-tegra@vger.kernel.org,
 linux-omap@vger.kernel.org, rongqianfeng@vivo.com, mingkai.hu@nxp.com,
 roy.zang@nxp.com, minghuan.Lian@nxp.com, linux.amoon@gmail.com,
 linuxppc-dev@lists.ozlabs.org, yoshihiro.shimoda.uh@renesas.com,
 linux-kernel@vger.kernel.org, vidyas@nvidia.com,
 linux-renesas-soc@vger.kernel.org, mhiramat@kernel.org,
 mcoquelin.stm32@gmail.com, shawnguo@kernel.org,
 nicolas.frattaroli@collabora.com, l.stach@pengutronix.de
Subject: [Linux-stm32] [PATCH v9 5/5] Documentation: PCI: endpoint: Clarify
	pci_epc_set_bar() usage
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [5.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	R_DKIM_REJECT(1.00)[valinux.co.jp:s=selector1];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[valinux.co.jp : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FORGED_RECIPIENTS(0.00)[m:jingoohan1@gmail.com,m:mani@kernel.org,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:robh@kernel.org,m:bhelgaas@google.com,m:cassel@kernel.org,m:imx@lists.linux.dev,m:vigneshr@ti.com,m:geert+renesas@glider.be,m:linux-pci@vger.kernel.org,m:shawn.lin@rock-chips.com,m:Frank.Li@nxp.com,m:christian.bruel@foss.st.com,m:thierry.reding@gmail.com,m:festevam@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:heiko@sntech.de,m:kishon@kernel.org,m:srikanth.thokala@intel.com,m:jesper.nilsson@axis.com,m:hayashi.kunihiko@socionext.com,m:jirislaby@kernel.org,m:magnus.damm@gmail.com,m:linux-arm-kernel@axis.com,m:jonathanh@nvidia.com,m:linux-rockchip@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:18255117159@163.com,m:s-vadapalli@ti.com,m:marek.vasut+renesas@gmail.com,m:hongxing.zhu@nxp.com,m:kernel@pengutronix.de,m:linux-arm-msm@vger.kernel.org,m:s.hauer@pengutronix.de,m:linux-tegra@vger.kernel.org,m:linux-omap@vger.kernel.org,m:rongqianfeng@vivo.com,
 m:mingkai.hu@nxp.com,m:roy.zang@nxp.com,m:minghuan.Lian@nxp.com,m:linux.amoon@gmail.com,m:linuxppc-dev@lists.ozlabs.org,m:yoshihiro.shimoda.uh@renesas.com,m:linux-kernel@vger.kernel.org,m:vidyas@nvidia.com,m:linux-renesas-soc@vger.kernel.org,m:mhiramat@kernel.org,m:mcoquelin.stm32@gmail.com,m:shawnguo@kernel.org,m:nicolas.frattaroli@collabora.com,m:l.stach@pengutronix.de,m:geert@glider.be,m:thierryreding@gmail.com,m:magnusdamm@gmail.com,m:marekvasut@gmail.com,m:linuxamoon@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[den@valinux.co.jp,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[lists.linux.dev,ti.com,glider.be,vger.kernel.org,rock-chips.com,nxp.com,foss.st.com,gmail.com,st-md-mailman.stormreply.com,sntech.de,kernel.org,intel.com,axis.com,socionext.com,nvidia.com,lists.infradead.org,163.com,pengutronix.de,vivo.com,lists.ozlabs.org,renesas.com,collabora.com];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,google.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[valinux.co.jp:-];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[den@valinux.co.jp,linux-stm32-bounces@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_GT_50(0.00)[52];
	TAGGED_RCPT(0.00)[linux-stm32,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:url,stormreply.com:email,valinux.co.jp:mid,valinux.co.jp:email]
X-Rspamd-Queue-Id: 8872F636C1
X-Rspamd-Action: no action

The current documentation implies that pci_epc_set_bar() is only used
before the host enumerates the endpoint.

In practice, some Endpoint Controllers support calling pci_epc_set_bar()
multiple times for the same BAR (without clearing it) in order to update
inbound address translations after the host has programmed the BAR base
address, which some Endpoint Functions such as vNTB already rely on.
Add document text for that.

Also document the expected call flow for BAR subrange mapping
(pci_epf_bar.num_submap / pci_epf_bar.submap), which may require a
second pci_epc_set_bar() call after the host has programmed the BAR base
address.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
 Documentation/PCI/endpoint/pci-endpoint.rst | 24 +++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/Documentation/PCI/endpoint/pci-endpoint.rst b/Documentation/PCI/endpoint/pci-endpoint.rst
index 0741c8cbd74e..4697377adeae 100644
--- a/Documentation/PCI/endpoint/pci-endpoint.rst
+++ b/Documentation/PCI/endpoint/pci-endpoint.rst
@@ -95,6 +95,30 @@ by the PCI endpoint function driver.
    Register space of the function driver is usually configured
    using this API.
 
+   Some endpoint controllers also support calling pci_epc_set_bar() again
+   for the same BAR (without calling pci_epc_clear_bar()) to update inbound
+   address translations after the host has programmed the BAR base address.
+   Endpoint function drivers can check this capability via the
+   dynamic_inbound_mapping EPC feature bit.
+
+   When pci_epf_bar.num_submap is non-zero, the endpoint function driver is
+   requesting BAR subrange mapping using pci_epf_bar.submap. This requires
+   the EPC to advertise support via the subrange_mapping EPC feature bit.
+
+   When an EPF driver wants to make use of the inbound subrange mapping
+   feature, it requires that the BAR base address has been programmed by
+   the host during enumeration. Thus, it needs to call pci_epc_set_bar()
+   twice for the same BAR (requires dynamic_inbound_mapping): first with
+   num_submap set to zero and configuring the BAR size, then after the PCIe
+   link is up and the host enumerates the endpoint and programs the BAR
+   base address, again with num_submap set to non-zero value.
+
+   Note that when making use of the inbound subrange mapping feature, the
+   EPF driver must not call pci_epc_clear_bar() between the two
+   pci_epc_set_bar() calls, because clearing the BAR can clear/disable the
+   BAR register or BAR decode on the endpoint while the host still expects
+   the assigned BAR address to remain valid.
+
 * pci_epc_clear_bar()
 
    The PCI endpoint function driver should use pci_epc_clear_bar() to reset
-- 
2.51.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
