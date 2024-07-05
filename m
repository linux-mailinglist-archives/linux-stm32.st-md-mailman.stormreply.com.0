Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AA12B9283EB
	for <lists+linux-stm32@lfdr.de>; Fri,  5 Jul 2024 10:42:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5A192C78013;
	Fri,  5 Jul 2024 08:42:44 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 004E0C6A613
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Jul 2024 08:42:38 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 40CD988607;
 Fri,  5 Jul 2024 10:42:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1720168957;
 bh=AhgpARrslt2x0WGsbi6JihJjV20w/M2+vGLOgJCyuwk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=iPBvR9AHlft7X07Qp3ZNQib9hp5M37CutIdub9BTL/PVz1Tbw3IuAwu3m2s9FqUDs
 t9W9x/ob+BucxO9VU47HQBA9fviyGJCF1QsY1hFDRO+RsDuUHs+OZGjQdDVw+pKS0X
 f5FoJkMCQvL8lDHDTG1dq68rh3JoZKDhZTczKqQgWknKkgXpOkLa1WqmCHAqI9tg48
 XuCQkRmGgtke1U+F9AYtf/tHs4xRs1YC3G2SUn+goBI0CQyDxkFb6AQEhC2AWDLHbI
 /sSVbSJpSz98t29P/u8K6X2wZ/jV44VH5ct8YSKvPFOIqQ43c06nJAz/f4h4SR2jzr
 9x4FqqdOLFfdw==
Message-ID: <06766b59-9a0a-4355-8270-210583cd9135@denx.de>
Date: Fri, 5 Jul 2024 10:25:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>,
 linux-arm-kernel@lists.infradead.org
References: <20240629202847.90693-1-marex@denx.de>
 <501e109a-478a-4f94-a673-27048b44e5d5@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <501e109a-478a-4f94-a673-27048b44e5d5@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 kernel@dh-electronics.com, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: Keep MDIO bus in AF
 across suspend DH STM32MP13xx DHCOR DHSBC board
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

