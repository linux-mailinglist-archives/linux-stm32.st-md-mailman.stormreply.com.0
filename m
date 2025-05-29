Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FFBBAC777F
	for <lists+linux-stm32@lfdr.de>; Thu, 29 May 2025 07:15:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C36D8C349C1;
	Thu, 29 May 2025 05:15:24 +0000 (UTC)
Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com
 [95.215.58.186])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 50288C349C0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 May 2025 05:15:23 +0000 (UTC)
Message-ID: <eb591c65-0106-45f4-9e57-434dac54e923@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1748495722;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5Pk1Eb2vSHZbYbbZLyo5U1NwioDIXYgsUp9ezTkNplY=;
 b=ObYYFtehliQgfdv9YsufkQYdreAjIYc0E64+xUmOXpyZAGLUi3KQ5qjBDKGKhGQbr2gXbl
 +Ckk8pCdISYyqIC+bjZEqZ7+pMCxl2Ism9o12gOkQVTM0OVV0O9pH/x0Izj/T+Ru3xfAPq
 s7AfyOVLoGxpdbAhyE7WWpwl1QlON9Q=
Date: Thu, 29 May 2025 13:14:32 +0800
MIME-Version: 1.0
To: Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
References: <20241018205332.525595-1-jitendra.vegiraju@broadcom.com>
 <CAMdnO-+FjsRX4fjbCE_RVNY4pEoArD68dAWoEM+oaEZNJiuA3g@mail.gmail.com>
 <67919001-1cb7-4e9b-9992-5b3dd9b03406@quicinc.com>
 <CAMdnO-+HwXf7c=igt2j6VHcki3cYanXpFApZDcEe7DibDz810g@mail.gmail.com>
 <7ac5c034-9e6d-45c4-b20a-2a386b4d9117@quicinc.com>
 <51768fa6-007e-4f30-ac1f-eed01ae1a3c5@linux.dev>
 <CAMdnO-KNfH79PG1=21Dbyaart2JN_e1XcF+tTG93BG5BobX+Gg@mail.gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <CAMdnO-KNfH79PG1=21Dbyaart2JN_e1XcF+tTG93BG5BobX+Gg@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT
Cc: Andrew Lunn <andrew@lunn.ch>, Jianheng.Zhang@synopsys.com,
 edumazet@google.com, Sagar Cheluvegowda <quic_scheluve@quicinc.com>,
 linux-stm32@st-md-mailman.stormreply.com, daniel@iogearbox.net,
 john.fastabend@gmail.com, linux@armlinux.org.uk, joabreu@synopsys.com,
 "Abhishek Chauhan \(ABC\)" <quic_abchauha@quicinc.com>,
 bcm-kernel-feedback-list@broadcom.com, rohan.g.thomas@intel.com,
 pabeni@redhat.com, ahalaney@redhat.com, hawk@kernel.org,
 richardcochran@gmail.com, ast@kernel.org,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>, kuba@kernel.org,
 linux-arm-kernel@lists.infradead.org, xiaolei.wang@windriver.com,
 florian.fainelli@broadcom.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, fancer.lancer@gmail.com, horms@kernel.org,
 mcoquelin.stm32@gmail.com, bpf@vger.kernel.org, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH net-next v6 0/5] net: stmmac: Add PCI
 driver support for BCM8958x
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

