Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iNgJO5fkcWk+MgAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 22 Jan 2026 09:49:27 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7BB636A7
	for <lists+linux-stm32@lfdr.de>; Thu, 22 Jan 2026 09:49:27 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 02C22C8F26B;
	Thu, 22 Jan 2026 08:49:27 +0000 (UTC)
Received: from OS0P286CU010.outbound.protection.outlook.com
 (mail-japanwestazon11021089.outbound.protection.outlook.com [40.107.74.89])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F1AC4C57B72
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Jan 2026 08:49:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eAnGZtfOvgoB7MRK1VfHNjp0nI8x3h8ckR5XT0DDOWMMXgXt0BO/9C0R8zocdUZZ6RIFKpf/97KApYROw08gcAqypDk2myjGwfvbEHIqXYVeORMlxNRDMTtp6IJzo6WW/XraCwEOdBbP/nIbwqGlNrYmMsGT0pnjICvtzXtP9g5PRr0qEzOA7/wo/Re8Ep8B/qQ73FPwM1b0BlxygR6tjvSDCH3nrWOazgF7SURCMjriCjqvWnYUcaHD/bck6nLPqGxpQ7XMmPbr8s4MaP4v0SrczZrvmx7Vp9j1GaDMx/h4UJhdjdtZsNfwTY7fckpONWaRiT6JmkauAVEHoaCCpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cYXcLh8ClIApsFKw5G6r+xLJBUB6SYAPcwVUrpe5D+8=;
 b=GYKJDowQCFS2MvTCuyIN55yCZBFs1miOceGAdc3KuzB8M3mZddsQjbaxCklFJw+pGduVEY3LLJ0ZvYjGvLD9fGsmXkghXcnZfWoIUmAh9mhsccl4QzcE7Rmj/Emrg9DEafnYm0vT+Q9hxvFFSdXfqjRLIHO9x/xzrwhLPIFs5zCRqoSZeZdEX4cLjRmDuTcoWUZqzco9CKtNO/Fyo9N3gToHyHRPm+rZh5eh94v1VabLWzrxmMB3j/bAvFFyz6Etc3vYMuV2xz5ZdbiD3G9UPH9y7myLjfyJjcy1jOHZRE5DKvUiSimFoe8iyqpgTiPagPYYi/sdKZosHgnvryaqgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cYXcLh8ClIApsFKw5G6r+xLJBUB6SYAPcwVUrpe5D+8=;
 b=a+CUt17JsADl+bf17ZUWBclUGhLMM0S1Ahjx7M/fADHWt9hykBTwyl3zwC7WMY7EnuYqXHUYeLKrZVmUrzGvODH7gbpw/He3F8r97xnMhsqpdvbYFWElA0YBFlHbKjoUAd/Q1aYFOBNYs4YcZDZWA1C9TtMlQere60MFQzAbGfg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TY3P286MB2547.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:22a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Thu, 22 Jan
 2026 08:49:20 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%5]) with mapi id 15.20.9542.009; Thu, 22 Jan 2026
 08:49:20 +0000
From: Koichiro Den <den@valinux.co.jp>
To: jingoohan1@gmail.com, mani@kernel.org, lpieralisi@kernel.org,
 kwilczynski@kernel.org, robh@kernel.org, bhelgaas@google.com,
 cassel@kernel.org
Date: Thu, 22 Jan 2026 17:49:07 +0900
Message-ID: <20260122084909.2390865-4-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260122084909.2390865-1-den@valinux.co.jp>
References: <20260122084909.2390865-1-den@valinux.co.jp>
X-ClientProxiedBy: TY4PR01CA0044.jpnprd01.prod.outlook.com
 (2603:1096:405:372::17) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TY3P286MB2547:EE_
