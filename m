Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CFEFF9BDB22
	for <lists+linux-stm32@lfdr.de>; Wed,  6 Nov 2024 02:25:46 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 77648C71292;
	Wed,  6 Nov 2024 01:25:46 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BFC47C6C83A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 Nov 2024 01:25:39 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 78B3388D8D;
 Wed,  6 Nov 2024 02:25:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1730856339;
 bh=Z1yoKzgo8+wbpL0mDUyPIejCTWSCHY6sxQ3QEw31KAs=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=mYivpvwalNGXewCotlReMZWG1dRdUf1S1ohdtCbhS1fxo4ihlzs9T6d5R/MNBQ6AS
 wUZg2iduzOO0MalQemqPOVhRec8AiaDU8G4DYFtzq2iCFo8bYuYetiypuN30WjmHnU
 fHoaIYHmB0BE0vmVzSh+Ca3f8ZDxUrIg9crHRQxz/hDc1+daXd+f+aUeeIQRNzx0Lc
 pWmbTgQas5CWMwnaM+uXci77LmiFoVaznHl9Hiw2N83FSqyH3BmQzgkbFLY67nADZ5
 0TSCqxwQGO2liQh6vwn0qGU5bzfysD821pASO4NnzeUUe880EwBmLQn1cVufRbuPV3
 gmgvOdxUzSHcg==
Message-ID: <35a05978-a83f-4746-92cd-108b6586ac08@denx.de>
Date: Wed, 6 Nov 2024 01:30:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>,
 linux-arm-kernel@lists.infradead.org
References: <20241017190933.131441-1-marex@denx.de>
 <b616628b-f9e3-42dd-b5dd-e7aa0235daae@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <b616628b-f9e3-42dd-b5dd-e7aa0235daae@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel@dh-electronics.com, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2] ARM: dts: stm32: Describe M24256E
 write-lockable page in DH STM32MP13xx DHCOR SoM DT
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

