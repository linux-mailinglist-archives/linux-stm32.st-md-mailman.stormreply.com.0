Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A89A37E3B
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Feb 2025 10:17:29 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 50FC7C78F86;
	Mon, 17 Feb 2025 09:17:29 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 83C99C78F68
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Feb 2025 09:17:22 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1tjxFZ-0008U5-7G; Mon, 17 Feb 2025 10:17:13 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e]
 helo=lupine)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <p.zabel@pengutronix.de>) id 1tjxFX-001Nlp-37;
 Mon, 17 Feb 2025 10:17:11 +0100
Received: from pza by lupine with local (Exim 4.96)
 (envelope-from <p.zabel@pengutronix.de>) id 1tjxFX-000479-2q;
 Mon, 17 Feb 2025 10:17:11 +0100
Message-ID: <67fe157ce8ca3c3c4e08451da52f7c94f73439b2.camel@pengutronix.de>
From: Philipp Zabel <p.zabel@pengutronix.de>
To: patrice.chotard@foss.st.com, Mark Brown <broonie@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>,  Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, Catalin
 Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Date: Mon, 17 Feb 2025 10:17:11 +0100
In-Reply-To: <20250210131826.220318-2-patrice.chotard@foss.st.com>
References: <20250210131826.220318-1-patrice.chotard@foss.st.com>
 <20250210131826.220318-2-patrice.chotard@foss.st.com>
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 1/8] dt-bindings: spi: Add STM32 OSPI
	controller
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

