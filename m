Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 47754D1A3AF
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Jan 2026 17:27:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E3465C8F290;
	Tue, 13 Jan 2026 16:27:31 +0000 (UTC)
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazon11021134.outbound.protection.outlook.com [52.101.125.134])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8D26DC8F282
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Jan 2026 16:27:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZjWWZi4CVrEtieUPOkUnovDZbdnTTp/jTA1ewJcxWVq9xK+zKIh1p8yeNEdjjXvccyHScCOMs51mapZ0R90X7NtueTI3C4n85w35N5faq+f/1EbdNr7HWop5txiS0GtNefmS5ABoLnKdZIqg5w+lVTFIaIpYFNQsx9MtctMWRJTrJHasLl4dw+i4nUGj00g1GQeBF2rCSP3MiKREbd5oCMP7oodDWvAZaGid+3aKNh65dF+o4dJ3uxwJC25E2oCWm3ZoEQ1wSA+TWziYMxPUQ0SmLHyKl90JMkti5WtBQ85KZPwyBWF3RLKVpFg/vzD5gzREkyP4SUkrU9YZZaWR/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nqshZozVbx/xLHsjqvjjWCdNdXWQ6vleOjL14woevTg=;
 b=ZXAcxP3uesiQMIYcgjNnSIhCigH8uqxDh4Uh0quiv84nJXe7GOIxq6d5778hNdMBx/urbbdcFvmfNtLIH7jVGmBMI2MzGRG7Uk1JxEoRqjxL7N+CyPdGJbdZczmk2PeEsmAmjZLmaGoVdtBegPBcTTN4rE5C6E5NUzpCCs2djscTqDv3zbW+vZvXZFQfNdxHK8UzyHXIsNLlvg4IS/R/fbTrNN/nFSXJoKUVq5pINcNG2m3OSK+w0MtpVzY765YA7g8e3s1tzHHChJ5U6cu64QAILLuGURKF4M4Qa0tQOsYTE27mLa3wicKzNW95AxcIuDDfFtmyJpgi16iLXFDIfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nqshZozVbx/xLHsjqvjjWCdNdXWQ6vleOjL14woevTg=;
 b=apjSdGdixvv31DtIJ1LT7LfbnNkFdyCrVU62gIM0e3yM0qD0PbJCMlmvkvtvGrIJOR+VZpvLv2j98omtqm1pcUMxQ+3uaCU/AuuoO1bHy1CYF77sW9K7nLnLEhAInOCNxoOwOoxsoNyhi57YfGulILlRJ+d9kSUQi8yyw7lZoPM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYWP286MB2282.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:13d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 16:27:26 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%5]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 16:27:26 +0000
From: Koichiro Den <den@valinux.co.jp>
To: jingoohan1@gmail.com, mani@kernel.org, lpieralisi@kernel.org,
 kwilczynski@kernel.org, robh@kernel.org, bhelgaas@google.com,
 cassel@kernel.org
