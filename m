Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6231185F0F7
	for <lists+linux-stm32@lfdr.de>; Thu, 22 Feb 2024 06:33:52 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0E1B1C6B45E;
	Thu, 22 Feb 2024 05:33:52 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2E105C65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Feb 2024 05:33:50 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B28B21007;
 Wed, 21 Feb 2024 21:34:27 -0800 (PST)
Received: from [10.162.42.8] (a077893.blr.arm.com [10.162.42.8])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E180F3F766;
 Wed, 21 Feb 2024 21:33:45 -0800 (PST)
Message-ID: <af8c690f-226b-4397-ad38-9f12f3c1bd15@arm.com>
Date: Thu, 22 Feb 2024 11:03:42 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
 linux-arm-kernel@lists.infradead.org
References: <20240123054608.1790189-1-anshuman.khandual@arm.com>
 <20240123054608.1790189-3-anshuman.khandual@arm.com>
 <56d56f85-6172-4fb1-a002-fe82ffc8a66a@arm.com>
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <56d56f85-6172-4fb1-a002-fe82ffc8a66a@arm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 linux-acpi@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sudeep Holla <sudeep.holla@arm.com>, coresight@lists.linaro.org,
 Mike Leach <mike.leach@linaro.org>
Subject: Re: [Linux-stm32] [PATCH V4 02/11] coresight: stm: Extract device
 name from AMBA pid based table lookup
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

