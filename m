Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D2BF790237B
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Jun 2024 16:05:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8795AC6DD9B;
	Mon, 10 Jun 2024 14:05:18 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 354FEC6B47E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Jun 2024 14:05:11 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E5686106F;
 Mon, 10 Jun 2024 07:05:34 -0700 (PDT)
Received: from [10.57.42.97] (unknown [10.57.42.97])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3FEED3F73B;
 Mon, 10 Jun 2024 07:05:06 -0700 (PDT)
Message-ID: <56a60219-1440-425f-8680-8eaae2bb42c1@arm.com>
Date: Mon, 10 Jun 2024 15:05:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Suzuki K Poulose <suzuki.poulose@arm.com>
References: <20240604143030.519906-1-james.clark@arm.com>
 <20240604143030.519906-16-james.clark@arm.com>
 <a697111a-ec64-451a-aee1-3709bd08e73e@arm.com>
Content-Language: en-US
From: James Clark <james.clark@arm.com>
In-Reply-To: <a697111a-ec64-451a-aee1-3709bd08e73e@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Rogers <irogers@google.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Will Deacon <will@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, anshuman.khandual@arm.com,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 mike.leach@linaro.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 John Garry <john.g.garry@oracle.com>, coresight@lists.linaro.org,
 Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, leo.yan@linux.dev,
 Jiri Olsa <jolsa@kernel.org>, gankulkarni@os.amperecomputing.com
Subject: Re: [Linux-stm32] [PATCH v2 15/16] coresight: Re-emit trace IDs
 when the sink changes in per-thread mode
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

