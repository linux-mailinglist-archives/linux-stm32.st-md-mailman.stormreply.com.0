Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 947F9C3944C
	for <lists+linux-stm32@lfdr.de>; Thu, 06 Nov 2025 07:24:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 41BBFC597BF;
	Thu,  6 Nov 2025 06:24:44 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9227EC349C4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Nov 2025 06:24:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 794FB60216;
 Thu,  6 Nov 2025 06:24:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 519A4C4CEF7;
 Thu,  6 Nov 2025 06:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762410281;
 bh=27Pe8FUEHZhfluKmwcfeGnyxW6smtWLMLoJyzAni44c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fRJJ1H4J3GeszBfV1hToQ3FtuV2IZEsEKV/wI2DSAElwJWUkObr/RtpW4V6AYAP7j
 kzclCPXk+of9CsLTi2sSUCxjJBEAp546g7hVvQ5QLnmvK1fDLHtlC6tjVFdArJ7gGS
 2h6x1fEGQtiQXr6udYxVlomrcH9shBfv2Q2TR65zqezowcDzPVs1L4B+f2/0aZ7poF
 3lnYtSrjmzPzmz9HEpOO6+Jsma6kar+0PT7QVz2y1MTlYYiwQXrrDRWqjYv8evl2Fz
 z118nreIhF0LaUS2a8xKhbsBrpnuKsHH1kXUf+LcthYry1Qt7DOczlxwYgaHUWUzy2
 /5Snmb3l/In7g==
Date: Thu, 6 Nov 2025 11:54:18 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Message-ID: <vrgjkulv22hzbx65olh3zpyqxq6dr7d5mepngjwgc3gudjoxwo@ll7xc2teya2s>
References: <CAKfTPtCtHquxtK=Zx2WSNm15MmqeUXO8XXi8FkS4EpuP80PP7g@mail.gmail.com>
 <20251106000531.GA1930429@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251106000531.GA1930429@bhelgaas>
Cc: imx@lists.linux.dev, s32@nxp.com, linux-pci@vger.kernel.org,
 lpieralisi@kernel.org, Frank.li@nxp.com, cassel@kernel.org,
 ghennadi.procopciuc@oss.nxp.com, Christian Bruel <christian.bruel@foss.st.com>,
 kwilczynski@kernel.org, robh@kernel.org,
 Vincent Guittot <vincent.guittot@linaro.org>, larisa.grigore@nxp.com,
 linux-stm32@st-md-mailman.stormreply.com, Ionut.Vicovan@nxp.com,
 Mingkai Hu <mingkai.hu@nxp.com>, bogdan.hamciuc@nxp.com,
 Ghennadi.Procopciuc@nxp.com, devicetree@vger.kernel.org, conor+dt@kernel.org,
 Richard Zhu <hongxing.zhu@nxp.com>, ciprianmarian.costea@nxp.com,
 bhelgaas@google.com, linux-arm-kernel@lists.infradead.org,
 chester62515@gmail.com, Roy Zang <roy.zang@nxp.com>, mbrugger@suse.com,
 Minghuan Lian <minghuan.Lian@nxp.com>, jingoohan1@gmail.com,
 linux-kernel@vger.kernel.org, krzk+dt@kernel.org,
 Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [Linux-stm32] [PATCH 3/4 v3] PCI: s32g: Add initial PCIe
	support (RC)
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

