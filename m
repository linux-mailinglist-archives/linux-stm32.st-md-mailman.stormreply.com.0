Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C789707B2D
	for <lists+linux-stm32@lfdr.de>; Thu, 18 May 2023 09:38:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 156CCC6B443;
	Thu, 18 May 2023 07:38:33 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DFABDC03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 May 2023 07:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1684395512; x=1715931512;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=h8geLpCv1xn+fbqE+K6gWLeud9KKyULiITwZgz4d7mg=;
 b=c+1HBkvVhD2UpkdieicqLnJYW/bSXzrkWE3TI8T8iDDvs1IA/E0+77ef
 hbiW51F3fYOuxvRyOo4q3uColBlHQ4eSYWTsh0QxKQMC78NXQWMhDAiEW
 6gDMannXU3RHUBQiwU4H52ehsNp8UrKHomjPno/T+N1BoAdnEOr7Hmlz7
 6HeSYr3ajZE7v5M4uQwjott1BcWX6BlndP+09KpfzjQPad0qwM3KAdULm
 OtvkCxupWzBwVCxCfkugEXl/AO9SAOem5PnrvJSazViQQEGXkTD5yjLjJ
 5xezS5dDHqEfXMGGNZNaNNjHMqTj7Iro/YGHvMz4wGDz4bOiGyhvdEJXb w==;
X-IronPort-AV: E=Sophos;i="5.99,284,1677567600"; d="scan'208";a="216051228"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 18 May 2023 00:38:28 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 18 May 2023 00:38:27 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 18 May 2023 00:38:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fGkn9JtVt7DkNzrfUCbGkmhREzQN7nx0zj45coe8wH4qtzGM5dvUZIeVZEHaT3PG5YqwiKHbE7r8xenrspKfr+Kajvm1LGMwJO07RfI41rqzEYCZJ8yVHcyrnBCGDgqxdbTgDi/mXwCvkMGQs9rD+c0pEmdLnSr0qHlqjx+SeIc3fu9uY3jTSb2nZJ9VSqV4VcAAthHJVJiwBbUfP96a4D5V0gStlC70AjinKy7LOoCbMoysa18B/Ptax91I9/Xt4BjnhfxQ92eLAAJUnVsF76ckz47MviLXechpBXsXLxLkMwXhjxu/zQ2Ee3BAVnRhFo+v9h9ViNItTH6O8H4oMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h8geLpCv1xn+fbqE+K6gWLeud9KKyULiITwZgz4d7mg=;
 b=INYAmP9KCe9qpvBy1F4bsh988rBWjU3BX1wG9b82JNnBXpmrPUL1nijePkTTgAljZVhS17lOP8pXav3FhJpuZxm0m0eno9PF/Oho7UxuREtwVSTFKSLkIPfd8cPpsHywach1Myh9Xw1ZR6zP5G9zeGhLD1EUiNmgrM1WUzX3yyKFtaMSrrrQfBMnb8Od6mim4B4fjWYFvEekwVwF0BCgO/C8Y+gGivl1+9u6FXM1ObF0sGm/vstuwbt/42s8i6dyT4HXH1/9pPNqU/x1x2iLNItP+m2cMt8qmJetS17yBaczXiXzuQwEi2TJjgqFcpDhY0KnNLrt77Tw0S5C8mzwVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h8geLpCv1xn+fbqE+K6gWLeud9KKyULiITwZgz4d7mg=;
 b=MJkd1ZdW4fl/9hau2aTd5OboKR2of0bG4ZZDiVbZTaBUmsAa5OUUL3yWtEfSBYFmPMSwdQAs4vSnyrXXguhyGlmgpLMVd0dxeDcFYF6qVUNghGVKhtaLgQfkZJB9uuc8lPayW/U7STR2y+n4zRGgw9Li4IkKWF7HKCX9RToWDtc=
