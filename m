Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E5121876A26
	for <lists+linux-stm32@lfdr.de>; Fri,  8 Mar 2024 18:48:36 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 953E1C6DD72;
	Fri,  8 Mar 2024 17:48:36 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2043.outbound.protection.outlook.com [40.107.22.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 74FCCC6A613
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 Mar 2024 17:48:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HlLIcyLTHJEAyLQEwLcKaDf2/SjHvB4w0Ic7l3tGftOEvMW2U96BHS2Pyvqb7u0zVo7t1qs4QMUDIJ9Cc7/2OYWlkjavzPMDTqA4Z2HaEB70vOnT7nRygb+723j6JmhQ8G2Li8rR6rwDUcBhHc5ggMXXP09Vpi6E0SMrGrqJILoUciOkDeDsReF1z/4iL3ssbk3eYE9eWS5hgwSdw9+TVW/EuZK7L064LBOOSAZnD+h4OhQMNhNIDzrex8u6u9nw2ofCbur35wwxXfhEgS1bgwvXrP/PGY8OGx4KQi4dA7srgOyYPICuE8lP3OwW4nUlocbsERXO58Qf2LpiuI+d1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7gxpiMXnPnXPDLu337yIKN8VpQZYfwaHNqcneXJgqfE=;
 b=HKWEK3ijvjhDXBnbLTsZWeZxQLFgweZZcnRmkXcfDNLu9KqPhvQBn9kN5YsjRtCwD+dU93yJRS1741EUsSh4aozV8ZSo7bI6MGG03+qS9OKfB0mZ8JFtNUs2vHu9VtPzYNcNWD8jx/GbnbJUfCqnMyTcygWi1KyQaGBUh69KAE3g/W+w7hD/BAm+REwHJ+71Y9fb/qZs0qxbfIw8jht8nPQnviA0y4K5sLsDWNxY4IgkX0uWKwVEx+FSFoqfRSjklnZFjJcIWqq5kVrHseue3Y6STPJJeLHPbMXqkJnUhQpSVphr8GekvWEgTOLaag7TPUhvPwxzAXMeuYqsSj3Ldg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=leica-geosystems.com; dmarc=pass action=none
 header.from=leica-geosystems.com; dkim=pass header.d=leica-geosystems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com; 
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7gxpiMXnPnXPDLu337yIKN8VpQZYfwaHNqcneXJgqfE=;
 b=IXbzX/5ov6aBbcVRyExjjB8WkGeLw13noRBYPbekFXGZukGAftlnnTPjZS36JvupN+q7UQ04ldbbuueUdgu1qs/8ElVidwKkyTvZQHqPuBRFtzf4IER3IegVMnIAWp+jqvujENX6dS2y8YE2blneTRxeP7/OrJEqTNcEtHiTrtw=
Received: from VE1PR06MB6911.eurprd06.prod.outlook.com (2603:10a6:800:1a4::13)
 by PAXPR06MB7616.eurprd06.prod.outlook.com (2603:10a6:102:154::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.7; Fri, 8 Mar
 2024 17:48:31 +0000
Received: from VE1PR06MB6911.eurprd06.prod.outlook.com
 ([fe80::9256:56bc:4cd2:d41]) by VE1PR06MB6911.eurprd06.prod.outlook.com
 ([fe80::9256:56bc:4cd2:d41%2]) with mapi id 15.20.7386.006; Fri, 8 Mar 2024
 17:48:31 +0000
From: POPESCU Catalin <catalin.popescu@leica-geosystems.com>
To: Florian Fainelli <f.fainelli@gmail.com>, "davem@davemloft.net"
 <davem@davemloft.net>, "edumazet@google.com" <edumazet@google.com>,
 "kuba@kernel.org" <kuba@kernel.org>, "pabeni@redhat.com" <pabeni@redhat.com>, 
 "robh@kernel.org" <robh@kernel.org>, "krzysztof.kozlowski+dt@linaro.org"
 <krzysztof.kozlowski+dt@linaro.org>, "conor+dt@kernel.org"
 <conor+dt@kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de"
 <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>,
 "xiaoning.wang@nxp.com" <xiaoning.wang@nxp.com>, "linux-imx@nxp.com"
 <linux-imx@nxp.com>, "alexandre.torgue@foss.st.com"
 <alexandre.torgue@foss.st.com>, "joabreu@synopsys.com"
 <joabreu@synopsys.com>, "mcoquelin.stm32@gmail.com"
 <mcoquelin.stm32@gmail.com>
Thread-Topic: [PATCH net-next 2/2] net: stmmac: dwmac-imx: add support for PHY
 WOL
Thread-Index: AQHab+scVJOjKV/i6ECTY9fbEkaV4bEq+0gAgAEEOgCAAKH1AIABgFwA
Date: Fri, 8 Mar 2024 17:48:30 +0000
Message-ID: <917f5cea-69d2-4ce2-a5a3-184332415fe5@leica-geosystems.com>
References: <20240306172409.878928-1-catalin.popescu@leica-geosystems.com>
 <20240306172409.878928-2-catalin.popescu@leica-geosystems.com>
 <bbe3e611-a310-41f5-a037-4b7d5e914b94@gmail.com>
 <ddd2f984-e5e7-4708-a013-bfd668794466@leica-geosystems.com>
 <a25d4d76-a49a-4423-8916-5d7d9303b87a@gmail.com>
In-Reply-To: <a25d4d76-a49a-4423-8916-5d7d9303b87a@gmail.com>
Accept-Language: en-CH, en-US
Content-Language: aa
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=leica-geosystems.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VE1PR06MB6911:EE_|PAXPR06MB7616:EE_
x-ms-office365-filtering-correlation-id: fc32b491-b942-4305-dc71-08dc3f97f7d1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rr2mxmB8SQ2GZZ5CjwdAw+2yTtb0vje11zjPmEGfBjcilSB8eJShdfM5n6Q/m5yKHqdxx1sydYK2zhr8pkwZlOyFjaM2NGkoNptelLdO6PRApgzBSuWg6vURuxfz4MhPT+8P5K5X30FJKWienTDY5CdrKxcASls9ko32J8bS/S8gVRQ2c069CPAEIyO/qdTQdi+yMdYkzkLQ9Yagiyakwvo3vsEOHbS9NvYta8zIPSyDJKc1ftuLPT7+P6EtOizLJM2ZXV56QIPtAdeZSOKfw75rCnGxJB9NMeucPI+L730u6pmpO6XHuyTFTrz0Ocrr3DKhC1OT3YC9NSHjqL0Bg+37n+H+2RV0fXnKzccBObsbNztW5aS3Djmtck3YFsdszo21Jj1pgrtE3x0B8Bm+Rvpwt4gFHvJFz9RgWRIr6lgKXNBEtXGQDNMNdgYt0duC+TIhGtOeKu2CUdkzfxEWzSxn+dXOyFE0se6eH+Q8ylmnUC8oJJvdfgxVBAT4oREtk9rM2jrfdAwocr4hYQ5QXJwhQgcPIs6agqHQ7j29bMMMNqH1GGQqmnJjWd6FJixzeYX3/zxQl+eJfmVimuQDicbR4o8bnmGfLjEZOABjKmPLJM8KTfh61rx0P65VZM30Y2AMMMSqb6Q1utK4LvH78PrCTNWL34zGrOwjM4SsfGNqMD9p6bqKXoTNNXX7F4ZQ5wiRoP2gT+Av835yv8ZVR17Xz4Rai/L4t8ECeVRdgVM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR06MB6911.eurprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(7416005)(376005)(921011)(38070700009); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SUhzeE1PWjFBM0tqTG82dW1OelVkTTlESXlnTjdaWHd5RXArSWVGR1Vza3NM?=
 =?utf-8?B?VG01Q2FQbkhoTm90ZlBLOXhQZ0NpdHdBT3hTemd5d0g3c2Y5a3RvT0JVZXIz?=
 =?utf-8?B?QnhjNlArNmFkSmtuQmlPd0V4eUVvMEdTVm1uZmhhREJhQ2w3YVE2VzVUZEZn?=
 =?utf-8?B?aGFkSEJSZ2QzSkNFdEhTcXdsamRqeWgrTS9GQ1dYemp5a2gxcTYwSFJMTTlS?=
 =?utf-8?B?MVNKQmRiNSthK3V4dWRCRjhGa0l3UXZBMWdFWURvd0JmM2NWSHh6czZLSklv?=
 =?utf-8?B?REoweVZuLzdrVkVBNFZMTDhlNEwySytoZDVYZ1dEaTFielRDeERHZS9veTMw?=
 =?utf-8?B?cmZBZnRTd25na2ZVd0R6eUZSZ0dvZkVwTU5ZYnd1RFFYN25XOGdJU24yRi9R?=
 =?utf-8?B?OVEvMGk1eStod1VBbmNyelp1ai9yODJjK0JBbjJOc3dJZDA5bTUxWjdidGVR?=
 =?utf-8?B?ZjVGUFc0U0duU2dzMEZ5b0lWMTlNR0tsZ1ZJajdxUFJBUmpOOE9QSm1jUXFw?=
 =?utf-8?B?WVlicFlHQndOdjJpekwzVmE2RTVqSnBUU2lkN3hZMlNEaVExMzZEZ0lDd0Fp?=
 =?utf-8?B?cC9yb0RYWUtmSElRM0xvZmxUeVM0cnRDZEdxenZNYUJ2aGNQUmFxZzNMWW9l?=
 =?utf-8?B?Z3pYN2pPa09wVVh2Tk1GQ3NBdVpFaUVPSC9IZXJVTkxWZ1U0dGVvSVhTYlhp?=
 =?utf-8?B?WjMxNUtIRUs4cFJCQUMyL3NqWVExSm1kNGJmVEZpYXlYNkNnZ05NSWg3QUc1?=
 =?utf-8?B?VGxmWXFuUEZZMmxFWDVubmpxMEQyUHdHZUljTTFKUWJUdkV4ZUVzdHB1eTB0?=
 =?utf-8?B?M2Z5SWhUNEplcytkYUE5b1diK1lRNUFyUWNYYjMwdHJTQ25oWENKQUMyVElM?=
 =?utf-8?B?dTN2M1F5U1UzRTdoYUkyQnBTaEJ5alZ5WHpRT2p4N09BQUJHM1YwNHNTd3d6?=
 =?utf-8?B?dGY0bkhSNERPVlJMeWZMeCtkSjNmdEpZQnpLRVRkc0JhaEoydGlBU1A0dVF6?=
 =?utf-8?B?ZXdDVW11SUZwNDBMRHBZZm9KcFBWcFVLZ05HdllkR2s0clZ1QVhUcytnZkNJ?=
 =?utf-8?B?aU1MSUNZV0xuMWFRTlBhN1BqcysyNzRzbDVtdkNESVNMTFdMOGIySkZodWNI?=
 =?utf-8?B?bUFDZ1NQSk1kamFQM3RONzR1eERYNlQ5c2NhdTZoQVhBU2JCQ3RlN3NoaGxM?=
 =?utf-8?B?WnRGeWV0L2g1NVE5dG5na2QvOHk5YWdVVHBiSkk2cWRJbkNnRXVYSWJyNzBO?=
 =?utf-8?B?dHM3T0RwdkVNbjAwRElaYS93cG1PNkFGR2FzT0ZQN29HczRGVTVxUm1KNHBt?=
 =?utf-8?B?UDRFLzFGNytJZkdpdEdTN3Y4b2t0RWFPWC9qT1lvdlhhQnNWTFNNVFdIQ0Fq?=
 =?utf-8?B?YXJESEt1b2JBdDlUWXB1YVpMTnBiQmpRT0FpSUZWRytTZGM3L2VMYUZiY3k5?=
 =?utf-8?B?ZkJEblorYjFKQzkvMW9lZXA3ZEJ3MUlrN2x3RmpSQXB0RTUrWlEzTnlmRzBa?=
 =?utf-8?B?Z3lHQU1Mdi83OUpXZ3hPMVVHQ1o1RVdQalpMM1l5Tzhub3ZuaDlHSGNNWVk4?=
 =?utf-8?B?bmtNQ0QvUVZEWGliVmRhOU0zZHRZZHVLNWRIQ2FqeGh5ZGVhUnhBMzNVYXk0?=
 =?utf-8?B?K1QrcVo1TlhJS3B4MUVOOGRYbERTZi92T0RqSms1TytITklKRjRobDREL1NW?=
 =?utf-8?B?Y3lxNUEydFNkRkkvVFB5RyticmhHb1ZuUkhiQ3g2UGNvLzlObGNOKzNpV20r?=
 =?utf-8?B?VHoreUJTa0FOdzBqZ1NtU1ByWHJCS2JYNTNTdGlzVS9xUTNyY1dYVk1zRnJ1?=
 =?utf-8?B?ZS9iZ2p2Q0JSYyt2SDNBYkFNZ05ubEJjU2VlUGZEalNjT0xtUWloMzNJNVlU?=
 =?utf-8?B?RjBwQnVON1FMRFhtdzQ0ZzJZNzgxZ3ZIVHpucDVxNWhIaFB4RHFJcE13ZVlX?=
 =?utf-8?B?S0F3VmVjMGR2Ly9XU3FudDY0TGkwRVk3VUErRlZLR0pmdWN1aS9HYTR5eUMr?=
 =?utf-8?B?aUdkNUxVRUxQczNSeW83dm9NVFQ5ZldJTWk2dmQxUDVYSzBtdG5xdUVLaUhz?=
 =?utf-8?B?MklwN3BIbDRmUnFPZGlNU2ExcmFQbXV1YUprZU9FMnprMW1iTSthRDhmSTNE?=
 =?utf-8?B?WUg4bkpkMkJVYUJpd2pyeTRlYkVUR2NySWEybUVicnhpS05uVVJISStRN2NE?=
 =?utf-8?B?Vmc9PQ==?=
Content-ID: <DDAFB7E35A3A624282232C4D757E7485@eurprd06.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR06MB6911.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc32b491-b942-4305-dc71-08dc3f97f7d1
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Mar 2024 17:48:30.9538 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ot7nU681c05cbzOwUsFK2q6Kv3nRwrF35vofiRmkj70saywD70HQH8SMYJ6Kv3NTHk+qnuFivc7a98fx1FjcsKZrfGxzn/C9PIxMkdoplmhR+npNgI/mprD01kRsWcRB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR06MB7616
Cc: "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 GEO-CHHER-bsp-development <bsp-development.geo@leica-geosystems.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "m.felsch@pengutronix.de" <m.felsch@pengutronix.de>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH net-next 2/2] net: stmmac: dwmac-imx: add
 support for PHY WOL
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

T24gMDcuMDMuMjQgMTk6NTIsIEZsb3JpYW4gRmFpbmVsbGkgd3JvdGU6DQo+IFtTb21lIHBlb3Bs
ZSB3aG8gcmVjZWl2ZWQgdGhpcyBtZXNzYWdlIGRvbid0IG9mdGVuIGdldCBlbWFpbCBmcm9tIA0K
PiBmLmZhaW5lbGxpQGdtYWlsLmNvbS4gTGVhcm4gd2h5IHRoaXMgaXMgaW1wb3J0YW50IGF0IA0K
PiBodHRwczovL2FrYS5tcy9MZWFybkFib3V0U2VuZGVySWRlbnRpZmljYXRpb24gXQ0KPg0KPiBU
aGlzIGVtYWlsIGlzIG5vdCBmcm9tIEhleGFnb27igJlzIE9mZmljZSAzNjUgaW5zdGFuY2UuIFBs
ZWFzZSBiZSANCj4gY2FyZWZ1bCB3aGlsZSBjbGlja2luZyBsaW5rcywgb3BlbmluZyBhdHRhY2ht
ZW50cywgb3IgcmVwbHlpbmcgdG8gdGhpcyANCj4gZW1haWwuDQo+DQo+DQo+IE9uIDMvNy8yMDI0
IDE6MTMgQU0sIFBPUEVTQ1UgQ2F0YWxpbiB3cm90ZToNCj4+IE9uIDA2LjAzLjI0IDE4OjQxLCBG
bG9yaWFuIEZhaW5lbGxpIHdyb3RlOg0KPj4+IFtTb21lIHBlb3BsZSB3aG8gcmVjZWl2ZWQgdGhp
cyBtZXNzYWdlIGRvbid0IG9mdGVuIGdldCBlbWFpbCBmcm9tDQo+Pj4gZi5mYWluZWxsaUBnbWFp
bC5jb20uIExlYXJuIHdoeSB0aGlzIGlzIGltcG9ydGFudCBhdA0KPj4+IGh0dHBzOi8vYWthLm1z
L0xlYXJuQWJvdXRTZW5kZXJJZGVudGlmaWNhdGlvbiBdDQo+Pj4NCj4+PiBUaGlzIGVtYWlsIGlz
IG5vdCBmcm9tIEhleGFnb27igJlzIE9mZmljZSAzNjUgaW5zdGFuY2UuIFBsZWFzZSBiZQ0KPj4+
IGNhcmVmdWwgd2hpbGUgY2xpY2tpbmcgbGlua3MsIG9wZW5pbmcgYXR0YWNobWVudHMsIG9yIHJl
cGx5aW5nIHRvIHRoaXMNCj4+PiBlbWFpbC4NCj4+Pg0KPj4+DQo+Pj4gT24gMy82LzI0IDA5OjI0
LCBDYXRhbGluIFBvcGVzY3Ugd3JvdGU6DQo+Pj4+IEFkZCBzdXBwb3J0IGZvciBQSFkgV09MIGNh
cGFiaWxpdHkgaW50byBkd21hYy1pbXggTUFDIGRyaXZlci4NCj4+Pj4gVGhpcyBpcyByZXF1aXJl
ZCB0byBlbmFibGUgV09MIGZlYXR1cmUgb24gYSBwbGF0Zm9ybSB3aGVyZSBNQUMNCj4+Pj4gV09M
IGNhcGFiaWxpdHkgaXMgbm90IHN1ZmZpY2llbnQgYW5kIFdPTCBjYXBhYmlsaXR5IGJ1aWx0IGlu
dG8NCj4+Pj4gdGhlIFBIWSBpcyBhY3R1YWxseSBuZWVkZWQuDQo+Pj4+DQo+Pj4+IFNpZ25lZC1v
ZmYtYnk6IENhdGFsaW4gUG9wZXNjdSA8Y2F0YWxpbi5wb3Blc2N1QGxlaWNhLWdlb3N5c3RlbXMu
Y29tPg0KPj4+DQo+Pj4gTm9wZSwgdGhpcyBpcyBub3QgYWJvdXQgaG93IHRvIGRvIHRoaXMuIFlv
dSB1c2UgYSBEZXZpY2UgVHJlZSBwcm9wZXJ0eQ0KPj4+IGFzIGEgcG9saWN5IHJhdGhlciB0aGFu
IHByb3Blcmx5IGRlc2NyaWJlIHlvdXIgc3lzdGVtcyBjYXBhYmlsaXRpZXMuDQo+PiBJJ20gbm90
IHN1cmUgd2hhdCBwb2xpY3kgbWVhbnMgaW4gdGhhdCBjb250ZXh0Lg0KPj4gQlRXLCBkd21hYy1t
ZWRpYXRlayBkb2VzIHRoZSBzYW1lIHdpdGggYmluZGluZyAibWVkaWF0ZWssbWFjLXdvbCIgd2hp
Y2gNCj4+IGlzIGEgY29tbWl0IGZyb20gMDMvMjAyMi4NCj4NCj4gUG9saWN5IGhlcmUgbWVhbnMg
eW91IHdhbnQgYSBjZXJ0YWluIGJlaGF2aW9yIGZyb20gdGhlIE9TIHRoYXQgaXMNCj4gY29uc3Vt
aW5nIHRoZSBEZXZpY2UgVHJlZSwgYW5kIHRoYXQgYmVoYXZpb3IgaXMgZW5jb2RlZCB2aWEgYSBE
ZXZpY2UNCj4gVHJlZSBwcm9wZXJ0eS4gVGhpcyBpcyBkaWZmZXJlbnQgZnJvbSBkZXNjcmliaW5n
IGhvdyB0aGUgaGFyZHdhcmUgd29ya3MNCj4gd2hpY2ggZG9lcyBub3QgbWFrZSBhbnkgcHJvdmlz
aW9ucyBmb3IgZ2V0dGluZyBhIGJlaGF2aW9yIG91dCBvZiB0aGUgT1MuDQo+DQo+PiBJIHVuZGVy
c3RhbmQgdGhpcyB3YXkgb2YgZG9pbmcgYmVjYW1lICJ1bmFjY2VwdGFibGUiIHNpbmNlIHRoZW4g
Pz8NCj4NCj4gSXQgd2FzIG5vdCBhY2NlcHRhYmxlIHRoZW4sIGJ1dCB0aGVyZSBpcyBvbmx5IGEg
bGltaXRlZCByZXZpZXdlciB0aW1lLA0KPiBhbmQgaXQgaXMgZWFzeSB1bmZvcnR1bmF0ZWx5IHRv
IHNuZWFrIHRocm91Z2ggcmV2aWV3ZXJzLg0KPg0KPj4+DQo+Pj4gV2hhdCBzb3J0IG9mIFdha2Ut
b24tTEFOIGRvIHlvdSB3YW50IHRvIGJlIGRvbmUgYnkgdGhlIFBIWSBleGFjdGx5PyANCj4+PiBE
b2VzDQo+Pj4gdGhlIFBIWSBoYXZlIHBhY2tldCBtYXRjaGluZyBjYXBhYmlsaXRpZXMsIG9yIGRv
IHlvdSB3YW50IHRvIHdha2UtdXANCj4+PiBmcm9tIGEgUEhZIGV2ZW50IGxpa2UgbGluayB1cC9k
b3duL2FueSBpbnRlcnJ1cHQ/DQo+Pg0KPj4gUEhZIGlzIFRJIGRwODM4MjYgYW5kIGhhcyBzZWN1
cmUgbWFnaWMgcGFja2V0IGNhcGFiaWxpdHkuIEZvciB0aGUgd2FrZXVwDQo+PiB3ZSByZWx5IG9u
IGEgZXh0ZXJuYWwgTUNVIHdoaWNoIGlzIHNpZ25hbGVkIHRocm91Z2ggYSBQSFkncyBHUElPIHdo
aWNoDQo+PiB0b2dnbGVzIG9ubHkgb24gbWFnaWMgcGFja2V0IHJlY2VwdGlvbi4NCj4+IFdlIHdh
bnQgdG8gd2FrZXVwIF9vbmx5XyBvbiBtYWdpYyBwYWNrZXQgcmVjZXB0aW9uLg0KPg0KPiBUaGVu
IHlvdSBuZWVkIHRvIHJlcHJlc2VudCB0aGF0IHdha2UtdXAgR1BJTyBsaW5lIGluIHRoZSBEZXZp
Y2UgVHJlZSwNCj4gYXNzb2NpYXRlIGl0IHdpdGggdGhlIFBIWSdzIERldmljZSBUcmVlIG5vZGUg
Zm9yIHN0YXJ0ZXJzIGFuZCBhZGQgaW4gYQ0KPiAnd2FrZXVwLXNvdXJjZScgcHJvcGVydHkgaW4g
dGhlIERldmljZSBUcmVlLg0KVGhlIEdQSU8gSSB3YXMgcmVmZXJyaW5nIHRvIGlzIGEgUEhZIEdQ
SU8gbm90IGEgU09DIEdQSU8sIHNvIHRoZXJlJ3Mgbm8gDQp3YXkgdG8gZGVzY3JpYmUgaXQgaW50
byB0aGUgRFQuDQpUaGUgUEhZIGlzIGNvbm5lY3RlZCBvbiB0aGUgU09DIE1ESU8gYnVzLCBzbyB0
aGUgU09DIHByb2dyYW1zIHRoZSBQSFksIA0KYnV0IHRoZSBQSFkgd2FrZXMgdXAgdGhlIGV4dGVy
bmFsIE1DVSB3aGljaCBpbiB0dXJuIHdha2VzIHVwIHRoZSBTT0MuDQoNCj4NCj4gTm93IHRoZSBQ
SFkgZHJpdmVyIGNhbiBrbm93IGFib3V0IHRoZSBleGlzdGVuY2Ugb2YgYSBHUElPIGFuZCBpdCBj
YW4NCj4ga25vdyB0aGUgUEhZIGlzIGEgc3lzdGVtIHdha2UtdXAgc291cmNlLCBzbyB0aGUgZHJp
dmVyIGNhbiBjYWxsDQo+IGRldmljZV9zZXRfd2FrZXVwX2NhcGFibGUoKS4NCj4NCj4gSW4gdXNl
ci1zcGFjZSB5b3UgaGF2ZSB0byBjb25maWd1cmUgdGhlIG5ldHdvcmsgaW50ZXJmYWNlIHdpdGgN
Cj4gV0FLRV9NQUdJQ1NFQ1VSRSB3aGljaCBuZWVkcyB0byBwcm9wYWdhdGUgdG8gdGhlIFBIWSBk
cml2ZXIgZm9yIGFkZXF1YXRlDQo+IGNvbmZpZ3VyYXRpb24uIFN0aWxsIGluIHVzZXItc3BhY2Ug
eW91IG5lZWQgdG8gbWFrZSB0aGUgUEhZIGRldmljZQ0KPiB3YWtlLXVwICplbmFibGVkKiBieSBk
b2luZzoNCj4NCj4gZWNobyAiZW5hYmxlIiA+IC9zeXMvY2xhc3MvbmV0L2V0aFgvYXR0YWNoZWRf
cGh5ZGV2L3Bvd2VyL3dha2V1cA0KPg0KPiBJZiBib3RoIFdBS0VfTUFHSUNTRUNVUkUgaXMgZW5h
YmxlZCBhbmQgdGhlIFBIWSBkZXZpY2UgaW4gc3lzZnMgcmVwb3J0cw0KPiB0aGF0IGl0IGlzIHdh
a2UtdXAgZW5hYmxlZCB3b3VsZCB5b3Ugd2FrZS11cCBmcm9tIHRoZSBQSFkncyBHUElPLiBZb3Vy
DQo+IFBIWSBkcml2ZXIgb3VnaHQgdG8gYmUgbW9kaWZpZWQgdG8gY2hlY2sgZm9yIGJvdGgNCj4N
Cj4gZGV2aWNlX3dha2V1cF9lbmFibGVkKCkgYW5kIHdvbG9wdHMgYmVpbmcgbm9uLXplcm8gdG8g
Y2FsbA0KPiBlbmFibGVfaXJxX3dha2UoKSBvbiB0aGUgR1BJTyBpbnRlcnJ1cHQgbGluZS4NCj4N
Cj4gVGhhdCdzIGhvdyBJIHdvdWxkIGdvIGFib3V0IGRvaW5nIHRoaXMsIHllcyBpdCdzIGEgdGFk
IG1vcmUgY29tcGxpY2F0ZWQNCj4gdGhhbiBhZGRpbmcgYW4gYWQtaG9jIERldmljZSBUcmVlIHBy
b3BlcnR5LCBidXQgaXQncyBtb3JlIGZsZXhpYmxlIGFuZA0KPiBpdCdzIHRyYW5zcG9zYWJsZSB0
byBvdGhlciBjb25maWd1cmF0aW9ucywgdG9vLiBXaGV0aGVyIHRoYXQgc29ydCBvZg0KPiBlbmNv
ZGluZyBuZWVkcyB0byBiZSBpbiB0aGUgaW5kaXZpZHVhbCBQSFkgZHJpdmVycyBvciBzb21ld2hl
cmUgaW4gdGhlDQo+IFBIWSBsaWJyYXJ5IGNhbiBiZSBkZWNpZGVkIGlmIHdlIGhhdmUgbW9yZSB0
aGFuIG9uZSBzaW1pbGFyDQo+IGNvbmZpZ3VyYXRpb24gdG8gc3VwcG9ydC4NCj4NClllcywgaXQn
cyBtb3JlIGNvbXBsaWNhdGVkIGFuZCBpdCBkb2Vzbid0IGFwcGx5IHRvIG91ciBwbGF0Zm9ybS4N
CkJ1dCwgdGhpcyBkb2Vzbid0IHJlYWxseSBtYXR0ZXIgaW4gdGhlIGVuZCwgdGhlIHByb2JsZW0g
SSdtIHRyeWluZyB0byANCmFkZHJlc3MgaGVyZSBpcyB0byBhbGxvdyBzdG1hYyBmb3IgSU1YIHRv
IHN1cHBvcnQgUEhZIFdPTC4NClNpbmNlIHRoZSBiaW5kaW5nIGlzIG5vdCBhY2NlcHRhYmxlLCBJ
IGd1ZXNzIHRoZSBvbmx5IG9wdGlvbiBoZXJlIGlzIHRvIA0KcmVtb3ZlIGZsYWcgU1RNTUFDX0ZM
QUdfVVNFX1BIWV9XT0wgZnJvbSBzdG1hYyBkcml2ZXIgYW5kIHJlcGxhY2UgaXQgDQp3aXRoIGEg
Y2FsbCB0byBwaHlsaW5rX2V0aHRvb2xfZ2V0X3dvbCB0byBpZGVudGlmeSB3aGV0aGVyIHRoZSBQ
SFkgaXMgDQpXT0wgY2FwYWJsZSBvciBub3QuDQpUaGVuLCBob3cgc2hvdWxkIHdlIGFsbG93IHRo
ZSBwbGF0Zm9ybSB0byBjaG9vc2UgYi93IE1BQyBXT0wgYW5kIFBIWSBXT0wgDQppZiBib3RoIGFy
ZSBzdXBwb3J0ZWQgPw0KQUZBSUsgZXRodG9vbCBvbmx5IGtub3dzIGFib3V0IE1BQyBXT0wgY2Fw
YWJpbGl0eSBzaW5jZSBpdCBpbnRlcnJvZ2F0ZXMgDQp0aGUgTUFDIGludGVyZmFjZS4gZXRodG9v
bCBkb2Vzbid0IGtub3cgYW55dGhpbmcgYWJvdXQgdGhlIFBIWSwgb3IgZG9lcyANCml0ID8/DQoN
Cj4+DQo+Pj4NCj4+PiBJZiB0aGUgZm9ybWVyLCB0aGVuIHlvdSB3b3VsZCBuZWVkIHRvIGludGVy
cm9nYXRlIHRoZSBQSFkgZHJpdmVyIHZpYQ0KPj4+IHBoeV9ldGh0b29sX2dldF93b2woKSB0byBm
aWd1cmUgb3V0IHdoYXQgV2FrZS1vbi1MQU4gbW9kZXMgaXQgaXMgDQo+Pj4gY2FwYWJsZQ0KPj4+
IG9mIHN1cHBvcnRpbmcgYW5kIHRoZW4gbWFrZSBhIGRlY2lzaW9uIHdoZXRoZXIgdG8gcHJpb3Jp
dGl6ZSANCj4+PiBXYWtlLW9uLUxBTg0KPj4+IGZyb20gdGhlIFBIWSBvciB0aGUgTUFDLCBvciBt
YXliZSBvbmx5IHRoZSBQSFkgY2FuIGFjdHVhbGx5IHdha2UtdXAgdGhlDQo+Pj4gc3lzdGVtIGlu
IHlvdXIgY2FzZS4NCj4+Pg0KPj4gc3RtbWFjIGFscmVhZHkgY2FsbHMgcGh5X2V0aHRvb2xfZ2V0
X3dvbC9waHlfZXRodG9vbF9zZXRfd29sIHRocm91Z2gNCj4+IHBoeWxpbmtfZXRodG9vbF9nZXRf
d29sL3BoeWxpbmtfZXRodG9vbF9zZXRfd29sLiBCdXQgbmVlZHMgZmxhZw0KPj4gU1RNTUFDX0ZM
QUdfVVNFX1BIWV9XT0wgdG8gYmUgc2V0LiBPdGhlcndpc2UsIGl0IHdpbGwgb25seSB3b3JrIHdp
dGggTUFDDQo+PiBXT0wgd2hpY2ggd2UgZG9uJ3Qgd2FudC4gV2l0aCB0aGUgbmV3IGJpbmRpbmcg
d2UganVzdCBhbGxvdyB0aGUgTUFDDQo+PiBkcml2ZXIgdG8gY2FsbCB0aGUgUEhZIGZvciB0aGUg
V09MIGNhcGFiaWxpdHkuIFRoaXMgZG9lc24ndCBmb3JjZSBXT0wgdG8NCj4+IGVuYWJsZWQgb3Ig
ZGlzYWJsZWQsIGFzIGl0IGlzIHN0aWxsIHVwIHRvIGV0aHRvb2wgdG8gY29uZmlndXJlIGl0Lg0K
Pj4+IElmIHRoZSBsYXR0ZXIsIHRoZW4geW91IG5lZWQgdG8gYWRkIHN1cHBvcnQgZm9yIFdBS0Vf
UEhZIHRvIHRoZSBzdG1tYWMNCj4+PiBkcml2ZXIuDQo+PiBObywgd2UgZG9uJ3Qgd2FudCBXQUtF
X1BIWSwgd2Ugd2FudCBXQUtFX01BR0lDL1dBS0VfTUFHSUNTRUNVUkUgd2hpY2gNCj4+IHN0bW1h
YyBkcml2ZXIgYWxyZWFkeSBzdXBwb3J0cy4NCj4NCj4gRG9lcyBub3QgbWF0dGVyLCBpdCBzaG91
bGQgYmUgdXAgdG8gdXNlci1zcGFjZSB0byBpbnRlcnNlY3QgYmV0d2VlbiB3aGF0DQo+IHRoZSBQ
SFkgaXMgY2FwYWJsZSBvZiB3YWtpbmcgeW91IGZyb20sIGFuZCB3aGF0IHRoZSBpbnRlbnQgaXMu
DQo+IC0tIA0KPiBGbG9yaWFuDQoNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
