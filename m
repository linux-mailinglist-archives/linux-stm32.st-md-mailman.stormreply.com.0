Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eL2qC/DLcmlgpgAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 23 Jan 2026 02:16:32 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A138F6EF4F
	for <lists+linux-stm32@lfdr.de>; Fri, 23 Jan 2026 02:16:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 28D29C87EDE;
	Fri, 23 Jan 2026 01:16:31 +0000 (UTC)
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazon11020080.outbound.protection.outlook.com [52.101.228.80])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D57E0C5663A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Jan 2026 01:16:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q9EeqErb7QNdxusE82s9RLkD6uf459cTuVlOYC6FegvDv/KEZrzs99u3ahDkZepdTQDH6RBMtNUX5PwyjSzyrxyHNX3fCS1mYjYF2kwdy8rQ+vQX9j5QIRMngg+qsteFjBA5ktmVkyQR8cA7RU0/ru9r+UhI0GeNMryhdAE1J954UbQyxwWSfm0Skg8OhWhTnHPzez2vHrw++o6tWfK+Un5aQCmF6d9fKFfB8OD+h+2ROFaBDDB1c/ZwzDzvxG+PnP31BdDj4JVMtjcT7nKXfxfXS2Wz144Xg6/1dHAr5cuw/xzOKb3jiG3Mf96DaPzop0BZCKzTx3RQLk7x1BjPYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t5mSSD+fAplRMfb3joiSiyJChCQwTs0sTG3eink0tGI=;
 b=MsnBQQO8WY5mWO23H4+hVbQOQ7Rgvl9UlxDont4DlZbCwQbm23XJKNxwSptUaO3RDHWT4ENw3S9VpDUkMRz92efSKzjcU8TE++VHw1HsEANU0jHncL3bw38hxiZQbW4m9MSiZ78VUebI6vQNku9oJ/R7qg/34bPxibM0voshVbkTsc1ckG1CsugdR+RWPU65QTklR0+52GA/NqOT3dFmjt6BbY3sl7hagsL2gHaf16ty0xLyqIvMF2EAH4mZYupBd2AP4hoDe3odYWZGlrVM/cauUYwRL6iPatiTke3bVAPqwimRU8/3qsNqOmeqGezE426AI9JX+L7g94Hbh2OOrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t5mSSD+fAplRMfb3joiSiyJChCQwTs0sTG3eink0tGI=;
 b=gmrxX+KeGbU/qdPfG1ETzb/JM/2x1wEqtAgs7TZCBgnaeGw9oG3oH/nzwIgpoUimZw1Fa2/v9frjQ9md1kWaZnIyEnQgldBiwn6x5x86sUNXI68qrHo8RMXD3GYwE2HM2m0/E+fFcV7YyJ+u26J2INWbW4K5FnAWxysSQfUvZKo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by OS3P286MB2456.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:17f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 01:16:24 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%5]) with mapi id 15.20.9542.010; Fri, 23 Jan 2026
 01:16:23 +0000
Date: Fri, 23 Jan 2026 10:16:21 +0900
From: Koichiro Den <den@valinux.co.jp>
To: Niklas Cassel <cassel@kernel.org>
Message-ID: <l7wknbayighcczjkqfwhbaqrepjtbgxxstgkntoqvnrs7dnm6g@wvmy67ky37pv>
References: <20260122084909.2390865-1-den@valinux.co.jp>
 <20260122084909.2390865-5-den@valinux.co.jp>
 <aXHsd7-WWAGyhy_w@ryzen>
 <s6bnqkbuugi7oio7ybekdbk3dokpbe2bui2wjltdwajxix2app@wosgmhrfsriv>
 <19D609EC-F850-4B43-A83C-0B8C70E641B5@kernel.org>
Content-Disposition: inline
In-Reply-To: <19D609EC-F850-4B43-A83C-0B8C70E641B5@kernel.org>
X-ClientProxiedBy: TYCPR01CA0167.jpnprd01.prod.outlook.com
 (2603:1096:400:2b2::7) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|OS3P286MB2456:EE_
