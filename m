Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 75529A8B70A
	for <lists+linux-stm32@lfdr.de>; Wed, 16 Apr 2025 12:44:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 36FEFC78F83;
	Wed, 16 Apr 2025 10:44:25 +0000 (UTC)
Received: from OS0P286CU010.outbound.protection.outlook.com
 (mail-japanwestazon11011000.outbound.protection.outlook.com [40.107.74.0])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1E065C78F81
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Apr 2025 10:44:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WBnRP2k3uSEaRRXxAB7GbqAGlMgCNF4LzrtYsH2wgTc4ed8lXY6WhlnSOZERCFPhw0I4mPJcYbuz1GMBxAvJifP0g67LuRYBbaVqhxH5g24HRBwPs2Tr/ZfmrfOcrDOa3oyIcRGqMSF38vN2zmA7qDgNIYEftY1XZJ+nzYqHslBHLWijhluiRojthdEDdD6gEBHYHNMZO3aWpm2sZGL4Jf1umzvzh9/ajt6aqhhUBCIZ+yl/jceiLRZCx2rnC+/Zy9ccLFo7+98jeUn/TAUnCiZzKngcF1RDGGrPa816sclHrebSOPev7Z0L4jxko8e9qD0V9c2sPUMGBlcyCvCFDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pxGFu46gdHo7Y0ps9pDiysNJuFFTEUBm2iFP7pSkQGQ=;
 b=PR8ZI+4sbdFu/KzTGRSV6AnJ5rbInXvupb+hXgErZbsLHMVEZ90OgHO5S4+daBfKSMhBaONvlSAUYGAymna+TeTrhF/V0BBhTCA/jAhl7Yc6AGEysKZm0M5ERMGlsgagQeo2fo/hMb17DN6gJYaOQjiSjRaEP3pFQWqZLjGhIqi7zOm5b7jCWmUAc727qB4+AWjHaaTGUioJqo946aToqDFyyPMAhT6uuowTtvBZ1pLxpJxOXFjIoU9lnSL+Bk6nieQnf/ukvlGdWwAJ/A/bS3VOucjL2AGWli+6ALjtluivqTx/w/8X7VN84+uyM7HhYIcJVYgZ2iEODg1jZKojpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pxGFu46gdHo7Y0ps9pDiysNJuFFTEUBm2iFP7pSkQGQ=;
 b=BYfbWobJbH+73YIPkl+5KipDTS5A5rTOQC7ccKjEHWqj10gkQIlApX5Gpon7vC66NDXEQVKYh6w7pun7Wlzas6O9HkwzJ9g5E1gmeOXQuxm2PFLdxycGYhtYMEtLnIujgsQp3lDOOPC4htd6ublwiRrBRGEvfo0yVBOW029vNfw=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY4PR01MB14085.jpnprd01.prod.outlook.com (2603:1096:405:20a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.30; Wed, 16 Apr
 2025 10:44:15 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8632.030; Wed, 16 Apr 2025
 10:44:15 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Prabhakar <prabhakar.csengg@gmail.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Richard Cochran <richardcochran@gmail.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, "Russell King (Oracle)"
 <rmk+kernel@armlinux.org.uk>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Jose Abreu <joabreu@synopsys.com>
Thread-Topic: [PATCH net-next v7 3/4] net: stmmac: Add DWMAC glue layer for
 Renesas GBETH
Thread-Index: AQHbrrv7I2E/fII5KEOw4dyRXO9jArOmGtvw
Date: Wed, 16 Apr 2025 10:44:15 +0000
Message-ID: <TY3PR01MB11346266349649D5E69923BAC86BD2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250416104015.47788-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250416104015.47788-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250416104015.47788-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY4PR01MB14085:EE_
x-ms-office365-filtering-correlation-id: 2e0d90d3-a347-4f86-6e36-08dd7cd3a1ee
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|38070700018|921020; 
x-microsoft-antispam-message-info: =?us-ascii?Q?3ky/LmWXuqXvHozUS/im3nlaVtkKMYy3a2pCRQicWnR1rOyq7cXCvEoXUWRb?=
 =?us-ascii?Q?1tT/cqTW+hgRggdtTagN/7zVH/iAj0OVdZLVy5xDyxmN/JHDLCs5fR9X2b0O?=
 =?us-ascii?Q?CjgtIqHRNS8mVvNc3fF47mvw/RD3+WzYXG+65PIv+WiBademHNxfx9ODmx+6?=
 =?us-ascii?Q?HrPwQ9T2TFUuRIzvO8gUE0oj9715hcMXzGI8Omd1h7WVxCpUpFFDbGrv60D6?=
 =?us-ascii?Q?uOOjEurJFe+oUckpktfr9d9sX4FZuuvC63JV6QtkvY41/veRHgIUnps9x0vI?=
 =?us-ascii?Q?AKndjtmjmhhUyqTBW0MWWQSpLdCR4Sjrq3yPRDfCK7Hecpf5B/tBYK/X127+?=
 =?us-ascii?Q?4DbzlSaO3xpgqmhCzFNSQZRedDXD155tSDoYWS/bbtwcMzbbDnwkIfwnoklF?=
 =?us-ascii?Q?wjUCpkyr7r9UPt2lKyJbi7aAOfofr/Fee+Er3hmHHuZrVWuz/MQJVWHfiNSi?=
 =?us-ascii?Q?kfTDk/F/qTdq/hXc6dzBYkfNJA8V+meNn8ONWxrh/m/VNqJyGaXxsvdCAvre?=
 =?us-ascii?Q?u5OghrZPvV4Cyu70tRHL00R6vXb5BhR9BGenc4WrmJ5QnHr5k+bLktU8q8ZD?=
 =?us-ascii?Q?wjcjQQUVkhHYb/vLLQuFepJujBR3m4wFfvjj43mAmgTkKDcRA1AGTaBscykU?=
 =?us-ascii?Q?Rmtlv6B0yiuY8f0CQwCGDrRL+m+dp0KZTuNfXlMNeXvOqAeWyW9ZtMmXaVLk?=
 =?us-ascii?Q?0KW1197Xax1pXBjyozK7vPf0b4Rcc5Z9hJ8RAzCDGz1VV1OxzemPGwxZ+zEm?=
 =?us-ascii?Q?zgsBPIMHVvW/s7CyCE83odFgjJ2Vec8xu6Ii7ncDksIr2H2NW/i0vDk7d0uW?=
 =?us-ascii?Q?AcA5h3jMBa0z9y18ni4tfGRKkkdeJoCkPeYMIlWxAjfTLsYTX+B9dn8Ixuwg?=
 =?us-ascii?Q?nCDouK1G9uyHpuWkp9zNH+h1GCKiIWTq7XqwpOMv9OvrX4Bi7GU+h8XdEXWk?=
 =?us-ascii?Q?MESV8jpXba/1Ss+afASVRApybewpsPnqK9Yw4O5Bm69+GGa6rdrxqXqPqj2q?=
 =?us-ascii?Q?H2vT8URIrfEOeXKRI2/tstBLzNFaqFREr+o3jHT28HCrUbb8eXFdbEpKNtOe?=
 =?us-ascii?Q?6ayWN8uH2PrwbeKP3ING7NlZ5bcphChNlmjP7s/8KMo5Cl7mbu1QKpRL1k02?=
 =?us-ascii?Q?lJun5CarX4ArcHBDtwcTNuWdbjYSXkNc5JLrfdJyCVO1SPnxOw52LYz0tkRA?=
 =?us-ascii?Q?t7yCFL4L3Ur7i6WC3hLvN7StR/E8ROqa5aiZSxnbee+vWtzIDnM5xNtyWlEX?=
 =?us-ascii?Q?CpYhXIgEfvPZoDh5jn9rhE09hnolwDC0tfJsZ0HDaU5PkavR2rs43fpq64k5?=
 =?us-ascii?Q?G0QWck7NtvG4CPh4z2N4iAlT0dSsAaJZ7kG6O8rcgDozs84wlL7uBjZHSdaC?=
 =?us-ascii?Q?d+qFD7AZne7si/RpjO3tGPshMWlqLwtowz5uIGE26Z7IEpyz8CcxITYm8tfl?=
 =?us-ascii?Q?uEvEpjkU4b00Rv6NTmNyRqM/fl8v2IHcLrr2RJRuMDFJOYZ3lolSc9uxKxOm?=
 =?us-ascii?Q?pyBWP33XO1TTQ/4=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018)(921020);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?+lKkPhY1K1te/ZISlMg5tlAMhfQaFFLbHJ6s+OQMPeQ+EFjg+Mcg5oLwnToE?=
 =?us-ascii?Q?NZ8O9Fvzq+455YCoeccLSeyeUB0pG2ZBtpI/zHN8KDlOAq5Vh9VcjTFqVjfj?=
 =?us-ascii?Q?eO2FmHK3AkB/PPGBGNfNfg00P2nfJSof+XR5BwvQVEb7PDGluwwi+ezIYENM?=
 =?us-ascii?Q?/9ZxB0eUP6VQc7C7wPTZ+Gye7Z3YOcT/T5NCuLM724mfhO5gmlUDG4NaLoSq?=
 =?us-ascii?Q?i+hJH+smBFHM7cq2r5a3MW3lljQZhu0ff8iMxOgeiuHdPYgFcXAu2cP2AfzW?=
 =?us-ascii?Q?0d4hSX34XqJmzWJjcaJI3PPsEPkTCUxn/0BeETaX+HO6Ms0u/gTuALfKbv/G?=
 =?us-ascii?Q?iTqQnMK5Sp1wDHkQSxagyWfFf9zxx8wcNokMALHplURCn0JcIb+ZaZMrlC4b?=
 =?us-ascii?Q?yRy1hFsPRSyfaSc7HOfRLAeT/tS67yJw2mmTcfH6YrqPdjTYnSU/n8KrPVez?=
 =?us-ascii?Q?kqAWeE0jA1zNScDFqiF7FgjXV0RucKaJAuyyrRrjTAmU80NVdL24Ze9GJ1/8?=
 =?us-ascii?Q?pS5B5OQVhthn0mqgIX7B9QnsT9gMoM8f39SpN5e1rex17PtcF2KqxzBOM+GV?=
 =?us-ascii?Q?SoCorbe41ak8ZfpmxgQw9HU8vHUT/mhEGNPjZ5692gwchWpkTn03fw8/eN5q?=
 =?us-ascii?Q?hyC+II4Ot/Ws7z4esQRetfCTmvkUxKGmXtntt/XrI/J8LleSKqW1YyE7DNSK?=
 =?us-ascii?Q?C3lJr/5TqgTv0Wgn8MRwE0tVicAHikMi1vKPa3+RRaQf3ahCPrtuOMSx6dM1?=
 =?us-ascii?Q?RQkph5443y5gFxRbHgXBeXVDjSmQBYP9j1ETZ05eVb1/sXaC+cVFDS+5XFJC?=
 =?us-ascii?Q?NATbA29M2yqxxB3bzVpRRWfJb6dhyP+KQTG52Oj1Iob1ahgW1TKk6Aok4Lgi?=
 =?us-ascii?Q?lkrBiVMd/ZGIBbwz9bSpWeCAgpjrgTMI94G7EPdiCoKQ9CAQwuNe2tsavzZi?=
 =?us-ascii?Q?xcL/St4T22SLqBL3wX9ekYFSuDuiWhpkLxCURBRVLJdVwX1qAydM+eVDS1S+?=
 =?us-ascii?Q?/d9BpcNkKOrO2UNgLF5i3+IcQJocfnMIquVb343h1cgF4r3oRJ8TPq0AGwTd?=
 =?us-ascii?Q?1rctqMMVaeqYMTr4b6t5r+1EiYWpJ4bj4hKOdq/R14UH6NmjOjlc4JnxuAu6?=
 =?us-ascii?Q?s9B152XWYcxnXXN7X5EjRBJvVNXQRCzhVVEaUEsOV9DidSdpQOnRQPJvcOVm?=
 =?us-ascii?Q?uVqvhd+xpg4rFYw1xe6kdgoQ1F8M9BKXnYJ9ZhAFIIsfraRDzue6yW58XBN5?=
 =?us-ascii?Q?w8DFRcDMiNToA/3R8ndKxTqwaNWqd1tRTXcUCe4lOKDVA9ZcYZA2UznjlEmw?=
 =?us-ascii?Q?COU93OsiqxXMFUvn3GcbF8Mjlf1mWxzYqTqsqndxDfY231II3dzVoQ4q7LeR?=
 =?us-ascii?Q?6yqT97KXkotkJw4MQJ+dXZygyg1nWHKVebgGg0nniDDrFAWZZNRNGff2XDDf?=
 =?us-ascii?Q?kf8PZEOguWM0+5oSnb7GITG5beBFLPEaTLB+LOes5O3F2FAAd52Fq8MzY5qF?=
 =?us-ascii?Q?BdB77aW1SQfQFWFiRG4mgi6L8BJ4+1yDR0EmUrjSG1iXzA4xQVdBJ4+I3qPD?=
 =?us-ascii?Q?IQlfQgCU9UHGzPGQ/j/95u3gcVeVt8djU3zMVLWTLxMq1kaqyb/531E8EVBt?=
 =?us-ascii?Q?Vg=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e0d90d3-a347-4f86-6e36-08dd7cd3a1ee
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Apr 2025 10:44:15.2680 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 42TTSaEimOfGnjsMiWRnmUdX3pgMasDaYZ4sLl8rVPjKwQtGKS1n10a2nDRyJJaeHUiw1tz8mUBbW3SlxUMhVeHKwfwW+4KudGDO9BnLsec=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB14085
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH net-next v7 3/4] net: stmmac: Add DWMAC
 glue layer for Renesas GBETH
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

