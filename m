Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E4C3585C14
	for <lists+linux-stm32@lfdr.de>; Sat, 30 Jul 2022 22:30:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 62FDBC03FE0;
	Sat, 30 Jul 2022 20:30:50 +0000 (UTC)
Received: from smtp.smtpout.orange.fr (smtp-21.smtpout.orange.fr
 [80.12.242.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6BAB9C03FCD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 30 Jul 2022 20:30:49 +0000 (UTC)
Received: from [192.168.1.18] ([90.11.190.129]) by smtp.orange.fr with ESMTPA
 id Ht6bo0sxd5V1hHt6bojkgf; Sat, 30 Jul 2022 22:30:49 +0200
X-ME-Helo: [192.168.1.18]
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Sat, 30 Jul 2022 22:30:49 +0200
X-ME-IP: 90.11.190.129
Message-ID: <e5cbad07-f930-8a66-2579-42f993ca566a@wanadoo.fr>
Date: Sat, 30 Jul 2022 22:30:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Newsgroups: gmane.linux.kernel.janitors, gmane.linux.kernel,
 gmane.linux.network, gmane.linux.ports.arm.kernel
References: <b5b44a0c025d0fdddd9b9d23153261363089a06a.1659204745.git.christophe.jaillet@wanadoo.fr>
 <YuWR9I8y9cWlLG3O@smile.fi.intel.com>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <YuWR9I8y9cWlLG3O@smile.fi.intel.com>
Cc: Andrew Lunn <andrew@lunn.ch>, linux-stm32@st-md-mailman.stormreply.com,
 weifeng.voon@intel.com, vee.khee.wong@intel.com, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org, Joakim Zhang <qiangqing.zhang@nxp.com>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, netdev@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/2] stmmac: intel: Add a missing
 clk_disable_unprepare() call in intel_eth_pci_remove()
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

TGUgMzAvMDcvMjAyMiDDoCAyMjoxNywgQW5keSBTaGV2Y2hlbmtvIGEgw6ljcml0wqA6Cj4gT24g
U2F0LCBKdWwgMzAsIDIwMjIgYXQgMDg6MTk6NDdQTSArMDIwMCwgQ2hyaXN0b3BoZSBKQUlMTEVU
IHdyb3RlOgo+PiBDb21taXQgMDlmMDEyZTY0ZTRiICgic3RtbWFjOiBpbnRlbDogRml4IGNsb2Nr
IGhhbmRsaW5nIG9uIGVycm9yIGFuZCByZW1vdmUKPj4gcGF0aHMiKSByZW1vdmVkIHRoaXMgY2xr
X2Rpc2FibGVfdW5wcmVwYXJlKCkKPj4KPj4gVGhpcyB3YXMgcGFydGx5IHJldmVydCBieSBjb21t
aXQgYWMzMjJmODZiNTZjICgibmV0OiBzdG1tYWM6IEZpeCBjbG9jawo+PiBoYW5kbGluZyBvbiBy
ZW1vdmUgcGF0aCIpIHdoaWNoIHJlbW92ZWQgdGhpcyBjbGtfZGlzYWJsZV91bnByZXBhcmUoKQo+
PiBiZWNhdXNlOgo+PiAiCj4+ICAgICBXaGlsZSB1bmxvYWRpbmcgdGhlIGR3bWFjLWludGVsIGRy
aXZlciwgY2xrX2Rpc2FibGVfdW5wcmVwYXJlKCkgaXMKPj4gICAgIGJlaW5nIGNhbGxlZCB0d2lj
ZSBpbiBzdG1tYWNfZHZyX3JlbW92ZSgpIGFuZAo+PiAgICAgaW50ZWxfZXRoX3BjaV9yZW1vdmUo
KS4gVGhpcyBjYXVzZXMga2VybmVsIHBhbmljIG9uIHRoZSBzZWNvbmQgY2FsbC4KPj4gIgo+Pgo+
PiBIb3dldmVyIGxhdGVyIG9uLCBjb21taXQgNWVjNTU4MjM0MzhlOCAoIm5ldDogc3RtbWFjOiBh
ZGQgY2xvY2tzIG1hbmFnZW1lbnQKPj4gZm9yIGdtYWMgZHJpdmVyIikgaGFzIHVwZGF0ZWQgc3Rt
bWFjX2R2cl9yZW1vdmUoKSB3aGljaCBkbyBub3QgY2FsbAo+PiBjbGtfZGlzYWJsZV91bnByZXBh
cmUoKSBhbnltb3JlLgo+Pgo+PiBTbyB0aGlzIGNhbGwgc2hvdWxkIG5vdyBiZSBjYWxsZWQgZnJv
bSBpbnRlbF9ldGhfcGNpX3JlbW92ZSgpLgo+IAo+IFRoZSBjb3JyZWN0IHdheSBvZiBmaXhpbmcg
aXQgKHdoaWNoIG1pZ2h0IGJlIHZlcnkgd2VsbCBlbmQgdXAgZnVuY3Rpb25hbGx5Cj4gdGhlIHNh
bWUgYXMgdGhpcyBwYXRjaCksIGlzIHRvIGludHJvZHVjZSAtPnF1aXQoKSBpbiBzdHJ1Y3Qgc3Rt
bWFjX3BjaV9pbmZvCj4gYW5kIGFzc2lnbiBpdCBjb3JyZWN0bHksIGJlY2F1c2Ugbm90IGFsbCBw
bGF0Zm9ybXMgZW5hYmxlIGNsb2Nrcy4KCkkgd29uJ3QgYmUgYWJsZSB0byBwcm9wb3NlIGFueXRo
aW5nIGxpa2UgdGhhdC4KCkJ5IHRoZSB3YXksIGluIHRoZSBmaXJzdCBzZW50ZW5jZSBvZiBteSBs
b2csIHMvcmVtb3ZlZC9hZGRlZC8uCihJIGhvcGUgdGhhdCBpdCBjYW4gYmUgZml4ZWQgd2hlbi9p
ZiB0aGUgcGF0Y2ggaXMgYXBwbGllZCkKCgpUaGFua3MgZm9yIHRoZSByZXZpZXcuCgpDSgoKPiAK
PiBQZXJoYXBzLCB3ZSBtYXkgbGVhdmUgdGhpcyBwYXRjaCBhcyBpcyAoZm9yIHRoZSBzYWtlIG9m
IGVhc3kgYmFja3BvcnRpbmcpIGFuZAo+IGFwcGx5IGFub3RoZXIgb25lIGFzIEkgZXhwbGFpbmVk
IGFib3ZlIHRvIGF2b2lkIHNpbWlsYXIgbWlzdGFrZXMgaW4gdGhlIGZ1dHVyZS4KPiAKPiBSZXZp
ZXdlZC1ieTogQW5keSBTaGV2Y2hlbmtvIDxhbmRyaXkuc2hldmNoZW5rb0BsaW51eC5pbnRlbC5j
b20+Cj4gCj4+IEZpeGVzOiA1ZWM1NTgyMzQzOGU4ICgibmV0OiBzdG1tYWM6IGFkZCBjbG9ja3Mg
bWFuYWdlbWVudCBmb3IgZ21hYyBkcml2ZXIiKQo+PiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGhl
IEpBSUxMRVQgPGNocmlzdG9waGUuamFpbGxldEB3YW5hZG9vLmZyPgo+PiAtLS0KPj4gLyFcICAg
ICBUaGlzIHBhdGNoIGlzIEhJR0hMWSBzcGVjdWxhdGl2ZS4gICAgIC8hXAo+Pgo+PiBUaGUgY29y
cmVzcG9uZGluZyBjbGtfZGlzYWJsZV91bnByZXBhcmUoKSBpcyBzdGlsbCBjYWxsZWQgd2l0aGlu
IHRoZSBwbQo+PiByZWxhdGVkIHN0bW1hY19idXNfY2xrc19jb25maWcoKSBmdW5jdGlvbi4KPj4K
Pj4gSG93ZXZlciwgd2l0aCBteSBsaW1pdGVkIHVuZGVyc3RhbmRpbmcgb2YgdGhlIHBtIEFQSSwg
SSB0aGluayBpdCB0aGF0IHRoZQo+PiBwYXRjaCBpcyB2YWxpZC4KPj4gKGluIG90aGVyIHdvcmQs
IGRvZXMgdGhlIHBtX3J1bnRpbWVfcHV0KCkgYW5kL29yIHBtX3J1bnRpbWVfZGlzYWJsZSgpCj4+
IGFuZC9vciBzdG1tYWNfZHZyX3JlbW92ZSgpIGNhbiBlbmQgdXAgY2FsbGluZyAucnVudGltZV9z
dXNwZW5kKCkpCj4+Cj4+IFNvIHBsZWFzZSByZXZpZXcgd2l0aCBjYXJlLCBhcyBJJ20gbm90IGFi
bGUgdG8gdGVzdCB0aGUgY2hhbmdlIGJ5IG15c2VsZi4KPj4KPj4KPj4gSWYgSSdtIHdyb25nLCBt
YXliZSBhIGNvbW1lbnQgZXhwbGFpbmluZyB3aHkgaXQgaXMgc2FmZSB0byBoYXZlIHRoaXMKPj4g
Y2FsbCBpbiB0aGUgZXJyb3IgaGFuZGxpbmcgcGF0aCBvZiB0aGUgcHJvYmUgYW5kIG5vdCBpbiB0
aGUgcmVtb3ZlIGZ1bmN0aW9uCj4+IHdvdWxkIGF2b2lkIGVycm9uZW91cyBwYXRjaGVzIGdlbmVy
YXRlZCBmcm9tIHN0YXRpYyBjb2RlIGFuYWx5emVyIHRvIGJlCj4+IHNlbnQuCj4+IC0tLQo+PiAg
IGRyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLWludGVsLmMgfCAxICsK
Pj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPj4KPj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLWludGVsLmMgYi9kcml2ZXJz
L25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1pbnRlbC5jCj4+IGluZGV4IDUyZjll
ZDhkYjljOS4uOWYzODY0MmY4NmNlIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL25ldC9ldGhlcm5l
dC9zdG1pY3JvL3N0bW1hYy9kd21hYy1pbnRlbC5jCj4+ICsrKyBiL2RyaXZlcnMvbmV0L2V0aGVy
bmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLWludGVsLmMKPj4gQEAgLTExMzQsNiArMTEzNCw3IEBA
IHN0YXRpYyB2b2lkIGludGVsX2V0aF9wY2lfcmVtb3ZlKHN0cnVjdCBwY2lfZGV2ICpwZGV2KQo+
PiAgIAo+PiAgIAlzdG1tYWNfZHZyX3JlbW92ZSgmcGRldi0+ZGV2KTsKPj4gICAKPj4gKwljbGtf
ZGlzYWJsZV91bnByZXBhcmUocGxhdC0+c3RtbWFjX2Nsayk7Cj4+ICAgCWNsa191bnJlZ2lzdGVy
X2ZpeGVkX3JhdGUocHJpdi0+cGxhdC0+c3RtbWFjX2Nsayk7Cj4+ICAgCj4+ICAgCXBjaW1faW91
bm1hcF9yZWdpb25zKHBkZXYsIEJJVCgwKSk7Cj4+IC0tIAo+PiAyLjM0LjEKPj4KPiAKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1h
aWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBz
Oi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0
bTMyCg==