X-MS-Office365-Filtering-Correlation-Id: 810b11aa-3eb7-4177-dc5f-08de59932219
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|10070799003|366016|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vgrb6N7MSuw1KkD6swap0Qeo8d97tuXvpb0vz0LOASpLg2GhsCltB+Plg+gQ?=
 =?us-ascii?Q?cBl5nq2OMeFRinsArTpQEA5+2ijY3ohaVvpsvRt5uxA+X34sa2Q9EV561lyt?=
 =?us-ascii?Q?oDFNl57X5mGFNyH5OX8FjhFTD0hwnwP0II/bmT7NEJanumg40Tmgj8ZWKdw1?=
 =?us-ascii?Q?THzPCl9yShnN3LAn9TtIiH41DDGuNXRlz+nBLt5kU9Z/HNjgbLjU/xhyiDxK?=
 =?us-ascii?Q?886ZfCVyuha99vsZEMpRtvMi0YSBrZTw3pR9Tkvzf5Yz476qfv3iqgTOZ7zr?=
 =?us-ascii?Q?FgKUYHx3mEdZJtSEqIZLrgIXSTPO86IlehlYOJ614ErYQN4v6hZ7nek/ijvX?=
 =?us-ascii?Q?1+xmWtiF68nIX0d3GUgGasfXhn3Bzmh1TMRC/yvdd/T8mfcsz0OnW5hbuMt9?=
 =?us-ascii?Q?SLURDUJAkBZpfR6uxTpZsRmjJeoE3x+1q3jYxRV75PicgwwsaYYsZkJcuW4Z?=
 =?us-ascii?Q?lg9GFUE8VJCTHZzIeOB3BblMn4BviK2anDKVki+l6oSZQf/kzeKCwrd8ksbt?=
 =?us-ascii?Q?mzU+Z2DgpyJV2tYz/p1Py/DSEJjeIDII3EzwvJUoiTv+t68zxVEhrBqjTnj8?=
 =?us-ascii?Q?KfjfQHAVFLozd7L09KQmabPL0kGZ3AwkgcBqSHF1/6gAIBWr/YOpyO67ByQO?=
 =?us-ascii?Q?raK+65G2cAVNo03EA5dyR9ooBIUiISWI+hXcHxVwLsdZKEySecjsNpf7yRyC?=
 =?us-ascii?Q?N8hMusEwYHx0ctN2dgJeONsZfGMrpI/XEP3RhgSVAm2RvY0VQJuy8oCD5iyz?=
 =?us-ascii?Q?VwgQ2tan4tD/C0qO+CTj9rld4XOQLyTDg/ERh4irp7qpe3ONGSWJkKrtyFnH?=
 =?us-ascii?Q?BrcTjQPtTpagCmLZvX3dbkV5KZKPOuIEDdZn7PhUE5jRDB+C3IOzzQObcOCa?=
 =?us-ascii?Q?IkgmmiQkr8E5Ditrhz1k1ZKBVZT2UGzH23L9/qh5pFoQY4AiqDiSsfP//HPf?=
 =?us-ascii?Q?bVppQsSO/lJWTZHufR8baBs2Iu3Sa1bPzfysr/jpYFRUlTVIxxf5BCucOKfs?=
 =?us-ascii?Q?e+cwZKGVrwu8daIBxlJoVpuvAB+ufZBshnqflqz5RpATaYfRyyoj1pKKxFQN?=
 =?us-ascii?Q?NzYIcnA/23UKS3cPpSeHXiSd4+cBR07P/QH8JT0Aoyi0CspEFfKopDDOwesI?=
 =?us-ascii?Q?sBcpuDlNpVOfBUT7rf6RhWk5n1CQtUnA/g2RKrDQvlZxiqQOWC/kH8b8X1pU?=
 =?us-ascii?Q?SufrZSLP2eohaoodUklXMG+/zzvOedCXvbOGsxcBp2iDa4/mx99g5dJvbGpx?=
 =?us-ascii?Q?u32Gt3Nf5su1jPMNxJUFd+3WHvajqVie9gELb0SMPCniSOXW8GZwhieGNgu3?=
 =?us-ascii?Q?cVCaunwmpTxEEquR8wqib+c1K1Xg5buhWz8ZB0P5feCOgTll+ub4UVLLg+pB?=
 =?us-ascii?Q?xHNKAhgBpul+URRzXiFu1adQq+iMTv+Dgd7UhS5ASJmFbCJ7JndgOaHEd8jP?=
 =?us-ascii?Q?iUfND87H5NXj0eRF6HP1zFFCBNjkUNHE36FgWFHN+Sk4VIykt7fkHOhQl3o0?=
 =?us-ascii?Q?l/52y7krtb48tU8wxFnjkZiKG9yQnoGDbNBYVi7fO+kpqQGzwtHPyEgPHpa+?=
 =?us-ascii?Q?kwqQsWYdsq2INmnJ/yA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(10070799003)(366016)(1800799024); DIR:OUT;
 SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2PZIG/8vTdPfmJIdF6Cv3srj9S49uFOnrC/XONhio788h6A3ksYTv/FaaE7a?=
 =?us-ascii?Q?GwANZPl1q/rxfOQzCLu65jSif1PZ4Sgp6/sGSleVzsLbaflxetdJxdBku+oj?=
 =?us-ascii?Q?LCmMMfP3tAE/j9aqECT4scF4T45iK4tC85TUNoDsE5GbLCTm00Zwx6hjGE3g?=
 =?us-ascii?Q?Vi8do6H8MglF4MpKQE/2osJKwayjw3rptiy7LleOELsLXHDGqd3JuDHT4Gjl?=
 =?us-ascii?Q?2yiKO0VAHjpPsCpwdlgw3X1N/f8F1RUW24obfyKi8iFlE37oeRJSdIIa+ZNc?=
 =?us-ascii?Q?5jp7POzDQC9ZhG3NIui0b2vVTN07Ev1hBreL8ZLkpdjdKngKbaN0MOdek+SS?=
 =?us-ascii?Q?cBxwO+EzDaQdBamK940G+BXQmz6NCvZEwO7DIAtawyPP9ZidAr4BvyZ64Tph?=
 =?us-ascii?Q?gmYU7SeDbHrOStck+f6Xh/vnCKh50ktB4a5tnOjhNIeTX1N1Vxa3IP/swPGA?=
 =?us-ascii?Q?IOKeh5ZfYQ8WN1lXj/v7jgdIAA6SKEsYy9PZTGeT+mLLF/sPLqwaL7TJu4a5?=
 =?us-ascii?Q?DIBRFpEWnKfbEhvPWN5GLr8WSKOWk1pp1UuLO2xQFkrB7eKLYfBh9hDuefsF?=
 =?us-ascii?Q?uOQhvuu8FSl64h2gdpyt/KGt0i0PLd+2jnRJBxUZWWlE6yFY7dbCtHe13rBt?=
 =?us-ascii?Q?Iu4jr/pGsmMRQLkc7WE17eSWFSP02AtaTBGUEr5BMsJkxvSdWKuhiBt3pg4i?=
 =?us-ascii?Q?WXULIXozpaghIDU2a/tzwSlruRlhUw3inhyz3SbNcaYkR/X3ai4I/LLtsugV?=
 =?us-ascii?Q?A4y7SXH7FbxYokYg8nY7y2tSVUrp5DqHNrM0eRdDFZY7G6k5o5FQHlMHEv12?=
 =?us-ascii?Q?fb/5VxLvXFI4QCFke/1kjur8gr8vNn9eDGyVkZhuXlfr94OF/rgvNs0NLtl/?=
 =?us-ascii?Q?W5oX2Iaxnt11X/7PzpJnUcrFMBcuUoye0LKJe9g5elLuLNgKkjfNvzbDvMNo?=
 =?us-ascii?Q?e7tmzuAoPoInLQTtgNq0fk6qi3/UZVdZ5I0LvrgwI9bG9TnEd3lyQ/eH3A28?=
 =?us-ascii?Q?xB4f3ctsaTNY5lrHZmv0N+INOsv1apHYJudrsNImJpx2Tv6cbavAa6A0lfiQ?=
 =?us-ascii?Q?f1A7mfb4vdUsmkcJ4WGWr6tgr1i9aMDiQH28kM170hS9gOs7zXmf4X3HwSGh?=
 =?us-ascii?Q?FpAAnx6CluIhvtyLbrnLe3IG9tKjirPD9FB0fZfUyL3ki9rsDUfd7wk1j2+1?=
 =?us-ascii?Q?gxgsMKv7tvgjrtIu7ScnglpH9vXYRvr9tpCMZUV1i4fq9VXkyUL66vEz1HIe?=
 =?us-ascii?Q?uTbH9FSoXdKF3oKxe/Q9EFvUBLuz5VgbYiInXpMlh/g17t3E2Di30+UVzr9/?=
 =?us-ascii?Q?REErY4xB2XgtJHXeRjE5edCRbU4yulYCxzEEt38Z97qO07uBQz+Xb8SgpyNz?=
 =?us-ascii?Q?242obguSdHdRwaB1wNR2hImGnOQJuR14n+zE2yyGVB5XoEQ9ckKnyiCQruBo?=
 =?us-ascii?Q?1QIIdcVLx1XFNkEwPV2fG/vSK51j7S3UW+sr/aBvhMPev+5/tBhSL18MwSl9?=
 =?us-ascii?Q?l+OCdD9TXjmBvO6Nj6ca95YKStBqOo2XeuEOLhV+hwH/y4/zEX1wyCUkZ2f9?=
 =?us-ascii?Q?Agr5nRC7I5HbtZQpy6JOdzCNsSWPeanCN6Aa4TJuRqWJEawkisXPWh3xaFPa?=
 =?us-ascii?Q?gocGCvTY20nKhzSjnrnYLG53MpLHt6AxiD1v18nMP/18Hk0i8FhV9t/Baa8v?=
 =?us-ascii?Q?NGu3WQc/FokP/4tMyYipJzXSai5lnm2oWm0ihLcLF4L3nHcEvkJ9LVp5SpTt?=
 =?us-ascii?Q?lSGIaPrJPxalbTIf/QKJro2H/Dm0UOPWdag48qqU2s9/O9hVzX3D?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 810b11aa-3eb7-4177-dc5f-08de59932219
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 08:49:20.0984 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D2AETTOLXdLOeVIjKanXE/Zj3EJs7rWJfzbrtzSB9HBflpYbG/4qltLUSQwv93rDFGMu1KJ+bPbAxGQWiWPhFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3P286MB2547
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
Subject: [Linux-stm32] [PATCH v9 3/5] PCI: dwc: Advertise dynamic inbound
	mapping support
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[valinux.co.jp:mid,valinux.co.jp:email,stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 8A7BB636A7
X-Rspamd-Action: no action

The DesignWare EP core has supported updating the inbound iATU mapping
for an already configured BAR (i.e. allowing pci_epc_set_bar() to be
called again without a prior pci_epc_clear_bar()) since commit
4284c88fff0e ("PCI: designware-ep: Allow pci_epc_set_bar() update
inbound map address").

Now that this capability is exposed via the dynamic_inbound_mapping EPC
feature bit, set it for DWC-based EP glue drivers using a common
initializer macro to avoid duplicating the same flag in each driver.

Note that pci-layerscape-ep.c is untouched. It currently constructs the
feature struct dynamically in ls_pcie_ep_init(). Once converted to a
static feature definition, it will use DWC_EPC_COMMON_FEATURES as well.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
 drivers/pci/controller/dwc/pci-dra7xx.c           | 1 +
 drivers/pci/controller/dwc/pci-imx6.c             | 3 +++
 drivers/pci/controller/dwc/pci-keystone.c         | 1 +
 drivers/pci/controller/dwc/pcie-artpec6.c         | 1 +
 drivers/pci/controller/dwc/pcie-designware-plat.c | 1 +
 drivers/pci/controller/dwc/pcie-designware.h      | 3 +++
 drivers/pci/controller/dwc/pcie-dw-rockchip.c     | 2 ++
 drivers/pci/controller/dwc/pcie-keembay.c         | 1 +
 drivers/pci/controller/dwc/pcie-qcom-ep.c         | 1 +
 drivers/pci/controller/dwc/pcie-rcar-gen4.c       | 1 +
 drivers/pci/controller/dwc/pcie-stm32-ep.c        | 1 +
 drivers/pci/controller/dwc/pcie-tegra194.c        | 1 +
 drivers/pci/controller/dwc/pcie-uniphier-ep.c     | 2 ++
 13 files changed, 19 insertions(+)

diff --git a/drivers/pci/controller/dwc/pci-dra7xx.c b/drivers/pci/controller/dwc/pci-dra7xx.c
index 01cfd9aeb0b8..d5d26229063f 100644
--- a/drivers/pci/controller/dwc/pci-dra7xx.c
+++ b/drivers/pci/controller/dwc/pci-dra7xx.c
@@ -424,6 +424,7 @@ static int dra7xx_pcie_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
 }
 
 static const struct pci_epc_features dra7xx_pcie_epc_features = {
+	DWC_EPC_COMMON_FEATURES,
 	.linkup_notifier = true,
 	.msi_capable = true,
 };
diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
index dfe814469993..06f45e009d7d 100644
--- a/drivers/pci/controller/dwc/pci-imx6.c
+++ b/drivers/pci/controller/dwc/pci-imx6.c
@@ -1388,6 +1388,7 @@ static int imx_pcie_ep_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
 }
 
 static const struct pci_epc_features imx8m_pcie_epc_features = {
+	DWC_EPC_COMMON_FEATURES,
 	.msi_capable = true,
 	.bar[BAR_1] = { .type = BAR_RESERVED, },
 	.bar[BAR_3] = { .type = BAR_RESERVED, },
@@ -1397,6 +1398,7 @@ static const struct pci_epc_features imx8m_pcie_epc_features = {
 };
 
 static const struct pci_epc_features imx8q_pcie_epc_features = {
+	DWC_EPC_COMMON_FEATURES,
 	.msi_capable = true,
 	.bar[BAR_1] = { .type = BAR_RESERVED, },
 	.bar[BAR_3] = { .type = BAR_RESERVED, },
@@ -1417,6 +1419,7 @@ static const struct pci_epc_features imx8q_pcie_epc_features = {
  * BAR5	| Enable   | 32-bit  | 64 KB   | Programmable Size
  */
 static const struct pci_epc_features imx95_pcie_epc_features = {
+	DWC_EPC_COMMON_FEATURES,
 	.msi_capable = true,
 	.bar[BAR_1] = { .type = BAR_FIXED, .fixed_size = SZ_64K, },
 	.align = SZ_4K,
diff --git a/drivers/pci/controller/dwc/pci-keystone.c b/drivers/pci/controller/dwc/pci-keystone.c
index f86d9111f863..20fa4dadb82a 100644
--- a/drivers/pci/controller/dwc/pci-keystone.c
+++ b/drivers/pci/controller/dwc/pci-keystone.c
@@ -930,6 +930,7 @@ static int ks_pcie_am654_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
 }
 
 static const struct pci_epc_features ks_pcie_am654_epc_features = {
+	DWC_EPC_COMMON_FEATURES,
 	.msi_capable = true,
 	.msix_capable = true,
 	.bar[BAR_0] = { .type = BAR_RESERVED, },
diff --git a/drivers/pci/controller/dwc/pcie-artpec6.c b/drivers/pci/controller/dwc/pcie-artpec6.c
index f4a136ee2daf..e994b75986c3 100644
--- a/drivers/pci/controller/dwc/pcie-artpec6.c
+++ b/drivers/pci/controller/dwc/pcie-artpec6.c
@@ -370,6 +370,7 @@ static int artpec6_pcie_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
 }
 
 static const struct pci_epc_features artpec6_pcie_epc_features = {
+	DWC_EPC_COMMON_FEATURES,
 	.msi_capable = true,
 };
 
diff --git a/drivers/pci/controller/dwc/pcie-designware-plat.c b/drivers/pci/controller/dwc/pcie-designware-plat.c
index 12f41886c65d..8530746ec5cb 100644
--- a/drivers/pci/controller/dwc/pcie-designware-plat.c
+++ b/drivers/pci/controller/dwc/pcie-designware-plat.c
@@ -61,6 +61,7 @@ static int dw_plat_pcie_ep_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
 }
 
 static const struct pci_epc_features dw_plat_pcie_epc_features = {
+	DWC_EPC_COMMON_FEATURES,
 	.msi_capable = true,
 	.msix_capable = true,
 };
diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index 53b65428fadb..be47f34b49ca 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -305,6 +305,9 @@
 /* Default eDMA LLP memory size */
 #define DMA_LLP_MEM_SIZE		PAGE_SIZE
 
+/* Common struct pci_epc_feature bits among DWC EP glue drivers */
+#define DWC_EPC_COMMON_FEATURES		.dynamic_inbound_mapping = true
+
 struct dw_pcie;
 struct dw_pcie_rp;
 struct dw_pcie_ep;
diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
index 77c4e6a4ddea..03ad8c242366 100644
--- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
+++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
@@ -382,6 +382,7 @@ static int rockchip_pcie_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
 }
 
 static const struct pci_epc_features rockchip_pcie_epc_features_rk3568 = {
+	DWC_EPC_COMMON_FEATURES,
 	.linkup_notifier = true,
 	.msi_capable = true,
 	.msix_capable = true,
@@ -402,6 +403,7 @@ static const struct pci_epc_features rockchip_pcie_epc_features_rk3568 = {
  * BARs) would be overwritten, resulting in (all other BARs) no longer working.
  */
 static const struct pci_epc_features rockchip_pcie_epc_features_rk3588 = {
+	DWC_EPC_COMMON_FEATURES,
 	.linkup_notifier = true,
 	.msi_capable = true,
 	.msix_capable = true,
diff --git a/drivers/pci/controller/dwc/pcie-keembay.c b/drivers/pci/controller/dwc/pcie-keembay.c
index 60e74ac782af..2666a9c3d67e 100644
--- a/drivers/pci/controller/dwc/pcie-keembay.c
+++ b/drivers/pci/controller/dwc/pcie-keembay.c
@@ -309,6 +309,7 @@ static int keembay_pcie_ep_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
 }
 
 static const struct pci_epc_features keembay_pcie_epc_features = {
+	DWC_EPC_COMMON_FEATURES,
 	.msi_capable		= true,
 	.msix_capable		= true,
 	.bar[BAR_0]		= { .only_64bit = true, },
diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
index f1bc0ac81a92..5e990c7a5879 100644
--- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
+++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
@@ -820,6 +820,7 @@ static void qcom_pcie_ep_init_debugfs(struct qcom_pcie_ep *pcie_ep)
 }
 
 static const struct pci_epc_features qcom_pcie_epc_features = {
+	DWC_EPC_COMMON_FEATURES,
 	.linkup_notifier = true,
 	.msi_capable = true,
 	.align = SZ_4K,
diff --git a/drivers/pci/controller/dwc/pcie-rcar-gen4.c b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
index 80778917d2dd..a6912e85e4dd 100644
--- a/drivers/pci/controller/dwc/pcie-rcar-gen4.c
+++ b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
@@ -420,6 +420,7 @@ static int rcar_gen4_pcie_ep_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
 }
 
 static const struct pci_epc_features rcar_gen4_pcie_epc_features = {
+	DWC_EPC_COMMON_FEATURES,
 	.msi_capable = true,
 	.bar[BAR_1] = { .type = BAR_RESERVED, },
 	.bar[BAR_3] = { .type = BAR_RESERVED, },
diff --git a/drivers/pci/controller/dwc/pcie-stm32-ep.c b/drivers/pci/controller/dwc/pcie-stm32-ep.c
index 2cecf32d2b0f..c1944b40ce02 100644
--- a/drivers/pci/controller/dwc/pcie-stm32-ep.c
+++ b/drivers/pci/controller/dwc/pcie-stm32-ep.c
@@ -70,6 +70,7 @@ static int stm32_pcie_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
 }
 
 static const struct pci_epc_features stm32_pcie_epc_features = {
+	DWC_EPC_COMMON_FEATURES,
 	.msi_capable = true,
 	.align = SZ_64K,
 };
diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/controller/dwc/pcie-tegra194.c
index 0ddeef70726d..06571d806ab3 100644
--- a/drivers/pci/controller/dwc/pcie-tegra194.c
+++ b/drivers/pci/controller/dwc/pcie-tegra194.c
@@ -1988,6 +1988,7 @@ static int tegra_pcie_ep_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
 }
 
 static const struct pci_epc_features tegra_pcie_epc_features = {
+	DWC_EPC_COMMON_FEATURES,
 	.linkup_notifier = true,
 	.msi_capable = true,
 	.bar[BAR_0] = { .type = BAR_FIXED, .fixed_size = SZ_1M,
diff --git a/drivers/pci/controller/dwc/pcie-uniphier-ep.c b/drivers/pci/controller/dwc/pcie-uniphier-ep.c
index d6e73811216e..d52753060970 100644
--- a/drivers/pci/controller/dwc/pcie-uniphier-ep.c
+++ b/drivers/pci/controller/dwc/pcie-uniphier-ep.c
@@ -420,6 +420,7 @@ static const struct uniphier_pcie_ep_soc_data uniphier_pro5_data = {
 	.init = uniphier_pcie_pro5_init_ep,
 	.wait = NULL,
 	.features = {
+		DWC_EPC_COMMON_FEATURES,
 		.linkup_notifier = false,
 		.msi_capable = true,
 		.msix_capable = false,
@@ -438,6 +439,7 @@ static const struct uniphier_pcie_ep_soc_data uniphier_nx1_data = {
 	.init = uniphier_pcie_nx1_init_ep,
 	.wait = uniphier_pcie_nx1_wait_ep,
 	.features = {
+		DWC_EPC_COMMON_FEATURES,
 		.linkup_notifier = false,
 		.msi_capable = true,
 		.msix_capable = false,
-- 
2.51.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
