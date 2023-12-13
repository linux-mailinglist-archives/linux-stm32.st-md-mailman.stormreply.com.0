Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D88978128B6
	for <lists+linux-stm32@lfdr.de>; Thu, 14 Dec 2023 08:06:37 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 82581C6DD6A;
	Thu, 14 Dec 2023 07:06:37 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 74E40C6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 Dec 2023 13:54:32 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D486BC15;
 Wed, 13 Dec 2023 05:55:17 -0800 (PST)
Received: from [192.168.1.3] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A66F73F738;
 Wed, 13 Dec 2023 05:54:30 -0800 (PST)
Message-ID: <3c7665ff-b2e2-f10d-a78a-4ddc1791926f@arm.com>
Date: Wed, 13 Dec 2023 13:54:26 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
To: Suzuki K Poulose <suzuki.poulose@arm.com>, coresight@lists.linaro.org
References: <20231212155407.1429121-1-james.clark@arm.com>
 <20231212155407.1429121-2-james.clark@arm.com>
 <a1ab2481-0ec0-4e29-b6af-bcce4cf0b57d@arm.com>
From: James Clark <james.clark@arm.com>
In-Reply-To: <a1ab2481-0ec0-4e29-b6af-bcce4cf0b57d@arm.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

CgpPbiAxMi8xMi8yMDIzIDE3OjQ0LCBTdXp1a2kgSyBQb3Vsb3NlIHdyb3RlOgo+IEhpIEphbWVz
Cj4gCj4gT24gMTIvMTIvMjAyMyAxNTo1MywgSmFtZXMgQ2xhcmsgd3JvdGU6Cj4+IFRoZSBsaW5r
ZWQgY29tbWl0IHJldmVydHMgdGhlIGNoYW5nZSB0aGF0IGFjY2lkZW50YWxseSB1c2VkIHNvbWUg
c3lzZnMKPj4gZW5hYmxlL2Rpc2FibGUgZnVuY3Rpb25zIGZyb20gUGVyZiB3aGljaCBicm9rZSB0
aGUgcmVmY291bnRpbmcsIGJ1dCBpdAo+PiBhbHNvIHJlbW92ZXMgdGhlIGZhY3QgdGhhdCB0aGUg
c3lzZnMgZGlzYWJsZSBmdW5jdGlvbiBkaXNhYmxlZCB0aGUKPj4gaGVscGVycy4KPiAKPiAKPj4K
Pj4gQWRkIGEgbmV3IHdyYXBwZXIgZnVuY3Rpb24gdGhhdCBkb2VzIGJvdGggd2hpY2ggaXMgdXNl
ZCBieSBib3RoIFBlcmYgYW5kCj4+IHN5c2ZzLCBhbmQgbGFiZWwgdGhlIHN5c2ZzIGRpc2FibGUg
ZnVuY3Rpb24gYXBwcm9wcmlhdGVseS4gVGhlIG5hbWluZyBvZgo+PiBhbGwgb2YgdGhlIGZ1bmN0
aW9ucyB3aWxsIGJlIHRpZGllZCB1cCBsYXRlciB0byBhdm9pZCB0aGlzIGhhcHBlbmluZwo+PiBh
Z2Fpbi4KPj4KPj4gRml4ZXM6IDI4N2U4MmNmNjlhYSAoImNvcmVzaWdodDogRml4IGNyYXNoIHdo
ZW4gUGVyZiBhbmQgc3lzZnMgbW9kZXMKPj4gYXJlIHVzZWQgY29uY3VycmVudGx5IikKPiAKPiBC
dXQgd2Ugc3RpbGwgZG9uJ3QgImVuYWJsZSIgdGhlIGhlbHBlcnMgZnJvbSBwZXJmIG1vZGUgd2l0
aCB0aGlzIHBhdGNoLgo+IGkuZS4sIHdlIHVzZSBzb3VyY2Vfb3BzKCktPmVuYWJsZSBkaXJlY3Rs
eS4gU28sIEkgZ3Vlc3MgdGhpcyBwYXRjaAo+IGRvZXNuJ3QgZml4IGEgYnVnIGFzIHN1Y2guIEJ1
dCB0aGF0IHNhaWQsIGl0IHdvdWxkIGJlIGdvb2QgdG8KPiBlbmFibGUvZGlzYWJsZSBoZWxwZXJz
IGZvciBzb3VyY2VzLCBpbiBwZXJmIG1vZGUuCj4gCj4gU3V6dWtpCgpXZSBkbywgaXQgaGFwcGVu
cyBpbiBjb3Jlc2lnaHRfZW5hYmxlX3BhdGgoKSB3aGljaCBQZXJmIHVzZXMuIEkgYWRkZWQKdGhl
IGNvbW1lbnQgYmVsb3cgYWJvdXQgdGhhdC4KCiBbLi4uXQoKPj4gwqAgKy8qCj4+ICsgKiBIZWxw
ZXIgZnVuY3Rpb24gdG8gY2FsbCBzb3VyY2Vfb3BzKGNzZGV2KS0+ZGlzYWJsZSBhbmQgYWxzbwo+
PiBkaXNhYmxlIHRoZQo+PiArICogaGVscGVycy4KPj4gKyAqCj4+ICsgKiBUaGVyZSBpcyBhbiBp
bWJhbGFuY2UgYmV0d2VlbiBjb3Jlc2lnaHRfZW5hYmxlX3BhdGgoKSBhbmQKPj4gKyAqIGNvcmVz
aWdodF9kaXNhYmxlX3BhdGgoKS4gRW5hYmxpbmcgYWxzbyBlbmFibGVzIHRoZSBzb3VyY2Uncwo+
PiBoZWxwZXJzIGFzIHBhcnQKPj4gKyAqIG9mIHRoZSBwYXRoLCBidXQgZGlzYWJsaW5nIGFsd2F5
cyBza2lwcyB0aGUgZmlyc3QgaXRlbSBpbiB0aGUgcGF0aAo+PiAod2hpY2ggaXMKPj4gKyAqIHRo
ZSBzb3VyY2UpLCBzbyBzb3VyY2VzIGFuZCB0aGVpciBoZWxwZXJzIGRvbid0IGdldCBkaXNhYmxl
ZCBhcwo+PiBwYXJ0IG9mIHRoYXQKPj4gKyAqIGZ1bmN0aW9uIGFuZCB3ZSBuZWVkIHRoZSBleHRy
YSBzdGVwIGhlcmUuCj4+ICsgKi8KClRoZSByZWFzb24gY29yZXNpZ2h0X2Rpc2FibGVfcGF0aCgp
IHNraXBzIHRoZSBmaXJzdCBpdGVtIGlzIGJlY2F1c2UgaXQncwp1c2VkIGFmdGVyIGVycm9ycyB3
aGVyZSBhIHBhdGggaXMgb25seSBwYXJ0aWFsbHkgZW5hYmxlZCBhbmQgaXQgdW53aW5kcywKc2tp
cHBpbmcgdGhlIGxhc3QgaXRlbSwgYmVjYXVzZSB0aGUgbGFzdCBpdGVtIGRpZG4ndCBlbmFibGUu
CgpJdCBzZWVtZWQgYSBiaXQgbW9yZSBpbnRydXNpdmUgdG8gY2hhbmdlIHRoYXQsIGFuZCBpdCdz
IGFscmVhZHkgd29ya2luZy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21h
aWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