T24gTW8sIDIwMjUtMDItMTAgYXQgMTQ6MTggKzAxMDAsIHBhdHJpY2UuY2hvdGFyZEBmb3NzLnN0
LmNvbSB3cm90ZToKPiBGcm9tOiBQYXRyaWNlIENob3RhcmQgPHBhdHJpY2UuY2hvdGFyZEBmb3Nz
LnN0LmNvbT4KPiAKPiBBZGQgZGV2aWNlIHRyZWUgYmluZGluZ3MgZm9yIHRoZSBTVE0zMiBPU1BJ
IGNvbnRyb2xsZXIuCj4gCj4gTWFpbiBmZWF0dXJlcyBvZiB0aGUgT2N0by1TUEkgY29udHJvbGxl
ciA6Cj4gICAtIHN1cHBvcnQgc05PUiAvIHNOQU5EIC8gSHlwZXJSQU3ihKIgYW5kIEh5cGVyRmxh
c2jihKIgZGV2aWNlcy4KPiAgIC0gVGhyZWUgZnVuY3Rpb25hbCBtb2RlczogaW5kaXJlY3QsIGF1
dG9tYXRpYy1zdGF0dXMgcG9sbGluZywKPiAgICAgbWVtb3J5LW1hcHBlZC4KPiAgIC0gVXAgdG8g
NCBHYnl0ZXMgb2YgZXh0ZXJuYWwgbWVtb3J5IGNhbiBiZSBhZGRyZXNzZWQgaW4gaW5kaXJlY3QK
PiAgICAgbW9kZSAocGVyIHBoeXNpY2FsIHBvcnQgYW5kIHBlciBDUyksIGFuZCB1cCB0byAyNTYg
TWJ5dGVzIGluCj4gICAgIG1lbW9yeS1tYXBwZWQgbW9kZSAoY29tYmluZWQgZm9yIGJvdGggcGh5
c2ljYWwgcG9ydHMgYW5kIHBlciBDUykuCj4gICAtIFNpbmdsZS0sIGR1YWwtLCBxdWFkLSwgYW5k
IG9jdGFsLVNQSSBjb21tdW5pY2F0aW9uLgo+ICAgLSBEdWFsLXF1YWQgY29tbXVuaWNhdGlvbi4K
PiAgIC0gU2luZ2xlIGRhdGEgcmF0ZSAoU0RSKSBhbmQgZG91YmxlIHRyYW5zZmVyIHJhdGUgKERU
UikuCj4gICAtIE1heGltdW0gdGFyZ2V0IGZyZXF1ZW5jeSBpcyAxMzMgTUh6IGZvciBTRFIgYW5k
IDEzMyBNSHogZm9yIERUUi4KPiAgIC0gRGF0YSBzdHJvYmUgc3VwcG9ydC4KPiAgIC0gRE1BIGNo
YW5uZWwgZm9yIGluZGlyZWN0IG1vZGUuCj4gICAtIERvdWJsZSBDUyBtYXBwaW5nIHRoYXQgYWxs
b3dzIHR3byBleHRlcm5hbCBmbGFzaCBkZXZpY2VzIHRvIGJlCj4gICAgIGFkZHJlc3NlZCB3aXRo
IGEgc2luZ2xlIE9DVE9TUEkgY29udHJvbGxlciBtYXBwZWQgb24gYSBzaW5nbGUKPiAgICAgT0NU
T1NQSSBwb3J0Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IFBhdHJpY2UgQ2hvdGFyZCA8cGF0cmljZS5j
aG90YXJkQGZvc3Muc3QuY29tPgo+IC0tLQo+ICAuLi4vYmluZGluZ3Mvc3BpL3N0LHN0bTMybXAy
NS1vc3BpLnlhbWwgICAgICAgfCAxMDUgKysrKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFu
Z2VkLCAxMDUgaW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NwaS9zdCxzdG0zMm1wMjUtb3NwaS55YW1sCj4gCj4gZGlm
ZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zcGkvc3Qsc3RtMzJt
cDI1LW9zcGkueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zcGkvc3Qs
c3RtMzJtcDI1LW9zcGkueWFtbAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAw
MDAwMDAwLi41ZjI3NmYyN2RjNGMKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NwaS9zdCxzdG0zMm1wMjUtb3NwaS55YW1sCj4gQEAgLTAs
MCArMSwxMDUgQEAKPiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAtb25seSBP
UiBCU0QtMi1DbGF1c2UpCj4gKyVZQU1MIDEuMgo+ICstLS0KPiArJGlkOiBodHRwOi8vZGV2aWNl
dHJlZS5vcmcvc2NoZW1hcy9zcGkvc3Qsc3RtMzJtcDI1LW9zcGkueWFtbCMKPiArJHNjaGVtYTog
aHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjCj4gKwo+ICt0aXRs
ZTogU1RNaWNyb2VsZWN0cm9uaWNzIFNUTTMyIE9jdGFsIFNlcmlhbCBQZXJpcGhlcmFsIEludGVy
ZmFjZSAoT1NQSSkKPiArCj4gK21haW50YWluZXJzOgo+ICsgIC0gUGF0cmljZSBDaG90YXJkIDxw
YXRyaWNlLmNob3RhcmRAZm9zcy5zdC5jb20+Cj4gKwo+ICthbGxPZjoKPiArICAtICRyZWY6IHNw
aS1jb250cm9sbGVyLnlhbWwjCj4gKwo+ICtwcm9wZXJ0aWVzOgo+ICsgIGNvbXBhdGlibGU6Cj4g
KyAgICBjb25zdDogc3Qsc3RtMzJtcDI1LW9zcGkKPiArCj4gKyAgcmVnOgo+ICsgICAgbWF4SXRl
bXM6IDEKPiArCj4gKyAgbWVtb3J5LXJlZ2lvbjoKPiArICAgIGRlc2NyaXB0aW9uOgo+ICsgICAg
ICBNZW1vcnkgcmVnaW9uIHRvIGJlIHVzZWQgZm9yIG1lbW9yeS1tYXAgcmVhZCBhY2Nlc3MuCj4g
KyAgICAgIEluIG1lbW9yeS1tYXBwZWQgbW9kZSwgcmVhZCBhY2Nlc3MgYXJlIHBlcmZvcm1lZCBm
cm9tIHRoZSBtZW1vcnkKPiArICAgICAgZGV2aWNlIHVzaW5nIHRoZSBkaXJlY3QgbWFwcGluZy4K
PiArICAgIG1heEl0ZW1zOiAxCj4gKwo+ICsgIGNsb2NrczoKPiArICAgIG1heEl0ZW1zOiAxCj4g
Kwo+ICsgIGludGVycnVwdHM6Cj4gKyAgICBtYXhJdGVtczogMQo+ICsKPiArICByZXNldHM6Cj4g
KyAgICBpdGVtczoKPiArICAgICAgLSBkZXNjcmlwdGlvbjogcGhhbmRsZSB0byBPU1BJIGJsb2Nr
IHJlc2V0Cj4gKyAgICAgIC0gZGVzY3JpcHRpb246IHBoYW5kbGUgdG8gZGVsYXkgYmxvY2sgcmVz
ZXQKCkFyZSB5b3UgcG9zaXRpdmUgdGhhdCB0aGVzZSB3aWxsIG9ubHkgZXZlciBoYXZlIHRvIGJl
IHJlc2V0IHRvZ2V0aGVyPwpPdGhlcndpc2UgSSdkIGFkZCBhIHJlc2V0LW5hbWVzIHByb3BlcnR5
IGp1c3QgaW4gY2FzZS4KCnJlZ2FyZHMKUGhpbGlwcApfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3Rt
MzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
