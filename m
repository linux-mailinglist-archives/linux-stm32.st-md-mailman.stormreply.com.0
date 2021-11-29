Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 264484611BB
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Nov 2021 11:06:03 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D29E4C57B6F;
	Mon, 29 Nov 2021 10:06:02 +0000 (UTC)
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2098.outbound.protection.outlook.com [40.107.114.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AFB3BC56630
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Nov 2021 10:06:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KFj8Rpp6+Q+bGzrou2mQ/9t0BnFNktBWoJ6S/2UAIxWF0T0ctN4mFZ5C3HXeftFwiO5wELB5NtlEIyyki9RV26f2zDvAAfbTeQ9Xswmcju4Vd+wbcluS6H0PGanZEPeRxqc1ZSbEDOiFj8/0zrezubAIz513zpP2WQ+6mParFUsMd+UdoMq9x5z/tkQ4r0MWQkynmhzDmzqoYM+hB144OvAohKrkTFjgU6T5M0S/zuVhn66qxBWIMl3oe+3IGbposoSAQZ9rruK8c996WRxIzwaxthrFLx4KFCVI/X42ytcMvy4jBh998U05FhAn6XNE3C1ggl7KOcVck0f5QGBgcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pywyNrtFUpbAxsDcinbTXLFmYstQAbqTY8FuArGPn00=;
 b=FY2OmD7BvH98+1Kb227m2vlQlm4gvwopjhITilxT+hY0xQRPR06S9nHbK1qnOhpJC3AQiniQk+jwFqD8Sh/2b6WanbIVQLVm0QMTHYRDl/AudvAbfXyhTpPEh9hJlCGTlNWeYTxFj5wHaW+pljVKjpm70usOusIynwHcEI1g3+ql8OQ4RQYxBLzU33knNZqaq/tqingTy8Uahy1L44pmhysHOFkKVtLNM+NAXk/cXWTKVFG+MmKSPCmfOZsHQJLvy6NVpBGE6Q7BdhONYUf9QT/MX5fNVdWVbEq0+PUlqxr1xKIERrg5jUdCPiO9vM0czEsSNgEs6E7f1pY8ch7KCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pywyNrtFUpbAxsDcinbTXLFmYstQAbqTY8FuArGPn00=;
 b=PFMMLaXTJn7quIIyTlg600eE7jPYsRV1Rvg4JYOrErR5SRFZaJ/sF/igfJnzqPcbaLJqQe3B2kyxYGxgEAem4l3A6j1CRgAEHKo88OoVxKtLAteLytmCEfTmN0eeP20wwEo/vlkuJ1UC0JUdqx1GjByN8ko8r0rDLfemOxn4//0=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSAPR01MB4979.jpnprd01.prod.outlook.com (2603:1096:604:61::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.20; Mon, 29 Nov
 2021 10:05:55 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c0bd:405a:cdd3:f153]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c0bd:405a:cdd3:f153%9]) with mapi id 15.20.4734.024; Mon, 29 Nov 2021
 10:05:55 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Thread-Topic: [PATCH v3 3/4] clocksource/drivers/renesas-ostm: Add RZ/G2L OSTM
 support
Thread-Index: AQHX1/VTNGOVE1u5M0uN8s5g60zIn6waXgOAgAAB8vA=
Date: Mon, 29 Nov 2021 10:05:54 +0000
Message-ID: <OS0PR01MB592240481D7503FFC505BD5E86669@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20211112184413.4391-1-biju.das.jz@bp.renesas.com>
 <20211112184413.4391-4-biju.das.jz@bp.renesas.com>
 <c4869451-e879-aa58-29ba-ef3e94b03527@linaro.org>
