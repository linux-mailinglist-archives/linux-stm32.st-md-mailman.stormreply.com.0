Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 860FCD164C5
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Jan 2026 03:37:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4D67EC5F1F4;
	Tue, 13 Jan 2026 02:37:28 +0000 (UTC)
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazon11020120.outbound.protection.outlook.com [52.101.228.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1C4A7C01FB5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Jan 2026 02:37:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EtQ7/IoNGXXW8JUaEQVs7hfhxIQmyv4rAJTGHe7gOUf3H6S3dCdPCcVh75nIo6z5t/luyD25LchiE8gfFW1ozhBpVMIhDenPzfvgpA2gzwwruUBzSG8D0n0uCjhWTB2ET5hsbIfnQknJiWtqdJss+FxTmBI/bHyvV+NWx5OlnyasdCrpa1ross9LN/hFurHWZGidLzAfYwM6ACGGPn9UkXb68z8q8iUteiMUGve+tL1ds2qsQplbiQFvnMCNH03mLgafRSCWXzbtN18Ln/zu57ABJtL1sv8iwqses23JE7llnoLxdP0I/Vxt/sa+65KeyoLFcKeTpjOSNqG9p/rJNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZUGKPfc5SQEz2nXOjs0xNNqkbV3jEd19ya1vxAtf9Dg=;
 b=NVxPuyYr6S8JGXHZinrYRgZprlzEBtUWqqNFszd2GUlCCnNrpbH9GgEq/ngB/RdKUO1U70DX/VBflbn8RxfTsqMxTmY+2c0M7mCBTvduowQCd+SVYAGC3uJ6tF6k8L4UaT0icWyjT9VDjaHy1bKCRczGzX7ouqYVsnKBsafTGdCc/fSTeLFBFHExrMsC5i79ISNrlyA4gK/dA3/FaFERFuWgiqJul50S1Gjuzp2yXQFQon9gFUxipZyoDdPamM1AkpF3OaS1tg0ASFNVfCRNsaSM07E+0vJFoSFpYtyd3TxJeCFYERCHaWrVh6SMfZWSl0R3+Z642Ui8SE4gy10w5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZUGKPfc5SQEz2nXOjs0xNNqkbV3jEd19ya1vxAtf9Dg=;
 b=lWHoTrGWuQUegCarKc6ZYjbyeXxlmHPes1uXwKpuERb247SwiE58xO6A9MUCSKaK+Y8UkFTVMapWnk69ciNBsOt0bWY7Fnj3CTgP3RpETVUSkby02MKNXdEDP2k1Yihh8EV6it9Gixeua98iDxboQvNJXzdyDdmX7JHxESifQn0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TY7P286MB6708.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:323::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 02:37:21 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%5]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 02:37:21 +0000
From: Koichiro Den <den@valinux.co.jp>
To: jingoohan1@gmail.com, mani@kernel.org, lpieralisi@kernel.org,
 kwilczynski@kernel.org, robh@kernel.org, bhelgaas@google.com,
 cassel@kernel.org