X-MS-Office365-Filtering-Correlation-Id: 92cab8b6-18a9-4804-6151-08de5a1d05c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|366016|7416014|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?IP2bAzVB8Tt/gg4tiiMoSVN2yW5x/yWeAMVBXsHzHaMrLBn0U7AcPnbXZPV2?=
 =?us-ascii?Q?bZsIKvK+kqf9Nv8cKzFDI4M1UB8klPJBatlaGWvlEi6Y1PkB+u449ct93XOl?=
 =?us-ascii?Q?L+X7N31hX31rklG9D1FhJg0J3viLbap62A3p52VwqeMixHGA7I1mG8Q0XcGU?=
 =?us-ascii?Q?6ADgMgYVpEn6EWuVSNXiksw8klyyC5eq1miKV3H5Vx/ifEXnufak5O3H9WXy?=
 =?us-ascii?Q?0/ihYm5a5peEFIhan3yJg+xlwKWfDpnUr33fv3JGFbctbJ64RPNuUQiAUbrz?=
 =?us-ascii?Q?Ugv78Ie6C9qnwh9rwN/NW2gyiamfRA8PFM7Tu3Tiywkb/Hz1y9FwrvoMsRou?=
 =?us-ascii?Q?j9ImiMQaa5pmVCMVHbMT+t8DV9MDb9XZUZozOFLXnP7wriY8vczZNvXAdmS6?=
 =?us-ascii?Q?RJY7jnlUQ7+A4I+haeYPOpDn253qnDG3AHMkqB5y62GV6RXMtvd4krlA7S8Z?=
 =?us-ascii?Q?UA5Sadw85SsWiq9KsLxk4m8p4Sccxc8T/WEuffw/MLAuEO8fSxFcIsv2D1Ch?=
 =?us-ascii?Q?WauIqiKMiNA9PMtP52y91u8mUw6TywT7uYybKp7MrUxdnpm7X7a7jeZKxGVK?=
 =?us-ascii?Q?AzQyBSqmJmhPU0obxzVIljZmrlxGZzImKqqqY6Hrx2vfut6WF/KTVr+QhG4m?=
 =?us-ascii?Q?8hA11WWXr0QTTymFWOEXY7s1PrnxkrztF1z8lu7Gn/UzuOgyrjqv2lN8iQ7r?=
 =?us-ascii?Q?Fb5EXK5EDAhnKWz+r/WqmASWiSoSHdhYlzb+tjb/B/qfb8Rj1HDIANdbeWza?=
 =?us-ascii?Q?wJnL51mE6ZgcBQYGth28nGyYKgncaRRatP0iJrSKoYoj0HwOrSBpihT/SGtu?=
 =?us-ascii?Q?BFJYp/2grxKiZyRjIusUU65aq/ZPcH7ykYAIEirxJhwTCvGbP6QKR69Oo9UG?=
 =?us-ascii?Q?YaEXDIyIIpjjAtdyWBPljJES8olwK6uYQ4UkRAtzcV/QRR0wH1lpoB/v7LSQ?=
 =?us-ascii?Q?YH7bPX/rIfeknX9wrk2ggneftQCWcwr/K6t/CKn7UGIlWSo7+49OBsrUNfzS?=
 =?us-ascii?Q?Hk6qhyDWx77DQ3WN8Bwpitok5pukHc72Ceody1Q3bq21Us1hmKWC3hJ6iD+7?=
 =?us-ascii?Q?hzkWPf0b/GsEjC1sjoL/tg3Ezh4YiJa3jYFb9+1J6ohkkmPMmcZFQGLGhOnQ?=
 =?us-ascii?Q?Q1ezqMIvi4jUFAVHUXVlgGZXlYXuG4VWPuO4m7ku2o0oC56GPbPgC+iyIc3f?=
 =?us-ascii?Q?Z1a1dv1SvcN5oZSF8DtwaXjQib1aaUxwjoIdezoazJp2T39ULPuaJuY5Fcq3?=
 =?us-ascii?Q?j+ucekr5io9W1S/cAiGVe+FLACtS3R1AUtNanRDOS+5XtFV1rVl0csUGQHYy?=
 =?us-ascii?Q?Zl4+lTSId3jV6WG4qiblt0RhO4AhAaAUz9WzoWbgKzgswi7LLPfULxCg0uvd?=
 =?us-ascii?Q?BTgjNMGaaCgymy5aUuwqBIZm1O+c6F46DTBbHdbAsA0f9b+3M9PwhbXffSI/?=
 =?us-ascii?Q?F7ubapy44wmltXDwKeLodK9KFCme6ZdqvF/4hR5cSE5VIOgZFv2YHmebjtU+?=
 =?us-ascii?Q?bOAf16JDokVk8Cpc1WGyb9OzXJYE3RtpNaPC/W6/e2RVxBc0yknwOnrrb+dX?=
 =?us-ascii?Q?UxvLWOb3I20DEYEaCORnpjTxAPphMSmvRLE/S/HU?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(7416014)(376014)(1800799024); DIR:OUT;
 SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uFKdkRN+IAQjOBce+7EjddDNFTsDh9spiX7UPYcIGWhwEPvRXzmHoI3ygf8Y?=
 =?us-ascii?Q?+3UAWL+mWrZ1zc9psJdOsuVXLcH25ZR+Lc2uqiaJXTLdEaUJvpW1PBx9vcHC?=
 =?us-ascii?Q?NMrJj+K31MFbvAE2b4r56MgU7ZbD7TdyrOg4sWTpDCnPASzBFWcKzoEzwnYe?=
 =?us-ascii?Q?tji7TbowIRXoq3xRk5OiWz4iXQCcGY6c4tgJfbpvIgg0zLAEdm4JWZ6SjJr9?=
 =?us-ascii?Q?rywcEkZFcum2gCEz6XBCQ+FWEQJ1i5t/EIcdf6iktnoRWeFmZq6nyLGMsPDc?=
 =?us-ascii?Q?QFdhd396w5Lefdek6BhrpkqESxuLnc5+hq6TpzRPphHUqbuQooJbEMKFjtsq?=
 =?us-ascii?Q?DJEgLbNsSH4JIm8ZDBxmP/ewIWfi/k5zY6ZZuxzcHURPpHTrukzjGGKNV0Sl?=
 =?us-ascii?Q?JBF0ycy5ftcnKEuU8lZjG/vfOY2MT9KHojKULWZ8V3fP4Iti4LMbxYTJQ2tC?=
 =?us-ascii?Q?lQUXFU+c0c3mhtskkIe7w9q9MRVhGnFyzrGilxXFjAPhj0WGho3mg+w07W5q?=
 =?us-ascii?Q?Ut4HqqKXVSealuBO3nd7ZX+UvHWuY4NoVGSZvP5fB0LUG/XmZSXYGH4KwN9A?=
 =?us-ascii?Q?+Q1Y5xb3dtsXkNk2dY8ayQ0P7XfT6DlkXd4XWvlVbwmZuEL4cgiF6XjHOHx6?=
 =?us-ascii?Q?Kmk8OfnH8R6HVYCovcPzEBCDuskCYsdmknmqEM1StT+rwpolq2LZZUD3SZEg?=
 =?us-ascii?Q?k3K7+1nJ3iSr9ntfjJb1lEImOeWaXEX+IluCpuIxAVBG2bnoIujttGP1r/cz?=
 =?us-ascii?Q?uWOnkUdv0tPjGZz/p6Dh+iQL2hMGSQ66z73XjLIydVQm2zPLTnIKLQ/zyIVH?=
 =?us-ascii?Q?+KExForjtFVBqGpsXQqrtxDjnZx0HsSFHZ6No3c4rvckjxGzc99Li0uW5gfu?=
 =?us-ascii?Q?rkNJQGmBiIAjUqzdZl7WdIcB7bhLSj9oAd/2docKjtceacad9nXRN/pyG3oA?=
 =?us-ascii?Q?vKnVgz5I6JHgcmw5m+NBeMFnWwlUf8/tFi6g2hjrHOO5xuta8sSE7PDMzS9K?=
 =?us-ascii?Q?ZU5BLljq8p1LMONS0sdfiZWJAJph/OYV9Wl+QP8jXs2bsyiIY3hE6Y2Cl3ry?=
 =?us-ascii?Q?R0mQRpE7J4jOw6ojbVaIpiSLHEddTGGQIvaP5WD+AYGiFyFLmankLhZlQH9P?=
 =?us-ascii?Q?5fsoUF2Wb2WaBN8TMo8gal8t9Tif1//u4huXCsWaLjAuzctbwPCTqyGVUpfZ?=
 =?us-ascii?Q?Ajq4XiYEimeWEdPl5IjT5l7dfjHRPbw2tIeG2izjdxMZAr3rOpS9roRbMspt?=
 =?us-ascii?Q?Kjazd1oEYqGQ4z7W84a9dQSykVo/MQkrtbBoqeHOT3vZ6UCyElUk9kLAujPO?=
 =?us-ascii?Q?88QwQK6yf8J/92H+XJFKsFEwLKcEudC0lBUNjjg7RhlR6Je3vBVThmCZvZUc?=
 =?us-ascii?Q?OxJAv5DtI7+JBboJHlEWff2t7Hji2OAeBJLkI6tZc2AVjL7SWLkUy3dO599a?=
 =?us-ascii?Q?9w2xCKahTaBjnbtLjQf2gmkx5OwSDzzfK6WNmB2sABaACUqAEAiKNTJjHbqT?=
 =?us-ascii?Q?4fTUcSR7MHgLciNu8MEpxWMvfdrfYu01mKr11Sdw8i7jU7V/eUu8LPwmF45+?=
 =?us-ascii?Q?dP6digMiNsryDu1q8Hgaq71diYpQbZhrNkzLl1W35Vd50rBm10jAY/O+wYvs?=
 =?us-ascii?Q?+1VEkak6wp1TJ1DDH3hK71nlk1/swSZ8qh+/2tEVZBVw/IjDQp6LK3WRVKFv?=
 =?us-ascii?Q?krhR+SpXLanat6z3dw4pdIMeSSXBKSxuL0JPBomZiFocT2DyUhFGF7o41ALp?=
 =?us-ascii?Q?KGw8ViKDKUN4zWJ/48p1fWLR8Oln2gegxkbCrKVNy3N3Bn3KYi0t?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 92cab8b6-18a9-4804-6151-08de5a1d05c2
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 01:16:23.1754 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2brbgcZGu0r+ZtXTOKbkvCTqndJHNRTnzQbfDK52sBE2ewZaHNBW/ok7AxFmQTpWYmLAyok3ppbGhG/EoG4EIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3P286MB2456
Cc: imx@lists.linux.dev, vigneshr@ti.com, geert+renesas@glider.be,
 linux-pci@vger.kernel.org, lpieralisi@kernel.org, Frank.Li@nxp.com,
 minghuan.Lian@nxp.com, thierry.reding@gmail.com, festevam@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, marek.vasut+renesas@gmail.com,
 kishon@kernel.org, robh@kernel.org, jesper.nilsson@axis.com,
 hayashi.kunihiko@socionext.com, jirislaby@kernel.org, magnus.damm@gmail.com,
 linux-arm-kernel@axis.com, jonathanh@nvidia.com,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 18255117159@163.com, s-vadapalli@ti.com, kwilczynski@kernel.org,
 shawn.lin@rock-chips.com, srikanth.thokala@intel.com, hongxing.zhu@nxp.com,
 mcoquelin.stm32@gmail.com, mani@kernel.org, linux-arm-msm@vger.kernel.org,
 s.hauer@pengutronix.de, linuxppc-dev@lists.ozlabs.org, bhelgaas@google.com,
 linux-omap@vger.kernel.org, rongqianfeng@vivo.com, mingkai.hu@nxp.com,
 roy.zang@nxp.com, linux-tegra@vger.kernel.org, christian.bruel@foss.st.com,
 linux.amoon@gmail.com, jingoohan1@gmail.com, yoshihiro.shimoda.uh@renesas.com,
 heiko@sntech.de, linux-kernel@vger.kernel.org, vidyas@nvidia.com,
 linux-renesas-soc@vger.kernel.org, mhiramat@kernel.org, kernel@pengutronix.de,
 shawnguo@kernel.org, nicolas.frattaroli@collabora.com, l.stach@pengutronix.de
