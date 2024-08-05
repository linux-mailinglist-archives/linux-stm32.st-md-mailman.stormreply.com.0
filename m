Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C321947795
	for <lists+linux-stm32@lfdr.de>; Mon,  5 Aug 2024 10:54:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0C740C7801F;
	Mon,  5 Aug 2024 08:54:16 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2087.outbound.protection.outlook.com [40.107.104.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F051FC7128F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Aug 2024 07:29:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o0XI3fdmfBaAU+cbfmnGlpZKKLj0mCG1qjS2sIINlb0pzjsUlKqw8VCgV8mbYT9MZT97yWINP7ECFMBzcbcej9eWrh7/POSWkvi9g2bqYO3xlNsAEfMHwGBEgR2VFCp/c2oNTb1UtoMdTGCHKbWYv+pmCjXahvMmt0seB7SduCPtwaE2S8jCoGcX3Rh1viO9Op9R+S3iqm49Dtd8hcApb8phBiorvSb8+sTnSqoAe/Cp5l+SH0kkDc3S8BrxDDfuBUCYg6DmTK+Xr6KJ4zbS3hWD9EFPl6ic6F6vSt84aUBHSMDkd2e6f6kWFWJ1pKyjbNzSoob/h2IOOWs6gWHRlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2LOwqvEeVnuGFKadPR7e1WceNXRPY4y45jbdrlzADqQ=;
 b=k/3nlBkJlSxJOZVApbuG03LutGK8z4lbW+N/DENe54AV+iNmwsQt9P3mzdQusHDc+dHef6WxDzJCGdHYHWKsozL0j7dHtxkG1i0HWLo25vVUpAacJx7IppTqCnTL7ZxrZQHNRKUv8fYWugM5gItkeyk8oBVFwyrXm4e9SKvKzpExr2Y4LofHxE9wTNGoVZgmO/d0JO8b7uT3VqSaLsgT3PsCnN0jbD428YbfNQHHkuFQT4P/1AocsUlxmIb/IkxNBA1n+HKw0GEa/ByNQKULLOnwTCd0QSI0OEicHIy9pQsaXzWqInghH/3h4SiERcRJBR/uqMy1Cv2YuYfCkVqWGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2LOwqvEeVnuGFKadPR7e1WceNXRPY4y45jbdrlzADqQ=;
 b=lc7C07YU/kypk6etYY0AESMVcpdrNVyTLSvfrVpWFXd+hM5pVlA4zjr32g1FI36TxrtdNBWwC9Kuma7drq1dJDUMv17ksYjrMtmNXgFZIHjgD4IbTlcXpu1RwKiYAuio2yke8lpsmQvX2siVQiK6zBIMaoSv46wwd6YtmS83X+2Pbvs1Co7O8fEgtSvZI//Uvk+oYD0QIPCwVjLEyIZao7mj93MPDiZdj7Mkn2Azugu40C+v9tncYGDuq68oSTJYG9yo5CCW3it+uzT22udY86s51WI4HED+ifNn7zEIIZI4HZSrAoE9VeIldGFRDlNG9HNqy4MA6Ga8NKlpEH4nbA==
Received: from AM9PR04MB8506.eurprd04.prod.outlook.com (2603:10a6:20b:431::16)
 by AM8PR04MB7284.eurprd04.prod.outlook.com (2603:10a6:20b:1dc::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.25; Mon, 5 Aug
 2024 07:29:24 +0000
Received: from AM9PR04MB8506.eurprd04.prod.outlook.com
 ([fe80::5f7:9bab:66a3:fe27]) by AM9PR04MB8506.eurprd04.prod.outlook.com
 ([fe80::5f7:9bab:66a3:fe27%4]) with mapi id 15.20.7828.024; Mon, 5 Aug 2024
 07:29:24 +0000
From: Jan Petrous <jan.petrous@nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, "Jan Petrous (OSS)"
 <jan.petrous@oss.nxp.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Thread-Topic: [EXT] Re: [PATCH 3/6] dt-bindings: net: Add DT bindings for
 DWMAC on NXP S32G/R
Thread-Index: AdrmrOTtkwWMBqX8SE2obTTIuZV8xgASOM0AAANymxAAAPvSgAAAWrmg
Date: Mon, 5 Aug 2024 07:29:24 +0000
Message-ID: <AM9PR04MB850675227C85B6B941842B7AE2BE2@AM9PR04MB8506.eurprd04.prod.outlook.com>
References: <AM9PR04MB85066A2A4D7A2419C1CFC24CE2BD2@AM9PR04MB8506.eurprd04.prod.outlook.com>
 <059e0b5e-7893-4c67-89d6-77c7cc87eccc@kernel.org>
 <AM9PR04MB8506FC5070BEEE98400247B0E2BE2@AM9PR04MB8506.eurprd04.prod.outlook.com>
 <8c78325a-a0c1-4bc9-88dd-3e52296dd656@kernel.org>
In-Reply-To: <8c78325a-a0c1-4bc9-88dd-3e52296dd656@kernel.org>
Accept-Language: cs-CZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR04MB8506:EE_|AM8PR04MB7284:EE_
x-ms-office365-filtering-correlation-id: ac0e0f77-6080-410f-c3e7-08dcb52054b5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?85sAUbvSONeWoLAH+5hPcb2Ni0WGGkt1K4/IMlhlUKGpfkqWYzfshS0eBMku?=
 =?us-ascii?Q?M9D3QfB86LG78dErrbwMrGB/javIAuI/2/lw2RzYPDCS9jr6MiwOzEx+Kq78?=
 =?us-ascii?Q?6A6tYvQQh+zOocUIhDPrpk/Wml9yLfpQy+6l4dGNwWLvXwNJ9BLZBmBhKGpq?=
 =?us-ascii?Q?gQkDXIzMKViUfuOtcjZjku6RS0vw4Sn6utq6MrKaJE7LuYY/KI6Q8WBW4SYq?=
 =?us-ascii?Q?zkT0BQS/fiMERqo6HIFJW5HUMUZsCVkGixtF+fn8nMMrGxoIY4fjYIoJiPLm?=
 =?us-ascii?Q?L+jha18OIRaOAI8I29RTgCV9tpdx6wrJ6yCpKXGosCNQ5Wd7SAH+PnkintDN?=
 =?us-ascii?Q?e0HOaIbVrcTrX9jzGiu60xaWIvcMraM5JXY5BDpb2Zit4iMPdG1xsrEoGPs+?=
 =?us-ascii?Q?J5Q15833oLgyZBq/jVHg6RkCKA9eACbRT7puMcZKZEcMQx7Cuw68wmfB572B?=
 =?us-ascii?Q?I9CbxunnOrnDpHhedMcylTdvHD8VTOSPn9b1rqCdvE0ZO2rr71MbD0ixoK0X?=
 =?us-ascii?Q?Ztbe4XzmvCexEjx4TiWIcuFHdau6WiC/3pHn9uyjhQEvC1w8nsWBtBKtZQ2J?=
 =?us-ascii?Q?D3E2rdBKo23N1k1BdsvVY+vG1yMYe5hRJvX/BlkrtKCPds+8zPAIXIOCt9IA?=
 =?us-ascii?Q?dyluMsBZeWPQUPZP1GOM0TL0Iqp4p3cI7VQ3VhXTPouLiBvY+CMv3IkznHNL?=
 =?us-ascii?Q?TM43T0H+dD3LPLHzMTSxn3olpoQ79yMTFu71kzEUluNKaoYSEycE3bBwf2OW?=
 =?us-ascii?Q?WBya6H8kdVbKp0m5nixBkN1pYKyeYqLu4rP7HlamEtoqsSxc2FXmaMpVehEU?=
 =?us-ascii?Q?lR/aAkeS4+qUQncsQWxyzFqZyo70iU1AZ8FZ6p0XxezEbJ8sTy1uM0UBzMM1?=
 =?us-ascii?Q?+JnKE7MvbjclhVKRk0JQiCk4KsuEShzkrX02WbEfwDPIYCO7jpykdSGSKJ0t?=
 =?us-ascii?Q?ATVTKF7xKi06MABEyJ2CTFe3GjsslhQPuuCaBWz9mGnvwxSXkDuRQ/DNia8+?=
 =?us-ascii?Q?PlyDZ71/QTCE0RR7US0YX8LYpS2d/8/ngqtq7xFrqWf9Sa0GCwFesFXFxqWe?=
 =?us-ascii?Q?pUJoEolzIKQj33WMSTV6Wq45RS5JeFzwjiVwGe8T9QFR+p37oqCrNzH5ETdh?=
 =?us-ascii?Q?vxDEInP7r2gbnmoIGp5RhkWEIXwSwC+5C0YmWlMAk7vfndk2d21pA4V1QAjU?=
 =?us-ascii?Q?dX7IXRBwCF/v+aIhmMCqcIH9Q/vcHrWZaz50finRlYNxCpJn5uotsf2e3iU0?=
 =?us-ascii?Q?H+nL2i3g/O9fKuMHDzPMKbk9kuZ0YD7aFWcgv8rDB+g45OzOtHRZt75zRwk+?=
 =?us-ascii?Q?cy6O7FwYpvMmyIWVgKj8mePuRgpQA4Rf2DiH4MfbUP1YfYEBSHMzZ3bmJri4?=
 =?us-ascii?Q?PmC9uDE5mXloR47p15b9v/M4WS04Hzo/bD4wfkg9BDmr0m5QzQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR04MB8506.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?aYJTz9cBzGN5JbMHYRJr20Bkp4ACnrzPgRP6eOYftx/wpBfBWaxdVUwVTymT?=
 =?us-ascii?Q?R1mUcAEK2giUnmZfqNqUi9o49OJAQ3bVnc/K5uAH7DY82+tr/mqcqr1w+KMB?=
 =?us-ascii?Q?u66dGsFJWZTfKaDb1yOG0sddXcmW19+D7ArdfWAyrOtq+HhAeY6vPwaLbUNo?=
 =?us-ascii?Q?eijh7lJ1ksthAwiCHRuv4BXu6V4qj5kEy1Hy+pNRm5cChtFpKcjIAtuWKdeL?=
 =?us-ascii?Q?EXS+2xxZuWbt6JlPnyWpH25R58IRvjixKLk0xbmjtnRr7aP2lr02Y1Adrh/o?=
 =?us-ascii?Q?E82ZI+FwDDc+RkXc7u6TZBUcM+Z6j80gEptwQsZMmx5ZMpnirBnSdE7dk/Kd?=
 =?us-ascii?Q?6lJ+CkuBgMqAqel6A+vEeafB8BxGyUsZSCkvUTULyxBIb9PAvCWOb+99qp/0?=
 =?us-ascii?Q?AyrA6ZJu5R6LOZ02KM9YW13x/dyjRKvQkWviPPM4vTOPsH0tn2HJOHVYnzui?=
 =?us-ascii?Q?fmMbTUzhuHyCIcQphXIjRxcQE+FfDfHnEORIaWtd/NYBjaGbAqTKNgZ8aKYR?=
 =?us-ascii?Q?FvGCYH8OGPrgn5r0M7mUWLjxx8Ct2bczOGxnz9cUgYEPyjkMd5NAjoaEjdKh?=
 =?us-ascii?Q?8AXNS3OKlaCEN4q/FlgzUXEdjDw2bObEW+Xf+JPPNXuMFXw1qikOM7oLnlkv?=
 =?us-ascii?Q?5dGACqDIccsO5x47LIrGvRTKI7ghtbsz/zIcJqZ041UbnkkSSVqTfWZonLne?=
 =?us-ascii?Q?S8tuAGipbn9eNngQkX6n+Mdip887VV5SdDbc0EJZL5mUqUJiFKlbV4IuojfM?=
 =?us-ascii?Q?/7yN957Wrztyagg0z4aHoXznvoF9mTWQx6GCj8cct2PUcInL13pk0h58IfjY?=
 =?us-ascii?Q?JHl7dx++JU1g/hpiCIqoez6NxkuSq6dBZJFbCgEN85/A3EL806Ycbf9QvO7Z?=
 =?us-ascii?Q?cg6kBGVYhxxWN/cPCfU5QAhiFvioMhIL7jY2dF57j1KZ5ZxWdY9sRggslxWf?=
 =?us-ascii?Q?FyzLj27fB/YbD1zmyIgj+1V/BW5Q6ilf73MNMHQ6kjHAdj3HPvt331+DpZcs?=
 =?us-ascii?Q?efiCt0CztZSTJugqc0eSyqnP9oxagDFG5VV7GrqYGr2Zgwt/JFX2x9LVaL91?=
 =?us-ascii?Q?bvT/4SrT01k7s/3fMWq/XmSCHYGifwkNCcqDbV7UcPICXsb3u3jqUR4jqMKA?=
 =?us-ascii?Q?2jBAyHN0CRYrsO25OQPnoYYBLbb7j4YPrwVmisHPvAg6w2Xe/U94t3eBU8Dk?=
 =?us-ascii?Q?1jzUJ/Aa570VcEGbwKIMH3qovC+memTrruNlXP0sVPvvVYw2ZW7LWU4rljtk?=
 =?us-ascii?Q?H1wWfrd5BRgKl/4Pm6m+vem5RAIgf/9S5QNJsKpOkLAE5WAHN3VBMNO5LqXB?=
 =?us-ascii?Q?iTeMXn5JysjCLWhYICf4z3sW6I6SyOknY+MGDaYMKX7Sy34ykAM2RGr8Id9J?=
 =?us-ascii?Q?rC9S/m8/bJmt443bLXzRSQ7lZF6R3jxvlOmOvf9oPARYPQmAF9ZFKTWY2D1Z?=
 =?us-ascii?Q?UFQ88UcaW02dHLgN/0+HT44MEzaSldBy4mODNK/IyQQWtLL1+GaG4NNXU857?=
 =?us-ascii?Q?pF0BKRTjYmGIKTOyvJdLto9ZwBniQIU9WH0Kx7ScGBlT5BafCtrOfNVQLK04?=
 =?us-ascii?Q?8SUgJlg9x1rFXRNmVO0QU3mswrK6y6Qy834rsM2n?=
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8506.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac0e0f77-6080-410f-c3e7-08dcb52054b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2024 07:29:24.4054 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O0IaloqvYRne2lbTOwApP6cI9/XtYjO53HhnTIounabzX8zCLWcBZALr7GiI2hl1Vtz/54iX8nZsb6etAj8Eqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7284
X-Mailman-Approved-At: Mon, 05 Aug 2024 08:54:13 +0000
Cc: dl-S32 <S32@nxp.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Claudiu Manoil <claudiu.manoil@nxp.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [EXT] Re: [PATCH 3/6] dt-bindings: net: Add DT
 bindings for DWMAC on NXP S32G/R
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

> From: Krzysztof Kozlowski <krzk@kernel.org>
> Sent: Monday, 5 August, 2024 9:17
> To: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>; Maxime Coquelin
> <mcoquelin.stm32@gmail.com>; Alexandre Torgue
> <alexandre.torgue@foss.st.com>
> Cc: dl-S32 <S32@nxp.com>; linux-kernel@vger.kernel.org; linux-stm32@st-
> md-mailman.stormreply.com; linux-arm-kernel@lists.infradead.org; Claudiu
> Manoil <claudiu.manoil@nxp.com>; netdev@vger.kernel.org
> Subject: Re: [EXT] Re: [PATCH 3/6] dt-bindings: net: Add DT bindings for
> DWMAC on NXP S32G/R
> 
> Caution: This is an external email. Please take care when clicking links or
> opening attachments. When in doubt, report the message using the 'Report
> this email' button
> 
> 
> On 05/08/2024 09:10, Jan Petrous (OSS) wrote:
> >> From: Krzysztof Kozlowski <krzk@kernel.org>
> >> Sent: Monday, 5 August, 2024 7:10
> >> To: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>; Maxime Coquelin
> >> <mcoquelin.stm32@gmail.com>; Alexandre Torgue
> >> <alexandre.torgue@foss.st.com>
> >> Cc: dl-S32 <S32@nxp.com>; linux-kernel@vger.kernel.org; linux-stm32@st-
> >> md-mailman.stormreply.com; linux-arm-kernel@lists.infradead.org;
> Claudiu
> >> Manoil <claudiu.manoil@nxp.com>; netdev@vger.kernel.org
> >> Subject: [EXT] Re: [PATCH 3/6] dt-bindings: net: Add DT bindings for
> DWMAC
> >> on NXP S32G/R
> >>
> >> On 04/08/2024 22:49, Jan Petrous (OSS) wrote:
> >>> Add basic description for DWMAC ethernet IP on NXP S32G2xx, S32G3xx
> >>> and S32R45 automotive series SoCs.
> >>>
> >>> Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
> >>
> >> <form letter>
> >> Please use scripts/get_maintainers.pl to get a list of necessary people
> >> and lists to CC. It might happen, that command when run on an older
> >> kernel, gives you outdated entries. Therefore please be sure you base
> >> your patches on recent Linux kernel.
> >>
> >> Tools like b4 or scripts/get_maintainer.pl provide you proper list of
> >> people, so fix your workflow. Tools might also fail if you work on some
> >> ancient tree (don't, instead use mainline) or work on fork of kernel
> >> (don't, instead use mainline). Just use b4 and everything should be
> >> fine, although remember about `b4 prep --auto-to-cc` if you added new
> >> patches to the patchset.
> >>
> >> You missed at least devicetree list (maybe more), so this won't be
> >> tested by automated tooling. Performing review on untested code might be
> >> a waste of time.
> >>
> >> Please kindly resend and include all necessary To/Cc entries.
> >> </form letter>
> >
> > Does it mean that scripts/get_maintainer.pl doesn't care about devicetree
> ML?
> > I just tried to recheck, but it still shows me the list I used originally:
> 
> It cares and always provides it.
> 
> >
> > $ ll outgoing/*.patch
> > -rw-rw-r-- 1 hop hop 1998 srp  4 11:33 outgoing/0000-cover-letter.patch
> > -rw-rw-r-- 1 hop hop 2518 srp  4 11:33 outgoing/0001-net-driver-stmmac-
> extend-CSR-calc-support.patch
> > -rw-rw-r-- 1 hop hop 2794 srp  4 11:33 outgoing/0002-net-stmmac-Expand-
> clock-rate-variables.patch
> > -rw-rw-r-- 1 hop hop 4427 srp  4 11:33 outgoing/0003-dt-bindings-net-Add-
> DT-bindings-for-DWMAC-on-NXP-S32.patch
> > -rw-rw-r-- 1 hop hop 8610 srp  4 11:33 outgoing/0004-net-stmmac-dwmac-
> s32cc-add-basic-NXP-S32G-S32R-glue-.patch
> > -rw-rw-r-- 1 hop hop 1143 srp  4 11:33 outgoing/0005-MAINTAINERS-Add-
> Jan-Petrous-as-the-NXP-S32G-R-DWMAC-.patch
> > -rw-rw-r-- 1 hop hop 1805 srp  4 11:33 outgoing/0006-net-stmmac-dwmac-
> s32cc-Read-PTP-clock-rate-when-read.patch
> > $ ./scripts/get_maintainer.pl outgoing/*.patch
> > Maxime Coquelin <mcoquelin.stm32@gmail.com> (maintainer:ARM/STM32
> ARCHITECTURE)
> > Alexandre Torgue <alexandre.torgue@foss.st.com>
> (maintainer:ARM/STM32 ARCHITECTURE)
> > "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
> (commit_signer:1/1=100%,authored:1/1=100%,added_lines:46/46=100%,add
> ed_lines:61/61=100%,added_lines:69/69=100%,added_lines:165/165=100%,a
> dded_lines:298/298=100%,added_lines:35/35=100%,added_lines:51/51=100
> %)
> > linux-kernel@vger.kernel.org (open list)
> > linux-stm32@st-md-mailman.stormreply.com (moderated list:ARM/STM32
> ARCHITECTURE)
> > linux-arm-kernel@lists.infradead.org (moderated list:ARM/STM32
> ARCHITECTURE)
> 
> Read the form letter carefully. There are several instructions
> mentioned. Above commands look sensible but if it still does not work
> for you, then I suspect you develop on some old, vendor tree.
> 

Thanks. Of course it was on my side, sorry. I will resend v2 with wider audience.

/Jan

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
