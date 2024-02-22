Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4C885F07D
	for <lists+linux-stm32@lfdr.de>; Thu, 22 Feb 2024 05:46:02 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2A8D9C6B45E;
	Thu, 22 Feb 2024 04:46:02 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 84FDAC69063
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Feb 2024 04:46:00 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C8ADF1007;
 Wed, 21 Feb 2024 20:46:37 -0800 (PST)
Received: from [10.162.42.8] (a077893.blr.arm.com [10.162.42.8])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A6FC73F766;
 Wed, 21 Feb 2024 20:45:54 -0800 (PST)
Message-ID: <8c4165e1-e875-4a61-8935-1ae1e2099477@arm.com>
Date: Thu, 22 Feb 2024 10:15:51 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
 linux-arm-kernel@lists.infradead.org
References: <20240123054608.1790189-1-anshuman.khandual@arm.com>
 <20240123054608.1790189-2-anshuman.khandual@arm.com>
 <68eb9e4e-de77-4854-8212-816c66d5f657@arm.com>
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <68eb9e4e-de77-4854-8212-816c66d5f657@arm.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Hanjun Guo <guohanjun@huawei.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Leo Yan <leo.yan@linaro.org>, linux-acpi@vger.kernel.org,
 James Clark <james.clark@arm.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sudeep Holla <sudeep.holla@arm.com>, Len Brown <lenb@kernel.org>,
 coresight@lists.linaro.org, Mike Leach <mike.leach@linaro.org>
Subject: Re: [Linux-stm32] [PATCH V4 01/11] coresight: etm4x: Fix unbalanced
 pm_runtime_enable()
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

