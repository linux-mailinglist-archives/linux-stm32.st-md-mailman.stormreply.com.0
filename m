Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AF145A25A67
	for <lists+linux-stm32@lfdr.de>; Mon,  3 Feb 2025 14:10:30 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6D85BC78F7C;
	Mon,  3 Feb 2025 13:10:30 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1C788CFAC50
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Feb 2025 13:10:23 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mkl@pengutronix.de>)
 id 1tewDL-0003ae-Ae; Mon, 03 Feb 2025 14:10:11 +0100
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b]
 helo=bjornoya.blackshift.org)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <mkl@pengutronix.de>) id 1tewDK-003IYN-0p;
 Mon, 03 Feb 2025 14:10:10 +0100
Received: from pengutronix.de (unknown
 [IPv6:2a01:4f8:1c1c:29e9:22:41ff:fe00:1400])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (Client did not present a certificate)
 (Authenticated sender: mkl-all@blackshift.org)
 by smtp.blackshift.org (Postfix) with ESMTPSA id BB1113B7A82;
 Mon, 03 Feb 2025 13:10:07 +0000 (UTC)
Date: Mon, 3 Feb 2025 14:10:06 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Message-ID: <20250203-congenial-falcon-of-destiny-43b5c0-mkl@pengutronix.de>
References: <20250121-lxa-fairytux-v3-0-8d42d7d232fb@pengutronix.de>
 <173764775141.3793586.6690578690442295161.robh@kernel.org>
 <20250123-urban-belligerent-bullfinch-2fa9e6-mkl@pengutronix.de>
 <8f28bbc1-1ada-41b2-bff2-5ad549c934a5@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8f28bbc1-1ada-41b2-bff2-5ad549c934a5@foss.st.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: "Rob Herring \(Arm\)" <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 kernel@pengutronix.de, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Leonard =?utf-8?B?R8O2aHJz?= <l.goehrs@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH stm32-next v3 0/2] ARM: dts: stm32:
 lxa-fairytux2: add gen{1, 2} boards
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

T24gMDMuMDIuMjAyNSAxMzowMDoxMywgQWxleGFuZHJlIFRPUkdVRSB3cm90ZToKPiA+ID4gTXkg
Ym90IGZvdW5kIG5ldyBEVEIgd2FybmluZ3Mgb24gdGhlIC5kdHMgZmlsZXMgYWRkZWQgb3IgY2hh
bmdlZCBpbiB0aGlzCj4gPiA+IHNlcmllcy4KPiA+IAo+ID4gVGhpcyBwYXRjaCBkb2Vzbid0IHRv
dWNoIHRoZSBvZmZlbmRpbmcgZmlsZSAic3RlLWhyZWZ2NjBwbHVzLXR2ay5kdGIiLgo+ID4gTWln
aHQgYmUgYSBuZXcgd2FybmluZywgYnV0IG5vdCBkdWUgdG8gdGhpcyBwYXRjaCwgY291bGQgdGhp
cyBiZSBhIGZhbHNlCj4gPiBwb3NpdGl2ZT8KPiAKPiBDYW4geW91IHJlcHJvZHVjZSA/CgpOb3Bl
IQoKPiBPbiBteSBzaWRlIEkgY2FuJ3QuIEFzIHlvdSBzYWlkIHRoZSByZXBvcnRlZCBlcnJvciBo
YXMKPiBubyBsaW5rIHdpdGggeW91ciBwYXRjaC4gSSdsbCBtZXJnZSBpdC4KClRoYW5rcywKTWFy
YwoKLS0gClBlbmd1dHJvbml4IGUuSy4gICAgICAgICAgICAgICAgIHwgTWFyYyBLbGVpbmUtQnVk
ZGUgICAgICAgICAgfApFbWJlZGRlZCBMaW51eCAgICAgICAgICAgICAgICAgICB8IGh0dHBzOi8v
d3d3LnBlbmd1dHJvbml4LmRlIHwKVmVydHJldHVuZyBOw7xybmJlcmcgICAgICAgICAgICAgIHwg
UGhvbmU6ICs0OS01MTIxLTIwNjkxNy0xMjkgfApBbXRzZ2VyaWNodCBIaWxkZXNoZWltLCBIUkEg
MjY4NiB8IEZheDogICArNDktNTEyMS0yMDY5MTctOSAgIHwKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4
LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
