Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cFXRE8sKuGkWYQEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Mar 2026 14:51:07 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F0D29AC0B
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Mar 2026 14:51:06 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7C8B2C87ED8;
	Mon, 16 Mar 2026 13:51:06 +0000 (UTC)
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazon11021072.outbound.protection.outlook.com [52.101.125.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D00D8C08D19
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Mar 2026 13:51:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HxZYcYZs/XxFbP2wsjEn5Yk8WbJ5c0Cf1HOgBEvHBSq90116oF1W6Ax4yIoEwIVRFW7ETHIPaaqdwO8lMt4uu6AAOPk0Z4wo4yWoXQMkozHap2fVtk08f9CEhtfY2wOfXoLMs09uuj/idr507JCvG4qrWZO6GF/2xYT5GWuRnyV1jf8Z4t7zXhgkrwktJPGti4BG2y8/CxXsg20MVn5B6TWc7L+Ay9nzQ0qYc1SOabFmuMfmwh2lycH31HyLKoWbKve3UXfjZbYp7+EtbmNoziBZFJF3X7mfB6vrP3lO4Q0V6mDpWr+k5BFg7hs0f265zmSE61tAtC+DB4zEYcEGtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xz9qD/SKsAlsa+wqAgGW40WZZRz4YGvxjtS94F4GrWw=;
 b=CdCNST2DwdiEDCWpTfoniNY6Aq6jvkGCQo/Zbtc8gg2A+c9WkvS3vzskrxDxx2jsRDpaMWz7/q7vvNmQ7s23QzWJNSmW7dNyEUTju3lJJidMxJMq/2/pPwzP9UxulPv8OvE15vebvF0mhMJJ63ILZkzPqSRroCRKUe8TfFo335BcnVDa1pdWj5Hg6EsHBau8QvkCWVJyVkdEEbZgMmxMq7ZyO4tiRlP4TqlX1TtgAjFiIL4rijq/scJslbG5NVOFPXVmliEPL7rH0EGVMxNuhS3zcxjX8T1gbEU4uxen8NIWJK7YG3oymC/fdiT6+GS2QAa21L2PdWBhBxP2uwUDXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xz9qD/SKsAlsa+wqAgGW40WZZRz4YGvxjtS94F4GrWw=;
 b=tJh14C+4mC2xoPJy5uNdTfWRwHmoxNpnggm4XxSuz3COVludEGXtwDxmCMcw7Y9jl1uMVSJULBWDne5/teS1+7MF9+1YG2TSgWGF2oRRrZpXM9tXOZw83iwRRc3iaBI3YKG4K/EqNFdiWTprTFW+B5rQQSMYVAzo7aGc9joNgw4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYYP286MB5707.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:299::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Mon, 16 Mar
 2026 13:51:01 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%5]) with mapi id 15.20.9700.018; Mon, 16 Mar 2026
 13:50:59 +0000
Date: Mon, 16 Mar 2026 22:50:58 +0900
From: Koichiro Den <den@valinux.co.jp>
To: Christian Bruel <christian.bruel@foss.st.com>, 
 Niklas Cassel <cassel@kernel.org>, Bjorn Helgaas <helgaas@kernel.org>
Message-ID: <m5wembfzeyyk33wml3r2kug7l27wf7bvxq2ymkxgky6ieoy76o@d7oxiqjoluat>
References: <20260124145012.2794108-1-den@valinux.co.jp>
 <20260124145012.2794108-4-den@valinux.co.jp>
 <b2b03ebe-9482-4a13-b22f-7b44da096eed@foss.st.com>
 <tkfhaovpmaoodo35attvmbnpukcqgmwyrxmfgiwjy2dga65cgl@hmj4mx2n44ki>
 <5e485218-becf-499b-8a07-d25358504807@foss.st.com>
 <abf-LKj8V2MpJFEE@ryzen>
 <ba3ae9a0-11ba-4000-b2ed-08aeede0dc54@foss.st.com>
Content-Disposition: inline
In-Reply-To: <ba3ae9a0-11ba-4000-b2ed-08aeede0dc54@foss.st.com>
X-ClientProxiedBy: TYCPR01CA0177.jpnprd01.prod.outlook.com
 (2603:1096:400:2b2::16) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYYP286MB5707:EE_
