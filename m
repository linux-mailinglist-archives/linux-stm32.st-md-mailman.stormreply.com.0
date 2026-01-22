Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iAH3AZjkcWk+MgAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 22 Jan 2026 09:49:28 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F3E636AE
	for <lists+linux-stm32@lfdr.de>; Thu, 22 Jan 2026 09:49:27 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1F220C8F271;
	Thu, 22 Jan 2026 08:49:27 +0000 (UTC)
Received: from OS0P286CU010.outbound.protection.outlook.com
 (mail-japanwestazon11021089.outbound.protection.outlook.com [40.107.74.89])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BC15AC57B72
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Jan 2026 08:49:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R1FMFDzghpCCsd2PairXIGyMYQ+k1I+plDn/fPZsy6iIR12XwiV58fN8Z5QPwv89pniExFc0QiCmdEcIBi2nfz5GD5DKxHHQwTgHrl2fT3ww7f2IYeVZ+U46Rmh0NlhT42epzHI/20L1S8q7xAHVSlblLyOdTC1dlwZHwOk+F8usnS1yYAY46as063+2fI5vSVcvUDEX0JIosOa8aIgXXXD7eCX3Quyg8Y+2FTWcKPOq9/e6vC51o0CVA4LPuK4aFRTWZXn2bXVXHm43SjSj93ukAB4dBimBsAuw1WT/IbIbFHT8DLcd2YwZpTDdqba2SLTthGNlavGWPSh8JK9XDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vQmSd5Kr7DJhTVJ55qxMM6xPlOh5DwFI1WbTsmLYbyA=;
 b=A/jLo1sh0rPi+q5yF74/N7gjfsNOhbsYVEshE0QaHk4f/IpuNA3+4PhpAr69wmDuonLNo2UBCmfh4kC8ZmalXYgi4qouzjs3j+BGMgm6E34/PziTS9zxbjmeRSTYWP98px6OtP60lEuj6BcHZXHTo2rZKWX1JjjJZddngE5LIpD3lX+xooER9A1ltLnASNde/DH2DHY+LfOSMmsJ/6Ur23rKgzRn9tZr8BaNMgd0soU0weCwr7bBypBFvM/S/sf2ZbX+h7UrGMKMldRLDCbzsglvbDfG8Zh2N2OTVhwcg7DKofuSlA2dG80OMHvRCQzssWo7OTWjgEJeRN3iT0IZ/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vQmSd5Kr7DJhTVJ55qxMM6xPlOh5DwFI1WbTsmLYbyA=;
 b=oDvJKOBApZ/kV1ZmsVbLFjzjkJ9G4KYZU/Cb+PEC1IrVffeJIwoVknmOIodNiboYyu+gUfKXb4aFOyZc8R/F+OduHEzP8v+xLK66vErW3e0cGW8gSAvKhIo7jQYB3cnVf7AS/wxYRmzlcmDraIfbFGV3EzlZlTaxvq/2BsC6+bY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TY3P286MB2547.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:22a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Thu, 22 Jan
 2026 08:49:21 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%5]) with mapi id 15.20.9542.009; Thu, 22 Jan 2026
 08:49:21 +0000
From: Koichiro Den <den@valinux.co.jp>
To: jingoohan1@gmail.com, mani@kernel.org, lpieralisi@kernel.org,
 kwilczynski@kernel.org, robh@kernel.org, bhelgaas@google.com,
 cassel@kernel.org