Subject: Re: [Linux-stm32] [PATCH v9 4/5] PCI: dwc: ep: Support BAR subrange
 inbound mapping via Address Match Mode iATU
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
X-Spamd-Result: default: False [4.89 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[valinux.co.jp:s=selector1];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	MID_RHS_NOT_FQDN(0.50)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[valinux.co.jp : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:cassel@kernel.org,m:imx@lists.linux.dev,m:vigneshr@ti.com,m:geert+renesas@glider.be,m:linux-pci@vger.kernel.org,m:lpieralisi@kernel.org,m:Frank.Li@nxp.com,m:minghuan.Lian@nxp.com,m:thierry.reding@gmail.com,m:festevam@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:marek.vasut+renesas@gmail.com,m:kishon@kernel.org,m:robh@kernel.org,m:jesper.nilsson@axis.com,m:hayashi.kunihiko@socionext.com,m:jirislaby@kernel.org,m:magnus.damm@gmail.com,m:linux-arm-kernel@axis.com,m:jonathanh@nvidia.com,m:linux-rockchip@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:18255117159@163.com,m:s-vadapalli@ti.com,m:kwilczynski@kernel.org,m:shawn.lin@rock-chips.com,m:srikanth.thokala@intel.com,m:hongxing.zhu@nxp.com,m:mcoquelin.stm32@gmail.com,m:mani@kernel.org,m:linux-arm-msm@vger.kernel.org,m:s.hauer@pengutronix.de,m:linuxppc-dev@lists.ozlabs.org,m:bhelgaas@google.com,m:linux-omap@vger.kernel.org,m:rongqianfeng@vivo.com,m:mingkai.hu@nxp.com,m:roy.zang@nxp.com,m
 :linux-tegra@vger.kernel.org,m:christian.bruel@foss.st.com,m:linux.amoon@gmail.com,m:jingoohan1@gmail.com,m:yoshihiro.shimoda.uh@renesas.com,m:heiko@sntech.de,m:linux-kernel@vger.kernel.org,m:vidyas@nvidia.com,m:linux-renesas-soc@vger.kernel.org,m:mhiramat@kernel.org,m:kernel@pengutronix.de,m:shawnguo@kernel.org,m:nicolas.frattaroli@collabora.com,m:l.stach@pengutronix.de,m:geert@glider.be,m:thierryreding@gmail.com,m:marekvasut@gmail.com,m:magnusdamm@gmail.com,m:mcoquelinstm32@gmail.com,m:linuxamoon@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[den@valinux.co.jp,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[valinux.co.jp:-];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCPT_COUNT_GT_50(0.00)[52];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[den@valinux.co.jp,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[lists.linux.dev,ti.com,glider.be,vger.kernel.org,kernel.org,nxp.com,gmail.com,st-md-mailman.stormreply.com,axis.com,socionext.com,nvidia.com,lists.infradead.org,163.com,rock-chips.com,intel.com,pengutronix.de,lists.ozlabs.org,google.com,vivo.com,foss.st.com,renesas.com,sntech.de,collabora.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,renesas];
	NEURAL_SPAM(0.00)[0.722];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[valinux.co.jp:email]
X-Rspamd-Queue-Id: A138F6EF4F
X-Rspamd-Action: no action

On Thu, Jan 22, 2026 at 05:59:18PM +0100, Niklas Cassel wrote:
> On 22 January 2026 15:29:02 CET, Koichiro Den <den@valinux.co.jp> wrote:
> >
> >> To make sure that dw_pcie_ep_ib_atu_addr() cannot be called without already
> >> having a BAR configured, to we perhaps want something like:
> >
> >Thanks for the review.
> >Isn't the existing guard in dw_pcie_ep_ib_atu_addr sufficient?
> >
> >        [...]
> >        base = dw_pcie_ep_read_bar_assigned(ep, func_no, bar, epf_bar->flags);
> >        if (!base) {
> >                dev_err(dev,
> >                        "BAR%u not assigned, cannot set up sub-range mappings\n",
> >                        bar);
> >                return -EINVAL;
> >        }
> >
> 
> Well, for a driver that does not call dw_pcie_ep_reset_bar() in their .init() to disable all BARs that are enabled in the controller by default, the host side will assign an PCI address even if no EPF has called set_bar() on that BAR.

Thanks for the explanation.

> 
> See e.g.
> https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git/commit/drivers/pci/controller/dwc/pcie-tegra194.c?h=controller/dwc&id=42f9c66a6d0cc45758dab77233c5460e1cf003df
> 
> There might be other EPC drivers that don't disable all BARs in their .init(), so I would say that simply checking if the BAR has an address is not sufficient to guarantee that an EPF driver has called set_bar().
> 

Even if an EPC driver does not reset the BAR in their .init() and some
default translation is left exposed, wouldn't it be safe as long as
dw_pcie_ep_ib_atu_addr() succeeds in programming inbound mappings for the
entire BAR?

That said, such usage apparently contradicts the documented usage (1st
set_bar with no submap, then with submap) described in the docs and commit
messages in this series, and allowing it would make things unnecessarily
complicated. So I agree that adding such a safeguard is the right approach.

> 
> I think the safest option is my second suggestion because then we know that we will only call
> dw_pcie_ep_ib_atu_addr()
> 
> When:
> 
> 1) If ep->epf_bar[bar] is set:
> https://github.com/torvalds/linux/blob/v6.19-rc6/drivers/pci/controller/dwc/pcie-designware-ep.c#L363
> 
> 
> 2) All the other requirements to dynamically update a BAR is also met:
> 
> https://github.com/torvalds/linux/blob/v6.19-rc6/drivers/pci/controller/dwc/pcie-designware-ep.c#L368-L370
> 

That makes sense, and it ensures that the behavior always accords with the
docs and commit messages in this series.

Thanks a lot for the careful review,
Koichiro

> 
> 
> Kind regards,
> Niklas
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