T24gV2VkLCBOb3YgMDUsIDIwMjUgYXQgMDY6MDU6MzFQTSAtMDYwMCwgQmpvcm4gSGVsZ2FhcyB3
cm90ZToKPiBbK2NjIGlteDYsIGxheWVyc2NhcGUsIHN0bTMyIG1haW50YWluZXJzIGZvciBwb3Nz
aWJsZSBzdXNwZW5kIGJ1Z10KPiAKPiBPbiBGcmksIE9jdCAyNCwgMjAyNSBhdCAwODo1MDo0NkFN
ICswMjAwLCBWaW5jZW50IEd1aXR0b3Qgd3JvdGU6Cj4gPiBPbiBXZWQsIDIyIE9jdCAyMDI1IGF0
IDIxOjA0LCBCam9ybiBIZWxnYWFzIDxoZWxnYWFzQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4gPiBP
biBXZWQsIE9jdCAyMiwgMjAyNSBhdCAwNzo0MzowOFBNICswMjAwLCBWaW5jZW50IEd1aXR0b3Qg
d3JvdGU6Cj4gPiA+ID4gQWRkIGluaXRpYWwgc3VwcG9ydCBvZiB0aGUgUENJZSBjb250cm9sbGVy
IGZvciBTMzJHIFNvYyBmYW1pbHkuIE9ubHkKPiA+ID4gPiBob3N0IG1vZGUgaXMgc3VwcG9ydGVk
Lgo+IAo+ID4gPiA+ICtzdGF0aWMgdm9pZCBzMzJnX2luaXRfcGNpZV9jb250cm9sbGVyKHN0cnVj
dCBzMzJnX3BjaWUgKnMzMmdfcHApCj4gPiA+ID4gK3sKPiA+ID4gPiAuLi4KPiA+ID4gPiArICAg
ICAvKgo+ID4gPiA+ICsgICAgICAqIE1ha2Ugc3VyZSB3ZSB1c2UgdGhlIGNvaGVyZW5jeSBkZWZh
dWx0cyAoanVzdCBpbiBjYXNlIHRoZSBzZXR0aW5ncwo+ID4gPiA+ICsgICAgICAqIGhhdmUgYmVl
biBjaGFuZ2VkIGZyb20gdGhlaXIgcmVzZXQgdmFsdWVzKQo+ID4gPiA+ICsgICAgICAqLwo+ID4g
PiA+ICsgICAgIHMzMmdfcGNpZV9yZXNldF9tc3RyX2FjZShwY2ksIG1lbWJsb2NrX3N0YXJ0X29m
X0RSQU0oKSk7Cj4gPiA+Cj4gPiA+IFRoaXMgc2VlbXMgc2tldGNoeSBhbmQgbm8gb3RoZXIgZHJp
dmVyIHVzZXMgbWVtYmxvY2tfc3RhcnRfb2ZfRFJBTSgpLgo+ID4gPiBTaG91bGRuJ3QgYSBwaHlz
aWNhbCBtZW1vcnkgYWRkcmVzcyBsaWtlIHRoaXMgY29tZSBmcm9tIGRldmljZXRyZWUKPiA+ID4g
c29tZWhvdz8KPiA+IAo+ID4gSSB3YXMgdXNpbmcgRFQgYnV0IGhhcyBiZWVuIGFza2VkIHRvIG5v
dCB1c2UgaXQgYW5kIHdhcyBwcm9wb3NlZCB0bwo+ID4gdXNlIG1lbWJsb2NrX3N0YXJ0X29mX0RS
QU0oKSBpbnN0ZWFkCj4gCj4gQ2FuIHlvdSBwb2ludCBtZSB0byB0aGF0IGNvbnZlcnNhdGlvbj8K
PiAKPiA+ID4gPiArICAgICBzMzJnX3BwLT5jdHJsX2Jhc2UgPSBkZXZtX3BsYXRmb3JtX2lvcmVt
YXBfcmVzb3VyY2VfYnluYW1lKHBkZXYsICJjdHJsIik7Cj4gPiA+ID4gKyAgICAgaWYgKElTX0VS
UihzMzJnX3BwLT5jdHJsX2Jhc2UpKQo+ID4gPiA+ICsgICAgICAgICAgICAgcmV0dXJuIFBUUl9F
UlIoczMyZ19wcC0+Y3RybF9iYXNlKTsKPiA+ID4KPiA+ID4gVGhpcyBsb29rcyBsaWtlIHRoZSBm
aXJzdCBEV0MgZHJpdmVyIHRoYXQgdXNlcyBhICJjdHJsIiByZXNvdXJjZS4gIElzCj4gPiA+IHRo
aXMgc29tZXRoaW5nIHVuaXF1ZSB0byBzMzJnLCBvciBkbyBvdGhlciBkcml2ZXJzIGhhdmUgc29t
ZXRoaW5nCj4gPiA+IHNpbWlsYXIgYnV0IHVzZSBhIGRpZmZlcmVudCBuYW1lPwo+ID4gCj4gPiBB
RkFJQ1QgdGhpcyBzZWVtcyB0byBiZSBzMzJnIHNwZWNpZmljIGluIHRoZSBSTQo+IAo+IEl0IGRv
ZXMgbG9vayBsaWtlIHRoZXJlJ3MgdmVyeSBsaXR0bGUgY29uc2lzdGVuY3kgaW4gcmVnLW5hbWVz
IGFjcm9zcwo+IGRyaXZlcnMsIHNvIEkgZ3Vlc3MgaXQncyBmaW5lLgo+IAo+ID4gPiA+ICtzdGF0
aWMgaW50IHMzMmdfcGNpZV9zdXNwZW5kX25vaXJxKHN0cnVjdCBkZXZpY2UgKmRldikKPiA+ID4g
PiArewo+ID4gPiA+ICsgICAgIHN0cnVjdCBzMzJnX3BjaWUgKnMzMmdfcHAgPSBkZXZfZ2V0X2Ry
dmRhdGEoZGV2KTsKPiA+ID4gPiArICAgICBzdHJ1Y3QgZHdfcGNpZSAqcGNpID0gJnMzMmdfcHAt
PnBjaTsKPiA+ID4gPiArCj4gPiA+ID4gKyAgICAgaWYgKCFkd19wY2llX2xpbmtfdXAocGNpKSkK
PiA+ID4gPiArICAgICAgICAgICAgIHJldHVybiAwOwo+ID4gPgo+ID4gPiBEb2VzIHNvbWV0aGlu
ZyBiYWQgaGFwcGVuIGlmIHlvdSBvbWl0IHRoZSBsaW5rIHVwIGNoZWNrIGFuZCB0aGUgbGluawo+
ID4gPiBpcyBub3QgdXAgd2hlbiB3ZSBnZXQgaGVyZT8gIFRoZSBjaGVjayBpcyByYWN5ICh0aGUg
bGluayBjb3VsZCBnbyBkb3duCj4gPiA+IGJldHdlZW4gZHdfcGNpZV9saW5rX3VwKCkgYW5kIGR3
X3BjaWVfc3VzcGVuZF9ub2lycSgpKSwgc28gaXQncyBub3QKPiA+ID4gY29tcGxldGVseSByZWxp
YWJsZS4KPiA+ID4KPiA+ID4gSWYgeW91IGhhdmUgdG8gY2hlY2ssIHBsZWFzZSBhZGQgYSBjb21t
ZW50IGFib3V0IHdoeSB0aGlzIGRyaXZlciBuZWVkcwo+ID4gPiBpdCB3aGVuIG5vIG90aGVyIGRy
aXZlciBkb2VzLgo+ID4gCj4gPiBkd19wY2llX3N1c3BlbmRfbm9pcnEgcmV0dXJucyBhbiBlcnJv
ciBhbmQgdGhlIHN1c3BlbmQgZmFpbHMKPiAKPiBUaGUgaW1wbGljYXRpb24gaXMgdGhhdCAqZXZl
cnkqIHVzZXIgb2YgZHdfcGNpZV9zdXNwZW5kX25vaXJxKCkgd291bGQKPiBoYXZlIHRvIGNoZWNr
IGZvciB0aGUgbGluayBiZWluZyB1cC4gIFRoZXJlIGFyZSBvbmx5IHRocmVlIGV4aXN0aW5nCj4g
Y2FsbGVyczoKPiAKPiAgIGlteF9wY2llX3N1c3BlbmRfbm9pcnEoKQo+ICAgbHNfcGNpZV9zdXNw
ZW5kX25vaXJxKCkKPiAgIHN0bTMyX3BjaWVfc3VzcGVuZF9ub2lycSgpCj4gCj4gYnV0IG5vbmUg
b2YgdGhlbSBjaGVja3MgZm9yIHRoZSBsaW5rIGJlaW5nIHVwLgo+IAoKSWYgbm8gZGV2aWNlcyBh
cmUgYXR0YWNoZWQgdG8gdGhlIGJ1cywgdGhlbiB0aGVyZSBpcyBubyBuZWVkIHRvIGJyb2FkY2Fz
dApQTUVfVHVybl9PZmYgYW5kIHdhaXQgZm9yIEwyL0wzLiBJJ3ZlIGp1c3Qgc2VudCBvdXQgYSBz
ZXJpZXMgdGhhdCBmaXhlcyBpdCBbMV0uCkhvcGVmdWxseSwgdGhpcyB3aWxsIGFsbG93IFZpbmNl
bnQgdG8gdXNlIGR3X3BjaWVfe3N1c3BlbmQvcmVzdW1lfV9ub2lycSgpIEFQSXMuCgotIE1hbmkK
ClsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1wY2kvMjAyNTExMDYwNjEzMjYuODI0
MS0xLW1hbml2YW5uYW4uc2FkaGFzaXZhbUBvc3MucXVhbGNvbW0uY29tLwoKLS0gCuCuruCuo+Cu
v+CuteCuo+CvjeCuo+CuqeCvjSDgrprgrqTgrr7grprgrr/grrXgrq7gr40KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBs
aXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
