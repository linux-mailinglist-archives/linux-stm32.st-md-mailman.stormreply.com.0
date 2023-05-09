Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D5DDD6FBC8A
	for <lists+linux-stm32@lfdr.de>; Tue,  9 May 2023 03:34:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 87A78C6A606;
	Tue,  9 May 2023 01:34:55 +0000 (UTC)
Received: from mo-csw.securemx.jp (mo-csw1115.securemx.jp [210.130.202.157])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B5E42C65E60
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 May 2023 01:34:53 +0000 (UTC)
Received: by mo-csw.securemx.jp (mx-mo-csw1115) id 3491XnBi003131;
 Tue, 9 May 2023 10:33:49 +0900
X-Iguazu-Qid: 2wHH8MjPaUWJxIqQBE
X-Iguazu-QSIG: v=2; s=0; t=1683596029; q=2wHH8MjPaUWJxIqQBE;
 m=gaKboDerq6gAl1gFLPSFPf5M2bVp6sXAYvmUYKiKqS0=
Received: from imx2-a.toshiba.co.jp (imx2-a.toshiba.co.jp [106.186.93.35])
 by relay.securemx.jp (mx-mr1111) id 3491XiO6005040
 (version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 9 May 2023 10:33:45 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AeDMUGB04QouUXfG704xqGEsY686Wj8hk4WSniK85QsDgy4IVT9hNetED86iNvnt8kCaQWV9S8wfN6DUpBbk7k741HSiG15LDFQWyKNMLGYI677Vi6TFHxWvLPTb9brTajpGSLHot3yveGQZPpNDr/jgXC2tZMA68QR0udqgAoPtHMGqQzG0vIJ0m1+4+pXjfx33VQFQiS/o6OAz4EvjjP07GEeBoHWlF/WdpzzUUTgQwrlFwSi4jKWTUhFdxkXEYLscaaNYkIYqLPsyaEtmRFV41rhD3OBoIiFwh1opItNnJtnwyes6q4o7nBobJDYrcS+y0GUmrspUwDcWzgQoyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1lRIxqbva96T5WaQum0MUZBTsdwrHmTF6Y/B2CAtZck=;
 b=iseKMoFyBtSxZ4rnRx0X8G4yLKloIdbOxAPxLQNw9YXE998v29g1mLl+cZLFQ47BEhFvIOodZZQdx1UOrkl4KRy/4NgJIDY77LRIm1WjW797KXv2wvaBq5XQiD/gb+GZc7I+TQZ9EUG3Z8uQKCNtAvmil0wuaWu1DXk+HhfjLe3TqSn+5QlPM7zcI7vgB56bN1drPDHmhoQ9xqj/fG9KVV08peSrlS67JvLgkmC0gMskLIzJZJXiSOhW1YVkcaNV77N2+lBRpvT2GgFsdEP9HnAmszBw1o6zBxXG6i+8op0LFzRH/XH8Jb/F7yhlgfq1fy134y+HHLcw6hhRduNz2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=toshiba.co.jp; dmarc=pass action=none
 header.from=toshiba.co.jp; dkim=pass header.d=toshiba.co.jp; arc=none
From: <nobuhiro1.iwamatsu@toshiba.co.jp>
To: <u.kleine-koenig@pengutronix.de>, <peppe.cavallaro@st.com>,
 <alexandre.torgue@foss.st.com>, <joabreu@synopsys.com>,
 <davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
 <pabeni@redhat.com>, <mcoquelin.stm32@gmail.com>
Thread-Topic: [PATCH net-next v2 02/11] net: stmmac: dwmac-visconti: Make
 visconti_eth_clock_remove() return void
Thread-Index: AQHZgbk4wR/hiqTSp0KOy9NMLJTePK9RKLZg
Date: Tue, 9 May 2023 01:33:39 +0000
X-TSB-HOP2: ON
Message-ID: <TYWPR01MB9420B21A11C1586EDCF9270892769@TYWPR01MB9420.jpnprd01.prod.outlook.com>
References: <20230508142637.1449363-1-u.kleine-koenig@pengutronix.de>
 <20230508142637.1449363-3-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230508142637.1449363-3-u.kleine-koenig@pengutronix.de>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=toshiba.co.jp;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYWPR01MB9420:EE_|OS3PR01MB5655:EE_
x-ms-office365-filtering-correlation-id: 1d70b588-7678-4ec7-a128-08db502d6af5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5jkzdUwk8Z7lBHi/30ApPhh0iZz7jQAqiGFQygWHIEGxTGfNFTnwqV9c+Wt65XFNiuvCxwbia3tEvJYvlzsckb53ge202stNpHI2CWBZLoqGCR17dpIaoW6eaHR7qkMEP3OT+y6gMuBOoQFuSKCfGEtLWp/v1WUv3JNpFpeSyzafv6jdv6Q0m7ZVgkCrrokuz/PMcs7XFkxQH7IiW9g7zOWSg58pXT/dyyc+olo15yGe+fVirSQ1iJn4Ds8Yp84mdYPKaA7B5gKbUpnp8awiIaLJMVy+Ry+0pBk6MEQiPsrA6ks8j+qdHDP+whHubJz7H2x2lp6/Dupnb9tM6io7HXP7Iy2y94YKVMDa8/AVnzt6eOfULJ9cwWGBeA7HWYnPQ8kc9Z0jbfKiINE6dgcNJBBMrydeWAx2Z6LtzcUkJDjt9KhriIGCXsRZljBwK424DAkt2HLE6UPYtBDpHzhAVhZsw66mRji0LM0f9Zx8GqeLH8wAxEhQ93/x4ToLAzL9HJzRtPCQb/s6W4f/iz2Iai3PxShSLzUtNuDZgEAkmlKQZsUmsvnBiUOIEIOsW354l3kDbyxpOWDjvZJybKX+BUIeMvRKkBP6rxISHG8reVf3FhZaGQH7/MKS2srmf2ZL
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYWPR01MB9420.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(346002)(376002)(136003)(39860400002)(366004)(451199021)(2906002)(186003)(4744005)(26005)(6506007)(9686003)(53546011)(33656002)(38100700002)(83380400001)(55016003)(122000001)(71200400001)(316002)(38070700005)(64756008)(41300700001)(66446008)(66946007)(66476007)(66556008)(76116006)(7696005)(4326008)(54906003)(86362001)(110136005)(478600001)(7416002)(52536014)(5660300002)(8936002)(8676002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YWJvQTlCakE1UVk5UUhzOWxyVXI2cGs5OHFxZVkvcG82UERGY2VUcXVjWmNJ?=
 =?utf-8?B?amRXV28rWlYzTHh2YXAvOXZkbTNNUW9ucTVHb1c1Tlh5eUsrOGFYSjVtVk8x?=
 =?utf-8?B?cDRYUlhjbTloTW9laEdMaElDdHFUclphOVozTzhWZmx1ZGhjSDNpa2NlbXAr?=
 =?utf-8?B?bnY1REZKbW1oakpxWTdVaHI2bkdaanRZaHA1d0FscCtDc3JLNS9RREU1bFcw?=
 =?utf-8?B?SktrclFsZS9MZVQ3Y0p0N0FkdmJpL0M5Mms5RTFFcEN0OS9HY2ZmOTgwL2lL?=
 =?utf-8?B?aTdUV0tiTktObjVtRnhzbmRLenFwZC8zNUtuMmZraXBiTzNBR2R6WU9sUWQz?=
 =?utf-8?B?R0QrS05yUmY4b3lVUFBhTTRZUUpDUUdOL2IvUHZBYytMNkpaVGZRZVBmbFdM?=
 =?utf-8?B?OTRUR1RieU84Z042b3pvdDcxemk4Qm85SkhXM2VSZjNMcFV6L3RNdDV4c0Yw?=
 =?utf-8?B?bnFJRXgzZXhXY2RzZk04V0tqOWxmSWQ5MnZSSlV1UWJ3TG52dk5XQmF1cUMr?=
 =?utf-8?B?R1JNdFMwdHhFWnlBbVJSbXdNQ2NET2lEVFV0ODBVWTAwUkl0SEhvWWdsRnBF?=
 =?utf-8?B?V2JYRzRCazNYNW1wbnpqVk43RU1yZmQ4WXBXQ3hDRHRKRXZ6RzdyclUrV0Zu?=
 =?utf-8?B?S3REOVdTMWJuRU9NQUMwaFdFZFIzL0JHZERpS2hXOG5COU14bjN3RENvcHlM?=
 =?utf-8?B?RENCNSszZHRxK0xBcDNVY0U1SzVCakp6N0dobDN1VFlwclAxYy9xMVc1dmI3?=
 =?utf-8?B?b3VOWVNyc0Z2TkVURFJ1WnBTUk01dmdhS3kydDdBVTJIYTZDTUpLTUtEWGVa?=
 =?utf-8?B?QzZWMUMzbWpvbDQzaGFOSWR5c1NiZEpMMjlIZzVBZ0VRMkVjN2hIUG96ckVt?=
 =?utf-8?B?QXpLSjRHYUw4OGpuMXZPcXhFZWZQLyt2Y3VSSEdyeForQkc0ZmFRK3FmZnV4?=
 =?utf-8?B?S2t3UDdYWTZCWkE3OTJwczJJWGlRM3lXWmtOMEwxY1Y2UmFyMyt0WEVISE4r?=
 =?utf-8?B?TXcwbXV0Tk1wNUVxMXV3MERXWmtHQ2tUQllyd2tucW4wUzVDQUFGdUdBbFF3?=
 =?utf-8?B?RytKV1NpN1JFWURKVkl2UEhhTjNHMkZwam0rQWVNOEtuOXhiZW80NlZqdDlj?=
 =?utf-8?B?MU5OaThtaXoySjQzeUYva3B1V3lWNFBnVGhvQS81THVGbEduS2xZMFFWaGor?=
 =?utf-8?B?YnA1STFHN0RIeC9ETFBUWHVhQ2JFUWNzcTBqRk5DQ2t4WUtBRlVKYkFlQkJh?=
 =?utf-8?B?dTZYclBZbWRFSUFPNmxrQU0vMUpPcG1jOG9iTzhtUmVPTUU4eS9XZi9yQjRi?=
 =?utf-8?B?ZHAyNkFzZzhFTUp5a2JwSzdoRjdXM0l6eEpaTCtsM0FHTFllODVpdDRIRTls?=
 =?utf-8?B?dWVoeGgwazdWQjBOUUJ0Q21CdXR0SnowOUJSbEdlZFg4ZStpUVlBMFlkRXhq?=
 =?utf-8?B?emQ2M2YxcnlweXVpMXIwY2RmSWFFQXFuTTRsbkhub0JLTzF6MWtxVlBCMjNt?=
 =?utf-8?B?Mm9sN3plNW9MekprQTRDZmw1U0FSbXA3WXRSWVk3SW56eXVJYVpHUzQyZzdW?=
 =?utf-8?B?VzBEeDEyRFJWcVNxQ3lLOXE5STVqcGE1SWV1MFRyNEVUZDE0aFgrczJrTDJ4?=
 =?utf-8?B?ek94bWR4eUE5ekRENDg2bnErdmRyUUlielJkaU5qbVZSTTMyb3NONUN1dGtl?=
 =?utf-8?B?cFp4Sjkrc3UvcUxKSGxLQVFCOGJGcTh4QTN3WU5XOStUQTB1bThLVWtBMUZ3?=
 =?utf-8?B?ejUzMHBQZkt6WW1mVFVPdDUwT0luQjJ6ZXBRQVBJbTB4SGFmd2hqc3BGRURt?=
 =?utf-8?B?RDVZeXlLYkpTZGxWYmlhN1R3cm52MWJweEhGa0R4MVlVdDZyMDV3QTB6NEdj?=
 =?utf-8?B?WHdoYmx1d0xrejlsbVJNRzQyVDluYnFSK1Bxdmt0VFdlczhZTXQ1REVvYnda?=
 =?utf-8?B?R21wVEt2NW1OMmtIS0VBTkdHQ2FDT0p0TU1IQlNpTXBpazRrL3FFTDNWUWxa?=
 =?utf-8?B?ZGFRbExMZTJ5aEhaZU03K3ZGRFdNd1BPK29GTG1TL3JoVGlSY2dNUC9QT3k0?=
 =?utf-8?B?NktiWnd1Si9jK0locFN6a0NnR1kxM1VGZTk0VVl4YWtBKzUxbW1xUzJSckpw?=
 =?utf-8?B?ckxFMHVlRE5ocHpPa0hDYlVnbUxNMTZXYmFpVzI3ZVcyajU1ZTVqVmJEd3Z3?=
 =?utf-8?B?T2c9PQ==?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYWPR01MB9420.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d70b588-7678-4ec7-a128-08db502d6af5
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2023 01:33:40.0680 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f109924e-fb71-4ba0-b2cc-65dcdf6fbe4f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VYyVLsXIP5ibnwwlgqnh+dNsicsR7R/lydsWNSoEMb5plt/Nx4uGzVbs0k2hScj8CABZpPIDZxN38StjAdIG/aEuAvzwxKjIlhUZuq3HXX8p5s/A9UOQ9bpacXr69m4c
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB5655
X-OriginatorOrg: toshiba.co.jp
MSSCP.TransferMailToMossAgent: 103
Cc: kernel@pengutronix.de, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v2 02/11] net: stmmac:
 dwmac-visconti: Make visconti_eth_clock_remove() return void
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

SGkgVXdlLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFV3ZSBLbGVp
bmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+DQo+IFNlbnQ6IE1vbmRh
eSwgTWF5IDgsIDIwMjMgMTE6MjYgUE0NCj4gVG86IEdpdXNlcHBlIENhdmFsbGFybyA8cGVwcGUu
Y2F2YWxsYXJvQHN0LmNvbT47IEFsZXhhbmRyZSBUb3JndWUNCj4gPGFsZXhhbmRyZS50b3JndWVA
Zm9zcy5zdC5jb20+OyBKb3NlIEFicmV1IDxqb2FicmV1QHN5bm9wc3lzLmNvbT47DQo+IERhdmlk
IFMuIE1pbGxlciA8ZGF2ZW1AZGF2ZW1sb2Z0Lm5ldD47IEVyaWMgRHVtYXpldA0KPiA8ZWR1bWF6
ZXRAZ29vZ2xlLmNvbT47IEpha3ViIEtpY2luc2tpIDxrdWJhQGtlcm5lbC5vcmc+OyBQYW9sbyBB
YmVuaQ0KPiA8cGFiZW5pQHJlZGhhdC5jb20+OyBNYXhpbWUgQ29xdWVsaW4gPG1jb3F1ZWxpbi5z
dG0zMkBnbWFpbC5jb20+Ow0KPiBpd2FtYXRzdSBub2J1aGlybyjlsqnmnb4g5L+h5rSLIOKXi++8
pO+8qe+8tO+8o+KWoe+8pO+8qe+8tOKXi++8r++8s++8tCkNCj4gPG5vYnVoaXJvMS5pd2FtYXRz
dUB0b3NoaWJhLmNvLmpwPg0KPiBDYzogbmV0ZGV2QHZnZXIua2VybmVsLm9yZzsgbGludXgtc3Rt
MzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbTsNCj4gbGludXgtYXJtLWtlcm5lbEBsaXN0
cy5pbmZyYWRlYWQub3JnOyBrZXJuZWxAcGVuZ3V0cm9uaXguZGUNCj4gU3ViamVjdDogW1BBVENI
IG5ldC1uZXh0IHYyIDAyLzExXSBuZXQ6IHN0bW1hYzogZHdtYWMtdmlzY29udGk6IE1ha2UNCj4g
dmlzY29udGlfZXRoX2Nsb2NrX3JlbW92ZSgpIHJldHVybiB2b2lkDQo+IA0KPiBUaGUgZnVuY3Rp
b24gcmV0dXJucyB6ZXJvIHVuY29uZGl0aW9uYWxseS4gQ2hhbmdlIGl0IHRvIHJldHVybiB2b2lk
IGluc3RlYWQNCj4gd2hpY2ggc2ltcGxpZmllcyBvbmUgY2FsbGVyIGFzIGVycm9yIGhhbmRpbmcg
YmVjb21lcyB1bm5lY2Vzc2FyeS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFV3ZSBLbGVpbmUtS8O2
bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+DQoNCkFja2VkLWJ5OiBOb2J1aGly
byBJd2FtYXRzdSA8bm9idWhpcm8xLml3YW1hdHN1QHRvc2hpYmEuY28uanA+DQoNCkJlc3QgcmVn
YXJkcywNCiBOb2J1aGlybw0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21h
aWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
