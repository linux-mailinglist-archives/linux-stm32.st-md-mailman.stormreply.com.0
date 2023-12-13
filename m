Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 013238128B7
	for <lists+linux-stm32@lfdr.de>; Thu, 14 Dec 2023 08:06:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 936BBC6DD6C;
	Thu, 14 Dec 2023 07:06:37 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 79087C6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 Dec 2023 16:28:52 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B1E6BC15;
 Wed, 13 Dec 2023 08:29:37 -0800 (PST)
Received: from [10.57.45.12] (unknown [10.57.45.12])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7B4F33F738;
 Wed, 13 Dec 2023 08:28:50 -0800 (PST)
Message-ID: <68d6f2bb-3c18-4dce-ba32-6925955dcc35@arm.com>
Date: Wed, 13 Dec 2023 16:28:49 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: James Clark <james.clark@arm.com>, coresight@lists.linaro.org
References: <20231212155407.1429121-1-james.clark@arm.com>
 <20231212155407.1429121-2-james.clark@arm.com>
 <a1ab2481-0ec0-4e29-b6af-bcce4cf0b57d@arm.com>
 <3c7665ff-b2e2-f10d-a78a-4ddc1791926f@arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <3c7665ff-b2e2-f10d-a78a-4ddc1791926f@arm.com>
X-Mailman-Approved-At: Thu, 14 Dec 2023 07:06:35 +0000
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Mike Leach <mike.leach@linaro.org>
Subject: Re: [Linux-stm32] [PATCH 1/8] coresight: Fix issue where a source
 device's helpers aren't disabled
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

