Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 702CD9E5802
	for <lists+linux-stm32@lfdr.de>; Thu,  5 Dec 2024 14:58:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2EE8FC7801A;
	Thu,  5 Dec 2024 13:58:21 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E32F8C7129D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Dec 2024 13:58:13 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[127.0.0.1])
 by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <a.fatoum@pengutronix.de>)
 id 1tJCMh-0000kQ-S9; Thu, 05 Dec 2024 14:57:59 +0100
Message-ID: <361b3a14-db86-4c3c-9f07-4ebc1dd40d0e@pengutronix.de>
Date: Thu, 5 Dec 2024 14:57:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>,
 Oleksij Rempel <o.rempel@pengutronix.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <20240806120517.406714-1-o.rempel@pengutronix.de>
 <20dc2cd4-7684-4894-9db3-23c3f4abd661@pengutronix.de>
 <a483fb50-f978-4e48-b38e-6d79632540f1@foss.st.com>
Content-Language: en-US
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <a483fb50-f978-4e48-b38e-6d79632540f1@foss.st.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@pengutronix.de,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v1] arm: dts: st: stm32mp151a-prtt1l: Fix
 QSPI configuration
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

SGVsbG8gQWxleCwKCk9uIDI5LjEwLjI0IDE2OjM5LCBBbGV4YW5kcmUgVE9SR1VFIHdyb3RlOgo+
IE9uIDgvNy8yNCAxMTozOCwgQWhtYWQgRmF0b3VtIHdyb3RlOgo+PiBIZWxsbyBPbGVrc2lqLAo+
Pgo+PiBPbiAwNi4wOC4yNCAxNDowNSwgT2xla3NpaiBSZW1wZWwgd3JvdGU6Cj4+IFRoZXJlJ3Mg
Ymlhcy1kaXNhYmxlIGluIHN0bTMybXAxNS1waW5jdHJsLmR0c2kuIFlvdSBtYXkgd2FudCB0byBh
ZGQKPj4gYSAvZGVsZXRlLXByb3BlcnR5LyBmb3IgdGhhdCB0byBtYWtlIHN1cmUsIGl0J3Mgbm90
IHVwIHRvIHRoZSBkcml2ZXIKPj4gd2hpY2ggb25lIGhhcyBwcmlvcml0eS4KPj4KPj4+IMKgwqDC
oMKgwqDCoMKgwqDCoCBkcml2ZS1wdXNoLXB1bGw7Cj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgc2xl
dy1yYXRlID0gPDE+Owo+Pgo+PiBUaGVzZSBhcmUgYWxyZWFkeSBpbiBxc3BpX2JrMV9waW5zX2Eu
IElmIHJlcGVhdGluZyB0aG9zZSBpcyBvaywgd2h5Cj4+IG5vdCBnbyBhIHN0ZXAgZnVydGhlciBh
bmQganVzdCBkdXBsaWNhdGUgdGhlIHBpbm11eCBwcm9wZXJ0eSBhbmQgc3RheQo+PiBjbGVhciBv
ZiB0aGlzIGlzc3VlIGFsdG9nZXRoZXIsIHByb3ZpZGVkIEFsZXggaXMgYW1lbmFibGUgdG8gY2hh
bmdpbmcKPj4gaGlzIG1pbmQgcmVnYXJkaW5nIHBpbmN0cmwgZ3JvdXBzIGluIGJvYXJkIGRldmlj
ZSB0cmVlcy4KPiAKPiBJIHN0aWxsIHByZWZlciB0byBoYXZlIHBpbiBjb25maWd1cmF0aW9uIGRl
ZmluZWQgaW4gcGluY3RybCBkdHNpIGZpbGUgYW5kIEknbGwgY29udGludWUgbGlrZSB0aGlzIGZv
ciBTVCBib2FyZC4gVGhlIHJlYXNvbiBpcyB0aGF0IHdlIHRyeSB0byByZXVzZSBhcyBtdWNoIGFz
IHBvc3NpYmxlIHBpbnMgd2hlbiB3ZSBjcmVhdGUgYSBuZXcgYm9hcmQgYW5kIHNvIGl0IGlzIGVh
c2llciB0byBtYWludGFpbiBpZiB3ZSBkZWNsYXJlIHRoZW0gb25seSBvbmUgdGltZS4KCkkgY2Fu
IHNlZSB0aGUgcG9pbnQgZm9yIFNUIGV2YWx1YXRpb24ga2l0cyBhcyBTVCBjdXN0b21lciBoYXJk
d2FyZQp3aWxsIG9mdGVuIGNvcHkgdGhlIHJlZmVyZW5jZSBkZXNpZ25zLgoKPiBCdXQsIEknbSBu
b3QgYmxvY2tlZCBmb3IgIm90aGVyIiBib2FyZHMgYmFzZWQgb24gU1RNMzIgU29DLiBJIG1lYW4s
IGlmIGl0IGlzIHNpbXBsZXIgZm9yIHlvdSBhbmQgYWJvdmUgYWxsIGlmIGl0IGF2b2lkIGlzc3Vl
cy9jb21wbGV4aXRpZXMgdGhlbiwgeW91IGNhbiBkZWNsYXJlIHNvbWUgcGluIGdyb3VwcyBpbiB5
b3VyIGJvYXJkIGR0cyBmaWxlLiBJbiB0aGlzIGNhc2Ugd2UgbmVlZCB0byB0YWtlIGNhcmUgb2Yg
dGhlIElPIGdyb3VwcyBsYWJlbCBuYW1lLgoKVGhhdCdzIGdvb2QgdG8gaGVhciBhbmQgd2hhdCBJ
IHdhbnRlZCB0byBjbGFyaWZ5LiBFc3BlY2lhbGx5IGZvciB0aGluZ3MgbGlrZQpBRENzLCB0aGVy
ZSBhcmUgc28gbWFueSBwb3NzaWJsZSBwZXJtdXRhdGlvbnMgdGhhdCB0aGVyZSBpcyBubyBwb2lu
dCBmb3IKYm9hcmRzIHRvIGFkZCB0aGVpciBwaW5jdHJsIGdyb3VwIHRvIHRoZSBtYWluIERUU0kg
aW5zdGVhZCBvZiBqdXN0IGxpc3RpbmcKdGhlaXIgc3BlY2lmaWMgcGluIGNvbmZpZ3VyYXRpb24g
aW4gdGhlIGJvYXJkIERUUy4KClRoYW5rcywKQWhtYWQKCj4gCj4gcmVnYXJkcwo+IGFsZXgKPiAK
Pj4KPj4KPj4gQ2hlZXJzLAo+PiBBaG1hZAo+Pgo+IAoKCi0tIApQZW5ndXRyb25peCBlLksuICAg
ICAgICAgICAgICAgICAgICAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfApT
dGV1ZXJ3YWxkZXIgU3RyLiAyMSAgICAgICAgICAgICAgICAgICAgICAgfCBodHRwOi8vd3d3LnBl
bmd1dHJvbml4LmRlLyAgfAozMTEzNyBIaWxkZXNoZWltLCBHZXJtYW55ICAgICAgICAgICAgICAg
ICAgfCBQaG9uZTogKzQ5LTUxMjEtMjA2OTE3LTAgICAgfApBbXRzZ2VyaWNodCBIaWxkZXNoZWlt
LCBIUkEgMjY4NiAgICAgICAgICAgfCBGYXg6ICAgKzQ5LTUxMjEtMjA2OTE3LTU1NTUgfApfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBt
YWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRw
czovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1z
dG0zMgo=