T24gNy80LzI0IDY6MzggUE0sIEFsZXhhbmRyZSBUT1JHVUUgd3JvdGU6Cj4gSGkgTWFyZWsKPiAK
PiBPbiA2LzI5LzI0IDIyOjI4LCBNYXJlayBWYXN1dCB3cm90ZToKPj4gVGhlIFJUTDgyMTFGIFBI
WSBnZXRzIGNvbmZ1c2VkIHdoZW4gdGhlIE1ESU8gYnVzIGxpbmVzIGdldCBzd2l0Y2hlZAo+PiB0
byBBTkFMT0cgZHVyaW5nIHN1c3BlbmQvcmVzdW1lIGN5Y2xlLiBLZWVwIHRoZSBNRElPIGFuZCBN
REMgbGluZXMKPj4gaW4gQUYgZHVyaW5nIHN1c3BlbmQvcmVzdW1lIHRvIGF2b2lkIGNvbmZ1c2lu
ZyB0aGUgUEhZLiBUaGUgUEhZIGNhbgo+PiBiZSBicm91Z2h0IG91dCBvZiB0aGUgY29uZnVzZWQg
c3RhdGUgYnkgcmVzdGFydGluZyBhdXRvLW5lZ290aWF0aW9uCj4+IHRvbywgYnV0IHRoYXQgc2Vl
bXMgbGlrZSBhbiBvZGQgd29ya2Fyb3VuZCBhbmQgc2hvdWxkbid0IGJlIGluIHRoZQo+PiBQSFkg
ZHJpdmVyLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBNYXJlayBWYXN1dCA8bWFyZXhAZGVueC5kZT4K
Pj4gLS0tCj4+IENjOiBBbGV4YW5kcmUgVG9yZ3VlIDxhbGV4YW5kcmUudG9yZ3VlQGZvc3Muc3Qu
Y29tPgo+PiBDYzogQ2hyaXN0b3BoZSBSb3VsbGllciA8Y2hyaXN0b3BoZS5yb3VsbGllckBmb3Nz
LnN0LmNvbT4KPj4gQ2M6IENvbm9yIERvb2xleSA8Y29ub3IrZHRAa2VybmVsLm9yZz4KPj4gQ2M6
IEtyenlzenRvZiBLb3psb3dza2kgPGtyemsrZHRAa2VybmVsLm9yZz4KPj4gQ2M6IE1heGltZSBD
b3F1ZWxpbiA8bWNvcXVlbGluLnN0bTMyQGdtYWlsLmNvbT4KPj4gQ2M6IFJvYiBIZXJyaW5nIDxy
b2JoQGtlcm5lbC5vcmc+Cj4+IENjOiBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZwo+PiBDYzog
a2VybmVsQGRoLWVsZWN0cm9uaWNzLmNvbQo+PiBDYzogbGludXgtYXJtLWtlcm5lbEBsaXN0cy5p
bmZyYWRlYWQub3JnCj4+IENjOiBsaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tCj4+IC0tLQo+PiDCoCBhcmNoL2FybS9ib290L2R0cy9zdC9zdG0zMm1wMTMtcGluY3RybC5k
dHNpIHwgMjAgKysrKysrKysrKysrKysrKy0tLS0KPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDE2IGlu
c2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9hcmNoL2FybS9i
b290L2R0cy9zdC9zdG0zMm1wMTMtcGluY3RybC5kdHNpIAo+PiBiL2FyY2gvYXJtL2Jvb3QvZHRz
L3N0L3N0bTMybXAxMy1waW5jdHJsLmR0c2kKPj4gaW5kZXggZDNkZWVjNjAyYWU3YS4uZTZjMGRj
ZWVlOTg2NiAxMDA2NDQKPj4gLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvc3Qvc3RtMzJtcDEzLXBp
bmN0cmwuZHRzaQo+PiArKysgYi9hcmNoL2FybS9ib290L2R0cy9zdC9zdG0zMm1wMTMtcGluY3Ry
bC5kdHNpCj4+IEBAIC04OCwxNCArODgsMjAgQEAgcGluczIgewo+PiDCoMKgwqDCoMKgIGV0aDFf
cmdtaWlfc2xlZXBfcGluc19hOiBldGgxLXJnbWlpLXNsZWVwLTAgewo+PiDCoMKgwqDCoMKgwqDC
oMKgwqAgcGluczEgewo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwaW5tdXggPSA8U1RNMzJf
UElOTVVYKCdBJywgMiwgQUYxMSk+LCAvKiBFVEhfTURJTyAqLwo+PiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgPFNUTTMyX1BJTk1VWCgnRycsIDIsIEFGMTEpPjsgLyogRVRIX01E
QyAqLwo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBiaWFzLWRpc2FibGU7Cj4+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGRyaXZlLXB1c2gtcHVsbDsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgc2xldy1yYXRlID0gPDI+Owo+PiArwqDCoMKgwqDCoMKgwqAgfTsKPj4gKwo+PiArwqDCoMKg
wqDCoMKgwqAgcGluczIgewo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwaW5tdXggPSA8
U1RNMzJfUElOTVVYKCdHJywgMTMsIEFOQUxPRyk+LCAvKiAKPj4gRVRIX1JHTUlJX1RYRDAgKi8K
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDxTVE0zMl9QSU5NVVgoJ0cn
LCAxNCwgQU5BTE9HKT4sIC8qIEVUSF9SR01JSV9UWEQxICovCj4+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCA8U1RNMzJfUElOTVVYKCdDJywgMiwgQU5BTE9HKT4sIC8qIEVU
SF9SR01JSV9UWEQyICovCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA8
U1RNMzJfUElOTVVYKCdFJywgNSwgQU5BTE9HKT4sIC8qIEVUSF9SR01JSV9UWEQzICovCj4+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA8U1RNMzJfUElOTVVYKCdCJywgMTEs
IEFOQUxPRyk+LCAvKiAKPj4gRVRIX1JHTUlJX1RYX0NUTCAqLwo+PiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgPFNUTTMyX1BJTk1VWCgnQycsIDEsIEFOQUxPRyk+LCAvKiAK
Pj4gRVRIX1JHTUlJX0dUWF9DTEsgKi8KPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIDxTVE0zMl9QSU5NVVgoJ0EnLCAyLCBBTkFMT0cpPiwgLyogRVRIX01ESU8gKi8KPj4gLcKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDxTVE0zMl9QSU5NVVgoJ0cnLCAyLCBBTkFM
T0cpPiwgLyogRVRIX01EQyAqLwo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgPFNUTTMyX1BJTk1VWCgnQycsIDQsIEFOQUxPRyk+LCAvKiBFVEhfUkdNSUlfUlhEMCAqLwo+
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgPFNUTTMyX1BJTk1VWCgnQycs
IDUsIEFOQUxPRyk+LCAvKiBFVEhfUkdNSUlfUlhEMSAqLwo+PiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgPFNUTTMyX1BJTk1VWCgnQicsIDAsIEFOQUxPRyk+LCAvKiBFVEhf
UkdNSUlfUlhEMSAqLwo+PiBAQCAtMTY5LDE0ICsxNzUsMjAgQEAgcGluczIgewo+PiDCoMKgwqDC
oMKgIGV0aDJfcmdtaWlfc2xlZXBfcGluc19hOiBldGgyLXJnbWlpLXNsZWVwLTAgewo+PiDCoMKg
wqDCoMKgwqDCoMKgwqAgcGluczEgewo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwaW5tdXgg
PSA8U1RNMzJfUElOTVVYKCdCJywgNiwgQU5BTE9HKT4sIC8qIEVUSF9NRElPICovCj4+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA8U1RNMzJfUElOTVVYKCdHJywgNSwgQU5BTE9H
KT47IC8qIEVUSF9NREMgKi8KPiAKPiBXaHkgZG9uJ3QgeW91IHB1dCBQQjYgYW5kIFBHNSBpbiBB
RiBmb3IgdGhlIHNsZWVwIGNvbmZpZyBhcyBmb3IgRVRIMSA/CgpGaXhlZCBpbiBWMiwgdGhhbmtz
IGZvciBzcG90dGluZyB0aGlzLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20v
bWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