Received: from SJ2PR11MB7648.namprd11.prod.outlook.com (2603:10b6:a03:4c3::17)
 by DS0PR11MB8017.namprd11.prod.outlook.com (2603:10b6:8:115::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Thu, 18 May
 2023 07:38:26 +0000
Received: from SJ2PR11MB7648.namprd11.prod.outlook.com
 ([fe80::27bf:a69f:806f:67be]) by SJ2PR11MB7648.namprd11.prod.outlook.com
 ([fe80::27bf:a69f:806f:67be%5]) with mapi id 15.20.6411.019; Thu, 18 May 2023
 07:38:26 +0000
From: <Claudiu.Beznea@microchip.com>
To: <maxime@cerno.tech>, <mturquette@baylibre.com>, <sboyd@kernel.org>,
 <afaerber@suse.de>, <mani@kernel.org>, <Nicolas.Ferre@microchip.com>,
 <alexandre.belloni@bootlin.com>, <jcmvbkbc@gmail.com>,
 <ckeepax@opensource.cirrus.com>, <rf@opensource.cirrus.com>,
 <mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>,
 <luca.ceresoli@bootlin.com>, <david@lechnology.com>, <nsekhar@ti.com>,
 <abelvesa@kernel.org>, <shawnguo@kernel.org>, <s.hauer@pengutronix.de>,
 <kernel@pengutronix.de>, <festevam@gmail.com>, <linux-imx@nxp.com>,
 <matthias.bgg@gmail.com>, <geert+renesas@glider.be>, <dinguyen@kernel.org>,
 <pdeschrijver@nvidia.com>, <pgaikwad@nvidia.com>, <thierry.reding@gmail.com>, 
 <jonathanh@nvidia.com>, <ulf.hansson@linaro.org>, <linus.walleij@linaro.org>, 
 <airlied@gmail.com>, <daniel@ffwll.ch>, <vkoul@kernel.org>,
 <kishon@kernel.org>, <a.zummo@towertech.it>, <wens@csie.org>,
 <jernej.skrabec@gmail.com>, <samuel@sholland.org>, <lgirdwood@gmail.com>,
 <broonie@kernel.org>, <perex@perex.cz>, <tiwai@suse.com>,
 <paul@crapouillou.net>, <orsonzhai@gmail.com>,
 <baolin.wang@linux.alibaba.com>, <zhang.lyra@gmail.com>
Thread-Topic: [PATCH v3 07/65] clk: at91: sckc: Add a determine_rate hook
Thread-Index: AQHZiVu6mMAsLYAy0kOu5A2m3KQy7w==
Date: Thu, 18 May 2023 07:38:25 +0000
Message-ID: <10fca778-f8a5-e844-7fcb-469a0cf31a90@microchip.com>
References: <20221018-clk-range-checks-fixes-v3-0-9a1358472d52@cerno.tech>
 <20221018-clk-range-checks-fixes-v3-7-9a1358472d52@cerno.tech>
In-Reply-To: <20221018-clk-range-checks-fixes-v3-7-9a1358472d52@cerno.tech>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR11MB7648:EE_|DS0PR11MB8017:EE_
x-ms-office365-filtering-correlation-id: 6c72a09a-642c-47f3-562a-08db5772dd7c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zpChqX+M06zBaM60HPDo8ThsKxfqaUtv2yGj0NCaNhfzMQjK+weUgv16LxhFLGcgtswln/ASG9/dwxyhgICkZJZmYm8274ZublUefbwzE9qM5F9AcMQ/M6Vpu0bPOf/LzLKE2zg20DGQuifxCnx1VVbfROTs6QLuYkqVn4MQpy3VX7JsTc4usL9C9m61h+gKnX6M3w8Y5YwYzdT1kgSTAVVN6M8pOYLlVczQfbMGkhusXRMVvIDmMovLeMzfk6KitYtu8j9120np8Bc4Dl0/JbP5jg/FC7DrHDNtSHkAbeBnEfLTYvNcGiZU7OVHKzCFlkDEnCZ7Zj04BTuXcEz1n/sPN8+H3k0JltcdA6KBe9ZFgkpO3wsJEQceE1cg/zKXvXiAdt/kHlqP1icjZn5e87IvGvSefETCjMJo5wuCT4w4xVCzS3IqyoHZw9BpckBkoe6riTXXLO4mXsDYEUFhot+gACwl66caE3V5RYviBj/qEDQ+rIIwQtxk5f7DwQH0+laws9rDYsvDL4bF4K2Vab8qAP+38U6UfTK2ATMUX7aUZtcUUwMTwpvDI/VnVinrsjpc9v2ejK02XS0iYFHItDwup+8XNNVatmUhkpgL3fZlnVOsYWo8zViYtJrkl7YuIzA18knZK21Kq3imzMvuNDtb6v58Du8eELpKvbXGaX5pc/IyHRu61rvWO+lvY9C62Fl/76KCXxZazdM2zpEkqA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR11MB7648.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(39860400002)(136003)(396003)(346002)(366004)(451199021)(110136005)(2906002)(91956017)(41300700001)(316002)(54906003)(478600001)(7406005)(7416002)(7366002)(31686004)(71200400001)(6486002)(66946007)(8676002)(66446008)(4326008)(8936002)(66556008)(76116006)(66476007)(64756008)(5660300002)(6506007)(26005)(53546011)(186003)(2616005)(83380400001)(36756003)(86362001)(38070700005)(921005)(38100700002)(122000001)(6512007)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S3dtLzAzbXU0R2dPZWtKSDZzMUp4bXk3Wms3TDVKK1JSaHZjbHpJZmtpUXNV?=
 =?utf-8?B?V3lwdDlHSzIzMUdyakx5aVNEWVVlNkh0dkEzdjdXV1poOFI1amlqdUpqdWVU?=
 =?utf-8?B?L3k2dFdtUGpzdXh5WVFYZmdVQjJDNXd4NnR0blNaWkRCTDZwemVEYi9PWnBM?=
 =?utf-8?B?OWE5ZFNhVHdPQy9Nb1VFcFVPdmp0SWc1SFlwNVU3YmtrNXY5bk1HK3hBMVFv?=
 =?utf-8?B?MEdsVEsrRlVZbjg2eVVBV28rV3ZSaklocFhtcmg5MEtOZFNuV0xUQzBOODNR?=
 =?utf-8?B?R0VBSzIyZGhRdXdUcXR1WWFYamIwN21KUU1MekZDTmIzRDk0dG14eVVmMDh5?=
 =?utf-8?B?RHZJemJQcXhQeEdGdkVRRkErNGphaFc5KzdlZDE1b2xoR0xKbjc1dE9RemZw?=
 =?utf-8?B?bDVLbGhFOURtTmEyR0tYcDNUazRpQUtvM1VSamFueTZNOWxVVmxnZXZia3lZ?=
 =?utf-8?B?QlAwUjB4dmJZYW83bVAxQzJkSEhhc3F3U2J6MkExdTNYNHhCRzhEQlpWcGM3?=
 =?utf-8?B?TzRZM0M1bGdUOHNsUnRRTzRiRGs4bUtFTUszdmkxK0crVUdVQXMwUUpLTzBh?=
 =?utf-8?B?OVBDZUNMaDAyaHM3VXNoNjE1MjA0WUxBdTBoOGdmM09pcjZ2d0hJaEszRG9w?=
 =?utf-8?B?UENEQ3l3Vm5RV2QwUUFWeWN2TWFKT0FER1cyblhId2FrcmF3Q1lYdDNqakhn?=
 =?utf-8?B?M3BSQVhOODgyOGFBRjQzMXJSNzJQUE5XUVYzSkFQSlRRVjVsbjVla2x1Y21K?=
 =?utf-8?B?anRsODBZcWNuUjV2eGZiQXZBQkJGZHY5Tnh3K0hYNWd2Q01Kd2h3Q0xNWmxq?=
 =?utf-8?B?dnBDOWl5TmZiNFlSb2NIaHFhTGxxMFZNeUxlRjJhR3ovdkRsak5DOWVudjlM?=
 =?utf-8?B?ODRIcHJUKzR0dU1kdkhGTFl1Q01JRkpwRThMVVVZVy80SjNyYUsxZVhIZm1k?=
 =?utf-8?B?Ukd1MzA4OFU5N1hmbmxnU2kyeE1hWkpKQnJYUUd2dWN0cDJ4VlJoeGRZbkND?=
 =?utf-8?B?aVJrR0E0VTJWREtJSCtPbmR1QUpsNGpXWDc3VDhXdzMwRUhRZDRSMUFURWtG?=
 =?utf-8?B?MldQT0RlT1loLzMzS3p2TUMxKzVJbHFHQUxyeWRDaTJZb2tpY21sbFN1RGln?=
 =?utf-8?B?a05zNXRvRXVWcFEyNEtwSnQ4bGs1eEsxbFl0SkhicHltdUFxWjM5bFJENFVh?=
 =?utf-8?B?VFFaT3lWWk41NVRaT1BSU1hxdGhHYXBPcWE0bTBQWUgzK25hdUlHMjBxVTlt?=
 =?utf-8?B?c2JidkNoQlJ0NHlITUxoWldqMnNpZlNURHcwVTB5eHNHY3BIWmo3V2k4b0NP?=
 =?utf-8?B?ZlRoMitQRHM3bVZhaTdTWVZjbWc5MU4vUzkwaWdqbDJKTnhjZzRkdVl2bE5o?=
 =?utf-8?B?dmQzeUNLeGgzYWJoZ3l0OU1nQVdQQUhFdUF3TENkL1VpbnlVQ0piTzVGS2Qy?=
 =?utf-8?B?cFVmSlFEZ0h1a0NUQW1lTnpqY2Y4b2hIaElIVkNoSDNIME1ycWxEbWRkMEV2?=
 =?utf-8?B?WHdDNHcwaW5vdnJVeDlEY09FN2kzdDRsRUYxSzM0WElCNnp4RC91emlvdVE4?=
 =?utf-8?B?WGxlaWhtZXZqSzN6OWk2eC9OK0xmcTBSdHA4VjdBbXJycytiYytvYkwyQVZi?=
 =?utf-8?B?QzUvTWpzcmIyVWdRQnQzNmdPMERzS0pLeTcwMlUxMWNTaWw4S1ZFbzd3ckR2?=
 =?utf-8?B?QW5HdDY2S3c5ZFU5N3NBSmU4cXI1WnpnbVRXQWJxZ1BYbWZGYUZiTUZNVk5a?=
 =?utf-8?B?bWlPQWhZR0tIRFlxbVN6d2RqQ01QLzBGTGc0eTVJS3o2YnlDSGN4d2hDbElx?=
 =?utf-8?B?WWhOVnEwVDlNYzlRc3lZZmxtRzVveVpwejNyT0RLRURSejRTNnNIbWIrdk1N?=
 =?utf-8?B?RzlSdWFENFpJUmhiakRuUUo2bEs5T0xnVjdaMmZSc0xCS3B2cURYZE9MTnpZ?=
 =?utf-8?B?L2VOMXpXZDVOZDB3dy8zeHFzMWlRYWM3NXEwZktOb0lkdGNZWE5iVmlJQUVF?=
 =?utf-8?B?cWkrTzNFcHY0ZDhZdFVadmJaeDFaMXRJRzQzdkhRcENReE9Kcnd3V0daZGVy?=
 =?utf-8?B?Wk51VGF2MnRENUZ6bUU2dWQ4a3B5aU14MkROMWtBOXpUT2NlMEhSdWVJWjZD?=
 =?utf-8?B?WXVlZGtkUW9OZTFuRzdlMUlnRE42cllmWlAxM1FwWnFZOGtKUmJuUlJTUFZF?=
 =?utf-8?B?UlE9PQ==?=
Content-ID: <5CDF0816C96D4B46AA2D2570930E37F2@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c72a09a-642c-47f3-562a-08db5772dd7c
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 May 2023 07:38:25.6333 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G+qwxf8q/DeJrMIiITjrg9bFuaCLfylK8CzHJI5SxpoHmmBKuG9pqJQgjwGS3LdK+3Qt67xwRXUpIxLvH3tjdljOq44y7XX5dNHF+0k6NxI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8017
Cc: linux-rtc@vger.kernel.org, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, linux-actions@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-renesas-soc@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Subject: Re: [Linux-stm32] [PATCH v3 07/65] clk: at91: sckc: Add a
	determine_rate hook
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

On 04.04.2023 13:10, Maxime Ripard wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> The SAM9x5 slow clock implements a mux with a set_parent hook, but
> doesn't provide a determine_rate implementation.
> 
> This is a bit odd, since set_parent() is there to, as its name implies,
> change the parent of a clock. However, the most likely candidate to
> trigger that parent change is a call to clk_set_rate(), with
> determine_rate() figuring out which parent is the best suited for a
> given rate.
> 
> The other trigger would be a call to clk_set_parent(), but it's far less
> used, and it doesn't look like there's any obvious user for that clock.
> 
> So, the set_parent hook is effectively unused, possibly because of an
> oversight. However, it could also be an explicit decision by the
> original author to avoid any reparenting but through an explicit call to
> clk_set_parent().
> 
> The latter case would be equivalent to setting the flag
> CLK_SET_RATE_NO_REPARENT, together with setting our determine_rate hook
> to __clk_mux_determine_rate(). Indeed, if no determine_rate
> implementation is provided, clk_round_rate() (through
> clk_core_round_rate_nolock()) will call itself on the parent if
> CLK_SET_RATE_PARENT is set, and will not change the clock rate
> otherwise. __clk_mux_determine_rate() has the exact same behavior when
> CLK_SET_RATE_NO_REPARENT is set.
> 
> And if it was an oversight, then we are at least explicit about our
> behavior now and it can be further refined down the line.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Claudiu Beznea <claudiu.beznea@microchip.com>

Tested-by: Claudiu Beznea <claudiu.beznea@microchip.com>

> ---
>  drivers/clk/at91/sckc.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/at91/sckc.c b/drivers/clk/at91/sckc.c
> index fdc9b669f8a7..9c42961a8a2f 100644
> --- a/drivers/clk/at91/sckc.c
> +++ b/drivers/clk/at91/sckc.c
> @@ -310,6 +310,7 @@ static u8 clk_sam9x5_slow_get_parent(struct clk_hw *hw)
>  }
> 
>  static const struct clk_ops sam9x5_slow_ops = {
> +       .determine_rate = __clk_mux_determine_rate,
>         .set_parent = clk_sam9x5_slow_set_parent,
>         .get_parent = clk_sam9x5_slow_get_parent,
>  };
> @@ -337,7 +338,7 @@ at91_clk_register_sam9x5_slow(void __iomem *sckcr,
>         init.ops = &sam9x5_slow_ops;
>         init.parent_names = parent_names;
>         init.num_parents = num_parents;
> -       init.flags = 0;
> +       init.flags = CLK_SET_RATE_NO_REPARENT;
> 
>         slowck->hw.init = &init;
>         slowck->sckcr = sckcr;
> 
> --
> 2.39.2
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
