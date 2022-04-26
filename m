Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BF13D50F467
	for <lists+linux-stm32@lfdr.de>; Tue, 26 Apr 2022 10:33:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6C92AC60466;
	Tue, 26 Apr 2022 08:33:21 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 33E43C5F1D6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Apr 2022 08:33:20 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ore@pengutronix.de>)
 id 1njGdD-0005tm-O2; Tue, 26 Apr 2022 10:33:11 +0200
Received: from ore by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <ore@pengutronix.de>)
 id 1njGd7-0008VO-GE; Tue, 26 Apr 2022 10:33:05 +0200
Date: Tue, 26 Apr 2022 10:33:05 +0200
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: =?utf-8?B?SsOpcsO0bWU=?= Pouiller <jerome.pouiller@silabs.com>
Message-ID: <20220426083305.GA17577@pengutronix.de>
References: <20220425132844.866743-1-o.rempel@pengutronix.de>
 <14881918.tv2OnDr8pf@pc-42> <20220426072113.GC3419@pengutronix.de>
 <4686508.cEBGB3zze1@pc-42>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4686508.cEBGB3zze1@pc-42>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 10:28:02 up 26 days, 20:57, 80 users,  load average: 0.09, 0.18, 0.31
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, kernel@pengutronix.de,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 2/4] dt-bindings: net: silabs,
 wfx: add prt, prtt1c-wfm200 antenna variant
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