T24gMTMvMTIvMjAyMyAxMzo1NCwgSmFtZXMgQ2xhcmsgd3JvdGU6Cj4gCj4gCj4gT24gMTIvMTIv
MjAyMyAxNzo0NCwgU3V6dWtpIEsgUG91bG9zZSB3cm90ZToKPj4gSGkgSmFtZXMKPj4KPj4gT24g
MTIvMTIvMjAyMyAxNTo1MywgSmFtZXMgQ2xhcmsgd3JvdGU6Cj4+PiBUaGUgbGlua2VkIGNvbW1p
dCByZXZlcnRzIHRoZSBjaGFuZ2UgdGhhdCBhY2NpZGVudGFsbHkgdXNlZCBzb21lIHN5c2ZzCj4+
PiBlbmFibGUvZGlzYWJsZSBmdW5jdGlvbnMgZnJvbSBQZXJmIHdoaWNoIGJyb2tlIHRoZSByZWZj
b3VudGluZywgYnV0IGl0Cj4+PiBhbHNvIHJlbW92ZXMgdGhlIGZhY3QgdGhhdCB0aGUgc3lzZnMg
ZGlzYWJsZSBmdW5jdGlvbiBkaXNhYmxlZCB0aGUKPj4+IGhlbHBlcnMuCj4+Cj4+Cj4+Pgo+Pj4g
QWRkIGEgbmV3IHdyYXBwZXIgZnVuY3Rpb24gdGhhdCBkb2VzIGJvdGggd2hpY2ggaXMgdXNlZCBi
eSBib3RoIFBlcmYgYW5kCj4+PiBzeXNmcywgYW5kIGxhYmVsIHRoZSBzeXNmcyBkaXNhYmxlIGZ1
bmN0aW9uIGFwcHJvcHJpYXRlbHkuIFRoZSBuYW1pbmcgb2YKPj4+IGFsbCBvZiB0aGUgZnVuY3Rp
b25zIHdpbGwgYmUgdGlkaWVkIHVwIGxhdGVyIHRvIGF2b2lkIHRoaXMgaGFwcGVuaW5nCj4+PiBh
Z2Fpbi4KPj4+Cj4+PiBGaXhlczogMjg3ZTgyY2Y2OWFhICgiY29yZXNpZ2h0OiBGaXggY3Jhc2gg
d2hlbiBQZXJmIGFuZCBzeXNmcyBtb2Rlcwo+Pj4gYXJlIHVzZWQgY29uY3VycmVudGx5IikKPj4K
Pj4gQnV0IHdlIHN0aWxsIGRvbid0ICJlbmFibGUiIHRoZSBoZWxwZXJzIGZyb20gcGVyZiBtb2Rl
IHdpdGggdGhpcyBwYXRjaC4KPj4gaS5lLiwgd2UgdXNlIHNvdXJjZV9vcHMoKS0+ZW5hYmxlIGRp
cmVjdGx5LiBTbywgSSBndWVzcyB0aGlzIHBhdGNoCj4+IGRvZXNuJ3QgZml4IGEgYnVnIGFzIHN1
Y2guIEJ1dCB0aGF0IHNhaWQsIGl0IHdvdWxkIGJlIGdvb2QgdG8KPj4gZW5hYmxlL2Rpc2FibGUg
aGVscGVycyBmb3Igc291cmNlcywgaW4gcGVyZiBtb2RlLgo+Pgo+PiBTdXp1a2kKPiAKPiBXZSBk
bywgaXQgaGFwcGVucyBpbiBjb3Jlc2lnaHRfZW5hYmxlX3BhdGgoKSB3aGljaCBQZXJmIHVzZXMu
IEkgYWRkZWQKPiB0aGUgY29tbWVudCBiZWxvdyBhYm91dCB0aGF0LgoKQWgsIEkgc2VlLiBUaGF0
IGluZGVlZCBpcyBhIGJpdCBjb25mdXNpbmcuIEFuZCBJIHRoaW5rIGFsbCB1c2VycyBvZiAKY29y
ZXNpZ2h0X2VuYWJsZV9wYXRoKCkgZW5hYmxlcyB0aGUgc291cmNlIHJpZ2h0IGFmdGVyLiBTbywg
SSBkb24ndApzZWUgYW55IHBvaW50IGluIGhhdmluZyBpdCBzZXBhcmF0ZS4gVGhhdCBzYWlkLCB0
aGlzIGZpeCBtYWtlcyBzZW5zZQphbmQgYXBvbG9naWVzIGZvciB0aGUgY29uZnVzaW9uLiBXZSBj
b3VsZCBtYXkgYmUgY2xlYW51cCB0aGUgCmVuYWJsZV9wYXRoKCkgdG8gZW5hYmxlIHRoZSBzb3Vy
Y2UgdG9vLCBpbiBhIHNlcGFyYXRlIHBhdGNoLgoKU3V6dWtpCgoKPiAKPiAgIFsuLi5dCj4gCj4+
PiAgwqAgKy8qCj4+PiArICogSGVscGVyIGZ1bmN0aW9uIHRvIGNhbGwgc291cmNlX29wcyhjc2Rl
diktPmRpc2FibGUgYW5kIGFsc28KPj4+IGRpc2FibGUgdGhlCj4+PiArICogaGVscGVycy4KPj4+
ICsgKgo+Pj4gKyAqIFRoZXJlIGlzIGFuIGltYmFsYW5jZSBiZXR3ZWVuIGNvcmVzaWdodF9lbmFi
bGVfcGF0aCgpIGFuZAo+Pj4gKyAqIGNvcmVzaWdodF9kaXNhYmxlX3BhdGgoKS4gRW5hYmxpbmcg
YWxzbyBlbmFibGVzIHRoZSBzb3VyY2Uncwo+Pj4gaGVscGVycyBhcyBwYXJ0Cj4+PiArICogb2Yg
dGhlIHBhdGgsIGJ1dCBkaXNhYmxpbmcgYWx3YXlzIHNraXBzIHRoZSBmaXJzdCBpdGVtIGluIHRo
ZSBwYXRoCj4+PiAod2hpY2ggaXMKPj4+ICsgKiB0aGUgc291cmNlKSwgc28gc291cmNlcyBhbmQg
dGhlaXIgaGVscGVycyBkb24ndCBnZXQgZGlzYWJsZWQgYXMKPj4+IHBhcnQgb2YgdGhhdAo+Pj4g
KyAqIGZ1bmN0aW9uIGFuZCB3ZSBuZWVkIHRoZSBleHRyYSBzdGVwIGhlcmUuCj4+PiArICovCj4g
Cj4gVGhlIHJlYXNvbiBjb3Jlc2lnaHRfZGlzYWJsZV9wYXRoKCkgc2tpcHMgdGhlIGZpcnN0IGl0
ZW0gaXMgYmVjYXVzZSBpdCdzCj4gdXNlZCBhZnRlciBlcnJvcnMgd2hlcmUgYSBwYXRoIGlzIG9u
bHkgcGFydGlhbGx5IGVuYWJsZWQgYW5kIGl0IHVud2luZHMsCj4gc2tpcHBpbmcgdGhlIGxhc3Qg
aXRlbSwgYmVjYXVzZSB0aGUgbGFzdCBpdGVtIGRpZG4ndCBlbmFibGUuCj4gCj4gSXQgc2VlbWVk
IGEgYml0IG1vcmUgaW50cnVzaXZlIHRvIGNoYW5nZSB0aGF0LCBhbmQgaXQncyBhbHJlYWR5IHdv
cmtpbmcuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0
aW5mby9saW51eC1zdG0zMgo=
