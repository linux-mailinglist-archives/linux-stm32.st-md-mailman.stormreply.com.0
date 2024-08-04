Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA69947079
	for <lists+linux-stm32@lfdr.de>; Sun,  4 Aug 2024 22:39:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1733EC7129D;
	Sun,  4 Aug 2024 20:39:36 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11013020.outbound.protection.outlook.com [52.101.67.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2D8CDC71290
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  4 Aug 2024 20:39:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IE1EAoxMsmCMzHNdNSlEKBP1J6ziTPCQi8xDVYUkwVdIUN0ynJCkZCVzfT+x9LggDkpSGaVDCUohfY9p1dwEXr4XB6Kfj0uusUpZnoFm8GqJ5Ph3GD1viTJzaSygFSxc77x9jveRaQwmejTs3Tn3WNdeO43arY+TRAfMq36XscSbXoIXYKyQDPkWE6Eis3cFVoPefZSmBmePxHVLLYoWy7aXgsqz0pFzyEyhqz2l3DkRXbwWGsz7U8BFEbyY/gVmybmWLx71Z+jAkAzJAi3uBJ5AvwCyLSzq3hxXRktT4x5NCGginvxodUBEophdrwrBvJlZwAmYbMdnUoKwDKe/Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gUu5pbyXRjTd/6NStP04iFCQqXnqi2s9NTNiu7QWdjs=;
 b=ir+DjPDXEFm/PsldA3mehP+/iv2hlBKuWTcZi5tLCQEi4zib15H3gnktEEwkrjhOtyISyi/Od4lv/+kq9oL2MbjDu71AB00Y6gP2tI9PDTNkIvytdTk19lmtJb2w9F6waQySCwSlPcOjPA76k4O2gBuw4jEYP3EIlblBAT012DMAqNYA0GE99xs+wzrsPQIt4GPMLhNGgHA54cndmjpkFLwqzjS4lCwUChrOcJN8rcagRf3UlrpLQYbQ9cEwtiBIjmlXh9ig+UM5xrMsD7pRhNnEKYtmdenZiav8Vq1yQPjHqQUzBoZf8ZoZ9DDf0C9U/Wa4GZxv4dEMGu993dI4RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gUu5pbyXRjTd/6NStP04iFCQqXnqi2s9NTNiu7QWdjs=;
 b=p4xgST/qoXVeG37ZHbSNuDW+rkQBrkskVBOQtkm4aOuNygcUlYGeGCV87IONZkEjXaoJltGoY6skoNP6ACGJrDhUsGi8zmxzxlBwOavV6FIGYlzccesbp0J2cdaQlmTFcEFzLORiJCBJ4DPzIN1FJux0PzZgVsQRd37dx3poHOVHtHwgVhjJiK+z4w+0oV1C2GzpL8fIJvyyq5DSDKdUCQx782RTPuwouEfFH/aUIX+oaLJjtnkJ8U+pI3hMUY3+tde+1LOodQE/Uj+Ok1yqbLqU1JbrcOJ4Zna/tTPTukoTL7EzojmYQD7+5dNPiwmO2FoUEHaAnveoAbgmki+irw==
Received: from AM9PR04MB8506.eurprd04.prod.outlook.com (2603:10a6:20b:431::16)
 by AS8PR04MB8596.eurprd04.prod.outlook.com (2603:10a6:20b:427::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Sun, 4 Aug
 2024 20:39:26 +0000
Received: from AM9PR04MB8506.eurprd04.prod.outlook.com
 ([fe80::5f7:9bab:66a3:fe27]) by AM9PR04MB8506.eurprd04.prod.outlook.com
 ([fe80::5f7:9bab:66a3:fe27%4]) with mapi id 15.20.7828.024; Sun, 4 Aug 2024
 20:39:26 +0000
From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>
Thread-Topic: [PATCH 0/6] Add support for Synopsis DWMAC IP on NXP Automotive
 SoCs
Thread-Index: Adrmh82HhCYlBOqeSieajd3V15CcHw==
Date: Sun, 4 Aug 2024 20:39:26 +0000
Message-ID: <AM9PR04MB8506436F08F151DD5858BBABE2BD2@AM9PR04MB8506.eurprd04.prod.outlook.com>
Accept-Language: cs-CZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR04MB8506:EE_|AS8PR04MB8596:EE_
x-ms-office365-filtering-correlation-id: bd6ff6aa-c44a-4abd-1e41-08dcb4c58820
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?kKwSaGNOdmAqtFM4hz/X26oNwG0kQ/2/CAAVF33TD9D3RIDTkbVIFbBkC4fz?=
 =?us-ascii?Q?g+Pbn19vo9muAUPF1ZZWUaFjSSRBTIn1Y7inEa0EYoF1fHwFg7kUi8YyMVwg?=
 =?us-ascii?Q?0wwTHQkScwo8Vt09w6ejTrwI+FEs+fOGwwwUr4GzDUZkxf49CCkoa6g9GHLt?=
 =?us-ascii?Q?5PJVZfQyBPRFoY5lnKE7G2TFtxRips/TGAhjGuTuhXFho3AdFxxiNdVqIISo?=
 =?us-ascii?Q?L/v+UudtvRIyd5YB0/GlqP4Rbwl7kcMA6mztSV75sUa0xi4/Bm2qfY2N43+z?=
 =?us-ascii?Q?T0NUAcbaJ2D1vkJ45TXhROamMlPhv/HBpxMtYmlSp7op6ENe/uoC8fqDwp+K?=
 =?us-ascii?Q?GZGT2rpaGnR+BTluVYAT6HiduRL79uYqZrJ+lU5t4w8kbx2RxGlFsT3AekEj?=
 =?us-ascii?Q?1J6sDfB9RgYprTyGOoUr5cRRFCXPeLV4o7FCwtsl4Kbg8d+bIAy9aCU0VhaT?=
 =?us-ascii?Q?FFk2cylMuUuhEKFATdOmP868IwS3rkWSmpDu3vYLG8tze1g420Baivtn37Kh?=
 =?us-ascii?Q?kOlIbRzhz8903hOy3se8FggisjFKz+iKylZaSeErd809GWSmm9KeRW++iPnp?=
 =?us-ascii?Q?Rk7g8I9dJdoP0lDnQ2rTr3HijUy+zB5bD9falextXHvyf33tXvwJ4gKtj4Vz?=
 =?us-ascii?Q?5L2FuR9elzw+uzqCdJpgnwz7e4kETI83Nl601y4AXMoh/Yg0T0IYfpKt1EUE?=
 =?us-ascii?Q?PaocBoO/iJMRTAZ7+oGurmz/nLtAdUHEGhUdTdOOuN+lvVYMAT1Z3sbk8D3t?=
 =?us-ascii?Q?wvyfO2uZBAdn9CULMUqaPWOwePe/vsaN63nrKcSdRY8h5Po1OJ0yiGtGxMQk?=
 =?us-ascii?Q?cmofcyO1FHavo0MGaeidtp5Wkx26YqArHPyVMZqYWyx5Vkfl4623jIonjU8e?=
 =?us-ascii?Q?l9dNYaPHRbwi3nYezMWMukCxFjICso3nX5doLYwqvFBR4rY9sskP6TLpqEMj?=
 =?us-ascii?Q?7tO7f0C+RWZYxmYILddDv7mQ4mM3+VlbsAKAOlO3iTyBaD1wFIx4wzSTMHIz?=
 =?us-ascii?Q?Hs9Mgfs3m1vu862S7C9BmCu3I/e8EpBuLUybO1BiFcbUlalRJm4MmZg7rlnm?=
 =?us-ascii?Q?V5puhD4Ymv0TbFK6MbXkppcGRcW+p5mcTuARAUHj78jBvyisd4ocZil0PHhI?=
 =?us-ascii?Q?SwBx5xfo/emMItkN+BbZXJMNZX3dUX4zfi282EEfTLFqRJmZBLimFDRSJ4DU?=
 =?us-ascii?Q?nfZwk29YqmelY7kM3DTDTq3jOjL0YuW/Wjzonbcq8mmKo41DGUjD9S856r6E?=
 =?us-ascii?Q?tFwkcHnOM9ELMaf80UdGlvYCNV3mcY+QTO+p8DBtkzdbg+dqxZ8LNjKoojEA?=
 =?us-ascii?Q?mF+vqQ3xE3v3gYgnFsTRBBClpVwQekA9ycctAHpqa1hsSyXxEn7xGHdPB99a?=
 =?us-ascii?Q?6n2a+Fo=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR04MB8506.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Sc43xUEVlyL507UGcCbnhiQexbxh+KQ+2noHV1/gbgNyGqmYNmrAlZ2rDol3?=
 =?us-ascii?Q?coav0PjNOaIycFapa/o1HNqjhaOwwW6BsFdWgl2RCO/Z0VaQCYJI9UlHEfHR?=
 =?us-ascii?Q?k2VCBqN4AVAdr9YqqUW0zPUwgIgp/lMLb1JXZwfnikWo/ItWGRCgqAVDPaYo?=
 =?us-ascii?Q?Bq22zaWgjWwblnfWvOUdcq5H4BL6N6UOwko71A20OiPQ4QFO7mu2V6QFxfxF?=
 =?us-ascii?Q?rZw62cbbtbdMfWx2rDJoEMM6mUKrshaqF0etvlH9ePZ4d8aob07hSnblu761?=
 =?us-ascii?Q?emGftfx7CxK1CeDmw0iDF9bgzDoPMO5J1cI8yhocamth2IwtCCIxBshBu6Ff?=
 =?us-ascii?Q?VHbTB5xONQSwfxjWS+V3xqFLGlf37HP+i+iEL48fje0u4vgspFh/AiIv1r5J?=
 =?us-ascii?Q?mUfBrnFpSt6PTbG5F/dxkhh+oNr4Fkb9VoFl6yEkkrQrivfBzBjpxoNpaiWg?=
 =?us-ascii?Q?q8/TE9ESLBhvY7t9M9wyJKpic6vhFDjeoCOWN58yQFY/8PJsyMQdp5dhdy80?=
 =?us-ascii?Q?Gr8KhyHn4tEgFxJ0o2SVQDPIINZ0sTyAYs/XCRBnG4J+/+6hqU+Uz0s9XCzr?=
 =?us-ascii?Q?rdvaWt2Pl+6w0Cn1jl9oh5qdfuMp4+WtgeqRKHc93U9vyaEztxVn8g07yO/j?=
 =?us-ascii?Q?+D3MFn3SNO0NNBM3Sycdh9VB8s5SS0Op9pFS3/uP8WMaoAlxpZd4KJMwanfu?=
 =?us-ascii?Q?VO9HqFVQJew4rzQtFcks0odBDpYHfh0ovIUztf8WXOg1k+Ehk8i7cHfrr5D0?=
 =?us-ascii?Q?qQuimBXfZfXMAcpPtHVs0r6hvnUf+OmkVamufGqa/duRZXr3Alwg7LLJ9Wub?=
 =?us-ascii?Q?XTS4WNY2nGPpGa6Ek64UMblTt8/QUieA7cgTGsoYhIhnlsQ9dAaj0OWJhbKU?=
 =?us-ascii?Q?O8uBztrwI+iS/SSC3EbEZiGfTTHWe+LT0bkTO14LpFM+I9jSMgE3Lw66ti+D?=
 =?us-ascii?Q?fPvC+ZAzgqf0WcnK8jX86Oqv0uouf5D/fmDZ2fSSh6NYrK+1DF+vts1/LTR5?=
 =?us-ascii?Q?luaM2M9EUM5B9sDBpmzcngdRKQv8BK4aSP7DBW3FacU+PU+MPrcg9vxP2oR9?=
 =?us-ascii?Q?wA2jN3KFed20JtmkpcdnjLnhXVTuiU/TSx4lLLTXeLw/Y8zXunOqY+b0SlNi?=
 =?us-ascii?Q?QucmwdqCsuc+wgVjQrqv9C5schs8SAAYkqzynaPOABWy65VaSrhs9sozJi0O?=
 =?us-ascii?Q?ThIv5iOY7HwjS7NVE3i3Sg0ZK/JCVZlKemGEzbfsUbez4h+0ujuZkRaV4otP?=
 =?us-ascii?Q?IN8DNU3KWR7J9JxzPk05p8EslxSfGzsnt3t7dYt0bT3iOexuaSUvTBnUloS8?=
 =?us-ascii?Q?/3OvxmlD0UrGxAqn8AgE0UW+Eim4IkRBfX/hz0B7gOhOO0wnAmpnaYyQJ+m3?=
 =?us-ascii?Q?zoG7DNR02OX/rAbGWYjez9hdP82I5NyZZ1gyFtD6xCZNLnjFfl6UMyi28hJm?=
 =?us-ascii?Q?1KQy3nGmVye7zb9OZnjbkimjwil0ZnsXcLjpOsDUj8/VzTDONGGa3F+AmwIn?=
 =?us-ascii?Q?guXYockpSsncMefjNqrfyxHc91TakUEN/VSS/CEmRWT9MoGemfTHWhnP9tzB?=
 =?us-ascii?Q?OUC8Q9ppik9E6j6YvzmMVIoXYArbxxyOs7ks16bC?=
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8506.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd6ff6aa-c44a-4abd-1e41-08dcb4c58820
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Aug 2024 20:39:26.4655 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vdhvCzWie3w77ssLFHZyTFq3tOhCcai/5Y2s8SXLUuDdCX/si6vDjBELa9NCFf+89nqqorQFFVIzxmFNuIJv+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8596
Cc: Claudiu Manoil <claudiu.manoil@nxp.com>, dl-S32 <S32@nxp.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>
Subject: [Linux-stm32] [PATCH 0/6] Add support for Synopsis DWMAC IP on NXP
	Automotive SoCs
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

The SoC series S32G2xx and S32G3xx feature one DWMAC instance,
the SoC S32R45 has two instances. The devices can use RGMII/RMII/MII
interface over Pinctrl device or the output can be routed
to the embedded SerDes for SGMII connectivity.

The provided stmmac glue code implements only basic functionality,
interface support is restricted to RGMII only.

This patchset adds stmmac glue driver based on downstream NXP git [0].

[0] https://github.com/nxp-auto-linux/linux


Jan Petrous (OSS) (6):
  net: driver: stmmac: extend CSR calc support
  net: stmmac: Expand clock rate variables
  dt-bindings: net: Add DT bindings for DWMAC on NXP S32G/R SoCs
  net: stmmac: dwmac-s32cc: add basic NXP S32G/S32R glue driver
  MAINTAINERS: Add Jan Petrous as the NXP S32G/R DWMAC driver maintainer
  net: stmmac: dwmac-s32cc: Read PTP clock rate when ready

 .../bindings/net/nxp,s32cc-dwmac.yaml         | 127 +++++++++
 .../devicetree/bindings/net/snps,dwmac.yaml   |   1 +
 MAINTAINERS                                   |   7 +
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  11 +
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 drivers/net/ethernet/stmicro/stmmac/common.h  |   2 +
 .../stmicro/stmmac/dwmac-qcom-ethqos.c        |   2 +-
 .../net/ethernet/stmicro/stmmac/dwmac-s32cc.c | 248 ++++++++++++++++++
 .../net/ethernet/stmicro/stmmac/stmmac_main.c |   4 +
 .../ethernet/stmicro/stmmac/stmmac_platform.c |   2 +-
 include/linux/stmmac.h                        |  10 +-
 11 files changed, 409 insertions(+), 6 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/nxp,s32cc-dwmac.yaml
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-s32cc.c

-- 
2.45.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