Date: Thu, 22 Jan 2026 17:49:08 +0900
Message-ID: <20260122084909.2390865-5-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260122084909.2390865-1-den@valinux.co.jp>
References: <20260122084909.2390865-1-den@valinux.co.jp>
X-ClientProxiedBy: TY4P301CA0063.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36a::9) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TY3P286MB2547:EE_
X-MS-Office365-Filtering-Correlation-Id: 23cd9c8f-9578-4091-c13e-08de5993229f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|10070799003|366016|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?iWyu2bqH9w+Iw//ULFSDF/N4Y66yFGc5ukym3NnObv/fyWqr/KmXFJiTsl+F?=
 =?us-ascii?Q?mD3VFvVnF8pGW58LhNOFwftamawrh3QDDAfDG9OC+a3jbnLu9Nmnx0Q/6/0l?=
 =?us-ascii?Q?9QV3SSBK7yj0BcLRI+s24zgaBZox/y5vR9huUQT0X0ZEDH47O2Lpwf7vR9rv?=
 =?us-ascii?Q?lR2CU0DKxtYPE6KEFHF0wdjAF5BbW6pWj+URZThrnDO2NKsSvYVmxlEbwqlz?=
 =?us-ascii?Q?dijb5Pc0VEWWQCdBpEXXnyEZskPFd8tI4NO5S62tH5AhhX9tTvaH5EtyS7uW?=
 =?us-ascii?Q?ORUsyaWaz6az08ptoSey9SoK+mVewlxJaGs+yIh3GWas7pKAT8WMFf5u8KCN?=
 =?us-ascii?Q?LNyrWY/esmEjoJBQjKVZSWpQcc/y1RHkqf2d0QkCnGsleHwcvEiKi9JLqKIS?=
 =?us-ascii?Q?H0uFp2HShYULibj0WzwcSjT+Zc8D0IrXLG4jhtxhWkuFuuUd64Idamw3dOQx?=
 =?us-ascii?Q?CyxQ8LwC5Tj9rsF6iwPlZY0MnvhOIcAeaWVzHXTE8BWrrqlgUQiHx9weXKQi?=
 =?us-ascii?Q?Kpe/YWnN09GFC9vBlnWBYxizxoGWvc5oBaV8rnI3c+eykgBLYjJd7d5pKLmD?=
 =?us-ascii?Q?QuR9RPjTYtJknuilaxE/sTGar23BIfWJz6mNcowXXBRIZsgY/Kk7ZyE91FdP?=
 =?us-ascii?Q?TALLA4bUnxhdS//qf01w/1rF2kwJ61EvC3ufMeAb6vVPLnfXxxZ9lIwCLxum?=
 =?us-ascii?Q?N0K47fyJYU1pbYyCUZSuZikQ963WNO6F2bSHVHsfAyAd4zv6GSvY/9QIu22b?=
 =?us-ascii?Q?JTlfo15Dh/lXmP8eS4NuVOH4b1aYSQZNpgZrZ75R1Arna7xw++ry7LbBXp4d?=
 =?us-ascii?Q?sE8Ho9kc2dI00SLHtvbDEyulSaPFnEByLj5wmx0HQy3efSAhpGNM9VwcqDqe?=
 =?us-ascii?Q?/KIRNWMyTFZhNbLay4U/hSwaBOMUEsmf5IskOEPbSJJ4ZhpFIGZdrTaoqhEz?=
 =?us-ascii?Q?ekQi73AeK3IgI+zNg2lmGrJjbGmvFzgVFyGvGVdftu8zxhvcP//aYW7C50J4?=
 =?us-ascii?Q?eTNbcK9yHGBU8Z0RTOfPUrRjv5ix77UsCpr+MY+6S7HFwVmsr67iLtQiEteq?=
 =?us-ascii?Q?fO/7W5EOhipSVFmojwHaBD8E8BMdVL7FodxOohP4lRmvPU15qh1HqFVL3xxT?=
 =?us-ascii?Q?LWwNW8QiMS7uK3J2TXyS036/qiAdKF/47lh3h3CVp32XVsk72Fp0q2Dfqq+J?=
 =?us-ascii?Q?4Z8QGrPgoltsU0M6yb021smQBmBpigtAzJQd3LjMtbOML42+IPjtE7Mw/MXU?=
 =?us-ascii?Q?Ywafxt1eD7kQrMVxj8qJ5Em6ppBAS7bPFTw8bP3L2PuxGM6/MaoJmMdxy1RC?=
 =?us-ascii?Q?1GkeLgT46FDCfpMvUfryuhd8+/JktWfRwjAA2KA8Cmzz6vgc2TAiyouLU0Et?=
 =?us-ascii?Q?OX4ElTU3/vpJ9CPq+PY9culY6HZ7Sis0vKW94+uJg+dS61UOjk4xp2YojdYq?=
 =?us-ascii?Q?YnANfr5MUVskgs6iTFV6PCR0mxlqpo4GfiJLAdEQsP9qXQ/M8+pmdDxMZRMe?=
 =?us-ascii?Q?mf+3hOQEND4V5Rh9P1sAzpoFVKVKITSzIeAGGZS+/odfQf6wnucPJp6Mdo56?=
 =?us-ascii?Q?eFFf0Rh7FfGzfWdQZ1w=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(10070799003)(366016)(1800799024); DIR:OUT;
 SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4XWWNQZeey+U5ediZ+k1K9XzvY71FtKyO9eVB076n9ugr960UOThoylgDQDA?=
 =?us-ascii?Q?sxzQlVY+RoHopvLST4OmSNyOh/T5XN1JlQabRPbPAqUHY/XEvMDsg38aMBpv?=
 =?us-ascii?Q?+ot8bjc6jVvGzE54ONgUQNn0tuWsDKSGj0PPpBfM0XL3OkVW8+m4wIe1+2g3?=
 =?us-ascii?Q?a7FCLZOPKWMkJVR6CZuynQSxVrcHeZX6DRnQ1xL3qAGHGi4XcbwMSRooEnmI?=
 =?us-ascii?Q?eCc+Fn4G/FYtEGF2knwHBTKEd+lHocLV6ogG4iFgkm+Cz14CxKvfCudAKsxq?=
 =?us-ascii?Q?6Xet6Ql1fTP3r52tHNwVU9mJyWb8Sw0JKpgpJ3XOupPAfJWFANl7Pm2uWnlw?=
 =?us-ascii?Q?RCIw0Lxk6vmXhcZ3VXCBQO/KRikK9/FBqX9+4PHmqtQC5a8Rtzvt98U6ygGe?=
 =?us-ascii?Q?1fWo/KL/DoydJhV8fi0OFacET4ZWa+0m6TP8GYNYKCwhOTs5TUBInDK6reVo?=
 =?us-ascii?Q?bFhaucQizuQGaRXmdNx2DKHnlbEkp3AQcEdefxwJd5GCFuL64VSJU5W/0PRM?=
 =?us-ascii?Q?WwWEVMN+OIKUJxd+XywZugpeG9+OQRGaAT2KUT7qzf+nGdHLFwZOaqaeIG7r?=
 =?us-ascii?Q?bmJ9fuiXwdam3JfAvSdsnJZaR4LSiDv8/QUus+j8/a8R6yV5mMObeewiZLrW?=
 =?us-ascii?Q?RTC9jocunjo/seLCZkuxNtKKtE7L4W/QK+6DTzl4im22VAGmqKq1gm6+ellw?=
 =?us-ascii?Q?wnH5PIaIerPA6NPGSGwuVzPUyGdNzAgPa4NCD2fll5gzQjmWcaa/oUZFp6dZ?=
 =?us-ascii?Q?KqV5w7zCTgOc5nPfqdK0ZRcrXxR8GsYiHg0k0HKVyHQ8SUBSNjeJ8VF6+Dw3?=
 =?us-ascii?Q?+QQzK1jhPIFwJayRRg0+yHCXfPzBdLj9TWFxyQyO/ISfrDB6zt/3KlmCHNTb?=
 =?us-ascii?Q?r5QRqlYGNVTXiZjtscPSjnXaO3q67NRvQDYhSxp9+w7pqGskqlMRLHGEjTFF?=
 =?us-ascii?Q?llDNq++VzzuLiyXs81nPoffulQfjOlTbS3U2UWuEDhA+o3DNphwJO1W3Xt5i?=
 =?us-ascii?Q?IRrFH5nPOaQpyi10c+VD/3Nk1RnCpTrMDc5B0ya9YBfSxAGyZf3BO8NCgSIE?=
 =?us-ascii?Q?8teOvtDYGL3u86lB0ksXmpJXFXUMFTJRIACBBrOlXqpy3unNF4fRDcyYOlDz?=
 =?us-ascii?Q?v1HgGxmoK7Kwv6aCr3upBMsffTi+unWWEt85+z/LRzbsHhXOvTdzWJw1gmmr?=
 =?us-ascii?Q?9jnZzMc3T2YrDVFIgwmp0KVXQiItB/dQ6r1MC4Ov2Uw/yEirQfTqE029L3bW?=
 =?us-ascii?Q?dH89lkLqb0fZ9YZb3rxJDAYuuQHfloFhOxmQlOIxhnZcWXoYlJ2A3UQo4TSB?=
 =?us-ascii?Q?1cpjXIeLSSalskShBIqENEW4RUdXpzQY3rF41/IVpWK54vy27xtovfyjmeME?=
 =?us-ascii?Q?Gp01TgpPdPxhuWByQU4rJZp/rzSn1pO47B1EVPpKOxP8OZpeli4nifjUSxG7?=
 =?us-ascii?Q?n1RjEC6DvZEWiQUBE+EyG2pbO/92nsQXrO/IajBMQN/AxdadkWRP41qZbiA4?=
 =?us-ascii?Q?Wonq8reksSt3jHdSjEwPmIcU9ZGItZd/3pCT+jCrvqBeIQm/T4vcMTyR69z0?=
 =?us-ascii?Q?NEbl1kluTG8Skz4ToJbVyh/hqPxjUBiFXTwzT3MPXGyKS7WP0b8aMGzvWNx6?=
 =?us-ascii?Q?XQuIY8TFnMjHmnfFgfRNiiSx+rYbHABrmCDRQp97jcgeT3zVMLtM2z8Dv+O6?=
 =?us-ascii?Q?qBPP2XWcFEr7YYt4UYPuXrZnFnWLNt5w7tp+7EgFbWCMBUFLLdrtOHrk9ckE?=
 =?us-ascii?Q?bkIvNuuDdW9wJARUYIt0eJoYFujn4OQcSGWU9INzditU0iZopVi9?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 23cd9c8f-9578-4091-c13e-08de5993229f
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 08:49:20.9766 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GaUdgeP2kl1IWxSc1AT8iRX3vMo3rHXg8zMAAYzuhwDlXbv5yVlNMs9pyCU2Eyo6r6h9NvH1HenZHvWV3gLKKQ==
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
Subject: [Linux-stm32] [PATCH v9 4/5] PCI: dwc: ep: Support BAR subrange
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[valinux.co.jp:mid,valinux.co.jp:email,stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:url,stormreply.com:email]
X-Rspamd-Queue-Id: 96F3E636AE
X-Rspamd-Action: no action

