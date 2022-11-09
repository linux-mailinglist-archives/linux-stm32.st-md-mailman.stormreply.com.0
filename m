Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF6C6224EB
	for <lists+linux-stm32@lfdr.de>; Wed,  9 Nov 2022 08:54:18 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3E6EDC65051;
	Wed,  9 Nov 2022 07:54:18 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 81493C5F1ED
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Nov 2022 07:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1667980456; x=1699516456;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=TCHQHy2nzDOvI6tcy2n6Io50Hn2LJA5CTnnBsEr3yeQ=;
 b=o3yKUQcCn8rJBiMnZ0Qk5NPresgAzE/7frE+jHEd1qQ64Pp+fRLM/tZB
 huuTpwAfZEX661byczIWCbkqeEQUcdeZSugRjsNLGOgoY4BHJ8NBg/30l
 wwMa2iqrIWYg1xQMujKmwUoT6kOCDgivgKDJllaWIBeWue6BwanP65EJ4
 vFsf2chD/IutKk1TVT439PfQ6MxEuRe+Ak0CmCQNZT2DurmhLE8uw9Llv
 tLBFC6OkdBqpmHd4PrHZy29ETwrtFGCP6OalxdWlM+e194IVKS9vJL36q
 Uq2f/nnaMB/HTnugBi4NnoRjToTUyg+xLs6c6GoF92v62rvkAmLj98LkB Q==;
X-IronPort-AV: E=Sophos;i="5.96,149,1665471600"; d="scan'208";a="199025412"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 09 Nov 2022 00:54:13 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Wed, 9 Nov 2022 00:54:13 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12 via Frontend Transport; Wed, 9 Nov 2022 00:54:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nY6P4X0sI3DMba4ICdBAoWmpQiFTSPMsyMgBZOTGO3HRbJiqJcAq1mfPdUCixjnH3av5QowFRF+vF4fVAQIAOeXWqJzbDtkTPrxDuhWn5R2n2lIK7JIQcFoJRuqnpP41t26XGEPAqladeKhnvhjIndVNhcRHFdp3vqwopEVTy/zzuxSA/ZgXe3kc2SZLCgcIgcRR4ba8veCY32eWlbKumNytC5/8Z570DbL2pLaLPL2hvi7Zga5XEBtiP2IOsRrrRUPPbJc32ohML5t0iGC7Tg3yXmpuCNZlPq1Xjf+aXvTh1aDj0pNrUvuAnBDRMV1FggYPG4igDoe2xWakJxbauQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TCHQHy2nzDOvI6tcy2n6Io50Hn2LJA5CTnnBsEr3yeQ=;
 b=WgwrW5k9qHXch9huck8xQwcbUagyda1j+I7K7+M7VgmWpx4esujYQZkQwvBYuZsXnGPO/B39/TF1C9PnsXYJBTOuLLYBogPqRcv5ya0PLtinw25K0Xgg4rtIqgCRun47GMo6dsgqlH6wK0XjHiOcT5TqJuUb1qaVX7suMJqymh0n+me1sM5pJjg6tdpWCbsWNyAIgqmiSX0ziefnJX0lek/8Bqc+XfXF0AIXH9pq7uK9ZXTkDf5UdTYpup86Jyn7Xnc5TkJezI+JhBhpkXA+FpR17N9+ZpT461uSkmWvXzpkuNWPqMCggGJQFov2ekfobefdLzL/6i+fZqlp2q0ePw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TCHQHy2nzDOvI6tcy2n6Io50Hn2LJA5CTnnBsEr3yeQ=;
 b=aVg2Y+GIBbilHt3dFP5rpYrqbY5Zdu88vzKXxL9+wwwDtGDMcXpjoKkuZbdo8B1e1p4ndZ/+JWdyZmJP0p4+CihV0K7K5HyMtghVfqkXpZGunKLEXHfRAynfg/yoxyzrc4E3rPusuvs3VwXGrSn9iOoRPOjHqV55TQUZJPfPi4Q=
