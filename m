Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F9473DACE
	for <lists+linux-stm32@lfdr.de>; Mon, 26 Jun 2023 11:07:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 017F6C6905A;
	Mon, 26 Jun 2023 09:07:41 +0000 (UTC)
Received: from mickerik.phytec.de (mickerik.phytec.de [91.26.50.163])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E970FC03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Jun 2023 08:59:46 +0000 (UTC)
X-AuditID: ac14000a-923ff70000007ecb-f8-64955f02026d
Received: from florix.phytec.de (Unknown_Domain [172.25.0.13])
 (using TLS with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client did not present a certificate)
 by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id 47.60.32459.20F55946;
 Fri, 23 Jun 2023 10:59:46 +0200 (CEST)
Received: from Berlix.phytec.de (172.25.0.12) by Florix.phytec.de
 (172.25.0.13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Fri, 23 Jun
 2023 10:59:45 +0200
Received: from Berlix.phytec.de ([fe80::61cc:ebf0:7375:8768]) by
 berlix.phytec.de ([fe80::197e:d26b:2ca:c7b4%4]) with mapi id 15.01.2375.018;
 Fri, 23 Jun 2023 10:59:45 +0200
From: Christophe Parant <C.Parant@phytec.fr>
To: "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>, "s.trumtrar@pengutronix.de"
 <s.trumtrar@pengutronix.de>
Thread-Topic: [PATCH v9 10/10] ARM: dts: stm32: add STM32MP1-based Phytec board
Thread-Index: AQHZjYZ7ReKcSf+hNU6XArRy/wB/9q9n0WyAgDBUHIA=
Date: Fri, 23 Jun 2023 08:59:45 +0000
Message-ID: <9163ad315278dbedd6c31993a3dafad62a731b5e.camel@phytec.fr>
References: <20230505060158.16516-1-s.trumtrar@pengutronix.de>
 <20230505060158.16516-11-s.trumtrar@pengutronix.de>
 <e5b4ef445160ac0ddbaa25f12118a253ad21542a.camel@phytec.fr>
In-Reply-To: <e5b4ef445160ac0ddbaa25f12118a253ad21542a.camel@phytec.fr>
Accept-Language: fr-FR, de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.25.0.11]
Content-ID: <C4DB8B8AEF0528439B22FAC57DCCE88C@phytec.de>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRmVeSWpSXmKPExsWyRpKBV5cpfmqKwaxnAhY/X05jtJh/5Byr
 Rd+Lh8wWmx5fY7XouvaE1WLe37WsFp8+LmSx6H6n7sDh8bR/K7vHzll32T3uXNvD5rF5Sb1H
 f3cLq0f/XwOPg/sMPT5vkgvgiOKySUnNySxLLdK3S+DKmDwvouCafsXxo4cZGxh36HUxcnJI
 CJhI7Px+m72LkYtDSGAJk8S7+1NYIJwHjBJ7uxrYIJyNjBKXX71gBGlhE9CRuHP8AjNIQkRg
 GqPE0tYFTCAJZoEJzBIzZjuB2MICfhI/Z29lAbFFBAIl+s/vYISwrSR6TrezgdgsAqoSm3b/
 ZwWxeQXcJJpvHmKE2LaZUeLb0nNgzZwC7hI3jnwAa2YUUJG4/nIXC8QycYlNz76zQjwhILFk
 z3lmCFtU4uXjf1BxeYkTt6YBHccBVK8psX6XPoRpIbGmzR9iiqLElO6H7BAnCEqcnPmEZQKj
 +CwkC2YhNM9CaJ6FpHkWkuYFjKyrGIVyM5OzU4sys/UKMipLUpP1UlI3MYKiWoSBawdj3xyP
 Q4xMHIyHGCU4mJVEeGU3TUoR4k1JrKxKLcqPLyrNSS0+xCjNwaIkznu/hylRSCA9sSQ1OzW1
 ILUIJsvEwSnVwGj7/An/S5nS9T+y67beO/JZI6rBsevdruPxFUevy+7IfG2Rf9DtKtvqR491
 3L5/j068tH5djZLRW3fxBZ+ny9t+rZQ6LROydWL01fxPniGV1WIWdtzz9xa+ipiirRO8eV+C
 7N+DJR/rghSkHc8cWPWO6WXPPza96utaC59wLfjazZ219rTg9eVKLMUZiYZazEXFiQDWATSP
 2AIAAA==
