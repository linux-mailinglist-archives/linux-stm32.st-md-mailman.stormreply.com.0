Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 736E4577A53
	for <lists+linux-stm32@lfdr.de>; Mon, 18 Jul 2022 07:22:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ED7E7C0D2B9;
	Mon, 18 Jul 2022 05:22:00 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 714F4C03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 Jul 2022 05:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1658121718; x=1689657718;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=nF2WyA4uet9smkd1LZYi12Qi8hrJQnoAFHYxJDF3S1w=;
 b=l2KtuyN4XUCjHDQlgGgwMLmR8jjJ4MF+aVZZL4gY8QUm6tlrD8x46eRU
 VaS0HF7dFsUr65DUY1yLHtVPcRqesl9EvWs987WXbNWnIGS7l6uFsurWR
 xB7DPV5hoVMwSc/Y8SKbjAEbju3hqFkOLwkMoMudjMWtK76TrC+f3hhWH
 YwvrtSuNe5gRJ7aKjtVU5zuOMaA17H4cR99jUeJO5yV4bolBwPhAdDheW
 RkcDNFhWIg8KKGxuc3XRQ1Z5ufuw0NqRa0bLgx5iNIR60vJDVurDyKGVs
 x66BaMBUSpSBGwrrX6/7mB89t4K61BT/EkHXCeS9wlt1SupkL2+Qip0Dq w==;
X-IronPort-AV: E=Sophos;i="5.92,280,1650956400"; d="scan'208";a="168251537"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 17 Jul 2022 22:21:54 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Sun, 17 Jul 2022 22:21:53 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Sun, 17 Jul 2022 22:21:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XVDaXktZTFKmaS1Q7IV7kB1OSekMn3Y54vTkXB8uSblS/4q814cKgKKPTe9Qrbw4ccZj0LbdrA1Tz4+ksnDJxfhqHsBtKvcT+gVs6+gGrvVFbzV6LeVBlQlAji6isRC7ryog9uDKjWeZ1mW4HGHK7SJ5D4qmjG49eepUTl0KxppX8OTC60UPFhfMyOG5Q2KH3WYZwO3D3p1c/UtJ4mMn8qA8T5f+Mw1maoMd0E027iL31Q84f3XXw7Bc1hms1bsnbiaNlQnhflEGFX0lNGgNvTZwf2hMFNkCKGi2fa9gMmtGRKuIsdx9DSWlaTroUJKkU9zOHKDxKnb1k0IaagDdAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nF2WyA4uet9smkd1LZYi12Qi8hrJQnoAFHYxJDF3S1w=;
 b=ZATsS2nIDE6qwSB7fNeqJ7qj4Cuo//Kj3AaOP1C4Zs0JBUDxWH4NVcTZV/PuInoux9sD9eAKVDMKXrXO+48CLWxHENfIzWCpwhKqrE45MokFCdOHFi7moLsETeeYDL2Lo7EGgtQJSkskMwpjZmBS6vN10Y/2R+D5TJKGss1S34BlJM1a6+YDlXtxebZecfTLBC1lImXESXjWbPg2YjCdLihwUBhYnOE4isWZHsnTMYgTqgU2ML5h/wxR0kccRfaOpyn9WN6E/sRcXpY4Fb1T5GBuIoHzzdxfeiiaGqWFpahpN4amJt45D6befL8/DW47W0VKdWmiAWVm5c4X8o+JTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nF2WyA4uet9smkd1LZYi12Qi8hrJQnoAFHYxJDF3S1w=;
 b=rsCtHlvNjoQXiq3aCLmFinzLFNAgzyhBVEv9+jEYmM+vIjAkdQxObTH/jeB/9ElS40CBmUw1NnCA6a6KGKr19ZNgA42H6P7L+Zoay4RViO9e6ini1bmOWCyHkm7bD6V1o6eKO2bNUuCKE4yMjlXOkSNDD92GYl3DTSeWNtSNg3M=