T24gVHVlLCBBcHIgMjYsIDIwMjIgYXQgMTA6MTk6MjlBTSArMDIwMCwgSsOpcsO0bWUgUG91aWxs
ZXIgd3JvdGU6Cj4gT24gVHVlc2RheSAyNiBBcHJpbCAyMDIyIDA5OjIxOjEzIENFU1QgT2xla3Np
aiBSZW1wZWwgd3JvdGU6Cj4gPiBPbiBNb24sIEFwciAyNSwgMjAyMiBhdCAwNTozODoyMFBNICsw
MjAwLCBKw6lyw7RtZSBQb3VpbGxlciB3cm90ZToKPiA+ID4gT24gTW9uZGF5IDI1IEFwcmlsIDIw
MjIgMTU6Mjg6NDIgQ0VTVCBPbGVrc2lqIFJlbXBlbCB3cm90ZToKPiA+ID4gPiBBZGQgY29tcGF0
aWJsZSBmb3Igd2ZtMjAwIGFudGVubmEgY29uZmlndXJhdGlvbiB2YXJpYW50IGZvciBQcm90b25p
YyBQUlRUMUMKPiA+ID4gPiBib2FyZC4KPiA+ID4gPgo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IE9s
ZWtzaWogUmVtcGVsIDxvLnJlbXBlbEBwZW5ndXRyb25peC5kZT4KPiA+ID4gPiAtLS0KPiA+ID4g
PiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3Mvc3RhZ2luZy9uZXQvd2lyZWxlc3Mvc2lsYWJzLHdm
eC55YW1sICAgICB8IDEgKwo+ID4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykK
PiA+ID4gPgo+ID4gPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3Mvc3RhZ2luZy9uZXQvd2lyZWxlc3Mvc2lsYWJzLHdmeC55YW1sIGIvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL3N0YWdpbmcvbmV0L3dpcmVsZXNzL3NpbGFicyx3ZngueWFt
bAo+ID4gPiA+IGluZGV4IDEwNTcyNWExMjdhYi4uY2UxMDdmZTQ1ZDdjIDEwMDY0NAo+ID4gPiA+
IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zdGFnaW5nL25ldC93aXJl
bGVzcy9zaWxhYnMsd2Z4LnlhbWwKPiA+ID4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3Mvc3RhZ2luZy9uZXQvd2lyZWxlc3Mvc2lsYWJzLHdmeC55YW1sCj4gPiA+ID4g
QEAgLTM5LDYgKzM5LDcgQEAgcHJvcGVydGllczoKPiA+ID4gPiAgICBjb21wYXRpYmxlOgo+ID4g
PiA+ICAgICAgaXRlbXM6Cj4gPiA+ID4gICAgICAgIC0gZW51bToKPiA+ID4gPiArICAgICAgICAg
IC0gcHJ0LHBydHQxYy13Zm0yMDAgIyBQcm90b25pYyBQUlRUMUMgQm9hcmQKPiA+ID4gPiAgICAg
ICAgICAgIC0gc2lsYWJzLGJyZDQwMDFhICMgV0dNMTYwUCBFdmFsdWF0aW9uIEJvYXJkCj4gPiA+
ID4gICAgICAgICAgICAtIHNpbGFicyxicmQ4MDIyYSAjIFdGMjAwIEV2YWx1YXRpb24gQm9hcmQK
PiA+ID4gPiAgICAgICAgICAgIC0gc2lsYWJzLGJyZDgwMjNhICMgV0ZNMjAwIEV2YWx1YXRpb24g
Qm9hcmQKPiA+ID4KPiA+ID4gSSB0aGluayB5b3UgYWxzbyBoYXZlIHRvIGRlY2xhcmUgdGhpcyBu
ZXcgZW50cnkgaW4gd2Z4X3NkaW9fb2ZfbWF0Y2gsCj4gPiA+IGFuZC9vciB3Znhfc3BpX29mX21h
dGNoIGFuZCB3Znhfc3BpX2lkLgo+ID4gPgo+ID4gPiBPbiB0aGUgV0ZNMjAwIHZhcmlhbnQsIHRo
ZSBhbnRlbm5hIGlzIGJ1aWx0IGluIHRoZSBjaGlwLiBTbyBJIHRoaW5rIHlvdQo+ID4gPiBjYW4g
cG9pbnQgb24gdGhlIHNhbWUgY29uZmlndXJhdGlvbiB0aGFuIHRoZSBicmQ4MDIzYS4KPiA+IAo+
ID4gSSBhc3N1bWUgZHJpdmVyIHVwZGF0ZSBjYW4gYmUgbWFkZSBpbiBhIHNlcGFyYXRlIHBhdGNo
LiBBcyBzb29uIGFzIHdlCj4gPiByZXNlcnZlZCBjb21wYXRpYmxlIGZvciB0aGlzIGJvYXJkcyB0
aGVyZSBzaG91bGQgYmUgbm8gY29uZmxpY3RzLiBUaGlzIHBhdGNoZXMKPiA+IHNlcmllcyBpcyB0
YXJnZXRpbmcgb25seSBkZXZpY2V0cmVlIGFuZCBuZWVkZWQgRFQgc2NoZW1hIGNoYW5nZXMuCj4g
Cj4gaG1tbS4uLiBJIGFtIG5vdCBEVCBzcGVjaWFsaXN0LCBidXQgaXQgc2VlbXMgYSBiaXQgd2Vp
cmQgdG8gaGF2ZSBhIG5ldwo+IGVudHJ5IGluIHRoZSBkdCBzY2hlbWEsIGJ1dCBubyBuZXcgY29k
ZSBpbiBhbnkgb2ZfbWF0Y2ggdGFibGUuIAoKSGVyZSBpcyBvbmUgZXhhbXBsZToKaHR0cHM6Ly9n
aXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0
L3RyZWUvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NwaS9mc2wtaW14LWNzcGku
eWFtbD9oPXY1LjE4LXJjNCNuMjgKcHJvcGVydGllczoKICBjb21wYXRpYmxlOgogICAgb25lT2Y6
CiAgICAgIC0gY29uc3Q6IGZzbCxpbXgxLWNzcGkKICAgICAgLSBjb25zdDogZnNsLGlteDIxLWNz
cGkKICAgICAgLSBjb25zdDogZnNsLGlteDI3LWNzcGkKICAgICAgLSBjb25zdDogZnNsLGlteDMx
LWNzcGkKICAgICAgLSBjb25zdDogZnNsLGlteDM1LWNzcGkKICAgICAgLSBjb25zdDogZnNsLGlt
eDUxLWVjc3BpCiAgICAgIC0gY29uc3Q6IGZzbCxpbXg1My1lY3NwaQogICAgICAtIGl0ZW1zOgog
ICAgICAgICAgLSBlbnVtOgogICAgICAgICAgICAgIC0gZnNsLGlteDUwLWVjc3BpCiAgICAgICAg
ICAgICAgLSBmc2wsaW14NnEtZWNzcGkKICAgICAgICAgICAgICAtIGZzbCxpbXg2c3gtZWNzcGkK
ICAgICAgICAgICAgICAtIGZzbCxpbXg2c2wtZWNzcGkKICAgICAgICAgICAgICAtIGZzbCxpbXg2
c2xsLWVjc3BpCiAgICAgICAgICAgICAgLSBmc2wsaW14NnVsLWVjc3BpCiAgICAgICAgICAgICAg
LSBmc2wsaW14N2QtZWNzcGkKICAgICAgICAgICAgICAtIGZzbCxpbXg4bXEtZWNzcGkKICAgICAg
ICAgICAgICAtIGZzbCxpbXg4bW0tZWNzcGkKICAgICAgICAgICAgICAtIGZzbCxpbXg4bW4tZWNz
cGkKICAgICAgICAgICAgICAtIGZzbCxpbXg4bXAtZWNzcGkKICAgICAgICAgIC0gY29uc3Q6IGZz
bCxpbXg1MS1lY3NwaQoKaHR0cHQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5l
bC9naXQvdG9ydmFsZHMvbGludXguZ2l0L3RyZWUvZHJpdmVycy9zcGkvc3BpLWlteC5jP2g9djUu
MTgtcmM0I24xMDYzCnN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIHNwaV9pbXhfZHRf
aWRzW10gPSB7Cgl7IC5jb21wYXRpYmxlID0gImZzbCxpbXgxLWNzcGkiLCAuZGF0YSA9ICZpbXgx
X2NzcGlfZGV2dHlwZV9kYXRhLCB9LAoJeyAuY29tcGF0aWJsZSA9ICJmc2wsaW14MjEtY3NwaSIs
IC5kYXRhID0gJmlteDIxX2NzcGlfZGV2dHlwZV9kYXRhLCB9LAoJeyAuY29tcGF0aWJsZSA9ICJm
c2wsaW14MjctY3NwaSIsIC5kYXRhID0gJmlteDI3X2NzcGlfZGV2dHlwZV9kYXRhLCB9LAoJeyAu
Y29tcGF0aWJsZSA9ICJmc2wsaW14MzEtY3NwaSIsIC5kYXRhID0gJmlteDMxX2NzcGlfZGV2dHlw
ZV9kYXRhLCB9LAoJeyAuY29tcGF0aWJsZSA9ICJmc2wsaW14MzUtY3NwaSIsIC5kYXRhID0gJmlt
eDM1X2NzcGlfZGV2dHlwZV9kYXRhLCB9LAoJeyAuY29tcGF0aWJsZSA9ICJmc2wsaW14NTEtZWNz
cGkiLCAuZGF0YSA9ICZpbXg1MV9lY3NwaV9kZXZ0eXBlX2RhdGEsIH0sCgl7IC5jb21wYXRpYmxl
ID0gImZzbCxpbXg1My1lY3NwaSIsIC5kYXRhID0gJmlteDUzX2Vjc3BpX2RldnR5cGVfZGF0YSwg
fSwKCXsgLmNvbXBhdGlibGUgPSAiZnNsLGlteDZ1bC1lY3NwaSIsIC5kYXRhID0gJmlteDZ1bF9l
Y3NwaV9kZXZ0eXBlX2RhdGEsIH0sCgl7IC8qIHNlbnRpbmVsICovIH0KfTsKClJlZ2FyZHMsCk9s
ZWtzaWoKLS0gClBlbmd1dHJvbml4IGUuSy4gICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB8ClN0ZXVlcndhbGRlciBTdHIuIDIxICAgICAgICAg
ICAgICAgICAgICAgICB8IGh0dHA6Ly93d3cucGVuZ3V0cm9uaXguZGUvICB8CjMxMTM3IEhpbGRl
c2hlaW0sIEdlcm1hbnkgICAgICAgICAgICAgICAgICB8IFBob25lOiArNDktNTEyMS0yMDY5MTct
MCAgICB8CkFtdHNnZXJpY2h0IEhpbGRlc2hlaW0sIEhSQSAyNjg2ICAgICAgICAgICB8IEZheDog
ICArNDktNTEyMS0yMDY5MTctNTU1NSB8Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