Extend dw_pcie_ep_set_bar() to support inbound mappings for BAR
subranges using Address Match Mode IB iATU when pci_epf_bar.num_submap
is non-zero.

Rename the existing BAR-match helper into dw_pcie_ep_ib_atu_bar() and
introduce dw_pcie_ep_ib_atu_addr() for Address Match Mode. When
num_submap is non-zero, read the assigned BAR base address and program
one inbound iATU window per subrange. Validate the submap array before
programming:
- each subrange is aligned to pci->region_align
- subranges cover the whole BAR (no gaps and no overlaps)
- subranges are sorted in ascending order by offset

Track Address Match Mode mappings and tear them down on clear_bar() and
on set_bar() error paths to avoid leaving half-programmed state or
untranslated BAR holes.

Advertise this capability by extending the common feature bit
initializer macro (DWC_EPC_COMMON_FEATURES).

This enables multiple inbound windows within a single BAR, which is
useful on platforms where usable BARs are scarce but EPFs need multiple
inbound regions.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
 .../pci/controller/dwc/pcie-designware-ep.c   | 203 +++++++++++++++++-
 drivers/pci/controller/dwc/pcie-designware.h  |   7 +-
 2 files changed, 199 insertions(+), 11 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
index cfd59899c7b8..0567552b784c 100644
--- a/drivers/pci/controller/dwc/pcie-designware-ep.c
+++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
@@ -100,9 +100,10 @@ static int dw_pcie_ep_write_header(struct pci_epc *epc, u8 func_no, u8 vfunc_no,
 	return 0;
 }
 
