Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 417529089AC
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Jun 2024 12:22:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E3508C6C83A;
	Fri, 14 Jun 2024 10:22:34 +0000 (UTC)
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2052.outbound.protection.outlook.com [40.107.113.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BD27DC5E2CD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Jun 2024 10:22:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bj7L2IWIw9/yFZIvCOuf9+ESGJeHdkTGTS1NQl7/1mTGhSRlXgXzTCwFOoJ8vGOJUjTnHWB6SXm5FH7ytR1zxjpQrIpKSTWENCgCNXVJfPmGfj2ePvLikTZVRFoMdBoDMUU+JtQWfOsFhMtKsHM4jVMNwWHkGH4KBhqFmojSCMy/XC8iu7nZcmpOq+/oUs01n1wc+la9pXXMprdq6v0X2wkyRtJO92rObU1F0neM2a+p09yPxdumDgR4iQ4TGeiSzRPpwsmasaOZ56C1XT9gByzwFQui/pfWJWHjO+a2hP7wN2RrcnkdfTR3cnO+5AO1kF9f9kmtOz0eWXJD+5+hDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uRAxFKBI2hBFO0aAOX3EEKwoe86ytX4tF4kpemYRGHY=;
 b=LCdPOit1lgTc3VkvPNQ7r/EiwtJ1Jm8mqTuwNpVCnGM8qXGE8bs4s6BBIKUYc8vbVUg4myRRog0pCay78ZtpMsgLfKfz7xoeUZza9BPwNQDw69MowHniY9nQXuoX2xW7c2qznvyfpicULKiNJivHLUzZ9t4xh/YvE7JDTlhWRVw1TyVVPcoPpjOSbnd6x6zj0oLSLB3fEKZxogLVbrG6VVKv2tnFCp4DjKwHcUZ+jZLVMKMLNtNO3qJ8irDMr3YpwT42EIQmAz0jdyi6+YG71pfnPAmu9AJX9CzGlrpN9MPEEA7wE366YUvng/TsojXGe4NXt9R+rJfz2g/SSmdMqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uRAxFKBI2hBFO0aAOX3EEKwoe86ytX4tF4kpemYRGHY=;
 b=scatOrUi9IhqKcdddak63Ordbm7sobXnF7HV8JVa/ZnsWlTPWHPZAA7T2QSfh3riyafs27C/hpNz7nhERmC1v2RhOvGtx2TMykKEt5+wsn+SKB3IthR3xIFat5tYl1YNrXbAjazVqP55X0ULbQXkaxa4HfzqhsbjOy7ESaE7mz4=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYWPR01MB11876.jpnprd01.prod.outlook.com (2603:1096:400:3fa::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.25; Fri, 14 Jun
 2024 10:22:22 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.7677.024; Fri, 14 Jun 2024
 10:22:22 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Daniel Lezcano
 <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, Lukasz Luba
 <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Guillaume La
 Roque <glaroque@baylibre.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Vasily Khoruzhick <anarsoul@gmail.com>, Chen-Yu Tsai <wens@csie.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
 <festevam@gmail.com>, Anson Huang <Anson.Huang@nxp.com>, Thierry Reding
 <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Dmitry
 Baryshkov <dmitry.baryshkov@linaro.org>, Amit Kucheria <amitk@kernel.org>,
 =?utf-8?B?TmlrbGFzIFPDtmRlcmx1bmQ=?= <niklas.soderlund@ragnatech.se>, Heiko
 Stuebner <heiko@sntech.de>, Orson Zhai <orsonzhai@gmail.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Pascal Paillet
 <p.paillet@foss.st.com>, Keerthy <j-keerthy@ti.com>, Broadcom internal kernel
 review list <bcm-kernel-feedback-list@broadcom.com>, Florian Fainelli
 <florian.fainelli@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 zhanghongchen <zhanghongchen@loongson.cn>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Bjorn Andersson
 <andersson@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>
Thread-Topic: [PATCH 15/22] dt-bindings: thermal: rzg2l: reference
 thermal-sensor schema
Thread-Index: AQHavj/TcKvx4pbunUS+t27Dh0nHGLHHDL5w
Date: Fri, 14 Jun 2024 10:22:22 +0000
Message-ID: <TY3PR01MB113466714FD952C704C68B6C986C22@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20240614-dt-bindings-thermal-allof-v1-0-30b25a6ae24e@linaro.org>
 <20240614-dt-bindings-thermal-allof-v1-15-30b25a6ae24e@linaro.org>
In-Reply-To: <20240614-dt-bindings-thermal-allof-v1-15-30b25a6ae24e@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYWPR01MB11876:EE_
x-ms-office365-filtering-correlation-id: d3612bfe-f470-4a9b-a30a-08dc8c5be0f4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230037|366013|376011|7416011|1800799021|38070700015|921017; 
x-microsoft-antispam-message-info: =?utf-8?B?UmNiNjJyYTI2RTQyNGk4VFpvUVVIc3krbFdOUWFaY3BBeWVXd2hqajV4UkhR?=
 =?utf-8?B?RUJwalAyTm1XelFQU0JOQzFDZVhobndodHJ0RDR2TzVZVWpEa1d1Qzk2QlNQ?=
 =?utf-8?B?Yit4bFkvNWxPSzdDbEtYMGNiQURKdFFYNk9DT05YWUpyYXVtY2J0THROTUtK?=
 =?utf-8?B?d1R6ZEFVRVZ2YS9ndk1nbUhpa0RrTHJEZ2ViY1VpTHByV0F1YytuTzFJN2hP?=
 =?utf-8?B?cW13bkZ5aFlVWHFXcnRlQWF0djNUWWZQRDd2TFJ4dG80LzY4aWlxZGRiL0Zo?=
 =?utf-8?B?a01pdzZkWmdTYytlUUdLVGlrTHVxWTdxUzhUOU5QT1RqVXVmUEJYcXE3U0s1?=
 =?utf-8?B?ZGJpbGJvenZ0RDhTcWtpbkhKdlJOaWt1dnJBTURvRktKN0JveWRLZjJ2cTlG?=
 =?utf-8?B?SFE1RW0zNm5UblU2ejhIQWVMYUVGeHVzdDFQcThaTGoyL0JUYStkckxkcGxm?=
 =?utf-8?B?WURndzJYQW04QTlUU1Y4VHV0NzdzaXFUYkhFSVN5dVBYYmxOQUpVQmd2L0hN?=
 =?utf-8?B?RG1uL3g4RVk2UlZKS0dQaC9LOVBkdkNKQXdjTE1JZGl2S3JEZTZiSEtLaUNr?=
 =?utf-8?B?RUEvNWs5ZmJnMlNQMndkNjFxNlAwUDlCYlpaQ1hKZ0ZaT2pNVGJiSVRlMzJJ?=
 =?utf-8?B?WUhtMXJXN0E5K2FIOENmclUvdFRMQ2RTWnJ4c1ZuYXZsdnVyMFRPRmlnUWFK?=
 =?utf-8?B?NEtXUVhUTU1PNUdUcnRUeFZLeU1ra0xWUWVNbjYzMi9MWFVESWZvL2JCUFpW?=
 =?utf-8?B?YWpPdTZ4RU9zZ1lKd2hVdW1wYXdyczJ1YkRTVWNQNllGRlh1M2Z4dFVpNWNt?=
 =?utf-8?B?VlMyOXF3UEdoblhzTkdzdzBDYUR2SmVwWFpoeEVIdmFNV3ZWbk1tWHc0eE1O?=
 =?utf-8?B?QWRweUp0dUVsQ29NQmY2ZjFsNUNMQldxcis2T0p3SnQ2bis2WVhCczZPeUZk?=
 =?utf-8?B?Rm1qcWcxT3R3YS92Mmdyd2crMGZkbDQyM2dLdzhNNGI1SjFoVTBWd0ZlelVR?=
 =?utf-8?B?ZVJFTWVOUEZSbkNlRGlMV29lTUpMS0V6T0NFa2ZHRFBMVm1CRTNCZ3BsVzhx?=
 =?utf-8?B?Y1gyVXg1Y1drVExIdkNQcktGaU1uRXl2bkxhNFFKWmtQcXJqNFJ4RWhBTkF3?=
 =?utf-8?B?cndnaFUxN21CTlNVeE54d0FVa1hKQVJXTlI1c2Y1RDhjK3hBOTgwKzhGT0F0?=
 =?utf-8?B?UHhwenkxSmZpalU0dmNVS3lvWVByUmw2QjZwQ2ltTWNWR2pYb1Y1NmRzd3VI?=
 =?utf-8?B?R2NOTHlURW1hS2N2cVB5TzV6Q2JLNjMvR09mY0JEdS9yYi9JQmp4NmhmT09r?=
 =?utf-8?B?Q25yUlgwL1JuaGFqaHlYZHA1TmVRMGFjUVNuUmF0Qmp6NVlPT3o1bHM2OTR1?=
 =?utf-8?B?OGxwUHpvUC9XVkN4RjlLNzRTTU5QY292amg3UG4xSGVIZWNQek1hLzZRMU93?=
 =?utf-8?B?V1k3MlpleHRTMG5zSmRFT0hXaEF4TXhzY2tOeUFGbEVTTDZKRDV3UzVndUUz?=
 =?utf-8?B?UWlyTE9scWhZWkdHN1RIMjhwVWRRK1I0MHlnOThVdmh6cG1vdWNsTnlGRUhL?=
 =?utf-8?B?cDV0TmVtU0JSeVVlUjVnSG9hbWpNSU1XbDQ1K2ZJckdCRDhCd2IwTGVKNnIv?=
 =?utf-8?B?SVU0M2ZWQU9nZ210a05KVGd6WjVGSHkyWWo4SGI3alBrejFNMGovNmFGOFBM?=
 =?utf-8?B?YUFoRGdKdkttVW1uN2Y4QUZlOE1jS0o0d0RmNEpDSUNvRUQzUUNmRXNLeTl4?=
 =?utf-8?B?NFN1S2RzZ09sWkNvaWFSTDE2UWY2UDJWOTlVNDdCU0RaUU40QkRZTHRQcFJw?=
 =?utf-8?B?UkxEeFdhNDVadDkyc3MxR2pZa0RNN3FOV3ZWRFJwT2I1NDJyOUoxRHhlMXFH?=
 =?utf-8?Q?IgiKKBEW9ogdD?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(366013)(376011)(7416011)(1800799021)(38070700015)(921017);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T1M3TTlna1EzUkFyMjJPY0o3RkdSc3krdUJBRTR6ZE1BbUtkZlJNVXRTQXRl?=
 =?utf-8?B?dytMRG1TK0JxN0JvMTRVTkRGd2Z3SDlCMkV3U0Q1dVZPRFg2M0JqamZSVFQz?=
 =?utf-8?B?cGNaVDJOTUJ1aFk1eS92NUIrK1ZsWDdCU3ZYYmcydU1ycVFFcit6NXdOM3gy?=
 =?utf-8?B?dG5Bd1NpNFRIdXkrNldWOHQvRXhPcnB5ZWw0cWxmc3JpU0FvZzhnNE9Cc3ZM?=
 =?utf-8?B?MUtZRjl2SDBmZ0RUOFF1ZURncXNld0cySTJhUW9hQ1RjLzdJWkwrUEJWbGI1?=
 =?utf-8?B?ZzgwaWZnVFdZaUwvM3Z2T0o2SVlUV1lidmVwcTVBd1VROWFUdHN1YlFYZlp3?=
 =?utf-8?B?ZEt4U1RoS0NQdHBkVGc0ZFYyZFAwaEU5T2J5NnRaSFdORE80blFIY3BKWmUx?=
 =?utf-8?B?bWVKMUhKZU40dVdabGgva204dDNvUzc3eWl3VFhuaXVuc1Z1MXpmdkxOMkJ0?=
 =?utf-8?B?S0xjTmJwWFcwZ3dWNjBjbWVuQmd6WlIyb2Rzd2lpaVJCKzVXcHRCTFlxS1Br?=
 =?utf-8?B?cXF0Q3dpbHFoTGtYb2VRZWEzMmtjNU5NRkZ0T3dKZG02N1BXcTV5WWFRaUpa?=
 =?utf-8?B?S0RjQmNveENsaUdONVRHaTBXazlTL1JHcmJiT1duRitFZWZvV3NyMU1aNUgr?=
 =?utf-8?B?OVBRcVpNQ2E3RGJKd0JZTllubit2VlBnN1gwWU5QelErbUlFKzk1bkRlL0FT?=
 =?utf-8?B?SzNrNnhuYlM0WkVEOCtQUXYrM1QybGRzdTFPVnVicFJvVkhWTnRYOVlqdFFx?=
 =?utf-8?B?N05rZXRNK2pKU3BiaVVSaTVpakZ0U3dhVVNJYzZxQy9BMktzSWlMY25Rc3pa?=
 =?utf-8?B?dnFPQWMvL2hiYUpGelF1TGpQV3liZ1VvZzdXOEVPU0hEeCtxT05RV01DWE5Y?=
 =?utf-8?B?clhXVS9nYUx0cFRlNThBcWNOODNiQjhKWmxibllaZmxpVUdQQThHZDN2WGpH?=
 =?utf-8?B?bHRHREVWVGhTNmRqdDMyMzhhdXhzYmFidWJCZ3g5a2VFcHdLTUpjcjhuWTZY?=
 =?utf-8?B?RExZYXNvR1NwcFN3bDVpbnZZTExDS3RaRFlKelA5QS9CMC9PRzBkajdLbnB0?=
 =?utf-8?B?MVB6cCtmUkVtRm1tb04vWUwrQjNGM3ZpcHdnbUdCMTZLV1VWK01iTW5ZdzF3?=
 =?utf-8?B?ZHZlN3d0em5GelBPNXJFVC96TXBMTlJ4V0ZYZk0rR3Rvc1gxcS8wRXo1RjJp?=
 =?utf-8?B?NmpFU3V6TkhRa3VDaTNMSnZvSVBFbGhxYlVmM3o1YlVSU000aWoxYklaQmJR?=
 =?utf-8?B?L2Y2VlJUUVhKY2RWWnMrVmxVc0E1eXRJekZsL0NNTFpsR2tRYXI5clpjTnJG?=
 =?utf-8?B?S2xhT0VkaVdENEl0c0Y0SDNhVGlrbi9UZFBjaWNPdWJTRlNRUTUrTDhpY1Y5?=
 =?utf-8?B?YUtjWHduZlpyV205U1BsaXh1U1pPN01HbTZQcnpDby9RdUpSZTBjT2dDaXhY?=
 =?utf-8?B?ajhkZDlsbFV5VXd0c2JXTlo2QjNoTzFnSUdnSDFDUmp0cS9WdGI2ZnhyaUxz?=
 =?utf-8?B?ZWVwODFCRFMrclFFdmlIWG1wcjNSREEzTTZTRSt3MnlLTFIvQXVrQ1cvbE8w?=
 =?utf-8?B?Q2dyZkgxYmxlZFlreEJJMjVvMW5JckNaSTZiMU51bUFHVXk2REs1cytFOHY0?=
 =?utf-8?B?b1p1NW1lK1Z1VkRTV3d0RDFYVzFGYk9LRjFuS0NLL3l6cWJPaVM0RXJ2MXlj?=
 =?utf-8?B?cFBhWFg1SWVxWUt4cUdBUnJRVWxHS0pnenlkUUY5K0o2U3kvOU1HcU4wSU9C?=
 =?utf-8?B?VWg2aXkwKzc2allIbWJLRld2SGoxa05CR1llbWtyWVFQTVRUMmJJNCt6cHhV?=
 =?utf-8?B?WFpYZXZYNG91Rjhpdys0bGRRZEpYb0I5R05Wcm1mbEFRUWV3MmtzTUNoZ0xx?=
 =?utf-8?B?Z2FYZFlUNUZKemJqMWhuWkV0OGMyeElYVUhReUdDV1NwMkFISkhNOXN2TS9T?=
 =?utf-8?B?SE43Y09HRm56YkRPRHh4RStScUlpUFR6QmZCWWhsOFFJL0NTSnpudVFNaUcz?=
 =?utf-8?B?dmlSVDZtdmFpNUQyRFMzSXRNSFZrS213cHlEZnB5OVkzcmRWY28zaURKaTVu?=
 =?utf-8?B?U3pQbzJyL0VkK01wOGZSVGNFM3NOdFQra1hUZHJLa1IrRk1kL0JJeGI2a3FJ?=
 =?utf-8?B?OW05UnhvMnp4Wk14MzVkTEZOaVNEWmpqN0xmYTJ4NXIzZThzOXErbGRidFJp?=
 =?utf-8?B?S1E9PQ==?=
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3612bfe-f470-4a9b-a30a-08dc8c5be0f4
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jun 2024 10:22:22.3202 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MeUlLp8zO6cSYFW4zRYeKFURIc1PM7GmBf1eGnt3V3htogJIJ8I7I7V9KKf5hYdGYooWyff/elw18BCECTbU39AnGIaaPlptDOnToyC41Yc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11876
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
 Florian Fainelli <f.fainelli@gmail.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-rpi-kernel@lists.infradead.org" <linux-rpi-kernel@lists.infradead.org>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-sunxi@lists.linux.dev" <linux-sunxi@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH 15/22] dt-bindings: thermal: rzg2l:
 reference thermal-sensor schema
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

Hi Krzysztof Kozlowski,

Thanks for the patch.

> -----Original Message-----
> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Sent: Friday, June 14, 2024 10:46 AM
> Subject: [PATCH 15/22] dt-bindings: thermal: rzg2l: reference thermal-sensor schema
> 
> Device is a thermal sensor and it requires '#thermal-sensor-cells', so reference the thermal-
> sensor.yaml to simplify it and bring the common definition of '#thermal-sensor-cells' property.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Cheers,
Biju
> ---
>  Documentation/devicetree/bindings/thermal/rzg2l-thermal.yaml | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/thermal/rzg2l-thermal.yaml
> b/Documentation/devicetree/bindings/thermal/rzg2l-thermal.yaml
> index 03f4b926e53c..2f96c0fe0f75 100644
> --- a/Documentation/devicetree/bindings/thermal/rzg2l-thermal.yaml
> +++ b/Documentation/devicetree/bindings/thermal/rzg2l-thermal.yaml
> @@ -13,6 +13,8 @@ description:
>  maintainers:
>    - Biju Das <biju.das.jz@bp.renesas.com>
> 
> +$ref: thermal-sensor.yaml#
> +
>  properties:
>    compatible:
>      items:
> @@ -43,9 +45,8 @@ required:
>    - clocks
>    - power-domains
>    - resets
> -  - "#thermal-sensor-cells"
> 
> -additionalProperties: false
> +unevaluatedProperties: false
> 
>  examples:
>    - |
> 
> --
> 2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