CgpPbiAxMC8wNi8yMDI0IDExOjI5LCBTdXp1a2kgSyBQb3Vsb3NlIHdyb3RlOgo+IE9uIDA0LzA2
LzIwMjQgMTU6MzAsIEphbWVzIENsYXJrIHdyb3RlOgo+PiBJbiBwZXItY3B1IG1vZGUgdGhlcmUg
YXJlIG11bHRpcGxlIGF1eCBidWZmZXJzIGFuZCBlYWNoIG9uZSBoYXMgYQo+PiBmaXhlZCBzaW5r
LCBzbyB0aGUgaHcgSUQgbWFwcGluZ3Mgd2hpY2ggb25seSBuZWVkIHRvIGJlIGVtaXR0ZWQgb25j
ZQo+PiBmb3IgZWFjaCBidWZmZXIsIGV2ZW4gd2l0aCB0aGUgbmV3IHBlci1zaW5rIHRyYWNlIElE
IHBvb2xzLgo+Pgo+PiBCdXQgaW4gcGVyLXRocmVhZCBtb2RlIHRoZXJlIGlzIG9ubHkgYSBzaW5n
bGUgYnVmZmVyIHdoaWNoIGNhbiBiZQo+PiB3cml0dGVuIHRvIGZyb20gYW55IHNpbmsgd2l0aCBu
b3cgcG90ZW50aWFsbHkgb3ZlcmxhcHBpbmcgdHJhY2UgSURzLCBzbwo+PiBodyBJRCBtYXBwaW5n
cyBuZWVkIHRvIGJlIHJlLWVtaXR0ZWQgZXZlcnkgdGltZSB0aGUgc2luayBjaGFuZ2VzLgo+Pgo+
PiBUaGlzIHdpbGwgcmVxdWlyZSBhIGNoYW5nZSBpbiBQZXJmIHRvIHRyYWNrIHRoaXMgc28gaXQg
a25vd3Mgd2hpY2gKPj4gZGVjb2RlIHRyZWUgdG8gdXNlIGZvciBlYWNoIHNlZ21lbnQgb2YgdGhl
IGJ1ZmZlci4gSW4gdGhlb3J5IGl0J3MgYWxzbwo+PiBwb3NzaWJsZSB0byBsb29rIGF0IHRoZSBD
UFUgSUQgb24gdGhlIEFVWCByZWNvcmRzLCBidXQgdGhpcyBpcyBtb3JlCj4+IGNvbnNpc3RlbnQg
d2l0aCB0aGUgZXhpc3Rpbmcgc3lzdGVtLCBhbmQgYWxsb3dzIGZvciBjb3JyZWN0IGRlY29kZSB1
c2luZwo+PiBlaXRoZXIgbWVjaGFuaXNtLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBKYW1lcyBDbGFy
ayA8amFtZXMuY2xhcmtAYXJtLmNvbT4KPj4gLS0tCj4+IMKgIGRyaXZlcnMvaHd0cmFjaW5nL2Nv
cmVzaWdodC9jb3Jlc2lnaHQtZXRtLXBlcmYuYyB8IDE0ICsrKysrKysrKysrKysrCj4+IMKgIGRy
aXZlcnMvaHd0cmFjaW5nL2NvcmVzaWdodC9jb3Jlc2lnaHQtZXRtLXBlcmYuaCB8wqAgMiArKwo+
PiDCoCAyIGZpbGVzIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKykKPj4KPj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvaHd0cmFjaW5nL2NvcmVzaWdodC9jb3Jlc2lnaHQtZXRtLXBlcmYuYwo+PiBiL2Ry
aXZlcnMvaHd0cmFjaW5nL2NvcmVzaWdodC9jb3Jlc2lnaHQtZXRtLXBlcmYuYwo+PiBpbmRleCAx
N2NhZmExYTdmMTguLmI2ZjUwNWI1MGU2NyAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9od3RyYWNp
bmcvY29yZXNpZ2h0L2NvcmVzaWdodC1ldG0tcGVyZi5jCj4+ICsrKyBiL2RyaXZlcnMvaHd0cmFj
aW5nL2NvcmVzaWdodC9jb3Jlc2lnaHQtZXRtLXBlcmYuYwo+PiBAQCAtNDk5LDYgKzQ5OSwyMCBA
QCBzdGF0aWMgdm9pZCBldG1fZXZlbnRfc3RhcnQoc3RydWN0IHBlcmZfZXZlbnQKPj4gKmV2ZW50
LCBpbnQgZmxhZ3MpCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgJnNpbmstPnBlcmZfc2lua19pZF9tYXApKQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgZ290
byBmYWlsX2Rpc2FibGVfcGF0aDsKPj4gwqAgK8KgwqDCoCAvKgo+PiArwqDCoMKgwqAgKiBJbiBw
ZXItY3B1IG1vZGUgdGhlcmUgYXJlIG11bHRpcGxlIGF1eCBidWZmZXJzIGFuZCBlYWNoIG9uZSBo
YXMgYQo+PiArwqDCoMKgwqAgKiBmaXhlZCBzaW5rLCBzbyB0aGUgaHcgSUQgbWFwcGluZ3Mgd2hp
Y2ggb25seSBuZWVkIHRvIGJlCj4+IGVtaXR0ZWQgb25jZQo+PiArwqDCoMKgwqAgKiBmb3IgZWFj
aCBidWZmZXIuCj4+ICvCoMKgwqDCoCAqCj4+ICvCoMKgwqDCoCAqIEJ1dCBpbiBwZXItdGhyZWFk
IG1vZGUgdGhlcmUgaXMgb25seSBhIHNpbmdsZSBidWZmZXIgd2hpY2ggY2FuIGJlCj4+ICvCoMKg
wqDCoCAqIHdyaXR0ZW4gdG8gZnJvbSBhbnkgc2luayB3aXRoIHBvdGVudGlhbGx5IG92ZXJsYXBw
aW5nIHRyYWNlCj4+IElEcywgc28KPj4gK8KgwqDCoMKgICogaHcgSUQgbWFwcGluZ3MgbmVlZCB0
byBiZSByZS1lbWl0dGVkIGV2ZXJ5IHRpbWUgdGhlIHNpbmsgY2hhbmdlcy4KPj4gK8KgwqDCoMKg
ICovCj4+ICvCoMKgwqAgaWYgKGV2ZW50LT5jcHUgPT0gLTEgJiYgZXZlbnRfZGF0YS0+bGFzdF9z
aW5rX2h3aWQgIT0gc2luaykgewo+PiArwqDCoMKgwqDCoMKgwqAgY3B1bWFza19jbGVhcigmZXZl
bnRfZGF0YS0+YXV4X2h3aWRfZG9uZSk7Cj4+ICvCoMKgwqDCoMKgwqDCoCBldmVudF9kYXRhLT5s
YXN0X3NpbmtfaHdpZCA9IHNpbms7Cj4+ICvCoMKgwqAgfQo+IAo+IEkgYW0gd29uZGVyaW5nIGlm
IHdlIHJlYWxseSBuZWVkIHRoaXMgcGF0Y2gsIGFzIHdlIGhhdmUgdGhlIHNpbmtpZCBpbgo+IHRo
ZSBIV0lEIGFscmVhZHkgPyBXZSB3b3VsZCBlbWl0IHRoZSBwYWNrZXQgZm9yIGVhY2ggQ1BVIG9u
bHkgb25jZSBhbmQKPiB0aGF0IHdvdWxkbid0IGNoYW5nZSB0aGUgSFdJRCA/Cj4gCj4gU3V6dWtp
Cj4gCj4gCgpJdCB3b3VsZCBiZSBuZWVkZWQgZm9yIHBlci10aHJlYWQgbW9kZSBpZiB3ZSBkaWRu
J3QgaGF2ZSB0aGUgQ1BVIHNhbXBsZQpiaXQgc2V0IG9uIEFVWCByZWNvcmRzLiBCZWNhdXNlIG90
aGVyd2lzZSB5b3Ugd291bGRuJ3Qga25vdyB3aGVuIHRoZQpwcm9jZXNzIGhhZCBtb3ZlZCB0byBh
IG5ldyBzaW5rIHdpdGggbmV3IG1hcHBpbmdzLiBCdXQgSSBzdXBwb3NlIHRoaXMgaXMKcmVkdW5k
YW50IGluZm9ybWF0aW9uIG5vdyB0aGF0IHRoZSBDUFUgYml0IGlzIHNldCBvbiBBVVggcmVjb3Jk
cyBzbyBJCmNhbiByZW1vdmUgdGhpcy4KCkkgd2FzIHRoaW5raW5nIGl0IG1pZ2h0IGJlIG5pY2Ug
aWYgYSB0b29sIF9vbmx5XyB3YW50ZWQgdG8gbG9vayBhdCBIV0lEcwp0aGVuIGl0IGNvdWxkIGRv
IHRoZSBkZWNvZGUgY29ycmVjdGx5IHdpdGgganVzdCB0aGF0LiBJZiB3ZSByZW1vdmUgdGhpcwp0
aGVuIHRvb2xzIHdpbGwgYWx3YXlzIGhhdmUgdG8gc2V0IHRoZSBDUFUgc2FtcGxlIGJpdCwgYnV0
IGl0J3MgcHJldHR5Cm11Y2ggcmVxdWlyZWQgYW55d2F5IGFuZCBQZXJmIHdhcyBhbHJlYWR5IGRv
aW5nIGl0LgoKSmFtZXMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