Hi Prabhakar,

Thanks for the patch.

> -----Original Message-----
> From: Prabhakar <prabhakar.csengg@gmail.com>
> Sent: 16 April 2025 11:40
> Subject: [PATCH net-next v7 3/4] net: stmmac: Add DWMAC glue layer for Renesas GBETH
> 
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Add the DWMAC glue layer for the GBETH IP found in the Renesas RZ/V2H(P) SoC.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  drivers/net/ethernet/stmicro/stmmac/Kconfig   |  11 ++
>  drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
>  .../stmicro/stmmac/dwmac-renesas-gbeth.c      | 146 ++++++++++++++++++
>  3 files changed, 158 insertions(+)
>  create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
> index 3c820ef56775..2c99b23f0faa 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
> +++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
> @@ -131,6 +131,17 @@ config DWMAC_QCOM_ETHQOS
>  	  This selects the Qualcomm ETHQOS glue layer support for the
>  	  stmmac device driver.
> 
> +config DWMAC_RENESAS_GBETH
> +	tristate "Renesas RZ/V2H(P) GBETH support"
> +	default ARCH_RENESAS
> +	depends on OF && (ARCH_RENESAS || COMPILE_TEST)
> +	help
> +	  Support for Gigabit Ethernet Interface (GBETH) on Renesas
> +	  RZ/V2H(P) SoCs.
> +
> +	  This selects the Renesas RZ/V2H(P) Soc specific glue layer support
> +	  for the stmmac device driver.
> +
>  config DWMAC_ROCKCHIP
>  	tristate "Rockchip dwmac support"
>  	default ARCH_ROCKCHIP
> diff --git a/drivers/net/ethernet/stmicro/stmmac/Makefile
> b/drivers/net/ethernet/stmicro/stmmac/Makefile
> index 594883fb4164..91050215511b 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/Makefile
> +++ b/drivers/net/ethernet/stmicro/stmmac/Makefile
> @@ -20,6 +20,7 @@ obj-$(CONFIG_DWMAC_LPC18XX)	+= dwmac-lpc18xx.o
>  obj-$(CONFIG_DWMAC_MEDIATEK)	+= dwmac-mediatek.o
>  obj-$(CONFIG_DWMAC_MESON)	+= dwmac-meson.o dwmac-meson8b.o
>  obj-$(CONFIG_DWMAC_QCOM_ETHQOS)	+= dwmac-qcom-ethqos.o
> +obj-$(CONFIG_DWMAC_RENESAS_GBETH) += dwmac-renesas-gbeth.o
>  obj-$(CONFIG_DWMAC_ROCKCHIP)	+= dwmac-rk.o
>  obj-$(CONFIG_DWMAC_RZN1)	+= dwmac-rzn1.o
>  obj-$(CONFIG_DWMAC_S32)		+= dwmac-s32.o
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
> b/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
> new file mode 100644
> index 000000000000..f34bec7794e2
> --- /dev/null
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
> @@ -0,0 +1,146 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * dwmac-renesas-gbeth.c - DWMAC Specific Glue layer for Renesas GBETH
> + *
> + * The Rx and Tx clocks are supplied as follows for the GBETH IP.
> + *
> + *                         Rx / Tx
> + *   -------+------------- on / off -------
> + *          |
> + *          |            Rx-180 / Tx-180
> + *          +---- not ---- on / off -------
> + *
> + * Copyright (C) 2025 Renesas Electronics Corporation  */
> +
> +#include <linux/clk.h>
> +#include <linux/device.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/reset.h>
> +
> +#include "stmmac_platform.h"
> +
> +struct renesas_gbeth {
> +	struct plat_stmmacenet_data *plat_dat;
> +	struct reset_control *rstc;
> +	struct device *dev;
> +};
> +
> +static const char *const renesas_gbeth_clks[] = {
> +	"tx", "tx-180", "rx", "rx-180",
> +};
> +
> +static int renesas_gbeth_init(struct platform_device *pdev, void *priv)
> +{
> +	struct plat_stmmacenet_data *plat_dat;
> +	struct renesas_gbeth *gbeth = priv;
> +	int ret;
> +
> +	plat_dat = gbeth->plat_dat;
> +
> +	ret = reset_control_deassert(gbeth->rstc);
> +	if (ret) {
> +		dev_err(gbeth->dev, "Reset deassert failed\n");
> +		return ret;
> +	}
> +
> +	ret = clk_bulk_prepare_enable(plat_dat->num_clks,
> +				      plat_dat->clks);
> +	if (ret)
> +		reset_control_assert(gbeth->rstc);
> +
> +	return 0;

	return ret??

Cheers,
Biju

> +}
> +
> +static void renesas_gbeth_exit(struct platform_device *pdev, void
> +*priv) {
> +	struct plat_stmmacenet_data *plat_dat;
> +	struct renesas_gbeth *gbeth = priv;
> +	int ret;
> +
> +	plat_dat = gbeth->plat_dat;
> +
> +	clk_bulk_disable_unprepare(plat_dat->num_clks, plat_dat->clks);
> +
> +	ret = reset_control_assert(gbeth->rstc);
> +	if (ret)
> +		dev_err(gbeth->dev, "Reset assert failed\n"); }
> +
> +static int renesas_gbeth_probe(struct platform_device *pdev) {
> +	struct plat_stmmacenet_data *plat_dat;
> +	struct stmmac_resources stmmac_res;
> +	struct device *dev = &pdev->dev;
> +	struct renesas_gbeth *gbeth;
> +	unsigned int i;
> +	int err;
> +
> +	err = stmmac_get_platform_resources(pdev, &stmmac_res);
> +	if (err)
> +		return dev_err_probe(dev, err,
> +				     "failed to get resources\n");
> +
> +	plat_dat = devm_stmmac_probe_config_dt(pdev, stmmac_res.mac);
> +	if (IS_ERR(plat_dat))
> +		return dev_err_probe(dev, PTR_ERR(plat_dat),
> +				     "dt configuration failed\n");
> +
> +	gbeth = devm_kzalloc(dev, sizeof(*gbeth), GFP_KERNEL);
> +	if (!gbeth)
> +		return -ENOMEM;
> +
> +	plat_dat->num_clks = ARRAY_SIZE(renesas_gbeth_clks);
> +	plat_dat->clks = devm_kcalloc(dev, plat_dat->num_clks,
> +				      sizeof(*plat_dat->clks), GFP_KERNEL);
> +	if (!plat_dat->clks)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < plat_dat->num_clks; i++)
> +		plat_dat->clks[i].id = renesas_gbeth_clks[i];
> +
> +	err = devm_clk_bulk_get(dev, plat_dat->num_clks, plat_dat->clks);
> +	if (err < 0)
> +		return err;
> +
> +	plat_dat->clk_tx_i = stmmac_pltfr_find_clk(plat_dat, "tx");
> +	if (!plat_dat->clk_tx_i)
> +		return dev_err_probe(dev, -EINVAL,
> +				     "error finding tx clock\n");
> +
> +	gbeth->rstc = devm_reset_control_get_exclusive(dev, NULL);
> +	if (IS_ERR(gbeth->rstc))
> +		return PTR_ERR(gbeth->rstc);
> +
> +	gbeth->dev = dev;
> +	gbeth->plat_dat = plat_dat;
> +	plat_dat->bsp_priv = gbeth;
> +	plat_dat->set_clk_tx_rate = stmmac_set_clk_tx_rate;
> +	plat_dat->init = renesas_gbeth_init;
> +	plat_dat->exit = renesas_gbeth_exit;
> +	plat_dat->flags |= STMMAC_FLAG_HWTSTAMP_CORRECT_LATENCY |
> +			   STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP |
> +			   STMMAC_FLAG_SPH_DISABLE;
> +
> +	return devm_stmmac_pltfr_probe(pdev, plat_dat, &stmmac_res); }
> +
> +static const struct of_device_id renesas_gbeth_match[] = {
> +	{ .compatible = "renesas,rzv2h-gbeth", },
> +	{ /* Sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, renesas_gbeth_match);
> +
> +static struct platform_driver renesas_gbeth_driver = {
> +	.probe  = renesas_gbeth_probe,
> +	.driver = {
> +		.name		= "renesas-gbeth",
> +		.of_match_table	= renesas_gbeth_match,
> +	},
> +};
> +module_platform_driver(renesas_gbeth_driver);
> +
> +MODULE_AUTHOR("Lad Prabhakar
> +<prabhakar.mahadev-lad.rj@bp.renesas.com>");
> +MODULE_DESCRIPTION("Renesas GBETH DWMAC Specific Glue layer");
> +MODULE_LICENSE("GPL");
> --
> 2.49.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