CuWcqCA1LzI5LzI1IDEwOjU2IEFNLCBKaXRlbmRyYSBWZWdpcmFqdSDlhpnpgZM6Cj4gSGkgWWFu
dGVuZywKPgo+IE9uIFdlZCwgTWF5IDI4LCAyMDI1IGF0IDY6MzbigK9QTSBZYW50ZW5nIFNpIDxz
aS55YW50ZW5nQGxpbnV4LmRldj4gd3JvdGU6Cj4+IOWcqCA1LzI4LzI1IDg6MDQgQU0sIEFiaGlz
aGVrIENoYXVoYW4gKEFCQykg5YaZ6YGTOgo+Pj4KPj4+IE9uIDIvNy8yMDI1IDM6MTggUE0sIEpp
dGVuZHJhIFZlZ2lyYWp1IHdyb3RlOgo+Pj4+IEhpIEFiaGlzaGVrLAo+Pj4+Cj4+Pj4gT24gRnJp
LCBGZWIgNywgMjAyNSBhdCAxMDoyMeKAr0FNIEFiaGlzaGVrIENoYXVoYW4gKEFCQykgPAo+Pj4+
IHF1aWNfYWJjaGF1aGFAcXVpY2luYy5jb20+IHdyb3RlOgo+Pj4+Cj4+Pj4+Cj4+Pj4+IE9uIDEx
LzUvMjAyNCA4OjEyIEFNLCBKaXRlbmRyYSBWZWdpcmFqdSB3cm90ZToKPj4+Pj4+IEhpIG5ldGRl
diB0ZWFtLAo+Pj4+Pj4KPj4+Pj4+IE9uIEZyaSwgT2N0IDE4LCAyMDI0IGF0IDE6NTPigK9QTSA8
aml0ZW5kcmEudmVnaXJhanVAYnJvYWRjb20uY29tPiB3cm90ZToKPj4+Pj4+PiBGcm9tOiBKaXRl
bmRyYSBWZWdpcmFqdSA8aml0ZW5kcmEudmVnaXJhanVAYnJvYWRjb20uY29tPgo+Pj4+Pj4+Cj4+
Pj4+Pj4gVGhpcyBwYXRjaHNldCBhZGRzIGJhc2ljIFBDSSBldGhlcm5ldCBkZXZpY2UgZHJpdmVy
IHN1cHBvcnQgZm9yIEJyb2FkY29tCj4+Pj4+Pj4gQkNNODk1OHggQXV0b21vdGl2ZSBFdGhlcm5l
dCBzd2l0Y2ggU29DIGRldmljZXMuCj4+Pj4+Pj4KPj4+Pj4+IEkgd291bGQgbGlrZSB0byBzZWVr
IHlvdXIgZ3VpZGFuY2Ugb24gaG93IHRvIHRha2UgdGhpcyBwYXRjaCBzZXJpZXMKPj4+Pj4gZm9y
d2FyZC4KPj4+Pj4+IFRoYW5rcyB0byB5b3VyIGZlZWRiYWNrIGFuZCBTZXJnZSdzIHN1Z2dlc3Rp
b25zLCB3ZSBtYWRlIHNvbWUgZm9yd2FyZAo+Pj4+Pj4gcHJvZ3Jlc3Mgb24gdGhpcyBwYXRjaCBz
ZXJpZXMuCj4+Pj4+PiBQbGVhc2UgbWFrZSBhbnkgc3VnZ2VzdGlvbnMgdG8gZW5hYmxlIHVzIHRv
IHVwc3RyZWFtIGRyaXZlciBzdXBwb3J0Cj4+Pj4+PiBmb3IgQkNNODk1OHguCj4+Pj4+IEppdGVu
ZHJhLAo+Pj4+PiAgICAgICAgICAgIEhhdmUgd2UgcmVzZW50IHRoaXMgcGF0Y2ggb3IgZ290IGl0
IGFwcHJvdmVkID8gSSBkb250IHNlZSBhbnkKPj4+Pj4gdXBkYXRlcyBhZnRlciB0aGlzIHBhdGNo
Lgo+Pj4+Pgo+Pj4+Pgo+Pj4+IFRoYW5rIHlvdSBmb3IgaW5xdWlyaW5nIGFib3V0IHRoZSBzdGF0
dXMgb2YgdGhpcyBwYXRjaC4KPj4+PiBBcyBzdG1tYWMgZHJpdmVyIGlzIGdvaW5nIHRocm91Z2gg
YSBtYWludGFpbmVyIHRyYW5zaXRpb24sIHdlIHdhbnRlZCB0bwo+Pj4+IHdhaXQgdW50aWwgYSBu
ZXcgbWFpbnRhaW5lciBpcyBpZGVudGlmaWVkLgo+Pj4+IFdlIHdvdWxkIGxpa2UgdG8gc2VuZCB0
aGUgdXBkYXRlZCBwYXRjaCBhcyBzb29uIGFzIHBvc3NpYmxlLgo+Pj4+IFRoYW5rcywKPj4+PiBK
aXRlbmRyYQo+Pj4gVGhhbmtzIEppdGVuZHJhLCBJIGFtIHNvcnJ5IGJ1dCBqdXN0IGEgZm9sbG93
IHVwLgo+Pj4KPj4+IERvIHdlIGtub3cgaWYgc3RtbWFjIG1haW50YWluZXIgYXJlIGlkZW50aWZp
ZWQgbm93ID8KPj4gSSdtIGN1cmlvdXMgd2h5IHN1Y2ggYSBwcmVjb25kaXRpb24gaXMgYWRkZWTv
vJ8KPj4KPiBJdCdzIG5vdCBhIHByZWNvbmRpdGlvbi4gTGV0IG1lIGdpdmUgc29tZSBjb250ZXh0
Lgo+IFRoaXMgcGF0Y2ggc2VyaWVzIGFkZHMgc3VwcG9ydCBmb3IgYSBuZXcgSHlwZXIgRE1BKEhE
TUEpIE1BQyBmcm9tIFN5bm9wc2lzLgo+IE1hbnkgb2YgdGhlIG5ldGRldiBjb21tdW5pdHkgbWVt
YmVycyByZXZpZXdlZCB0aGUgcGF0Y2hlcyBhdCB0aGF0IHRpbWUuCj4gQmVpbmcgdGhlIG1vZHVs
ZSBtYWludGFpbmVyIGF0IHRoYXQgdGltZSwgU2VyZ2UgdG9vayB0aGUgaW5pdGlhdGl2ZSB0bwo+
IGd1aWRlIHVzIHRocm91Z2ggaW50ZWdyYXRpbmcgdGhlIG5ldyBNQUMgaW50byB0aGUgc3RtbWFj
IGRyaXZlci4KPiBXZSBhZGRyZXNzZWQgYWxsIHRoZSByZXZpZXcgY29tbWVudHMgYW5kIHN1Ym1p
dHRlZCB0aGUgbGFzdCBwYXRjaCBzZXJpZXMuCj4gV2l0aG91dCBhbiBvZmZpY2lhbCBtYWludGFp
bmVyLCB3ZSBkaWRuJ3QgZ2V0IGZlZWRiYWNrIG9uIHRoZSBsYXN0IHBhdGNoIHNlcmllcy4KPiBC
ZWNhdXNlIG9mIHRoaXMsIHdlIHdhbnRlZCB0byB3YWl0IHVudGlsIGEgbmV3IG1haW50YWluZXIg
aXMgYXNzaWduZWQKPiB0byB0aGlzIG1vZHVsZS4KPiBBcyBBYmhpc2hlayBleHByZXNzZWQgaW4g
aGlzIGVtYWlsLCBpdCBhcHBlYXJzIHRoZSBIRE1BIE1BQyBpcwo+IGJlY29taW5nIG1vcmUgbWFp
bnN0cmVhbS4KPiBXZSBhcmUgaG9waW5nIHRvIHJlYmFzZSB0aGUgcGF0Y2ggc2VyaWVzIGFuZCBy
ZXN1Ym1pdCBmb3IgcmV2aWV3IGlmCj4gbmV0ZGV2IHRlYW0gbWVtYmVycyBzaG93IGludGVyZXN0
LgoKCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL25ldGRldi8yMDI0MTAxODIwNTMzMi41MjU1OTUt
MS1qaXRlbmRyYS52ZWdpcmFqdUBicm9hZGNvbS5jb20vCgpJbiBteSBvcGluaW9uLCB0aGUgcHJl
Y29uZGl0aW9uIGZvciB3YWl0aW5nIGZvciBhIG1haW50YWluZXIgaXMgdGhhdAoKdGhlIHBhdGNo
IHNldCBoYXMgcGFzc2VkIHRoZSByZXZpZXcuIEkgY2hlY2tlZCBsb3JlIGFuZCBkaWQgbm90IGZp
bmQKCmFueSBSJkIgdGFncyBpbiB0aGUgcGF0Y2ggc2V0LCB3aGljaCBtZWFucyB5b3VyIHBhdGNo
IHNldCBoYXMgbm90Cgp5ZXQgbWV0IHRoZSBtZXJnaW5nIHJlcXVpcmVtZW50cy4KClRoZXJlZm9y
ZSwgSSB0aGluayB5b3UgY2FuIGNvbnRpbnVlIHRvIHB1c2ggZm9yd2FyZCB3aXRoIHRoaXMgcGF0
Y2gKCnNldCBhbmQgbm90IGxldCBpdCBzdGFnbmF0ZS4gSSB3aWxsIHRha2Ugc29tZSB0aW1lIHRv
IHJldmlldyB0aGUgcHJldmlvdXMKCnZlcnNpb25zICh3aGljaCBtYXkgdGFrZSBhIHdoaWxlKSBh
bmQgaG9wZSB0byBiZSBoZWxwZnVsLgoKVGhhbmtzLAoKWWFudGVuZwoKPiBUaGFua3MsCj4gSml0
ZW5kcmEKPj4gVGhhbmtzLAo+PiBZYW50ZW5nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBz
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