X-MS-Office365-Filtering-Correlation-Id: 08c13086-ed56-4d0c-3df9-08de83630ddd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|10070799003|1800799024|376014|7416014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: PuuYAtyXFeaZLri1rNI8o1u3vReYEPbg4MWVoylY+qE6Lar+XRqyO5GfRTWoMFeeFQDF67zZWmg+IxxePJAVXnkR4B1Lskh0hRcbR5gQ2sS802fRSWzyWYasJDJy2RjD8MMqYs0zWBSPUq9RWfxxWNxsBqBlOt6vIS0NUEWDr68tGY2wVVNwjdcxB0PL4Tf2WnvZqQDNCmOkR/ocHOgoPp/aqOm4m1dmHexW/G1Nrs5Ccog9I5YcC+WzInehfzTk/K6BW9FzMyhU8WogMR95LyOOaKXvA9ogJbWJfpL0k9+8ebRhS8BRLoRspkrQAju4Dr6MyFGsyOV+iKAEpkxu0MZmpYcIaQ+6Jw4VU0EFs9TBoipsk61YQVyH8WiC747BMVculqRvSiIYFIuc/CazSmrXgmTT8rPI8gRg0pSoMC7hD9dQTQYX4qc6YbxPCWeqcljlsNNxqLTXtiN8d6iBKksKAi5XVZ/vCeCeN9orXb8yeqQHkLrVHqU/DrAFqu8G9p6biRKTZS3kIwlG+wrOAfDm+MhoVX0bzrx4aTEUQRFi0Krv7WVYDDFK+eGUS6d/hyXk2TrrxDl+RL3no7Njj5y3GZj3h6VSqe9V5W3tehGzF6/L9w+Gf4McTpFQLBlPj8E4siNiThZXPUpZ0CpjFj6broJboTQBthL5DNs+fvxMMTtq2HL5fIbUpjni3XErC3sQTLpET9lMHFP4y6QobWJb4WNXC3LR92iskyY+0/c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(10070799003)(1800799024)(376014)(7416014)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MdTesi1NtNVzfhoTREixlQ/aftNUuz57gYdRA4yO0KerEdkTL0ARLT4+OXVG?=
 =?us-ascii?Q?IA4Nyt0INLal6M4toY49lDoSZQDk9fRgD4kgPbgETd7aGTfjRZ5E8dtrZcN5?=
 =?us-ascii?Q?p4FIwsICw4kVjo/OCf66EOGUJ3LjswyoOYU5p6kkFzk1qxoV2g6s1ZehojSf?=
 =?us-ascii?Q?d+gMgxNX+f3t3IjoiTlKiDjoSsASwnFXU+rqGHE9K+Rm0ZbaONLzUtCoED6z?=
 =?us-ascii?Q?UsYlwXpBBMYGjKU0MYkOMK7FfZ6SbHc0kh/5u/4kZVyYdOCBt7+b0TQxHigf?=
 =?us-ascii?Q?OBKgsWCPgnwlWHOhwHxHKWcdt+ZS3odNJeWDlYXfBJWjyV5frrrTZffCC9Bk?=
 =?us-ascii?Q?WP2rG73ywgKVJZ91YkEfQVYuWtmEwcX9wNKQ7PNhhZjJUG0eL2xXvh9KGo46?=
 =?us-ascii?Q?hASxHOXt8XV5nY7Z6w9yMY2Ilfy2/OtbRv+YHVJsdfWpesHqtzWwSlj3T/oU?=
 =?us-ascii?Q?goT+KKJjGa4U99wC00yBt5Zi5fKz9onCqQdzUrMmZD4fmNDMJcVIoVsWHp0I?=
 =?us-ascii?Q?YL3c9iIWWgSpRi6ElWQ4wwlav2m9RlI032SO3zBdMPtBA+BvUN3ycW3i14QM?=
 =?us-ascii?Q?6oDKgmCY5lMtIHqNr8G62/bqX7YpnHCQke/iIbtBTFE63U0V9a7gjVMLYzH2?=
 =?us-ascii?Q?zAukRFNhW5dmiG1hr7nCd+Rne/RChb+DSf1SLvjp76x/IOKG018UHCC266Qb?=
 =?us-ascii?Q?3KlV1sRldLiDNngbq67IEAZDcryeBL3sQuDPqikpYp1EcKfHKuObWfVyKEjr?=
 =?us-ascii?Q?NuMRAA1+kdS7frPD2NzR/BblSFAAnIl4LFaDaHr02OS+7+0CBAn8wukjetC6?=
 =?us-ascii?Q?uTvhwSbJ3uzO1w9ThyWPJ6pe8oHziCgOvm6O2+mHS2XsvrCtAWB7+GtHu3pU?=
 =?us-ascii?Q?06pDq0ZQ5dqqY4qr5sFnWUr9zKyv2kj5TTb/BSg2E7f1/HrJ37JVqZ9pzyfi?=
 =?us-ascii?Q?obAwdA26+Jqe7rHZ1tR58h0TR35TRTlvhDan3+hQfh9cU2RoQgDwceYQJYIQ?=
 =?us-ascii?Q?xMLZmdEGFdaFaK6yO3k36F/mroB0ZJh8PUsNMCxs611yuEpvUqT8CALrSLKW?=
 =?us-ascii?Q?eOafb2XgtkfwlrRPyasK1OH3aXDTyubKA3iMpZnn2qS1/1OwiPC3PjCJcnv9?=
 =?us-ascii?Q?onqATUyJ+4T5Gq0YOB0gg+p+wUzvZRHbX7YPN7KFLuXzgH+Xjt6dWRvY6zqX?=
 =?us-ascii?Q?hnBrxQexyXzYUv5KOC4eccS8ivCGQE6uQPuTqgoRYUOBiP1zKuRNnDwsNsPj?=
 =?us-ascii?Q?GJYwaIQ4wcqzVdCy2sDmAhTkU22LjnS2enM3oCE7XUqlYaBdn6qlLOLkkgZn?=
 =?us-ascii?Q?7JxRySD5hEI93hrkALGtk3V83N5nhVpaC9pKm5WgEkEbeHC9vgsXddW8i+nB?=
 =?us-ascii?Q?WkQ9M3aNpP9b+O2P9dy//PdngMjZGxr5xh5zGTqPwJk1YIhOUBxKP3jkxLp4?=
 =?us-ascii?Q?4xccTWCTWIehQyEePBLfLNW+abKXJnuReELZHNtp/gMnAgbT5ngLmIwBRy/T?=
 =?us-ascii?Q?57E5+QW+r4cpe/3HIc4+YbvapguWW7GAaOj2e/CylypJ7icxq/eio6zpw9mq?=
 =?us-ascii?Q?nQ2Z/7VOaJiTEY4hmRsrkkO+APonN2TuzsWfHQ6M2NVNHoNRrE7ccJyWL8cx?=
 =?us-ascii?Q?FzJQO87KxAb8dJBLwJ0FmwPX5WIDg0BobM+l46lWN6QStuKZHFvHMlF+D5n0?=
 =?us-ascii?Q?/kJ7xi5nuh3qzQQyfWURU+ixvrXIcTqQxnF9mN715HKWwnJiWokxK6SqExFJ?=
 =?us-ascii?Q?9y1FYxsTR2BTRJIp36pLruAu4Y2JLhDcVIqqjMHiTi8Z5zThwAlK?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 08c13086-ed56-4d0c-3df9-08de83630ddd
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 13:50:59.1812 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wk8aSj/PzRo/b1XzyoE3urFxHjU/VAdFLPGiA3qqrxXciF3R3RXjkDAOrHI8Vd39q+t7V1xjc1RZzKbsWv3hMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYP286MB5707
Cc: imx@lists.linux.dev, vigneshr@ti.com, geert+renesas@glider.be,
 linux-pci@vger.kernel.org, lpieralisi@kernel.org, Frank.Li@nxp.com,
 minghuan.Lian@nxp.com, thierry.reding@gmail.com,
 linux-kselftest@vger.kernel.org, kwilczynski@kernel.org, festevam@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, heiko@sntech.de, kishon@kernel.org,
 robh@kernel.org, jesper.nilsson@axis.com, hayashi.kunihiko@socionext.com,
 jirislaby@kernel.org, magnus.damm@gmail.com, linux-arm-kernel@axis.com,
 jonathanh@nvidia.com, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, 18255117159@163.com, s-vadapalli@ti.com,
 marek.vasut+renesas@gmail.com, shawn.lin@rock-chips.com,
 srikanth.thokala@intel.com, shuah@kernel.org, hongxing.zhu@nxp.com,
 mcoquelin.stm32@gmail.com, mani@kernel.org, linux-arm-msm@vger.kernel.org,
 s.hauer@pengutronix.de, linuxppc-dev@lists.ozlabs.org,
 linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org, rongqianfeng@vivo.com,
 mingkai.hu@nxp.com, roy.zang@nxp.com, linux.amoon@gmail.com,
 jingoohan1@gmail.com, yoshihiro.shimoda.uh@renesas.com,
 linux-kernel@vger.kernel.org, vidyas@nvidia.com,
 linux-renesas-soc@vger.kernel.org, mhiramat@kernel.org, kernel@pengutronix.de,
 shawnguo@kernel.org, nicolas.frattaroli@collabora.com, l.stach@pengutronix.de