Date: Wed, 14 Jan 2026 01:27:14 +0900
Message-ID: <20260113162719.3710268-2-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260113162719.3710268-1-den@valinux.co.jp>
References: <20260113162719.3710268-1-den@valinux.co.jp>
X-ClientProxiedBy: TY4P301CA0007.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:26f::6) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYWP286MB2282:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f1bd7ea-2635-4db4-c954-08de52c0a33c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|376014|7416014|366016|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZO/3Qkz74zp9twoIauHEtrn+7tEFXtFeWlPm/qNp/VW7Z3bkawznnjXNfcK4?=
 =?us-ascii?Q?y0mFQWzoi01Sarrdud2lIuFaIn3JkAigliKGOO5jRuzd1m7CnPy/2OkWf7A5?=
 =?us-ascii?Q?eFQnNVeCZlpp3LsJcuc6taYz/3gTJNADqo9xxidMMG2ol+4IKMqIebhKlyyV?=
 =?us-ascii?Q?+mZRTI42wa2h4t7mBhQg0gyaurT3WVKt39kyCTiEvD1hgIpd9SMol82jZtnf?=
 =?us-ascii?Q?5lXYboMIXDReL7j7L9IXbRhWo7F8yln8c22m3cstXaspCENsxWCfY8JkIpte?=
 =?us-ascii?Q?4mAY4l+Ytfvtma4ktwlSOGrIz5KIJ2rwFYIpOM/vQaHG+5e+ioKb794xN46p?=
 =?us-ascii?Q?/p0bsFtQkJjYU8H8rcmmODqspCZgiKlOWMGWlEg0JF20+SvCKpJrN7oN5Rd7?=
 =?us-ascii?Q?ve/O8+yIsoPKWd7yjWp70BP7dwO+dXpi4dWOspuGy8dDHPpWE3UGtytJn69Z?=
 =?us-ascii?Q?8ovo3YnL5VdyM3nCJt3mCzgGqvmSfQyRkgWaei8lN6aKQm2waisMYeYYy5fV?=
 =?us-ascii?Q?ATohGpfIfmdqcfBpPMksoTAKSSAgOozxAEjkxow9p25GmmGyBp85VSEv+ubM?=
 =?us-ascii?Q?jaKo+5jLIk3LcPh453NUkFEcPbMQjnjfGLGURhU9ZzNVJ+FT8OCySUAFrOf9?=
 =?us-ascii?Q?fJGEVRUbHDrLI9VlLlnZieZSSim2ipolObTY6M85acqhQE40s1p+7BLBv01e?=
 =?us-ascii?Q?0oCaDQTTNiDaL+XlzR6fy1ehJIxrqcItYXSGd6ksVh3bD2HL2BrLOsztswqS?=
 =?us-ascii?Q?uj/9RMpmaNj5Xhg1MjFZrvxvAav3GEBPYDwrAeanpn/hoz9Ps3SrRs+nu6lg?=
 =?us-ascii?Q?urTAZDgF+960hPQ2tTgS986OPTWS8i/fYoMy7w0pFRvYsvPBTtUTx/L2PUAn?=
 =?us-ascii?Q?xlwvFDalGLITbU9UwAoHr2+fy3W2wne8+j9NOrEa5yKB4a8oBFZXivYvI09h?=
 =?us-ascii?Q?LQddMU4Ff0zsN6rlAipozjjktAr2xPH+FwfOiGdzET+PKcx5omrv/OGzybKe?=
 =?us-ascii?Q?HGLo7sRHM8KWLiGf6og4NmbUBrX11ty8r4Bb8r5MTcfrARHihxhe649i5+C1?=
 =?us-ascii?Q?H2s/6QpVW5rF7cvE5b41SPy6UjPpXNMazGjTjEyT4jUMmSmINesVqHNKwNRM?=
 =?us-ascii?Q?6W2wxkvB5ltYHi5pbgXxXL4bxvxOX1iwOwonQo30Z/GO1pSCB9GxaEmrIJoU?=
 =?us-ascii?Q?HdZ/AC70PMHi9VVeimjkPSBD9Sjc9WVKwex+c1o+0ZYo8lBS+3jt8nLuPD0A?=
 =?us-ascii?Q?yHZVjfx0wvul5TDXWa250duGIoq0/8LGUkB11aJv0FC57tUcCHzVYPwNAkSE?=
 =?us-ascii?Q?IAyWlUK7K2MQA+eiuiKOLuN5oLPmlTcfRU4uiLXTfvPnXzd2kAPCfCc+jvhJ?=
 =?us-ascii?Q?RqfrzfTVXsc5pHEB+CQvKKKNaJZfaniqoOKlKaCxE01lDtlp6gWySqyAWrI9?=
 =?us-ascii?Q?YphchYFIFsxGq6xGM1qZKiIkM0tm8na2?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(376014)(7416014)(366016)(1800799024); DIR:OUT;
 SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Nd2zWny4POgf60S/vbRP6xi8Uuh/Pi5V+LUIQrWkKs4Gn0Cwj8DLEocOlXo7?=
 =?us-ascii?Q?9fCYW0gDomhfLhYlR1oyPKfh2JGLcHcDm0jHEK59ABY3XGL7jmHm84G/loiU?=
 =?us-ascii?Q?GJDV8z9Q+7uXX499A1r99uyAU1kNnoiNtZJbanwU8JrCom7XUU17DWB68g6y?=
 =?us-ascii?Q?36qgP/Y8F9C8K+PvTZQSCvi+eRMkO6GiMvTi6bUEvGo8/BWWY0ITDvY63HbJ?=
 =?us-ascii?Q?4Euriex8iIwlRg85xtMhlKSGUZ2ns49ChhlKPA8IY7TyngACbr/XHqbvV1/g?=
 =?us-ascii?Q?0kfiZwycPCClKzYDgQI8H5b/mphWg3NkRZF1pxpeOHU8TuoGkBv1QSt55eol?=
 =?us-ascii?Q?YW8rfvXucPOFXGbAJHSfgTkS/W7rkcWjrXvFJUwgaZ2JaiSRuwk7MtH1/ZZr?=
 =?us-ascii?Q?a2y9qLI+BAbA1AnsEE7O4Md6rf2A9Kwv10LFwQsMIK8lgAmCi9MuW6uUvALw?=
 =?us-ascii?Q?YRAVnAQLInNTQ5jBJ4d7BJ23AexTlaKDXWvvbDrpCrewcvHW73T42dpZazXp?=
 =?us-ascii?Q?Dex/2MgSGMcUBB9HaU3aPYpBY7x30Q2B/LXZ0riNPSV3ztsUlM6N6ajEldDx?=
 =?us-ascii?Q?lN/lpKTiiD4dcIUC0XxO3mP4v6oF+3tIZ8yNuRlPHvgiqBwtYiggRSFWDR9W?=
 =?us-ascii?Q?vaVyVaNv4WwAwrF58YTG+rI26WrIYTd/rZWyzdM47C8kxDnzAGZtnzvlgGgI?=
 =?us-ascii?Q?vjbUdIYiJYbpyijmgGSm43uHf7FNr3yXZBivTa+QDLeYMpxfgA3Zli6NPyY6?=
 =?us-ascii?Q?/zd1htpmM5efRL2k2VV4RU2zj0H06cBa+o70bMKZgGBflsxYKssnO3huQfIW?=
 =?us-ascii?Q?zijtSTnkvDz2SJ3BAxmDnW4A5Vt6aIduKTnOYzeoi8yXqjFpSnHwCgqBl0zH?=
 =?us-ascii?Q?vOYiPqXLpoEKBBmTZFKzaigpHwvF0ifVNgmv/OB1VMOBqMZZOkObdhMouKq1?=
 =?us-ascii?Q?c5qmBw2ia13DCSvkZ4DvzOVDexb12sL2kdFVDgdd7D+hq7gXPFLGMhH50rez?=
 =?us-ascii?Q?wwdCuByzVqWYDLwKgoN25nU1I6u7g66rPqIiAzp4bR/AWW2cjHTwUEbVJiv4?=
 =?us-ascii?Q?etZkA3GdnIIBwK815LX53LYY9833+TWUZXa5nWPAT/2VCDZz6TfQN2srxTlj?=
 =?us-ascii?Q?hV9aNbqL3dQ6BpnS8E+O2DR9LYQh7FCMJ/+9j8m14X2GzeF6iqtUjBLGiQgP?=
 =?us-ascii?Q?aiAdfliuRSSa/ORoQOyMfd7tO6SsdB552wfv94O5t5KKWRFn4d4dGR7maSmi?=
 =?us-ascii?Q?tvAuZxmBrjkluOx1K5u3yAK3W9HKP7KAr4f1rE0UjDmhQdgS3DayogfGXstG?=
 =?us-ascii?Q?HZAnXmeq4K5Eji5LVqmlbC+pDi0y13DHIHg+tN0Rs2KFXD8yl6q8d9WDhgJN?=
 =?us-ascii?Q?teo1aW6DlPzCVF/UgbYdMsDjZ5itq/eLecoLH8LkGSCvkhgA3yfyuUuzopc3?=
 =?us-ascii?Q?ZwCJLylfxpnZI+XuHn+MkKIhXUVDkORjIYuZZaQSfKu8QZBBsl7VflC+t0bN?=
 =?us-ascii?Q?5M/FePGqdSCbd7donU8FkYFC6/3ncVJetfBemxDYgnd979HUb5wn+QfOaPec?=
 =?us-ascii?Q?O06eiUtLr4c4q0+5rvCXIrTk1+ki+1Sl9ZOLzd0hc5PX5lMTjExbk7TBBD8M?=
 =?us-ascii?Q?VgoChlpgOK0DRAZGxarvM4kJbpRh0ZWETyoQtlWXiZSfHn5QkFZdt/+ThTBd?=
 =?us-ascii?Q?zeHJ5XHjeAAVXhpopuRCDGUO+3jY2rXejPIc+Cc/vtUPjrG40Iu3inCE36ek?=
 =?us-ascii?Q?Oq4Zo6wQ1eDtrKQVsf485LLplZYXrTwUfuskSiEa+al11SHMahZ2?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f1bd7ea-2635-4db4-c954-08de52c0a33c
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 16:27:25.9442 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DjLGdraOhWwAkOObX45uCu0hzNGXy4MiyXhrstj5sKWXY7kb3XiVNqMAhR3dtBlXswoHpMnO985WQcJtUHIpWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWP286MB2282
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
Subject: [Linux-stm32] [PATCH v7 1/6] PCI: endpoint: Add
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

Introduce a new EPC feature bit (dynamic_inbound_mapping) that indicates
whether an Endpoint Controller can update the inbound address
translation for a BAR without requiring the EPF driver to clear/reset
the BAR first.

Endpoint Function drivers (e.g. vNTB) can use this information to decide
whether it really is safe to call pci_epc_set_bar() multiple times to
update inbound mappings for the BAR.

Suggested-by: Niklas Cassel <cassel@kernel.org>
Reviewed-by: Niklas Cassel <cassel@kernel.org>
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
