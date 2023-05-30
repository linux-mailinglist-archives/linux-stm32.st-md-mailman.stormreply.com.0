Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A040715D98
	for <lists+linux-stm32@lfdr.de>; Tue, 30 May 2023 13:42:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2B8E7C6A614;
	Tue, 30 May 2023 11:42:54 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5A430C65E5A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 May 2023 11:42:52 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id D075F8479B;
 Tue, 30 May 2023 13:42:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1685446971;
 bh=fPulCLOn1mDw2aXbZrWUn9R4dyD+ptp9MMeZ6zuSx4s=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=fQOI2qQIliHlw5IBVoVQPjBW8dfbxdCD/zknMLgW+WX7i+RCMkehb3tGYYhLracTA
 K+6OsEGYkX9yTYUvqZUinTcRc0x3wEvAaj7H85kchvnCMpMT+Pp8kiHDPTcDnbm6zE
 XHHSpPvPSDfZOEBiW0alPBrw3x79efxt8g/XZE/E/EWAXgV9JqJ9M3sUV0YhqEnUKk
 HfrlFCdHX5aFDd9deniXm6paoU0ZYl4u/RPoq4e8T86i6djNn2l2joyJKkZDjZQpXA
 rvPZlWqmBJOffSxwjn85DrPymQUktn/6q1c8zNyOjGF+zydZRe/9bW4/whGaccCfTT
 wSN0fBx1Oz8JA==
Message-ID: <974c3ce3-5081-67d0-ae80-444e99e437e5@denx.de>
Date: Tue, 30 May 2023 13:42:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>,
 Olivier MOYSAN <olivier.moysan@foss.st.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
References: <20230524133918.1439516-1-olivier.moysan@foss.st.com>
 <20230524133918.1439516-8-olivier.moysan@foss.st.com>
 <cc7a0a1a-31bb-92f4-6365-5e0c4a4bc85c@denx.de>
 <5bb496d0-6dc1-6ba3-6126-6429037ecf5a@foss.st.com>
 <8a4f3112-54ed-e0c1-52ee-395a41255163@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <8a4f3112-54ed-e0c1-52ee-395a41255163@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: devicetree@vger.kernel.org, kernel@dh-electronics.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 7/8] ARM: dts: stm32: adopt generic iio
 bindings for adc channels on dhcor-drc
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

