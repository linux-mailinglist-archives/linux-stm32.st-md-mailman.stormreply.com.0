Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 813A3599619
	for <lists+linux-stm32@lfdr.de>; Fri, 19 Aug 2022 09:35:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 30812C08D1F;
	Fri, 19 Aug 2022 07:35:07 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 79CEDC04005
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Aug 2022 07:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1660894506; x=1692430506;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=p6cIEENlmOGMEhF4ErafDb6QsOPmmXk68JqgNtes8Vc=;
 b=TBpe2WO6urpF9ZvE1t2oUmSI678sStdu35IZg0MW/A6O9esNZvUWiHjf
 B7VugPOqoq3+uYoygex9QEGmd1oZ42mFs8OFdr4uLqykvfkd3Or21owZi
 UKm/BC2zzFPN10yxf7fRiCo4EXvvtrp/Un+RAYroQ5+HceDdpmBUM2d7z
 KW4CrZlPnnBWdRXMW+6Mz2zHTPyXo15FupT5xXJN6a9+EgfD4B0VFaCVC
 0/h/v3dZnkU+Nm6p7245oWAsg8IhJku7mSwyAKjuBM3zAbp9m+2poXgwn
 0XVREHSj0V/u1pE9bo5DKSS1zXTKkGLgvh00OuO+2qijHqq1LK6EyXMZ7 A==;
X-IronPort-AV: E=Sophos;i="5.93,247,1654585200"; d="scan'208";a="176895329"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 19 Aug 2022 00:35:01 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Fri, 19 Aug 2022 00:35:00 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Fri, 19 Aug 2022 00:34:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=USxvMmrY82S7/piIcqHZqf4ztClN60/diLXWH9YsAZXxVYkVFMQ3AcNBoW/h4NCym5LIlVfWoXrkXNsyNvka5QyWPZMeiw5l//noCa87lrK/lR0YJJFQNXBFNBTwvmKAAm7lJy/tw8xvvWbuii2KzwIrB9WBtPGEdaYT2Y/n2rksKsubbibqMHq02+RoSxi6RbdJE12Zfhp12SVARSrdnDJQbR5b20AMmSIq3OxqLrXB+58JpwmIxgZP9HhYt9qN17zAcug49K/s3UJ1NUAzdjW5TTBHN/4V9xINpYqhoaaod4fVUJgY1b6ERsbXzoX53MyrqCJ9c9GCiJQ64pU8ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p6cIEENlmOGMEhF4ErafDb6QsOPmmXk68JqgNtes8Vc=;
 b=nhAD8pn/45jzU+jLICI6ajjs3ebz9+ELf2LFT2NSbyNCdBz7kLXjz4cJAUW378qoqXDgDOp1te6WWBPhWZZzPSMiYSrNC06qcZpdj6y58vYBVv0I0Xf7ReH7HwW9tqjd85zuHZP1FXzwGzujVbnxLHc/BpPhwdHBasGhUlwt3MQCZnblDluJ2ixM8cRQu5T4PMVKwxheKH/sPRIMFPupU+4jrCQywwy13H6AutVIGiwCsbmTMC+Ug8VpuBZFJoQvN+DvBb5usg03122bRMqz6+GhixQdN2aoepp8tTjrx/5joyMwVN1EYWPfz3Mpm3i/HutjmDot7nILSENCo6NmXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p6cIEENlmOGMEhF4ErafDb6QsOPmmXk68JqgNtes8Vc=;
 b=JYiWQZDV6fzgi2ge8iPpwwBJB3oZl3i+NS7Y8kbf5+5RS+xkJl1OROSvIcHHJs8RWjPR4MZeyV6zO5+3hfNlNCZVFIjoieRLt8JTBtyLurvz9G3hm3cMbEiHV3UHB56D5riXF+pSgu4Lu9N9X6ykea4OaactvHe1tucUxH0xIU4=