CgpPbiAyLzE1LzI0IDE2OjI1LCBTdXp1a2kgSyBQb3Vsb3NlIHdyb3RlOgo+IE9uIDIzLzAxLzIw
MjQgMDU6NDUsIEFuc2h1bWFuIEtoYW5kdWFsIHdyb3RlOgo+PiBJbnN0ZWFkIG9mIHVzaW5nIEFN
QkEgcHJpdmF0ZSBkYXRhIGZpZWxkLCBleHRyYWN0IHRoZSBkZXZpY2UgbmFtZSBmcm9tIEFNQkEK
Pj4gcGlkIGJhc2VkIHRhYmxlIGxvb2t1cCB1c2luZyBuZXcgY29yZXNpZ2h0X2dldF91Y2lfZGF0
YV9mcm9tX2FtYmEoKSBoZWxwZXIuCj4+Cj4+IENjOiBTdXp1a2kgSyBQb3Vsb3NlIDxzdXp1a2ku
cG91bG9zZUBhcm0uY29tPgo+PiBDYzogTWlrZSBMZWFjaCA8bWlrZS5sZWFjaEBsaW5hcm8ub3Jn
Pgo+PiBDYzogSmFtZXMgQ2xhcmsgPGphbWVzLmNsYXJrQGFybS5jb20+Cj4+IENjOiBjb3Jlc2ln
aHRAbGlzdHMubGluYXJvLm9yZwo+PiBDYzogbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRl
YWQub3JnCj4+IENjOiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnCj4+IENjOiBsaW51eC1z
dG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCj4+IFNpZ25lZC1vZmYtYnk6IEFuc2h1
bWFuIEtoYW5kdWFsIDxhbnNodW1hbi5raGFuZHVhbEBhcm0uY29tPgo+PiAtLS0KPj4gwqAgZHJp
dmVycy9od3RyYWNpbmcvY29yZXNpZ2h0L2NvcmVzaWdodC1wcml2LmggfCAxMCArKysrKysrKysr
Cj4+IMKgIGRyaXZlcnMvaHd0cmFjaW5nL2NvcmVzaWdodC9jb3Jlc2lnaHQtc3RtLmPCoCB8IDE0
ICsrKysrKysrKysrKystCj4+IMKgIDIgZmlsZXMgY2hhbmdlZCwgMjMgaW5zZXJ0aW9ucygrKSwg
MSBkZWxldGlvbigtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9od3RyYWNpbmcvY29yZXNp
Z2h0L2NvcmVzaWdodC1wcml2LmggYi9kcml2ZXJzL2h3dHJhY2luZy9jb3Jlc2lnaHQvY29yZXNp
Z2h0LXByaXYuaAo+PiBpbmRleCA3NjcwNzZlMDc5NzAuLjY4Y2JiMDM2Y2VjOCAxMDA2NDQKPj4g
LS0tIGEvZHJpdmVycy9od3RyYWNpbmcvY29yZXNpZ2h0L2NvcmVzaWdodC1wcml2LmgKPj4gKysr
IGIvZHJpdmVycy9od3RyYWNpbmcvY29yZXNpZ2h0L2NvcmVzaWdodC1wcml2LmgKPj4gQEAgLTIy
MSw2ICsyMjEsMTYgQEAgc3RhdGljIGlubGluZSB2b2lkICpjb3Jlc2lnaHRfZ2V0X3VjaV9kYXRh
KGNvbnN0IHN0cnVjdCBhbWJhX2lkICppZCkKPj4gwqDCoMKgwqDCoCByZXR1cm4gdWNpX2lkLT5k
YXRhOwo+PiDCoCB9Cj4+IMKgICtzdGF0aWMgaW5saW5lIHZvaWQgKmNvcmVzaWdodF9nZXRfdWNp
X2RhdGFfZnJvbV9hbWJhKGNvbnN0IHN0cnVjdCBhbWJhX2lkICp0YWJsZSwgdTMyIHBpZCkKPj4g
K3sKPj4gK8KgwqDCoCB3aGlsZSAodGFibGUtPm1hc2spIHsKPj4gK8KgwqDCoMKgwqDCoMKgIGlm
ICgodGFibGUtPmlkICYgdGFibGUtPm1hc2spID09IHBpZCkKPiAKPiBXaHkgYXJlIHdlIG1hc2tp
bmcgdGFibGUtPmlkID8gdGFibGUtPmlkIGlzIGEgc3RhdGljIHZhbHVlIHRoYXQgdGhlCj4gZHJp
dmVyIHdhbnRzIHRvIGNoZWNrIGZvciAidmFyaWFudHMiIG9mIGEgZ2l2ZW4gZGV2aWNlLiBUaGUg
dGFibGUtPm1hc2sKPiBpcyB0aGVyZSB0byBmaWx0ZXIgb3V0IHRoZSAiaXJyZWxldmFudCIgYml0
cyBvZiB0aGUgUElEIHRoYXQgd2UgcmVhZAo+IGZyb20gdGhlIGRldmljZS4gU28gdGhpcyBzaG91
bGQgaW5zdGVhZCBiZToKPiAKPiDCoMKgwqDCoMKgwqDCoCBpZiAoKHRhYmxlLT5tYXNrICYgcGlk
KSA9PSB0YWJsZS0+aWQpCgpTdXJlLCB3aWxsIHRoaXMgY2hhbmdlIGFzIHN1Z2dlc3RlZC4KCj4g
Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiBjb3Jlc2lnaHRfZ2V0X3VjaV9kYXRh
KHRhYmxlKTsKPj4gK8KgwqDCoMKgwqDCoMKgIHRhYmxlKys7Cj4+ICvCoMKgwqAgfTsKPj4gK8Kg
wqDCoCByZXR1cm4gTlVMTDsKPj4gK30KPj4gKwo+PiDCoCB2b2lkIGNvcmVzaWdodF9yZWxlYXNl
X3BsYXRmb3JtX2RhdGEoc3RydWN0IGNvcmVzaWdodF9kZXZpY2UgKmNzZGV2LAo+PiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgZGV2aWNlICpkZXYs
Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBj
b3Jlc2lnaHRfcGxhdGZvcm1fZGF0YSAqcGRhdGEpOwo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9o
d3RyYWNpbmcvY29yZXNpZ2h0L2NvcmVzaWdodC1zdG0uYyBiL2RyaXZlcnMvaHd0cmFjaW5nL2Nv
cmVzaWdodC9jb3Jlc2lnaHQtc3RtLmMKPj4gaW5kZXggYTFjMjdjOTAxYWQxLi45Y2RjYTRmODZj
YWIgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvaHd0cmFjaW5nL2NvcmVzaWdodC9jb3Jlc2lnaHQt
c3RtLmMKPj4gKysrIGIvZHJpdmVycy9od3RyYWNpbmcvY29yZXNpZ2h0L2NvcmVzaWdodC1zdG0u
Ywo+PiBAQCAtODA0LDYgKzgwNCwxOCBAQCBzdGF0aWMgdm9pZCBzdG1faW5pdF9nZW5lcmljX2Rh
dGEoc3RydWN0IHN0bV9kcnZkYXRhICpkcnZkYXRhLAo+PiDCoMKgwqDCoMKgIGRydmRhdGEtPnN0
bS5zZXRfb3B0aW9ucyA9IHN0bV9nZW5lcmljX3NldF9vcHRpb25zOwo+PiDCoCB9Cj4+IMKgICsj
ZGVmaW5lIFNUTV9BTUJBX01BU0sgMHhmZmZmZgo+PiArCj4+ICtzdGF0aWMgY29uc3Qgc3RydWN0
IGFtYmFfaWQgc3RtX2lkc1tdOwo+PiArCj4+ICtzdGF0aWMgY2hhciAqc3RtX2NzZGV2X25hbWUo
c3RydWN0IGNvcmVzaWdodF9kZXZpY2UgKmNzZGV2KQo+PiArewo+PiArwqDCoMKgIHUzMiBzdG1f
cGlkID0gY29yZXNpZ2h0X2dldF9waWQoJmNzZGV2LT5hY2Nlc3MpICYgU1RNX0FNQkFfTUFTSzsK
PiAKPiBTaW1pbGFyIHRvIGFib3ZlOgo+IAo+IFdoeSBkbyB3ZSBhcHBseSBhICJjdXN0b20iIG1h
c2sgdG8gdGhlIFBJRCBhbmQgbGF0ZXIgY2hlY2sgdGhlIFBJRCB3aXRoCj4gdGhhdCBvZiB0aGUg
dGFibGUtPnBpZC4KPiAKPiBUaGUgd2F5IGl0IGlzIHN1cHBvc2VkIHdvcmsgaXMgOgo+IAo+IMKg
wqDCoMKgKHRhYmxlLT5tYXNrICYgZGV2X3BpZCkgPT0gdGFibGUtPnBpZAo+IAo+IHRoZSB0YWJs
ZS0+bWFzayBpcyB0aGVyZSBmb3IgYSByZWFzb246IGkuZS4sIHRvIGdldCB0aGUgcmVsZXZhbnQg
Yml0cyBmcm9tIHRoZSBkZXZpY2VfcGlkIGFuZCBjb21wYXJlIGl0IGFnYWluc3QgInRoZSIgZXhw
ZWN0ZWQgdmFsdWUgKHRhYmxlLT5waWQpLgoKVW5kZXJzdG9vZCwgd2lsbCBjaGFuZ2UgdGhlIGhl
bHBlciBhcyBmb2xsb3dzCgpzdGF0aWMgaW5saW5lIHZvaWQgKmNvcmVzaWdodF9nZXRfdWNpX2Rh
dGFfZnJvbV9hbWJhKGNvbnN0IHN0cnVjdCBhbWJhX2lkICp0YWJsZSwgdTMyIHBpZCkKewogICAg
ICAgIHdoaWxlICh0YWJsZS0+bWFzaykgewogICAgICAgICAgICAgICAgaWYgKChwaWQgJiB0YWJs
ZS0+bWFzaykgPT0gdGFibGUtPmlkKQogICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gY29y
ZXNpZ2h0X2dldF91Y2lfZGF0YSh0YWJsZSk7CiAgICAgICAgICAgICAgICB0YWJsZSsrOwogICAg
ICAgIH07CiAgICAgICAgcmV0dXJuIE5VTEw7Cn0KCmFuZCBhbHNvIGRyb3AgYm90aCB0aGUgY3Vz
dG9tIG1hc2tzIFNUTV9BTUJBX01BU0sgYW5kIFRNQ19BTUJBX01BU0suCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlz
dApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