Received: from DM4PR11MB6479.namprd11.prod.outlook.com (2603:10b6:8:8c::19) by
 IA0PR11MB7260.namprd11.prod.outlook.com (2603:10b6:208:43b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.27; Wed, 9 Nov
 2022 07:54:08 +0000
Received: from DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::626d:ef37:c13f:1c4b]) by DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::626d:ef37:c13f:1c4b%4]) with mapi id 15.20.5791.026; Wed, 9 Nov 2022
 07:54:08 +0000
From: <Tudor.Ambarus@microchip.com>
To: <vkoul@kernel.org>
Thread-Topic: [PATCH v2] dmaengine: drivers: Use
 devm_platform_ioremap_resource()
Thread-Index: AQHY9BBxbpZzmOa79kmHJcnM/N08GA==
Date: Wed, 9 Nov 2022 07:54:08 +0000
Message-ID: <1f33df58-50e3-5cbc-7722-792473f2b738@microchip.com>
References: <20221108121837.540293-1-tudor.ambarus@microchip.com>
In-Reply-To: <20221108121837.540293-1-tudor.ambarus@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6479:EE_|IA0PR11MB7260:EE_
x-ms-office365-filtering-correlation-id: 0dc460a5-e117-483f-8817-08dac22794ce
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /Xy6h1E/RB3RO9aqSubf1Sz5olxVOEljyaLLgyIH5/BqrkxhZPk+0Nxn+xwY28/Mp7KzZkvVY8NVhfodEHvCiLqHPI5Gi880CvSJZcJHpMWEk84xoXNWAqSaqLRnb0svY68zNFLkqdmrk7SegnWDDg+DO+NyD/N02RR1zSu/+BpuiH+P50lxzc6cWI3GCXgCJxsWb2wmpiKNBE8YMAMIbT+mAQNZE1IqHz9/nmEukmWuRxqYv+nJxlfXyvdAjnfpMkIBohRJQ5MVC3AlOYrd9pJLY0OThNveqiIfyIfn8jnZNw5Mce/X3uOrULBFi0tZI+xrm+v5vIhasS4hE6eRUwTfloveFWBzcG7YNADFmwwKDcH0tMVYN9h/i0hFfDY4p9HQqx2+2aBn5C9CB/WfHXG3JW4ar3YIyOKVkuPJYrX63ye+4667veoJ4D2sY9LwTW0SfQr5jxAZTn6pEtVvXHA641+vnTpzCqc0Lryz4ay58qUS5vyJlx3FLipfpr1xd0ao42G+TJgOxSxyh5VixmFSzJnFarEIomJQPth9ZkZGaZ1U7rt96a7T3UL38M2tMeRRuY4XbRE1YX70UX4gBBJaTdEC83e0jAb5ovZENvrdwAXS2V6ONvl93jxiUPqAadyf1NOXcFpkUPaOZrYtwrt/kCkOWnOTSYYhiqU+17UpjAFLK3A8h2quUGjiEobKk+eq4GZwIBHWakjljAdtNnRmu9kxBUKZ2T4MVrcMf6UT9rwvNS36nhG5CZ8nKf+8DJzKDOBg1233jJnai/4T8UHUjuPBKzK4UhdUeL8RQ+IgTGOlQR/VhhMw/NaqqvPsO3yvMoORItfKBGHbodBG/wWL3l71QndMD0wtTm/qJ7c=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6479.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(396003)(376002)(39860400002)(366004)(136003)(451199015)(558084003)(6506007)(186003)(36756003)(7416002)(7406005)(2616005)(316002)(5660300002)(2906002)(122000001)(6512007)(86362001)(76116006)(66946007)(66476007)(66556008)(66446008)(64756008)(8676002)(38100700002)(26005)(4326008)(31696002)(91956017)(8936002)(41300700001)(71200400001)(6486002)(478600001)(31686004)(38070700005)(54906003)(6916009)(41080700001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MnFzczdPS3JPMlpnZUFaTEpoT3BhUjNTTm42ejVGUHdHdis0TlRINER4bitR?=
 =?utf-8?B?ZlFaWisvM0JJcTBoajB0aGZNVjFEeTFWQnluQXJzSjJkd2VhMkNubWdXeHhh?=
 =?utf-8?B?N0pwR2xHUmZ2a0EwQWxzN3VMYkgvU1UrcHcwQ0RSWG0vV1RkcWd5MTNBNkNu?=
 =?utf-8?B?S2VyMzJNc1ljd2RGU3pOOUxJaC8xbDJ3SEh4WUJJYmRHaXlsc2NKYVhjRGl6?=
 =?utf-8?B?VmFKMkRPWXo1aEdUTVZSWE5FZXRHZjB3VURkWlRUWVhOS0prbndGWlhmejNK?=
 =?utf-8?B?VDA0NW1XTTFDaG5ja0dIUU00SXMxd2E5amVsM0dXWTVKUWtsQW1Udm1JZ01v?=
 =?utf-8?B?SDRxUnFYN3lFd0lleGxoTkJUeEJwQlNHTkpDNGZwZXA2MmxUa3B5VUowb2ZK?=
 =?utf-8?B?enJnbkpIUC94MGp3VUJtTlN5aWFGaU4wTUt1VHRub05GbXZxMWoyU2hSVEYv?=
 =?utf-8?B?M1h1MHA3YVBja0hSTmlkT1VwS2FuRDhYbGc3dDI0QmxnSlR2RVBucEJXL0RK?=
 =?utf-8?B?d0JUQjE1Z1A0aTFmUDRZOHVlb0RrYkk5OGdrekRLNUNBbWdKRkVBeG9jUnZV?=
 =?utf-8?B?QVZETHJQK2F0SEozbHFVTmtzSkJDZ2xGbnhhejErYkdNTEdzd0F3WWZTdm9U?=
 =?utf-8?B?eVlzWkNlSSsybEcvMnZtM2VoOCtwdmF4WUUxb3JPNWo3TzRLOWh0ZFphUFli?=
 =?utf-8?B?SG9UQ1lwTC92OTY0VXlGZXdBQi9oaWk3RVI0eWRHbEFOOWJlc2MzM0ZXdDVG?=
 =?utf-8?B?SThQL2d5Nkd0d1BDZlNXTVptd1c5Rk5BYXh1OEVCcjM1OEdadlJjSFVoL1RP?=
 =?utf-8?B?RGEwK0Z0ejQzSmRyRG9PNmhkT2sxUFBTYUdlVmRGSFhLMjBhTkQrWGtGT0kz?=
 =?utf-8?B?cHpVV3dUeGNBQnovQjJ5ZG1NcUhkZTYrWWY4RUNJWTJpVG16RGFNaFR3MmJI?=
 =?utf-8?B?UEZhQVNheWI5WldGMFRQbnhPOVh3WXlleG9kQkx2K1dnajRYNUh1TnY1Sm0r?=
 =?utf-8?B?bCtUeVowZ3FySmQrUk5IMEcwVE5EY1JVKzVWUnBSK2dJWFNheDQ0VWVWeXJl?=
 =?utf-8?B?Wi9VbTRXRVZYM0h5bHVLMDdINmozbkxqMXFyTTljNGtBVGh6N3FhN3d1TFpK?=
 =?utf-8?B?L0g5U0p2cnVnUTFBZ1pwWFhJdlBTaGcrRHZUTUR0cUhqbTEvckRWMUsrYnhj?=
 =?utf-8?B?NWdKMGs4c2t6MnpnaUxxTDJEczZJU2pSVEFudFBka2U4NUgxRGx2UEtMNmd1?=
 =?utf-8?B?Lzhucm5pbDVTWGk4YjNUWStOQjc2U0NpUE1jK1NvWnNwcWNqRWdvM3NqTVpw?=
 =?utf-8?B?d2xZSHpRd1RsQWx0YktlTEllck5VVkcyWmloeW5tVkNkUnNHQllnQTNNdXBs?=
 =?utf-8?B?RHpqWi9tQUJXUEhKYWxjell4V1BLOVlObm44S1BqQ3NGVmpjRmpHQ1hlZldV?=
 =?utf-8?B?azJlbmFkLzhpVHJzd2FJaTJTRnQ4WHFZTmdKbHRDa1RVek5tSHZTV282bWlq?=
 =?utf-8?B?TGlBRGdIT2xRenhpZ2tGOS9ZK1pPNEtFK3puMWdUbDFhVDkvOUpDQ0prQjda?=
 =?utf-8?B?a3BnejVuTlZlMmdESURGK2FHeTZ0RW5RMlF0SVQzRklpUUs1L092UjZNRHhS?=
 =?utf-8?B?MFA3cUNwbXFQRHV1NVJ3MHdwWlF4bENFYW1iOXZDMU43UDloaVZVVmlvV280?=
 =?utf-8?B?RDlpakRhbSs4K0FxbzlENDJWbFB5VEVldGs2MG1VQnVCTzlYS3l1dmY5Y0p6?=
 =?utf-8?B?VHdINE5tVmxIRDFxbzZObFFHZU1xa1ZiMk03RE9vSVBvb2lJR0FyN2dwc1Jx?=
 =?utf-8?B?S2l6blRQY2dhYlhsMzFLY09ibnUrUENnSzd4STJQSWZpdGl3VENLd2VoSUZj?=
 =?utf-8?B?U1dUV0RNY29BblcyakRrbkYxczVjem1MSDhiOUFzU3lGWEYzMkliZ28veDEz?=
 =?utf-8?B?RkZJZWc3QzRXZDN2TTIvUGpuNk1aMTM4cW40NERHTzQvdXhpWWxwSU50Zysr?=
 =?utf-8?B?OWF0SGt5bVViYUk4NFV2dWZEUExnTkpPQURoZXYweXllY3J1MnZ3M1pWOUNI?=
 =?utf-8?B?cU0zZFFUZ1ZWOEpycmI4KytpTEhpamgvOVlMK0YzcHRvWVpoWDJJM09Eb0Ev?=
 =?utf-8?B?M3F0NFMvMUhlUkRGSTViWHJmWkZrZnRiNWl4Q2pnUUs2T25INi9Sd3JTV0NY?=
 =?utf-8?B?eFE9PQ==?=
Content-ID: <E14D91AB72CB714996184F8E7163AEAB@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6479.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dc460a5-e117-483f-8817-08dac22794ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2022 07:54:08.2266 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: H3Pn7MnCyB1IcSHDmcElEOydDCis66gpEFesz1tedwPA7BQrhjPOSxzxkZ2zbq2biPEd4PHWlcytroAXlw5SMBUxZICCh9xKMGikfz5LbqU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7260
Cc: tony@atomide.com, trix@redhat.com, konrad.dybcio@somainline.org,
 linux-tegra@vger.kernel.org, ldewangan@nvidia.com, peter.ujfalusi@gmail.com,
 festevam@gmail.com, swati.agarwal@amd.com, f.fainelli@gmail.com,
 samuel@sholland.org, robert.jarzmik@free.fr, michal.simek@xilinx.com,
 jernej.skrabec@gmail.com, jonathanh@nvidia.com, wens@csie.org,
 agross@kernel.org, bcm-kernel-feedback-list@broadcom.com, linux-imx@nxp.com,
 linux-arm-msm@vger.kernel.org, shravya.kumbham@xilinx.com,
 radhey.shyam.pandey@xilinx.com, kernel@pengutronix.de, rjui@broadcom.com,
 s.hauer@pengutronix.de, sean.wang@mediatek.com, green.wan@sifive.com,
 lars@metafoo.de, linux-mediatek@lists.infradead.org, haojian.zhuang@gmail.com,
 matthias.bgg@gmail.com, harini.katakam@xilinx.com,
 linux-arm-kernel@lists.infradead.org, sbranden@broadcom.com,
 andersson@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
 krzysztof.kozlowski@linaro.org, thierry.reding@gmail.com,
 mcoquelin.stm32@gmail.com, dmaengine@vger.kernel.org, shawnguo@kernel.org,
 daniel@zonque.org
Subject: Re: [Linux-stm32] [PATCH v2] dmaengine: drivers: Use
 devm_platform_ioremap_resource()
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

please ignore, will send v3
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
