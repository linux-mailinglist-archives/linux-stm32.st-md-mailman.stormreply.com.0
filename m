Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 67CCD3CCF74
	for <lists+linux-stm32@lfdr.de>; Mon, 19 Jul 2021 10:52:25 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B2E0CC57B6B;
	Mon, 19 Jul 2021 08:52:24 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2078.outbound.protection.outlook.com [40.107.21.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9AC9DCFAC5A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Jul 2021 08:52:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eI+aW12cTer1DDq5PkpX1VIEzxYCv6u8FYQyGSHJMzJZf6mu/yAT0tfXfwFMpG/js7emStjcB6+whWmRpJZNFLkyMmtWXg/tYTA4yCibytUiGxyN+6asdzJs7EAeknUhhShEv5oP4xmN6UJav9bexdvl+IIP1szCutA2phHiqu3uDQsJucI/0tN9ZDyAh4AJ6c60U5nnwhHCHH2DrjQUJ60CCHouVh7VHC13RGCOZ7fp+4coabbXhjpaUQzA+Vrng4cyUwaffLhMF5egBt0w2RzNEEylWNxEZCXuToE1bo3EfUacMjMOBn8rZApeEeeTecGgVyPOGzMYZjY9Agd2Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8WVlmFKWypBoYbOkKxjMdljzwg+s8RTM1n50+qLQbUk=;
 b=Pnyre6VGAMFtYxUtJmpoST/0+w21jqlZhKnIsOtoWCIT6CUgoIWcCqCndZgzgG9xd1/sGtmxWlMc/jOr3rIye23JyrW9IdJ9TUxH0XHmm3tra2uF52nz3PdTlIpIp8dybHKnVKmhbXtNW6FZ/YqEHqJMiPFFE9ZfRKr7kb56LgnZGXN+gUpBgoOFXKNf6yksntZvkBUrMU0ki0RHlvrqYPg1tfEhrYKrO3Ije6jqvIrxXhF8u2HysEidapbsFCpqBmkco+3Qt6BelRcL84yfaWpQkV7B9MNVqf8stu7PvCOz8UyYlYJpWFJgdGziKHZ8QezBs6z7Vx5bu88CFj7bXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8WVlmFKWypBoYbOkKxjMdljzwg+s8RTM1n50+qLQbUk=;
 b=Tac6ePkrqoNF5SU4VtpPGlXYHIzD2u74s2gk/h1SkyhCd2EeBWGwvJlFB5vynZipZ8awwndQFVdA0WETC5mZoMQet294xGk0/23TNU+Rvd9+PtG2aXAeUBtV1DAzFGAxQfaP9r4imRGVXofqAyzyut1fPPTM/Gc8BeXdf13nnwQ=
Received: from VI1PR04MB6800.eurprd04.prod.outlook.com (2603:10a6:803:133::16)
 by VE1PR04MB6365.eurprd04.prod.outlook.com (2603:10a6:803:120::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.28; Mon, 19 Jul
 2021 08:52:19 +0000
Received: from VI1PR04MB6800.eurprd04.prod.outlook.com
 ([fe80::3046:abd6:b17f:6037]) by VI1PR04MB6800.eurprd04.prod.outlook.com
 ([fe80::3046:abd6:b17f:6037%8]) with mapi id 15.20.4331.032; Mon, 19 Jul 2021
 08:52:19 +0000
From: Joakim Zhang <qiangqing.zhang@nxp.com>
To: Hao Chen <chenhaoa@uniontech.com>, "peppe.cavallaro@st.com"
 <peppe.cavallaro@st.com>
Thread-Topic: [PATCH v2] net: stmmac: fix 'ethtool -P' return -EBUSY
Thread-Index: AQHXfHH8EYtXUnpUjkW73okHjyM5BqtJ/Img
Date: Mon, 19 Jul 2021 08:52:19 +0000
Message-ID: <VI1PR04MB68007DC1F11B5A0991BE02E7E6E19@VI1PR04MB6800.eurprd04.prod.outlook.com>
References: <20210719074410.6787-1-chenhaoa@uniontech.com>
In-Reply-To: <20210719074410.6787-1-chenhaoa@uniontech.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: uniontech.com; dkim=none (message not signed)
 header.d=none;uniontech.com; dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dca55ef5-6f12-4f2c-9f1c-08d94a928488
x-ms-traffictypediagnostic: VE1PR04MB6365:
x-microsoft-antispam-prvs: <VE1PR04MB6365B723488C3447DA0CB936E6E19@VE1PR04MB6365.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Pr4I5mc5Oc2zWTEJs2YXBXnD2iE2qYktEaq98awAEVGZPN5Qrq7wxZ2kDj+xr8T2m7qST3/V0VvYgOjg42piACJcXXOdQx4jiqqBYuRR2ulueiHyUd68m/JOQ64yYDWAf2w3i6AIZ3W+5Us7dTHV89OdEckb3P1vEEW6RBjIxoRrs5BGlCe81Osz01A3nBIpmK7K4vy1EyBa3cM1L+cfO5WIcciMvtmKo7WgZJ3mDLOTt+eFsU/OujCQxjAY4uihXjTwxmOCgqc0N39cYNmgWp/B/nIYxHHnEVaELwPrcZGSn06cUkdiKk/ZqnQTp+XwrCp1cn98p9mIPEBm5jM2G0tEG4BV7zK01D4KT7iMCrIdxd1Ci0wiUNFLnw9Mebre9BpgqX0XEZtVCWByAowOcrcLjOKUrBM4Ie0oLDlzRFoP6FNGMMuWaDXFnONRe7G9fzfPu09VHrfkAzYJz/yU4rFwKED8+2iSu8B8F+/OIRoCCzrmPPOnyykQh0zYh1/iN+TJLlphyYlUlZUDniyXCEK5QmUnr1EKPN64PBQwBZ0nsY3M1Zm0n8R2VBr4fYBomJMpqQox7GLe66ArvUbs31JlkQrQbMwHOZytBmO5N7JyAiucutzAlsi4DuEKkuUh2nZkc045FZKTDxORHsCoFtorJcx+VAYVzTLshYR8Tj3MxW6OKX6W0GWzJ/ekRKOHp1YmNUvjRBl0L9Q7PmEOLA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB6800.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(376002)(366004)(136003)(346002)(7696005)(66946007)(8936002)(66476007)(64756008)(66446008)(2906002)(8676002)(71200400001)(83380400001)(76116006)(9686003)(55016002)(110136005)(66556008)(54906003)(66574015)(53546011)(6506007)(122000001)(5660300002)(478600001)(4326008)(38100700002)(33656002)(7416002)(26005)(316002)(52536014)(186003)(86362001)(38070700004);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?QlFUWVRGMUdCeURrVnlOSVpjMVlJUy9KaEc2cUN2QmVhWUt0N2hFM1RNRWhy?=
 =?gb2312?B?SXBjaGczbmNFSHQvODNoT2RXZHNFVXJId2k3TXdsQS9GYnZrMXlBUmEyMDlM?=
 =?gb2312?B?c2ZNcGdDdGZWVmlGREM3RUlham5XVlRKQVB0bHRIeVRZdll3c0pDM2gySmVU?=
 =?gb2312?B?OE9SUUNZY1hOL20yQnI3TzgvbUtPVzZnbzdCZDkxSHNQYmRtN2tPM3FDMGl6?=
 =?gb2312?B?a21QOWIzakw0V244eHkrMlZObzNPZXh6MUdVTXM3TDJRVUI0VUVvZnQ1OEV1?=
 =?gb2312?B?YmVBb1B1eXcyUkFYK2JsUFZoUHFCdGRmWit0QmVUaE92cnlzZjFxMmJJK3g0?=
 =?gb2312?B?MFRETlJzUkxRYi9FV0FmU1dYV0M4cTJHZ1ZVcEpSV3JxVHdqN2dWa21VUW9v?=
 =?gb2312?B?QTl4NWgwVFViMlFXY3V3VkZQaHJ1UU1PYWZwNHpzMnBjR3pIdDl0eHpMSGc2?=
 =?gb2312?B?QUd3Q3Q2dHhMNzlNTkJhWjR6eXRPSklBZXh1WHZvajl1VkhBcERPMnhjOTFh?=
 =?gb2312?B?Q3B3NDc3YzVpU0dGc24wVWRJOVZjWmkwKzhGd1hkYVF1VU9iOVNsdUMreERH?=
 =?gb2312?B?U0t0QlV4UWVyaENaaDhlYjVXbmphcXR6WHFyVzZOR3JnY05OWEJ1Q0xmMzQv?=
 =?gb2312?B?Z1pwdFMxYlZzTDVJUnhvQUxSd2pkbXQ2TDhiWUttYmVhcVdQdUZkNUV2Mmho?=
 =?gb2312?B?c0tUbHJ3TlZqM0ZIS1FnR3ZHTDBoaFBvSm1LdXc0bFl5dldKaU1rTzQraEhr?=
 =?gb2312?B?U1V3N2RNbDVSRjNabzBjMXpFVFFPRkc0a2t2R0JGL0FKMDY3RUlaUEF2V0VO?=
 =?gb2312?B?a2VYN1NwQVdTdUxxZWZoOVpyN3M4VStLdllFWlhnSlZDU1hTNnVCVDdkelBj?=
 =?gb2312?B?NldiTkwzc1l6WHFBZVhaK2ZFR2hXTzVzZFp4NmxZMk9nSExUTERyMmVOVk5Y?=
 =?gb2312?B?c0wrUTVqQklWMjg3V0hPRkp0Wi9xWTdwQWR5ZDNWRTBJczlpZjFmYk5ZeXFT?=
 =?gb2312?B?UDIvZGJNaktwUFUvVVp4TkRSbzY2WE9ZNWd5MTdKZlpOb3BYb0FJUWxaT1lS?=
 =?gb2312?B?U2FyUGVGWWZKc3VpK2dUeU5NckFTUE1kdVQ0VHRVWGY3Qk9ocUw2YzFhMGgv?=
 =?gb2312?B?OXlNSDRmN1hvYno4cEo5VnkzKzgwd0VlWUJlUWVuQWdiWG1rS0RWc3RSSDlY?=
 =?gb2312?B?V1dvQitOWFp3MnpoOWNVWDI3cDA4UDg5MjVoZWVBVDRNV1kvd01qYlhKOFpL?=
 =?gb2312?B?Lytob1crL1l0QnVwY2lCVmxNTVZ4Q0NXZitsajkxUUJpNlF0cU5ER0EzZlIr?=
 =?gb2312?B?OTAzMFc1TEhvcHk0SlFHVEJiVDlBUGswQitRa0xmTVVCa0k0QW4wMXlweitS?=
 =?gb2312?B?VXJwMTJHY1hMVGQ2SGY5UlpZd3pzclhMek0xellkTVY0em92WWhxSlVsSS9a?=
 =?gb2312?B?L3N3a09DU1M4RFpUMVdnM1MzSjMxSFJTWlFFWFhqUHRjbzZwMElBN1JkMjZC?=
 =?gb2312?B?U1pvUVM5R1NLT0ZnZ1ZIYXE0bkdIOWp0SnJCY3F6QkFleHBUMjBZbjNrZVUz?=
 =?gb2312?B?S1BlWEdodVFmSjQyZ3l1VkJJQThWcXFSZm52eE9BS1BVYXAvUUFuaUZVZzlH?=
 =?gb2312?B?bTNiYTl0cUd5RUNIaUxBUUJjbGdKSXVOTThBNGY5dU9xVE4yL3pqcWF2ejh6?=
 =?gb2312?B?MnQvaTE2a3BVQ1hMMXFHZHdiblJxaDViQ3RmV0tjb1hDUFRsWll0QjRxRFd5?=
 =?gb2312?Q?3CROxUzntiWaRZEEUqe8Kv8mEyvO/qGOEbHVfa7?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB6800.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dca55ef5-6f12-4f2c-9f1c-08d94a928488
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2021 08:52:19.8086 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iX4OA9bNN+nQx4oj+H+jLXndJi7sPj4cy5i94e8B38X6hxBdByuXWoLgW98RG94PDhJq61EDqnfo8w/sZX+CEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6365
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
 "alexandre.torgue@foss.st.com" <alexandre.torgue@foss.st.com>,
 "joabreu@synopsys.com" <joabreu@synopsys.com>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "kuba@kernel.org" <kuba@kernel.org>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-stm32] [PATCH v2] net: stmmac: fix 'ethtool -P' return
	-EBUSY
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

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEhhbyBDaGVuIDxjaGVuaGFv
YUB1bmlvbnRlY2guY29tPg0KPiBTZW50OiAyMDIxxOo31MIxOcjVIDE1OjQ0DQo+IFRvOiBwZXBw
ZS5jYXZhbGxhcm9Ac3QuY29tDQo+IENjOiBhbGV4YW5kcmUudG9yZ3VlQGZvc3Muc3QuY29tOyBq
b2FicmV1QHN5bm9wc3lzLmNvbTsNCj4gZGF2ZW1AZGF2ZW1sb2Z0Lm5ldDsga3ViYUBrZXJuZWwu
b3JnOyBtY29xdWVsaW4uc3RtMzJAZ21haWwuY29tOw0KPiBsaW51eEBhcm1saW51eC5vcmcudWs7
IG5ldGRldkB2Z2VyLmtlcm5lbC5vcmc7DQo+IGxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb207IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7DQo+IEhhbyBDaGVuIDxj
aGVuaGFvYUB1bmlvbnRlY2guY29tPg0KPiBTdWJqZWN0OiBbUEFUQ0ggdjJdIG5ldDogc3RtbWFj
OiBmaXggJ2V0aHRvb2wgLVAnIHJldHVybiAtRUJVU1kNCj4gDQo+IFRoZSBwZXJtYW5lbnQgbWFj
IGFkZHJlc3Mgc2hvdWxkIGJlIGF2YWlsYWJsZSBmb3IgcXVlcnkgd2hlbiB0aGUgZGV2aWNlIGlz
DQo+IG5vdCB1cC4NCj4gTmV0d29ya01hbmFnZXIsIHRoZSBzeXN0ZW0gbmV0d29yayBkYWVtb24s
IHVzZXMgJ2V0aHRvb2wgLVAnIHRvIG9idGFpbiB0aGUNCj4gcGVybWFuZW50IGFkZHJlc3MgYWZ0
ZXIgdGhlIGtlcm5lbCBzdGFydC4gV2hlbiB0aGUgbmV0d29yayBkZXZpY2UgaXMgbm90IHVwLA0K
PiBpdCB3aWxsIHJldHVybiB0aGUgZGV2aWNlIGJ1c3kgZXJyb3Igd2l0aCAnZXRodG9vbCAtUCcu
IEF0IHRoYXQgdGltZSwgaXQgaXMgdW5hYmxlIHRvDQo+IGFjY2VzcyB0aGUgSW50ZXJuZXQgdGhy
b3VnaCB0aGUgcGVybWFuZW50IGFkZHJlc3MgYnkgTmV0d29ya01hbmFnZXIuDQo+IEkgdGhpbmsg
dGhhdCB0aGUgJy5iZWdpbicgaXMgbm90IHVzZWQgdG8gY2hlY2sgaWYgdGhlIGRldmljZSBpcyB1
cC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEhhbyBDaGVuIDxjaGVuaGFvYUB1bmlvbnRlY2guY29t
Pg0KPiAtLS0NCj4gIGRyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0bW1hY19l
dGh0b29sLmMgfCA2ICsrKystLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9z
dG1pY3JvL3N0bW1hYy9zdG1tYWNfZXRodG9vbC5jDQo+IGIvZHJpdmVycy9uZXQvZXRoZXJuZXQv
c3RtaWNyby9zdG1tYWMvc3RtbWFjX2V0aHRvb2wuYw0KPiBpbmRleCBkMGNlNjA4YjgxYzMuLjdj
Y2IwZDczOGExYyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9z
dG1tYWMvc3RtbWFjX2V0aHRvb2wuYw0KPiArKysgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1p
Y3JvL3N0bW1hYy9zdG1tYWNfZXRodG9vbC5jDQo+IEBAIC00MTIsOCArNDEyLDEwIEBAIHN0YXRp
YyB2b2lkIHN0bW1hY19ldGh0b29sX3NldG1zZ2xldmVsKHN0cnVjdA0KPiBuZXRfZGV2aWNlICpk
ZXYsIHUzMiBsZXZlbCkNCj4gDQo+ICBzdGF0aWMgaW50IHN0bW1hY19jaGVja19pZl9ydW5uaW5n
KHN0cnVjdCBuZXRfZGV2aWNlICpkZXYpICB7DQo+IC0JaWYgKCFuZXRpZl9ydW5uaW5nKGRldikp
DQo+IC0JCXJldHVybiAtRUJVU1k7DQo+ICsJc3RydWN0IHN0bW1hY19wcml2ICpwcml2ID0gbmV0
ZGV2X3ByaXYoZGV2KTsNCj4gKw0KPiArCXBtX3J1bnRpbWVfZ2V0X3N5bmMocHJpdi0+ZGV2aWNl
KTsNCj4gKw0KPiAgCXJldHVybiAwOw0KPiAgfQ0KDQpBZnRlciB0aGlzIGNvZGUgY2hhbmdlLCBj
bG9ja3MgYWx3YXlzIGVuYWJsZWQgZXZlbiB0aGUgTklDIGlzIG5vdCB1cCwgaXQncyBub3QgZ29v
ZC4NClNob3VsZCBpbXBsZW1lbnQgLmNvbXBsZXRlKCkgdG8gZGlzYWJsZSBjbG9ja3MgYWZ0ZXIg
dGhlIGluZm8geW91IGdvdD8NCg0KQmVzdCBSZWdhcmRzLA0KSm9ha2ltIFpoYW5nDQo+IA0KPiAt
LQ0KPiAyLjIwLjENCj4gDQo+IA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
