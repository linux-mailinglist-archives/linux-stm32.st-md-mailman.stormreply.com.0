Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 241D413582C
	for <lists+linux-stm32@lfdr.de>; Thu,  9 Jan 2020 12:40:20 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D689FC36B0B;
	Thu,  9 Jan 2020 11:40:19 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 76687C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Jan 2020 11:40:18 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 009BeADg130591;
 Thu, 9 Jan 2020 05:40:10 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1578570010;
 bh=Cu4eyh0A9jxWfcjHOeLDmeCMBzCRubt5Z+/kuTU79Ps=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=OUi6OecaQFvcx95eewNrsUrydDelMSKwWkYa9Wro3ArlLEG+THkF5kHvNkgK9Kz3q
 BjX3yWzjPydHC7L4DG+dqWXW5szKEuLWh35Vhp/PzKvgRlEVFe5fuOSEZ9M6T7Rmwm
 blwlgEgJ6st6E07eiC6qv8oFvrgia0j789jB+nQE=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 009BeAlk120926;
 Thu, 9 Jan 2020 05:40:10 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 9 Jan
 2020 05:40:08 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 9 Jan 2020 05:40:08 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 009Be6Kp019653;
 Thu, 9 Jan 2020 05:40:06 -0600
To: Fabrice Gasnier <fabrice.gasnier@st.com>, <jic23@kernel.org>,
 <mcoquelin.stm32@gmail.com>, <alexandre.torgue@st.com>
References: <20200107114532.6697-1-peter.ujfalusi@ti.com>
 <eade6657-8470-0d70-b3c1-fcdddf891c6c@st.com>
 <4c0b7e3e-cd98-860a-e931-c216f1bc6e7a@ti.com>
 <698d9dec-4486-f70a-b8e0-dfd6b4bb907f@st.com>
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Message-ID: <45195b31-70fa-39c9-e109-eeb33d6a2663@ti.com>
Date: Thu, 9 Jan 2020 13:40:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <698d9dec-4486-f70a-b8e0-dfd6b4bb907f@st.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, vkoul@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] iio: adc: stm32-dfsdm: Use
 dma_request_chan() instead dma_request_slave_channel()
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