T24gNS8zMC8yMyAwOTo1OSwgQWxleGFuZHJlIFRPUkdVRSB3cm90ZToKPiBNYXJlaywgT2xpdmll
cgo+IAo+IE9uIDUvMjQvMjMgMTc6MzksIE9saXZpZXIgTU9ZU0FOIHdyb3RlOgo+PiBIaSBNYXJl
aywKPj4KPj4gT24gNS8yNC8yMyAxNTo1NCwgTWFyZWsgVmFzdXQgd3JvdGU6Cj4+PiBPbiA1LzI0
LzIzIDE1OjM5LCBPbGl2aWVyIE1veXNhbiB3cm90ZToKPj4+PiBVc2UgU1RNMzIgQURDIGdlbmVy
aWMgYmluZGluZ3MgaW5zdGVhZCBvZiBsZWdhY3kgYmluZGluZ3Mgb24KPj4+PiBESENPUiBEUkMg
Q29tcGFjdCBib2FyZC4KPj4+Pgo+Pj4+IFRoZSBTVE0zMiBBREMgc3BlY2lmaWMgYmluZGluZyB0
byBkZWNsYXJlIGNoYW5uZWxzIGhhcyBiZWVuIGRlcHJlY2F0ZWQsCj4+Pj4gaGVuY2UgYWRvcHQg
dGhlIGdlbmVyaWMgSUlPIGNoYW5uZWxzIGJpbmRpbmdzLCBpbnN0ZWFkLgo+Pj4+IFRoZSBTVE0z
Mk1QMTUxIGRldmljZSB0cmVlIG5vdyBleHBvc2VzIGludGVybmFsIGNoYW5uZWxzIHVzaW5nIHRo
ZQo+Pj4+IGdlbmVyaWMgYmluZGluZy4gVGhpcyBtYWtlcyB0aGUgY2hhbmdlIG1hbmRhdG9yeSBo
ZXJlIHRvIGF2b2lkIGEgbWl4ZWQKPj4+PiB1c2Ugb2YgbGVnYWN5IGFuZCBnZW5lcmljIGJpbmRp
bmcsIHdoaWNoIGlzIG5vdCBzdXBwb3J0ZWQgYnkgdGhlIAo+Pj4+IGRyaXZlci4KPj4+Pgo+Pj4+
IFNpZ25lZC1vZmYtYnk6IE9saXZpZXIgTW95c2FuIDxvbGl2aWVyLm1veXNhbkBmb3NzLnN0LmNv
bT4KPj4+PiAtLS0KPj4+PiDCoCAuLi4vZHRzL3N0bTMybXAxNXh4LWRoY29yLWRyYy1jb21wYWN0
LmR0c2nCoMKgwqAgfCAyOCAKPj4+PiArKysrKysrKysrKysrKysrLS0tCj4+Pj4gwqAgMSBmaWxl
IGNoYW5nZWQsIDI0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4+Pj4KPj4+PiBkaWZm
IC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1eHgtZGhjb3ItZHJjLWNvbXBhY3Qu
ZHRzaSAKPj4+PiBiL2FyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAxNXh4LWRoY29yLWRyYy1jb21w
YWN0LmR0c2kKPj4+PiBpbmRleCAzOWFmNzlkYzY1NGMuLjkyZDkwNmJmZDVkNyAxMDA2NDQKPj4+
PiAtLS0gYS9hcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTV4eC1kaGNvci1kcmMtY29tcGFjdC5k
dHNpCj4+Pj4gKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1eHgtZGhjb3ItZHJjLWNv
bXBhY3QuZHRzaQo+Pj4+IEBAIC01NywxNSArNTcsMzUgQEAgJmFkYyB7wqDCoMKgIC8qIFgxMSBB
REMgaW5wdXRzICovCj4+Pj4gwqDCoMKgwqDCoCBzdGF0dXMgPSAib2theSI7Cj4+Pj4gwqDCoMKg
wqDCoCBhZGMxOiBhZGNAMCB7Cj4+Pgo+Pj4KPj4+IEkgc2VudCBzaW1pbGFyIHBhdGNoIHJlY2Vu
dGx5IHRvbzoKPj4+Cj4+PiBbUEFUQ0hdIEFSTTogZHRzOiBzdG0zMjogVXBkYXRlIHRvIGdlbmVy
aWMgQURDIGNoYW5uZWwgYmluZGluZyBvbiAKPj4+IERIU09NIHN5c3RlbXMKPj4+Cj4+PiBCdXQg
SSBuZWVkZWQgdG8gYWRkICNhZGRyZXNzLWNlbGxzLyNzaXplLWNlbGxzIGhlcmUgYW5kIHRvIGFk
Y0AxMDAsIAo+Pj4gb3RoZXJ3aXNlIERUQiBjaGVja2VyIHdhcyBjb21wbGFpbmluZyAuIERpZCB5
b3UgcnVuIERUQiBjaGVjayBhbmQgd2FzIAo+Pj4gaXQgT0sgb24geW91ciBzaWRlID8KPj4KPj4g
VGhlIGZpcnN0IHBhdGNoIGluIHRoaXMgc2VyaWUgYWRkcyB0aGUgI2FkZHJlc3MtY2VsbHMvI3Np
emUtY2VsbHMgdG8gCj4+IHRoZSDCoMKgU29DIERULiBTbywgdGhlcmUgaXMgbm8gbmVlZCB0byBh
ZGQgdGhlbSBsYXRlciBpbiB0aGUgYm9hcmQgRFQuCj4+Cj4+IEkgY2FuIHNlbmQgYSB2MiB3aXRo
IHlvdXIgcGF0Y2ggKGFmdGVyIHJlbW92aW5nIHRoZSBjZWxscyBwcm9wZXJ0aWVzIAo+PiBmcm9t
IHRoZSBwYXRjaCkuIEhhdmluZyBhbGwgdGhlIHBhdGNoZXMgaW4gdGhlIHNhbWUgc2VyaWUsIHdp
bGwgaGVscCAKPj4gYXZvaWRpbmcgc2VxdWVuY2luZyBwcm9ibGVtcy4KPj4KPj4gRG8geW91IGFn
cmVlIHdpdGggdGhpcyA/Cj4gCj4gV2hhdCBpcyB0aGUgc3RhdHVzIG9mIHRoaXMgcGF0Y2ggPwo+
IAo+IE1hcmVrLCBJIHdvdWxkIHByZWZlciB0byB0YWtlIGFsbCBBREMgdXBkYXRlcyBpbiB0aGlz
IHNlcmllcyBpZiB5b3UgYWdyZWUuCgpJIG1pc3NlZCB0aGUgcmVwbHkgZnJvbSBPbGl2aWVyLCBz
b3JyeS4gUGxlYXNlIHBpY2sgdGhlIHdob2xlIHRoaW5nLgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgt
c3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