Received: from BN6PR11MB1953.namprd11.prod.outlook.com (2603:10b6:404:105::14)
 by MWHPR11MB1773.namprd11.prod.outlook.com (2603:10b6:300:10f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.14; Mon, 18 Jul
 2022 05:21:48 +0000
Received: from BN6PR11MB1953.namprd11.prod.outlook.com
 ([fe80::5c8c:c31f:454d:824c]) by BN6PR11MB1953.namprd11.prod.outlook.com
 ([fe80::5c8c:c31f:454d:824c%8]) with mapi id 15.20.5438.023; Mon, 18 Jul 2022
 05:21:48 +0000
From: <Claudiu.Beznea@microchip.com>
To: <nuno.sa@analog.com>, <openbmc@lists.ozlabs.org>, <linux-imx@nxp.com>,
 <linux-stm32@st-md-mailman.stormreply.com>, <linux-iio@vger.kernel.org>,
 <linux-mips@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <chrome-platform@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>,
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, <linux-arm-msm@vger.kernel.org>
Thread-Topic: [PATCH v3 09/15] iio: adc: at91-sama5d2_adc: convert to device
 properties
Thread-Index: AQHYmmZH+bXCt9SIWESU/qLNP3LjdQ==
Date: Mon, 18 Jul 2022 05:21:47 +0000
Message-ID: <ada4c2a2-e13d-77aa-f489-7cc0a063adbd@microchip.com>
References: <20220715122903.332535-1-nuno.sa@analog.com>
 <20220715122903.332535-10-nuno.sa@analog.com>
In-Reply-To: <20220715122903.332535-10-nuno.sa@analog.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f3894d75-77c9-4623-3755-08da687d69a7
x-ms-traffictypediagnostic: MWHPR11MB1773:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7gUfF/7KnEwUrbi/wYeqqxZHY35VynAchdS/rYkwVJtGdZ4D7QEspRQc5mbSOwGFZlAIAm4kzEP2uEFJik9ING2F5DjWXBep+ppzBUwTOM/LGqEAcgXQgSEEFbarmsppud7Z7iIFK9HWbO7bFDzll2HiZyiJbUvfK85ldzuypYuGc81lnDHBA+GgLFzok9Ke8mGIa/ncUtg4JqWyMfO4TOOLJ780z5VA1bZGZfLWkafyPWg7WY/I4DvIyP1zeZsqdyxlpNFc2c7z0Qa76END5Nk7QMJW20x3fyfaT4/snEHGHDiDWZvPZ7nz3t9uNUUwAHRpDJvsS1vSCwxs0IBceIemHhCAXsYrSvw15u0NEmDxIS/7nI+NOXtGKL3Er+11/cvLfa9JfVLxpEoqRqU9z1ZERMJaGY1AzaWQhygCOLA6AeOgha6YNiBxpQk8WHZ2sXmUF4pPIsmIKI9yPeyFZPNnSsd7tsYHwFfLEb6BYXiLQ9PR0T6zYxFlvutwKhYNorF/grNox8vj8/KDvvQqK1wY0AnG+Y4wHa+K0hom+7LmlNkysIWkFCe9m1zVpZCD/UAfCQD+GuhgEOXxPgBGV2JCqcghFPmbsIoN0ZQKA+BI4WeuC1+GTmO5KjArCokNHVpr1OsPX3393C7eP2DnqYZ2NWwJc4BLj+lZ3OThnpGBasInaqx/92oglSEWglLn7uVhn5aDK7L2xs2p+ijPdBXSQ2JwiMXTAQBlc+ymyw/Znh4k6w5nZvzQ2wn99mlUhJIKGr74vBpar/vm1+XCQxqzIwyNNycXgGTqzkutI2jXJ34Qod02QF/MvkT6kC8PilmDIlix1oa+LFCSTHZwN5qOcVWF6jhR/ftFVfjUUKTf8GsII45GWdAx0R0jZNHtY1xOoPeIlIfrTEDZNiQ/Ag==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR11MB1953.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(346002)(136003)(396003)(39860400002)(376002)(478600001)(5660300002)(31696002)(8936002)(83380400001)(41300700001)(86362001)(6486002)(2906002)(6506007)(2616005)(26005)(6512007)(7366002)(7406005)(186003)(7416002)(53546011)(38100700002)(31686004)(4326008)(36756003)(91956017)(64756008)(66446008)(66476007)(66556008)(76116006)(66946007)(122000001)(110136005)(45080400002)(921005)(316002)(8676002)(54906003)(71200400001)(38070700005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UEN0dzlRbVoyOCs0M2F1VDdjZm5TQWhvQnY5T1RNMHF0c09OYjY3MjMvaCtG?=
 =?utf-8?B?RXlpNnkwVkRsYk00WVMrcGJJNjJSL1RRQUI0Y2hZMWl6ZDhLc0J1K3UvdDBo?=
 =?utf-8?B?NmNKVjFlRzRyeXUyMkJDNEh4NmRVUTVFN3djaUZQdzdYYlJZN1o0RWpzamNr?=
 =?utf-8?B?VitudWJmVjVOU0xOT0RvUGo2c2pmL21laFJxY0phdXQwa3NaNGx5Wkg5bmRW?=
 =?utf-8?B?aWF6QjAxd2prYWU2eXJZRWkxUG1uVW5UNjdPMHE0NEVuenhLVVdRaVQvM0k3?=
 =?utf-8?B?bkRmSEFSNVRuZ1BOZEtoNFV4eEpyU3ZXRzdIUHRlQWxJc2s1YUFVbm4xT1U5?=
 =?utf-8?B?NVhHY2xlcGdOUzFUdklxQXM2MkR6Z1dCNzFEZ1FPMFc5cmhGNTJKNFJvSHU5?=
 =?utf-8?B?QUhZV2lHaHRVWmtwZE9XT3dvZFJMRW9mTmtHU0xGbFY4MDVVckNwdVNZYWZs?=
 =?utf-8?B?R1d3Vkd5eHBMVjlnbWdmdXpFN2hYaUdOaWxXUHJuWkJMVlhmQTNZYkpyOXgz?=
 =?utf-8?B?TXdqQlVvUGpNOXo4Zk02S2NOR3ArU1Yxb0kvR0tGSHdZUkdnZmt6dFcyT21a?=
 =?utf-8?B?THhDSGZEdmVHbk0zQUVheW1YZlJhdXNYVUhrYjVURjZtMnRIMlA1cmFYTHl6?=
 =?utf-8?B?Q3NwRE15bW03OE50b1ozOTEwam5lZW51TGtLOW4xQ0FkcVU5WE1Pdjh5dWdT?=
 =?utf-8?B?NzAydTZvZjJNU01Uc3NHSGxFL0xISHN1a0U2UWc3ZjBZNGxVaWZzMFR6RlB6?=
 =?utf-8?B?VUJYVGd1Z1dzMmNCZ1ZMUnRvcEtrQloxQzhZQWdVV2FhMjVBMmpFUnRTSWh6?=
 =?utf-8?B?ei9uU2JTZnR3SnZzM05hUzBaanlPVXY2Q3M5Z3FxVTg1UU4zSmFnMWtiK0p1?=
 =?utf-8?B?ZTB3eFFsaXlYbjF4dWVKci9BcEdNY29oUmwwMFp2Mm5iYXRPVDNRMm9wWi9C?=
 =?utf-8?B?aG5UNHNXU1lZdUNBUXk4eWdNY3pGaHo5a0k2Z3NqSHVkRHU4V1VNb1NDVktj?=
 =?utf-8?B?UHN2c0VKcVdtMU11c1lKSWU2dXVINzRDeTZmRW9ROFRmZTF5RCtvYXJiOFNZ?=
 =?utf-8?B?ZTBUcUkwZm5NNzl3WjB0WUlyMGVCQ0lOaU9wRUc5b3FjUDJnWmE1TDVPbnlY?=
 =?utf-8?B?bTVXQnBTaHhGMUI0UHZHTi9RT05ETDhZNEZyMjFRUElLbHUwTWVKSUwybnRE?=
 =?utf-8?B?TGFHYmxSYklZcWJOWnIwQmtqWk1kcTBBMjZlYU1KVzdvSzF6MERpRVk1Z3I0?=
 =?utf-8?B?REhOUTgya1dmTnF2L0VMM2xJd2R4TFdMMzBReDlLMTUxbm5aLzBlZ3IvZEdY?=
 =?utf-8?B?TGlYU1FUb0ppZHdNUHNYWWRIUUNNYUtFd1A3ZXd6b21PdVc0SkhKSGF3U0s5?=
 =?utf-8?B?OU5ZYmZURkNRaFNtR0VFNUtrSk9KYmRaazF1S0RLSisxYTZzK0ZRTWNPRTVK?=
 =?utf-8?B?NjNlUy9DSFN0YWw4TUk2UStRSGw0RWxPbTZZbHZJbEJoZ1ZGdjJBYi8vZnJM?=
 =?utf-8?B?QlVPY1oveTJiVWo4V05kVDNFRHp0ekFFQVlqUUQ0UDJ6U1YzVktMWHU4TlJT?=
 =?utf-8?B?Q09lMVZKdXJheU9UYTVOQnQvS2VlaU40bDV4UERkRDIxR1FrMkpTREhEUlhI?=
 =?utf-8?B?M3VVNE41ZHovb1kvM1N1cWhHR0FOTXBvZW1oQ2Qrbm9tTTdBTkp6S2k4ZjND?=
 =?utf-8?B?b3R5Y1dleXlabWJmd1kvT3YzZFlLT0YrcHNVM3VJQW5ZMW15THlqMy9iS1I0?=
 =?utf-8?B?SzJWUTFKM1FWWUNWYVFkWElGbm82cjhBT0dta2RpWXM4RUtRNXpJZ0NpTktN?=
 =?utf-8?B?aTRjYklqcXRiNTJKaEUwV1FZMzUwZ0VtdU93T3M0QmNiaTZ3Ni9XQTdkSnlk?=
 =?utf-8?B?Yis3RkIvUWdRaUdkZENsL2x3bTZ0akt2ZytEVk9xei9ydFh0SFJKaVZ4YS9j?=
 =?utf-8?B?OUl3SkZ4cmtneXltaStlY3hzSCtnNGFpa203K3BTNTdET1hyamUwS1dFOTZI?=
 =?utf-8?B?VWlwZFB2eTVMMkorOE5UTitjcWtxVXJSMUpnK2swMU1iZiszc2pwQlR1cHN6?=
 =?utf-8?B?T0RTZGE0UE5IZ0hadjlHRnYwNnBhWHlpbWJTZ2xUOWZzYWJLYUxSeGxra0Er?=
 =?utf-8?B?KzQzTTd3V3kzWklQRnFoY1lxS0JtMXR0Y1pHbTFEN0dneFFxYkZlaXZsUVhI?=
 =?utf-8?B?WGc9PQ==?=
Content-ID: <00A35A8B5118944294F79CEB4A2BE862@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB1953.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3894d75-77c9-4623-3755-08da687d69a7
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2022 05:21:47.8644 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Th/AHPZDUgjTF0LshVt/tHY0Ou0qWTPAen/aIDq6R5XvmcRJ/SSjDyXNeSFO18LOdUOallr2bMSqsSyyqkMJtsPtYiWlD7+Pga1727D9QB4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1773
Cc: gwendal@chromium.org, quic_jprakash@quicinc.com, tmaimon77@gmail.com,
 alexandre.belloni@bootlin.com, rafael@kernel.org, linus.walleij@linaro.org,
 amitk@kernel.org, tali.perry1@gmail.com, paul@crapouillou.net,
 miquel.raynal@bootlin.com, groeck@chromium.org, festevam@gmail.com,
 Michael.Hennerich@analog.com, lars@metafoo.de, benjaminfair@google.com,
 daniel.lezcano@linaro.org, haibo.chen@nxp.com, cbranchereau@gmail.com,
 yuenn@google.com, andy.shevchenko@gmail.com, agross@kernel.org,
 rui.zhang@intel.com, lorenzo@kernel.org, sravanhome@gmail.com, arnd@arndb.de,
 s.hauer@pengutronix.de, cai.huoqing@linux.dev, matthias.bgg@gmail.com,
 bjorn.andersson@linaro.org, bleung@chromium.org, kernel@pengutronix.de,
 avifishman70@gmail.com, venture@google.com, Nicolas.Ferre@microchip.com,
 thara.gopinath@linaro.org, mcoquelin.stm32@gmail.com,
 Eugen.Hristev@microchip.com, shawnguo@kernel.org, jic23@kernel.org
Subject: Re: [Linux-stm32] [PATCH v3 09/15] iio: adc: at91-sama5d2_adc:
 convert to device properties
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

T24gMTUuMDcuMjAyMiAxNToyOCwgTnVubyBTw6Egd3JvdGU6DQo+IEVYVEVSTkFMIEVNQUlMOiBE
byBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IGtub3cgdGhl
IGNvbnRlbnQgaXMgc2FmZQ0KPiANCj4gTWFrZSB0aGUgY29udmVyc2lvbiB0byBmaXJtd2FyZSBh
Z25vc3RpYyBkZXZpY2UgcHJvcGVydGllcy4gQXMgcGFydCBvZg0KPiB0aGUgY29udmVyc2lvbiB0
aGUgSUlPIGlua2VybiBpbnRlcmZhY2UgJ29mX3hsYXRlKCknIGlzIGFsc28gY29udmVydGVkIHRv
DQo+ICdmd25vZGVfeGxhdGUoKScuIFRoZSBnb2FsIGlzIHRvIGNvbXBsZXRlbHkgZHJvcCAnb2Zf
eGxhdGUnIGFuZCBoZW5jZSBPRg0KPiBkZXBlbmRlbmNpZXMgZnJvbSBJSU8uDQo+IA0KPiBTaWdu
ZWQtb2ZmLWJ5OiBOdW5vIFPDoSA8bnVuby5zYUBhbmFsb2cuY29tPg0KPiBSZXZpZXdlZC1ieTog
QW5keSBTaGV2Y2hlbmtvIDxhbmR5LnNoZXZjaGVua29AZ21haWwuY29tPg0KDQpSZXZpZXdlZC1i
eTogQ2xhdWRpdSBCZXpuZWEgPGNsYXVkaXUuYmV6bmVhQG1pY3JvY2hpcC5jb20+DQoNCg0KPiAt
LS0NCj4gIGRyaXZlcnMvaWlvL2FkYy9hdDkxLXNhbWE1ZDJfYWRjLmMgfCAzMCArKysrKysrKysr
KysrKystLS0tLS0tLS0tLS0tLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCsp
LCAxNSBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2lpby9hZGMvYXQ5
MS1zYW1hNWQyX2FkYy5jIGIvZHJpdmVycy9paW8vYWRjL2F0OTEtc2FtYTVkMl9hZGMuYw0KPiBp
bmRleCBmZTMxMzFjOTU5M2MuLmRmNzE2NTg0YzExNyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9p
aW8vYWRjL2F0OTEtc2FtYTVkMl9hZGMuYw0KPiArKysgYi9kcml2ZXJzL2lpby9hZGMvYXQ5MS1z
YW1hNWQyX2FkYy5jDQo+IEBAIC0xNiw4ICsxNiw5IEBADQo+ICAjaW5jbHVkZSA8bGludXgvaW50
ZXJydXB0Lmg+DQo+ICAjaW5jbHVkZSA8bGludXgvaW8uaD4NCj4gICNpbmNsdWRlIDxsaW51eC9t
b2R1bGUuaD4NCj4gLSNpbmNsdWRlIDxsaW51eC9vZl9kZXZpY2UuaD4NCj4gKyNpbmNsdWRlIDxs
aW51eC9tb2RfZGV2aWNldGFibGUuaD4NCj4gICNpbmNsdWRlIDxsaW51eC9wbGF0Zm9ybV9kZXZp
Y2UuaD4NCj4gKyNpbmNsdWRlIDxsaW51eC9wcm9wZXJ0eS5oPg0KPiAgI2luY2x1ZGUgPGxpbnV4
L3NjaGVkLmg+DQo+ICAjaW5jbHVkZSA8bGludXgvd2FpdC5oPg0KPiAgI2luY2x1ZGUgPGxpbnV4
L2lpby9paW8uaD4NCj4gQEAgLTY1MCw4ICs2NTEsOCBAQCBhdDkxX2FkY19jaGFuX2dldChzdHJ1
Y3QgaWlvX2RldiAqaW5kaW9fZGV2LCBpbnQgY2hhbikNCj4gICAgICAgICByZXR1cm4gaW5kaW9f
ZGV2LT5jaGFubmVscyArIGluZGV4Ow0KPiAgfQ0KPiANCj4gLXN0YXRpYyBpbmxpbmUgaW50IGF0
OTFfYWRjX29mX3hsYXRlKHN0cnVjdCBpaW9fZGV2ICppbmRpb19kZXYsDQo+IC0gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IHN0cnVjdCBvZl9waGFuZGxlX2FyZ3MgKmlp
b3NwZWMpDQo+ICtzdGF0aWMgaW5saW5lIGludCBhdDkxX2FkY19md25vZGVfeGxhdGUoc3RydWN0
IGlpb19kZXYgKmluZGlvX2RldiwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGNvbnN0IHN0cnVjdCBmd25vZGVfcmVmZXJlbmNlX2FyZ3MgKmlpb3NwZWMpDQo+ICB7
DQo+ICAgICAgICAgcmV0dXJuIGF0OTFfYWRjX2NoYW5feGxhdGUoaW5kaW9fZGV2LCBpaW9zcGVj
LT5hcmdzWzBdKTsNCj4gIH0NCj4gQEAgLTE4NzYsNyArMTg3Nyw3IEBAIHN0YXRpYyBjb25zdCBz
dHJ1Y3QgaWlvX2luZm8gYXQ5MV9hZGNfaW5mbyA9IHsNCj4gICAgICAgICAucmVhZF9yYXcgPSAm
YXQ5MV9hZGNfcmVhZF9yYXcsDQo+ICAgICAgICAgLndyaXRlX3JhdyA9ICZhdDkxX2FkY193cml0
ZV9yYXcsDQo+ICAgICAgICAgLnVwZGF0ZV9zY2FuX21vZGUgPSAmYXQ5MV9hZGNfdXBkYXRlX3Nj
YW5fbW9kZSwNCj4gLSAgICAgICAub2ZfeGxhdGUgPSAmYXQ5MV9hZGNfb2ZfeGxhdGUsDQo+ICsg
ICAgICAgLmZ3bm9kZV94bGF0ZSA9ICZhdDkxX2FkY19md25vZGVfeGxhdGUsDQo+ICAgICAgICAg
Lmh3Zmlmb19zZXRfd2F0ZXJtYXJrID0gJmF0OTFfYWRjX3NldF93YXRlcm1hcmssDQo+ICB9Ow0K
PiANCj4gQEAgLTE5MjAsNiArMTkyMSw3IEBAIHN0YXRpYyBpbnQgYXQ5MV9hZGNfYnVmZmVyX2Fu
ZF90cmlnZ2VyX2luaXQoc3RydWN0IGRldmljZSAqZGV2LA0KPiANCj4gIHN0YXRpYyBpbnQgYXQ5
MV9hZGNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gIHsNCj4gKyAgICAg
ICBzdHJ1Y3QgZGV2aWNlICpkZXYgPSAmcGRldi0+ZGV2Ow0KPiAgICAgICAgIHN0cnVjdCBpaW9f
ZGV2ICppbmRpb19kZXY7DQo+ICAgICAgICAgc3RydWN0IGF0OTFfYWRjX3N0YXRlICpzdDsNCj4g
ICAgICAgICBzdHJ1Y3QgcmVzb3VyY2UgKnJlczsNCj4gQEAgLTE5MzMsNyArMTkzNSw3IEBAIHN0
YXRpYyBpbnQgYXQ5MV9hZGNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4g
ICAgICAgICBzdCA9IGlpb19wcml2KGluZGlvX2Rldik7DQo+ICAgICAgICAgc3QtPmluZGlvX2Rl
diA9IGluZGlvX2RldjsNCj4gDQo+IC0gICAgICAgc3QtPnNvY19pbmZvLnBsYXRmb3JtID0gb2Zf
ZGV2aWNlX2dldF9tYXRjaF9kYXRhKCZwZGV2LT5kZXYpOw0KPiArICAgICAgIHN0LT5zb2NfaW5m
by5wbGF0Zm9ybSA9IGRldmljZV9nZXRfbWF0Y2hfZGF0YShkZXYpOw0KPiANCj4gICAgICAgICBp
bmRpb19kZXYtPm5hbWUgPSBkZXZfbmFtZSgmcGRldi0+ZGV2KTsNCj4gICAgICAgICBpbmRpb19k
ZXYtPm1vZGVzID0gSU5ESU9fRElSRUNUX01PREUgfCBJTkRJT19CVUZGRVJfU09GVFdBUkU7DQo+
IEBAIC0xOTUwLDM0ICsxOTUyLDMyIEBAIHN0YXRpYyBpbnQgYXQ5MV9hZGNfcHJvYmUoc3RydWN0
IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gDQo+ICAgICAgICAgc3QtPm92ZXJzYW1wbGluZ19y
YXRpbyA9IEFUOTFfT1NSXzFTQU1QTEVTOw0KPiANCj4gLSAgICAgICByZXQgPSBvZl9wcm9wZXJ0
eV9yZWFkX3UzMihwZGV2LT5kZXYub2Zfbm9kZSwNCj4gLSAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAiYXRtZWwsbWluLXNhbXBsZS1yYXRlLWh6IiwNCj4gLSAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAmc3QtPnNvY19pbmZvLm1pbl9zYW1wbGVfcmF0ZSk7DQo+ICsg
ICAgICAgcmV0ID0gZGV2aWNlX3Byb3BlcnR5X3JlYWRfdTMyKGRldiwgImF0bWVsLG1pbi1zYW1w
bGUtcmF0ZS1oeiIsDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZz
dC0+c29jX2luZm8ubWluX3NhbXBsZV9yYXRlKTsNCj4gICAgICAgICBpZiAocmV0KSB7DQo+ICAg
ICAgICAgICAgICAgICBkZXZfZXJyKCZwZGV2LT5kZXYsDQo+ICAgICAgICAgICAgICAgICAgICAg
ICAgICJpbnZhbGlkIG9yIG1pc3NpbmcgdmFsdWUgZm9yIGF0bWVsLG1pbi1zYW1wbGUtcmF0ZS1o
elxuIik7DQo+ICAgICAgICAgICAgICAgICByZXR1cm4gcmV0Ow0KPiAgICAgICAgIH0NCj4gDQo+
IC0gICAgICAgcmV0ID0gb2ZfcHJvcGVydHlfcmVhZF91MzIocGRldi0+ZGV2Lm9mX25vZGUsDQo+
IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgImF0bWVsLG1heC1zYW1wbGUtcmF0
ZS1oeiIsDQo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJnN0LT5zb2NfaW5m
by5tYXhfc2FtcGxlX3JhdGUpOw0KPiArICAgICAgIHJldCA9IGRldmljZV9wcm9wZXJ0eV9yZWFk
X3UzMihkZXYsICJhdG1lbCxtYXgtc2FtcGxlLXJhdGUtaHoiLA0KPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAmc3QtPnNvY19pbmZvLm1heF9zYW1wbGVfcmF0ZSk7DQo+
ICAgICAgICAgaWYgKHJldCkgew0KPiAgICAgICAgICAgICAgICAgZGV2X2VycigmcGRldi0+ZGV2
LA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAiaW52YWxpZCBvciBtaXNzaW5nIHZhbHVlIGZv
ciBhdG1lbCxtYXgtc2FtcGxlLXJhdGUtaHpcbiIpOw0KPiAgICAgICAgICAgICAgICAgcmV0dXJu
IHJldDsNCj4gICAgICAgICB9DQo+IA0KPiAtICAgICAgIHJldCA9IG9mX3Byb3BlcnR5X3JlYWRf
dTMyKHBkZXYtPmRldi5vZl9ub2RlLCAiYXRtZWwsc3RhcnR1cC10aW1lLW1zIiwNCj4gLSAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmc3QtPnNvY19pbmZvLnN0YXJ0dXBfdGltZSk7
DQo+ICsgICAgICAgcmV0ID0gZGV2aWNlX3Byb3BlcnR5X3JlYWRfdTMyKGRldiwgImF0bWVsLHN0
YXJ0dXAtdGltZS1tcyIsDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICZzdC0+c29jX2luZm8uc3RhcnR1cF90aW1lKTsNCj4gICAgICAgICBpZiAocmV0KSB7DQo+ICAg
ICAgICAgICAgICAgICBkZXZfZXJyKCZwZGV2LT5kZXYsDQo+ICAgICAgICAgICAgICAgICAgICAg
ICAgICJpbnZhbGlkIG9yIG1pc3NpbmcgdmFsdWUgZm9yIGF0bWVsLHN0YXJ0dXAtdGltZS1tc1xu
Iik7DQo+ICAgICAgICAgICAgICAgICByZXR1cm4gcmV0Ow0KPiAgICAgICAgIH0NCj4gDQo+IC0g
ICAgICAgcmV0ID0gb2ZfcHJvcGVydHlfcmVhZF91MzIocGRldi0+ZGV2Lm9mX25vZGUsDQo+IC0g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgImF0bWVsLHRyaWdnZXItZWRnZS10eXBl
IiwgJmVkZ2VfdHlwZSk7DQo+ICsgICAgICAgcmV0ID0gZGV2aWNlX3Byb3BlcnR5X3JlYWRfdTMy
KGRldiwgImF0bWVsLHRyaWdnZXItZWRnZS10eXBlIiwNCj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgJmVkZ2VfdHlwZSk7DQo+ICAgICAgICAgaWYgKHJldCkgew0KPiAg
ICAgICAgICAgICAgICAgZGV2X2RiZygmcGRldi0+ZGV2LA0KPiAgICAgICAgICAgICAgICAgICAg
ICAgICAiYXRtZWwsdHJpZ2dlci1lZGdlLXR5cGUgbm90IHNwZWNpZmllZCwgb25seSBzb2Z0d2Fy
ZSB0cmlnZ2VyIGF2YWlsYWJsZVxuIik7DQo+IC0tDQo+IDIuMzcuMQ0KPiANCg0KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGlu
ZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9z
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
