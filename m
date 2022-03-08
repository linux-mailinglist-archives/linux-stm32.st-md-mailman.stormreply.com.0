Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 65A744D1409
	for <lists+linux-stm32@lfdr.de>; Tue,  8 Mar 2022 10:58:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 05D72C60469;
	Tue,  8 Mar 2022 09:58:38 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 22206C5F1F1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  8 Mar 2022 09:58:36 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[127.0.0.1])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <a.fatoum@pengutronix.de>)
 id 1nRWbo-00070Z-K6; Tue, 08 Mar 2022 10:58:24 +0100
Message-ID: <2ed036b4-5a0a-f017-17e3-7922fcc2e8cc@pengutronix.de>
Date: Tue, 8 Mar 2022 10:58:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Content-Language: en-US
To: Gabriel FERNANDEZ <gabriel.fernandez@foss.st.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
References: <20220225133137.813919-1-gabriel.fernandez@foss.st.com>
 <20220225133137.813919-13-gabriel.fernandez@foss.st.com>
 <1d90078d-e27f-539d-d010-78a3c4da565a@pengutronix.de>
 <65581f3a-3ae6-2dd3-7571-1e64982b5f50@foss.st.com>
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <65581f3a-3ae6-2dd3-7571-1e64982b5f50@foss.st.com>
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Etienne Carriere <etienne.carriere@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 12/13] ARM: dts: stm32: enable optee
 firmware and SCMI support on STM32MP13
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

SGVsbyBHYWJyaWVsLAoKT24gMDMuMDMuMjIgMTQ6MDksIEdhYnJpZWwgRkVSTkFOREVaIHdyb3Rl
Ogo+IAo+IE9uIDIvMjUvMjIgMTY6MTMsIEFobWFkIEZhdG91bSB3cm90ZToKPj4gSGVsbG8gR2Fi
cmllbCwKPj4KPj4gT24gMjUuMDIuMjIgMTQ6MzEsIGdhYnJpZWwuZmVybmFuZGV6QGZvc3Muc3Qu
Y29tIHdyb3RlOgo+Pj4gRnJvbTogR2FicmllbCBGZXJuYW5kZXogPGdhYnJpZWwuZmVybmFuZGV6
QGZvc3Muc3QuY29tPgo+Pj4gK8KgwqDCoCBmaXJtd2FyZSB7Cj4+PiArwqDCoMKgwqDCoMKgwqAg
b3B0ZWUgewo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbWV0aG9kID0gInNtYyI7Cj4+PiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb21wYXRpYmxlID0gImxpbmFybyxvcHRlZS10eiI7Cj4+
PiArwqDCoMKgwqDCoMKgwqAgfTsKPj4+ICsKPj4+ICvCoMKgwqDCoMKgwqDCoCBzY21pOiBzY21p
IHsKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbXBhdGlibGUgPSAibGluYXJvLHNjbWkt
b3B0ZWUiOwo+PiBUaGlzIGNvbXBhdGlibGUgZG9lc24ndCBzZWVtIHRvIGJlIGRvY3VtZW50ZWQg
dXBzdHJlYW0uIEkgYW0gbG9va2luZyBhdCB2NS4xNy1yYzUuCj4+IERvIHlvdSBoYXZlIGEgcmVm
ZXJlbmNlIGRldGFpbGluZyB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIHRoaXMgY29uZHVpdCBhbmQK
Pj4gcGxhaW4gYXJtLHNjbWktc21jIChhcyB1c2VkIHdpdGggVEYtQSBvbiB0aGUgU1RNMzJNUDE1
MSkuCj4+Cj4+IENoZWVycywKPj4gQWhtYWQKPiAKPiBIaQo+IAo+IEFobWFkLAo+IAo+IGl0J3Mg
b24gZ29pbmcuCj4gCj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtYXJtLWtlcm5lbC8y
MDIxMTAyOTEwMjExOC5HRzY1MjZAZTEyMDkzNy1saW4vVC8jbWY0NmM4M2YwYWFkY2UzMDYxZWU5
M2ZhMjIxNTk0MDVmMzhkODgxYTAKCkkndmUgZm91bmQgdGhhdCB0aHJlYWQgaW4gdGhlIG1lYW50
aW1lIGFuZCBnb3Qgc29tZSBjbGFyaWZpY2F0aW9uIG9uIHdoeSBhIG5ldwp0cmFuc3BvcnQgZm9y
IE9QLVRFRSB3YXMgYWRkZWQuIE9uZSBxdWVzdGlvbiBJIHN0aWxsIGhhdmUgdGhvdWdoIGlzIHdo
eSBtYWtlCnRoaXMgdHJhbnNwb3J0IHRoZSBkZWZhdWx0IGZvciBTVE0zMk1QMTN4IGluc3RlYWQg
b2YgdXNpbmcgU0NNSSBvdmVyIFNNQyBsaWtlCnlvdSBkbyBmb3IgU1RNMzJNUDE1eC4gT1AtVEVF
IGNvdWxkIHN0aWxsIGJlIG1hZGUgdG8gc2VydmljZSBTQ01JIG92ZXIgU01DCmFuZCBpdCB3b3Vs
ZCBhbGxvdyBwZW9wbGUgZW1wbG95aW5nIFRGLUEgYXMgU0NNSSBwcm92aWRlciBhbiBlYXNpZXIg
bWlncmF0aW9uCnRvIHRoZSBuZXdlciBTb0MuCgpDaGVlcnMsCkFobWFkCgo+IAo+Pgo+Pj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgI2FkZHJlc3MtY2VsbHMgPSA8MT47Cj4+PiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCAjc2l6ZS1jZWxscyA9IDwwPjsKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGxpbmFybyxvcHRlZS1jaGFubmVsLWlkID0gPDA+Owo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgc2htZW0gPSA8JnNjbWlfc2htPjsKPj4+ICsKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHNjbWlfY2xrOiBwcm90b2NvbEAxNCB7Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHJlZyA9IDwweDE0PjsKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
I2Nsb2NrLWNlbGxzID0gPDE+Owo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfTsKPj4+ICsK
Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNjbWlfcmVzZXQ6IHByb3RvY29sQDE2IHsKPj4+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmVnID0gPDB4MTY+Owo+Pj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAjcmVzZXQtY2VsbHMgPSA8MT47Cj4+PiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCB9Owo+Pj4gK8KgwqDCoMKgwqDCoMKgIH07Cj4+PiArwqDCoMKgIH07
Cj4+PiDCoMKgwqDCoMKgIGNsb2NrcyB7Cj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgY2xrX2F4aTog
Y2xrLWF4aSB7Cj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAjY2xvY2stY2VsbHMgPSA8
MD47Cj4+Cj4gCgoKLS0gClBlbmd1dHJvbml4IGUuSy4gICAgICAgICAgICAgICAgICAgICAgICAg
ICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ClN0ZXVlcndhbGRlciBTdHIuIDIxICAg
ICAgICAgICAgICAgICAgICAgICB8IGh0dHA6Ly93d3cucGVuZ3V0cm9uaXguZGUvICB8CjMxMTM3
IEhpbGRlc2hlaW0sIEdlcm1hbnkgICAgICAgICAgICAgICAgICB8IFBob25lOiArNDktNTEyMS0y
MDY5MTctMCAgICB8CkFtdHNnZXJpY2h0IEhpbGRlc2hlaW0sIEhSQSAyNjg2ICAgICAgICAgICB8
IEZheDogICArNDktNTEyMS0yMDY5MTctNTU1NSB8Cl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0z
MkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
