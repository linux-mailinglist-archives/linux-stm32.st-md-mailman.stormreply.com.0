Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qEtWFUNBpGkgbQUAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sun, 01 Mar 2026 14:38:11 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D63A71CFF84
	for <lists+linux-stm32@lfdr.de>; Sun, 01 Mar 2026 14:38:10 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 73D95C8F269;
	Sun,  1 Mar 2026 13:38:10 +0000 (UTC)
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazon11020106.outbound.protection.outlook.com [52.101.228.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 322D2C030D6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  1 Mar 2026 13:38:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nNmduesqti6koRRkH8e40e5MHIlaOzmKLAYG6AaodYB19B8BnEjvcxbEY3qKxBvxXMY6p9J1mzTKnFyd+8Rh5+DcY63dPYVFCDysMFuwwHaWLowEfeIv50qhTiMRShetz9PaheXHW/ARqT2o4YKRj5maj/zljOHOusRMv4GFJnH1KpwAf71geWBu/Q40XYROcZkaF+MvAWlh2oQqcIyjRbZAqmMui/neDZnZoWp7Z6XPKlyz9wrqPddKU5lVhvJ6+XaFUNZ5Wc3Z9oD5/C+5smONDC4L1PMblIah8ZwZYU8LRT21UH0zoPPZhN3nes/WfrH0zIjimbqSWlBDtAX9gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Zh1YWQefFEIXTG4YMjcBJSXaRmW0Hpy+qI+xzoRWSI=;
 b=lkd0dfcxtfi7C9hNvHRe1QiHvjdGauk+UEjjoEemzZw2JVCpyoqMT1AvCryIvM4B4DHonjZocC336A8u7LusRMHr0uMm6Z2wvHamFjnGRaJaZkDhRdtHmAQ2Fd/bK+jAZMml6VrMBt0NgxAmGqZz9z0lrBK5ez0+e23KhM/uogmPY8lsQYsMEEHjkzbawC75y0gsHs4Di/MO7NlIuVO7Wu/YPnzNQYUb2xEVA58KabrsNgp9f3ZH71RmHnA6/SPDjPFsfeo0YdmX830aeVllmVxz+eZSgNaQ5ag1BvZn6760smK4O8eYmzAgcpbSLAIob4l4bPNmi6NdXc0n5HAMEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Zh1YWQefFEIXTG4YMjcBJSXaRmW0Hpy+qI+xzoRWSI=;
 b=XDz+ksVBIUCRisdqMzqzfJF7TC6aMxbBJRjWT7KIOY4lgNbpZc6Lqnm1N8R5QyilKmAWlQlW6Ye1GLkPMDxK71NWpUlwRmWTwkk1zP/3I+ZRLlg3e2chKmIgW2jKeQ+QleoCusH65t174kvWKv4xV/HXmGvjQRt7IVfVgNcLXZU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TY4P286MB7053.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:343::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.20; Sun, 1 Mar
 2026 13:38:04 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%5]) with mapi id 15.20.9654.015; Sun, 1 Mar 2026
 13:38:04 +0000