CgpPbiAwOS8wMS8yMDIwIDEzLjI5LCBGYWJyaWNlIEdhc25pZXIgd3JvdGU6Cj4gT24gMS85LzIw
IDExOjMyIEFNLCBQZXRlciBVamZhbHVzaSB3cm90ZToKPj4KPj4KPj4gT24gMDkvMDEvMjAyMCAx
MS4xMywgRmFicmljZSBHYXNuaWVyIHdyb3RlOgo+Pj4gT24gMS83LzIwIDEyOjQ1IFBNLCBQZXRl
ciBVamZhbHVzaSB3cm90ZToKPj4+PiBkbWFfcmVxdWVzdF9zbGF2ZV9jaGFubmVsKCkgaXMgYSB3
cmFwcGVyIG9uIHRvcCBvZiBkbWFfcmVxdWVzdF9jaGFuKCkKPj4+PiBlYXRpbmcgdXAgdGhlIGVy
cm9yIGNvZGUuCj4+Pj4KPj4+PiBCeSB1c2luZyBkbWFfcmVxdWVzdF9jaGFuKCkgZGlyZWN0bHkg
dGhlIGRyaXZlciBjYW4gc3VwcG9ydCBkZWZlcnJlZAo+Pj4+IHByb2JpbmcgYWdhaW5zdCBETUEu
Cj4+Pj4KPj4+PiBTaWduZWQtb2ZmLWJ5OiBQZXRlciBVamZhbHVzaSA8cGV0ZXIudWpmYWx1c2lA
dGkuY29tPgo+Pj4+IC0tLQo+Pj4+IEhpLAo+Pj4+Cj4+Pj4gQ2hhbmdlcyBzaW5jZSB2MToKPj4+
PiAtIEZhbGwgYmFjayB0byBJUlEgbW9kZSBmb3IgQURDIG9ubHkgaW4gY2FzZSBvZiBFTk9ERVYK
Pj4+Cj4+PiBIaSBQZXRlciwKPj4+Cj4+PiBUaGFua3MgZm9yIHRoZSBwYXRjaCwKPj4+Cj4+PiBQ
bGVhc2UgZmluZCBhIG1pbm9yIGNvbW1lbnQgaGVyZSBhZnRlci4gQXBhcnQgZnJvbSB0aGF0LCB5
b3UgY2FuIGFkZCBteToKPj4+Cj4+PiBBY2tlZC1ieTogRmFicmljZSBHYXNuaWVyIDxmYWJyaWNl
Lmdhc25pZXJAc3QuY29tPgo+Pj4KPj4+Cj4+Pj4KPj4+PiBSZWdhcmRzLAo+Pj4+IFBldGVyCj4+
Pj4KPj4+PiAgZHJpdmVycy9paW8vYWRjL3N0bTMyLWRmc2RtLWFkYy5jIHwgMjEgKysrKysrKysr
KysrKysrKystLS0tCj4+Pj4gIDEgZmlsZSBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspLCA0IGRl
bGV0aW9ucygtKQo+Pj4+Cj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaWlvL2FkYy9zdG0zMi1k
ZnNkbS1hZGMuYyBiL2RyaXZlcnMvaWlvL2FkYy9zdG0zMi1kZnNkbS1hZGMuYwo+Pj4+IGluZGV4
IGU0OTMyNDJjMjY2ZS4uNzRhMjIxMWJkZmY0IDEwMDY0NAo+Pj4+IC0tLSBhL2RyaXZlcnMvaWlv
L2FkYy9zdG0zMi1kZnNkbS1hZGMuYwo+Pj4+ICsrKyBiL2RyaXZlcnMvaWlvL2FkYy9zdG0zMi1k
ZnNkbS1hZGMuYwo+Pj4+IEBAIC0xMzgzLDkgKzEzODMsMTMgQEAgc3RhdGljIGludCBzdG0zMl9k
ZnNkbV9kbWFfcmVxdWVzdChzdHJ1Y3QgaWlvX2RldiAqaW5kaW9fZGV2KQo+Pj4+ICB7Cj4+Pj4g
IAlzdHJ1Y3Qgc3RtMzJfZGZzZG1fYWRjICphZGMgPSBpaW9fcHJpdihpbmRpb19kZXYpOwo+Pj4+
ICAKPj4+PiAtCWFkYy0+ZG1hX2NoYW4gPSBkbWFfcmVxdWVzdF9zbGF2ZV9jaGFubmVsKCZpbmRp
b19kZXYtPmRldiwgInJ4Iik7Cj4+Pj4gLQlpZiAoIWFkYy0+ZG1hX2NoYW4pCj4+Pj4gLQkJcmV0
dXJuIC1FSU5WQUw7Cj4+Pj4gKwlhZGMtPmRtYV9jaGFuID0gZG1hX3JlcXVlc3RfY2hhbigmaW5k
aW9fZGV2LT5kZXYsICJyeCIpOwo+Pj4+ICsJaWYgKElTX0VSUihhZGMtPmRtYV9jaGFuKSkgewo+
Pj4+ICsJCWludCByZXQgPSBQVFJfRVJSKGFkYy0+ZG1hX2NoYW4pOwo+Pj4+ICsKPj4+PiArCQlh
ZGMtPmRtYV9jaGFuID0gTlVMTDsKPj4+PiArCQlyZXR1cm4gcmV0Owo+Pj4KPj4+IFlvdSBtYXkg
InJldHVybiBQVFJfRVJSKGFkYy0+ZG1hX2NoYW4pOyIgZGlyZWN0bHkgaGVyZS4KPj4KPj4gSSBk
b24ndCBtYWtlIGRlY2lzaW9uIGhlcmUgb24gYmVoYWxmIG9mIHRoZSBhZGMgcGF0aCBvbiB0byBn
byBmb3J3YXJkIHcvCj4+IG9yIHcvbyBETUEgc3VwcG9ydCBhbmQgaWYgd2UgZ28gYWhlYWQgdGhl
IHN0bTMyX2Rmc2RtX2RtYV9yZWxlYXNlKCkKPj4gbmVlZHMgdGhlIGRtYV9jaGFuIHRvIGJlIE5V
TEwgaW4gY2FzZSB3ZSBkb24ndCB1c2UgRE1BLgo+Pgo+PiBJdCBpcyBtdWNoIGNsZWFuZXIgdG8g
c2V0IGRtYV9jaGFuIHRvIE5VTEwgaGVyZSB0aGFuIGRvaW5nIGl0IGluIG90aGVyCj4+IHBhdGhz
Lgo+IAo+IEhpIFBldGVyLAoKSGkgRmFicmljZSwKCj4gU29ycnkgSSB3YXNuJ3QgY2xlYXIgZW5v
dWdoLiBJIGFncmVlIHdpdGggeW91LiBJIHdhcyBzdWdnZXN0aW5nIG9ubHksCj4gdGFsa2luZyBh
Ym91dCB0aGUgJ3JldCcgdmFyaWFibGUuIEl0IG1heSBiZSByZW1vdmVkIHRvIHNwYXJlIGEgZmV3
IGxpbmVzCj4gOi0pLgo+IAlpZiAoSVNfRVJSKGFkYy0+ZG1hX2NoYW4pKSB7Cj4gCQlhZGMtPmRt
YV9jaGFuID0gTlVMTDsKPiAJCXJldHVybiBQVFJfRVJSKGFkYy0+ZG1hX2NoYW4pOwo+IAl9Cj4g
SSdtIG9rYXkgYm90aCB3YXlzLgoKUFRSX0VSUihOVUxMKTsgd2lsbCByZXR1cm4gMApJIG5lZWQg
dG8gcmV0cmlldmUgdGhlIGFjdHVhbCBlcnJvciBjb2RlIGJlZm9yZSBOVUxMaW5nIGRtYV9jaGFu
LgoKPiAKPj4KPj4+Cj4+PiBCZXN0IFJlZ2FyZHMsCj4+PiBGYWJyaWNlCj4+Pgo+Pj4+ICsJfQo+
Pj4+ICAKPj4+PiAgCWFkYy0+cnhfYnVmID0gZG1hX2FsbG9jX2NvaGVyZW50KGFkYy0+ZG1hX2No
YW4tPmRldmljZS0+ZGV2LAo+Pj4+ICAJCQkJCSBERlNETV9ETUFfQlVGRkVSX1NJWkUsCj4+Pj4g
QEAgLTE1MDksNyArMTUxMywxNiBAQCBzdGF0aWMgaW50IHN0bTMyX2Rmc2RtX2FkY19pbml0KHN0
cnVjdCBpaW9fZGV2ICppbmRpb19kZXYpCj4+Pj4gIAlpbml0X2NvbXBsZXRpb24oJmFkYy0+Y29t
cGxldGlvbik7Cj4+Pj4gIAo+Pj4+ICAJLyogT3B0aW9uYWxseSByZXF1ZXN0IERNQSAqLwo+Pj4+
IC0JaWYgKHN0bTMyX2Rmc2RtX2RtYV9yZXF1ZXN0KGluZGlvX2RldikpIHsKPj4+PiArCXJldCA9
IHN0bTMyX2Rmc2RtX2RtYV9yZXF1ZXN0KGluZGlvX2Rldik7Cj4+Pj4gKwlpZiAocmV0KSB7Cj4+
Pj4gKwkJaWYgKHJldCAhPSAtRU5PREVWKSB7Cj4+Pj4gKwkJCWlmIChyZXQgIT0gLUVQUk9CRV9E
RUZFUikKPj4+PiArCQkJCWRldl9lcnIoJmluZGlvX2Rldi0+ZGV2LAo+Pj4+ICsJCQkJCSJETUEg
Y2hhbm5lbCByZXF1ZXN0IGZhaWxlZCB3aXRoICVkXG4iLAo+Pj4+ICsJCQkJCXJldCk7Cj4+Pj4g
KwkJCXJldHVybiByZXQ7Cj4+Pj4gKwkJfQo+Pj4+ICsKPj4+PiAgCQlkZXZfZGJnKCZpbmRpb19k
ZXYtPmRldiwgIk5vIERNQSBzdXBwb3J0XG4iKTsKPj4+PiAgCQlyZXR1cm4gMDsKPj4+PiAgCX0K
Pj4+Pgo+Pgo+PiAtIFDDqXRlcgo+Pgo+PiBUZXhhcyBJbnN0cnVtZW50cyBGaW5sYW5kIE95LCBQ
b3Jra2FsYW5rYXR1IDIyLCAwMDE4MCBIZWxzaW5raS4KPj4gWS10dW5udXMvQnVzaW5lc3MgSUQ6
IDA2MTU1MjEtNC4gS290aXBhaWtrYS9Eb21pY2lsZTogSGVsc2lua2kKPj4KCi0gUMOpdGVyCgpU
ZXhhcyBJbnN0cnVtZW50cyBGaW5sYW5kIE95LCBQb3Jra2FsYW5rYXR1IDIyLCAwMDE4MCBIZWxz
aW5raS4KWS10dW5udXMvQnVzaW5lc3MgSUQ6IDA2MTU1MjEtNC4gS290aXBhaWtrYS9Eb21pY2ls
ZTogSGVsc2lua2kKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4v
bGlzdGluZm8vbGludXgtc3RtMzIK