X-Mailman-Approved-At: Mon, 26 Jun 2023 09:07:40 +0000
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "upstream@lists.phytec.de" <upstream@lists.phytec.de>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v9 10/10] ARM: dts: stm32: add
	STM32MP1-based Phytec board
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

SGVsbG8gbWFpbnRhaW5lcnMsDQoNCkkgd291bGQgbGlrZSB0byBrbm93IGlmIHlvdSBoYXZlIHNl
ZW4gbXkgcmVxdWVzdCBiZWxvdyA/DQoNClRoYW5rIHlvdS4NCg0KQmVzdCByZWdhcmRzLA0KQ2hy
aXN0b3BoZQ0KDQpMZSBtYXJkaSAyMyBtYWkgMjAyMyDDoCAxNjo1OCArMDIwMCwgQ2hyaXN0b3Bo
ZSBQYXJhbnQgYSDDqWNyaXTCoDoNCj4gSGkgU3RlZmZlbiwNCj4gDQo+IFRoYW5rIHlvdSBmb3Ig
dXBzdHJlYW1pbmcgb3VyIHBoeUJPQVJELVNhcmdhcyBkZXZpY2UgdHJlZS4gV2Ugd2VyZQ0KPiBh
bHNvDQo+IHBsYW5pbmcgdG8gd29yayBvbiB0aGF0IHRvby4NCj4gSWYgdGhpcyBwYXRjaCBpcyBu
b3QgYXBwbGllZCB1cHN0cmVhbSB5ZXQsIHdvdWxkIGl0IGJlIHBvc3NpYmxlIHRvDQo+IHJlbmFt
ZSB0aGUgLmR0cyBmaWxlID8NCj4gDQo+IEluIHRoZSBiZWdpbm5pbmcsIHdlIG5hbWVkIHRoZSBk
dHMgZmlsZXMgYWZ0ZXIgb3VyIFlvY3RvIG1hY2hpbmVzLA0KPiB3aGljaCBpcyBwcm9iYWJseSB0
aGUgdmVyc2lvbiB5b3UgZ290LiBCdXQgbm93IHdlIHJlbmFtZWQgdGhlbSBhZnRlcg0KPiBvdXIg
YmFzZWJvYXJkIG5hbWVzLCBsaWtlIHdpdGggb3VyIG90aGVyIHBsYXRmb3Jtcy4NCj4gU28gaXQg
d291bGQgbWFrZSBzZW5zZSB0byBoYXZlIHRoZSBzdG0zMiBiYXNlYm9hcmQgbmFtZWQgdGhlIHNh
bWUNCj4gd2F5LA0KPiBjaGFuZ2luZyAic3RtMzJtcDE1N2MtcGh5Y29yZS1zdG0zMm1wMS0zLmR0
cyIgdG8gInN0bTMybXAxNTdjLQ0KPiBwaHlib2FyZC0NCj4gc2FyZ2FzLXJkay1lbW1jLmR0cyIu
DQo+IA0KPiAibW9kZWwiIGFuZCAiY29tcGF0aWJsZSIgY2FuIGFsc28gYmUgbW9kaWZpZWQgdGhp
cyB3YXkgd2l0aCB0aGlzDQo+IG5hbWluZw0KPiBjb252ZW50aW9uIDoNCj4gDQo+IC8gew0KPiDC
oMKgwqAgbW9kZWwgPSAiUEhZVEVDIHBoeUJPQVJELVNhcmdhcyBTVE0zMk1QMTU3QyB3aXRoIGVN
TUMiOw0KPiDCoMKgwqAgY29tcGF0aWJsZSA9ICJwaHl0ZWMsc3RtMzJtcDE1N2MtcGh5Ym9hcmQt
c2FyZ2FzLXJkay1lbW1jIiwNCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICJwaHl0ZWMsc3Rt
MzJtcDE1N2MtcGh5Y29yZS1zb20iLCAic3Qsc3RtMzJtcDE1NyI7DQo+IH07DQo+IA0KPiBUaGFu
a3MuDQo+IA0KPiBCZXN0IHJlZ2FyZHMsDQo+IENocmlzdG9waGUgUGFyYW50DQo+IA0KPiBMZSB2
ZW5kcmVkaSAwNSBtYWkgMjAyMyDDoCAwODowMSArMDIwMCwgU3RlZmZlbiBUcnVtdHJhciBhIMOp
Y3JpdMKgOg0KPiA+IEFkZCB0aGUgUGh5dGVjIFNUTTMyTVAxLTMgRGV2IGJvYXJkLiBUaGUgZGV2
Ym9hcmQgdXNlcyBhIFBoeXRlYw0KPiA+IHN0bTMybTE1N2Mtc29tLg0KPiA+IA0KPiA+IFNpZ25l
ZC1vZmYtYnk6IFN0ZWZmZW4gVHJ1bXRyYXIgPHMudHJ1bXRyYXJAcGVuZ3V0cm9uaXguZGU+DQo+
ID4gLS0tDQo+ID4gDQo+ID4gTm90ZXM6DQo+ID4gwqDCoMKgIENoYW5nZXMgc2luY2Ugdjc6DQo+
ID4gwqDCoMKgwqDCoMKgIC0gcmVtb3ZlIHNlY3VyZS1zdGF0dXMgZm9yIHNkbW1jDQo+ID4gDQo+
ID4gwqBhcmNoL2FybS9ib290L2R0cy9NYWtlZmlsZcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHzCoCAzICstDQo+ID4gwqAuLi4vZHRzL3N0bTMybXAxNTdjLXBoeWNvcmUt
c3RtMzJtcDEtMy5kdHPCoMKgwqAgfCA2MA0KPiA+ICsrKysrKysrKysrKysrKysrKysNCj4gPiDC
oDIgZmlsZXMgY2hhbmdlZCwgNjIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiA+IMKg
Y3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAxNTdjLXBoeWNvcmUt
c3RtMzJtcDEtDQo+ID4gMy5kdHMNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9v
dC9kdHMvTWFrZWZpbGUNCj4gPiBiL2FyY2gvYXJtL2Jvb3QvZHRzL01ha2VmaWxlDQo+ID4gaW5k
ZXggZWZlNDE1MmU1ODQ2Li5kZmE5YTc0NzdjODIgMTAwNjQ0DQo+ID4gLS0tIGEvYXJjaC9hcm0v
Ym9vdC9kdHMvTWFrZWZpbGUNCj4gPiArKysgYi9hcmNoL2FybS9ib290L2R0cy9NYWtlZmlsZQ0K
PiA+IEBAIC0xMjUyLDcgKzEyNTIsOCBAQCBkdGItJChDT05GSUdfQVJDSF9TVE0zMikgKz0gXA0K
PiA+IMKgwqDCoMKgwqDCoMKgwqBzdG0zMm1wMTU3Yy1ldjEuZHRiIFwNCj4gPiDCoMKgwqDCoMKg
wqDCoMKgc3RtMzJtcDE1N2MtZXYxLXNjbWkuZHRiIFwNCj4gPiDCoMKgwqDCoMKgwqDCoMKgc3Rt
MzJtcDE1N2MtbHhhLW1jMS5kdGIgXA0KPiA+IC3CoMKgwqDCoMKgwqDCoHN0bTMybXAxNTdjLW9k
eXNzZXkuZHRiDQo+ID4gK8KgwqDCoMKgwqDCoMKgc3RtMzJtcDE1N2Mtb2R5c3NleS5kdGIgXA0K
PiA+ICvCoMKgwqDCoMKgwqDCoHN0bTMybXAxNTdjLXBoeWNvcmUtc3RtMzJtcDEtMy5kdGINCj4g
PiDCoGR0Yi0kKENPTkZJR19NQUNIX1NVTjRJKSArPSBcDQo+ID4gwqDCoMKgwqDCoMKgwqDCoHN1
bjRpLWExMC1hMTAwMC5kdGIgXA0KPiA+IMKgwqDCoMKgwqDCoMKgwqBzdW40aS1hMTAtYmExMC10
dmJveC5kdGIgXA0KPiA+IGRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTU3
Yy1waHljb3JlLXN0bTMybXAxLTMuZHRzDQo+ID4gYi9hcmNoL2FybS9ib290L2R0cy9zdG0zMm1w
MTU3Yy1waHljb3JlLXN0bTMybXAxLTMuZHRzDQo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4g
PiBpbmRleCAwMDAwMDAwMDAwMDAuLjI4ZDcyMDMyNjRjZQ0KPiA+IC0tLSAvZGV2L251bGwNCj4g
PiArKysgYi9hcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTU3Yy1waHljb3JlLXN0bTMybXAxLTMu
ZHRzDQo+ID4gQEAgLTAsMCArMSw2MCBAQA0KPiA+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmll
cjogKEdQTC0yLjArIE9SIEJTRC0zLUNsYXVzZSkNCj4gPiArLyoNCj4gPiArICogQ29weXJpZ2h0
IChDKSBQaHl0ZWMgR21iSCAyMDE5LTIwMjAgLSBBbGwgUmlnaHRzIFJlc2VydmVkDQo+ID4gKyAq
IEF1dGhvcjogRG9tIFZPVkFSRCA8ZG9tLnZvdmFyZEBsaW5ydC5jb20+Lg0KPiA+ICsgKi8NCj4g
PiArDQo+ID4gKy9kdHMtdjEvOw0KPiA+ICsNCj4gPiArI2luY2x1ZGUgPGR0LWJpbmRpbmdzL3Bp
bmN0cmwvc3RtMzItcGluZnVuYy5oPg0KPiA+ICsjaW5jbHVkZSAic3RtMzJtcDE1Ny5kdHNpIg0K
PiA+ICsjaW5jbHVkZSAic3RtMzJtcDE1eGMuZHRzaSINCj4gPiArI2luY2x1ZGUgInN0bTMybXAx
NXh4YWMtcGluY3RybC5kdHNpIg0KPiA+ICsjaW5jbHVkZSAic3RtMzJtcDE1N2MtcGh5Y29yZS1z
dG0zMm1wMTUtc29tLmR0c2kiDQo+ID4gKw0KPiA+ICsvIHsNCj4gPiArwqDCoMKgwqDCoMKgwqBt
b2RlbCA9ICJQSFlURUMgcGh5Q09SRS1TVE0zMk1QMS0zIERldiBCb2FyZCI7DQo+ID4gK8KgwqDC
oMKgwqDCoMKgY29tcGF0aWJsZSA9ICJwaHl0ZWMscGh5Y29yZS1zdG0zMm1wMS0zIiwNCj4gPiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgInBoeXRlYyxwaHljb3JlLXN0
bTMybXAxNTdjLXNvbSIsDQo+ID4gInN0LHN0bTMybXAxNTciOw0KPiA+ICsNCj4gPiArwqDCoMKg
wqDCoMKgwqBhbGlhc2VzIHsNCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgbW1j
MCA9ICZzZG1tYzE7DQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoG1tYzEgPSAm
c2RtbWMyOw0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBtbWMyID0gJnNkbW1j
MzsNCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgc2VyaWFsMCA9ICZ1YXJ0NDsN
Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgc2VyaWFsMSA9ICZ1c2FydDM7DQo+
ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHNlcmlhbDIgPSAmdXNhcnQxOw0KPiA+
ICvCoMKgwqDCoMKgwqDCoH07DQo+ID4gK307DQo+ID4gKw0KPiA+ICsmY3J5cDEgew0KPiA+ICvC
oMKgwqDCoMKgwqDCoHN0YXR1cyA9ICJva2F5IjsNCj4gPiArfTsNCj4gPiArDQo+ID4gKyZkdHMg
ew0KPiA+ICvCoMKgwqDCoMKgwqDCoHN0YXR1cyA9ICJva2F5IjsNCj4gPiArfTsNCj4gPiArDQo+
ID4gKyZmbWMgew0KPiA+ICvCoMKgwqDCoMKgwqDCoHN0YXR1cyA9ICJkaXNhYmxlZCI7DQo+ID4g
K307DQo+ID4gKw0KPiA+ICsmZ3B1IHsNCj4gPiArwqDCoMKgwqDCoMKgwqBzdGF0dXMgPSAib2th
eSI7DQo+ID4gK307DQo+ID4gKw0KPiA+ICsmaTJjNF9lZXByb20gew0KPiA+ICvCoMKgwqDCoMKg
wqDCoHN0YXR1cyA9ICJva2F5IjsNCj4gPiArfTsNCj4gPiArDQo+ID4gKyZpMmM0X3J0YyB7DQo+
ID4gK8KgwqDCoMKgwqDCoMKgc3RhdHVzID0gIm9rYXkiOw0KPiA+ICt9Ow0KPiA+ICsNCj4gPiAr
JnFzcGkgew0KPiA+ICvCoMKgwqDCoMKgwqDCoHN0YXR1cyA9ICJva2F5IjsNCj4gPiArfTsNCj4g
PiArDQo+ID4gKyZzZG1tYzIgew0KPiA+ICvCoMKgwqDCoMKgwqDCoHN0YXR1cyA9ICJva2F5IjsN
Cj4gPiArfTsNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXN0bTMyCg==