In-Reply-To: <c4869451-e879-aa58-29ba-ef3e94b03527@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 996d1453-1a04-4735-746c-08d9b31fd52b
x-ms-traffictypediagnostic: OSAPR01MB4979:
x-microsoft-antispam-prvs: <OSAPR01MB4979D5D10CD513A708FA0BF086669@OSAPR01MB4979.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: g2cyCRkB5v7VccyOoaAswBBHbAlGVanMAA4U2m5/8VCZ1DO6kcP/9qIxq6J42UU4ptvu6F76/qzueEs2WaKXauDdoiIpZlBmXapvIi9JJ3gFYbEt1tvDkjFPMdbTytF8vwv9PLKMmKxpuTrxRTc018qxMUiMTXJTd1POF0Wb7ckQEv3p2vSjpuPGbt8iChmvt4js2s0+V6Pk4/NqKR77ydBJ3YJbrC4/mwT9TBaOzFWJM9XhgScUyhNeucZnTL92I5HWCbAS1qSBSvuWuYHxeKVHT+sMEZMoILJnNA5UDDSI8qGGROdLzQZ3cIFYKyWHqGvAO9m6+rwRoDewcwK+ZEqSR4Lc2fPaKPJaTnNkq5iACqfOigB/eIzLrPp3BVNa19Hlfi918i3OphGxl3hM0KBFxuT9eyyxywUaJXhNp1lq0hZ/sECXxdXtaY3Zf1hBIRfGy2DKot+Ax90VgRRIZ4leRmWHRYwtSxJT5ms0xaZhb/RCtQbwC0mdxus8KgJJhZSamF1On+Etp16CfuPP0v+wBqv7ggGqoBtZ4BWRVpq9Ptd7aiISl3i66F0hCMXjVeCaTwN2M6CN1oRND+tALoqakLAIH3xkyWmhiVqf8K2o/JoM4FrKjKDFNM1bpa2dLQli7QCFH4NKGutYqAP39h9tP/3Jd/4NJ2AUIyQMun7LAOMxtZFpw1mDiGDSIAdsFdPoSbZ9+pOAs5Ca0WeIml6/H8VOyb+HRCK9F6ysDIgDN+XA7jlNh6x+IUS9+0kYNHDmp2mPOW3MhERv3YpfMjOsjUIE8VBZbgPbtg/RZZY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS0PR01MB5922.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(33656002)(53546011)(55016003)(6506007)(66556008)(8676002)(316002)(71200400001)(26005)(76116006)(186003)(66946007)(64756008)(66476007)(38070700005)(8936002)(83380400001)(122000001)(52536014)(66446008)(508600001)(38100700002)(9686003)(7696005)(86362001)(54906003)(2906002)(110136005)(4326008)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?koi8-r?Q?w+qr4FmwmcQwZWfpkBQf2DoKcqveVHzqbdZ/o6pKSRdh5HqPTgHVa192L7hhO+?=
 =?koi8-r?Q?r6T7SmL4ZrIS2fkgk6ks0q3YDrn9qKr0x4fdqbk9tPCaVJPPjB/JJWCm0zOBdQ?=
 =?koi8-r?Q?b45YlEPYiNDH6xkbjbROCmHv2fyou9RlQrA/whdzQhbaOsWe627FVn4bt75p+S?=
 =?koi8-r?Q?p+wWdG+6lqZbhtnISKdOqxRB8pyJ4o5aNM6WDZuL+P/wD3Gk7ig9nz42V62n6B?=
 =?koi8-r?Q?b9OwkflJHoBlRa0mrNl8qBbLuKFIPPrCmUJ5d8VY2HCgnRVJ2SFRTTdllle1sn?=
 =?koi8-r?Q?a7AQLrqakavIFoY9QTgrYtIFH9X/MtRu8vy4XuleSMkoOdHWwHyVugW8i/vAom?=
 =?koi8-r?Q?uIcuHUv8txsPGCkJUTqOGrGJBhsFMeCv825Kn07jei4qX8ZrgiHE5DRwGun2dn?=
 =?koi8-r?Q?kpiO+0P1sVPxbKluU7F/uZMswJJQDaZGDOv5jfl7l6NdX1L1wwen8MHpdh7vZs?=
 =?koi8-r?Q?aFdJM1J3F3MgIq42NzC+sQQksUgq+rkBRR3Dmc6U1e4Q2XgR2iGIkomuBgjRIk?=
 =?koi8-r?Q?ZKRjXvaF/FdngHkuhBka5vlmEsyK6ccxatgKvOBtvVmalc9LWH7xCcyom1BPqF?=
 =?koi8-r?Q?QwsWP+J0nOhzLdizVnlDQwii3thBbq5nFmfDqY5siAobUKRRcyuDr8oiJPbYkU?=
 =?koi8-r?Q?0BY88f8ivqZywvT++iTYvXc3yE8ayE2xNR3vMQgT3aV0lIoMLdWovZ3CK76lhp?=
 =?koi8-r?Q?x1ODnKZeDSd54MxibsZ6ktAHUU1WZjco3O8HaUsRRoKJ9JKfRhpaOBNWnU6XNq?=
 =?koi8-r?Q?L+AANHHCDQrU5jq8PR9YgmmnJPxUp6JOEF/B/u90yrFnvGuAZwgoegQHFCgeQc?=
 =?koi8-r?Q?xDfiB9/flGtRZP+v3pkhn22Y9mLXlYp/6S94rhYKTTVJZp3isPzfpS7ExP/oxf?=
 =?koi8-r?Q?QlFGbSKyAGPqQBJeogI6hNHeQQsLfFeCLfpILB+FGzVW0w9fwMoPXsHiWPdiT9?=
 =?koi8-r?Q?XuHpe4ss4cLb3Vrzq85EpwxdDjmA1c5BpR/C+8XQ29qNdiCQfDZgj1vx15WgPY?=
 =?koi8-r?Q?ihKJ49WWeTkQtmW1SYIyfYrewwtpqlbvCsUqUj4Pik8GOHqpnukoK9KvwJTYk/?=
 =?koi8-r?Q?n5e4eG+aHpB0FgAg0IIdLtJxFbPcL+gJiazEZ0IRkRmRYQCnBX2lLG60wAd0DS?=
 =?koi8-r?Q?FOisWoOraIPh65fX+XiL8TTpQWgJ8r4TkcSKAAAaYVRPW9v0SY61lkSnhkXkrf?=
 =?koi8-r?Q?kYeg3tChiUR2UEdxKPjKHw/7sfkkXc6QvnkT4cN8mBPv42p5O/zXSLNGwvwY0K?=
 =?koi8-r?Q?Q1Xm0du+rSVyvMi47BHj6Z7RQ4YnyeG3WRwV1wFdxkO8PLZ+xB8PE9xJpQRyVJ?=
 =?koi8-r?Q?XIMjQ5TTHXvqW72Lm3CADkoIT/bOO5hq3Y42Jx2MHBm9CF331vIn9rYnXjDqio?=
 =?koi8-r?Q?tOM9qctAqF3KR31dLkd3nyzjNYCsVN91WP5lNdQ/swiO7557kpz4oT3YmWXhQI?=
 =?koi8-r?Q?J+ItnJXuOTQQk7FbqIfkqM7XNauVMnPyarht7A1wZjuVycQ10j36ALd0g3tSv/?=
 =?koi8-r?Q?DD+vlR1RIW7cdKnSqV6cC/rwUQ3qdSSYQc0eP024Jc4ff3iPKm9SJdYc4VQCJP?=
 =?koi8-r?Q?tcnoni820+KYrUkxyiuMnVgf5s2DPr4KWZSaqAQlCwJbhxuce2BhtlUGRiXyYA?=
 =?koi8-r?Q?6JnXNID1DT/g=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 996d1453-1a04-4735-746c-08d9b31fd52b
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Nov 2021 10:05:55.0124 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QrV95wqBE5yEsLsngmNY7K7yAx9GF5gytGdnENs7m9zR4q2gNUOH+NhiNefmVdz3Kt3hKbkLP4Bw6c5hUOFaVkL+lP6sW8ZqzspeOjyXhbo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB4979
Cc: Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Biju Das <biju.das@bp.renesas.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Chris Brandt <Chris.Brandt@renesas.com>, Thomas Gleixner <tglx@linutronix.de>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v3 3/4] clocksource/drivers/renesas-ostm:
 Add RZ/G2L OSTM support
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
Content-Type: text/plain; charset="koi8-r"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

