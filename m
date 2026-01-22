Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EPQgMJTkcWk+MgAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 22 Jan 2026 09:49:24 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A706369E
	for <lists+linux-stm32@lfdr.de>; Thu, 22 Jan 2026 09:49:23 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8AFB4C5A4C0;
	Thu, 22 Jan 2026 08:49:23 +0000 (UTC)
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazon11020089.outbound.protection.outlook.com [52.101.228.89])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 12692C57B72
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Jan 2026 08:49:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qdf/JYHTz7fgPTrjm1MzvLubOOpQ72dw+64has5x6ZXLPiBTAM+1dbKXMuT6U+LRZB9w3t1+vpQgjQacyZsxZdrXKTToaYskd4N3RGSnkU2ohQBv8Dp+P0Q4ceAgZ2m5xRBT4bF6Wta/gQ/q4fsnePGKgxgq9U7YFlgvU4t5PMRne29HeGLQolJ85RS8PQQFkphqJimqR36QXOQ9wnr1bUZH/4KRsMpIoyW/V1TGWHmPtlIex0+8TKftu0d2pNDkW5tOoTiqV4RBHHhe3AZuVmE62b2C+aQM4g5XmglhLyUcV3E9fn8OflQmx0xQxVH7a1L5wj7p5UUaAbUGbAMwsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cc7PNXwsqrG1UZuUgPLY0U/x6PkZe//P+PHZOfj2ljU=;
 b=r8J4DfK9Exqum+wsYWTfyS60U/O5C/TUQdO1Yvwa6Xlppq2V8IFM3X5/ZrJ2dn89I2fJ+Vf7ogsyoav1+6GIzLFKhqvKLyt2rOEgxQyX+a+ZqWi0CivKY7Yo8OSRHzWO/idKc6n7vJ9mv7Dac/Ra3VpDxuL0gIANBORvGyIkH2ZlpN8b08IEteFrX3PedlCoWQq55dSfsjloBgTcR3fS811qZZ1jUiHGlNX5vK2m9cBsak9aOCf5uf2CB3FsWCURVZcyr1o5btnQjGN0dNf2kn6OWNx4SOpfHurv7Ve8TmbyVnm9+1EFdLH4hGaye0umOsgQ4n/cLa5IOkJvjK9VWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cc7PNXwsqrG1UZuUgPLY0U/x6PkZe//P+PHZOfj2ljU=;
 b=fRLcHDS9Vi6JlSIL6VGyjeq6aDJ7kvw7BfSzgGOQViSqPAtvx4mgxnAeujZfERYRml9Dv8lcWjNBpIIYUCxx1tWnMvZKS1Sii1JmSxIc9YZT4bl5vzqaC7DUXhanlIQlBRxSaQoDkBR+ThwAk2H8cdEqN8EL8F0UusPlmfbI+uI=
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
 08:49:17 +0000
From: Koichiro Den <den@valinux.co.jp>
To: jingoohan1@gmail.com, mani@kernel.org, lpieralisi@kernel.org,
 kwilczynski@kernel.org, robh@kernel.org, bhelgaas@google.com,
 cassel@kernel.org
