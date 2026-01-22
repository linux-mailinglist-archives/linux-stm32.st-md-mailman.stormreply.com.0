Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CDquN5fkcWk+MgAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 22 Jan 2026 09:49:27 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 130D0636A5
	for <lists+linux-stm32@lfdr.de>; Thu, 22 Jan 2026 09:49:27 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BA263C87ED5;
	Thu, 22 Jan 2026 08:49:26 +0000 (UTC)
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazon11020089.outbound.protection.outlook.com [52.101.228.89])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CEB6AC57B72
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Jan 2026 08:49:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ejd12EKBvsjKdGaLy43eJ93eBAe87NQ24pKpSpHlMr+RHkz4RUeGKOrADlf0N15GXqlO6Xe+/w1d8IY3hOLecZQuaVz93MG1HrWTq/ogD5sWmZVHinOetp1wgWI8/jkCLM0n96YGW1yxoG757yVTEi+Et4q0JvhAm8S6DgZb3n4i6UYLRHp/xjPQCw1drs1PXpmS2Wxq+o4u3wQdImub2WeiO8KOQDeiJL7+FHvsWiahlBQGDtPCwcFToreJNqG4yfig8QC/NOze8RV+bqFH640QJBCX1wUHFu/PaYUnoIdSDpbtW/k5eVQy4Pcs7p53tRla5NJrg+MVdw9/0uQtmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oSOa7lwvYj/v8UXgWdEwkRWBMUl1vIwFnICJRAYmAgE=;
 b=j2uT1zJnZic6+FmZjH5eP4HVk6VhlGh59IOCg2QSuVr3Ms47EdH/yMNkSyZ9eBRag3ZwiHYP36pNXJtBjIPyhse3mYODjTKC1vapfcg+aTcr97TzlSZrekZpf7RgDDURab7ZEeqau9mnqOI1LDjHQ6h/J2ftQpvPTfR9VYZUSgeAHyN4x2v4yQICGjsh0MNgR8hmzJJQLT+/U4ENnIAEs1I9Edo5701mCFsFvg/RuwgAISz7j1T363QSu5JvuzJJkrnlrNG141m+bVBpQmcGmuIClkseyOR4O284SFBfHJ7LF4vSSKwCO5+Aa1RBRXB1SwNXCId3wPjL3FLRX8xXMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oSOa7lwvYj/v8UXgWdEwkRWBMUl1vIwFnICJRAYmAgE=;
 b=cJo54ECG9mj7zQCoDLOZzO6kapyy247Jug9fzCMxT5UNE3eOU95awDXmQjMVeUP7EsIYmw3YxS0POkeSXDoPGWGub/cIg2RB9R6tq2HFGrISH1fwEqanVtW8a6TPAUhQzi3LQL9WyUHm0gXETbq5+z4Qcs2ZHMroPLNxvF9C8iA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by OS9P286MB6581.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:419::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Thu, 22 Jan
 2026 08:49:18 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%5]) with mapi id 15.20.9542.009; Thu, 22 Jan 2026
 08:49:18 +0000
From: Koichiro Den <den@valinux.co.jp>
To: jingoohan1@gmail.com, mani@kernel.org, lpieralisi@kernel.org,
 kwilczynski@kernel.org, robh@kernel.org, bhelgaas@google.com,
 cassel@kernel.org
