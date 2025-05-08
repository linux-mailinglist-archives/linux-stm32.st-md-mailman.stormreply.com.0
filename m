Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA04AAF6F9
	for <lists+linux-stm32@lfdr.de>; Thu,  8 May 2025 11:44:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BCF6FC7A821;
	Thu,  8 May 2025 09:44:04 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 36E01C78F62
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 May 2025 09:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1746697442; x=1778233442;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=nPT/F3W9N+by11bdaqC4yK2ZudPzdLXlWraniupgjJw=;
 b=EXOlYIAkmLHT4WwkvDHp4zet0dXH0CnSYxrO5y9i6rM+tCX77uI/pIIs
 722ty82Hxz17KfEdvUbSXUwUxjPGyhPZ4AK161IwH0aiShRlHdB97S1Ux
 VcuG4ahiBIw9AzVZKkt4OL5yQE7Tr8yApvqvY+KDgMaro2Y5z993VYmuX
 kFF1lOCAAXlO54ix48UZy43qrJHGvAvOv/tzJW13BZi4Cm7gSChVM2NW4
 2nnFqnnyBK7g9uqrQLbJb7EOgLG7G23oasloMcXxAMahxRY1aw6IJ/9HQ
 x4AfYIhG1o2agc68RCl42Gu6vtmvG+hiF2NNiJa1HFUrO/4zXKkUOBX19 A==;
