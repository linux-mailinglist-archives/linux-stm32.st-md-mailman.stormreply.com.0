Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA48955F6C
	for <lists+linux-stm32@lfdr.de>; Sun, 18 Aug 2024 23:50:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 455E2C6DD9E;
	Sun, 18 Aug 2024 21:50:58 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010017.outbound.protection.outlook.com [52.101.69.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B7422C6DD9D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 18 Aug 2024 21:50:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=glhbd4ZT6H4F0mLAK5h1iT/cN2whUIEPxgOF6YPb/lNinTD7UJDeH41bEioClBrbtAU8HmKGZArFYhMVxK2E08b9z0qy3ogaV0tOX18RFEZyWl2xvl4/eKPyvAZQeC9YJ7iHg5vN4lxMUJkdhHxcLlsRAHXtlL55lEXiJecSdOrHceeGqasbpnYoj29U/ZAJCn2Ua/jlgUvj9/0mp6n12UiiDgph6lGYwkd0zVeio3/BSsPjJb/CfiGHOXz8Ks8xGR0vK1FSLdub9jDi9lF5g8ZZF5Y3k2SezqnXVGn6hhmawbFrnA0oMQqouTI3uRp2scs/HUktRlUev4qncRG2Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=riL7IzsqVcPW/+gfOKKOOovR33BBnPDeeIsjyUQFllo=;
 b=ywMkxmsO80bfH/oJkvoI2QlUnHcCDgKYBc67a9KfKFd50ydJtXc1Gx2CmK9rEoAU/jnLJUaWtD+N1roKfxk/2ivmd/RK5zALLneTDu35sYsDHWBk5eOII1uYVcb96PwbX8Eqfpqb9XeN+X5J/EbJEEr6UQg0Fr2NeGbRw++n2AbRm104OiQ3XlakBJvv+FUD7crNZAFd14BsLdpch2ZzWR5RLgxoXH32LN5CIkAjfIFCggtaN3AMrFMzkuWaW3HjHMwz42A0NFiAN2Nr10NdbIMx/LwVDbnilSwFBJ1437usJFBjtLmuFp6OPKYpZYNsqB7GJQQcSL0qL4fC8UBkbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=riL7IzsqVcPW/+gfOKKOOovR33BBnPDeeIsjyUQFllo=;
 b=kkx4gYUv+Z+TCEhnR4L02by23YhHvtOpFWjaJzzf1bXTqvKmWkNEzMRsUGI3KV3pM+UXWZPSiL61gGPWijPM3+ZeSa0gydr++qTo3VxzNicJyOOlqRi1wgsyTlZBUAX6jLYOU//xQGmuSHPnD/Sr7bj16m02XCD6/BxwKXHL2DBYsp1xNlW4gqaTQSItvlHIH0Bd44e+peRBQE0wE4UiNuXK/it2SafgJw9X3RaW6yIuSdz8LY+Ute8Y2/9S7SX2u0MXTZP0PIIzfq6/w/LWUvXwpL8CKm5gfW4URMkvyaWYBiFxxNOklQkWBs0O3GZ2brqsFJLtrdEojoGZ5xBsEg==
Received: from AM9PR04MB8506.eurprd04.prod.outlook.com (2603:10a6:20b:431::16)
 by AS8PR04MB8183.eurprd04.prod.outlook.com (2603:10a6:20b:3f1::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Sun, 18 Aug
 2024 21:50:55 +0000
Received: from AM9PR04MB8506.eurprd04.prod.outlook.com
 ([fe80::5f7:9bab:66a3:fe27]) by AM9PR04MB8506.eurprd04.prod.outlook.com
 ([fe80::5f7:9bab:66a3:fe27%4]) with mapi id 15.20.7875.019; Sun, 18 Aug 2024
 21:50:55 +0000
From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
To: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose
 Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Vinod Koul <vkoul@kernel.org>, Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit
 <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, Richard Cochran
 <richardcochran@gmail.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>
Thread-Topic: [PATCH v2 5/7] net: stmmac: dwmac-s32cc: add basic NXP S32G/S32R
 glue driver
Thread-Index: Adrxt8FapI9v/GsDS1qUz5lqcPWX/w==
Date: Sun, 18 Aug 2024 21:50:55 +0000
Message-ID: <AM9PR04MB8506DECD381225ACFB311329E2832@AM9PR04MB8506.eurprd04.prod.outlook.com>
Accept-Language: cs-CZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR04MB8506:EE_|AS8PR04MB8183:EE_
x-ms-office365-filtering-correlation-id: 55e642c0-b11a-412e-f0fb-08dcbfcfd626
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7416014|921020|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?qJQ5+gIBahzx5n+AdsNpNrHR6qnmfj0zIEsPfARewhVEnF2zpkcQZwmMy1TF?=
 =?us-ascii?Q?HM8NswU6n1+n6PO9dKnEwgGsMzgghPbFX6DxM628dATJTXLoUZD17NT5jfO6?=
 =?us-ascii?Q?kzeAKz45V2uMpuHAbLcQD53h9apSJWRbLuOniE0BjCdmAAePgljxjsQuY+S0?=
 =?us-ascii?Q?LJgtUzXCDESHOJJ+zs5r/78EmPRaxGFFbKHREeuClB8V+SWzdfE6BaNg4Taf?=
 =?us-ascii?Q?bCIX5FjUpbDHWunG3mI1PJBjx+paqVvgkUp05f0qCjke6yXMr9XleP+fE+Tb?=
 =?us-ascii?Q?7TYBDDNpGyX9YLFLLKlZt8NielIy3c6AzbN0OfJo495iIaLXWbyTkXHnwAoD?=
 =?us-ascii?Q?e0eLBZ8Hh75wC04eQloQa1EwAuu98rFR74xFfPzRtcyvc8FGnrNvYwv6fm/p?=
 =?us-ascii?Q?Uh6EpaSzjkPnqwcBxAGT9n6UEZAJltd2y494Cyh3kJ3I8hG8FEsPqLNr+Rt+?=
 =?us-ascii?Q?3FEzS2S4YGZRRCW7wfaYqKgIsBP4N3QXxh33FaUVB+A8D0KD96pWs1AaMwa9?=
 =?us-ascii?Q?cnxiAl4M1xIPdoSsKohJc4shJan5CKuRVF1+DiB8qF3bl7SppDI8nLUB+H/Q?=
 =?us-ascii?Q?4ERuOYZYBIa30fJBmQa1j5j+/LMAnQxkFf3viTah9ApTU+vNqNIXZZ4Pso/u?=
 =?us-ascii?Q?sZx+cxDYlIYbBxa6XyV2CWwfDyCjxFx6eM0LQu2XGu5siW1YO5GUVmYZ1sUm?=
 =?us-ascii?Q?qDoEcv06JjKsRXCrga4cFzvFzxiw1kFW7Tki9cpNsjXN+EnIEsCIj6F+BZSD?=
 =?us-ascii?Q?rBCrLaGC7k/VkgVIHS8r0ew++AfpCjrnOeHzsZN+xcmNfwvd/Oej8CWCvXg0?=
 =?us-ascii?Q?2Kd0mt/09AeQ21Ztf7Rj5YIx+RmZOdmHLNALIxsPq0qMj0wuYKVD9j9pih4+?=
 =?us-ascii?Q?iRRrZjLDlpNawLeTJobG9JGOFzFljWiUVoNVihEtoViu9jHEub23DlOFkLMj?=
 =?us-ascii?Q?DQ9CrKimyDLw/1JZMdXfqJBgCFtMkhfWiCL+o6hZB3ZkL21dcv1+8comyKRE?=
 =?us-ascii?Q?NDV2XPNJ2bKMMg2EQBRw26LMQgeFN+qZbuGgAMuvLnwRU7BtN478SnL+mF0o?=
 =?us-ascii?Q?tU7W++C7lsiSLj1gK8ZglciG+uTfpiRGlDvPhACrNB5m/0TRvuJKWUnTREfy?=
 =?us-ascii?Q?tFoPw3OgpWNhG8vi4ul0orvXzOXtJ9XZ7td1OR0ccVADpLNQgSC+dhKqUd1O?=
 =?us-ascii?Q?Lt19xH3nRBzyLNk/exBCmvxm8pI4YZ05tn+8NoLZJTTOVsjpGFCJ+Y1J71Rk?=
 =?us-ascii?Q?ZNOpaEnGEPEi5d1+JSZae3xxNVILlsN8P/A6cWkInMbI84d601R5+f2XafD9?=
 =?us-ascii?Q?H7v/88Mx0hFHcPprjb3N8n4sKRpZ+b3Nh+6YvYMFHzi682njSPmJu7E7i7wS?=
 =?us-ascii?Q?XZtIxhgJxfXqWwDdxVHeFoB7lTgR6bG3WI6Pc9DzK6kAKWIm5/D+3XREePf4?=
 =?us-ascii?Q?jhjnU27HHvY=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR04MB8506.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7416014)(921020)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?fDSTZxICpWMQBE//pcGu0AXTZzGOXWedKjhmd6Ch1C34dyBGeirlSwSd0fiQ?=
 =?us-ascii?Q?es3ygErCQueFs5aExnqBbV4fm2A8sup224Wz+kMgduxvZxFW6pLcc8dPsglk?=
 =?us-ascii?Q?NRQo5VtmbKFR4eYU3jXSvh9+vhuQk/A9AyO2To3Eg6DbjYCSS6BO9bTtlQJ9?=
 =?us-ascii?Q?wit+ynV61lZNsgTmV9MyEzivEJtcRwh0AL5azPqYvNnPKpJwXs3RE043SmGr?=
 =?us-ascii?Q?A0TPNl6yKQywOlbBqLg2z9pD7Uci7taCSNoDvuoimVfiiKkzJ7diVlbRi5GA?=
 =?us-ascii?Q?JVkC+PeuGcEjd6twTy+vnboC/HCb5ktmNXA3M0nFfn0HUn3yrPAMEF8W9ztF?=
 =?us-ascii?Q?yXCnZi7/D5zXEHMp+aNS+e3sFfs+8kiOzPytc2H4Ir/ZMiegqK5XmiOM7jXF?=
 =?us-ascii?Q?+qMmbg8hGFD6ZX63F7gXh2kKHRzyKbh7ZbNuAOZv+lmvmG/m1m/I95y54Clr?=
 =?us-ascii?Q?OKD5TmxQlrMdjDN5hqnZULhXphVs2Q73Kn+tqs+yZEoK3GLuWgyAYp8dwiMv?=
 =?us-ascii?Q?8YtUrGFKUlSsW5zbLj4NOQ6Cudl9Hka8LbzznoOjtG2AvQIE03SGgaHtdSUh?=
 =?us-ascii?Q?hC8xCEo5NSbwts+dzigNk0dQYYtU7t2XR4K9yQ2HW4ZalcQKZu4rQsVxxGK1?=
 =?us-ascii?Q?V8QSmBZ58Dz1YQnMjdxlPjzX/V8kt3tu/PLd3QIIYJxDXYciEYchMPThoqum?=
 =?us-ascii?Q?FD95iUW5BhVBRTP8lGw2C3jH7AeuOL82wPG8RR6zD3CuBd5ydeSnmeQnVnEl?=
 =?us-ascii?Q?J1eqx1XvkuqsR4HdSLgT6FotADu8g9ArK2/mzCW8hsQg+KiDATUVjf8aPYFh?=
 =?us-ascii?Q?Qh/Nw4cCVy/78xz29dRsY05N9PmNQgHokgf6xJ/e0nknFqt1vE/pYgOpEaY9?=
 =?us-ascii?Q?M/vj7TqJCxg/c3y1LAcHF1Byr6RqZnF1ZfpABJFy8Fh6O6+DYdecrychDRS+?=
 =?us-ascii?Q?QeImvQPA0fD50HtVoal+9jK8ZPpJzI3dVyq+V/6E+0cz7XWOHTJhwb04UNXd?=
 =?us-ascii?Q?AlAqUvYlQ/ocXYyY87ZwKrLXq+lk820b704lLPXZuhN1h9VNONI4HlD4gnGa?=
 =?us-ascii?Q?UYBiw2ybj9mbvahwVzzW7TwgPex3D8nI4wju1eMIPqSCKnIT99k3YTicluN6?=
 =?us-ascii?Q?UC43UKeOb2JJ/gtwMs6u9SM7jpkKnK1VGQjlvuJim0qNxK6SPf0i7JRTywy9?=
 =?us-ascii?Q?/U0OUg6j9hLh4yXPHK+F7kFnCibOQw15lNur5nAbF4GCSBbj5Z9Pk//IeD90?=
 =?us-ascii?Q?SubqT1mugnveUQco+EYvr6LYmi/U16arGCN/3/wNkgOoDA+936m2clufbdfj?=
 =?us-ascii?Q?mR6d3tkd35i90RMjJyvLCePSnkz4pCrGEbEkFWQf0FT+nY/pF3gkifBi1pje?=
 =?us-ascii?Q?TpMIcMW6PijzU9wNWkW3MgfRNYrKgUhhXa0MzQhS5iLzB8jFUh8VM2L4CdsK?=
 =?us-ascii?Q?JA1+goyMJMk0ky0VcFIqt8iZyjAqJW5sbkpnBXztUHQosFx7x5Sj0SVyYeVs?=
 =?us-ascii?Q?8gNhNfO3tvabmPEaBqJ0Jh9er9vfmcbhslgp8UyNFi1+hWrFgTDwzBUiKUae?=
 =?us-ascii?Q?G+AybJnYtNpvybNVlQBAeqbmET2ZbXImilcwIdcu?=
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8506.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55e642c0-b11a-412e-f0fb-08dcbfcfd626
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Aug 2024 21:50:55.1252 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ghAcSUHXXNpdfyAp5OZNxsWdj8tOdxQeTe7ARLfykZEfeADjDuzyySYBDgNYqQKoHycY2nfWtZviTrgye+d4SQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8183
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 dl-S32 <S32@nxp.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: [Linux-stm32] [PATCH v2 5/7] net: stmmac: dwmac-s32cc: add basic
 NXP S32G/S32R glue driver
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

NXP S32G2xx/S32G3xx and S32R45 are automotive grade SoCs
that integrate one or two Synopsys DWMAC 5.10/5.20 IPs.

The basic driver supports only RGMII interface.

Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
---
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  12 +
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../net/ethernet/stmicro/stmmac/dwmac-s32cc.c | 235 ++++++++++++++++++
 3 files changed, 248 insertions(+)
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-s32cc.c

diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
index 05cc07b8f48c..b2ba72a0b8dc 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
+++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
@@ -154,6 +154,18 @@ config DWMAC_RZN1
 	  the stmmac device driver. This support can make use of a custom MII
 	  converter PCS device.
 
+config DWMAC_S32CC
+	tristate "NXP S32G/S32R GMAC support"
+	default ARCH_S32
+	depends on OF && (ARCH_S32 || COMPILE_TEST)
+	help
+	  Support for ethernet controller on NXP S32CC SOCs.
+
+	  This selects NXP SoC glue layer support for the stmmac
+	  device driver. This driver is used for the S32CC series
+	  SOCs GMAC ethernet controller, ie. S32G2xx, S32G3xx and
+	  S32R45.
+
 config DWMAC_SOCFPGA
 	tristate "SOCFPGA dwmac support"
 	default ARCH_INTEL_SOCFPGA
diff --git a/drivers/net/ethernet/stmicro/stmmac/Makefile b/drivers/net/ethernet/stmicro/stmmac/Makefile
index c2f0e91f6bf8..089ef3c1c45b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Makefile
+++ b/drivers/net/ethernet/stmicro/stmmac/Makefile
@@ -22,6 +22,7 @@ obj-$(CONFIG_DWMAC_MESON)	+= dwmac-meson.o dwmac-meson8b.o
 obj-$(CONFIG_DWMAC_QCOM_ETHQOS)	+= dwmac-qcom-ethqos.o
 obj-$(CONFIG_DWMAC_ROCKCHIP)	+= dwmac-rk.o
 obj-$(CONFIG_DWMAC_RZN1)	+= dwmac-rzn1.o
+obj-$(CONFIG_DWMAC_S32CC)	+= dwmac-s32cc.o
 obj-$(CONFIG_DWMAC_SOCFPGA)	+= dwmac-altr-socfpga.o
 obj-$(CONFIG_DWMAC_STARFIVE)	+= dwmac-starfive.o
 obj-$(CONFIG_DWMAC_STI)		+= dwmac-sti.o
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-s32cc.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-s32cc.c
new file mode 100644
index 000000000000..8daa01d01f29
--- /dev/null
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-s32cc.c
@@ -0,0 +1,235 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * NXP S32G/R GMAC glue layer
+ *
+ * Copyright 2019-2024 NXP
+ *
+ */
+
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/device.h>
+#include <linux/ethtool.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of_mdio.h>
+#include <linux/of_address.h>
+#include <linux/phy.h>
+#include <linux/phylink.h>
+#include <linux/platform_device.h>
+#include <linux/stmmac.h>
+
+#include "stmmac_platform.h"
+
+#define GMAC_TX_RATE_125M	125000000	/* 125MHz */
+#define GMAC_TX_RATE_25M	25000000	/* 25MHz */
+#define GMAC_TX_RATE_2M5	2500000		/* 2.5MHz */
+
+/* SoC PHY interface control register */
+#define PHY_INTF_SEL_MII        0x00
+#define PHY_INTF_SEL_SGMII      0x01
+#define PHY_INTF_SEL_RGMII      0x02
+#define PHY_INTF_SEL_RMII       0x08
+
+struct s32cc_priv_data {
+	void __iomem *ioaddr;
+	void __iomem *ctrl_sts;
+	struct device *dev;
+	phy_interface_t intf_mode;
+	struct clk *tx_clk;
+	struct clk *rx_clk;
+	bool rx_clk_enabled;
+};
+
+static int s32cc_gmac_write_phy_intf_select(struct s32cc_priv_data *gmac)
+{
+	u32 intf_sel;
+
+	switch (gmac->intf_mode) {
+	case PHY_INTERFACE_MODE_SGMII:
+		intf_sel = PHY_INTF_SEL_SGMII;
+		break;
+	case PHY_INTERFACE_MODE_RGMII:
+	case PHY_INTERFACE_MODE_RGMII_ID:
+	case PHY_INTERFACE_MODE_RGMII_TXID:
+	case PHY_INTERFACE_MODE_RGMII_RXID:
+		intf_sel = PHY_INTF_SEL_RGMII;
+		break;
+	case PHY_INTERFACE_MODE_RMII:
+		intf_sel = PHY_INTF_SEL_RMII;
+		break;
+	case PHY_INTERFACE_MODE_MII:
+		intf_sel = PHY_INTF_SEL_MII;
+		break;
+	default:
+		dev_err(gmac->dev, "Unsupported PHY interface: %s\n",
+			phy_modes(gmac->intf_mode));
+		return -EINVAL;
+	}
+
+	writel(intf_sel, gmac->ctrl_sts);
+
+	dev_dbg(gmac->dev, "PHY mode set to %s\n", phy_modes(gmac->intf_mode));
+
+	return 0;
+}
+
+static int s32cc_gmac_init(struct platform_device *pdev, void *priv)
+{
+	struct s32cc_priv_data *gmac = priv;
+	int ret;
+
+	ret = clk_set_rate(gmac->tx_clk, GMAC_TX_RATE_125M);
+	if (!ret)
+		ret = clk_prepare_enable(gmac->tx_clk);
+
+	if (ret) {
+		dev_err(&pdev->dev, "Can't set tx clock\n");
+		return ret;
+	}
+
+	ret = clk_prepare_enable(gmac->rx_clk);
+	if (ret)
+		dev_dbg(&pdev->dev, "Can't set rx, clock source is disabled.\n");
+	else
+		gmac->rx_clk_enabled = true;
+
+	ret = s32cc_gmac_write_phy_intf_select(gmac);
+	if (ret) {
+		clk_disable_unprepare(gmac->tx_clk);
+		if (gmac->rx_clk_enabled) {
+			clk_disable_unprepare(gmac->rx_clk);
+			gmac->rx_clk_enabled = false;
+		}
+
+		dev_err(&pdev->dev, "Can't set PHY interface mode\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static void s32cc_gmac_exit(struct platform_device *pdev, void *priv)
+{
+	struct s32cc_priv_data *gmac = priv;
+
+	clk_disable_unprepare(gmac->tx_clk);
+
+	if (gmac->rx_clk_enabled) {
+		clk_disable_unprepare(gmac->rx_clk);
+		gmac->rx_clk_enabled = false;
+	}
+}
+
+static void s32cc_fix_mac_speed(void *priv, unsigned int speed, unsigned int mode)
+{
+	struct s32cc_priv_data *gmac = priv;
+	long tx_clk_rate;
+	int ret;
+
+	if (!gmac->rx_clk_enabled) {
+		ret = clk_prepare_enable(gmac->rx_clk);
+		if (ret) {
+			dev_err(gmac->dev, "Can't set rx clock\n");
+			return;
+		}
+		dev_dbg(gmac->dev, "rx clock enabled\n");
+		gmac->rx_clk_enabled = true;
+	}
+
+	tx_clk_rate = rgmii_clock(speed);
+	if (tx_clk_rate < 0) {
+		dev_err(gmac->dev, "Unsupported/Invalid speed: %d\n", speed);
+		return;
+	}
+
+	dev_dbg(gmac->dev, "Set tx clock to %ld Hz\n", tx_clk_rate);
+	ret = clk_set_rate(gmac->tx_clk, tx_clk_rate);
+	if (ret)
+		dev_err(gmac->dev, "Can't set tx clock\n");
+}
+
+static int s32cc_dwmac_probe(struct platform_device *pdev)
+{
+	struct plat_stmmacenet_data *plat;
+	struct device *dev = &pdev->dev;
+	struct s32cc_priv_data *gmac;
+	struct stmmac_resources res;
+	int ret;
+
+	gmac = devm_kzalloc(&pdev->dev, sizeof(*gmac), GFP_KERNEL);
+	if (!gmac)
+		return -ENOMEM;
+
+	gmac->dev = &pdev->dev;
+
+	ret = stmmac_get_platform_resources(pdev, &res);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "Failed to get platform resources\n");
+
+	plat = devm_stmmac_probe_config_dt(pdev, res.mac);
+	if (IS_ERR(plat))
+		return dev_err_probe(dev, PTR_ERR(plat),
+				     "dt configuration failed\n");
+
+	/* PHY interface mode control reg */
+	gmac->ctrl_sts = devm_platform_get_and_ioremap_resource(pdev, 1, NULL);
+	if (IS_ERR(gmac->ctrl_sts))
+		return dev_err_probe(dev, PTR_ERR(gmac->ctrl_sts),
+				     "S32CC config region is missing\n");
+
+	/* tx clock */
+	gmac->tx_clk = devm_clk_get(&pdev->dev, "tx");
+	if (IS_ERR(gmac->tx_clk))
+		return dev_err_probe(dev, PTR_ERR(gmac->tx_clk),
+				     "tx clock not found\n");
+
+	/* rx clock */
+	gmac->rx_clk = devm_clk_get(&pdev->dev, "rx");
+	if (IS_ERR(gmac->rx_clk))
+		return dev_err_probe(dev, PTR_ERR(gmac->rx_clk),
+				     "rx clock not found\n");
+
+	gmac->intf_mode = plat->phy_interface;
+	gmac->ioaddr = res.addr;
+
+	/* S32CC core feature set */
+	plat->has_gmac4 = true;
+	plat->pmt = 1;
+	plat->flags |= STMMAC_FLAG_SPH_DISABLE;
+	plat->rx_fifo_size = 20480;
+	plat->tx_fifo_size = 20480;
+
+	plat->init = s32cc_gmac_init;
+	plat->exit = s32cc_gmac_exit;
+	plat->fix_mac_speed = s32cc_fix_mac_speed;
+
+	plat->bsp_priv = gmac;
+
+	return stmmac_pltfr_probe(pdev, plat, &res);
+}
+
+static const struct of_device_id s32cc_dwmac_match[] = {
+	{ .compatible = "nxp,s32g2-dwmac" },
+	{ .compatible = "nxp,s32g3-dwmac" },
+	{ .compatible = "nxp,s32r45-dwmac" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, s32cc_dwmac_match);
+
+static struct platform_driver s32cc_dwmac_driver = {
+	.probe		= s32cc_dwmac_probe,
+	.remove_new	= stmmac_pltfr_remove,
+	.driver		= {
+			    .name		= "s32cc-dwmac",
+			    .pm		= &stmmac_pltfr_pm_ops,
+			    .of_match_table = s32cc_dwmac_match,
+	},
+};
+module_platform_driver(s32cc_dwmac_driver);
+
+MODULE_AUTHOR("Jan Petrous (OSS) <jan.petrous@oss.nxp.com>");
+MODULE_DESCRIPTION("NXP S32G/R common chassis GMAC driver");
+MODULE_LICENSE("GPL");
+
-- 
2.46.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