Date: Thu, 22 Jan 2026 17:49:05 +0900
Message-ID: <20260122084909.2390865-2-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260122084909.2390865-1-den@valinux.co.jp>
References: <20260122084909.2390865-1-den@valinux.co.jp>
X-ClientProxiedBy: TYCP286CA0328.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3b7::17) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|OS9P286MB6581:EE_
X-MS-Office365-Filtering-Correlation-Id: eaff7ca9-9541-49b8-503b-08de599320d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|10070799003|366016|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?gciRnSpJ8l7j7izlH5aXezItivk9qWuDYHHqNxaA91YsnyEW7gAzaQAckF/s?=
 =?us-ascii?Q?bqnfRR5WAvtEl6/aB73O3ihD/zMUMayd21ltI95cidqajDFDyjKVqwK2MkE1?=
 =?us-ascii?Q?AvOMGznZTwWYiyOSIBTKGYZBprTrzST3DnW3FtAICTan12BE51UPAN+gybA9?=
 =?us-ascii?Q?Kk463X7EB7CZVBHAKHFNaPaYSlmpbbdpgief6INED+AbkUkt749ix3jha9te?=
 =?us-ascii?Q?Dgb3Mahb/56dRTr6a4PzWbChlpYGQ8mJYUlKgf2R/t+zBL9iOL7Klk519lRv?=
 =?us-ascii?Q?TB9tODx37NqT6A2DHrZsL5aH0iHzf0VJTFXYAXSp63J1HoL/hFEuUtC/8dmG?=
 =?us-ascii?Q?Xzsicl/bZs/K/sx8EezlM8tKQNo02UyY6TIE2iD2P037KarbwQk1EyIoMNeV?=
 =?us-ascii?Q?wX/7VjJa+0TbHJw2TK2M//jRCSzXmi0pq1x2KJbnAl+etsdB24FXvfrBn7ts?=
 =?us-ascii?Q?s+nKOTlMXoQreEwnU1n7mqmz8BNGCTy4lYfmL8gcLl576ZqH7bIXq/DvklHc?=
 =?us-ascii?Q?Kj64PZ3t0srj37TbmDSHHdmVewibLvcHhVqpEi1b6IE1Tdh4coiE13P0wL6o?=
 =?us-ascii?Q?IuqbaepHALDyP3BpwEYj5Jxap/Wgl/IWuWIVhhO4hNEPV4ahpXptDeYsKmx6?=
 =?us-ascii?Q?1ZMZhSoDB91rSXKI2i7uDyJOJtsnTBk3sCah6ltXi8bM53J54klTG5zrZgR+?=
 =?us-ascii?Q?D4W//oDnfiATZsgxssabiFJhYQ6mX9cLH12/hTd0lR/iKIone67yPjU7EBkS?=
 =?us-ascii?Q?Gj2Y+DZeqNfWkwZZ5ffo+OIgwDz8cyCwoNXrS4nJseV8jAEGZ4bFPxAN1CQU?=
 =?us-ascii?Q?cfuGgkws7+SpztslJmOzwmRUu2vlMWq9hPnvYOPU6xWxN+mNp2HXq2sE4ess?=
 =?us-ascii?Q?yQAY36Qmc3UO694kltYWxe2FrLA/ohnTL7vxOd6dCCXY2qD2E8q820D6+Hag?=
 =?us-ascii?Q?i3/n5nNpb79+AhstpdHQYW+U+QXn7TudUQix9tkw/CEZJr0sdESIf50zjPgQ?=
 =?us-ascii?Q?DsL1rFCzFfpVbJ8QUf0LtGhvG1uZzB6sh3Sbto3ZxRpjVhljeEChJly+fdGf?=
 =?us-ascii?Q?hOM3RhQIyw6+cmiRrB//9IdQfsUUGYeI2p77vxtyqm3p7bvkb3zFgOqJsM0o?=
 =?us-ascii?Q?X3HQe+bntSC8XZBsV5qdRIIZm0AxTJE3aqo3/zRm8hZza3uFDs5yF5eIOuSt?=
 =?us-ascii?Q?wSXRpXBB9czmqYGST6wofJSSZlkG3qzLGK/RU11ErKezKPI46h4bRRPZC+TF?=
 =?us-ascii?Q?O4y4uXyhVn+/2MfSCVsglRWGCs2pxZ3K8pOpjpSJhj3a1ZUfaK0/MOcd0Zxs?=
 =?us-ascii?Q?6Hkl6/1ydDXuPYCKYxeXPOKDbVXHTvmqolc2ahkmU2PcpxdP0/1UmwZQ/br2?=
 =?us-ascii?Q?XYrlINQ21p7K2mS3cuYl9Gk9RiezrlIZmi4mRC5Ql+pRm4THVsO2mcT4tsAN?=
 =?us-ascii?Q?0muT6i1XduRpZu665J4NYSXrMNlqTX7Gwz5d9RtpGqT62UgC5aS7cf0HvjT6?=
 =?us-ascii?Q?dbM1YyqOTxd/p1iwVD8h+rpT38Fx3vkAG8SziB4QssIMOJhj10zRgvTMKkFH?=
 =?us-ascii?Q?m01Iv0jK2LfKnttQHko=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(10070799003)(366016)(1800799024); DIR:OUT;
 SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YlmzZa3c0H9Ekv6m6S4Tj37cCelUdToepAgzmSGqdjY2iv0guBNyCcHHAeXr?=
 =?us-ascii?Q?O6IJwSEHZjLaBFjm9TTedJG/Zz9rODcXPbAWWhyEGV0R1upCwRGCLUFXRAoq?=
 =?us-ascii?Q?44rPwuDYeFI3ZF597s6sBlGFNh2AOQKr3xe6tvqxTfHDkGO3uVdvAiVgqKqU?=
 =?us-ascii?Q?x6w70PMoH0Y55HYXBBrlI3XC9AcNAuuXT7sFKiyFSwiMOMLQrbP753YVwvVp?=
 =?us-ascii?Q?LXUf2XrJ+Ep8g0+F8mIu8fQ8mO937pQVj9X1c+8i0WAsl+sV85sOc4a6mDgB?=
 =?us-ascii?Q?HmzUUWH0P7Kxo/pMV2p+qlM2OdDb9WVtWwXW1iYWkrTDKeysIlxdYsBZxVJ0?=
 =?us-ascii?Q?UOF00Hzf6lJ56+rWYnE/KXKyUTyx/hqThbH+HZS4kbFXYSswhp2O5SZ6qqrB?=
 =?us-ascii?Q?ZC2jJh+qrrGDu++ZLwcaX1XPkRWp2ocNhSEMk33mNXdTbWYXtUVYHfwrWBAE?=
 =?us-ascii?Q?9n1HQXPK8Cq3buei5q9oPShvCdLJxLMxQ9Y+4enxo7BK7r9dgbMbxOhHY6Hp?=
 =?us-ascii?Q?juaGh4f6exRPS6VoQLg8atdhLEPjsoLAnGMbefjQieefOqm6SbQEL3iOphNu?=
 =?us-ascii?Q?wh8GSPo/PAHoIiwSd+SY1FOjzMKPH/Wd9dS7a2Ff3tFVq8HFhthqxo3FjGvZ?=
 =?us-ascii?Q?hSCClCnRecfWEGyCXMCEhugfIS8PYRUPteKFVhgClJxD0Jur2e+yFbvF9mYi?=
 =?us-ascii?Q?Rw1HKPD/2Ki5cqwvuT/y5iJYWDQM7U1+g2g/fL50tcfw0Yl0Qfli0xpN9hh8?=
 =?us-ascii?Q?NN1xvlWNlUA/wAy+2ue5AmzK8ccpLwXLhodcibQX5keuME2IU3MlwoMcyIpj?=
 =?us-ascii?Q?sUJ02lmt3QDu3McgDv0Fl9x+1B3xYOdLyVullc6UBgKI/cpdh2FUDYOxc8OM?=
 =?us-ascii?Q?m0TPRrI90e5ssFixoUnKKhbTBK4VdxxzDdjSvMaS/ipxsky1mSWW88MgBiaJ?=
 =?us-ascii?Q?trl3pBoqPvlwff/kL6TMUgPkpyv7AirtPFufdXggwJ9UDaYPPr3fQ8beNTR3?=
 =?us-ascii?Q?9fQ/GWWW9GhsqgJRnqu6bCZKtTfj8Q9S/bbTp6lylc3YQh8Si0EnEg+QhA8X?=
 =?us-ascii?Q?H/+femF4kXrS24RatAff1C8yUf1PmMOq85Wj1j8DWxYVYe+m+Prq3zXTsbTL?=
 =?us-ascii?Q?lkXk5pnwSsUUq20SwwGdgzYTU8yY4WPFlopKzIKtHPNYt0m5rhi0INlsUv4l?=
 =?us-ascii?Q?yIqHYYTOu/tWbuc/UZIw8fEjagutz86xJWwNpFcFVfcfbZBdoCpLy++PTGtS?=
 =?us-ascii?Q?rJXPYAIU5U9pIJJNCyY6Y0+oxXRgsk3fUkjrZLIW3UJPPu7QhZCgEG5BePhV?=
 =?us-ascii?Q?HHX+zwzSoDB16ma+NXjcQo2wwJVsTpdnALv/nhHRquP6aY0r5OuUWpvDhVAn?=
 =?us-ascii?Q?0ZBm3wr2V6/kfrdjh8d41uye4wxVuYxL6tt7hPZ/lwWeSxnkwN3TsULepi/E?=
 =?us-ascii?Q?rWCoP5B5fIEefdndW8kFsf33DTz98y24rESHWWuc8XXYTf5QVb1tnmtMHGG7?=
 =?us-ascii?Q?hIkwT55OiCtqxQdlG9iMpvdkS/JD1/+5MN7GXF6g9imPwJdfIeYMO7cXg8pn?=
 =?us-ascii?Q?ZzaOiknPueRo5kYbdgqc1tulszFzBHCvtgkhDJ2sth8q0YS8EiC9c/e2PMnL?=
 =?us-ascii?Q?psiHXg8/lMd1N7JevE86VCF+AeMx7mjwj8IsRlCr4Me9x2Sd+zKpccfIlIND?=
 =?us-ascii?Q?Ege5NDK+15Zj8k1sGFe0Hp1nT4p4W81jMZogvsZBVjyeiIxFnYiigD1/JOF2?=
 =?us-ascii?Q?vGPXeGuaSHUWOe/WtVqPAj/smpkFnel34EY52fl8xhlHhBKLJhX+?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: eaff7ca9-9541-49b8-503b-08de599320d8
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 08:49:17.9861 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5Kz7T3QV72p5KpcOaqtijPt+QLOqN/OWiEmZww3N5cyAhON/ZWnw9Ouxyi/8LZaLHfANJFagitQFyin4FihU/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9P286MB6581
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
Subject: [Linux-stm32] [PATCH v9 1/5] PCI: endpoint: Add
	dynamic_inbound_mapping EPC feature
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
X-Rspamd-Queue-Id: 130D0636A5
X-Rspamd-Action: no action