X-CSE-ConnectionGUID: dgXtX5N7RouoR3jSWbnLcw==
X-CSE-MsgGUID: 6CsaHletTeu58H0FkJHF0g==
X-IronPort-AV: E=Sophos;i="6.15,271,1739862000"; d="scan'208";a="208871395"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 08 May 2025 02:44:00 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 8 May 2025 02:43:19 -0700
Received: from localhost (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Thu, 8 May 2025 02:43:19 -0700
Date: Thu, 8 May 2025 11:41:56 +0200
From: Horatiu Vultur <horatiu.vultur@microchip.com>
To: Jason Xing <kerneljasonxing@gmail.com>
Message-ID: <20250508094156.kbegdd5vianotsrr@DEN-DL-M31836.microchip.com>
References: <20250508033328.12507-1-kerneljasonxing@gmail.com>
 <20250508033328.12507-5-kerneljasonxing@gmail.com>
 <20250508070700.m3bufh2q4v4llbfx@DEN-DL-M31836.microchip.com>
 <CAL+tcoCuvxfQUbzjSfk+7vPWLEqQgVK8muqkOQe+N6jQQwXfUw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAL+tcoCuvxfQUbzjSfk+7vPWLEqQgVK8muqkOQe+N6jQQwXfUw@mail.gmail.com>
Cc: willemb@google.com, horms@kernel.org, irusskikh@marvell.com,
 netdev@vger.kernel.org, bharat@chelsio.com,
 linux-stm32@st-md-mailman.stormreply.com, UNGLinuxDriver@microchip.com,
 andrew+netdev@lunn.ch, edumazet@google.com,
 linux-arm-kernel@lists.infradead.org, mcoquelin.stm32@gmail.com,
 ayush.sawal@chelsio.com, kuba@kernel.org, pabeni@redhat.com,
 davem@davemloft.net, sgoutham@marvell.com, Jason Xing <kernelxing@tencent.com>
Subject: Re: [Linux-stm32] [PATCH net-next v1 4/4] net: lan966x: generate
 software timestamp just before the doorbell
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

VGhlIDA1LzA4LzIwMjUgMTY6NDAsIEphc29uIFhpbmcgd3JvdGU6Cj4gSGkgSG9yYXRpdSwKCkhp
IEphc29uLAoKPiAKPiBPbiBUaHUsIE1heSA4LCAyMDI1IGF0IDM6MDjigK9QTSBIb3JhdGl1IFZ1
bHR1cgo+IDxob3JhdGl1LnZ1bHR1ckBtaWNyb2NoaXAuY29tPiB3cm90ZToKPiA+Cj4gPiBUaGUg
MDUvMDgvMjAyNSAxMTozMywgSmFzb24gWGluZyB3cm90ZToKPiA+ID4KPiA+ID4gRnJvbTogSmFz
b24gWGluZyA8a2VybmVseGluZ0B0ZW5jZW50LmNvbT4KPiA+ID4KPiA+ID4gTWFrZSBzdXJlIHRo
ZSBjYWxsIG9mIHNrYl90eF90aW1lc3RhbXAgYXMgY2xvc2UgdG8gdGhlIGRvb3JiZWxsLgo+ID4g
Pgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBKYXNvbiBYaW5nIDxrZXJuZWx4aW5nQHRlbmNlbnQuY29t
Pgo+ID4gPiAtLS0KPiA+ID4gIGRyaXZlcnMvbmV0L2V0aGVybmV0L21pY3JvY2hpcC9sYW45NjZ4
L2xhbjk2NnhfZmRtYS5jIHwgMiArLQo+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspLCAxIGRlbGV0aW9uKC0pCj4gPiA+Cj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC9l
dGhlcm5ldC9taWNyb2NoaXAvbGFuOTY2eC9sYW45NjZ4X2ZkbWEuYyBiL2RyaXZlcnMvbmV0L2V0
aGVybmV0L21pY3JvY2hpcC9sYW45NjZ4L2xhbjk2NnhfZmRtYS5jCj4gPiA+IGluZGV4IDUwMjY3
MDcxODEwNC4uZTAzMGYyM2U1MTQ1IDEwMDY0NAo+ID4gPiAtLS0gYS9kcml2ZXJzL25ldC9ldGhl
cm5ldC9taWNyb2NoaXAvbGFuOTY2eC9sYW45NjZ4X2ZkbWEuYwo+ID4gPiArKysgYi9kcml2ZXJz
L25ldC9ldGhlcm5ldC9taWNyb2NoaXAvbGFuOTY2eC9sYW45NjZ4X2ZkbWEuYwo+ID4gPiBAQCAt
NzMwLDcgKzczMCw2IEBAIGludCBsYW45NjZ4X2ZkbWFfeG1pdChzdHJ1Y3Qgc2tfYnVmZiAqc2ti
LCBfX2JlMzIgKmlmaCwgc3RydWN0IG5ldF9kZXZpY2UgKmRldikKPiA+ID4gICAgICAgICAgICAg
ICAgIH0KPiA+ID4gICAgICAgICB9Cj4gPiA+Cj4gPiA+IC0gICAgICAgc2tiX3R4X3RpbWVzdGFt
cChza2IpOwo+ID4KPiA+IENoYW5naW5nIHRoaXMgd2lsbCBicmVhayB0aGUgUEhZIHRpbWVzdGFt
cGluZyBiZWNhdXNlIHRoZSBmcmFtZSBnZXRzCj4gPiBtb2RpZmllZCBpbiB0aGUgbmV4dCBsaW5l
LCBtZWFuaW5nIHRoYXQgdGhlIGNsYXNzaWZ5IGZ1bmN0aW9uIHdpbGwKPiA+IGFsd2F5cyByZXR1
cm4gUFRQX0NMQVNTX05PTkUuCj4gCj4gU29ycnkgdGhhdCBJJ20gbm90IHRoYXQgZmFtaWxpYXIg
d2l0aCB0aGUgZGV0YWlscy4gSSB3aWxsIHJlbW92ZSBpdAo+IGZyb20gdGhpcyBzZXJpZXMsIGJ1
dCBzdGlsbCB0cnlpbmcgdG8gZmlndXJlIG91dCB3aGF0IGNhc2VzIGNvdWxkIGJlLgo+IAo+IERv
IHlvdSBtZWFuIGl0IGNhbiBicmVhayB3aGVuIGJwZiBwcm9nIGlzIGxvYWRlZCBiZWNhdXNlCj4g
J3NrYl9wdXNoKHNrYiwgSUZIX0xFTl9CWVRFUyk7JyBleHBhbmRzIHRoZSBza2ItPmRhdGEgYXJl
YT8KCldlbGwsIHRoZSBicGYgcHJvZ3JhbSB3aWxsIGNoZWNrIGlmIGl0IGlzIGEgUFRQIGZyYW1l
IHRoYXQgbmVlZHMgdG8gYmUKdGltZXN0YW1wIHdoZW4gaXQgcnVucyBwdHBfY2xhc3NpZnlfcmF3
LCBhbmQgYXMgd2UgcHVzaCBzb21lIGRhdGEgaW4KZnJvbnQgb2YgdGhlIGZyYW1lLCB0aGUgYnBm
IHdpbGwgcnVuIGZyb20gdGhhdCBwb2ludCBtZWFuaW5nIHRoYXQgaXQKd291bGQgZmFpbGVkIHRv
IGRldGVjdCB0aGUgUFRQIGZyYW1lcy4KCj4gTWF5IEkgYXNrCj4gaG93IHRoZSBtb2RpZmllZCBk
YXRhIG9mIHNrYiBicmVha3MgdGhlIFBIWSB0aW1lc3RhbXBpbmcgZmVhdHVyZT8KCklmIGl0IGZh
aWxzIHRvIGRldGVjdCB0aGF0IGl0IGlzIGEgUFRQIGZyYW1lLCB0aGVuIHRoZSBmcmFtZSB3aWxs
IG5vdCBiZQpwYXNzZWQgdG8gdGhlIFBIWSB1c2luZyB0aGUgY2FsbGJhY2sgdHh0c3RhbXAuIFNv
IHRoZSBQSFkgd2lsbCB0aW1lc3RhbXAgdGhlCmZyYW1lIGJ1dCBpdCBkb2Vzbid0IGhhdmUgdGhl
IGZyYW1lIHRvIGF0dGFjaCB0aGUgdGltZXN0YW1wLgoKPiAKPiBUaGFua3MsCj4gSmFzb24KPiAK
PiA+Cj4gPiBOYWNrZWQtYnk6IEhvcmF0aXUgVnVsdHVyIDxob3JhdGl1LnZ1bHR1ckBtaWNyb2No
aXAuY29tPgo+ID4KPiA+ID4gICAgICAgICBza2JfcHVzaChza2IsIElGSF9MRU5fQllURVMpOwo+
ID4gPiAgICAgICAgIG1lbWNweShza2ItPmRhdGEsIGlmaCwgSUZIX0xFTl9CWVRFUyk7Cj4gPiA+
ICAgICAgICAgc2tiX3B1dChza2IsIDQpOwo+ID4gPiBAQCAtNzY4LDYgKzc2Nyw3IEBAIGludCBs
YW45NjZ4X2ZkbWFfeG1pdChzdHJ1Y3Qgc2tfYnVmZiAqc2tiLCBfX2JlMzIgKmlmaCwgc3RydWN0
IG5ldF9kZXZpY2UgKmRldikKPiA+ID4gICAgICAgICAgICAgICAgIG5leHRfZGNiX2J1Zi0+cHRw
ID0gdHJ1ZTsKPiA+ID4KPiA+ID4gICAgICAgICAvKiBTdGFydCB0aGUgdHJhbnNtaXNzaW9uICov
Cj4gPiA+ICsgICAgICAgc2tiX3R4X3RpbWVzdGFtcChza2IpOwo+ID4gPiAgICAgICAgIGxhbjk2
NnhfZmRtYV90eF9zdGFydCh0eCk7Cj4gPiA+Cj4gPiA+ICAgICAgICAgcmV0dXJuIE5FVERFVl9U
WF9PSzsKPiA+ID4gLS0KPiA+ID4gMi40My41Cj4gPiA+Cj4gPgo+ID4gLS0KPiA+IC9Ib3JhdGl1
CgotLSAKL0hvcmF0aXUKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxt
YW4vbGlzdGluZm8vbGludXgtc3RtMzIK
