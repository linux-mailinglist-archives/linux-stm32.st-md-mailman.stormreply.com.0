Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A0EAD1B2DC
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Jan 2026 21:20:20 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EFC3AC8F282;
	Tue, 13 Jan 2026 20:20:19 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazon11013061.outbound.protection.outlook.com [52.101.72.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5254AC5A4EF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Jan 2026 20:20:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DPjIc5z6r1sBlQfZPBgErB+oRxtjUqmxZquHgOk0dnCUzjKy/egQR2n77RaZtNYTe8RA2bcIq+HozWqtsH81H1KZlMi57DWpVwYUfs2uOgd66jEM0S6avh5SOO9YT2meEeZIR2uZKazBVzYwDB4p/F/bH/C0tcuW3fUiBAio6w9N9eUPWKYxGHX2jGEWGmdxzspm3G5hz5PO88K3ZruJrbDW9WTtFuiUOdQH2nVX8Ma8tC/1sM4kIhwLyf6LbtDrhzEIq4Zc2i+iBJSTU7bRxqXE35+N5AwYCaagNBO6gkH96edXzk5qL9901nJMV72E7bPIHmTuPSPpHhGcYk/2nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h1YD/fV7ApuqyNA+39UIVPOp5u2MTX8vUOoj+QoUQAw=;
 b=SwQTrwMQBffxwaMGhysUwQqaao0THG/+L3Vi1nXJkiP+jkHsekQ1+MJKVViFveX0e4DGlSxZXBr4y3wWgdYqlKQ5ixYfosDtorvukdqFvPLXkMXbK00qM8Q+YdkEdMrRfuctrD9WJ1PYdPZ0zOxauBr2RxYBKJM0MVkVSrcwKiOYYEG9Y/Qi8YXK1o3426pb1sU8vHPEP/ljKavlBvtCUl7eF+7lv3DiUuzvJ/LuGtjI0TFoGyqL9bA1scIYgP0sRjt7+FUAEnkiV9kl5MaNvstjnlYAGEqru9RakbClrTjE2uzYtM4y5swKkQ4LIqJGZhTpZFDhkZXXVxB357xKrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h1YD/fV7ApuqyNA+39UIVPOp5u2MTX8vUOoj+QoUQAw=;
 b=EDnEKAhoRURPi1UMxiRQQQ/2uxY9KCSOjJtYp2mpR5rZ9hl9lEIn+rIqLru3c/NT56XG39/5ozuP5ByXkLeJwnUxR6j4YvRZymTrKJ3HpDzSRE/AgUOB3HvNxYIypn7E9Ykpq1w6Dp27GzZT3T1GM2JeF2A6a83RXlk5TiHyZC0lmWZooVeWm6O9cA208nYlC5IytggVydHvmE2ue6uHy4iZjDEe5gckc2AcBISoELtjRSTs+uRXNVztMzlLeSsxhvH4Vn0U82/H7aGzpjYLZyRNU2tLKxWoZbqaEQKRTAlxIr72mJat2ZTdzbzUcUDb6Bz68RR1ka2h3niezyDTtg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by GV2PR04MB12319.eurprd04.prod.outlook.com (2603:10a6:150:32a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 20:20:16 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9478.004; Tue, 13 Jan 2026
 20:20:16 +0000
Date: Tue, 13 Jan 2026 15:19:55 -0500
From: Frank Li <Frank.li@nxp.com>
To: Koichiro Den <den@valinux.co.jp>
Message-ID: <aWao64gu48V6aD+n@lizhi-Precision-Tower-5810>
References: <20260113162719.3710268-1-den@valinux.co.jp>
 <20260113162719.3710268-2-den@valinux.co.jp>
Content-Disposition: inline
In-Reply-To: <20260113162719.3710268-2-den@valinux.co.jp>
X-ClientProxiedBy: BYAPR06CA0057.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::34) To AS8PR04MB8948.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|GV2PR04MB12319:EE_
X-MS-Office365-Filtering-Correlation-Id: c72659b8-0917-4b5d-5c55-08de52e12797
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|7416014|1800799024|19092799006|376014|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zRtjCXll3v8D7tfDHj+hx3Ifc/zDCQU3r6OA0AnSqEm8CGs7o2R6lHFcnPf0?=
 =?us-ascii?Q?kzRlugB9gHWm1fwGexFH3uiULpJGk/2GkkrVxmSNQmz/okJ8LEJCOz0EpeMy?=
 =?us-ascii?Q?eJr/vhTm4fHUdrQDxt9XH9eJ1ZDOLY/4KiDRDkchB3TN9lrAZLs4/ojqVd3E?=
 =?us-ascii?Q?V92wvaQyKzlSmpw4h4DMcyCBrEPMwt+3KrSr+iSglLENP/D0wJAGrV5dCsSJ?=
 =?us-ascii?Q?OyC+XjH9mlry4UKjE3ekuPdN1PjzIBwa89YjwkcieaWpZUF9GcCLBFA1UaLu?=
 =?us-ascii?Q?uDqlTcKiDeKmjaWZdz3RieJSfA8m8A/i3xIQKcEhNzaydUaHdb16ckHca9YY?=
 =?us-ascii?Q?5K2awyleuUM+K5jtjFxH1x9g31pg3IztIJJ0SUdwCcuvO3xyQegIyrXv+dZT?=
 =?us-ascii?Q?ukv0cAS4GMvBXEBvikg95SR/1J83GbEwzGo05KFEnArAAv1cF8YSIAMUaaCd?=
 =?us-ascii?Q?e30uhk+PuPniuI/ovXMnT7uutxNAyCYPQJUdnrvvZNQgv4kC21wSxqpu3nP8?=
 =?us-ascii?Q?9s8SgJJ+Z23Ngp6MmGutrUHYDnSfFdKx9ZHl+Vh968nUOjNAELV1kuQunXWb?=
 =?us-ascii?Q?aARoFuTPuGhwTs5ox1Gb6hWVjBlAQIONxYH5IqkxPX6D31y7E2niZTeJgalq?=
 =?us-ascii?Q?HgU/KuSDnyRXer11k9D6oXAF0Q/W9wvs90unQ0HkSJy9ZVFwIDNODyp2MHeE?=
 =?us-ascii?Q?7ocaJUAjEbKW2BwyREaQJhPg6FcSNUqXNx0efjlbra+U0RRtTPZ6jHW3vGr8?=
 =?us-ascii?Q?YKdXsey5db3OKbNzQXVjJKDSNreogZc550LRAVJBf2RitWy8fRUi6dd25SFR?=
 =?us-ascii?Q?t22QXtbZ0TlJAD/x/wqNp2eFgRzyTjDzkgOxK5nhzODZ10PfAtf2jridn8Wu?=
 =?us-ascii?Q?MLUv4tV3A/xiBzjPcxsJPvUWSQ/Itp25OfnA+6SVZL1kAH9xV0tu8NkGvImY?=
 =?us-ascii?Q?jtw8B6JD+rc5ok4Ku2f2PDL9Q9Pp7ZvgdrFSO/mEDACrvn3lGLH7nPxzM8my?=
 =?us-ascii?Q?c/LrajeziW0JUuT+wHKZA9nuTX2rRtE3zKMIXgtG2Onseblt4zvNjkHB2uk7?=
 =?us-ascii?Q?biigR7FMxtRYAPVAicF52q1Gz2FD7lxPXfnwAyEn3KQ3XFo+Rx4EUCIQaV9j?=
 =?us-ascii?Q?nETdP1eeTCXBPGoevy/62EzMGR378vs7sKvxR6xMI60pnWygRB7k2YlxDsYg?=
 =?us-ascii?Q?jOsaGx8Gy/E6PYStWupLxmaloq8Yst2eTLwg1TqOYYvzkMSE9ys1W/+SjcWv?=
 =?us-ascii?Q?mN+L9SubPxLr/B7fGhvOt7JaF+7CQaER/LuhFC+VoK1UXUX7DWiZ0SlnVzAt?=
 =?us-ascii?Q?jU4PAf+XaI62CeLwgTO1VS41QKVR8FKQ1TbgrA8KQ7RkEN82m+pNYKRClQEf?=
 =?us-ascii?Q?kEIFLE8b5LjwfgqFhxB2fDWxXeZX+5DZzvlQ94wOBx1J1cWD0NTa8sFve9FQ?=
 =?us-ascii?Q?jAquRg/hHgl80XJxh0gBEtEKc30u1llvk9UEZonwDTBOv6ZcnF6Fd+Ms7ou+?=
 =?us-ascii?Q?lrlKiiijJi34ajX6DTOAU4SDAyu3VksSsWsd?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU2PR04MB8951.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(7416014)(1800799024)(19092799006)(376014)(366016)(38350700014)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dPjMcvzS/R0c/LjewQ1gJOr8Y4NSv17n3fDas76PJU74/v5St6qGqqixmK4L?=
 =?us-ascii?Q?W3nNDnTS+AEh2IB1STD5DX45sRyvrOjIX5MCJgCA4Xxn+CzPMI5XblksTW9I?=
 =?us-ascii?Q?QwaMC2wrKe+rV6wyRcQIPHl4eWeImtlPUNx1A4coZ9KmhQtR28iBRjlIjDmN?=
 =?us-ascii?Q?UV0j5I71tN3q0erFAlZdT0wzEAA8dX7hTu9dn4CROtfPCK8CGGLpcvyadLuE?=
 =?us-ascii?Q?LW8H9d6dpKorK+z4b6IK2OUXgRsW+9/W+WX0BvUWd6pu9yLD2OpdQMWtzbfc?=
 =?us-ascii?Q?vR7aj7FLy3TzY4Zw0uNy189klLC491nGifZ8gGCt8dD6GgNosU+5ADaKvXCl?=
 =?us-ascii?Q?SHTN+1VsCwk2WM+loURcmROfpLs1REOA3wCtm/feKkPtY5vFy/H+Sxij7FNE?=
 =?us-ascii?Q?qlfQFVm8KL2fT7MMHaJNiec5x58R87ncaCXVkt7kAgdd1MXKF6lJSI5oeEmO?=
 =?us-ascii?Q?QnLbaTtIAIxjOP9CIZHK4oH+Qz8vT0hImiHZyf4d/Fg+3VqjF7/iieW4u3MP?=
 =?us-ascii?Q?wsXc1eGQddRVYsouyr18fnOOzJlCk5UjqngwySDLSeu0GApwjf3DGvHC1hRd?=
 =?us-ascii?Q?htLemV5W2eo4xreKtXYQOWrEfsv5Mb8xzIJzrfb2E1gPKTVNe0YZNQ8Qgj7a?=
 =?us-ascii?Q?UAHZpHoULCLn+WLi2c9a3rXK8fN4MdSj4uUWQLsqtxIeFLCpLVj6EaVSwuNZ?=
 =?us-ascii?Q?WbqHkHD7bXEZahJLyeXB/rde/vNppxJO6ySRwHD3FupiHPTDX24OBPr2Nn4p?=
 =?us-ascii?Q?JPkpjphF5Qp0Sd/x+/Ds+0biYTHsQMg/CSOQ4zipOAOoD11DFPLu6g7XaI/6?=
 =?us-ascii?Q?FS2qNA6Zw2UrjZrGVb+9vEbfFXAgemX4qYy8E2HM2GBb6IlbZABZNVhdeXia?=
 =?us-ascii?Q?+dnF0lxJuQ22CqIUCpDE6744UcyXrF57PHnHyGz7uAFXIEGWnb6rTZTSnz3C?=
 =?us-ascii?Q?/t6BYo9KzBq0xpzvHWZXntwthHJdFs6fwoq56Q+7229gIee05p6V7wnCoQjF?=
 =?us-ascii?Q?gD/XCG9c8E4Tni8z9p6V6iyvYJXUAMhHGEbcvi5vyBKSqswt9A6MGYM2M6dX?=
 =?us-ascii?Q?IKR3L+f4doT3dAZq5HxfLZPMKsdZzHzziPczdKp343BGGdTjMYFFwowY2CY7?=
 =?us-ascii?Q?bzo3VBx8Zttev0iKqwVNv4FXdqNGdPq0pfXvS+EVUyrB+l62YJSDLn1u0KnP?=
 =?us-ascii?Q?Ie8lWSZfTSUvIsQHhuGWYSMnE1S1MfM3fv9eX3X/u7Vp1iC5S3qTjjUYbQql?=
 =?us-ascii?Q?jV4cfnqpFYxa+rBXGFhMwXOCoKmcAA5LBqIdgh/cJW6sqm6yBiIMrPcL/nR+?=
 =?us-ascii?Q?eheXxmqxTX4mFLvgH3kabgnoA7yVYV6vjtulP6dyam6LB2D5WL+S1dOsEBiV?=
 =?us-ascii?Q?DVA8XvQDT2x5kasfWbiz4isclnrBKRWfg6lKrsC2cv61GiO5X+trArjZ1OCA?=
 =?us-ascii?Q?Sagl3a2xP8X6uMnRyuLBOyjdkBSk9bZdfnlf7TTAKzkczaRn3HhVkCUNaGRZ?=
 =?us-ascii?Q?ok2RUznCN9ksrEvy56GOalh4SFHVjI99xJ2SsenEXxEhgxE3RARyiSd+/1fw?=
 =?us-ascii?Q?snN8dbbyyIVFgRo5uxuct0YUzu0OtlduWOFwZQksaTDFGajyPf1yzWGvZ+DV?=
 =?us-ascii?Q?9fLTMfQZ/SPYvY6AA0ZI4whXPfuTWH0DoQAFmVYQZ1pVTj1yWGlpyBhG/Gk7?=
 =?us-ascii?Q?WD1ZJHbeAfy7GGxQKOjMUZrgz+pdu8kUN1G5/dLMpAyS9zHc?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c72659b8-0917-4b5d-5c55-08de52e12797
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8948.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 20:20:16.4580 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lEd3ZKerRs4CLS05g6RCUMARJul3tDv1F4XrG52c4t+eovn0K3BAvmRJTKIFauJVvOPkMfWhVNP+o7DgOyBR3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB12319
Cc: imx@lists.linux.dev, vigneshr@ti.com, geert+renesas@glider.be,
 linux-pci@vger.kernel.org, lpieralisi@kernel.org, christian.bruel@foss.st.com,
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
 roy.zang@nxp.com, linux-tegra@vger.kernel.org, cassel@kernel.org,
 linux.amoon@gmail.com, jingoohan1@gmail.com, yoshihiro.shimoda.uh@renesas.com,
 heiko@sntech.de, linux-kernel@vger.kernel.org, vidyas@nvidia.com,
 linux-renesas-soc@vger.kernel.org, mhiramat@kernel.org, kernel@pengutronix.de,
 shawnguo@kernel.org, nicolas.frattaroli@collabora.com, l.stach@pengutronix.de
Subject: Re: [Linux-stm32] [PATCH v7 1/6] PCI: endpoint: Add
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

On Wed, Jan 14, 2026 at 01:27:14AM +0900, Koichiro Den wrote:
> Introduce a new EPC feature bit (dynamic_inbound_mapping) that indicates
> whether an Endpoint Controller can update the inbound address
> translation for a BAR without requiring the EPF driver to clear/reset
> the BAR first.
>
> Endpoint Function drivers (e.g. vNTB) can use this information to decide
> whether it really is safe to call pci_epc_set_bar() multiple times to
> update inbound mappings for the BAR.
>
> Suggested-by: Niklas Cassel <cassel@kernel.org>
> Reviewed-by: Niklas Cassel <cassel@kernel.org>
> Signed-off-by: Koichiro Den <den@valinux.co.jp>
> ---
Reviewed-by: Frank Li <Frank.Li@nxp.com>
>  include/linux/pci-epc.h | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/include/linux/pci-epc.h b/include/linux/pci-epc.h
> index 4286bfdbfdfa..4c8516756c56 100644
> --- a/include/linux/pci-epc.h
> +++ b/include/linux/pci-epc.h
> @@ -223,6 +223,10 @@ struct pci_epc_bar_desc {
>  /**
>   * struct pci_epc_features - features supported by a EPC device per function
>   * @linkup_notifier: indicate if the EPC device can notify EPF driver on link up
> + * @dynamic_inbound_mapping: indicate if the EPC device supports updating
> + *                           inbound mappings for an already configured BAR
> + *                           (i.e. allow calling pci_epc_set_bar() again
> + *                           without first calling pci_epc_clear_bar())
>   * @msi_capable: indicate if the endpoint function has MSI capability
>   * @msix_capable: indicate if the endpoint function has MSI-X capability
>   * @intx_capable: indicate if the endpoint can raise INTx interrupts
> @@ -231,6 +235,7 @@ struct pci_epc_bar_desc {
>   */
>  struct pci_epc_features {
>  	unsigned int	linkup_notifier : 1;
> +	unsigned int	dynamic_inbound_mapping : 1;
>  	unsigned int	msi_capable : 1;
>  	unsigned int	msix_capable : 1;
>  	unsigned int	intx_capable : 1;
> --
> 2.51.0
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
