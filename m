Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4211263D4BF
	for <lists+linux-stm32@lfdr.de>; Wed, 30 Nov 2022 12:39:01 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E4B70C65E58;
	Wed, 30 Nov 2022 11:39:00 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on2071.outbound.protection.outlook.com [40.107.14.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AF959C63326
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Nov 2022 11:38:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V8lwuhqorUydwC6F/5maVCYIRQLF2HovZCvQCs9RaQpz8Ea6Q+L5wDtbbK6XrAYE/bOXUymgA8CLnEYHPkLHT+9IMahtmdG5jjprXluAAlRy0QNNf9q3IOd/cKJZCtt0dcV6CEu+CC1C8o+XIN58SVFblNUL9arxbPMEERzGTsOwLctYMl3d6aJKK053d3LRnhbXdVgIK5xlB6/ikXj0ZR6DeX7Sr2Ajzr98LPi+S9QJEGtKtuFUDlGgp1SFOuPc+9dodrOqRCZZoInebDZgBI04NxRYrPggZi8xzCzanhVTF2kX2d/B8sZUGdBvfBwExYj9jKuZZEzNmutDDHOGcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8yLwzBHfvYe8Jl7Sf4ko8ezLmhBpZ5PG+3zjU2IDm28=;
 b=SmH4Z4jwIWdn/EWG51NqZKTSGEFtvB0Cf/EJcawXdgbh7LkussyjKqa72ya1klUEGM+wKiBvrYfGjJBaHAowjLxKXSE7k53UjaGCaoyFGtnwAByChOgEox5NjQQstB8gXZN5CUI936MBGJPPeD5Hh4+8XcfST+J3at7JTVdRg3qPImVothesD0mWC1ixBEQYWNSKv4yQNdKpxeTW9dWW9qUWRxmgjLwpdbr5t0wqvCz7WzQOYjYvrRm1I3BeGEHr//zo/ux+ijJ/jIoePFuFRVz5rxMi6MTv7aZz9uuvYAMsAaoodoZ0hs4MQVIJ1NRJuHLtMr2bN7KZofhm6suhrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8yLwzBHfvYe8Jl7Sf4ko8ezLmhBpZ5PG+3zjU2IDm28=;
 b=YOISdjg4gNqqWmzK0mojarfXvXZIAWLgwWm0q9/E9uJfSBtsQNZV/BKr7z1Y2vzatePvUkyY1/2h3+OGsdj2zy2HP9BoyBSL2OIc1Usfcjhyx8qRvv1gtMU/FcxzW/X6eY3ZnwEaivuU784EG5BKNRWAt+sxCN5vsbAHkn8oFCw=
Received: from HE1PR0402MB2939.eurprd04.prod.outlook.com (2603:10a6:3:db::18)
 by PAXPR04MB8375.eurprd04.prod.outlook.com (2603:10a6:102:1be::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.19; Wed, 30 Nov
 2022 11:38:56 +0000
Received: from HE1PR0402MB2939.eurprd04.prod.outlook.com
 ([fe80::7682:a2e6:b891:2f4d]) by HE1PR0402MB2939.eurprd04.prod.outlook.com
 ([fe80::7682:a2e6:b891:2f4d%10]) with mapi id 15.20.5857.023; Wed, 30 Nov
 2022 11:38:56 +0000
From: Clark Wang <xiaoning.wang@nxp.com>
To: Russell King <linux@armlinux.org.uk>
Thread-Topic: [PATCH 1/2] net: phylink: add sync flag mac_ready to fix resume
 issue with WoL enabled
Thread-Index: AQHZBKyo4U8XamUbok2HUhpB4yX+kq5XUw0AgAACeACAAAGZ0A==
Date: Wed, 30 Nov 2022 11:38:56 +0000
Message-ID: <HE1PR0402MB2939DA998F2C323B4AACAB0EF3159@HE1PR0402MB2939.eurprd04.prod.outlook.com>
References: <20221130111148.1064475-1-xiaoning.wang@nxp.com>
 <20221130111148.1064475-2-xiaoning.wang@nxp.com>
 <Y4c9PlfEC17pVE08@shell.armlinux.org.uk>
 <Y4c/UCHxIWZQVwi6@shell.armlinux.org.uk>
In-Reply-To: <Y4c/UCHxIWZQVwi6@shell.armlinux.org.uk>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: HE1PR0402MB2939:EE_|PAXPR04MB8375:EE_
x-ms-office365-filtering-correlation-id: 0963f8f5-6175-4779-1b78-08dad2c77701
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sUcl6m3tPuRJIFaR1lOciao/EeC1zMFEnY+7Y08o+9sbSN5EUXmQj1XAS+Rdie/ctmcE5Q2FiyUG7WulRhVaaBaKVjB1knBE9jMJ7iV90oyZIA0+btrSD50SWIkyE2aia/AgCTiRd6iC7VmwQ6mIEbFPovGVWYRjQqg3eIcdyjNWK1zRoWCC7RexeU+mHFl6dE9104vxnIqp+KgUoINLTXnrAd5QMwlKa4WTmk6g4KH7VcYwARLhNVtrgbmoIdY9btuk0SzVyP/JY/Sat16U6wMmqe/UsV66P0QYJ2EeLWUQlJSaLbQKIGAltaRoXTK9aYzjMTcgIOacpISw1p4IjdPo6IzZBtPwPcuiJM0rOsr1OgTXOWjWEJ4eAA3uZdxdZ8/VtYRwroma3dp1kkqXu8RJfptEV8auUK/L2I3osE2EdJ84F/BEgp2VQFYUe8tJwvrlAwhC/+tkkom1Mtm2cuG3k7XeXqMXUQnpsUVi7m+7V2P/kRTEX0M48C2nWhcV1/vcGIjZf4ZuZw5iSlACYF1/VhQfDCC4De8ix4MRrt0Q2No0yNXt+lBEUQ3treD9G6/JpzjluNfRNx2F/ls6+k6bORhcLRm8aTFUsI6VSYLhwyoaqjvV2L2RoRaU8FqoUf7sKrgCrOGx1oanqf85rIsIFtLmqLr6R7k1vvMbMFt35d0NQBZ3OUn9x3rQ954K5JnyhCPp3VXPcKuglEzvZQHsxqAwy1/ZTlthXQIAfgE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HE1PR0402MB2939.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(346002)(136003)(396003)(376002)(366004)(451199015)(53546011)(71200400001)(26005)(122000001)(45080400002)(9686003)(478600001)(64756008)(38100700002)(966005)(6506007)(66476007)(66446008)(41300700001)(66946007)(76116006)(7696005)(8676002)(33656002)(66556008)(4326008)(86362001)(52536014)(38070700005)(55016003)(316002)(7416002)(54906003)(6916009)(8936002)(5660300002)(186003)(83380400001)(2906002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?SXJ2elVyZ1E3WVVvMm9idklCWUNjU2NzT3d4a1EveEQ2aXU4Z2FoQ0ZKNXBX?=
 =?gb2312?B?NGs0cG1vdDZCd2xWRmxxVGZvUmpYaEsrUjJkUyt0ZjNVaC9wQU0rcXFmQ0tS?=
 =?gb2312?B?UWxzbmZIZXFkbFd0VzhvWm1yaXRTZE1HY3R1T3JJeUlmdDIvNzJrMEc4d1hn?=
 =?gb2312?B?UkxPaWMzdTBoT2J1a01DODZnVjJIbVR3WjJMY2x5VXJra3UyK2NGVXUyTUQ1?=
 =?gb2312?B?a1lpMlJ5ZzhyQkF6TEFWdi9yanJBc2pFTW9KVzl4MldNS2JId2hJTEFJSytI?=
 =?gb2312?B?eGlpRlh5UHN1TVplQjdoRVJSVjduT0orWFJVZ2FrbGlFQW1PMEF0NlRTdHBN?=
 =?gb2312?B?VjBtVXJmay9hcFhXNlVYbzgzL2xlZGNpVko4ZDBZMkR2aS82dWR2eHZENWZl?=
 =?gb2312?B?S3VoMm9YVURFVDJLUVI4aVp4U1RZMzdjVEFCTWhiRVpxWGhHOXdjWlFEbVdm?=
 =?gb2312?B?cEtRUVkySVU1QVpxTGJadi9sbUE2dTkwQXYrTE1yVlBKUXdqZlRJWjFPeFAw?=
 =?gb2312?B?aUFVbmltSWt2ZnVMTndMWXV3ZTViK282bkpqWGpPVDNnRlJCcDRxVkFuRHhD?=
 =?gb2312?B?K1lXM3drLzVVakgwNlhrb1JnS2FnM2NDQ0lkTTFlRk91U3NtR0w1Nk0rMGhL?=
 =?gb2312?B?NjRPOUZOcHE3YXhxY3BLZDNZUHltK29hWGV1Rmw4RVI5YVpseHhNVmxKYis0?=
 =?gb2312?B?a0E4RkFNZDc0VEQxTWJXcGpNd1RXMDNQQnFJZUtiV1NLVGJPSXNjblJuTXZr?=
 =?gb2312?B?SGxQWWxnc2FWby90K3dVRENZMjBCR3NEbXhXRWNaMUZlaS9TN2RQOEliWmI5?=
 =?gb2312?B?NHRYTU9HVzlZTHFVemY3OFZpRWRSWkFlZGVBTlU1Q0xBazZIejFmUUhpY1Bi?=
 =?gb2312?B?dENDYm8wdzJLcmd4TlpIMjZzQlp0cTEyMElGVERGTHE4UTg4dktxVHZiYit1?=
 =?gb2312?B?VGxSakR5N0g4VHZOTnRTQWlxNVFKWW9jVHI1ZDM1UHdyT2FUbVhYeEx5Zm5j?=
 =?gb2312?B?ZXU5a1pNTlhiRWdneG8yYjA3Sk9Hc1N1eGpzUHYva05Da3R2Z1R6M1B3Y2Uy?=
 =?gb2312?B?UG1CQ3dRS2tiSDRZU0hSSndhNDVWaTd0NE9lUTQzam9LVTRidnZMMG9nblJl?=
 =?gb2312?B?SDByZEI4YlFHRkNyTjRQYmZzUitmS2lMRmtyS2lCTW5xZFhQYmpLMTZpUS9C?=
 =?gb2312?B?UlJqbmJZSEFmR0tiVElTdlB6NjgvQlVId0s4QjRNbUE2MUdvSHErUUJWUk1u?=
 =?gb2312?B?YXZvOHEyc0kwMlZaQ0psV09WMUUzYWJaeGNqSGp2WHIweGlJL1Z0TFhNN3Vo?=
 =?gb2312?B?bkZ6dXd2OTV6U3B3OUdLRjBKTlQ1ZFpoc0JwVXliL2JQSFJKOUtHT0RKMldy?=
 =?gb2312?B?UDBocXVLY2puMGtHQmxEMVo1NmErVHlEUnZRN2tTWXVrUm5hdVNSSXZidTBa?=
 =?gb2312?B?NGNIN2lkUEhGS2RYM2R3VjFkSTlzRVB3Qy9iK09KMzNRUEsxK1B4TmpGR3M3?=
 =?gb2312?B?ZUJCRXRpTzBUUzVZS1JuZVRsaDFtc3hhMEhDV3FVZnhZL3lZcVBOTUpWdDlH?=
 =?gb2312?B?aFczSkJYeVhYaW9uQkxUaHM4bU5yOTNRaTN2bDZTNWRXeCs0Q2hjaGl3azJU?=
 =?gb2312?B?cDJEWEg2cmZpVlMxZUQxQ2VHSllvdlRTUURFbkczcVlRZUU1UEY4K1Q4cG5I?=
 =?gb2312?B?Q2tYRjRsbDZUeEo3dWErbEk2M0V2WXFXN0N5aDl5clhhWFBPS0x0TXVkbEhC?=
 =?gb2312?B?R0V1VzlFRWFoNnoyMVlhMkJ6L0tUMWx3dHZramNRMEVXVWRpTmRKSG93Y29K?=
 =?gb2312?B?OWJOK3ZYeFJUSE5JaHQ2Y0VlNDYxakZSMVA5OXBtU3h2SVlyQ2J0Z285Z2pW?=
 =?gb2312?B?eHdGNlVGQ3FCR0tHMTZkUWJoZmVOSUNHNFJQc0ZLWXUxbXF5K1N4Q0FLZTNF?=
 =?gb2312?B?QVRlLzc3dUJHdUFSNS9RK2ZFVTU3UURabUEzVDJpTHdRbGRjK0xjRURHTUd5?=
 =?gb2312?B?UDFTc3ZLUzM1SHRWdUtoZ0wwak01Y2RpWDg5eWd6cEMyeldzRTZZeEYrdFFZ?=
 =?gb2312?B?ZHFhWUlKc21VTDRPcnBWVks5bVp2dkhJYjlWNmt1dHhrNTJtSEtjd3B3Wmgr?=
 =?gb2312?Q?23NRIsdnt0f6+ctSwyC8A7/IY?=
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR0402MB2939.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0963f8f5-6175-4779-1b78-08dad2c77701
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Nov 2022 11:38:56.2920 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vdJAmdbpIMV1esZWT2BZWX1Ex7Xei+GR98j9exrfshNa9YJPSEX5btJNm7wW4fe4+Qf7Al/QkB3kI0xvil0FDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8375
Cc: "andrew@lunn.ch" <andrew@lunn.ch>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "edumazet@google.com" <edumazet@google.com>,
 "joabreu@synopsys.com" <joabreu@synopsys.com>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "kuba@kernel.org" <kuba@kernel.org>,
 "peppe.cavallaro@st.com" <peppe.cavallaro@st.com>,
 "pabeni@redhat.com" <pabeni@redhat.com>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "hkallweit1@gmail.com" <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH 1/2] net: phylink: add sync flag mac_ready
 to fix resume issue with WoL enabled
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
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFJ1c3NlbGwgS2luZyA8bGlu
dXhAYXJtbGludXgub3JnLnVrPg0KPiBTZW50OiAyMDIyxOoxMdTCMzDI1SAxOTozMw0KPiBUbzog
Q2xhcmsgV2FuZyA8eGlhb25pbmcud2FuZ0BueHAuY29tPg0KPiBDYzogcGVwcGUuY2F2YWxsYXJv
QHN0LmNvbTsgYWxleGFuZHJlLnRvcmd1ZUBmb3NzLnN0LmNvbTsNCj4gam9hYnJldUBzeW5vcHN5
cy5jb207IGRhdmVtQGRhdmVtbG9mdC5uZXQ7IGVkdW1hemV0QGdvb2dsZS5jb207DQo+IGt1YmFA
a2VybmVsLm9yZzsgcGFiZW5pQHJlZGhhdC5jb207IG1jb3F1ZWxpbi5zdG0zMkBnbWFpbC5jb207
DQo+IGFuZHJld0BsdW5uLmNoOyBoa2FsbHdlaXQxQGdtYWlsLmNvbTsgbmV0ZGV2QHZnZXIua2Vy
bmVsLm9yZzsNCj4gbGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbTsNCj4g
bGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnOyBsaW51eC1rZXJuZWxAdmdlci5r
ZXJuZWwub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMS8yXSBuZXQ6IHBoeWxpbms6IGFkZCBz
eW5jIGZsYWcgbWFjX3JlYWR5IHRvIGZpeCByZXN1bWUNCj4gaXNzdWUgd2l0aCBXb0wgZW5hYmxl
ZA0KPiANCj4gT24gV2VkLCBOb3YgMzAsIDIwMjIgYXQgMTE6MjM6NDJBTSArMDAwMCwgUnVzc2Vs
bCBLaW5nIChPcmFjbGUpIHdyb3RlOg0KPiA+IE9uIFdlZCwgTm92IDMwLCAyMDIyIGF0IDA3OjEx
OjQ3UE0gKzA4MDAsIENsYXJrIFdhbmcgd3JvdGU6DQo+ID4gPiBJc3N1ZSB3ZSBtZXQ6DQo+ID4g
PiBPbiBzb21lIHBsYXRmb3JtcywgbWFjIGNhbm5vdCB3b3JrIGFmdGVyIHJlc3VtZWQgZnJvbSB0
aGUgc3VzcGVuZA0KPiA+ID4gd2l0aCBXb0wgZW5hYmxlZC4NCj4gPiA+DQo+ID4gPiBUaGUgY2F1
c2Ugb2YgdGhlIGlzc3VlOg0KPiA+ID4gMS4gcGh5bGlua19yZXNvbHZlKCkgaXMgaW4gYSB3b3Jr
cXVldWUgd2hpY2ggd2lsbCBub3QgYmUgZXhlY3V0ZWQNCj4gaW1tZWRpYXRlbHkuDQo+ID4gPiAg
ICBUaGlzIGlzIHRoZSBjYWxsIHNlcXVlbmNlOg0KPiA+ID4gICAgICAgIHBoeWxpbmtfcmVzb2x2
ZSgpLT5waHlsaW5rX2xpbmtfdXAoKS0+cGwtPm1hY19vcHMtPm1hY19saW5rX3VwKCkNCj4gPiA+
ICAgIEZvciBzdG1tYWMgZHJpdmVyLCBtYWNfbGlua191cCgpIHdpbGwgc2V0IHRoZSBjb3JyZWN0
IHNwZWVkL2R1cGxleC4uLg0KPiA+ID4gICAgdmFsdWVzIHdoaWNoIGFyZSBmcm9tIGxpbmtfc3Rh
dGUuDQo+ID4gPiAyLiBJbiBzdG1tYWNfcmVzdW1lKCksIGl0IHdpbGwgY2FsbCBzdG1tYWNfaHdf
c2V0dXAoKSBhZnRlciBjYWxsZWQgdGhlDQo+ID4gPiAgICBwaHlsaW5rX3Jlc3VtZSgpLiBzdG1t
YWNfY29yZV9pbml0KCkgaXMgY2FsbGVkIGluIGZ1bmN0aW9uDQo+ID4gPiBzdG1tYWNfaHdfc2V0
dXAoKSwNCj4gPg0KPiA+IC4uLiBhbmQgdGhhdCBpcyB3aGVyZSB0aGUgcHJvYmxlbSBpcy4gRG9u
J3QgY2FsbCBwaHlsaW5rX3Jlc3VtZSgpDQo+ID4gYmVmb3JlIHlvdXIgaGFyZHdhcmUgaXMgcmVh
ZHkgdG8gc2VlIGEgbGluay11cCBldmVudC4NCj4gDQo+IC4uLiBhbmQgd2hpbGUgdGhhdCBpcyBi
ZWluZyBmaXhlZCwgbWF5YmUgdGhlIHN0dXBpZCBjb2RlIGluDQo+IHN0bW1hY19yZXN1bWUoKSBj
YW4gYWxzbyBiZSBmaXhlZDoNCj4gDQo+ICAgICAgICAgcnRubF9sb2NrKCk7DQo+ICAgICAgICAg
aWYgKGRldmljZV9tYXlfd2FrZXVwKHByaXYtPmRldmljZSkgJiYgcHJpdi0+cGxhdC0+cG10KSB7
DQo+ICAgICAgICAgICAgICAgICBwaHlsaW5rX3Jlc3VtZShwcml2LT5waHlsaW5rKTsNCj4gICAg
ICAgICB9IGVsc2Ugew0KPiAgICAgICAgICAgICAgICAgcGh5bGlua19yZXN1bWUocHJpdi0+cGh5
bGluayk7DQo+ICAgICAgICAgICAgICAgICBpZiAoZGV2aWNlX21heV93YWtldXAocHJpdi0+ZGV2
aWNlKSkNCj4gICAgICAgICAgICAgICAgICAgICAgICAgcGh5bGlua19zcGVlZF91cChwcml2LT5w
aHlsaW5rKTsNCj4gICAgICAgICB9DQo+ICAgICAgICAgcnRubF91bmxvY2soKTsNCj4gDQo+ICAg
ICAgICAgcnRubF9sb2NrKCk7DQo+IA0KPiAxLiBwaHlsaW5rX3Jlc3VtZSgpIGlzIGFsd2F5cyBj
YWxsZWQgYWZ0ZXIgdGhhdCBmaXJzdCBydG5sX2xvY2soKSwgc28gdGhlcmUncyBubw0KPiBwb2lu
dCBpdCBiZWluZyBzdHVwaWRseSBpbiBlYWNoIHNpZGUgb2YgdGhlIGlmKCkuDQo+IA0KPiAyLiB0
aGUgcnRubF91bmxvY2soKSBmb2xsb3dlZCBieSBydG5sX2xvY2soKSBpcyBjb21wbGV0ZWx5IHVu
bmVjZXNzYXJ5Lg0KPiANCj4gVGhhbmtzLg0KPiANCj4gLS0NCj4gUk1LJ3MgUGF0Y2ggc3lzdGVt
Og0KPiBodHRwczovL2V1cjAxLnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9
aHR0cHMlM0ElMkYlMkZ3d3cuYXINCj4gbWxpbnV4Lm9yZy51ayUyRmRldmVsb3BlciUyRnBhdGNo
ZXMlMkYmYW1wO2RhdGE9MDUlN0MwMSU3Q3hpYW9uaW5nLg0KPiB3YW5nJTQwbnhwLmNvbSU3Q2Mw
OTYxZmExNzU4OTQ2NGE3NDIzMDhkYWQyYzY5NTAyJTdDNjg2ZWExZDNiYzINCj4gYjRjNmZhOTJj
ZDk5YzVjMzAxNjM1JTdDMCU3QzAlN0M2MzgwNTQwNDc1OTMwNjY5NDklN0NVbmtub3duJQ0KPiA3
Q1RXRnBiR1pzYjNkOGV5SldJam9pTUM0d0xqQXdNREFpTENKUUlqb2lWMmx1TXpJaUxDSkJUaUk2
SWsxaGFXd2kNCj4gTENKWFZDSTZNbjAlM0QlN0MzMDAwJTdDJTdDJTdDJmFtcDtzZGF0YT13VVJr
VHhoSzJJbHFrdE9LbUp6eA0KPiBOcjhFNEtDemQxZ2pEZ0hLM2lTeTZFQSUzRCZhbXA7cmVzZXJ2
ZWQ9MA0KPiBGVFRQIGlzIGhlcmUhIDQwTWJwcyBkb3duIDEwTWJwcyB1cC4gRGVjZW50IGNvbm5l
Y3Rpdml0eSBhdCBsYXN0IQ0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21h
aWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