-static int dw_pcie_ep_inbound_atu(struct dw_pcie_ep *ep, u8 func_no, int type,
-				  dma_addr_t parent_bus_addr, enum pci_barno bar,
-				  size_t size)
+/* BAR Match Mode inbound iATU mapping */
+static int dw_pcie_ep_ib_atu_bar(struct dw_pcie_ep *ep, u8 func_no, int type,
+				 dma_addr_t parent_bus_addr, enum pci_barno bar,
+				 size_t size)
 {
 	int ret;
 	u32 free_win;
@@ -135,6 +136,179 @@ static int dw_pcie_ep_inbound_atu(struct dw_pcie_ep *ep, u8 func_no, int type,
 	return 0;
 }
 
+static void dw_pcie_ep_clear_ib_maps(struct dw_pcie_ep *ep, enum pci_barno bar)
+{
+	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
+	struct device *dev = pci->dev;
+	unsigned int i, num;
+	u32 atu_index;
+	u32 *indexes;
+
+	/* Tear down the BAR Match Mode mapping, if any. */
+	if (ep->bar_to_atu[bar]) {
+		atu_index = ep->bar_to_atu[bar] - 1;
+		dw_pcie_disable_atu(pci, PCIE_ATU_REGION_DIR_IB, atu_index);
+		clear_bit(atu_index, ep->ib_window_map);
+		ep->bar_to_atu[bar] = 0;
+	}
+
+	/* Tear down all Address Match Mode mappings, if any. */
+	indexes = ep->ib_atu_indexes[bar];
+	num = ep->num_ib_atu_indexes[bar];
+	ep->ib_atu_indexes[bar] = NULL;
+	ep->num_ib_atu_indexes[bar] = 0;
+	if (!indexes)
+		return;
+	for (i = 0; i < num; i++) {
+		dw_pcie_disable_atu(pci, PCIE_ATU_REGION_DIR_IB, indexes[i]);
+		clear_bit(indexes[i], ep->ib_window_map);
+	}
+	devm_kfree(dev, indexes);
+}
+
+static u64 dw_pcie_ep_read_bar_assigned(struct dw_pcie_ep *ep, u8 func_no,
+					enum pci_barno bar, int flags)
+{
+	u32 reg = PCI_BASE_ADDRESS_0 + (4 * bar);
+	u32 lo, hi;
+	u64 addr;
+
+	lo = dw_pcie_ep_readl_dbi(ep, func_no, reg);
+
+	if (flags & PCI_BASE_ADDRESS_SPACE)
+		return lo & PCI_BASE_ADDRESS_IO_MASK;
+
+	addr = lo & PCI_BASE_ADDRESS_MEM_MASK;
+	if (!(flags & PCI_BASE_ADDRESS_MEM_TYPE_64))
+		return addr;
+
+	hi = dw_pcie_ep_readl_dbi(ep, func_no, reg + 4);
+	return addr | ((u64)hi << 32);
+}
+
+static int dw_pcie_ep_validate_submap(struct dw_pcie_ep *ep,
+				      const struct pci_epf_bar_submap *submap,
+				      unsigned int num_submap, size_t bar_size)
+{
+	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
+	u32 align = pci->region_align;
+	size_t off = 0;
+	unsigned int i;
+	size_t size;
+
+	if (!align || !IS_ALIGNED(bar_size, align))
+		return -EINVAL;
+
+	/*
+	 * The submap array order defines the BAR layout (submap[0] starts
+	 * at offset 0 and each entry immediately follows the previous
+	 * one). Here, validate that it forms a strict, gapless
+	 * decomposition of the BAR:
+	 *  - each entry has a non-zero size
+	 *  - sizes, implicit offsets and phys_addr are aligned to
+	 *    pci->region_align
+	 *  - each entry lies within the BAR range
+	 *  - the entries exactly cover the whole BAR
+	 *
+	 * Note: dw_pcie_prog_inbound_atu() also checks alignment for the
+	 * PCI address and the target phys_addr, but validating up-front
+	 * avoids partially programming iATU windows in vain.
+	 */
+	for (i = 0; i < num_submap; i++) {
+		size = submap[i].size;
+
+		if (!size)
+			return -EINVAL;
+
+		if (!IS_ALIGNED(size, align) || !IS_ALIGNED(off, align))
+			return -EINVAL;
+
+		if (!IS_ALIGNED(submap[i].phys_addr, align))
+			return -EINVAL;
+
+		if (off > bar_size || size > bar_size - off)
+			return -EINVAL;
+
+		off += size;
+	}
+	if (off != bar_size)
+		return -EINVAL;
+
+	return 0;
+}
+
+/* Address Match Mode inbound iATU mapping */
+static int dw_pcie_ep_ib_atu_addr(struct dw_pcie_ep *ep, u8 func_no, int type,
+				  const struct pci_epf_bar *epf_bar)
+{
+	const struct pci_epf_bar_submap *submap = epf_bar->submap;
+	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
+	enum pci_barno bar = epf_bar->barno;
+	struct device *dev = pci->dev;
+	u64 pci_addr, parent_bus_addr;
+	u64 size, base, off = 0;
+	int free_win, ret;
+	unsigned int i;
+	u32 *indexes;
+
+	if (!epf_bar->num_submap || !submap || !epf_bar->size)
+		return -EINVAL;
+
+	ret = dw_pcie_ep_validate_submap(ep, submap, epf_bar->num_submap,
+					 epf_bar->size);
+	if (ret)
+		return ret;
+
+	base = dw_pcie_ep_read_bar_assigned(ep, func_no, bar, epf_bar->flags);
+	if (!base) {
+		dev_err(dev,
+			"BAR%u not assigned, cannot set up sub-range mappings\n",
+			bar);
+		return -EINVAL;
+	}
+
+	indexes = devm_kcalloc(dev, epf_bar->num_submap, sizeof(*indexes),
+			       GFP_KERNEL);
+	if (!indexes)
+		return -ENOMEM;
+
+	ep->ib_atu_indexes[bar] = indexes;
+	ep->num_ib_atu_indexes[bar] = 0;
+
+	for (i = 0; i < epf_bar->num_submap; i++) {
+		size = submap[i].size;
+		parent_bus_addr = submap[i].phys_addr;
+
+		if (off > (~0ULL) - base) {
+			ret = -EINVAL;
+			goto err;
+		}
+
+		pci_addr = base + off;
+		off += size;
+
+		free_win = find_first_zero_bit(ep->ib_window_map,
+					       pci->num_ib_windows);
+		if (free_win >= pci->num_ib_windows) {
+			ret = -ENOSPC;
+			goto err;
+		}
+
+		ret = dw_pcie_prog_inbound_atu(pci, free_win, type,
+					       parent_bus_addr, pci_addr, size);
+		if (ret)
+			goto err;
+
+		set_bit(free_win, ep->ib_window_map);
+		indexes[i] = free_win;
+		ep->num_ib_atu_indexes[bar] = i + 1;
+	}
+	return 0;
+err:
+	dw_pcie_ep_clear_ib_maps(ep, bar);
+	return ret;
+}
+
 static int dw_pcie_ep_outbound_atu(struct dw_pcie_ep *ep,
 				   struct dw_pcie_ob_atu_cfg *atu)
 {
@@ -165,17 +339,15 @@ static void dw_pcie_ep_clear_bar(struct pci_epc *epc, u8 func_no, u8 vfunc_no,
 	struct dw_pcie_ep *ep = epc_get_drvdata(epc);
 	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
 	enum pci_barno bar = epf_bar->barno;
-	u32 atu_index = ep->bar_to_atu[bar] - 1;
 
-	if (!ep->bar_to_atu[bar])
+	if (!ep->epf_bar[bar])
 		return;
 
 	__dw_pcie_ep_reset_bar(pci, func_no, bar, epf_bar->flags);
 
-	dw_pcie_disable_atu(pci, PCIE_ATU_REGION_DIR_IB, atu_index);
-	clear_bit(atu_index, ep->ib_window_map);
+	dw_pcie_ep_clear_ib_maps(ep, bar);
+
 	ep->epf_bar[bar] = NULL;
-	ep->bar_to_atu[bar] = 0;
 }
 
 static unsigned int dw_pcie_ep_get_rebar_offset(struct dw_pcie *pci,
@@ -331,6 +503,13 @@ static int dw_pcie_ep_set_bar(struct pci_epc *epc, u8 func_no, u8 vfunc_no,
 		    ep->epf_bar[bar]->flags != flags)
 			return -EINVAL;
 
+		/*
+		 * When dynamically changing a BAR, tear down any existing
+		 * mappings before re-programming.
+		 */
+		if (ep->epf_bar[bar]->num_submap || epf_bar->num_submap)
+			dw_pcie_ep_clear_ib_maps(ep, bar);
+
 		/*
 		 * When dynamically changing a BAR, skip writing the BAR reg, as
 		 * that would clear the BAR's PCI address assigned by the host.
@@ -369,8 +548,12 @@ static int dw_pcie_ep_set_bar(struct pci_epc *epc, u8 func_no, u8 vfunc_no,
 	else
 		type = PCIE_ATU_TYPE_IO;
 
-	ret = dw_pcie_ep_inbound_atu(ep, func_no, type, epf_bar->phys_addr, bar,
-				     size);
+	if (epf_bar->num_submap)
+		ret = dw_pcie_ep_ib_atu_addr(ep, func_no, type, epf_bar);
+	else
+		ret = dw_pcie_ep_ib_atu_bar(ep, func_no, type,
+					    epf_bar->phys_addr, bar, size);
+
 	if (ret)
 		return ret;
 
diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index be47f34b49ca..938dcb541ce3 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -306,7 +306,8 @@
 #define DMA_LLP_MEM_SIZE		PAGE_SIZE
 
 /* Common struct pci_epc_feature bits among DWC EP glue drivers */
-#define DWC_EPC_COMMON_FEATURES		.dynamic_inbound_mapping = true
+#define DWC_EPC_COMMON_FEATURES		.dynamic_inbound_mapping = true, \
+					.subrange_mapping = true
 
 struct dw_pcie;
 struct dw_pcie_rp;
@@ -487,6 +488,10 @@ struct dw_pcie_ep {
 	phys_addr_t		msi_mem_phys;
 	struct pci_epf_bar	*epf_bar[PCI_STD_NUM_BARS];
 
+	/* Only for Address Match Mode inbound iATU */
+	u32			*ib_atu_indexes[PCI_STD_NUM_BARS];
+	unsigned int		num_ib_atu_indexes[PCI_STD_NUM_BARS];
+
 	/* MSI outbound iATU state */
 	bool			msi_iatu_mapped;
 	u64			msi_msg_addr;
-- 
2.51.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