SGkgRGFuaWVsIExlemNhbm8sCgpUaGFua3MgZm9yIHRoZSBmZWVkYmFjay4KCj4gU3ViamVjdDog
UmU6IFtQQVRDSCB2MyAzLzRdIGNsb2Nrc291cmNlL2RyaXZlcnMvcmVuZXNhcy1vc3RtOiBBZGQg
UlovRzJMCj4gT1NUTSBzdXBwb3J0Cj4gCj4gT24gMTIvMTEvMjAyMSAxOTo0NCwgQmlqdSBEYXMg
d3JvdGU6Cj4gPiBSWi9HMkwgU29DIGhhcyBHZW5lcmljIFRpbWVyIE1vZHVsZShhLmsuYSBPU1RN
KSB3aGljaCBuZWVkcyB0bwo+ID4gZGVhc3NlcnQgdGhlIHJlc2V0IGxpbmUgYmVmb3JlIGFjY2Vz
c2luZyBhbnkgcmVnaXN0ZXJzLgo+ID4KPiA+IFRoaXMgcGF0Y2ggYWRkcyBhbiBlbnRyeSBwb2lu
dCBmb3IgUlovRzJMIHNvIHRoYXQgd2UgY2FuIGRlYXNzZXJ0IHRoZQo+ID4gcmVzZXQgbGluZSBp
biBwcm9iZSBjYWxsYmFjay4KPiAKPiBXaGF0IGlzIHRoZSBjb25uZWN0aW9uIGJldHdlZW4gYWRk
aW5nIHRoZSByZXNldCBsaW5lIGNvbnRyb2wgYW5kIHRoZQo+IHBsYXRmb3JtIGRyaXZlciBhdCB0
aGUgZW5kIG9mIHRoZSBkcml2ZXIgPwoKVGhlIG9yaWdpbmFsIGRyaXZlciBoYXMgbm8gYXJtIGFy
Y2hpdGVjdHVyZSB0aW1lciwgc28gaXQgbmVlZHMgdG8gYmUKY2FsbGVkIHZlcnkgZWFybHkgaW4g
dGhlIGJvb3QgYW5kIHVzaW5nIG9mIGNhbGxzIGZvciBoYW5kbGluZyB0aGUgY2xvY2tzLgoKV2hl
cmUgYXMgUlovRzJMIGhhcyBhcm0gYXJjaGl0ZWN0dXJlIHRpbWVyIGFuZCBpdCBuZWVkcyB0byBy
ZWxlYXNlIHRoZSBtb2R1bGUKUmVzZXQgYmVmb3JlIGFjY2Vzc2luZyBhbnkgcmVnaXN0ZXJzLiBT
byBpdCBoYXMgdG8gYmUgYnVpbHQgaW4gYW5kIGl0IG5lZWRzIGNwZyBkcml2ZXIKd2hpY2ggaGFw
cGVucyBhdCBsYXRlciBzdGFnZSBjb21wYXJlZCB0byB0aGUgb3JpZ2luYWwgY2FzZSwgZm9yIGRl
LWFzc2VydGluZyB0aGUgcmVzZXQuCgpHZWVydCwgcGxlYXNlIGNvcnJlY3QgbWUgaWYgSSBhbSB3
cm9uZy4KClJlZ2FyZHMsCkJpanUKCj4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8Ymlq
dS5kYXMuanpAYnAucmVuZXNhcy5jb20+Cj4gPiBSZXZpZXdlZC1ieTogTGFkIFByYWJoYWthciA8
cHJhYmhha2FyLm1haGFkZXYtbGFkLnJqQGJwLnJlbmVzYXMuY29tPgo+ID4gLS0tCj4gPiB2Mi0+
djM6Cj4gPiAgKiBBZGRlZCByZXNldF9jb250cm9sX3B1dCgpIG9uIGVycm9yIHBhdGguCj4gPiAg
KiBlbmFibGVkIHN1cHByZXNzX2JpbmRfYXR0cnMgaW4gb3N0bV9kZXZpY2VfZHJpdmVyIHN0cnVj
dHVyZQo+ID4gdjEtPnYyOgo+ID4gICogQWRkZWQgcmVzZXQgaGFuZGxpbmcgaW5zaWRlIG9zdG1f
aW5pdAo+ID4gICogVXNlZCBzYW1lIGNvbXBhdGlibGUgZm9yIGJ1aWx0aW4gZHJpdmVyIGFzd2Vs
bAo+ID4gLS0tCj4gPiAgZHJpdmVycy9jbG9ja3NvdXJjZS9yZW5lc2FzLW9zdG0uYyB8IDM5Cj4g
PiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMzgg
aW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2Nsb2Nrc291cmNlL3JlbmVzYXMtb3N0bS5jCj4gPiBiL2RyaXZlcnMvY2xvY2tzb3VyY2UvcmVu
ZXNhcy1vc3RtLmMKPiA+IGluZGV4IDNkMDZiYTY2MDA4Yy4uMjFkMTM5MjYzN2I4IDEwMDY0NAo+
ID4gLS0tIGEvZHJpdmVycy9jbG9ja3NvdXJjZS9yZW5lc2FzLW9zdG0uYwo+ID4gKysrIGIvZHJp
dmVycy9jbG9ja3NvdXJjZS9yZW5lc2FzLW9zdG0uYwo+ID4gQEAgLTksNiArOSw4IEBACj4gPiAg
I2luY2x1ZGUgPGxpbnV4L2Nsay5oPgo+ID4gICNpbmNsdWRlIDxsaW51eC9jbG9ja2NoaXBzLmg+
Cj4gPiAgI2luY2x1ZGUgPGxpbnV4L2ludGVycnVwdC5oPgo+ID4gKyNpbmNsdWRlIDxsaW51eC9w
bGF0Zm9ybV9kZXZpY2UuaD4KPiA+ICsjaW5jbHVkZSA8bGludXgvcmVzZXQuaD4KPiA+ICAjaW5j
bHVkZSA8bGludXgvc2NoZWRfY2xvY2suaD4KPiA+ICAjaW5jbHVkZSA8bGludXgvc2xhYi5oPgo+
ID4KPiA+IEBAIC0xNTksNiArMTYxLDcgQEAgc3RhdGljIGludCBfX2luaXQgb3N0bV9pbml0X2Ns
a2V2dChzdHJ1Y3QgdGltZXJfb2YKPiA+ICp0bykKPiA+Cj4gPiAgc3RhdGljIGludCBfX2luaXQg
b3N0bV9pbml0KHN0cnVjdCBkZXZpY2Vfbm9kZSAqbnApICB7Cj4gPiArCXN0cnVjdCByZXNldF9j
b250cm9sICpyc3RjOwo+ID4gIAlzdHJ1Y3QgdGltZXJfb2YgKnRvOwo+ID4gIAlpbnQgcmV0Owo+
ID4KPiA+IEBAIC0xNjYsNiArMTY5LDE0IEBAIHN0YXRpYyBpbnQgX19pbml0IG9zdG1faW5pdChz
dHJ1Y3QgZGV2aWNlX25vZGUgKm5wKQo+ID4gIAlpZiAoIXRvKQo+ID4gIAkJcmV0dXJuIC1FTk9N
RU07Cj4gPgo+ID4gKwlyc3RjID0gb2ZfcmVzZXRfY29udHJvbF9nZXRfb3B0aW9uYWxfZXhjbHVz
aXZlKG5wLCBOVUxMKTsKPiA+ICsJaWYgKElTX0VSUihyc3RjKSkgewo+ID4gKwkJcmV0ID0gUFRS
X0VSUihyc3RjKTsKPiA+ICsJCWdvdG8gZXJyX2ZyZWU7Cj4gPiArCX0KPiA+ICsKPiA+ICsJcmVz
ZXRfY29udHJvbF9kZWFzc2VydChyc3RjKTsKPiA+ICsKPiA+ICAJdG8tPmZsYWdzID0gVElNRVJf
T0ZfQkFTRSB8IFRJTUVSX09GX0NMT0NLOwo+ID4gIAlpZiAoc3lzdGVtX2Nsb2NrKSB7Cj4gPiAg
CQkvKgo+ID4gQEAgLTE3OCw3ICsxODksNyBAQCBzdGF0aWMgaW50IF9faW5pdCBvc3RtX2luaXQo
c3RydWN0IGRldmljZV9ub2RlCj4gPiAqbnApCj4gPgo+ID4gIAlyZXQgPSB0aW1lcl9vZl9pbml0
KG5wLCB0byk7Cj4gPiAgCWlmIChyZXQpCj4gPiAtCQlnb3RvIGVycl9mcmVlOwo+ID4gKwkJZ290
byBlcnJfcmVzZXQ7Cj4gPgo+ID4gIAkvKgo+ID4gIAkgKiBGaXJzdCBwcm9iZWQgZGV2aWNlIHdp
bGwgYmUgdXNlZCBhcyBzeXN0ZW0gY2xvY2tzb3VyY2UuIEFueSBAQAo+ID4gLTIwMyw5ICsyMTQs
MzUgQEAgc3RhdGljIGludCBfX2luaXQgb3N0bV9pbml0KHN0cnVjdCBkZXZpY2Vfbm9kZSAqbnAp
Cj4gPgo+ID4gIGVycl9jbGVhbnVwOgo+ID4gIAl0aW1lcl9vZl9jbGVhbnVwKHRvKTsKPiA+ICtl
cnJfcmVzZXQ6Cj4gPiArCXJlc2V0X2NvbnRyb2xfYXNzZXJ0KHJzdGMpOwo+ID4gKwlyZXNldF9j
b250cm9sX3B1dChyc3RjKTsKPiA+ICBlcnJfZnJlZToKPiA+ICAJa2ZyZWUodG8pOwo+ID4gIAly
ZXR1cm4gcmV0Owo+ID4gIH0KPiA+Cj4gPiAgVElNRVJfT0ZfREVDTEFSRShvc3RtLCAicmVuZXNh
cyxvc3RtIiwgb3N0bV9pbml0KTsKPiA+ICsKPiA+ICsjaWZkZWYgQ09ORklHX0FSQ0hfUjlBMDdH
MDQ0Cj4gPiArc3RhdGljIGludCBfX2luaXQgb3N0bV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2
aWNlICpwZGV2KSB7Cj4gPiArCXN0cnVjdCBkZXZpY2UgKmRldiA9ICZwZGV2LT5kZXY7Cj4gPiAr
Cj4gPiArCXJldHVybiBvc3RtX2luaXQoZGV2LT5vZl9ub2RlKTsKPiA+ICt9Cj4gPiArCj4gPiAr
c3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgb3N0bV9vZl90YWJsZVtdID0gewo+ID4g
Kwl7IC5jb21wYXRpYmxlID0gInJlbmVzYXMsb3N0bSIsIH0sCj4gPiArCXsgLyogc2VudGluZWwg
Ki8gfQo+ID4gK307Cj4gPiArCj4gPiArc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIgb3N0
bV9kZXZpY2VfZHJpdmVyID0gewo+ID4gKwkuZHJpdmVyID0gewo+ID4gKwkJLm5hbWUgPSAicmVu
ZXNhc19vc3RtIiwKPiA+ICsJCS5vZl9tYXRjaF90YWJsZSA9IG9mX21hdGNoX3B0cihvc3RtX29m
X3RhYmxlKSwKPiA+ICsJCS5zdXBwcmVzc19iaW5kX2F0dHJzID0gdHJ1ZSwKPiA+ICsJfSwKPiA+
ICt9Owo+ID4gK2J1aWx0aW5fcGxhdGZvcm1fZHJpdmVyX3Byb2JlKG9zdG1fZGV2aWNlX2RyaXZl
ciwgb3N0bV9wcm9iZSk7ICNlbmRpZgo+ID4KPiAKPiAKPiAtLQo+IDxodHRwczovL2pwbjAxLnNh
ZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cCUzQSUyRiUyRnd3dy5saW5h
Cj4gcm8ub3JnJTJGJmFtcDtkYXRhPTA0JTdDMDElN0NiaWp1LmRhcy5qeiU0MGJwLnJlbmVzYXMu
Y29tJTdDNmEzYTA2NmVjN2IwNDAKPiBiNDY3NjIwOGQ5YjMxZTFjMjYlN0M1M2Q4MjU3MWRhMTk0
N2U0OWNiNDYyNWExNjZhNGEyYSU3QzAlN0MwJTdDNjM3NzM3NzY0MQo+IDgzODM4MzUyJTdDVW5r
bm93biU3Q1RXRnBiR1pzYjNkOGV5SldJam9pTUM0d0xqQXdNREFpTENKUUlqb2lWMmx1TXpJaUxD
SkJUCj4gaUk2SWsxaGFXd2lMQ0pYVkNJNk1uMCUzRCU3QzMwMDAmYW1wO3NkYXRhPUhxdnpEM2xx
Q0RsaHloMWNRZnU1QXNhMDlqejZUSjYKPiB2TFdZQk50UVU2aUElM0QmYW1wO3Jlc2VydmVkPTA+
IExpbmFyby5vcmcggSBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQVJNCj4gU29Dcwo+IAo+IEZv
bGxvdyBMaW5hcm86Cj4gPGh0dHBzOi8vanBuMDEuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9v
ay5jb20vP3VybD1odHRwJTNBJTJGJTJGd3d3LmZhY2UKPiBib29rLmNvbSUyRnBhZ2VzJTJGTGlu
YXJvJmFtcDtkYXRhPTA0JTdDMDElN0NiaWp1LmRhcy5qeiU0MGJwLnJlbmVzYXMuY29tJQo+IDdD
NmEzYTA2NmVjN2IwNDBiNDY3NjIwOGQ5YjMxZTFjMjYlN0M1M2Q4MjU3MWRhMTk0N2U0OWNiNDYy
NWExNjZhNGEyYSU3QzAlCj4gN0MwJTdDNjM3NzM3NzY0MTgzODM4MzUyJTdDVW5rbm93biU3Q1RX
RnBiR1pzYjNkOGV5SldJam9pTUM0d0xqQXdNREFpTENKUUkKPiBqb2lWMmx1TXpJaUxDSkJUaUk2
SWsxaGFXd2lMQ0pYVkNJNk1uMCUzRCU3QzMwMDAmYW1wO3NkYXRhPVE4OSUyQmVJelJCclVGOAo+
IFBNMXlPbVFKR2RnMGd2MUJEWkxrSHNFUUlzUVRxOCUzRCZhbXA7cmVzZXJ2ZWQ9MD4gRmFjZWJv
b2sgfAo+IDxodHRwczovL2pwbjAxLnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91
cmw9aHR0cCUzQSUyRiUyRnR3aXR0ZXIuCj4gY29tJTJGJTIzISUyRmxpbmFyb29yZyZhbXA7ZGF0
YT0wNCU3QzAxJTdDYmlqdS5kYXMuanolNDBicC5yZW5lc2FzLmNvbSU3QzYKPiBhM2EwNjZlYzdi
MDQwYjQ2NzYyMDhkOWIzMWUxYzI2JTdDNTNkODI1NzFkYTE5NDdlNDljYjQ2MjVhMTY2YTRhMmEl
N0MwJTdDMAo+ICU3QzYzNzczNzc2NDE4MzgzODM1MiU3Q1Vua25vd24lN0NUV0ZwYkdac2IzZDhl
eUpXSWpvaU1DNHdMakF3TURBaUxDSlFJam9pCj4gVjJsdU16SWlMQ0pCVGlJNklrMWhhV3dpTENK
WFZDSTZNbjAlM0QlN0MzMDAwJmFtcDtzZGF0YT0yRk5xTkdGcEZBJTJCSHJBeGoKPiBtdGJzU3RX
bUs1WTdUODdGME16SG44dVFvSzQlM0QmYW1wO3Jlc2VydmVkPTA+IFR3aXR0ZXIgfAo+IDxodHRw
czovL2pwbjAxLnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cCUzQSUy
RiUyRnd3dy5saW5hCj4gcm8ub3JnJTJGbGluYXJvLQo+IGJsb2clMkYmYW1wO2RhdGE9MDQlN0Mw
MSU3Q2JpanUuZGFzLmp6JTQwYnAucmVuZXNhcy5jb20lN0M2YTNhMDY2ZWM3YjA0MGI0Cj4gNjc2
MjA4ZDliMzFlMWMyNiU3QzUzZDgyNTcxZGExOTQ3ZTQ5Y2I0NjI1YTE2NmE0YTJhJTdDMCU3QzAl
N0M2Mzc3Mzc3NjQxODMKPiA4MzgzNTIlN0NVbmtub3duJTdDVFdGcGJHWnNiM2Q4ZXlKV0lqb2lN
QzR3TGpBd01EQWlMQ0pRSWpvaVYybHVNeklpTENKQlRpSQo+IDZJazFoYVd3aUxDSlhWQ0k2TW4w
JTNEJTdDMzAwMCZhbXA7c2RhdGE9UWQwdXJNWUd0WTJVQnhZeVF3aHdMWWd3QiUyRlpqcG9BCj4g
JTJGOXdlSU5mJTJGVklNWSUzRCZhbXA7cmVzZXJ2ZWQ9MD4gQmxvZwpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QK
TGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
