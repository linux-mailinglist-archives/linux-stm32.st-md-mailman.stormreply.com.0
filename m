Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QAF7FvmWAmr/ugEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 12 May 2026 04:56:57 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D87951913A
	for <lists+linux-stm32@lfdr.de>; Tue, 12 May 2026 04:56:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 770FEC87EC1;
	Tue, 12 May 2026 02:56:54 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazon11013067.outbound.protection.outlook.com
 [52.101.83.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7F458C08D19
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 May 2026 02:56:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ljwebpQxParQKqTnSQpkYNpkxpqzBB5zXyggCQTFWMv4uMvRe6D1XxBhLx70ve3r8kD9aoFZoL6I0MlkDFLJQKE9Cy3dfDA8M7Xo6Sz56ORYIPM7z3ia+QadO+2YputWg5efzXRSlHUjcfeRS7b9vFazNQ6JtbY9Nul44pSJKmxpu64DtAH7INiAyzcfR4jnZ5mfPUPxnMrxli/u+kNuqqJrBarIL2uumwrtY0h5YuvvI+jSa4TiLEIrViFCxQmTd01QTO21YscY+5D5QCvnoMsqSDXlJcO4d4MeoNRFSNwpBgTDpXwjq4s433dy/EV4jDi2h5YlxmgBzW9rBZxyNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qB9Z1XISuE5TmIN+wzSo7EmWgnYHriGeI4H1K/EhnJ8=;
 b=eEb4Pyamym4ocKFJxNlp3bNJka+3HQZcY4ESB4xB3No+GRxLkD+N/RXVZYqbC+Bu8hnKA8DHTndg55+kIEp0S5t2Ea0RIGsiPL6OGPkZyZWAy5K7sxdUkrahYpUXRizvvJyroSkwIqOsNCScZ1NCSonYsxLmH4F5T479bBPmgfuA5dQEtNrqvyGK8XxIHn0vXdv4VA53Ka+4euBWlUtnJ28ASKH5EaQ7DhRnSJBbNmC5BG+zm/MV9PTM30DvL9tCK1ovPHZ7J4p/XAw5E3jS260G3XPdaIiF0wAw5TO0x4b36EqDCBHzgBqY+FS5ziastbCfz8DYqXcFlzzJGjwtJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qB9Z1XISuE5TmIN+wzSo7EmWgnYHriGeI4H1K/EhnJ8=;
 b=i0iMKBqDCDZ5li+h2EM3uIkh8Vs0s6qHfX3sH+quHmuZ2MF3Pjn6F8nZ9fGXIj/qLn3L/zpACEWCXaG/D+r/2GE1o2SjFSQgTNSd9eDdcm39Vm9a3UoON4USBqwvhigEwpcA2p3KJCKkYTPVK9tmrVTBTHNo1RSESldpDA5aXWN5HP+vJht7ZjLnjgqKujb+zR/wOc/0au/Bk+m/KOpKwl4+/bkZaDRqWU3o9ZMZW+IMxG+0xcsyeY7NyERdSztDFXgrN8caj5mVJqstmkds59M4bFVtq6e912gx3QwodZqhDn0Zc8udedKuIEjSKsTnFgMiBdbm3rzdHV4kq77CVw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS1PR04MB9287.eurprd04.prod.outlook.com (2603:10a6:20b:4dd::8)
 by PAXPR04MB9023.eurprd04.prod.outlook.com (2603:10a6:102:212::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 12 May
 2026 02:56:49 +0000
Received: from AS1PR04MB9287.eurprd04.prod.outlook.com
 ([fe80::6f30:763d:17d2:b79c]) by AS1PR04MB9287.eurprd04.prod.outlook.com
 ([fe80::6f30:763d:17d2:b79c%3]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 02:56:48 +0000
Date: Tue, 12 May 2026 10:57:59 +0800
From: Liu Ying <victor.liu@nxp.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Message-ID: <agKXN3Nmfqcdu8XZ@raspi>
References: <20260511165942.2774868-1-robh@kernel.org>
Content-Disposition: inline
In-Reply-To: <20260511165942.2774868-1-robh@kernel.org>
X-ClientProxiedBy: MA1P287CA0005.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::19) To AS1PR04MB9287.eurprd04.prod.outlook.com
 (2603:10a6:20b:4dd::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS1PR04MB9287:EE_|PAXPR04MB9023:EE_
X-MS-Office365-Filtering-Correlation-Id: fae848d6-322c-4c53-1174-08deafd21c4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|19092799006|7416014|376014|366016|56012099003|18002099003|22082099003|11063799003;
X-Microsoft-Antispam-Message-Info: i65/kxoFCtN8uVYhAkDIwx6i4aXCDz8yhOgmByjJxx8iqrRME3ifmpANzfsXijKEiIUm93iNUbooyZssin+4SeeJAYuDYoHNp8ruFz2SBCC+KMoUElkoBkR6UDyBwZwmfapJkD6026qbu6bjDVNPoUXWZd2tydBt1SfyxgVTcnEZQnWhG5hBAyZa+iVwICsXD+zjLq1oykP9Crxxqc25rzvog56dpuz7q8k9cQ6R1xj5+WS2WUa1ZJWE7Yw4ij4wg9WMag5xnSn+zAo/S9SchXbGhQSEpakiv4KWDbCoWtNQhGhZQXKXkiICROP+jwNffAbV0TNfSj2JHW09rKbJAH36a5b7y16wwsxJF+funirRN1YoJZ1F9GSMePKANv70k8Nmsd1pT1CMMd3Os4RYvClPwda9QyR0dnmpdkaNGS4sPP0zTXLBPPrd5HnUqrIVIJjEpel38TqLyE95/vhpTLl1KFh0WQQ7b4tOEunpngSteTjLXeIOzM+JHhxJrmxUCXR+y/601lISVlZcJ1lNBDCXa+vwfPEKp2QW5M0zsrtyQZqHEB5d50FgDs9XqsTCoRjP/1RvujCL157ODD1q/Tj3VoGwBJ863Ph36AnDWmHqUfRq0I6XGqjdrN0487G9kfqCeqv2IaSAQec/9iYlpdonSzjhUynUNY/rc/Wp15mR+uf2WdRltdVWsKPuZvwh
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS1PR04MB9287.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(19092799006)(7416014)(376014)(366016)(56012099003)(18002099003)(22082099003)(11063799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FqDaVSi8/2cSWzMoof3hJoHqJ8Akda0YefkoOhWp5frsAFmOLN/C40sMnJ1c?=
 =?us-ascii?Q?iRk5nLOKLDBaPZYEAaFqZ+6WNUqZsaBxR4NDraO1BCL13cWwK3CZQIAsWZyu?=
 =?us-ascii?Q?gx/vMJhVG5q3pi/XbkAOY+9UFJMOyaH7ck9f0E4pAU2RScfXjUngpLHaqHap?=
 =?us-ascii?Q?mfTQI+/isiCTfp2qJmtHobLvkoxpmQ25+kfb0oGQZ5wdvTaS/p3siGV8g8Cw?=
 =?us-ascii?Q?J+U4t2kAEXaDQWApPS1GQq2kl9d6xyCo6qMOjGFvixGQ4+Xfdi+PwiCPbpbt?=
 =?us-ascii?Q?uLz/g7zW5rS+RpyWzcNsMQO60a/qL32LMz2IFNrSK2FWtcXGwzbgd66nO6PX?=
 =?us-ascii?Q?kcGq0gEPqfHFFjaVdYp++dOw7gx/T5BPA16WMZLQSrhCtImc6HpfiS4uFAev?=
 =?us-ascii?Q?HdYP4pzffXolHjv+oKfguMm7cgc+2XG1QbmenQFn+Q5hActpPxB8afbolm2r?=
 =?us-ascii?Q?KGdK/zEeC+jN55hWBmjCep5/jqHbBpa9PMVJfmer5h5MHkPgPL8DQ6euVCVL?=
 =?us-ascii?Q?DuXUcjGTdk8EqDpjVhPqfOVJ15kdGiFtwogjZBN5/nKUJ59k151g5JotW+pa?=
 =?us-ascii?Q?2239PqNfYRMr1ThNBvSMcEXJS5XLkMrYN+JnUOoiLjvsX/zcqpS0GkZIGYgz?=
 =?us-ascii?Q?JDuVEIo/pqlfJp5dSq1s0uHzUSjiwDoztbZQAAWG+GHEBR7NZa3TPwYnbXuD?=
 =?us-ascii?Q?Dw/8XqvBu61rm5GKNAcG/kPNbROngtBN6TUE0HbXv8vHpzQ/GMO3pkEytMZl?=
 =?us-ascii?Q?DmY8o9knZ0d9BzeB3POofqZY32JA2bMvcTI/VvmN0UWw5wXqCezM8OuIgAzs?=
 =?us-ascii?Q?tw2fpkJxrbVnyuGGuYDUZjFkkVXDyfQE0NhzHVcWj99B8UWDHNeg5FpEBJrr?=
 =?us-ascii?Q?9Hunv2nfXSxE8xfr0DgY6M2bPBLuwm1m8+jh/w7DhmSaLZUEQhJP42LvFGwt?=
 =?us-ascii?Q?1UQqFXXqFscKWpNUWsRbUWlpN9E4JTMiluYAXRlMRQsMkS2Fk/LjXfVYROCx?=
 =?us-ascii?Q?Cv+fRzAxs8G3tffVvK1hX13EDWG8ZDHVaMmQCaLBz2ueeHGo86FH4jGQRaQx?=
 =?us-ascii?Q?8jNVua1Waq4jMKmaMg9SnqyuXoUPGsoWX7CqCf4Vg2PysRl4zArreDgrBdCG?=
 =?us-ascii?Q?KvW7NNy/cVMgmscLC7qtKUa6IiFmUF8RvHIJbUn7ZCrRTlKKcU4nBoMCweIW?=
 =?us-ascii?Q?sgzJmAFy+/HAgN3zBR9u2zjvwCgtorj29wz3bAtxaUxOalaeNAQQPBRlgaLy?=
 =?us-ascii?Q?x+B7ZgYaCnJNK7r/9IjIu/yPPmMy1H6AXwNYd7JFy25PKH6Qa9nhHTQ15CXZ?=
 =?us-ascii?Q?FVlB9n4sVsSasOZVSJSTucLquHOtf6qaLFiyjrDt51JpZgCrYf2Hv2bvB26X?=
 =?us-ascii?Q?wuPSz0e+vK/Rbl0ohQJA+PBSiLSJXJGfylhNFM2VZPv75BzYrjeiNd+AHBR5?=
 =?us-ascii?Q?+GK1LY8YFRx9FGfPexkusYOxKTmOdG3lpFCHUUCzdXY4pxR40HEB5HfPY1/p?=
 =?us-ascii?Q?oNjT01A9vVCIpPuELU7Fv42bdXH7MmfNYRLTFaRCs65ezYS74qWIayTiXdti?=
 =?us-ascii?Q?UFElTtQjNfVl/TTDKkr7+i6HhH9eQ9gOnNprMJwB3jflijZSOYQiJfM4Gqyl?=
 =?us-ascii?Q?ot7ZZiUPK8dOaca8lg6Xs+2/O8uVEQCE9Ra/1r5vpVpRtu5ZE6w7YZ/c85Xo?=
 =?us-ascii?Q?dsqR51RTJ3xjzx1kEY7HTfMQCoH9AHgXcPwfeM7/ZBpmQpnNayr36b6CkNbX?=
 =?us-ascii?Q?54DsVfYq8g=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fae848d6-322c-4c53-1174-08deafd21c4d
X-MS-Exchange-CrossTenant-AuthSource: AS1PR04MB9287.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 02:56:48.8907 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ujWXCB0yCLO6GHxiUCgb/xLJDnkArGspbiq1fTy9hRS7tcGIMY11BXjON09xMtd+4uLGrsCR6DShxJtMKl1wmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9023
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>, linux-remoteproc@vger.kernel.org,
 Heiko Stuebner <heiko@sntech.de>, imx@lists.linux.dev,
 Tanmay Shah <tanmay.shah@amd.com>, Frank Li <Frank.Li@nxp.com>,
 dri-devel@lists.freedesktop.org, Mirela Rabulea <mirela.rabulea@nxp.com>,
 Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Suman Anna <s-anna@ti.com>,
 Fabio Estevam <festevam@gmail.com>, Mohan Reddy Putluru <pmohan@couthit.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Simona Vetter <simona@ffwll.ch>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Sean Paul <sean@poorly.run>,
 Jackson Lee <jackson.lee@chipsnmedia.com>,
 Parvathi Pudi <parvathi@couthit.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-rockchip@lists.infradead.org, Ben Levinsky <ben.levinsky@amd.com>,
 Michal Simek <michal.simek@amd.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Hussain Khaja <basharath@couthit.com>, Paolo Abeni <pabeni@redhat.com>,
 Konrad Dybcio <konradybcio@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 linux-media@vger.kernel.org, Linus Walleij <linusw@kernel.org>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-spi@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Roger Quadros <rogerq@kernel.org>, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-amlogic@lists.infradead.org,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Nas Chung <nas.chung@chipsnmedia.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Roger Quadros <rogerq@ti.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 linux-kernel@vger.kernel.org, MD Danish Anwar <danishanwar@ti.com>,
 "Andrew F. Davis" <afd@ti.com>, Jessica Zhang <jesszhan0024@gmail.com>,
 Vinod Koul <vkoul@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>, dmaengine@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, freedreno@lists.freedesktop.org,
 "David S. Miller" <davem@davemloft.net>, Felix Fietkau <nbd@nbd.name>
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: Consolidate "sram" property
	definition
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
X-Rspamd-Queue-Id: 3D87951913A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.89 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[nxp.com:s=selector1];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	MID_RHS_NOT_FQDN(0.50)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:akhilpo@oss.qualcomm.com,m:linux-remoteproc@vger.kernel.org,m:heiko@sntech.de,m:imx@lists.linux.dev,m:tanmay.shah@amd.com,m:Frank.Li@nxp.com,m:dri-devel@lists.freedesktop.org,m:mirela.rabulea@nxp.com,m:edumazet@google.com,m:netdev@vger.kernel.org,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:s-anna@ti.com,m:festevam@gmail.com,m:pmohan@couthit.com,m:jbrunet@baylibre.com,m:simona@ffwll.ch,m:detlev.casanova@collabora.com,m:andrew+netdev@lunn.ch,m:sean@poorly.run,m:jackson.lee@chipsnmedia.com,m:parvathi@couthit.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-rockchip@lists.infradead.org,m:ben.levinsky@amd.com,m:michal.simek@amd.com,m:ezequiel@vanguardiasur.com.ar,m:basharath@couthit.com,m:pabeni@redhat.com,m:konradybcio@kernel.org,m:khilman@baylibre.com,m:linux-media@vger.kernel.org,m:linusw@kernel.org,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:tzimmermann@suse.de,m:neil.armstrong@linaro.org,m:martin.blumenstingl@googl
 email.com,m:linux-arm-msm@vger.kernel.org,m:s.hauer@pengutronix.de,m:linux-spi@vger.kernel.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:abhinav.kumar@linux.dev,m:rogerq@kernel.org,m:broonie@kernel.org,m:linux-mediatek@lists.infradead.org,m:kuba@kernel.org,m:matthias.bgg@gmail.com,m:linux-amlogic@lists.infradead.org,m:robin.clark@oss.qualcomm.com,m:mchehab@kernel.org,m:nas.chung@chipsnmedia.com,m:kernel@pengutronix.de,m:linux-arm-kernel@lists.infradead.org,m:angelogioacchino.delregno@collabora.com,m:mcoquelin.stm32@gmail.com,m:rogerq@ti.com,m:lumag@kernel.org,m:mathieu.poirier@linaro.org,m:lorenzo@kernel.org,m:andersson@kernel.org,m:linux-kernel@vger.kernel.org,m:danishanwar@ti.com,m:afd@ti.com,m:jesszhan0024@gmail.com,m:vkoul@kernel.org,m:p.zabel@pengutronix.de,m:hugues.fruchet@foss.st.com,m:dmaengine@vger.kernel.org,m:krzk+dt@kernel.org,m:freedreno@lists.freedesktop.org,m:davem@davemloft.net,m:nbd@nbd.name,m:andrew@lunn.ch,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[victor.liu@nxp.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:-];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCPT_COUNT_GT_50(0.00)[75];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[victor.liu@nxp.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,vger.kernel.org,sntech.de,lists.linux.dev,amd.com,nxp.com,lists.freedesktop.org,google.com,somainline.org,gmail.com,ti.com,couthit.com,baylibre.com,ffwll.ch,collabora.com,lunn.ch,poorly.run,chipsnmedia.com,st-md-mailman.stormreply.com,lists.infradead.org,vanguardiasur.com.ar,redhat.com,kernel.org,suse.de,linaro.org,googlemail.com,pengutronix.de,linux.intel.com,linux.dev,foss.st.com,davemloft.net,nbd.name];
	NEURAL_HAM(-0.00)[-0.510];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:email,stormreply.com:url,nxp.com:email,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Action: no action

On Mon, May 11, 2026 at 11:59:36AM -0500, Rob Herring (Arm) wrote:
>  .../imx/fsl,imx8qxp-dc-command-sequencer.yaml |  2 +-

Reviewed-by: Liu Ying <victor.liu@nxp.com> #fsl,imx8qxp-dc-command-sequencer.yaml

-- 
Regards,
Liu Ying
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
