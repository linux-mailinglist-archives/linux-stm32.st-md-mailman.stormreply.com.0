Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE976D4094
	for <lists+linux-stm32@lfdr.de>; Mon,  3 Apr 2023 11:28:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0A2D6C65E70;
	Mon,  3 Apr 2023 09:28:28 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 42765C65E56
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Apr 2023 09:28:27 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[127.0.0.1]) by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <a.fatoum@pengutronix.de>)
 id 1pjGUE-0008BG-Kt; Mon, 03 Apr 2023 11:28:26 +0200
Message-ID: <a8cedf08-7b7d-712c-1c35-4da8d0542e72@pengutronix.de>
Date: Mon, 3 Apr 2023 11:28:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>,
 Steffen Trumtrar <s.trumtrar@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com
References: <20230330050408.3806093-1-s.trumtrar@pengutronix.de>
 <20230330050408.3806093-11-s.trumtrar@pengutronix.de>
 <31b1300b-7dd9-9bdf-be01-a79b1ac6e8cd@foss.st.com>
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <31b1300b-7dd9-9bdf-be01-a79b1ac6e8cd@foss.st.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v7 10/10] ARM: dts: stm32: add
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

SGVsbG8gQWxleGFuZHJlLAoKT24gMDMuMDQuMjMgMTE6MTUsIEFsZXhhbmRyZSBUT1JHVUUgd3Jv
dGU6Cj4gT24gMy8zMC8yMyAwNzowNCwgU3RlZmZlbiBUcnVtdHJhciB3cm90ZToKPj4gQWRkIHRo
ZSBQaHl0ZWMgU1RNMzJNUDEtMyBEZXYgYm9hcmQuIFRoZSBkZXZib2FyZCB1c2VzIGEgUGh5dGVj
Cj4+IHN0bTMybTE1N2Mtc29tLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBTdGVmZmVuIFRydW10cmFy
IDxzLnRydW10cmFyQHBlbmd1dHJvbml4LmRlPgo+PiAtLS0KCltzbmlwXQoKPj4gKy8gewo+PiAr
wqDCoMKgIG1vZGVsID0gIlBIWVRFQyBwaHlDT1JFLVNUTTMyTVAxLTMgRGV2IEJvYXJkIjsKPj4g
K8KgwqDCoCBjb21wYXRpYmxlID0gInBoeXRlYyxwaHljb3JlLXN0bTMybXAxLTMiLAo+PiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgICJwaHl0ZWMscGh5Y29yZS1zdG0zMm1wMTU3Yy1zb20iLCAi
c3Qsc3RtMzJtcDE1NyI7Cj4+ICsKPj4gK8KgwqDCoCBhbGlhc2VzIHsKPj4gK8KgwqDCoMKgwqDC
oMKgIG1tYzAgPSAmc2RtbWMxOwo+PiArwqDCoMKgwqDCoMKgwqAgbW1jMSA9ICZzZG1tYzI7Cj4+
ICvCoMKgwqDCoMKgwqDCoCBtbWMyID0gJnNkbW1jMzsKPiAKPiBtbWMgYWxpYXNlcyBhcmUgc3Rp
bGwgdXNlZCBpbiBsaW51eD8KClNpbmNlIGtlcm5lbCBjb21taXQgZmEyZDBhYTk2OTQxICgibW1j
OiBjb3JlOiBBbGxvdyBzZXR0aW5nIHNsb3QKaW5kZXggdmlhIGRldmljZSB0cmVlIGFsaWFzIikg
YWRkZWQgd2l0aCB2NS4xMC1yYzEsIGFsaWFzZXMKZGljdGF0ZSBrZXJuZWwgbnVtYmVyaW5nIG9m
IC9kZXYvbW1jYmxrIGRldmljZXMsIHNvIGl0J3MgZ29vZAp0byBoYXZlIHRoZXNlIGFsaWFzZXMg
Zm9yIGNvbnNpc3RlbmN5IGFzIHRoZSBhbHRlcm5hdGl2ZSBvZgp1c2luZyBQQVJUVVVJRCBicmVh
a3MgZG93biBvbmNlIHRoZSBzYW1lIGltYWdlIGlzIGZsYXNoZWQgdG8KYm90aCBTRCBhbmQgZU1N
QyBhbmQgdXNlIG9mIGFuIGluaXRyZCBpcyBub3QgYWx3YXlzIHByYWN0aWNhbC4KCj4+ICsmc2Rt
bWMxIHsKPj4gK8KgwqDCoCBzZWN1cmUtc3RhdHVzID0gImRpc2FibGVkIjsKPj4gK307Cj4+ICsK
Pj4gKyZzZG1tYzIgewo+PiArwqDCoMKgIHN0YXR1cyA9ICJva2F5IjsKPj4gK8KgwqDCoCBzZWN1
cmUtc3RhdHVzID0gImRpc2FibGVkIjsKPj4gK307Cj4gCj4gV2hhdCBpcyB0aGUgbmVlZCB0byBw
dXQgdGhlIHNlY3VyZSBzdGF0dXMgZGlzYWJsZWQgZm9yIFNETU1DIG5vZGVzID8KClRGLUEgcGFy
c2VzIHRoZW0sIGJ1dCBmb3IgU0RNTUMsIGl0IHNob3VsZCBoYXZlIG5vIGVmZmVjdCwgc28gSSBh
Z3JlZQp0aGV5IGNhbiBiZSByZW1vdmVkLgoKQ2hlZXJzLApBaG1hZAoKCi0tIApQZW5ndXRyb25p
eCBlLksuICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgfApTdGV1ZXJ3YWxkZXIgU3RyLiAyMSAgICAgICAgICAgICAgICAgICAgICAgfCBodHRw
Oi8vd3d3LnBlbmd1dHJvbml4LmRlLyAgfAozMTEzNyBIaWxkZXNoZWltLCBHZXJtYW55ICAgICAg
ICAgICAgICAgICAgfCBQaG9uZTogKzQ5LTUxMjEtMjA2OTE3LTAgICAgfApBbXRzZ2VyaWNodCBI
aWxkZXNoZWltLCBIUkEgMjY4NiAgICAgICAgICAgfCBGYXg6ICAgKzQ5LTUxMjEtMjA2OTE3LTU1
NTUgfAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtc3RtMzIK