Date: Sun, 1 Mar 2026 22:38:03 +0900
From: Koichiro Den <den@valinux.co.jp>
To: Niklas Cassel <cassel@kernel.org>
Message-ID: <sutj7pvizlofyr3pcbv2wgc6lned4s33du3g3tkqveaofj4g5a@adfxekkfxeqc>
References: <20260225170324.4033466-11-cassel@kernel.org>
Content-Disposition: inline
In-Reply-To: <20260225170324.4033466-11-cassel@kernel.org>
X-ClientProxiedBy: TYWPR01CA0037.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::6) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TY4P286MB7053:EE_
X-MS-Office365-Filtering-Correlation-Id: c333a983-3151-4b74-6382-08de7797c410
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|10070799003|1800799024|366016|7053199007|27256017;
X-Microsoft-Antispam-Message-Info: tQrPIpxmMfwcEE+L+teDjVUBO74c5nClUH7517Isb8JzqM+WmDwOZ+0L2ZriwYqXyaa+ibDIl7mraV4mAlVw2DbU/XvkyYU/hJo+AQJued8/2uAVnDIehU0JmmL5nheOng6uLQ3xJsVModYihwTsyNI1Zjk1bD6Jh+p7iM5+QHVDCkx5uCK+Zo5QM5hrvpzcla0BAfZBJo5gJkYSUZgMOTD+mLs6MJp4ySg4xGitOxXloaS3eN3q2+L/zifr9ZAE3EogtfcgVvlelhYjxHH67WmVo8pyEe26cS3b4F8b1Ilovi1huIyVHnFKjARg3fZUvougPPF7H7niUZvPTdsbRdUWz41oQeVwwiyWLuMkYfq2LBWabUDAfoKQpW+ATw8zopL26rQg9tqB4ep8kjpLVeS7QOCVr52VAQRjRmRJwqlrvxd3Mxr3FcBAedr/s6Xk8Afhac9jTWnjTjhY61omOLyRR8XAp1pFkFA8RWVOS4VAueym3vDTJvm89rEfpTXwAC6KWS9IQpVy4CnuT8UI3untRkxMDkUsMgSld+6SR8ToemNlCJRAuBoqnK8sA/Pdsj6X8KmNmYJt4CfSL/GGbKLT6A9DopFYfVbnXIFCoZ6PKtS1u68AzSyT/bi78ufWdwz0xHsrkaEOsWMQ8fWYSpKrBflnfX4880zfDYsrb2u+SsVP8Vj6Q562F8/1DXeZtSsZAsCn7jIB/JoVNOBfjSTK87W638wMPbzL1MO6I155xe1ffHgp+9tQyvw1NUJ46ek6hpkXPYv36cp0gJw8ha7PleDkCi8RLeDIVVwgn3Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(10070799003)(1800799024)(366016)(7053199007)(27256017);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7OhTa5t6m1kmN2sju/zf7/4quwAvRwtc0ezu6NQgaulFgOlDzNmUJAsVKP70?=
 =?us-ascii?Q?jzB9nw/qWOmKEpT66Gn9e4DwHi6Cy58X2ueczpVQPBXdnH/eLBTj/4m3J21j?=
 =?us-ascii?Q?X7hFNc+4JHDRC4SIcm5PvdYq/TlwHHUEIHa2VlWJiFDyZ/KEFywescvLLNdf?=
 =?us-ascii?Q?co/SfkdvfnRlutm+OO46SjOH4etKCJn74XZBWBvKs5W0XJnmTo+a4t2O/UMj?=
 =?us-ascii?Q?om6pMY/x/PJ65xN4Xk3yWkUN5QO52CykGRCK4i1rSiUaL3TzMAfkR7fWNQt6?=
 =?us-ascii?Q?GEA61wpPYEhZXpIKMPKCc+urid9VXrMUlPk/aLk2DYyZI8YHvCMGOu8U4Cmz?=
 =?us-ascii?Q?C348/rt0UMUoH9nlK/+3u7eV29RoRsCxeASrSIEBuz5NWlameMEXTdbNV5z6?=
 =?us-ascii?Q?IuBM2MOSmMm3ts5U9E+Lon4sMLYKG7BkA0uFUDu5bALGpfR+/y+3OPGxkMUd?=
 =?us-ascii?Q?kZrNAbq15sE2hYjOO5/nDeoEhBQwW05eZGyPCVUuQAMlgQo8jOPgO3ckCLF1?=
 =?us-ascii?Q?wPC8oOYuUv8gnrowq6fUlNUskkPXVSqeaLoxrfyyVnEi2tfkLb57pkMk75T9?=
 =?us-ascii?Q?P9nqT080YSxARUUJxzSS61dKFe8QsIuaBLWSrB1EUTrmFmc5hZ4QoISe67Zp?=
 =?us-ascii?Q?d+3mvf9GHdOOmB3PgKRAKkSvhzYgWkFndd17VYl0e8+MvvPbjav5HhsHEWe3?=
 =?us-ascii?Q?9VGh1BILA2Gk9fv65OBWYlExC/666Up2/EL3G/kj8dTFguuPL/cHsIZUP7n8?=
 =?us-ascii?Q?HUAQSw5rKnooECtKHlQJaab4T01MTIWfp/LfONmMYgUnTKhVRswSMrE/cZpg?=
 =?us-ascii?Q?lWNJ/0fScQVYxABXeAhKvP8OCWhHfWAecpJbJCSHfTTxfKPogGawq592lPqs?=
 =?us-ascii?Q?HebL/Sro9GTQtjTTZFr9MEVil5uD5Sq38vLlyJCw90sNg7aMxPtYTgjezRi+?=
 =?us-ascii?Q?rFc3YH5kwl5HFAolMrk6XwAyfxNJTlEFYZUQ6+UC4GYO2q6SRsSW6ON06E3J?=
 =?us-ascii?Q?D9DlYH20vCGwCdvvtGKLfKJtjkw3EflRszVY510J2QQR9MtJsArZlkItgcMj?=
 =?us-ascii?Q?S3dggTAieWJljD1EFXnfohR/G80VWPUklh76ZxnQMz2cYbIztkn6xW/NpsMR?=
 =?us-ascii?Q?MsBebyEtkkhkc5FjZyjoEWaRqtzMKwTviwl0gysdfQVnxB4Mcqldmu452mDD?=
 =?us-ascii?Q?/pnHzCBz1/dCHTUwNwpFtuZn+PfmNqKNdXkrUhpBgmp1uWvpzLtAXlV4HSdL?=
 =?us-ascii?Q?DGu/EuHE7b4iZ1eMHfm39BPgwqwMb4Zz69RZ0x1wAdHMoHKdMy8imciTwOnn?=
 =?us-ascii?Q?EzmmEXHRvZhfauMewHdcSW7aDkrsAZzdgpxzcgkZDQALIL5TpOAjdY93FvdN?=
 =?us-ascii?Q?48MDo3IFy/hHiQaVDZroLBCVFT4mvbM7h71mmk3W8Jen78bJI8I8mP+n90tu?=
 =?us-ascii?Q?F7GNDqGNrDgSVDhwS5Qf7kKhek3D5ia0OKXSPl7lRRi8J2aN1cgSMf8IPQRR?=
 =?us-ascii?Q?cEPBB7CUL5lc/pYHtBU5REX++gn0p86LJBuOumKWeqs1L67bJlqXGI6e1O/W?=
 =?us-ascii?Q?KgA1ZZbWaMTPzyGC25OaXIlYzzPMNGExWgDQe7rj58pg3UeRlaN4Ww/2qmaR?=
 =?us-ascii?Q?+EDUs9WpzpOjwJpYrpOVodxE2gm5MHZYBWaG73IWS+SSR3tTMAC1/SqjFW51?=
 =?us-ascii?Q?FI9JPPp5YNiSjdDvsA86jcqb6I09KXHaI82cr3T8LbmirbdyV/CBnl8XeEvB?=
 =?us-ascii?Q?V/PthTOUMUWCw0S4z7H3f6ROd2LlEdPYIfaXF/pK6z/c91TIWEII?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: c333a983-3151-4b74-6382-08de7797c410
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2026 13:38:04.7281 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lbzo/w4j2oLrOzAxOJ51/onmXlSYGb5B0UKNKwcMbY5evR5ePgQv+8C1+PV2q8I0vdxXm/vnY2Squ0JyoWKzgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4P286MB7053
Cc: imx@lists.linux.dev, Vignesh Raghavendra <vigneshr@ti.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-pci@vger.kernel.org,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Minghuan Lian <minghuan.Lian@nxp.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-kselftest@vger.kernel.org,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Heiko Stuebner <heiko@sntech.de>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Jesper Nilsson <jesper.nilsson@axis.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Shuah Khan <shuah@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 linux-arm-kernel@axis.com, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Marek Vasut <marek.vasut+renesas@gmail.com>,
 Siddharth Vadapalli <s-vadapalli@ti.com>,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Srikanth Thokala <srikanth.thokala@intel.com>,
 Richard Zhu <hongxing.zhu@nxp.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Manikanta Maddireddy <mmaddireddy@nvidia.com>,
 Damien Le Moal <dlemoal@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 linux-omap@vger.kernel.org, Mingkai Hu <mingkai.hu@nxp.com>,
 Roy Zang <roy.zang@nxp.com>, linux-tegra@vger.kernel.org,
 Christian Bruel <christian.bruel@foss.st.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 linux-renesas-soc@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jingoo Han <jingoohan1@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [Linux-stm32] [PATCH v2 0/9] PCI: endpoint: Differentiate
 between disabled and reserved BARs
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
	R_DKIM_REJECT(1.00)[valinux.co.jp:s=selector1];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	MID_RHS_NOT_FQDN(0.50)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	DMARC_POLICY_SOFTFAIL(0.10)[valinux.co.jp : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[49];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[den@valinux.co.jp,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	GREYLIST(0.00)[pass,meta];
	FORGED_RECIPIENTS(0.00)[m:cassel@kernel.org,m:imx@lists.linux.dev,m:vigneshr@ti.com,m:geert+renesas@glider.be,m:linux-pci@vger.kernel.org,m:lpieralisi@kernel.org,m:Frank.Li@nxp.com,m:minghuan.Lian@nxp.com,m:thierry.reding@gmail.com,m:linux-kselftest@vger.kernel.org,m:festevam@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:heiko@sntech.de,m:kishon@kernel.org,m:robh@kernel.org,m:jesper.nilsson@axis.com,m:hayashi.kunihiko@socionext.com,m:shuah@kernel.org,m:magnus.damm@gmail.com,m:linux-arm-kernel@axis.com,m:jonathanh@nvidia.com,m:linux-rockchip@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:marek.vasut+renesas@gmail.com,m:s-vadapalli@ti.com,m:kwilczynski@kernel.org,m:srikanth.thokala@intel.com,m:hongxing.zhu@nxp.com,m:mcoquelin.stm32@gmail.com,m:arnd@arndb.de,m:mani@kernel.org,m:linux-arm-msm@vger.kernel.org,m:s.hauer@pengutronix.de,m:mmaddireddy@nvidia.com,m:dlemoal@kernel.org,m:bhelgaas@google.com,m:linux-omap@vger.kernel.org,m:mingkai.hu@nxp.com,m:roy.zang@nxp.
 com,m:linux-tegra@vger.kernel.org,m:christian.bruel@foss.st.com,m:gregkh@linuxfoundation.org,m:yoshihiro.shimoda.uh@renesas.com,m:linux-renesas-soc@vger.kernel.org,m:mhiramat@kernel.org,m:kernel@pengutronix.de,m:jingoohan1@gmail.com,m:linuxppc-dev@lists.ozlabs.org,m:l.stach@pengutronix.de,m:geert@glider.be,m:thierryreding@gmail.com,m:magnusdamm@gmail.com,m:marekvasut@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[lists.linux.dev,ti.com,glider.be,vger.kernel.org,kernel.org,nxp.com,gmail.com,st-md-mailman.stormreply.com,sntech.de,axis.com,socionext.com,nvidia.com,lists.infradead.org,intel.com,arndb.de,pengutronix.de,google.com,foss.st.com,linuxfoundation.org,renesas.com,lists.ozlabs.org];
	DKIM_TRACE(0.00)[valinux.co.jp:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.997];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[den@valinux.co.jp,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[valinux.co.jp:email,stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: D63A71CFF84
X-Rspamd-Action: no action

On Wed, Feb 25, 2026 at 06:03:23PM +0100, Niklas Cassel wrote:
> Hello all,
> 
> This series was originally written in response to the patch series from
> Manikanta Maddireddy that was posted here:
> https://lore.kernel.org/linux-pci/291dab65-3fa6-4fc8-90a2-4ad608ca015c@nvidia.com/T/#t
> 
> Manikanta has reviewed V1 and will send a small series on top of this one.
> 
> 
> Changes since v1:
> -Rebased on latest pci/endpoint branch
> -Picked up tags
> -Fixed review comments from Frank and Manikanta (thank you)
> -Simplified function bar_is_reserved()
> 
> Link to v1:
> https://lore.kernel.org/linux-pci/20260217212707.2450423-11-cassel@kernel.org/
> 
> 
> Koichiro Den (2):
>   PCI: endpoint: Describe reserved subregions within BARs
>   PCI: dw-rockchip: Describe RK3588 BAR4 DMA ctrl window
> 
> Niklas Cassel (7):
>   PCI: endpoint: Introduce pci_epc_bar_type BAR_64BIT_UPPER
>   PCI: endpoint: Introduce pci_epc_bar_type BAR_DISABLED
>   PCI: dwc: Replace certain BAR_RESERVED with BAR_DISABLED in glue
>     drivers
>   PCI: dwc: Disable BARs in common code instead of in each glue driver
>   PCI: endpoint: pci-epf-test: Advertise reserved BARs
>   misc: pci_endpoint_test: Give reserved BARs a distinct error code
>   selftests: pci_endpoint: Skip reserved BARs
> 
>  drivers/misc/pci_endpoint_test.c              | 21 ++++++++-
>  drivers/pci/controller/dwc/pci-dra7xx.c       |  4 --
>  drivers/pci/controller/dwc/pci-imx6.c         | 22 +++------
>  drivers/pci/controller/dwc/pci-keystone.c     | 12 +++++
>  .../pci/controller/dwc/pci-layerscape-ep.c    |  8 +---
>  drivers/pci/controller/dwc/pcie-artpec6.c     |  4 --
>  .../pci/controller/dwc/pcie-designware-ep.c   | 24 ++++++++++
>  .../pci/controller/dwc/pcie-designware-plat.c | 10 -----
>  drivers/pci/controller/dwc/pcie-dw-rockchip.c | 19 +++++---
>  drivers/pci/controller/dwc/pcie-keembay.c     |  6 +--
>  drivers/pci/controller/dwc/pcie-qcom-ep.c     | 14 +-----
>  drivers/pci/controller/dwc/pcie-rcar-gen4.c   | 16 ++-----
>  drivers/pci/controller/dwc/pcie-stm32-ep.c    | 10 -----
>  drivers/pci/controller/dwc/pcie-tegra194.c    | 20 +++------
>  drivers/pci/controller/dwc/pcie-uniphier-ep.c | 24 +++-------
>  drivers/pci/controller/pcie-rcar-ep.c         |  6 +--
>  drivers/pci/endpoint/functions/pci-epf-test.c | 24 ++++++++++
>  drivers/pci/endpoint/pci-epc-core.c           |  6 ++-
>  include/linux/pci-epc.h                       | 45 +++++++++++++++++--
>  .../pci_endpoint/pci_endpoint_test.c          |  4 ++
>  20 files changed, 174 insertions(+), 125 deletions(-)
> 
> 
> base-commit: 8eaff52fc101c1f6b3215db93bba02c815155806

For the series:

Tested-by: Koichiro Den <den@valinux.co.jp>

Tested on 2x R-Car S4 Spider boards.
No change in pci_endpoint_test results compared to base-commit.
Thanks for working on this.

> -- 
> 2.53.0
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