Date: Tue, 13 Jan 2026 11:37:13 +0900
Message-ID: <20260113023715.3463724-4-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260113023715.3463724-1-den@valinux.co.jp>
References: <20260113023715.3463724-1-den@valinux.co.jp>
X-ClientProxiedBy: TYCP286CA0332.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38e::18) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TY7P286MB6708:EE_
X-MS-Office365-Filtering-Correlation-Id: d208ece4-705a-43e9-e854-08de524cad3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|10070799003|7416014|376014|366016; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?L2DETf9F+94ikJ900Pge+JN+neDd88WoeEaVs3xKOMId4WRU7JzxhLXIT3C1?=
 =?us-ascii?Q?NVrj8UKyVTB6KyKAKL6VYYjBDmEhb5gmct4vatkW/6hR60LIGtBnPowBOavX?=
 =?us-ascii?Q?J7UAiDV72Hg5UhbsmuCNsBt2pD0Xz9VJ5V8KpY87aXr6dC8MTFa7ZmKPlXO/?=
 =?us-ascii?Q?LvKCd234i0Bu+LiFrFulz52KlxKEY084nuB9pJB0xj/XiBHoASos7U75sf47?=
 =?us-ascii?Q?EZryvLwrns3t5Dc/xhjJuQmXdL7XORXiacL5llM6e5XrZgSMJSK0GNESjddj?=
 =?us-ascii?Q?Qf6GyXB0wppk07dIuzNLuwlaiNujJCHMCLx9BtElDplxrYW+pDu06gjNy0CF?=
 =?us-ascii?Q?bkhdHcaBnVTm9Qi2wLl/Q4rmWDFmJ4SZdk4BUPpUZM9EQTjTwfsYlCY6nLJX?=
 =?us-ascii?Q?jggAaLlVn1127Gls2J6RPXOIUK1ueoock5rd5CMeBvIbWSM/5FediwfyHwFn?=
 =?us-ascii?Q?eVR0dPWnNcgH+MJ+K0FYAZ1QrcuL9KZo08UCxy5iY6VeVxSmIZxcfJf3rrBA?=
 =?us-ascii?Q?0DItgQ7UB8qrr7fs1xj07pzHoT8K4xSbSDC7PdNcA3JLOMe4DVaP6rrnnKdf?=
 =?us-ascii?Q?8EIWowD3T5Kvp6C2xry1QRkCfBZVELlS2wa8DjUqRrW0FMKSe0u3yt+aZFnH?=
 =?us-ascii?Q?37qgIjkqxMFQ8fzZ9AVMGihOG+pWD3nQjMyLQuIch47CWMyx6TN9t7sUc6zQ?=
 =?us-ascii?Q?IuMF5Jx1qONiRUPxJPgXtHBUeB+5nyzxA03ZQegsoGegq7iW+58bVzxaL9x1?=
 =?us-ascii?Q?Rq0XV173KPMf6OEQdB54iUCVwGP1GgbWHQNOIP+g+0l5NtI11jymSrBlXGuT?=
 =?us-ascii?Q?5x6Xluf4BYvaUs/jmtwtf0oLNs29JYWPXJ5jnxAqyGw6DQFz2YcnofSoy3o8?=
 =?us-ascii?Q?64SUGlB0+9zDfo7yppJqUzoDV14iOG0Woyie1AuxDr1EHk7AQKHFlRD6IWGM?=
 =?us-ascii?Q?loLuxpGyAillgq/2XzpGGvaQIYL7MOax9DCwZNMu7yl+5WH+mwPf3huwu7U7?=
 =?us-ascii?Q?FvEDtx32xtninUgZzQomj6tTGD/RPy0eBr6rpHttZYbEeEegKRVm4KIENRCD?=
 =?us-ascii?Q?sXE5rh7TVDUtiKpVpbO6vBMWzjUQ0djPNDWtDKwyIXMfdkgl4hJsNfbaP6RI?=
 =?us-ascii?Q?JMX9CIk4EZzVO40KEEZsZ52Oo0UbxBdu9c8A49SWiUpUh2F/T1g8oRNySk2q?=
 =?us-ascii?Q?rPlrdQYkqukeCyZul3TV3LegydFTPE7ziaQkr6QVr2g0XkC7DvQesLbYPs0g?=
 =?us-ascii?Q?TbebPy9HIKwQq165XnEhJta93a5HxadGklS2gakBe7mrDHbdHteOSgrVOKd1?=
 =?us-ascii?Q?jQippubjlS99vZ7nwYPQY/fztqnXSV4SXxpUt0pLa2Iu7hNtwDXQz/x0TGDJ?=
 =?us-ascii?Q?2J9GTpWarjO2oL8EglPYi0zwA/HDCIDedYzp+Ekkoq3Ekk9FDpC2RSvR17v9?=
 =?us-ascii?Q?MnbLMrUwJn6QEsLhbO2oa/LTbUOhvmcO?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(7416014)(376014)(366016); DIR:OUT;
 SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VZxY/8RKFQSoQA+hbU58b1lnQKExfBm8Ec4vqHDCDIaVXBmwV5f3CtRHYVRZ?=
 =?us-ascii?Q?82x2bWMhgAX7wdIBj2Vew+c1Qzm1J7Itq5X1ZBNBvUraB2nHSR905grto8fp?=
 =?us-ascii?Q?9RdCqWCr0HX5v3l/p4422oh3+FyQpfVjYWPwS3Xp9Sok5IKABwcj44v74kH0?=
 =?us-ascii?Q?RYzuqbo4bzQfOwlfO2f4MX9RzbnCcgT0eZjAnk2VO2HXyCssxhvSRQ/fvvCO?=
 =?us-ascii?Q?RMi2wpnwBchKNcuBMEfNVtTotXoSAk2Ny7/Z6jrd0aWuWJ/wcHPUsNBFgBPY?=
 =?us-ascii?Q?MQpDTPf3XK/kGSiIuKKJ1t2gYXM9nHvqgMTstIHfHE/AqJbQGgBtaQmjFAP5?=
 =?us-ascii?Q?eMFsUMr7FuX8mTTyK+UF0Yv6kS/GULdyobEzSeSt7o3xXoQeFxFXTy6Ug7Ip?=
 =?us-ascii?Q?5GAC8xI6weWsumej9VJFA3QqUMGNFxCAojFitEhWmrBW/zOVTM/mOwBDi4Gg?=
 =?us-ascii?Q?P587kimIY0aWtV3e5HRB9BGTAt+//FLD43OcZXXH5Txhc0pOBSpvbnMaotvt?=
 =?us-ascii?Q?qK1koGjZbtx5si5umSXJrFCDCH9tD5Cyb/r6DCGj3O54Oe4rFVpM+bB6GbIl?=
 =?us-ascii?Q?m5V4Tso3dPPYvnjz+dmKYPxWnCJYxUvjnHPVU0QDKNZ2GWWK7OMK8bgneNwI?=
 =?us-ascii?Q?FYJMZkB9+Uy+8T5XdzBj4XHVFIJewaKaua9v/mMioN6mvdReqflTxLQ1/Utu?=
 =?us-ascii?Q?x0xv6pCT7D/V9sPiQwRqaIYY5Ui87/6+VBW2CB9VE/PUUTjjUXSM3ntDzLMU?=
 =?us-ascii?Q?p3f4bqgpGVWv/ZBlz/dvdhvHo9m/1bJODFM3UBPClIW5bE1fOuvlPnJ+e1P4?=
 =?us-ascii?Q?pCSMVcj6wZmS2EyKsYLA5g43rNjzqZEhZJMb2qkS6nAfkL95Is/QkQUO1sPK?=
 =?us-ascii?Q?21BfIsghHnVb+tOJdnHT+dabJKufu5X+NWxnXIvLbK0dhA/xkst/exMKBXnk?=
 =?us-ascii?Q?RGLOnNwJvUFNs3N7sQ70UuDh6QMEgoFbF0TbKa9KYPKOwziIY+0lWYRqA4/1?=
 =?us-ascii?Q?Fd2wLlWaEh5UdTRkELiXyEbboMCOotjWE6fbKbFhKY027DtuKwbnT7e497/Q?=
 =?us-ascii?Q?mHZQWJVTrKp1f9WNuzvSGm7RoTKBVPNpqkEJOMCpme0rYObWeqjWWCjVsNYo?=
 =?us-ascii?Q?7C1BGPTgRd5VUWlNUisNu+U054mKhRDddVL7d11109MU7w9bRbizkIQlmUCT?=
 =?us-ascii?Q?ygyqWjcGLk4s+Vl/NVnR9TXWuGeI7bzwsthb6JZzKIhUpTu6x7IOluovzKgM?=
 =?us-ascii?Q?T6weHf+vMwGaoDU+LsP7OFqz3nGHZIk8r/0ueK3qz1Fo0W5PUIOqIVxWVQFF?=
 =?us-ascii?Q?HG5rTALZFQkmVHdmkh/jIVt+BQ8p4NdRShU2NYHzorHxFOR7rSh51kDrSzJh?=
 =?us-ascii?Q?ZomeIJ9p6/YLPdUebf6hwJo/axStiavj3U1WGHQlcuRXMjyJN0muDRTFSb5w?=
 =?us-ascii?Q?TtBf0yoYu9Ojk2WzSCzfGG5tFI2auigoOMVQ5HWPCASRanA63pVmS5H45SWE?=
 =?us-ascii?Q?H9PGkto2D2PHyV3AXbcA6lCoUpDAFwIctZ+bmyYM62KpaLGU2UqQOCRsRFVv?=
 =?us-ascii?Q?Z4Hynd5PcgV50rDnMyS1U6U0tdI+Kd/eTb/CvRRkQNwb01s6XmkHqtApiK/h?=
 =?us-ascii?Q?KgR2bzud8YajK3RgJvTzkb7Iw5YkiQr/JLoPnAyjbILwcfWZOyc8gVGsysWy?=
 =?us-ascii?Q?j6qtcgQWrfQVcpBEf7JB9Q+m9nhhf5D+ZVsqu/Jiv5+oX8RT3joftC5K6nNb?=
 =?us-ascii?Q?QMtB9XwZAvN68ABxCuZyh0ruXGfsk37DrAPqK3eSNqOdnmwf+bT8?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: d208ece4-705a-43e9-e854-08de524cad3e
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 02:37:21.2102 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uj65fX7Cj3ZbddCURZBUngHPfxLAW8q7JVIfjmnO0h9ek5x883SdfL3zINC2ym5uAqVp8OfHCxUQ0yXKJcdu2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7P286MB6708
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
Subject: [Linux-stm32] [PATCH v6 3/5] PCI: endpoint: Add
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

Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
 include/linux/pci-epc.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/linux/pci-epc.h b/include/linux/pci-epc.h
index 898a29e7d6f7..3655abe023c1 100644
--- a/include/linux/pci-epc.h
+++ b/include/linux/pci-epc.h
@@ -225,6 +225,10 @@ struct pci_epc_bar_desc {
  * @linkup_notifier: indicate if the EPC device can notify EPF driver on link up
  * @subrange_mapping: indicate if the EPC device can map inbound subranges for a
  *                    BAR
+ * @dynamic_inbound_mapping: indicate if the EPC device supports updating
+ *                           inbound mappings for an already configured BAR
+ *                           (i.e. allow calling pci_epc_set_bar() again
+ *                           without first calling pci_epc_clear_bar())
  * @msi_capable: indicate if the endpoint function has MSI capability
  * @msix_capable: indicate if the endpoint function has MSI-X capability
  * @intx_capable: indicate if the endpoint can raise INTx interrupts
@@ -233,6 +237,7 @@ struct pci_epc_bar_desc {
  */
 struct pci_epc_features {
 	unsigned int	linkup_notifier : 1;
+	unsigned int	dynamic_inbound_mapping : 1;
 	unsigned int	subrange_mapping : 1;
 	unsigned int	msi_capable : 1;
 	unsigned int	msix_capable : 1;
-- 
2.51.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