CgpPbiAyLzE1LzI0IDE2OjM0LCBTdXp1a2kgSyBQb3Vsb3NlIHdyb3RlOgo+IE9uIDIzLzAxLzIw
MjQgMDU6NDUsIEFuc2h1bWFuIEtoYW5kdWFsIHdyb3RlOgo+PiBUaGVyZSBpcyBhbiB1bmJhbGFu
Y2VkIHBtX3J1bnRpbWVfZW5hYmxlKCkgaW4gZXRtNF9wcm9iZV9wbGF0Zm9ybV9kZXYoKQo+PiB3
aGVuIGV0bTRfcHJvYmUoKSBmYWlscy4gVGhpcyBwcm9ibGVtIGNhbiBiZSBvYnNlcnZlZCB2aWEg
dGhlIGNvcmVzaWdodAo+PiBldG00IG1vZHVsZSdzIChsb2FkIC0+IHVubG9hZCAtPiBsb2FkKSBz
ZXF1ZW5jZSB3aGVuIGV0bTRfcHJvYmUoKSBmYWlscwo+PiBpbiBldG00X3Byb2JlX3BsYXRmb3Jt
X2RldigpLgo+Pgo+PiBbwqDCoCA2My4zNzk5NDNdIGNvcmVzaWdodC1ldG00eCA3MDQwMDAwLmV0
bTogVW5iYWxhbmNlZCBwbV9ydW50aW1lX2VuYWJsZSEKPj4gW8KgwqAgNjMuMzkzNjMwXSBjb3Jl
c2lnaHQtZXRtNHggNzE0MDAwMC5ldG06IFVuYmFsYW5jZWQgcG1fcnVudGltZV9lbmFibGUhCj4+
IFvCoMKgIDYzLjQwNzQ1NV0gY29yZXNpZ2h0LWV0bTR4IDcyNDAwMDAuZXRtOiBVbmJhbGFuY2Vk
IHBtX3J1bnRpbWVfZW5hYmxlIQo+PiBbwqDCoCA2My40MjA5ODNdIGNvcmVzaWdodC1ldG00eCA3
MzQwMDAwLmV0bTogVW5iYWxhbmNlZCBwbV9ydW50aW1lX2VuYWJsZSEKPj4gW8KgwqAgNjMuNDIw
OTk5XSBjb3Jlc2lnaHQtZXRtNHggNzQ0MDAwMC5ldG06IFVuYmFsYW5jZWQgcG1fcnVudGltZV9l
bmFibGUhCj4+IFvCoMKgIDYzLjQ0MTIwOV0gY29yZXNpZ2h0LWV0bTR4IDc1NDAwMDAuZXRtOiBV
bmJhbGFuY2VkIHBtX3J1bnRpbWVfZW5hYmxlIQo+PiBbwqDCoCA2My40NTQ2ODldIGNvcmVzaWdo
dC1ldG00eCA3NjQwMDAwLmV0bTogVW5iYWxhbmNlZCBwbV9ydW50aW1lX2VuYWJsZSEKPj4gW8Kg
wqAgNjMuNDc0OTgyXSBjb3Jlc2lnaHQtZXRtNHggNzc0MDAwMC5ldG06IFVuYmFsYW5jZWQgcG1f
cnVudGltZV9lbmFibGUhCj4+Cj4+IFRoaXMgZml4ZXMgdGhlIGFib3ZlIHByb2JsZW0gLSB3aXRo
IGFuIGV4cGxpY2l0IHBtX3J1bnRpbWVfZGlzYWJsZSgpIGNhbGwKPj4gd2hlbiBldG00X3Byb2Jl
KCkgZmFpbHMgZHVyaW5nIGV0bTRfcHJvYmVfcGxhdGZvcm1fZGV2KCkuCj4gCj4gRml4ZXM6IDUy
MTRiNTYzNTg4ZSAoImNvcmVzaWdodDogZXRtNHg6IEFkZCBzdXBwb3J0IGZvciBzeXNyZWcgb25s
eSBkZXZpY2VzIgoKU3VyZSwgd2lsbCBhZGQgdGhpcyAnRml4ZXMnIHRhZyBoZXJlLgoKPiAKPj4K
Pj4gQ2M6IExvcmVuem8gUGllcmFsaXNpIDxscGllcmFsaXNpQGtlcm5lbC5vcmc+Cj4+IENjOiBI
YW5qdW4gR3VvIDxndW9oYW5qdW5AaHVhd2VpLmNvbT4KPj4gQ2M6IFN1ZGVlcCBIb2xsYSA8c3Vk
ZWVwLmhvbGxhQGFybS5jb20+Cj4+IENjOiAiUmFmYWVsIEouIFd5c29ja2kiIDxyYWZhZWxAa2Vy
bmVsLm9yZz4KPj4gQ2M6IExlbiBCcm93biA8bGVuYkBrZXJuZWwub3JnPgo+PiBDYzogU3V6dWtp
IEsgUG91bG9zZSA8c3V6dWtpLnBvdWxvc2VAYXJtLmNvbT4KPj4gQ2M6IE1pa2UgTGVhY2ggPG1p
a2UubGVhY2hAbGluYXJvLm9yZz4KPj4gQ2M6IEphbWVzIENsYXJrIDxqYW1lcy5jbGFya0Bhcm0u
Y29tPgo+PiBDYzogTGVvIFlhbiA8bGVvLnlhbkBsaW5hcm8ub3JnPgo+PiBDYzogbGludXgtYWNw
aUB2Z2VyLmtlcm5lbC5vcmcKPj4gQ2M6IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFk
Lm9yZwo+PiBDYzogbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZwo+PiBDYzogY29yZXNpZ2h0
QGxpc3RzLmxpbmFyby5vcmcKPj4gU2lnbmVkLW9mZi1ieTogQW5zaHVtYW4gS2hhbmR1YWwgPGFu
c2h1bWFuLmtoYW5kdWFsQGFybS5jb20+Cj4+IC0tLQo+PiBDaGFuZ2VzIGluIFY0Ogo+Pgo+PiAt
IE5ldyBwYXRjaCBpbiB0aGUgc2VyaWVzCj4+Cj4+IMKgIGRyaXZlcnMvaHd0cmFjaW5nL2NvcmVz
aWdodC9jb3Jlc2lnaHQtZXRtNHgtY29yZS5jIHwgMyArKysKPj4gwqAgMSBmaWxlIGNoYW5nZWQs
IDMgaW5zZXJ0aW9ucygrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9od3RyYWNpbmcvY29y
ZXNpZ2h0L2NvcmVzaWdodC1ldG00eC1jb3JlLmMgYi9kcml2ZXJzL2h3dHJhY2luZy9jb3Jlc2ln
aHQvY29yZXNpZ2h0LWV0bTR4LWNvcmUuYwo+PiBpbmRleCBjZTE5OTVhMjgyN2YuLjdjNjkzYjQ1
YWMwNSAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9od3RyYWNpbmcvY29yZXNpZ2h0L2NvcmVzaWdo
dC1ldG00eC1jb3JlLmMKPj4gKysrIGIvZHJpdmVycy9od3RyYWNpbmcvY29yZXNpZ2h0L2NvcmVz
aWdodC1ldG00eC1jb3JlLmMKPj4gQEAgLTIyMTcsNiArMjIxNyw5IEBAIHN0YXRpYyBpbnQgZXRt
NF9wcm9iZV9wbGF0Zm9ybV9kZXYoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPj4gwqDC
oMKgwqDCoCByZXQgPSBldG00X3Byb2JlKCZwZGV2LT5kZXYpOwo+PiDCoCDCoMKgwqDCoMKgIHBt
X3J1bnRpbWVfcHV0KCZwZGV2LT5kZXYpOwo+PiArwqDCoMKgIGlmIChyZXQpCj4+ICvCoMKgwqDC
oMKgwqDCoCBwbV9ydW50aW1lX2Rpc2FibGUoJnBkZXYtPmRldik7Cj4+ICsKPj4gwqDCoMKgwqDC
oCByZXR1cm4gcmV0Owo+PiDCoCB9Cj4+IMKgIAo+IAo+IExvb2tzIGdvb2QgdG8gbWUuIEkgaGF2
ZSBnbGFuY2VkIHRocm91Z2ggdGhlIG90aGVyIHBsYXRmb3JtIGRldmljZSBkcml2ZXIgY29kZSBp
biBjb3Jlc2lnaHQgc3Vic3lzdGVtIGFuZCB0aGV5IGFsbCBzZWVtIHRvIGJlIHNhZmUsIGV4Y2Vw
dAo+IGZvciBVbHRyYXNvYy1zbWIsIHdoaWNoIGRvZXNuJ3QgZG8gYW55IHBvd2VyIG1hbmFnbWVu
dC4gSXQgbWF5IGJlLCBiZWNhdXNlIGl0IGlzIG9ubHkgc3VwcG9ydGVkIG9uIGFuIEFDUEkgc3lz
dGVtLgoKVW5kZXJzdG9vZC4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21h
aWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