Subject: Re: [Linux-stm32] [PATCH v10 3/8] PCI: dwc: Advertise dynamic
 inbound mapping support
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
	FORGED_RECIPIENTS(0.00)[m:christian.bruel@foss.st.com,m:cassel@kernel.org,m:helgaas@kernel.org,m:imx@lists.linux.dev,m:vigneshr@ti.com,m:geert+renesas@glider.be,m:linux-pci@vger.kernel.org,m:lpieralisi@kernel.org,m:Frank.Li@nxp.com,m:minghuan.Lian@nxp.com,m:thierry.reding@gmail.com,m:linux-kselftest@vger.kernel.org,m:kwilczynski@kernel.org,m:festevam@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:heiko@sntech.de,m:kishon@kernel.org,m:robh@kernel.org,m:jesper.nilsson@axis.com,m:hayashi.kunihiko@socionext.com,m:jirislaby@kernel.org,m:magnus.damm@gmail.com,m:linux-arm-kernel@axis.com,m:jonathanh@nvidia.com,m:linux-rockchip@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:18255117159@163.com,m:s-vadapalli@ti.com,m:marek.vasut+renesas@gmail.com,m:shawn.lin@rock-chips.com,m:srikanth.thokala@intel.com,m:shuah@kernel.org,m:hongxing.zhu@nxp.com,m:mcoquelin.stm32@gmail.com,m:mani@kernel.org,m:linux-arm-msm@vger.kernel.org,m:s.hauer@pengutronix.de,m:linuxppc-dev@lists.ozlab
 s.org,m:linux-tegra@vger.kernel.org,m:linux-omap@vger.kernel.org,m:rongqianfeng@vivo.com,m:mingkai.hu@nxp.com,m:roy.zang@nxp.com,m:linux.amoon@gmail.com,m:jingoohan1@gmail.com,m:yoshihiro.shimoda.uh@renesas.com,m:linux-kernel@vger.kernel.org,m:vidyas@nvidia.com,m:linux-renesas-soc@vger.kernel.org,m:mhiramat@kernel.org,m:kernel@pengutronix.de,m:shawnguo@kernel.org,m:nicolas.frattaroli@collabora.com,m:l.stach@pengutronix.de,m:geert@glider.be,m:thierryreding@gmail.com,m:magnusdamm@gmail.com,m:marekvasut@gmail.com,m:mcoquelinstm32@gmail.com,m:linuxamoon@gmail.com,s:lists@lfdr.de];
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
	RCPT_COUNT_GT_50(0.00)[54];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[den@valinux.co.jp,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[lists.linux.dev,ti.com,glider.be,vger.kernel.org,kernel.org,nxp.com,gmail.com,st-md-mailman.stormreply.com,sntech.de,axis.com,socionext.com,nvidia.com,lists.infradead.org,163.com,rock-chips.com,intel.com,pengutronix.de,lists.ozlabs.org,vivo.com,renesas.com,collabora.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,renesas];
	NEURAL_SPAM(0.00)[0.232];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: E6F0D29AC0B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 16, 2026 at 02:29:54PM +0100, Christian Bruel wrote:
> 
> 
> On 3/16/26 13:57, Niklas Cassel wrote:
> > On Mon, Mar 16, 2026 at 01:41:03PM +0100, Christian Bruel wrote:
> > > Hi Koichiro,
> > > 
> > > > 
> > > > If I understood the problem correctly, would something like the patch below
> > > > address it? My expectation is that the subrange mapping test would then fail
> > > > consistently on platforms that do not have enough free IB iATU regions.
> > > > 
> > > 
> > > Thank you for your patch. Yes, now the bar subrange tests fail consistently,
> > > so that is enough to say this is not a regression.
> > > 
> > > However, I think there was a clear BAR missing somewhere before running the
> > > tests in the EPF driver, as the BARs could be reallocated during the other
> > > tests. This is not due to the subrange tests, but the EPF test driver
> > > supposes a 1:1 BAR/ATU mapping. Now this assumption is broken. I'm wondering
> > > if this could be improved to make the subrange tests pass on all platforms
> > 
> > Normally, you want one inbound iATU per enabled BAR, since you want the host
> > to be able to access all the enabled BARs at any time.
> > 
> > If you are thinking that we should somehow temporarily disable inbound
> > address translation for one of the enabled BARs, such that we can do "steal"
> > that iATU to test inbound subrange mapping, then I think that is a bad idea.
> 
> yes, I was thinking something about restricting the iATU entry lifetime
> during the BAR test duration and restoring after. But OK I agree, not good.
> 
> > 
> > I think we should just let the test fail. Possibly we could call some API that
> > tells us that all inbound iATUs are occupied, and then SKIP instead of FAIL
> > the inbound subrange test case.
> > 
> > If you really want to test/use inbound subrange mapping, even if your SoC has
> > a very limited number of inbound iATUs, then I think a better solution is to
> > mark one or multiple of your BARs as disabled:
> > https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git/commit/?h=endpoint&id=33642e9e36dc084e4fc9245a266c9843bc8303b9
> > 
> > Then you should have at least one more inbound iATU available, and should be
> > able to run the inbound subrange test case.
> 
> Yes cherry-picking the BAR_DISABLED support, I can now test the subrange
> with Koichiro's fixup.
> 
>  ./pci_endpoint_test -t BAR_SUBRANGE_TEST
> TAP version 13
> 1..6
> # Starting 6 tests from 6 test cases.
> #  RUN           pci_ep_bar.BAR0.BAR_SUBRANGE_TEST ...
> #      SKIP      BAR is test register space
> #            OK  pci_ep_bar.BAR0.BAR_SUBRANGE_TEST
> ok 1 pci_ep_bar.BAR0.BAR_SUBRANGE_TEST # SKIP BAR is test register space
> #  RUN           pci_ep_bar.BAR1.BAR_SUBRANGE_TEST ...
> #            OK  pci_ep_bar.BAR1.BAR_SUBRANGE_TEST
> ok 2 pci_ep_bar.BAR1.BAR_SUBRANGE_TEST
> #  RUN           pci_ep_bar.BAR2.BAR_SUBRANGE_TEST ...
> #            OK  pci_ep_bar.BAR2.BAR_SUBRANGE_TEST
> ok 3 pci_ep_bar.BAR2.BAR_SUBRANGE_TEST
> #  RUN           pci_ep_bar.BAR3.BAR_SUBRANGE_TEST ...
> #      SKIP      BAR is disabled
> #            OK  pci_ep_bar.BAR3.BAR_SUBRANGE_TEST
> ok 4 pci_ep_bar.BAR3.BAR_SUBRANGE_TEST # SKIP BAR is disabled
> #  RUN           pci_ep_bar.BAR4.BAR_SUBRANGE_TEST ...
> #      SKIP      BAR is disabled
> #            OK  pci_ep_bar.BAR4.BAR_SUBRANGE_TEST
> ok 5 pci_ep_bar.BAR4.BAR_SUBRANGE_TEST # SKIP BAR is disabled
> #  RUN           pci_ep_bar.BAR5.BAR_SUBRANGE_TEST ...
> #      SKIP      BAR is disabled
> #            OK  pci_ep_bar.BAR5.BAR_SUBRANGE_TEST
> ok 6 pci_ep_bar.BAR5.BAR_SUBRANGE_TEST # SKIP BAR is disabled
> # PASSED: 6 / 6 tests passed.
> # 4 skipped test(s) detected. Consider enabling relevant config options to
> improve coverage.
> # Totals: pass:2 fail:0 xfail:0 xpass:0 skip:4 error:0
> 
> Thank you,

Christian, thank you for testing.

Niklas, thank you for the follow-up. I agree with your assessment.

Bjorn, I'll submit the tested-patch shortly. Sorry for the trouble.

Best regards,
Koichiro

> 
> Christian
> > 
> > 
> > Kind regards,
> > Niklas
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
