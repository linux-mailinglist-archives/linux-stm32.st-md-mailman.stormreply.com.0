Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EDBC5E9CE8
	for <lists+linux-stm32@lfdr.de>; Mon, 26 Sep 2022 11:05:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 445D7C5EC6B;
	Mon, 26 Sep 2022 09:05:58 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C9C5FC035BA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Sep 2022 09:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1664183157; x=1695719157;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=/MbKK/Tnrpd7i5sPPg92iolNhX8uZRcmvfVp+94dc30=;
 b=V0YziF3Ysqza91HcJDbp2QGl9yfvrLF6uaWlPtZURVI6LYnJoGhZQ0k8
 hD9VFQKZcKA6OTnzWLnFRW8aM0jpj8KIC13nopJmchVGyI414qq24vvCb
 myRZ21etd3PhbeDsIFUk3M5Sf6Dee3POO2I64YW3eDKcxrPhOGT98/HEz
 67RI+gRUNvQJOnotGIA8TQMEbCdYSdOorveEyvDc9L5D2+Frbz+VuDFrx
 I2fiyJ22br7yF8N7TZwlGgtrzmXZqMHHA8Nv5IVw9VGXdT/t7ecfLutaQ
 i2eXv/8bgFY1eqim+MM8fRWDH5RE17N0Oudvr6u0h5x7M7QYjSD+ZwSXw w==;
X-IronPort-AV: E=Sophos;i="5.93,345,1654585200"; d="scan'208";a="182065228"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 26 Sep 2022 02:05:53 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Mon, 26 Sep 2022 02:05:51 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12 via Frontend Transport; Mon, 26 Sep 2022 02:05:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BgqBLJqvOZXspcC4YX07tOE62nJMTt4DtnIwku2WaGD9oJb9nM/6APQS4rZecBhDlbi3rDOlpI6Olsj7sxUb/0h3tnRmzoSUe1GFMx453YRM2wP/Lu5CUOOzSA4Ac3bfWZ3UzegcdfR1IEMHwpL83JNQHumzTxsvsSSBxzJCwB3w2K2i7AH8XIkqIGe8GrjlN37I+b15hT4WZieAyxCsEz+h9ucTvsCPj5Pi9sXZxU/ve3uZ0iI21daso/q3t61QI4dYm4uQZBGWSD1HepJDQUp8zw8tCuPOYw85myhWf/9YOn5/7OJTvBJszKptyUNXewXco4u28/xm1gYq6WUnoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/MbKK/Tnrpd7i5sPPg92iolNhX8uZRcmvfVp+94dc30=;
 b=A/WWo6USi8r29B2kLS09BWhdFoIiGNTM3hWWWcztVz7OtkSsr9vywsHV8D9QJGh80kHFsHpJSPsSft05Dog/88AMj8xy70hlK29JRrmD/goHnpfzMj47i/CzteiLi9kM4Szo81GNLopqu4m8EhFLgM0Uk7kNVYsC4MusTpziMS8nUOSeGMP5zsLZtDYT+nKFGVEzrzDjM37Mg4J9Zg+L4anSZwNsWDakcHqzjYMDwOxZMizT0tfRQAMSooRZxYitj7ywTFfTgD9Mie8XK5jc5vPCHEzNix3boBw7WbE5MPxfAzecO5WYGwBKctAYhC51ZdKSK2HNivyhe35k8Y03RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/MbKK/Tnrpd7i5sPPg92iolNhX8uZRcmvfVp+94dc30=;
 b=nSEHKtYqHtl5U7xKGyhodPXuvGzMutkTENvhHTB7gpAbu3+FNw3ZaTysOfAqmO9J9IFq/4OYykBVdkvxcuWGZyySJYrrlXQcEcS0OMLDsIaUaJ4kwftgALG77AbbK+tqmAzBAFt+v03kh+cJ9VOj1fdYKCJxll15qo1oyAPMNno=
