Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E618C8465
	for <lists+linux-stm32@lfdr.de>; Fri, 17 May 2024 12:01:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 155A1C6DD6D;
	Fri, 17 May 2024 10:01:15 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 73375C6DD6B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 May 2024 10:01:08 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AA9C21424;
 Fri, 17 May 2024 03:01:31 -0700 (PDT)
Received: from [10.91.2.16] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D98DF3F762;
 Fri, 17 May 2024 03:01:04 -0700 (PDT)
Message-ID: <02bec885-5fd7-42dd-b85c-9547be7d3211@arm.com>
Date: Fri, 17 May 2024 12:01:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Suzuki K Poulose <suzuki.poulose@arm.com>
References: <20240429152207.479221-1-james.clark@arm.com>
 <20240429152207.479221-18-james.clark@arm.com>
 <0d433917-f638-4ca6-ba6a-1d5e85895024@arm.com>
Content-Language: en-US
From: James Clark <james.clark@arm.com>
In-Reply-To: <0d433917-f638-4ca6-ba6a-1d5e85895024@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Rogers <irogers@google.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Will Deacon <will@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 mike.leach@linaro.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 John Garry <john.g.garry@oracle.com>, coresight@lists.linaro.org,
 Arnaldo Carvalho de Melo <acme@kernel.org>, scclevenger@os.amperecomputing.com,
 Namhyung Kim <namhyung@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 Leo Yan <leo.yan@linux.dev>, Jiri Olsa <jolsa@kernel.org>,
 gankulkarni@os.amperecomputing.com
Subject: Re: [Linux-stm32] [PATCH 16/17] coresight: Re-emit trace IDs when
 the sink changes in per-thread mode
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

CgpPbiAwNy8wNS8yMDI0IDEzOjA1LCBTdXp1a2kgSyBQb3Vsb3NlIHdyb3RlOgo+IE9uIDI5LzA0
LzIwMjQgMTY6MjIsIEphbWVzIENsYXJrIHdyb3RlOgo+PiBJbiBwZXItY3B1IG1vZGUgdGhlcmUg
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
aXZlcnMvaHd0cmFjaW5nL2NvcmVzaWdodC9jb3Jlc2lnaHQtZXRtLXBlcmYuYwo+PiBpbmRleCBm
MDcxNzNhYTRkNjYuLjA4ZjM5NThmOTM2NyAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9od3RyYWNp
bmcvY29yZXNpZ2h0L2NvcmVzaWdodC1ldG0tcGVyZi5jCj4+ICsrKyBiL2RyaXZlcnMvaHd0cmFj
aW5nL2NvcmVzaWdodC9jb3Jlc2lnaHQtZXRtLXBlcmYuYwo+PiBAQCAtNDk5LDYgKzQ5OSwyMCBA
QCBzdGF0aWMgdm9pZCBldG1fZXZlbnRfc3RhcnQoc3RydWN0IHBlcmZfZXZlbnQKPj4gKmV2ZW50
LCBpbnQgZmxhZ3MpCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgJnNpbmstPnBlcmZfaWRfbWFwKSkKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGdvdG8gZmFp
bF9kaXNhYmxlX3BhdGg7Cj4+IMKgICvCoMKgwqAgLyoKPj4gK8KgwqDCoMKgICogSW4gcGVyLWNw
dSBtb2RlIHRoZXJlIGFyZSBtdWx0aXBsZSBhdXggYnVmZmVycyBhbmQgZWFjaCBvbmUgaGFzIGEK
Pj4gK8KgwqDCoMKgICogZml4ZWQgc2luaywgc28gdGhlIGh3IElEIG1hcHBpbmdzIHdoaWNoIG9u
bHkgbmVlZCB0byBiZQo+PiBlbWl0dGVkIG9uY2UKPj4gK8KgwqDCoMKgICogZm9yIGVhY2ggYnVm
ZmVyLgo+PiArwqDCoMKgwqAgKgo+PiArwqDCoMKgwqAgKiBCdXQgaW4gcGVyLXRocmVhZCBtb2Rl
IHRoZXJlIGlzIG9ubHkgYSBzaW5nbGUgYnVmZmVyIHdoaWNoIGNhbiBiZQo+PiArwqDCoMKgwqAg
KiB3cml0dGVuIHRvIGZyb20gYW55IHNpbmsgd2l0aCBwb3RlbnRpYWxseSBvdmVybGFwcGluZyB0
cmFjZQo+PiBJRHMsIHNvCj4+ICvCoMKgwqDCoCAqIGh3IElEIG1hcHBpbmdzIG5lZWQgdG8gYmUg
cmUtZW1pdHRlZCBldmVyeSB0aW1lIHRoZSBzaW5rIGNoYW5nZXMuCj4+ICvCoMKgwqDCoCAqLwo+
PiArwqDCoMKgIGlmIChldmVudC0+Y3B1ID09IC0xICYmIGV2ZW50X2RhdGEtPmxhc3Rfc2lua19o
d2lkICE9IHNpbmspIHsKPj4gK8KgwqDCoMKgwqDCoMKgIGNwdW1hc2tfY2xlYXIoJmV2ZW50X2Rh
dGEtPmF1eF9od2lkX2RvbmUpOwo+PiArwqDCoMKgwqDCoMKgwqAgZXZlbnRfZGF0YS0+bGFzdF9z
aW5rX2h3aWQgPSBzaW5rOwo+PiArwqDCoMKgIH0KPj4gKwo+IAo+IFdpdGggdGhlIHRyYWNlaWQg
Y2FjaGluZyBpbiB0aGUgZXZlbnRfZGF0YSBwZXItY3B1ICwgd2UgY291bGQgYXZvaWQgdGhpcwo+
IHN0ZXAgPwo+IAo+IFN1enVraQo+IAo+IAoKSSBkb24ndCB0aGluayBzbywgdGhpcyBpcyB0byBp
bmZvcm0gdGhlIHRvb2wgdGhhdCB0aGUgbWFwcGluZ3MgaGF2ZQpjaGFuZ2VkIGlmIHRoZSB0b29s
IGRvZXNuJ3Qgd2FudCB0byBmb2xsb3cgc3dpdGNoIGV2ZW50cy4KClVubGVzcyBJJ20gbWlzc2lu
ZyBzb21ldGhpbmcsIG1vdmluZyB3aGVyZSB0aGUgdHJhY2UgaWRzIGFyZSBzdG9yZWQKZG9lc24n
dCBtZWFuIHRoYXQgdGhleSB3aWxsIGJlIHJlLXNlbnQgd2hlbiB0aGUgbWFwcGluZ3MgY2hhbmdl
PwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1z
dG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9s
aW51eC1zdG0zMgo=