Introduce a new EPC feature bit (dynamic_inbound_mapping) that indicates
whether an Endpoint Controller can update the inbound address
translation for a BAR without requiring the EPF driver to clear/reset
the BAR first.

Endpoint Function drivers (e.g. vNTB) can use this information to decide
whether it really is safe to call pci_epc_set_bar() multiple times to
update inbound mappings for the BAR.

Suggested-by: Niklas Cassel <cassel@kernel.org>
Reviewed-by: Niklas Cassel <cassel@kernel.org>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
 include/linux/pci-epc.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/linux/pci-epc.h b/include/linux/pci-epc.h
index 4286bfdbfdfa..4c8516756c56 100644
--- a/include/linux/pci-epc.h
+++ b/include/linux/pci-epc.h
@@ -223,6 +223,10 @@ struct pci_epc_bar_desc {
 /**
  * struct pci_epc_features - features supported by a EPC device per function
  * @linkup_notifier: indicate if the EPC device can notify EPF driver on link up
+ * @dynamic_inbound_mapping: indicate if the EPC device supports updating
+ *                           inbound mappings for an already configured BAR
+ *                           (i.e. allow calling pci_epc_set_bar() again
+ *                           without first calling pci_epc_clear_bar())
  * @msi_capable: indicate if the endpoint function has MSI capability
  * @msix_capable: indicate if the endpoint function has MSI-X capability
  * @intx_capable: indicate if the endpoint can raise INTx interrupts
@@ -231,6 +235,7 @@ struct pci_epc_bar_desc {
  */
 struct pci_epc_features {
 	unsigned int	linkup_notifier : 1;
+	unsigned int	dynamic_inbound_mapping : 1;
 	unsigned int	msi_capable : 1;
 	unsigned int	msix_capable : 1;
 	unsigned int	intx_capable : 1;
-- 
2.51.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