T24gMTAvMjkvMjQgNDoyOCBQTSwgQWxleGFuZHJlIFRPUkdVRSB3cm90ZToKPiBIaSBNYXJlawo+
IAo+IE9uIDEwLzE3LzI0IDIxOjA5LCBNYXJlayBWYXN1dCB3cm90ZToKPj4gVGhlIFNUTTMyTVAx
M3h4IERIQ09SIFNvTSBpcyBwb3B1bGF0ZWQgd2l0aCBNMjQyNTZFIEVFUFJPTSB3aGljaCBoYXMK
Pj4gQWRkaXRpb25hbCBXcml0ZSBsb2NrYWJsZSBwYWdlIGF0IHNlcGFyYXRlIEkyQyBhZGRyZXNz
LiBEZXNjcmliZSB0aGUKPj4gcGFnZSBpbiBEVCB0byBtYWtlIGl0IGF2YWlsYWJsZS4KPj4KPj4g
Tm90ZSB0aGF0IHRoZSBXTFAgcGFnZSBvbiB0aGlzIGRldmljZSBpcyBoYXJkd2FyZSB3cml0ZS1w
cm90ZWN0ZWQgYnkKPj4gUjM3IHdoaWNoIHB1bGxzIHRoZSBuV0Mgc2lnbmFsIGhpZ2ggdG8gVkRE
XzNWM18xVjggcG93ZXIgcmFpbC4KPj4KPj4gU2lnbmVkLW9mZi1ieTogTWFyZWsgVmFzdXQgPG1h
cmV4QGRlbnguZGU+Cj4+IC0tLQo+PiBDYzogQWxleGFuZHJlIFRvcmd1ZSA8YWxleGFuZHJlLnRv
cmd1ZUBmb3NzLnN0LmNvbT4KPj4gQ2M6IENocmlzdG9waCBOaWVkZXJtYWllciA8Y25pZWRlcm1h
aWVyQGRoLWVsZWN0cm9uaWNzLmNvbT4KPj4gQ2M6IENvbm9yIERvb2xleSA8Y29ub3IrZHRAa2Vy
bmVsLm9yZz4KPj4gQ2M6IEtyenlzenRvZiBLb3psb3dza2kgPGtyemsrZHRAa2VybmVsLm9yZz4K
Pj4gQ2M6IE1heGltZSBDb3F1ZWxpbiA8bWNvcXVlbGluLnN0bTMyQGdtYWlsLmNvbT4KPj4gQ2M6
IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Cj4+IENjOiBkZXZpY2V0cmVlQHZnZXIua2Vy
bmVsLm9yZwo+PiBDYzoga2VybmVsQGRoLWVsZWN0cm9uaWNzLmNvbQo+PiBDYzogbGludXgtYXJt
LWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCj4+IENjOiBsaW51eC1rZXJuZWxAdmdlci5rZXJu
ZWwub3JnCj4+IENjOiBsaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCj4+
IC0tLQo+PiBWMjogRml4IHVwIHRoZSBNMjUyNTZFIGluIFN1YmplY3QKPj4gLS0tCj4+IERFUEVO
RFM6Cj4+IC0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtaTJjLzIwMjQxMDE3MTg0MTUy
LjEyODM5NS0xLSAKPj4gbWFyZXhAZGVueC5kZS8KPj4gLSBodHRwczovL2xvcmUua2VybmVsLm9y
Zy9saW51eC1pMmMvMjAyNDEwMTcxODQxNTIuMTI4Mzk1LTItIAo+PiBtYXJleEBkZW54LmRlLwo+
PiAtLS0KPj4gwqAgYXJjaC9hcm0vYm9vdC9kdHMvc3Qvc3RtMzJtcDEzeHgtZGhjb3Itc29tLmR0
c2kgfCA2ICsrKysrKwo+PiDCoCAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCj4+Cj4+
IGRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9zdC9zdG0zMm1wMTN4eC1kaGNvci1zb20u
ZHRzaSBiL2FyY2gvIAo+PiBhcm0vYm9vdC9kdHMvc3Qvc3RtMzJtcDEzeHgtZGhjb3Itc29tLmR0
c2kKPj4gaW5kZXggNWM2MzNlZDU0OGYzNy4uMDcxMzNiZDgyZWZhNiAxMDA2NDQKPj4gLS0tIGEv
YXJjaC9hcm0vYm9vdC9kdHMvc3Qvc3RtMzJtcDEzeHgtZGhjb3Itc29tLmR0c2kKPj4gKysrIGIv
YXJjaC9hcm0vYm9vdC9kdHMvc3Qvc3RtMzJtcDEzeHgtZGhjb3Itc29tLmR0c2kKPj4gQEAgLTIw
Miw2ICsyMDIsMTIgQEAgZWVwcm9tMDogZWVwcm9tQDUwIHsKPj4gwqDCoMKgwqDCoMKgwqDCoMKg
IHBhZ2VzaXplID0gPDY0PjsKPj4gwqDCoMKgwqDCoCB9Owo+PiArwqDCoMKgIGVlcHJvbTB3bDog
ZWVwcm9tQDU4IHsKPj4gK8KgwqDCoMKgwqDCoMKgIGNvbXBhdGlibGUgPSAic3QsMjQyNTZlLXds
IjvCoMKgwqAgLyogU1QgTTI0MjU2RSBXTCBwYWdlIG9mIDB4NTAgKi8KPj4gK8KgwqDCoMKgwqDC
oMKgIHBhZ2VzaXplID0gPDY0PjsKPj4gK8KgwqDCoMKgwqDCoMKgIHJlZyA9IDwweDU4PjsKPj4g
K8KgwqDCoCB9Owo+PiArCj4gCj4gWW91IGNvdWxkIGhhdmUgc29ydGVkIG5vZGVzIGJ5IEkyQyBh
ZGRyZXNzZXMuCkZpeGVkIGluIFtQQVRDSF0gQVJNOiBkdHM6IHN0bTMyOiBTb3J0IE0yNDI1NkUg
d3JpdGUtbG9ja2FibGUgcGFnZSBpbiBESCAKU1RNMzJNUDEzeHggREhDT1IgU29NIERUCgpTb3Jy
eS4KCihJIGFsc28gd3JvdGUgbWUgYSBzb3J0aW5nIHRvb2wgaW4gdGhlIG1lYW50aW1lLCBidXQg
aXQgc3RpbGwgaXNuJ3QgdG9vIApnb29kKQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