Received: from BYAPR11MB2758.namprd11.prod.outlook.com (2603:10b6:a02:c9::11)
 by PH7PR11MB6546.namprd11.prod.outlook.com (2603:10b6:510:212::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Mon, 26 Sep
 2022 09:05:50 +0000
Received: from BYAPR11MB2758.namprd11.prod.outlook.com
 ([fe80::5d0a:7887:8de:b815]) by BYAPR11MB2758.namprd11.prod.outlook.com
 ([fe80::5d0a:7887:8de:b815%7]) with mapi id 15.20.5654.025; Mon, 26 Sep 2022
 09:05:50 +0000
From: <Sergiu.Moga@microchip.com>
To: <fancer.lancer@gmail.com>
Thread-Topic: [PATCH] spi: Replace `dummy.nbytes` with `dummy.ncycles`
Thread-Index: AQHYxgbXv+Ia8IJsckeaEgMIjUdYyq3wyR0AgAC5KwA=
Date: Mon, 26 Sep 2022 09:05:49 +0000
Message-ID: <18e6e8a8-6412-7e31-21e0-6becd4400ac1@microchip.com>
References: <20220911174551.653599-1-sergiu.moga@microchip.com>
 <20220925220304.buk3yuqoh6vszfci@mobilestation>
In-Reply-To: <20220925220304.buk3yuqoh6vszfci@mobilestation>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR11MB2758:EE_|PH7PR11MB6546:EE_
x-ms-office365-filtering-correlation-id: 99d92481-1c72-4b54-3102-08da9f9e4e8b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: D2+adhypESBve38Hocb1FelT+udgwClnCXlu9EikkiWe2Fy3yBmyghpHAjIHlobd18pOzKMgpJx1ucLJcBfjNghocptGx/Uw/u2jP3uR8qESJ6T5IUbkAuiPXrm0IIQwm0HU6uC7N996BxHX1aVwHlLrdoO+QioPD+Ix65kbQem2ZfFU27gwxMLWHQqNdVmDWW12sCovS2HfFuuXAPEh7N0grGzV3IKxvwHfK7C5oA3G3fE5kT6djZ0CRSeTFODkMRQ2qEIghDV+g1ZwDrIbTuZwSobvX676DMgXNA2kc3Jn6rVL5geMn+YdTREtU7nz1nBpiT7nwrFRHUqpKLfMai2baqAIcisXbNHCuxn/CUYAzlWffHwvN0YFD6Slnj49CQA0jzSNADiN02lw6G1IAjRh48/hm1B0MlK/R6wjdLtDs8MTrGeAPtyu6Zjcv75yoJ1UNBg9fTrgLY/Lk7JvdKE61HbH8e2IXLrd+ebQulPQ8dr6kSYf4GYQlDvcdxTewso6mwKpiACPqGK6OcJFExFEF4d7/zLCp2R4xFBi2vvIM8H9swb2RFnMdGp6NJ0Sr8qISt/B3v9R4PQtyIXomokFU5ZcyOU/NM7mjtBgZ/M8ddQoAkBaC0sZ8R+anEeMbXYKjF5VBZZb6rzcQ5fYVVH/ndmAWqZ23W5qyYB56EeKjo4ozwFoxiqiZGOFpo+srEr3vsdYUO8Wtd/rXgffwXhbH9uChQKJii6eUc/YaVF+2F5c4kGaNnacrWn0mUIvporo5bjzFMV9T05s1KRDHw7rflKBNi3J478QvybXLE/IJjav2cykndKim+p6ZlNDDoQXuEgPGkXDkuW2yxbRdA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2758.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(346002)(396003)(376002)(136003)(39860400002)(451199015)(38070700005)(83380400001)(36756003)(38100700002)(122000001)(8676002)(66476007)(64756008)(66556008)(66446008)(91956017)(66946007)(76116006)(4326008)(8936002)(31696002)(30864003)(7416002)(2906002)(5660300002)(7406005)(53546011)(6506007)(86362001)(41300700001)(6486002)(2616005)(186003)(6512007)(478600001)(54906003)(316002)(6916009)(71200400001)(26005)(31686004)(81973001)(45980500001)(579004)(559001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZG5JemkvQ1Q5bHJySFlSOUs2dDRWMUUyT3NNdC9vWXVBSzZuOFgxdTdVLzlk?=
 =?utf-8?B?K3IxdXFlLzI3RE5WL2JlREZIa3RVZ3kvbEFDSXdwVWNtRXljeE44MWdnNHBO?=
 =?utf-8?B?aVRURVFtYmducUFIakJmTnc5TEhjOW9JRjdyREJ2N0M2Z2VaMFNJM01Cd1pS?=
 =?utf-8?B?Z0RxeTc2OFRzV3JTM0hmZWVaVW5zNDlYQjdZQmtobmhsMWVERW8yUm5FSlBR?=
 =?utf-8?B?REFTUVVpSUc3dUZObTJDMVo5OEZMWnpUNmVaSVVRZlpQNmsrMWQ0K1oyVDQ1?=
 =?utf-8?B?cG8rajNNUExzKzJ0ZVRycXBrazFBS3lJb2RJaWk1U2RZekVaTXc3RDlOSThX?=
 =?utf-8?B?bGpVOWpQNjZmSHJNVk5rUzhqYUh0MC9sckdONkhzb3RzYUh1L0ZCTFZ5V3VL?=
 =?utf-8?B?bzYvbFptN3ZsUnk0L2pEZjdiSzlTaTJ4bzFWbS9hTTBxQWZPMVlQL2Q3OGZp?=
 =?utf-8?B?QmkvenNweWVFaFhISlgyS0M3WHBtb3kzVEMxUndqenFzNFZPbFVqZ0pyeENV?=
 =?utf-8?B?UTdETFlCTEVHcmZWWTV0dG9wUm4wL0oyN1FGdG5FWi9NOXprZW1Dckp5SjB5?=
 =?utf-8?B?cS9zWURwU0xPbEh3bFB2ZWNyVXFPeXBMNkUvQ0YyRTJjbWpncWRhcDUyQjhZ?=
 =?utf-8?B?dmhGam9pYzJPODRQazE1cnZtaW1oNy9aSUNyWklHRlZzV3c1d1ZMeFdKOUhB?=
 =?utf-8?B?VHc1b3ZIclh5YStRRm1TNFVLV3puRkRuZEdHdkVxTkpUNlRtZ1lneW1lVHVm?=
 =?utf-8?B?QktjTVIxRHAyTnREOVJ6ZTcyaHRJL3Y4NkZvQ1FJQXlwRkh6dm1PMjdnZk5E?=
 =?utf-8?B?aTFvRGVxQkY0MzYvb2ZHanNicDFLcnlVZ0JQY2Jzc3l5NzMrcCttS3pYWjNP?=
 =?utf-8?B?MWtvLzczWmxIRE5NWFpkVmwxaDEzV3VMOTZBS0xMTll4S1ZZQ3VrQ2F4Q0NW?=
 =?utf-8?B?WnV2RnBPbmZ5eHpiWlFYdGZnUFZ4bFhqVi8vWTQwbk5CYUtNOUIyNk41bkRu?=
 =?utf-8?B?NnFmYmtEaFdPZWFIdHUwSEc3U2xrUk50bTZQeHE2d0gzcVhGVHc4SmNldnl5?=
 =?utf-8?B?dmh3T2x0MUp1MXk4RGQ4MUJJTEs3N083UkxDaG9ZOGZhVXJZdWZYK01nV1Nm?=
 =?utf-8?B?Y0xyKysxYjdIMytXeGtxeTVmc3B4R0Q3TkZRK3dHU29kOEpOb2RHa3R6WXBl?=
 =?utf-8?B?MDdOaGJHM1F1Vjh0cHhpTHRHZ25xUUxMUTEyOFFjTkYyVnVnenA2ZWs0U0xW?=
 =?utf-8?B?ZFVodVVvMXJaRGxHZUVNemNuR1hPN0dWMklCalR4WnJpUmRLbjBKZHQ0d2ZW?=
 =?utf-8?B?a0VEZ3F2M2NYNDYraC9aQURtL3p3WkR4VDgxWi96eXNUS2VraW94WDhORXI4?=
 =?utf-8?B?eTdPM0prQ0x1QVQyUmdVQUwxTWk1MDB0WGxRNEpvMS83RUs5cXB6MnpJalpu?=
 =?utf-8?B?RjZkWEg2ejlNQXhycnk0TmtrRTYvYk9WS3kzVE5JQjVXT2pLNlJUMEN5ZjB6?=
 =?utf-8?B?TTU0RlBpb1llT1FscU5ZM05sRXpYeWV2U0ZxWElTNktsQkJaT0M4QVVON2t2?=
 =?utf-8?B?Tk84bUZFY1BqTlVHT3pyTWlNMVNxVVEvTlJZSkpVWUxIU1RJQ0VDenI3UTFH?=
 =?utf-8?B?MjBiNWhuWHgvUGhrdWwyQ2Y0ZnYzeGFWZDU2RmpLb2ZFVEs1QXBVem1FWW43?=
 =?utf-8?B?OFczaUlNTDgxWU5uU3ArUXRjTzd0bTBLSjdOWGEwUkIvL05LbXdOaTU5QUp1?=
 =?utf-8?B?RVdpSWNEMWkxWFNLelNTTkRTSmlTZGFhL0l2YXNsWGYyWDVzZmJUL29MaDVW?=
 =?utf-8?B?YlRYTXJudDdIUjMyc3ZvRmpsK2tueWVIejlXVmkwdGxKQUdEWFFJQ0drTFlG?=
 =?utf-8?B?VTEvY3BhekROemFWdm5pQnowYWt6b0F1WURibVZIU0lDUmFoVGNRN0ZkbTZZ?=
 =?utf-8?B?OGtiSW5iNjRBeEEyOFJqWU1Yd3N2aDNOc082a05kVFRhRW9FUHdxaDlwMDNY?=
 =?utf-8?B?cGY2dlFQL3N0UHI3bWRpbFRLeC9uWDJHTG93dXpNbVNBeU5Zek1DTXhYMEhZ?=
 =?utf-8?B?Mkx1dGJTbFdtRW1IUGxmdVUwYUxKV3RWWXVvMDRqVUxLNGl1TlQ5U25XcWZT?=
 =?utf-8?Q?MGwF7DzFSp81B/GLXrSkZ0xEP?=
Content-ID: <13772AC8944C264D900D43E41190BD3A@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2758.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99d92481-1c72-4b54-3102-08da9f9e4e8b
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2022 09:05:49.7115 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Mw00cFkPOrtOtCU4WHf6yFjC9fp56s9GmDUA5ozJvoCIp7poEzJSKlO9T7xwONO3M2HEuzh/OPfJWLfMozOlZErxhKL0zEJU2TGtT2MuMaI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6546
Cc: alexandre.belloni@bootlin.com, vigneshr@ti.com,
 linux-aspeed@lists.ozlabs.org, tali.perry1@gmail.com,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 linux-spi@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 tmaimon77@gmail.com, benjaminfair@google.com, kdasu.kdev@gmail.com,
 richard@nod.at, chin-ting_kuo@aspeedtech.com, michal.simek@xilinx.com,
 haibo.chen@nxp.com, openbmc@lists.ozlabs.org, yuenn@google.com,
 bcm-kernel-feedback-list@broadcom.com, joel@jms.id.au, yogeshgaur.83@gmail.com,
 linux-rockchip@lists.infradead.org, Tudor.Ambarus@microchip.com,
 john.garry@huawei.com, broonie@kernel.org, linux-mediatek@lists.infradead.org,
 clg@kaod.org, matthias.bgg@gmail.com, han.xu@nxp.com,
 linux-arm-kernel@lists.infradead.org, andrew@aj.id.au, venture@google.com,
 heiko@sntech.de, Nicolas.Ferre@microchip.com, linux-kernel@vger.kernel.org,
 avifishman70@gmail.com, michael@walle.cc, mcoquelin.stm32@gmail.com,
 Claudiu.Beznea@microchip.com, pratyush@kernel.org
Subject: Re: [Linux-stm32] [PATCH] spi: Replace `dummy.nbytes` with
	`dummy.ncycles`
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

On 26.09.2022 01:03, Serge Semin wrote:
> Hello Sergiu
> 


Hello Serge,


> On Sun, Sep 11, 2022 at 08:45:53PM +0300, Sergiu Moga wrote:
>> In order to properly represent the hardware functionality
>> in the core, avoid reconverting the number of dummy cycles
>> to the number of bytes and only work with the former.
>> Instead, let the drivers that do need this conversion do
>> it themselves.
>>
>> Signed-off-by: Sergiu Moga <sergiu.moga@microchip.com>
>> ---
>>   drivers/mtd/spi-nor/core.c        | 22 ++++----------
> 
> [...]
> 
>>   drivers/spi/spi-dw-core.c         | 10 +++++--
> 
> [...]
> 
>>   drivers/spi/spi-mem.c             | 27 +++++++++++------
> 
> [...]
> 
>>   drivers/spi/spi-mtk-nor.c         | 48 +++++++++++++++++--------------
> 
> [...]
> 
>>   drivers/spi/spi-zynq-qspi.c       | 15 ++++++----
>>   drivers/spi/spi-zynqmp-gqspi.c    |  8 ++++--
>>   include/linux/spi/spi-mem.h       | 10 +++----
>>   25 files changed, 234 insertions(+), 147 deletions(-)
>>
>> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
>> index f2c64006f8d7..cc8ca824f912 100644
>> --- a/drivers/mtd/spi-nor/core.c
>> +++ b/drivers/mtd/spi-nor/core.c
>> @@ -88,7 +88,7 @@ void spi_nor_spimem_setup_op(const struct spi_nor *nor,
>>        if (op->addr.nbytes)
>>                op->addr.buswidth = spi_nor_get_protocol_addr_nbits(proto);
>>
> 
> 
> 
>> -     if (op->dummy.nbytes)
>> +     if (op->dummy.ncycles)
>>                op->dummy.buswidth = spi_nor_get_protocol_addr_nbits(proto);
>>
>>        if (op->data.nbytes)
>> @@ -106,9 +106,6 @@ void spi_nor_spimem_setup_op(const struct spi_nor *nor,
>>                op->dummy.dtr = true;
>>                op->data.dtr = true;
>>
>> -             /* 2 bytes per clock cycle in DTR mode. */
>> -             op->dummy.nbytes *= 2;
>> -
>>                ext = spi_nor_get_cmd_ext(nor, op);
>>                op->cmd.opcode = (op->cmd.opcode << 8) | ext;
>>                op->cmd.nbytes = 2;
>> @@ -207,10 +204,7 @@ static ssize_t spi_nor_spimem_read_data(struct spi_nor *nor, loff_t from,
>>
>>        spi_nor_spimem_setup_op(nor, &op, nor->read_proto);
>>
>> -     /* convert the dummy cycles to the number of bytes */
>> -     op.dummy.nbytes = (nor->read_dummy * op.dummy.buswidth) / 8;
>> -     if (spi_nor_protocol_is_dtr(nor->read_proto))
>> -             op.dummy.nbytes *= 2;
>> +     op.dummy.ncycles = nor->read_dummy;
> 
> So according to this modification and what is done in the rest of the
> patch, the dummy part of the SPI-mem operations now contains the number
> of cycles only. Am I right to think that it means a number of dummy
> clock oscillations? (Judging from what I've seen in the HW-manuals of
> the SPI NOR memory devices most likely I am...)



Yes, you are correct.


> If so the "ncycles" field
> is now free from the "data" semantic. Then what is the meaning of the
> "buswidth and "dtr" fields in the spi_mem_op.dummy field?
> 


It is still meaningful as it is used for the conversion by some drivers 
to nbytes and I do not see how it goes out of the specification in any 
way. So, at least for now, I do not see any reason to remove these fields.


>>
>>        usebouncebuf = spi_nor_spimem_bounce(nor, &op);
>>
>> @@ -455,7 +449,7 @@ int spi_nor_read_sr(struct spi_nor *nor, u8 *sr)
>>
>>                if (nor->reg_proto == SNOR_PROTO_8_8_8_DTR) {
>>                        op.addr.nbytes = nor->params->rdsr_addr_nbytes;
>> -                     op.dummy.nbytes = nor->params->rdsr_dummy;
>> +                     op.dummy.ncycles = nor->params->rdsr_dummy;
>>                        /*
>>                         * We don't want to read only one byte in DTR mode. So,
>>                         * read 2 and then discard the second byte.
>> @@ -1913,10 +1907,7 @@ static int spi_nor_spimem_check_readop(struct spi_nor *nor,
>>
>>        spi_nor_spimem_setup_op(nor, &op, read->proto);
>>
>> -     /* convert the dummy cycles to the number of bytes */
>> -     op.dummy.nbytes = (nor->read_dummy * op.dummy.buswidth) / 8;
>> -     if (spi_nor_protocol_is_dtr(nor->read_proto))
>> -             op.dummy.nbytes *= 2;
>> +     op.dummy.ncycles = nor->read_dummy;
>>
>>        return spi_nor_spimem_check_op(nor, &op);
>>   }
>> @@ -3034,10 +3025,7 @@ static int spi_nor_create_read_dirmap(struct spi_nor *nor)
>>
>>        spi_nor_spimem_setup_op(nor, op, nor->read_proto);
>>
>> -     /* convert the dummy cycles to the number of bytes */
>> -     op->dummy.nbytes = (nor->read_dummy * op->dummy.buswidth) / 8;
>> -     if (spi_nor_protocol_is_dtr(nor->read_proto))
>> -             op->dummy.nbytes *= 2;
>> +     op->dummy.ncycles = nor->read_dummy;
>>
>>        /*
>>         * Since spi_nor_spimem_setup_op() only sets buswidth when the number
> 
> [...]
> 
>> diff --git a/drivers/spi/spi-dw-core.c b/drivers/spi/spi-dw-core.c
>> index f87d97ccd2d6..0ba5c7d0e66e 100644
>> --- a/drivers/spi/spi-dw-core.c
>> +++ b/drivers/spi/spi-dw-core.c
>> @@ -498,13 +498,17 @@ static bool dw_spi_supports_mem_op(struct spi_mem *mem,
>>   static int dw_spi_init_mem_buf(struct dw_spi *dws, const struct spi_mem_op *op)
>>   {
>>        unsigned int i, j, len;
>> -     u8 *out;
>> +     u8 *out, dummy_nbytes;
>>
>>        /*
>>         * Calculate the total length of the EEPROM command transfer and
>>         * either use the pre-allocated buffer or create a temporary one.
>>         */
>> -     len = op->cmd.nbytes + op->addr.nbytes + op->dummy.nbytes;
> 
>> +     dummy_nbytes = (op->dummy.ncycles * op->dummy.buswidth) / 8;
> 
> 1. What about using the BITS_PER_BYTE macro (linux/bits.h) here? Since
> you are adding a similar modification to so many drivers what about using
> that macro there too?
> 


AFAICT BIT_PER_BYTE is meant to transparently indicate how many bits per 
byte an arch has. Although, there is no place in the kernel from what I 
can see that has BITS_PER_BYTE with a value other than 8, you cannot 
deny that there exist architectures whose number of bits per byte may be 
different from 8.

Meanwhile, the JESD216E specification tells us in the Terms and 
definitions chapter that
"DWORD: Four consecutive 8-bit bytes used as the basic 32-bit building 
block for headers and parameter tables." So it explicitly says that a 
byte has 8 bits regardless of the arch.

Therefore, I do not agree with replacing 8 with the BITS_PER_BYTE macro 
as, IMO, it does not represent the same thing as the number of bits per 
byte that the terms and definitions of the JESD216E specification refer to.


> 2. buswidth is supposed to be always 1 in this driver (see the
> dw_spi_supports_mem_op() method). So it can be dropped from the
> statement above.
> 
> 3. Since the ncycles now contains a number of clock cycles there is no
> point in taking the SPI bus-width into account at all. What is
> meaningful is how many oscillations are supposed to be placed on the
> CLK line before the data is available. So the op->dummy.ncycles /
> BITS_PER_BYTE statement would be more appropriate here in any case.
> 


I can agee with this in the case of this driver, sure.


>> +     if (op->dummy.dtr)
>> +             dummy_nbytes *= 2;
> 
> DTR is unsupported by the controller. See, no spi_controller_mem_caps
> initialized. So this part is redundant. The same is most likely
> applicable for some of the DTR-related updates in this patch too
> since the spi_controller_mem_caps structure is initialized in a few
> drivers only.
> 


Agreed. Initially, wherever I was not sure, I just placed this if 
condition to avoid breaking anything in case the driver does support 
DTR. The same goes for your other related observations to other driver 
modifications, with which I agree :).


>> +
>> +     len = op->cmd.nbytes + op->addr.nbytes + dummy_nbytes;
>>        if (op->data.dir == SPI_MEM_DATA_OUT)
>>                len += op->data.nbytes;
>>
>> @@ -525,7 +529,7 @@ static int dw_spi_init_mem_buf(struct dw_spi *dws, const struct spi_mem_op *op)
>>                out[i] = DW_SPI_GET_BYTE(op->cmd.opcode, op->cmd.nbytes - i - 1);
>>        for (j = 0; j < op->addr.nbytes; ++i, ++j)
>>                out[i] = DW_SPI_GET_BYTE(op->addr.val, op->addr.nbytes - j - 1);
>> -     for (j = 0; j < op->dummy.nbytes; ++i, ++j)
>> +     for (j = 0; j < dummy_nbytes; ++i, ++j)
>>                out[i] = 0x0;
>>
>>        if (op->data.dir == SPI_MEM_DATA_OUT)
> 
> [...]
> 
>> diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
>> index 0c79193d9697..7b204963bb62 100644
>> --- a/drivers/spi/spi-mem.c
>> +++ b/drivers/spi/spi-mem.c
>> @@ -149,7 +149,7 @@ static bool spi_mem_check_buswidth(struct spi_mem *mem,
>>            spi_check_buswidth_req(mem, op->addr.buswidth, true))
>>                return false;
>>
>> -     if (op->dummy.nbytes &&
>> +     if (op->dummy.ncycles &&
>>            spi_check_buswidth_req(mem, op->dummy.buswidth, true))
>>                return false;
>>
>> @@ -202,7 +202,7 @@ static int spi_mem_check_op(const struct spi_mem_op *op)
>>                return -EINVAL;
>>
>>        if ((op->addr.nbytes && !op->addr.buswidth) ||
>> -         (op->dummy.nbytes && !op->dummy.buswidth) ||
>> +         (op->dummy.ncycles && !op->dummy.buswidth) ||
>>            (op->data.nbytes && !op->data.buswidth))
>>                return -EINVAL;
>>
>> @@ -315,7 +315,7 @@ int spi_mem_exec_op(struct spi_mem *mem, const struct spi_mem_op *op)
> 
>>        struct spi_controller *ctlr = mem->spi->controller;
>>        struct spi_transfer xfers[4] = { };
>>        struct spi_message msg;
>> -     u8 *tmpbuf;
>> +     u8 *tmpbuf, dummy_nbytes;
>>        int ret;
> 
> Reverse xmas tree order?
> 
>>
>>        ret = spi_mem_check_op(op);
>> @@ -343,7 +343,11 @@ int spi_mem_exec_op(struct spi_mem *mem, const struct spi_mem_op *op)
>>                        return ret;
>>        }
>>
> 
>> -     tmpbufsize = op->cmd.nbytes + op->addr.nbytes + op->dummy.nbytes;
>> +     dummy_nbytes = (op->dummy.ncycles * op->dummy.buswidth) / 8;
> 
> So ncycles now indeed is a number of CLK line oscillations. This most
> likely will break the SPI Nand driver then, which still passes the
> number of bytes to the SPI_MEM_OP_DUMMY() macro.
> 
>> +     if (op->dummy.dtr)
>> +             dummy_nbytes *= 2;
> 
> Generic SPI-mem ops don't take the DTR mode into account. So I don't
> see this necessary.
> 


You may be right, but this part of the code does take into consideration 
the number of dummy.nbytes to calculate the xfer length. Therefore, 
shouldn't this code block also know if the number of dummy nbytes is 
actually double the amount that it calculated through the conversion 
formula?


>> +
>> +     tmpbufsize = op->cmd.nbytes + op->addr.nbytes + dummy_nbytes;
>>
>>        /*
>>         * Allocate a buffer to transmit the CMD, ADDR cycles with kmalloc() so
>> @@ -379,15 +383,15 @@ int spi_mem_exec_op(struct spi_mem *mem, const struct spi_mem_op *op)
>>                totalxferlen += op->addr.nbytes;
>>        }
>>
>> -     if (op->dummy.nbytes) {
>> -             memset(tmpbuf + op->addr.nbytes + 1, 0xff, op->dummy.nbytes);
>> +     if (dummy_nbytes) {
>> +             memset(tmpbuf + op->addr.nbytes + 1, 0xff, dummy_nbytes);
>>                xfers[xferpos].tx_buf = tmpbuf + op->addr.nbytes + 1;
>> -             xfers[xferpos].len = op->dummy.nbytes;
>> +             xfers[xferpos].len = dummy_nbytes;
>>                xfers[xferpos].tx_nbits = op->dummy.buswidth;
>>                xfers[xferpos].dummy_data = 1;
>>                spi_message_add_tail(&xfers[xferpos], &msg);
>>                xferpos++;
>> -             totalxferlen += op->dummy.nbytes;
>> +             totalxferlen += dummy_nbytes;
>>        }
>>
>>        if (op->data.nbytes) {
>> @@ -456,12 +460,17 @@ int spi_mem_adjust_op_size(struct spi_mem *mem, struct spi_mem_op *op)
>>   {
> 
>>        struct spi_controller *ctlr = mem->spi->controller;
>>        size_t len;
>> +     u8 dummy_nbytes;
> 
> reverse xmas tree?
> 
>>
>>        if (ctlr->mem_ops && ctlr->mem_ops->adjust_op_size)
>>                return ctlr->mem_ops->adjust_op_size(mem, op);
>>
>> +     dummy_nbytes = (op->dummy.ncycles * op->dummy.buswidth) / 8;
>> +     if (op->dummy.dtr)
>> +             dummy_nbytes *= 2;
>> +
>>        if (!ctlr->mem_ops || !ctlr->mem_ops->exec_op) {
>> -             len = op->cmd.nbytes + op->addr.nbytes + op->dummy.nbytes;
>> +             len = op->cmd.nbytes + op->addr.nbytes + dummy_nbytes;
>>
>>                if (len > spi_max_transfer_size(mem->spi))
>>                        return -EINVAL;
> 
> [...]
> 
>> diff --git a/drivers/spi/spi-mtk-nor.c b/drivers/spi/spi-mtk-nor.c
>> index d167699a1a96..f6870c6e911a 100644
>> --- a/drivers/spi/spi-mtk-nor.c
>> +++ b/drivers/spi/spi-mtk-nor.c
>> @@ -171,23 +171,18 @@ static bool need_bounce(struct mtk_nor *sp, const struct spi_mem_op *op)
>>
>>   static bool mtk_nor_match_read(const struct spi_mem_op *op)
>>   {
>> -     int dummy = 0;
>> -
>> -     if (op->dummy.nbytes)
>> -             dummy = op->dummy.nbytes * BITS_PER_BYTE / op->dummy.buswidth;
>> -
>>        if ((op->data.buswidth == 2) || (op->data.buswidth == 4)) {
>>                if (op->addr.buswidth == 1)
>> -                     return dummy == 8;
>> +                     return op->dummy.ncycles == 8;
>>                else if (op->addr.buswidth == 2)
>> -                     return dummy == 4;
>> +                     return op->dummy.ncycles == 4;
>>                else if (op->addr.buswidth == 4)
>> -                     return dummy == 6;
>> +                     return op->dummy.ncycles == 6;
>>        } else if ((op->addr.buswidth == 1) && (op->data.buswidth == 1)) {
>>                if (op->cmd.opcode == 0x03)
>> -                     return dummy == 0;
>> +                     return op->dummy.ncycles == 0;
>>                else if (op->cmd.opcode == 0x0b)
>> -                     return dummy == 8;
>> +                     return op->dummy.ncycles == 8;
>>        }
>>        return false;
>>   }
>> @@ -195,6 +190,10 @@ static bool mtk_nor_match_read(const struct spi_mem_op *op)
>>   static bool mtk_nor_match_prg(const struct spi_mem_op *op)
>>   {
>>        int tx_len, rx_len, prg_len, prg_left;
> 
>> +     u8 dummy_nbytes = (op->dummy.ncycles * op->dummy.buswidth) / 8;
>> +
> 
> IMO it's better to move the initialization statement to a separate
> line here.
> 
>> +     if (op->dummy.dtr)
>> +             dummy_nbytes *= 2;
> 
> Does the MTK SPI driver support DTR? AFAICS it doesn't.
> 
>>
>>        // prg mode is spi-only.
>>        if ((op->cmd.buswidth > 1) || (op->addr.buswidth > 1) ||
>> @@ -205,7 +204,7 @@ static bool mtk_nor_match_prg(const struct spi_mem_op *op)
>>
>>        if (op->data.dir == SPI_MEM_DATA_OUT) {
>>                // count dummy bytes only if we need to write data after it
>> -             tx_len += op->dummy.nbytes;
>> +             tx_len += dummy_nbytes;
>>
>>                // leave at least one byte for data
>>                if (tx_len > MTK_NOR_REG_PRGDATA_MAX)
>> @@ -221,7 +220,7 @@ static bool mtk_nor_match_prg(const struct spi_mem_op *op)
>>                        return false;
>>
>>                rx_len = op->data.nbytes;
>> -             prg_left = MTK_NOR_PRG_CNT_MAX / 8 - tx_len - op->dummy.nbytes;
>> +             prg_left = MTK_NOR_PRG_CNT_MAX / 8 - tx_len - dummy_nbytes;
>>                if (prg_left > MTK_NOR_REG_SHIFT_MAX + 1)
>>                        prg_left = MTK_NOR_REG_SHIFT_MAX + 1;
>>                if (rx_len > prg_left) {
>> @@ -230,11 +229,11 @@ static bool mtk_nor_match_prg(const struct spi_mem_op *op)
>>                        rx_len = prg_left;
>>                }
>>
>> -             prg_len = tx_len + op->dummy.nbytes + rx_len;
>> +             prg_len = tx_len + dummy_nbytes + rx_len;
>>                if (prg_len > MTK_NOR_PRG_CNT_MAX / 8)
>>                        return false;
>>        } else {
>> -             prg_len = tx_len + op->dummy.nbytes;
>> +             prg_len = tx_len + dummy_nbytes;
>>                if (prg_len > MTK_NOR_PRG_CNT_MAX / 8)
>>                        return false;
>>        }
>> @@ -244,15 +243,19 @@ static bool mtk_nor_match_prg(const struct spi_mem_op *op)
>>   static void mtk_nor_adj_prg_size(struct spi_mem_op *op)
>>   {
>>        int tx_len, tx_left, prg_left;
> 
>> +     u8 dummy_nbytes = (op->dummy.ncycles * op->dummy.buswidth) / 8;
>> +
>> +     if (op->dummy.dtr)
>> +             dummy_nbytes *= 2;
> 
> ditto
> 
>>
>>        tx_len = op->cmd.nbytes + op->addr.nbytes;
>>        if (op->data.dir == SPI_MEM_DATA_OUT) {
>> -             tx_len += op->dummy.nbytes;
>> +             tx_len += dummy_nbytes;
>>                tx_left = MTK_NOR_REG_PRGDATA_MAX + 1 - tx_len;
>>                if (op->data.nbytes > tx_left)
>>                        op->data.nbytes = tx_left;
>>        } else if (op->data.dir == SPI_MEM_DATA_IN) {
>> -             prg_left = MTK_NOR_PRG_CNT_MAX / 8 - tx_len - op->dummy.nbytes;
>> +             prg_left = MTK_NOR_PRG_CNT_MAX / 8 - tx_len - dummy_nbytes;
>>                if (prg_left > MTK_NOR_REG_SHIFT_MAX + 1)
>>                        prg_left = MTK_NOR_REG_SHIFT_MAX + 1;
>>                if (op->data.nbytes > prg_left)
>> @@ -312,7 +315,7 @@ static bool mtk_nor_supports_op(struct spi_mem *mem,
>>                        break;
>>                case SPI_MEM_DATA_OUT:
>>                        if ((op->addr.buswidth == 1) &&
>> -                         (op->dummy.nbytes == 0) &&
>> +                         (op->dummy.ncycles == 0) &&
>>                            (op->data.buswidth == 1))
>>                                return true;
>>                        break;
>> @@ -515,17 +518,20 @@ static int mtk_nor_spi_mem_prg(struct mtk_nor *sp, const struct spi_mem_op *op)
>>        int tx_len, prg_len;
>>        int i, ret;
>>        void __iomem *reg;
> 
>> -     u8 bufbyte;
>> +     u8 bufbyte, dummy_nbytes = (op->dummy.ncycles * op->dummy.buswidth) / 8;
>> +
>> +     if (op->dummy.dtr)
>> +             dummy_nbytes *= 2;
> 
> ditto
> 
>>
>>        tx_len = op->cmd.nbytes + op->addr.nbytes;
>>
>>        // count dummy bytes only if we need to write data after it
>>        if (op->data.dir == SPI_MEM_DATA_OUT)
>> -             tx_len += op->dummy.nbytes + op->data.nbytes;
>> +             tx_len += dummy_nbytes + op->data.nbytes;
>>        else if (op->data.dir == SPI_MEM_DATA_IN)
>>                rx_len = op->data.nbytes;
>>
>> -     prg_len = op->cmd.nbytes + op->addr.nbytes + op->dummy.nbytes +
>> +     prg_len = op->cmd.nbytes + op->addr.nbytes + dummy_nbytes +
>>                  op->data.nbytes;
>>
>>        // an invalid op may reach here if the caller calls exec_op without
>> @@ -550,7 +556,7 @@ static int mtk_nor_spi_mem_prg(struct mtk_nor *sp, const struct spi_mem_op *op)
>>        }
>>
>>        if (op->data.dir == SPI_MEM_DATA_OUT) {
>> -             for (i = 0; i < op->dummy.nbytes; i++, reg_offset--) {
>> +             for (i = 0; i < dummy_nbytes; i++, reg_offset--) {
>>                        reg = sp->base + MTK_NOR_REG_PRGDATA(reg_offset);
>>                        writeb(0, reg);
>>                }
> 
> [...]
> 
>> diff --git a/drivers/spi/spi-zynq-qspi.c b/drivers/spi/spi-zynq-qspi.c
>> index 78f31b61a2aa..84b7db85548c 100644
>> --- a/drivers/spi/spi-zynq-qspi.c
>> +++ b/drivers/spi/spi-zynq-qspi.c
>> @@ -527,7 +527,10 @@ static int zynq_qspi_exec_mem_op(struct spi_mem *mem,
>>   {
>>        struct zynq_qspi *xqspi = spi_controller_get_devdata(mem->spi->master);
>>        int err = 0, i;
>> -     u8 *tmpbuf;
>> +     u8 *tmpbuf, dummy_nbytes = (op->dummy.ncycles * op->dummy.buswidth) / 8;
> 
> Separate line?
> 
>> +
>> +     if (op->dummy.dtr)
>> +             dummy_nbytes *= 2;
> 
> Is DTR supported by the driver?
> 


Not from what I can see, but I was not 100% sure so I placed this if 
statement here just in case.



>>
>>        dev_dbg(xqspi->dev, "cmd:%#x mode:%d.%d.%d.%d\n",
>>                op->cmd.opcode, op->cmd.buswidth, op->addr.buswidth,
>> @@ -568,17 +571,17 @@ static int zynq_qspi_exec_mem_op(struct spi_mem *mem,
>>                        err = -ETIMEDOUT;
>>        }
>>
>> -     if (op->dummy.nbytes) {
>> -             tmpbuf = kzalloc(op->dummy.nbytes, GFP_KERNEL);
>> +     if (dummy_nbytes) {
>> +             tmpbuf = kzalloc(dummy_nbytes, GFP_KERNEL);
>>                if (!tmpbuf)
>>                        return -ENOMEM;
>>
>> -             memset(tmpbuf, 0xff, op->dummy.nbytes);
>> +             memset(tmpbuf, 0xff, dummy_nbytes);
>>                reinit_completion(&xqspi->data_completion);
>>                xqspi->txbuf = tmpbuf;
>>                xqspi->rxbuf = NULL;
>> -             xqspi->tx_bytes = op->dummy.nbytes;
>> -             xqspi->rx_bytes = op->dummy.nbytes;
>> +             xqspi->tx_bytes = dummy_nbytes;
>> +             xqspi->rx_bytes = dummy_nbytes;
>>                zynq_qspi_write_op(xqspi, ZYNQ_QSPI_FIFO_DEPTH, true);
>>                zynq_qspi_write(xqspi, ZYNQ_QSPI_IEN_OFFSET,
>>                                ZYNQ_QSPI_IXR_RXTX_MASK);
>> diff --git a/drivers/spi/spi-zynqmp-gqspi.c b/drivers/spi/spi-zynqmp-gqspi.c
>> index c760aac070e5..b41abadef9a6 100644
>> --- a/drivers/spi/spi-zynqmp-gqspi.c
>> +++ b/drivers/spi/spi-zynqmp-gqspi.c
>> @@ -948,6 +948,10 @@ static int zynqmp_qspi_exec_op(struct spi_mem *mem,
>>        u32 genfifoentry = 0;
>>        u16 opcode = op->cmd.opcode;
>>        u64 opaddr;
> 
>> +     u8 dummy_nbytes = (op->dummy.ncycles * op->dummy.buswidth) / 8;
>> +
>> +     if (op->dummy.dtr)
>> +             dummy_nbytes *= 2;
> 
> ditto
> 
>>
>>        dev_dbg(xqspi->dev, "cmd:%#x mode:%d.%d.%d.%d\n",
>>                op->cmd.opcode, op->cmd.buswidth, op->addr.buswidth,
>> @@ -1006,14 +1010,14 @@ static int zynqmp_qspi_exec_op(struct spi_mem *mem,
>>                }
>>        }
>>
>> -     if (op->dummy.nbytes) {
>> +     if (dummy_nbytes) {
>>                xqspi->txbuf = NULL;
>>                xqspi->rxbuf = NULL;
>>                /*
>>                 * xqspi->bytes_to_transfer here represents the dummy circles
>>                 * which need to be sent.
>>                 */
>> -             xqspi->bytes_to_transfer = op->dummy.nbytes * 8 / op->dummy.buswidth;
>> +             xqspi->bytes_to_transfer = dummy_nbytes;
>>                xqspi->bytes_to_receive = 0;
>>                /*
>>                 * Using op->data.buswidth instead of op->dummy.buswidth here because
>> diff --git a/include/linux/spi/spi-mem.h b/include/linux/spi/spi-mem.h
>> index 2ba044d0d5e5..5fd45800af03 100644
>> --- a/include/linux/spi/spi-mem.h
>> +++ b/include/linux/spi/spi-mem.h
>> @@ -29,9 +29,9 @@
>>
>>   #define SPI_MEM_OP_NO_ADDR   { }
>>
> 
>> -#define SPI_MEM_OP_DUMMY(__nbytes, __buswidth)                       \
>> +#define SPI_MEM_OP_DUMMY(__ncycles, __buswidth)              \
>>        {                                                       \
> 
>> -             .nbytes = __nbytes,                             \
>> +             .ncycles = __ncycles,                           \
>>                .buswidth = __buswidth,                         \
> 
> Please make sure this update and the drivers/spi/spi-mem.c driver
> alterations are coherent with the SPI Nand driver. See the macro usages:
> include/linux/mtd/spinand.h: SPINAND_PAGE_READ_FROM_*().
> 
> -Sergey
>


Yes, indeed, I should have paid more attention here. As I have 
previously said,  I simply replaced dummy.nbytes with the code sequences 
you now see. I should have checked for SPI_MEM_OP_DUMMY usages as well 
since I changed its definition. Thank you! :)


>>        }
>>
>> @@ -83,8 +83,8 @@ enum spi_mem_data_dir {
>>    *         Note that only @addr.nbytes are taken into account in this
>>    *         address value, so users should make sure the value fits in the
>>    *         assigned number of bytes.
>> - * @dummy.nbytes: number of dummy bytes to send after an opcode or address. Can
>> - *             be zero if the operation does not require dummy bytes
>> + * @dummy.ncycles: number of dummy cycles after an opcode or address. Can
>> + *              be zero if the operation does not require dummy cycles
>>    * @dummy.buswidth: number of IO lanes used to transmit the dummy bytes
>>    * @dummy.dtr: whether the dummy bytes should be sent in DTR mode or not
>>    * @data.buswidth: number of IO lanes used to send/receive the data
>> @@ -112,7 +112,7 @@ struct spi_mem_op {
>>        } addr;
>>
>>        struct {
>> -             u8 nbytes;
>> +             u8 ncycles;
>>                u8 buswidth;
>>                u8 dtr : 1;
>>        } dummy;
>> --
>> 2.34.1
>>


Regards,
	Sergiu
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