Date: Thu, 22 Jan 2026 17:49:04 +0900
Message-ID: <20260122084909.2390865-1-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
X-ClientProxiedBy: TYCP286CA0323.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3b7::15) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|OS9P286MB6581:EE_
X-MS-Office365-Filtering-Correlation-Id: 5267aa78-e120-4e0a-4370-08de5993204a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|10070799003|366016|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ETHuRQRwQsA7bCM5NU1oLLGMVyNAlhWLFGy0B5i1Vf8E5GElAlgg62c33i/I?=
 =?us-ascii?Q?plkk4I3hcyXtRqps5Fj4FFomY+edXJiTWnkEmFEUe64yHyyZttNkCE8XXVKe?=
 =?us-ascii?Q?e0pQ+b0oA+HQty9d6hLJdeSxptrpLHaGIiU6AV1EZwfLvnQziUnH7NxPaI8A?=
 =?us-ascii?Q?sKCWptciKWj2TxFa7UG6neFNDQgZOn9wsI9ZAJn4lxYZH5iW2k0ERJsjA9tA?=
 =?us-ascii?Q?SlioROHuNJ76D07OQ97x7GZMiwf0SZzd8T39/I7xvb/K13saG11XU52rIDKS?=
 =?us-ascii?Q?lnkwxRpPCiS1BYh16eOfvp3/TKh/kx+sf4i/jUtyF/rQVLKDtg1vaYpwgLaD?=
 =?us-ascii?Q?h6NeMMM9K756tS5k+cb/7xBddouCHSDazCUFC9BDhKH1O/UPA772ZZwpyDPO?=
 =?us-ascii?Q?meR19+jrV2btKpyJP6mvhNHZ1xNpgiI824tttbQzup/PFelzbIRsi/CU2Yk7?=
 =?us-ascii?Q?+pAPSOwT8fm5gNdk8Hzmtk0BIfDugW4EkXkF4CTJjaD2oii7aM4lo8SbI0Vc?=
 =?us-ascii?Q?olENom0NLa+jFbfeL5YvZEorlPYoJsGXz2INUJn1QCm6PQQ6zfrznL9xohoZ?=
 =?us-ascii?Q?XGzMiS3TN7SJAUXGOd1jCspB6mkdZo+1NmquMcNIuQQxROExZAUHwhNGOKUV?=
 =?us-ascii?Q?HXpVmiN6TY3TTbbfX0u23eLHvyA7uJGWT0LjWXAnTXgFFwLxOTmq7e5l5T3I?=
 =?us-ascii?Q?tcAhy3JmILnhaJOhRmZHfVutz5a3gh+nRulBIK+ExgkzZmMnSaULgYN1iqjW?=
 =?us-ascii?Q?3+2tuUh7YqYGgdRhILqvebJRWZi07r2uIi+JVt2EoLGPoJupwUiVyW6V0EGL?=
 =?us-ascii?Q?guyB1AY8kxrOzahM2w+SfWB9NjzZolKzNs/ShgDPvkhHJrdtGuxM05vPQOxR?=
 =?us-ascii?Q?XGFXtS2aA10d+P+NJAUaEMFavMK7Sb9b0+Yz1c3iIym/Dsp6V2RQWe4mlzGK?=
 =?us-ascii?Q?tWbcMaj5sNOVQlQtWj2QZqAROYrnXG8qbFXW3gD+Q24FWiYYVrGoj+nzdUUk?=
 =?us-ascii?Q?0PdlF4M7G9ap5SjDAw/tQrPwYjDgLXThX7jGrhmXTTCNfK80ixOrLGb2fcAN?=
 =?us-ascii?Q?1tU5I3WZdUC0tTrZeqrIcQU5aM7vanCbAt8qKI8+iPk1hE/S255D1npfv8H3?=
 =?us-ascii?Q?fuW7ZXJs6PyRU6tqAV7x84pPcurH3EFLs7rcHUkQcre4P+43wOxuhsmCwldT?=
 =?us-ascii?Q?GNSOlDUPh6MgUQTGF45W7b7010dUhTRiKvFF2pf2AO5nyxg+2Vz2Ztk2Z+I/?=
 =?us-ascii?Q?4w9QTixFuJK/IfT1WPAbYlbDLDN863f7zbXo4HIVgqXv7YAfpq5AhZtqYK2O?=
 =?us-ascii?Q?9B57ClDlT6jPME6ugdPc/bk4T2EMAJJZ/VrdlOSlPHjrn1SDerHpHdR0tXDq?=
 =?us-ascii?Q?oWS5Lyr96+cTRWV6Bq5+PG9r0COJMUz5LM/QbQek3RuZitGBtQZ+QcgpqbZY?=
 =?us-ascii?Q?D5XsrzeWjnm4y0rQCjdpbvDxMpLS8rAZ2x0bVwk6uU3l6VqSEz/AvwlfTpWZ?=
 =?us-ascii?Q?PVpTQlCUcz4PlFiatzco0HNLqyEfeAmYjh9CoYfKJhH7Wm7wkzn1Ys1cjx8i?=
 =?us-ascii?Q?Ab7GLyh3d1elHc+VCvc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(10070799003)(366016)(1800799024); DIR:OUT;
 SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9UViOPS3aVlb3YyiirBFR/DtC9MuXqBedTzPpbFahB4np5xnzPUBN4qha9HO?=
 =?us-ascii?Q?kM8F9BdmECtx9X2MUdH9mT1sZffr9gFdvEwXp2ykPn7A47mavpm0ghVHkTX2?=
 =?us-ascii?Q?R9UN44uQFCUznXrrfgpn94jfCsK1v5WVNaDcRQJKzq4UjncnGTCre5mHiKXf?=
 =?us-ascii?Q?bEiVKC2CDdc2YKiRuwVBxt9hNTvqz26HB54cHGwkatCekCOtC0d1E/77/gHi?=
 =?us-ascii?Q?p3R8XNv9k5CR4qERud/hIVrCFOQrFP18YdKQMLmlZ2X3gonj2c60ZAnWAAWK?=
 =?us-ascii?Q?b16B499c1tgbCc0sESRH4yMnmRvyo5BhCKPIXFXg7/VkK+Wj1/mDwsl97VM0?=
 =?us-ascii?Q?bT9YIThliLXV/2Fq+P/WTKokJs2y9Vtr/lEcuyWTfTiuObzHKzb8mL13nE17?=
 =?us-ascii?Q?caUWwi6gKBErG9tt5HqYJl3vA5mMdbxq+9+G0xZias/y4mUKUu7Y733XEWoD?=
 =?us-ascii?Q?uiCcpj6YdGKdVwOhA10xQE83HFSymyMtJA7Y6eGTk2VQqqa++SbCQxF7vkF/?=
 =?us-ascii?Q?6UMTo76UDccQg7s0VTTqiR8rfU+aNhfDFQdOtGrR0kdXdb52D31/H87sIpQw?=
 =?us-ascii?Q?qZgpkHe35Av0nJj0GR0s2+hDiGyvxdyUv84QO6wlVZqr4qxFHlI3R35TN+pT?=
 =?us-ascii?Q?5k0za1lGl0dTZ3qsacOU+B8+FMH2G9go2FhvMQhfqB93k8sSyeautIHivyVE?=
 =?us-ascii?Q?zFYtCLZVP/swIvzFyYle3ZiKjcI2zXiP+qB1J8bKpeLOIya9kKX/ZGyx1HWN?=
 =?us-ascii?Q?SfuMX52SKtPwGH+zY8KPohDvgICNEAhO3PEkOdj0rTmKTbzgP2AzXk44QyKx?=
 =?us-ascii?Q?s8bpeEVFABFP/duuZOACZFzxSGAW1Rebj/b79gd1Cl/m9Pwl6Qq33vkrob6Q?=
 =?us-ascii?Q?N/846xJwa0lQSFW0tAs9qn0KM9eg5yOxcqKxgRneY8LEEf45gGLohYkeaRoe?=
 =?us-ascii?Q?j3CzX+NcfWkIe4O0wlvJ2iMQDkPqJ2XGs/1ZXhdqvIPJfLXxDPiiLqW7MSup?=
 =?us-ascii?Q?oNH8uQo9t6vbdJ6/Zu3Fijw2qgsAqr1fPVvo33dRFfbYTv0DWkUkrL9trOlo?=
 =?us-ascii?Q?FPpHhIJM7CywjB39ZWuuTnDbWSJ+feRxgEi/3lTPxzy2nNfcF1HPkhseUX0Z?=
 =?us-ascii?Q?XoB5eVAv3jZCZ1vnp8/l5WJeFd/vKSnpnaZvnnxUx8kW4ADo6xECUiXT5tMG?=
 =?us-ascii?Q?wzg0px9+qAADO5SGEF77lpJAkUdRRdIJnSitajuOYfTpGW0DUZ8QeNDteX3R?=
 =?us-ascii?Q?1n2rMaYHcA+RZuQT18KNZc2GwK4CxV883cPEhT3jFYqbpS2TKOQqK+wXRg2E?=
 =?us-ascii?Q?v5JXksB4JS2g2RtPw/nerN/kBox0L484huM6p7oTdgyDleZJFlUhrk4vDkID?=
 =?us-ascii?Q?DlDC/RQD1RP/gDSyOvDz3Lj5qlMA2QR0+HpYKoIxwl8uDab/6xMer0Zg4+eR?=
 =?us-ascii?Q?1e4RP+vhJnwe7+GWOsSgZwOv1lT5vrvCaAbPhZXZVBcB9+LgKjv+ESxAN7SY?=
 =?us-ascii?Q?yW7N+0yQ0tsXcyA3tcoTK2gAu9arfss432X44wnLCM7CGbrilhyqXqU6nXDZ?=
 =?us-ascii?Q?vOErrqpz7j54z+BCKI/pL357WfeEF3nPt/yji+Dwtt8gfz2mszPmgR27ySUZ?=
 =?us-ascii?Q?pqzyIIZeItBIg6b3KhTbUQN/VbxJqIED1EUZMFl+zzNOvBsDuU4tB+JxlQFc?=
 =?us-ascii?Q?KczREHFjSD3nhk5KGaWVQBnXGLbo+/BEfnG8A9IAbQF1DQpQwL6OEFNJ2CDg?=
 =?us-ascii?Q?xKzyq9+BVnD0GAfjuTg+eHpDXP2ASyhmB4mb7MdHkgclRNaxwu7B?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 5267aa78-e120-4e0a-4370-08de5993204a
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 08:49:17.1232 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xDFs+WKskWcBClcC+/tGMJKbgGskbeYAlrxa7JpjBY7hln+ukjVDNuWKwhQtdqU/2UfFs3kNRt9nbJ8HrhgrUg==
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
Subject: [Linux-stm32] [PATCH v9 0/5] PCI: endpoint: BAR subrange mapping
	support
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
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[valinux.co.jp : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:jingoohan1@gmail.com,m:mani@kernel.org,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:robh@kernel.org,m:bhelgaas@google.com,m:cassel@kernel.org,m:imx@lists.linux.dev,m:vigneshr@ti.com,m:geert+renesas@glider.be,m:linux-pci@vger.kernel.org,m:shawn.lin@rock-chips.com,m:Frank.Li@nxp.com,m:christian.bruel@foss.st.com,m:thierry.reding@gmail.com,m:festevam@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:heiko@sntech.de,m:kishon@kernel.org,m:srikanth.thokala@intel.com,m:jesper.nilsson@axis.com,m:hayashi.kunihiko@socionext.com,m:jirislaby@kernel.org,m:magnus.damm@gmail.com,m:linux-arm-kernel@axis.com,m:jonathanh@nvidia.com,m:linux-rockchip@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:18255117159@163.com,m:s-vadapalli@ti.com,m:marek.vasut+renesas@gmail.com,m:hongxing.zhu@nxp.com,m:kernel@pengutronix.de,m:linux-arm-msm@vger.kernel.org,m:s.hauer@pengutronix.de,m:linux-tegra@vger.kernel.org,m:linux-omap@vger.kernel.org,m:rongqianfeng@vivo.com,
 m:mingkai.hu@nxp.com,m:roy.zang@nxp.com,m:minghuan.Lian@nxp.com,m:linux.amoon@gmail.com,m:linuxppc-dev@lists.ozlabs.org,m:yoshihiro.shimoda.uh@renesas.com,m:linux-kernel@vger.kernel.org,m:vidyas@nvidia.com,m:linux-renesas-soc@vger.kernel.org,m:mhiramat@kernel.org,m:mcoquelin.stm32@gmail.com,m:shawnguo@kernel.org,m:nicolas.frattaroli@collabora.com,m:l.stach@pengutronix.de,m:geert@glider.be,m:thierryreding@gmail.com,m:magnusdamm@gmail.com,m:marekvasut@gmail.com,m:linuxamoon@gmail.com,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,valinux.co.jp:mid,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: E0A706369E
X-Rspamd-Action: no action

This series proposes support for mapping subranges within a PCIe endpoint
BAR and enables controllers to program inbound address translation for
those subranges.

Note: This series is a spin-off from a larger RFC series:
      https://lore.kernel.org/all/20260118135440.1958279-1-den@valinux.co.jp/
      The first user will likely be epf-vntb for Remote eDMA-backed NTB
      transport, demonstrated in that RFC series.


Motivation
==========

(This section is identical to my earlier explanation at:
https://lore.kernel.org/linux-pci/waapztvy6jyjqtfcoo3rbgvagi4z3p5afw6x2acgf5bxatcui6@nkodhtqqtetr)

The motivation for BAR subrange mapping is that some EP platforms
effectively have only two practically usable BARs, while needing multiple
logically independent inbound mapping.

For example, on Renesas R-Car Gen4 Spider, 64-bit BAR0 and BAR2 are the
only practically usable BARs, since BAR4 is only 256 bytes. epf-vntb
already needs two separate regions (config+spad and MW1 for the
data-plane), leaving no spare BAR. Adding ntb_msi requires yet another MW,
which simply does not fit unless an existing BAR is further divided.

In theory, some vNTB regions (e.g. config+spad and dynamically allocated
memory-backed MWs) could be tightly packed into a single physically
contiguous BAR region to barely make it work. However, it immediately makes
features mutually exclusive (e.g. ntb_msi / ntb_edma cannot coexist), and
the layout becomes extremely fragile.

Similarly, for remote eDMA-backed NTB transport, the host needs separate
inbound access to the eDMA register block and the LL regions, which are
distinct local address ranges. Without subrange mapping, the only choice is
unnatural layout (e.g. dedicating one BAR entirely to eDMA register block,
and another one to everything else that can be packed into a single locally
contiguous memory region), even when this is barely possible.

So while some cases might be made to work by aggressive packing, they are
already at the limit on platforms such as R-Car Spider. BAR subrange
mapping allows these features to be implemented in a straightforward,
loosely-coupled, and extensible way on platforms with severely constrained
BAR resources.


Patch layout
============

- Patch 1/5 introduces dynamic_inbound_mapping feature bit. This can be
  used as a safeguard to check whether a BAR can really be reconfigured
  without clearing/resetting it.

- Patch 2/5 introduces generic BAR subrange mapping support in the PCI
  endpoint core.

- Patch 3/5 advertises dynamic inbound mapping support via
  DWC_EPC_COMMON_FEATURES for all DWC-based glue drivers.

- Patch 4/5 adds an implementation for the DesignWare PCIe endpoint
  controller using Address Match Mode IB iATU. It also advertises
  subrange_mapping support via DWC_EPC_COMMON_FEATURES.

- Patch 5/5 updates a documentation for pci_epc_set_bar().


Kernel base
===========

- repo: git://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git
- branch: controller/dwc
- commit: 86291f774fe8 ("PCI: dwc: Remove duplicate
                         dw_pcie_ep_hide_ext_capability() function")


Changelog
=========

* v8->v9 changes:
  - Dropped now meaningless source code comments, which should have been
    removed in v8 (feedback from Frank).
  - Added motivation text to the cover letter and to Patch 2/5 and Patch
    4/5.
  - Rebased onto the latest controller/dwc branch (see "Kernel base"
    section above).

* v7->v8 changes:
  - Drop the explicit submap offset and use_submap fields. The submap
    array order now defines BAR offsets (gapless decomposition). Commit
    messages and source code documentations are adjusted accordingly.
  - Drop the no-longer-needed dw_pcie_ib_map and add ib_atu_indexes field
    to track iatu indexes used for teardown.
  - Move inbound mapping teardown into dw_pcie_ep_set_bar() to cover all
    BAR transition cases.
  - Centralize feature bit advertisement via DWC_EPC_COMMON_FEATURES.
  - Added a (epf_bar->num_submap && !epf_bar->submap) check in
    pci_epc_set_bar().
  - Note that some Reviewed-by tags are dropped, as the changes need to be
    re-reviewed.

* v6->v7 changes:
  - Added missing check of dynamic_inbound_mapping feature bit in
    pci_epc_set_bar() when use_submap is set true.
  - Addressed the remaining review comments from Niklas (patch reordering,
    splitting, and source code comment/documentation refinements).

* v5->v6 changes:
  - Added a new feature bit dynamic_inbound_mapping and set it centrally
    in dw_pcie_ep_get_features() for all DWC-based glue drivers.
  - Updated documentation for pci_epc_set_bar().
  - Dropped a needless and harmful dw_pcie_ep_clear_bar() call on the error
    path.
  - Fixed "Bar Match Mode" to "BAR Match Mode" in a source code comment.

* v4->v5 changes:
  - Added subrange_mapping to struct pci_epc_features and enforced a
    strict capability check in pci_epc_set_bar() (reject use_submap when
    unsupported).
  - Changed DWC-based glue drivers to return a mutable features pointer
    and set subrange_mapping centrally at the DWC midlayer.
  - Split the series into 3 patches accordingly.

* v3->v4 changes:
  - Drop unused includes that should have been removed in v3

* v2->v3 changes:
  - Remove submap copying and sorting from dw_pcie_ep_ib_atu_addr(), and
    require callers to pass a sorted submap. The related source code
    comments are updated accordingly.
  - Refine source code comments and commit messages, including normalizing
    "Address Match Mode" wording.
  - Add const qualifiers where applicable.

* v1->v2 changes:
  - Introduced stricter submap validation: no holes/overlaps and the
    subranges must exactly cover the whole BAR. Added
    dw_pcie_ep_validate_submap() to enforce alignment and full-coverage
    constraints.
  - Enforced one-shot (all-or-nothing) submap programming to avoid leaving
    half-programmed BAR state:
    * Dropped incremental/overwrite logic that is no longer needed with the
      one-shot design.
    * Added dw_pcie_ep_clear_ib_maps() and used it from multiple places to
      tear down BAR match / address match inbound mappings without code
      duplication.
  - Updated kernel source code comments and commit messages, including a
    small refinement made along the way.
  - Changed num_submap type to unsigned int.

v8: https://lore.kernel.org/all/20260115084928.55701-1-den@valinux.co.jp/
v7: https://lore.kernel.org/all/20260113162719.3710268-1-den@valinux.co.jp/
v6: https://lore.kernel.org/all/20260113023715.3463724-1-den@valinux.co.jp/
v5: https://lore.kernel.org/all/20260108172403.2629671-1-den@valinux.co.jp/
v4: https://lore.kernel.org/all/20260108044148.2352800-1-den@valinux.co.jp/
v3: https://lore.kernel.org/all/20260108024829.2255501-1-den@valinux.co.jp/
v2: https://lore.kernel.org/all/20260107041358.1986701-1-den@valinux.co.jp/
v1: https://lore.kernel.org/all/20260105080214.1254325-1-den@valinux.co.jp/


Thank you for reviewing,


Koichiro Den (5):
  PCI: endpoint: Add dynamic_inbound_mapping EPC feature
  PCI: endpoint: Add BAR subrange mapping support
  PCI: dwc: Advertise dynamic inbound mapping support
  PCI: dwc: ep: Support BAR subrange inbound mapping via Address Match
    Mode iATU
  Documentation: PCI: endpoint: Clarify pci_epc_set_bar() usage

 Documentation/PCI/endpoint/pci-endpoint.rst   |  24 +++
 drivers/pci/controller/dwc/pci-dra7xx.c       |   1 +
 drivers/pci/controller/dwc/pci-imx6.c         |   3 +
 drivers/pci/controller/dwc/pci-keystone.c     |   1 +
 drivers/pci/controller/dwc/pcie-artpec6.c     |   1 +
 .../pci/controller/dwc/pcie-designware-ep.c   | 203 +++++++++++++++++-
 .../pci/controller/dwc/pcie-designware-plat.c |   1 +
 drivers/pci/controller/dwc/pcie-designware.h  |   8 +
 drivers/pci/controller/dwc/pcie-dw-rockchip.c |   2 +
 drivers/pci/controller/dwc/pcie-keembay.c     |   1 +
 drivers/pci/controller/dwc/pcie-qcom-ep.c     |   1 +
 drivers/pci/controller/dwc/pcie-rcar-gen4.c   |   1 +
 drivers/pci/controller/dwc/pcie-stm32-ep.c    |   1 +
 drivers/pci/controller/dwc/pcie-tegra194.c    |   1 +
 drivers/pci/controller/dwc/pcie-uniphier-ep.c |   2 +
 drivers/pci/endpoint/pci-epc-core.c           |   8 +
 include/linux/pci-epc.h                       |   9 +
 include/linux/pci-epf.h                       |  23 ++
 18 files changed, 281 insertions(+), 10 deletions(-)

-- 
2.51.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