Received: from BN6PR11MB1953.namprd11.prod.outlook.com (2603:10b6:404:105::14)
 by DS7PR11MB6039.namprd11.prod.outlook.com (2603:10b6:8:76::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5546.18; Fri, 19 Aug 2022 07:34:53 +0000
Received: from BN6PR11MB1953.namprd11.prod.outlook.com
 ([fe80::7c6d:be4a:3377:7c4a]) by BN6PR11MB1953.namprd11.prod.outlook.com
 ([fe80::7c6d:be4a:3377:7c4a%5]) with mapi id 15.20.5525.011; Fri, 19 Aug 2022
 07:34:53 +0000
From: <Claudiu.Beznea@microchip.com>
To: <arnd@kernel.org>, <linux-arm-kernel@lists.infradead.org>
Thread-Topic: [PATCH 01/11] ARM: defconfig: reorder defconfig files
Thread-Index: AQHYs54sifxgOgLAr0a7uFGLCGbpRQ==
Date: Fri, 19 Aug 2022 07:34:53 +0000
Message-ID: <a4a7cd2e-47f5-fe43-f3b6-14450be9fd58@microchip.com>
References: <20220818135522.3143514-1-arnd@kernel.org>
 <20220818135522.3143514-2-arnd@kernel.org>
In-Reply-To: <20220818135522.3143514-2-arnd@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9165c2a9-62a4-439c-c2f1-08da81b54eb6
x-ms-traffictypediagnostic: DS7PR11MB6039:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MuxolD3ZQaWrT7weFl7hx0vBhgHsmCOw6YE+5F4vjMhJUDddZsLa4ZyIn3B13s6bYrkuAwL6tJBzyd734/0Wy/Byfv8V06xCOZsU4amhG7ZYMwyp3p1lqy6M/OdmD3IfNtNzYuqKUITKSMhli6LmeXpXtyXXJO72W/x17eVCktTjSlmC1gcRfdtYkJYn9MJufoqCYB8EzT04ZpDqIzrnVtQjth5Ri00m1Kwy8sGh8NedszciOqMzuAufRILK2XZ7lOYYW9MYIg8xmeSmYxA0CEaUSXch3STC0PKbZiFXbaS3XhTDymwOPdc4kB7D9Gr1Zv5z8dlfVLLqBtrsmQuDuxn3bUkxRXkLQjSji1FFtkfK36UDGPlCoholLNmVMFwj9yBRc8rHzHQE3VxpC9dOP0Xi4VLHclo4gyBi/mDlygYqDhb5GjUST1hOR1jakHpuU4jDR3plu8AmoBBXUiIzqLMurRMKWYPTK4Vlc0oniOGiCB7RT7a/jLE85stpWs1K2hbqKT0JDHiSDcegZm2LR8zBBldJ/ZkUVwOu0BNDX6BGJuC/R8q8WupVNP95TZOTcAa5KYKmiDdSySEFak/5bnRpsvKXhi05Rg3hHVl0dVEMpUqohiKlZfGReq13OuPL81zfvSz94ciuhyImS3jikc//zSpLjkdNwqhafoJZdwEg9cAsRWouvT/fK/qpM5Ay6p+54N1+ysIhs4X/izvIp5cYLbSZyWbBntMzW8RkTqRFS1AWygvQo2pRqYwlXCERrmfu7GVpY59/MqET56G7cXno2MWh5MLz3UqxtykcFW8yc9we7ra7MtODNDTqlv4/2C4w6aBuFYAaot2PnU6NFQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR11MB1953.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39860400002)(366004)(346002)(376002)(136003)(396003)(86362001)(31696002)(38070700005)(2616005)(122000001)(186003)(83380400001)(38100700002)(31686004)(91956017)(76116006)(54906003)(110136005)(316002)(36756003)(2906002)(5660300002)(8936002)(7406005)(7416002)(4326008)(66556008)(8676002)(64756008)(7366002)(66946007)(66476007)(30864003)(6506007)(41300700001)(26005)(53546011)(6512007)(66446008)(478600001)(6486002)(71200400001)(45980500001)(43740500002)(579004);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eGVlRkp1NUd3bjZTSnNtSWZWSHJxck5OeVZ1NEpiM0R5Ukh2dzM2eDhUOUhS?=
 =?utf-8?B?TTNKQ2tVcFoyN3lkWVl2dWIrNlNIWTBrcmlWaDRUS3MvL2ZCbE54UXE5Q3pu?=
 =?utf-8?B?T2M3K0tZazI3YmRrTml5N0NvRFg5ekl0ME1ydVZNdWVKcTYvN0xYM2xtUVlx?=
 =?utf-8?B?c2lSRzhHeWhlVG0zVjd6SW5iZUozTFUzMU1zWmluRHpRL0p6RDYxWjZTTzF0?=
 =?utf-8?B?bmhDU0xCejNrT1U5VmwzYlQyeXViQ3hGM3E0K29ZbHB2Qk9FZXczak5FYmFx?=
 =?utf-8?B?QzdjMzA1NHpWYnI5bzNNekZ1V3d0YXRIdm82SHVKV2pKcVpkS3dwZnF6TEtq?=
 =?utf-8?B?OUVWZDlhQkw0TGhhZm81WmRXZmoxV3FKOC9Ic253MUpyVDdleGMzWTFSYW1U?=
 =?utf-8?B?L2VLazRkMXdkMjRqcVNUa3lUempXZVZ1OE44UE9IZ0RmTHBBMCthRDR4YTBD?=
 =?utf-8?B?UzBJZytxL2NqVTNTdUYzNm5LU1JDWFN2bmp1akt2SjYvRWVlNVhzeml4VG8w?=
 =?utf-8?B?OHIyMHBMY0Nldm13VGtJMkIwNUJicFpObHZRdWFuYmpFczJGMTJ3QWhOb3gr?=
 =?utf-8?B?T0U4ZDNJZzlzeWpxWUNXT1ZjU2JqaGtKb3hNekNmbFBHWWZnMzJOS0JOOE82?=
 =?utf-8?B?L1c0OUw5L1pMYmtnc2E0Vms2bjQwUndZS2cwVEoxaUZHMytSbkl2aFUrNkx4?=
 =?utf-8?B?L3lIZW14a1IyajdUVnlkU0Y3YlZYOU9PNjJscnZicEJZSUJtZFozTmhOMGFK?=
 =?utf-8?B?WXN4dXU5dEppQjVTYUNQdnFGQlV5dEZhaVBhaGlhalhqc3E0U3RNTldRd0xo?=
 =?utf-8?B?cXQ2d1BQK0ZvaWJ0OG1LazZoeGV4dm1uV2xmSFl1WXQ0dG1QM2Q3QmpUT3pS?=
 =?utf-8?B?WVI0QVE1V0M1cjk1bnAwQ1B3Y0R3d2pVVk5GUkcra2xKTWwyc25kTExNaHlP?=
 =?utf-8?B?Nm5YMTRlVDJLUzdEVWp0YzkvRDZCRkZzYVErbE5EcWk0U0pmVlJOQytWQWhB?=
 =?utf-8?B?SUE0aVFMWmRaQWIwbEFpYnBFOTJoWkdwMmx2am9xM2Y4bEdGd2s0SU9tVVkr?=
 =?utf-8?B?aW5ER2piajJ3cHVJL25BTlVjSjN5OWlsVDVpZnQ4UXFvMUVscVNpaFBUejJz?=
 =?utf-8?B?dE95bGdvMFdja3pLVlVsbzAvR3pXM0N6Nys2b0Rac1V1b3liekpicFRtWGhS?=
 =?utf-8?B?YjBWdnlqYjlSSjJGZHBKTHpMb1o5OW52Nndib2xhYk9idHlnSjkwM29lZFRx?=
 =?utf-8?B?elhkMEpoZkxQWmdUaVV0TlZBSmJVMjh4cjh6TGUwRVI5UEJFK0RrWGZ4Yk90?=
 =?utf-8?B?L3ZURkd2OEoza2xLNVdpTkJDZmFRRXgyaXVaSmZVell3cktwZjVUQmVPUXI5?=
 =?utf-8?B?MTQxRkNaMUdKV2pRM0JNMHJBLzJsVWtmRFg3WnRERmNpVE9TQ0F6M25BdGJz?=
 =?utf-8?B?RDd1WWhheVI4NUtTVU1SVFovSnQ1UVVaWXZGRC9XTHpRRzR4SmJabEJUUmV1?=
 =?utf-8?B?TU5BSWpGeWlMbHhqaWozbktLVjJFOGhXVGtXMW9vcFlRUG4yZm5kSFdSYU01?=
 =?utf-8?B?TWVxbTNCdkNLOVF4TXVtWEdtRDZRd3ZxWWVHTEZzTk9SVG5zd1J1OXFkMkRi?=
 =?utf-8?B?VnUzYXpZTExrSW1uQ3VvZko0ZWVReFJBd1lNMHZBQkcyaEhBWXFCejR2Mm9n?=
 =?utf-8?B?TXpNeTNQQm5PUnh3S2I2YU5oRzBtV2UvTHFxd1prOVJkTStacXlnbW1BdHZM?=
 =?utf-8?B?NU5SRWJORUpCUDM3NlpxWFVCQ0VWL2orRjdINkdJd0NCOWJrSmJ2c3YyZTVu?=
 =?utf-8?B?WkRjWnZvQXFQQi9FUHh1bGZuOForOVBYdnc3S09SRkk4bjd5VncyWU5GUFhv?=
 =?utf-8?B?VzdtWDVoTVUxcmVzVlpsb0d2UWpuU05ZSVMwKzMybGhnK2dNOUJtTkcrNlJj?=
 =?utf-8?B?OTN5NEtmeHNEQ0w4bW9hTSt1cjN3MWtqNTBqNnIrNHVRVXJLa0RjRWJFdWQx?=
 =?utf-8?B?YVZOMkZPZWxBcG13aTFIc2VMNHRRbmh6NzBsQW9CcE9UZ2ozcEUvVXpLeGRs?=
 =?utf-8?B?MUhsR2ZBUXVNQzFSVVZ1VGZQNHlIMGp5OFhVK1lDb2RTSit5ZzhQdXVaK0NB?=
 =?utf-8?Q?hEZzmybwvsOtJsF7pSmla3bvD?=
Content-ID: <5AB4D7F840B24A498F826BDA087AEA12@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB1953.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9165c2a9-62a4-439c-c2f1-08da81b54eb6
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2022 07:34:53.5698 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: r0uQ1afDsqmmXuvmU+KnP7ckAO5zIsyBh7U8CgvMwFSHVvTvOgbEuq3I/RowunfgB3B05+XKVWZyM2BFjDSaemfxfKiw0gi5RU6dcrdGYzE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6039
Cc: richardcochran@gmail.com, andrew@lunn.ch, alexandre.belloni@bootlin.com,
 rdunlap@infradead.org, geert+renesas@glider.be, peter.chen@nxp.com,
 tony@atomide.com, magnus.damm@gmail.com, lpieralisi@kernel.org,
 liviu.dudau@arm.com, linux-kernel@vger.kernel.org, thierry.reding@gmail.com,
 laurent.pinchart@ideasonboard.com, alim.akhtar@samsung.com, festevam@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, stefan.wahren@i2se.com,
 linux-samsung-soc@vger.kernel.org, aaro.koskinen@iki.fi,
 gregory.clement@bootlin.com, jmkrzyszt@gmail.com, linux@armlinux.org.uk,
 jernej.skrabec@gmail.com, jonathanh@nvidia.com, wens@csie.org,
 linux-imx@nxp.com, vladimir.oltean@nxp.com, kuba@kernel.org,
 linus.walleij@linaro.org, sebastian.hesselbarth@gmail.com,
 mcoquelin.stm32@gmail.com, arnd@arndb.de, Tudor.Ambarus@microchip.com,
 s.hauer@pengutronix.de, l.stelmach@samsung.com, vz@mleia.com,
 broonie@kernel.org, linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org,
 b-liu@ti.com, qinjian@cqplus1.com, gregkh@linuxfoundation.org,
 samuel@sholland.org, Nicolas.Ferre@microchip.com, balbi@ti.com,
 linux-sunxi@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
 dinguyen@kernel.org, krzysztof.kozlowski@linaro.org, linux-usb@vger.kernel.org,
 kernel@pengutronix.de, sudeep.holla@arm.com, snelson@pensando.io,
 shawnguo@kernel.org
Subject: Re: [Linux-stm32] [PATCH 01/11] ARM: defconfig: reorder defconfig
	files
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

On 18.08.2022 16:55, Arnd Bergmann wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The debug-info and can subystem options have moved around in the
> 'savedefconfig' output, so fix these up to reduce the clutter
> from the savedefconfig command.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/arm/configs/at91_dt_defconfig   |  2 +-

[ ... ]

>  arch/arm/configs/sama5_defconfig     |  6 +++---
>  arch/arm/configs/sama7_defconfig     |  4 ++--

For AT91:

Reviewed-by: Claudiu Beznea <claudiu.beznea@microchip.com>

[ ... ]

>  32 files changed, 46 insertions(+), 46 deletions(-)
> 
> diff --git a/arch/arm/configs/at91_dt_defconfig b/arch/arm/configs/at91_dt_defconfig
> index da90ce9cd42e..5cc72266eaff 100644
> --- a/arch/arm/configs/at91_dt_defconfig
> +++ b/arch/arm/configs/at91_dt_defconfig
> @@ -40,7 +40,6 @@ CONFIG_IP_PNP_RARP=y
>  # CONFIG_INET_DIAG is not set
>  CONFIG_IPV6_SIT_6RD=y
>  CONFIG_CAN=y
> -CONFIG_CAN_AT91=y
>  CONFIG_CFG80211=y
>  CONFIG_MAC80211=y
>  CONFIG_DEVTMPFS=y
> @@ -81,6 +80,7 @@ CONFIG_DM9000=y
>  # CONFIG_NET_VENDOR_STMICRO is not set
>  CONFIG_DAVICOM_PHY=y
>  CONFIG_MICREL_PHY=y
> +CONFIG_CAN_AT91=y
>  CONFIG_LIBERTAS=m
>  CONFIG_LIBERTAS_SDIO=m
>  CONFIG_LIBERTAS_SPI=m
> diff --git a/arch/arm/configs/dove_defconfig b/arch/arm/configs/dove_defconfig
> index 16ed5c110e8d..a9aa6458d46c 100644
> --- a/arch/arm/configs/dove_defconfig
> +++ b/arch/arm/configs/dove_defconfig
> @@ -116,7 +116,6 @@ CONFIG_NLS_ISO8859_1=y
>  CONFIG_NLS_ISO8859_2=y
>  CONFIG_NLS_UTF8=y
>  CONFIG_TIMER_STATS=y
> -CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
>  CONFIG_CRYPTO_NULL=y
>  CONFIG_CRYPTO_ECB=m
>  CONFIG_CRYPTO_PCBC=m
> @@ -136,6 +135,7 @@ CONFIG_CRC_CCITT=y
>  CONFIG_LIBCRC32C=y
>  CONFIG_PRINTK_TIME=y
>  # CONFIG_DEBUG_BUGVERBOSE is not set
> +CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
>  CONFIG_MAGIC_SYSRQ=y
>  CONFIG_DEBUG_FS=y
>  # CONFIG_SCHED_DEBUG is not set
> diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
> index 1ce74f46e114..e3c99d40ffbc 100644
> --- a/arch/arm/configs/exynos_defconfig
> +++ b/arch/arm/configs/exynos_defconfig
> @@ -374,8 +374,8 @@ CONFIG_FONTS=y
>  CONFIG_FONT_7x14=y
>  CONFIG_PRINTK_TIME=y
>  CONFIG_DYNAMIC_DEBUG=y
> -CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
>  CONFIG_DEBUG_KERNEL=y
> +CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
>  CONFIG_MAGIC_SYSRQ=y
>  CONFIG_DEBUG_FS=y
>  CONFIG_SOFTLOCKUP_DETECTOR=y
> diff --git a/arch/arm/configs/imx_v6_v7_defconfig b/arch/arm/configs/imx_v6_v7_defconfig
> index 01012537a9b9..f692463da019 100644
> --- a/arch/arm/configs/imx_v6_v7_defconfig
> +++ b/arch/arm/configs/imx_v6_v7_defconfig
> @@ -65,7 +65,6 @@ CONFIG_IP_PNP=y
>  CONFIG_IP_PNP_DHCP=y
>  CONFIG_NETFILTER=y
>  CONFIG_CAN=y
> -CONFIG_CAN_FLEXCAN=y
>  CONFIG_BT=y
>  CONFIG_BT_BNEP=m
>  CONFIG_BT_HCIUART=y
> @@ -136,6 +135,7 @@ CONFIG_SMSC911X=y
>  # CONFIG_NET_VENDOR_STMICRO is not set
>  CONFIG_MICREL_PHY=y
>  CONFIG_AT803X_PHY=y
> +CONFIG_CAN_FLEXCAN=y
>  CONFIG_USB_PEGASUS=m
>  CONFIG_USB_RTL8150=m
>  CONFIG_USB_RTL8152=y
> diff --git a/arch/arm/configs/keystone_defconfig b/arch/arm/configs/keystone_defconfig
> index 68b89b90ca29..97f958d55019 100644
> --- a/arch/arm/configs/keystone_defconfig
> +++ b/arch/arm/configs/keystone_defconfig
> @@ -109,8 +109,6 @@ CONFIG_IP6_NF_IPTABLES=m
>  CONFIG_IP_SCTP=y
>  CONFIG_VLAN_8021Q=y
>  CONFIG_CAN=m
> -CONFIG_CAN_C_CAN=m
> -CONFIG_CAN_C_CAN_PLATFORM=m
>  CONFIG_PCI=y
>  CONFIG_PCI_MSI=y
>  CONFIG_DEVTMPFS=y
> @@ -137,6 +135,8 @@ CONFIG_TI_KEYSTONE_NETCP_ETHSS=y
>  CONFIG_MARVELL_PHY=y
>  CONFIG_MICREL_PHY=y
>  CONFIG_DP83867_PHY=y
> +CONFIG_CAN_C_CAN=m
> +CONFIG_CAN_C_CAN_PLATFORM=m
>  CONFIG_INPUT_EVDEV=m
>  CONFIG_INPUT_MISC=y
>  CONFIG_INPUT_GPIO_DECODER=m
> @@ -224,7 +224,6 @@ CONFIG_NFSD=y
>  CONFIG_NFSD_V3_ACL=y
>  CONFIG_NLS_CODEPAGE_437=y
>  CONFIG_NLS_ISO8859_1=y
> -CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
>  CONFIG_CRYPTO_USER=y
>  CONFIG_CRYPTO_AUTHENC=y
>  CONFIG_CRYPTO_CBC=y
> @@ -236,5 +235,6 @@ CONFIG_CRYPTO_USER_API_HASH=y
>  CONFIG_CRYPTO_USER_API_SKCIPHER=y
>  CONFIG_DMA_CMA=y
>  CONFIG_PRINTK_TIME=y
> +CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
>  CONFIG_DEBUG_SHIRQ=y
>  CONFIG_DEBUG_USER=y
> diff --git a/arch/arm/configs/lpc18xx_defconfig b/arch/arm/configs/lpc18xx_defconfig
> index 142c1700f450..56eae6a0a311 100644
> --- a/arch/arm/configs/lpc18xx_defconfig
> +++ b/arch/arm/configs/lpc18xx_defconfig
> @@ -150,9 +150,9 @@ CONFIG_JFFS2_FS=y
>  CONFIG_CRC_ITU_T=y
>  CONFIG_CRC7=y
>  CONFIG_PRINTK_TIME=y
> -CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
>  # CONFIG_ENABLE_MUST_CHECK is not set
>  # CONFIG_DEBUG_BUGVERBOSE is not set
> +CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
>  CONFIG_MAGIC_SYSRQ=y
>  CONFIG_DEBUG_FS=y
>  # CONFIG_SLUB_DEBUG is not set
> diff --git a/arch/arm/configs/mmp2_defconfig b/arch/arm/configs/mmp2_defconfig
> index 4d39c615117b..7984640e994e 100644
> --- a/arch/arm/configs/mmp2_defconfig
> +++ b/arch/arm/configs/mmp2_defconfig
> @@ -73,10 +73,10 @@ CONFIG_ROOT_NFS=y
>  CONFIG_CRC_CCITT=y
>  CONFIG_PRINTK_TIME=y
>  CONFIG_DEBUG_KERNEL=y
> +CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
>  CONFIG_MAGIC_SYSRQ=y
>  CONFIG_DEBUG_FS=y
>  # CONFIG_DEBUG_PREEMPT is not set
> -CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
>  # CONFIG_DYNAMIC_DEBUG is not set
>  CONFIG_DEBUG_USER=y
>  CONFIG_DEBUG_LL=y
> diff --git a/arch/arm/configs/mps2_defconfig b/arch/arm/configs/mps2_defconfig
> index 700568474549..3ed73f184d83 100644
> --- a/arch/arm/configs/mps2_defconfig
> +++ b/arch/arm/configs/mps2_defconfig
> @@ -94,9 +94,9 @@ CONFIG_NFS_V4_2=y
>  CONFIG_ROOT_NFS=y
>  CONFIG_NLS=y
>  CONFIG_PRINTK_TIME=y
> -CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
>  # CONFIG_ENABLE_MUST_CHECK is not set
>  # CONFIG_DEBUG_BUGVERBOSE is not set
> +CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
>  CONFIG_DEBUG_FS=y
>  # CONFIG_SLUB_DEBUG is not set
>  # CONFIG_SCHED_DEBUG is not set
> diff --git a/arch/arm/configs/multi_v5_defconfig b/arch/arm/configs/multi_v5_defconfig
> index e0be0e0023f3..5f3ed81228b0 100644
> --- a/arch/arm/configs/multi_v5_defconfig
> +++ b/arch/arm/configs/multi_v5_defconfig
> @@ -290,8 +290,8 @@ CONFIG_CRYPTO_PCBC=m
>  CONFIG_CRYPTO_DEV_MARVELL_CESA=y
>  CONFIG_CRC_CCITT=y
>  CONFIG_LIBCRC32C=y
> -CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
>  CONFIG_DEBUG_KERNEL=y
> +CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
>  CONFIG_MAGIC_SYSRQ=y
>  CONFIG_DEBUG_FS=y
>  # CONFIG_SCHED_DEBUG is not set
> diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
> index 12b35008571f..7ac539231a90 100644
> --- a/arch/arm/configs/multi_v7_defconfig
> +++ b/arch/arm/configs/multi_v7_defconfig
> @@ -167,12 +167,6 @@ CONFIG_NET_DSA=m
>  CONFIG_QRTR=m
>  CONFIG_QRTR_SMD=m
>  CONFIG_CAN=y
> -CONFIG_CAN_AT91=m
> -CONFIG_CAN_FLEXCAN=m
> -CONFIG_CAN_SUN4I=y
> -CONFIG_CAN_XILINXCAN=y
> -CONFIG_CAN_RCAR=m
> -CONFIG_CAN_MCP251X=y
>  CONFIG_BT=m
>  CONFIG_BT_HCIUART=m
>  CONFIG_BT_HCIUART_BCM=y
> @@ -300,6 +294,12 @@ CONFIG_MARVELL_PHY=y
>  CONFIG_AT803X_PHY=y
>  CONFIG_ROCKCHIP_PHY=y
>  CONFIG_DP83867_PHY=y
> +CONFIG_CAN_AT91=m
> +CONFIG_CAN_FLEXCAN=m
> +CONFIG_CAN_SUN4I=y
> +CONFIG_CAN_XILINXCAN=y
> +CONFIG_CAN_RCAR=m
> +CONFIG_CAN_MCP251X=y
>  CONFIG_MDIO_MSCC_MIIM=m
>  CONFIG_USB_PEGASUS=y
>  CONFIG_USB_RTL8152=m
> diff --git a/arch/arm/configs/mvebu_v5_defconfig b/arch/arm/configs/mvebu_v5_defconfig
> index ef3a33ebc29a..587685182735 100644
> --- a/arch/arm/configs/mvebu_v5_defconfig
> +++ b/arch/arm/configs/mvebu_v5_defconfig
> @@ -184,13 +184,13 @@ CONFIG_NLS_CODEPAGE_850=y
>  CONFIG_NLS_ISO8859_1=y
>  CONFIG_NLS_ISO8859_2=y
>  CONFIG_NLS_UTF8=y
> -CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
>  CONFIG_CRYPTO_CBC=m
>  CONFIG_CRYPTO_PCBC=m
>  CONFIG_CRYPTO_DEV_MARVELL_CESA=y
>  CONFIG_CRC_CCITT=y
>  CONFIG_LIBCRC32C=y
>  CONFIG_DEBUG_KERNEL=y
> +CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
>  CONFIG_MAGIC_SYSRQ=y
>  CONFIG_DEBUG_FS=y
>  # CONFIG_SCHED_DEBUG is not set
> diff --git a/arch/arm/configs/mxs_defconfig b/arch/arm/configs/mxs_defconfig
> index 155553ee06f4..6fbe93375998 100644
> --- a/arch/arm/configs/mxs_defconfig
> +++ b/arch/arm/configs/mxs_defconfig
> @@ -38,7 +38,6 @@ CONFIG_SYN_COOKIES=y
>  # CONFIG_INET_DIAG is not set
>  # CONFIG_IPV6 is not set
>  CONFIG_CAN=m
> -CONFIG_CAN_FLEXCAN=m
>  # CONFIG_WIRELESS is not set
>  CONFIG_DEVTMPFS=y
>  CONFIG_DEVTMPFS_MOUNT=y
> @@ -62,6 +61,7 @@ CONFIG_ICPLUS_PHY=y
>  CONFIG_MICREL_PHY=y
>  CONFIG_REALTEK_PHY=y
>  CONFIG_SMSC_PHY=y
> +CONFIG_CAN_FLEXCAN=m
>  CONFIG_USB_USBNET=y
>  CONFIG_USB_NET_SMSC95XX=y
>  # CONFIG_WLAN is not set
> @@ -163,8 +163,8 @@ CONFIG_CRC_ITU_T=m
>  CONFIG_CRC7=m
>  CONFIG_FONTS=y
>  CONFIG_PRINTK_TIME=y
> -CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
>  CONFIG_DEBUG_KERNEL=y
> +CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
>  CONFIG_FRAME_WARN=2048
>  CONFIG_MAGIC_SYSRQ=y
>  CONFIG_SOFTLOCKUP_DETECTOR=y
> diff --git a/arch/arm/configs/omap1_defconfig b/arch/arm/configs/omap1_defconfig
> index 54a9f50122af..28a5354bf801 100644
> --- a/arch/arm/configs/omap1_defconfig
> +++ b/arch/arm/configs/omap1_defconfig
> @@ -218,7 +218,6 @@ CONFIG_NLS_KOI8_R=y
>  CONFIG_NLS_UTF8=y
>  # CONFIG_ENABLE_MUST_CHECK is not set
>  CONFIG_DEBUG_KERNEL=y
> -CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
>  CONFIG_SECURITY=y
>  CONFIG_CRYPTO_ECB=y
>  CONFIG_CRYPTO_PCBC=y
> @@ -232,6 +231,7 @@ CONFIG_FONT_8x16=y
>  CONFIG_FONT_6x11=y
>  CONFIG_FONT_MINI_4x6=y
>  # CONFIG_DEBUG_BUGVERBOSE is not set
> +CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
>  CONFIG_MAGIC_SYSRQ=y
>  CONFIG_DEBUG_SPINLOCK=y
>  CONFIG_DEBUG_MUTEXES=y
> diff --git a/arch/arm/configs/omap2plus_defconfig b/arch/arm/configs/omap2plus_defconfig
> index 99d015cf8919..e273365838cb 100644
> --- a/arch/arm/configs/omap2plus_defconfig
> +++ b/arch/arm/configs/omap2plus_defconfig
> @@ -249,8 +249,6 @@ CONFIG_NET_ACT_POLICE=m
>  CONFIG_NET_ACT_GACT=m
>  CONFIG_NET_SWITCHDEV=y
>  CONFIG_CAN=m
> -CONFIG_CAN_C_CAN=m
> -CONFIG_CAN_C_CAN_PLATFORM=m
>  CONFIG_BT=m
>  CONFIG_BT_RFCOMM=m
>  CONFIG_BT_RFCOMM_TTY=y
> @@ -350,6 +348,8 @@ CONFIG_AT803X_PHY=y
>  CONFIG_SMSC_PHY=y
>  CONFIG_DP83848_PHY=y
>  CONFIG_DP83867_PHY=y
> +CONFIG_CAN_C_CAN=m
> +CONFIG_CAN_C_CAN_PLATFORM=m
>  CONFIG_PPP=m
>  CONFIG_PPP_BSDCOMP=m
>  CONFIG_PPP_DEFLATE=m
> diff --git a/arch/arm/configs/orion5x_defconfig b/arch/arm/configs/orion5x_defconfig
> index 1311d9583fcc..22fde5ce5cf6 100644
> --- a/arch/arm/configs/orion5x_defconfig
> +++ b/arch/arm/configs/orion5x_defconfig
> @@ -138,9 +138,9 @@ CONFIG_CRYPTO_PCBC=m
>  CONFIG_CRYPTO_DEV_MARVELL_CESA=y
>  CONFIG_CRC_T10DIF=y
>  # CONFIG_DEBUG_BUGVERBOSE is not set
> +CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
>  CONFIG_MAGIC_SYSRQ=y
>  CONFIG_DEBUG_FS=y
> -CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
>  # CONFIG_SLUB_DEBUG is not set
>  CONFIG_LATENCYTOP=y
>  # CONFIG_FTRACE is not set
> diff --git a/arch/arm/configs/pxa168_defconfig b/arch/arm/configs/pxa168_defconfig
> index 70d327895ccf..e4a004260c2e 100644
> --- a/arch/arm/configs/pxa168_defconfig
> +++ b/arch/arm/configs/pxa168_defconfig
> @@ -50,9 +50,9 @@ CONFIG_ROOT_NFS=y
>  CONFIG_CRC_CCITT=y
>  CONFIG_PRINTK_TIME=y
>  CONFIG_DEBUG_KERNEL=y
> +CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
>  CONFIG_MAGIC_SYSRQ=y
>  # CONFIG_DEBUG_PREEMPT is not set
> -CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
>  CONFIG_DEBUG_USER=y
>  CONFIG_DEBUG_LL=y
>  # CONFIG_CRYPTO_ANSI_CPRNG is not set
> diff --git a/arch/arm/configs/pxa910_defconfig b/arch/arm/configs/pxa910_defconfig
> index 5072bde71508..7adf90df6795 100644
> --- a/arch/arm/configs/pxa910_defconfig
> +++ b/arch/arm/configs/pxa910_defconfig
> @@ -58,9 +58,9 @@ CONFIG_ROOT_NFS=y
>  CONFIG_CRC_CCITT=y
>  CONFIG_PRINTK_TIME=y
>  CONFIG_DEBUG_KERNEL=y
> +CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
>  CONFIG_MAGIC_SYSRQ=y
>  # CONFIG_DEBUG_PREEMPT is not set
> -CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
>  CONFIG_DEBUG_USER=y
>  CONFIG_DEBUG_LL=y
>  CONFIG_DEBUG_MMP_UART2=y
> diff --git a/arch/arm/configs/pxa_defconfig b/arch/arm/configs/pxa_defconfig
> index 104a45722799..95c03ee20d28 100644
> --- a/arch/arm/configs/pxa_defconfig
> +++ b/arch/arm/configs/pxa_defconfig
> @@ -646,7 +646,6 @@ CONFIG_NLS_ASCII=m
>  CONFIG_NLS_ISO8859_1=m
>  CONFIG_NLS_ISO8859_15=m
>  CONFIG_NLS_UTF8=m
> -CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
>  CONFIG_TIMER_STATS=y
>  CONFIG_SECURITY=y
>  CONFIG_CRYPTO_MANAGER=y
> @@ -682,6 +681,7 @@ CONFIG_FONT_6x11=y
>  CONFIG_FONT_MINI_4x6=y
>  CONFIG_PRINTK_TIME=y
>  CONFIG_DYNAMIC_DEBUG=y
> +CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
>  CONFIG_FRAME_WARN=0
>  CONFIG_STRIP_ASM_SYMS=y
>  CONFIG_MAGIC_SYSRQ=y
> diff --git a/arch/arm/configs/s3c6400_defconfig b/arch/arm/configs/s3c6400_defconfig
> index 4f04f583c738..93258d5b57ff 100644
> --- a/arch/arm/configs/s3c6400_defconfig
> +++ b/arch/arm/configs/s3c6400_defconfig
> @@ -62,8 +62,8 @@ CONFIG_TMPFS=y
>  CONFIG_TMPFS_POSIX_ACL=y
>  CONFIG_CRAMFS=y
>  CONFIG_ROMFS_FS=y
> -CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
>  CONFIG_DEBUG_KERNEL=y
> +CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
>  CONFIG_MAGIC_SYSRQ=y
>  CONFIG_DEBUG_RT_MUTEXES=y
>  CONFIG_DEBUG_SPINLOCK=y
> diff --git a/arch/arm/configs/s5pv210_defconfig b/arch/arm/configs/s5pv210_defconfig
> index 789e900a8a08..ab9fec22a825 100644
> --- a/arch/arm/configs/s5pv210_defconfig
> +++ b/arch/arm/configs/s5pv210_defconfig
> @@ -115,8 +115,8 @@ CONFIG_NLS_ASCII=y
>  CONFIG_NLS_ISO8859_1=y
>  CONFIG_NLS_UTF8=y
>  CONFIG_CRC_CCITT=y
> -CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
>  CONFIG_DEBUG_KERNEL=y
> +CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
>  CONFIG_MAGIC_SYSRQ=y
>  # CONFIG_DEBUG_PREEMPT is not set
>  CONFIG_DEBUG_RT_MUTEXES=y
> diff --git a/arch/arm/configs/sama5_defconfig b/arch/arm/configs/sama5_defconfig
> index 3a6a4851ef26..877bbe7b777e 100644
> --- a/arch/arm/configs/sama5_defconfig
> +++ b/arch/arm/configs/sama5_defconfig
> @@ -43,9 +43,6 @@ CONFIG_BRIDGE_VLAN_FILTERING=y
>  CONFIG_NET_DSA=m
>  CONFIG_VLAN_8021Q=m
>  CONFIG_CAN=y
> -CONFIG_CAN_AT91=y
> -CONFIG_CAN_M_CAN=y
> -CONFIG_CAN_M_CAN_PLATFORM=y
>  CONFIG_CFG80211=y
>  CONFIG_MAC80211=y
>  CONFIG_MAC80211_LEDS=y
> @@ -90,6 +87,9 @@ CONFIG_MACB=y
>  # CONFIG_NET_VENDOR_STMICRO is not set
>  # CONFIG_NET_VENDOR_WIZNET is not set
>  CONFIG_MICREL_PHY=y
> +CONFIG_CAN_AT91=y
> +CONFIG_CAN_M_CAN=y
> +CONFIG_CAN_M_CAN_PLATFORM=y
>  CONFIG_USB_LAN78XX=m
>  CONFIG_LIBERTAS_THINFIRM=m
>  CONFIG_LIBERTAS_THINFIRM_USB=m
> diff --git a/arch/arm/configs/sama7_defconfig b/arch/arm/configs/sama7_defconfig
> index 0384030d8b25..8803536854c6 100644
> --- a/arch/arm/configs/sama7_defconfig
> +++ b/arch/arm/configs/sama7_defconfig
> @@ -59,8 +59,6 @@ CONFIG_BRIDGE_VLAN_FILTERING=y
>  CONFIG_NET_DSA=m
>  CONFIG_VLAN_8021Q=m
>  CONFIG_CAN=y
> -CONFIG_CAN_M_CAN=y
> -CONFIG_CAN_M_CAN_PLATFORM=y
>  CONFIG_BT=y
>  CONFIG_BT_RFCOMM=y
>  CONFIG_BT_RFCOMM_TTY=y
> @@ -107,6 +105,8 @@ CONFIG_BLK_DEV_SD=y
>  CONFIG_NETDEVICES=y
>  CONFIG_MACB=y
>  CONFIG_MICREL_PHY=y
> +CONFIG_CAN_M_CAN=y
> +CONFIG_CAN_M_CAN_PLATFORM=y
>  CONFIG_INPUT_EVDEV=y
>  CONFIG_KEYBOARD_GPIO=y
>  # CONFIG_INPUT_MOUSE is not set
> diff --git a/arch/arm/configs/shmobile_defconfig b/arch/arm/configs/shmobile_defconfig
> index a29bebb3742e..fa3b0031a72b 100644
> --- a/arch/arm/configs/shmobile_defconfig
> +++ b/arch/arm/configs/shmobile_defconfig
> @@ -33,7 +33,6 @@ CONFIG_INET=y
>  CONFIG_IP_PNP=y
>  CONFIG_IP_PNP_DHCP=y
>  CONFIG_CAN=y
> -CONFIG_CAN_RCAR=y
>  CONFIG_PCI=y
>  CONFIG_PCI_MSI=y
>  CONFIG_PCI_RCAR_GEN2=y
> @@ -57,6 +56,7 @@ CONFIG_RAVB=y
>  CONFIG_SMSC911X=y
>  CONFIG_MICREL_PHY=y
>  CONFIG_SMSC_PHY=y
> +CONFIG_CAN_RCAR=y
>  CONFIG_INPUT_EVDEV=y
>  CONFIG_KEYBOARD_GPIO=y
>  # CONFIG_INPUT_MOUSE is not set
> diff --git a/arch/arm/configs/socfpga_defconfig b/arch/arm/configs/socfpga_defconfig
> index d91ae3f0d698..70739e09d0f4 100644
> --- a/arch/arm/configs/socfpga_defconfig
> +++ b/arch/arm/configs/socfpga_defconfig
> @@ -33,9 +33,6 @@ CONFIG_NETWORK_PHY_TIMESTAMPING=y
>  CONFIG_VLAN_8021Q=y
>  CONFIG_VLAN_8021Q_GVRP=y
>  CONFIG_CAN=y
> -CONFIG_CAN_C_CAN=y
> -CONFIG_CAN_C_CAN_PLATFORM=y
> -CONFIG_CAN_DEBUG_DEVICES=y
>  CONFIG_PCI=y
>  CONFIG_PCI_MSI=y
>  CONFIG_PCIE_ALTERA=y
> @@ -70,6 +67,9 @@ CONFIG_IXGBE=m
>  CONFIG_STMMAC_ETH=y
>  CONFIG_MARVELL_PHY=y
>  CONFIG_MICREL_PHY=y
> +CONFIG_CAN_C_CAN=y
> +CONFIG_CAN_C_CAN_PLATFORM=y
> +CONFIG_CAN_DEBUG_DEVICES=y
>  CONFIG_INPUT_EVDEV=y
>  CONFIG_INPUT_TOUCHSCREEN=y
>  CONFIG_TOUCHSCREEN_STMPE=y
> diff --git a/arch/arm/configs/sp7021_defconfig b/arch/arm/configs/sp7021_defconfig
> index 703b9aaa40f0..aa7dfd670db5 100644
> --- a/arch/arm/configs/sp7021_defconfig
> +++ b/arch/arm/configs/sp7021_defconfig
> @@ -13,7 +13,6 @@ CONFIG_LOG_BUF_SHIFT=14
>  # CONFIG_RD_LZ4 is not set
>  CONFIG_CC_OPTIMIZE_FOR_SIZE=y
>  CONFIG_PERF_EVENTS=y
> -CONFIG_SLAB=y
>  CONFIG_ARCH_SUNPLUS=y
>  # CONFIG_VDSO is not set
>  CONFIG_SMP=y
> @@ -25,6 +24,7 @@ CONFIG_MODULES=y
>  CONFIG_MODULE_UNLOAD=y
>  CONFIG_MODVERSIONS=y
>  # CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
> +CONFIG_SLAB=y
>  CONFIG_UEVENT_HELPER=y
>  CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
>  CONFIG_DEVTMPFS=y
> diff --git a/arch/arm/configs/spear13xx_defconfig b/arch/arm/configs/spear13xx_defconfig
> index 0227dd566c28..bfde0c86cdc5 100644
> --- a/arch/arm/configs/spear13xx_defconfig
> +++ b/arch/arm/configs/spear13xx_defconfig
> @@ -98,7 +98,7 @@ CONFIG_NLS_DEFAULT="utf8"
>  CONFIG_NLS_CODEPAGE_437=y
>  CONFIG_NLS_ASCII=m
>  CONFIG_DEBUG_KERNEL=y
> +CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
>  CONFIG_MAGIC_SYSRQ=y
>  CONFIG_DEBUG_FS=y
>  CONFIG_DEBUG_SPINLOCK=y
> -CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
> diff --git a/arch/arm/configs/spear3xx_defconfig b/arch/arm/configs/spear3xx_defconfig
> index 254d970a4011..a96ed5cf778e 100644
> --- a/arch/arm/configs/spear3xx_defconfig
> +++ b/arch/arm/configs/spear3xx_defconfig
> @@ -78,7 +78,7 @@ CONFIG_NLS_DEFAULT="utf8"
>  CONFIG_NLS_CODEPAGE_437=y
>  CONFIG_NLS_ASCII=m
>  CONFIG_DEBUG_KERNEL=y
> +CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
>  CONFIG_MAGIC_SYSRQ=y
>  CONFIG_DEBUG_FS=y
>  CONFIG_DEBUG_SPINLOCK=y
> -CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
> diff --git a/arch/arm/configs/spear6xx_defconfig b/arch/arm/configs/spear6xx_defconfig
> index 2809c4eb77e7..3d631b1f3cfa 100644
> --- a/arch/arm/configs/spear6xx_defconfig
> +++ b/arch/arm/configs/spear6xx_defconfig
> @@ -67,7 +67,7 @@ CONFIG_NLS_DEFAULT="utf8"
>  CONFIG_NLS_CODEPAGE_437=y
>  CONFIG_NLS_ASCII=m
>  CONFIG_DEBUG_KERNEL=y
> +CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
>  CONFIG_MAGIC_SYSRQ=y
>  CONFIG_DEBUG_FS=y
>  CONFIG_DEBUG_SPINLOCK=y
> -CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
> diff --git a/arch/arm/configs/stm32_defconfig b/arch/arm/configs/stm32_defconfig
> index 1f5446cda8b6..dc1a32f50b7e 100644
> --- a/arch/arm/configs/stm32_defconfig
> +++ b/arch/arm/configs/stm32_defconfig
> @@ -74,9 +74,9 @@ CONFIG_NLS=y
>  CONFIG_CRC_ITU_T=y
>  CONFIG_CRC7=y
>  CONFIG_PRINTK_TIME=y
> -CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
>  # CONFIG_ENABLE_MUST_CHECK is not set
>  # CONFIG_DEBUG_BUGVERBOSE is not set
> +CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
>  CONFIG_MAGIC_SYSRQ=y
>  # CONFIG_SLUB_DEBUG is not set
>  # CONFIG_SCHED_DEBUG is not set
> diff --git a/arch/arm/configs/sunxi_defconfig b/arch/arm/configs/sunxi_defconfig
> index 3d14827e0a31..06e91ee422fd 100644
> --- a/arch/arm/configs/sunxi_defconfig
> +++ b/arch/arm/configs/sunxi_defconfig
> @@ -26,7 +26,6 @@ CONFIG_IP_PNP_BOOTP=y
>  # CONFIG_INET_DIAG is not set
>  # CONFIG_IPV6 is not set
>  CONFIG_CAN=y
> -CONFIG_CAN_SUN4I=y
>  # CONFIG_WIRELESS is not set
>  CONFIG_DEVTMPFS=y
>  CONFIG_DEVTMPFS_MOUNT=y
> @@ -52,6 +51,7 @@ CONFIG_STMMAC_ETH=y
>  # CONFIG_NET_VENDOR_WIZNET is not set
>  CONFIG_MICREL_PHY=y
>  CONFIG_REALTEK_PHY=y
> +CONFIG_CAN_SUN4I=y
>  # CONFIG_WLAN is not set
>  CONFIG_INPUT_EVDEV=y
>  CONFIG_KEYBOARD_SUN4I_LRADC=y
> diff --git a/arch/arm/configs/tegra_defconfig b/arch/arm/configs/tegra_defconfig
> index 71400af6cef4..9c270e3cb9d9 100644
> --- a/arch/arm/configs/tegra_defconfig
> +++ b/arch/arm/configs/tegra_defconfig
> @@ -54,7 +54,6 @@ CONFIG_IPV6_MIP6=y
>  CONFIG_IPV6_TUNNEL=y
>  CONFIG_IPV6_MULTIPLE_TABLES=y
>  CONFIG_CAN=y
> -CONFIG_CAN_MCP251X=y
>  CONFIG_BT=y
>  CONFIG_BT_RFCOMM=y
>  CONFIG_BT_BNEP=y
> @@ -99,6 +98,7 @@ CONFIG_NETDEVICES=y
>  CONFIG_DUMMY=y
>  CONFIG_IGB=y
>  CONFIG_R8169=y
> +CONFIG_CAN_MCP251X=y
>  CONFIG_USB_PEGASUS=y
>  CONFIG_USB_USBNET=y
>  CONFIG_USB_NET_SMSC75XX=y
> diff --git a/arch/arm/configs/vexpress_defconfig b/arch/arm/configs/vexpress_defconfig
> index 4e3a0133e4d3..ac3fd7523698 100644
> --- a/arch/arm/configs/vexpress_defconfig
> +++ b/arch/arm/configs/vexpress_defconfig
> @@ -133,8 +133,8 @@ CONFIG_NLS_CODEPAGE_437=y
>  CONFIG_NLS_ISO8859_1=y
>  # CONFIG_CRYPTO_HW is not set
>  CONFIG_DMA_CMA=y
> -CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
>  CONFIG_DEBUG_KERNEL=y
> +CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
>  CONFIG_MAGIC_SYSRQ=y
>  CONFIG_DETECT_HUNG_TASK=y
>  # CONFIG_SCHED_DEBUG is not set
> --
> 2.29.2
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
