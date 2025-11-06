Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C182DC3974A
	for <lists+linux-stm32@lfdr.de>; Thu, 06 Nov 2025 08:50:51 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7B8E9C349C4;
	Thu,  6 Nov 2025 07:50:51 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9218CC36B30
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Nov 2025 07:50:50 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-b3e9d633b78so118556766b.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 05 Nov 2025 23:50:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1762415450; x=1763020250;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4oSZTMv5D/sOGGLnpJ+IvuCz5xyHo5sq+jQga6CKtnM=;
 b=N/CWXzhsHGgd+r54KvtW+aOWYE3MV3w99p0HITM/1jC3sltijUQzLL89SJixqJiEtW
 pQ19nqaQQeNdKvTDdNs9o2wkvgCSbw2C/TswGtcTZ82x/PAJ5Gz5DvOFLAYNivVsAhnS
 d7Fk5setAqTFbmaBI9AHhAUNwBoOfRyjK4jcs6ISLWmeyMKZc/MeiSfe5avJlAZmbD2D
 a9Jt6zZAkATbUcl1BKmzTh98u5NueE0w8w7dzUNZSKPiCd0hJo6frjc5OGGjCBNg9XDP
 lCgOa7+v6jMp00i/aeMGvOdKU1sURpJOpP1vrSqN0pyE/CTAiOJtESSlknhvHQzq7WNW
 hWrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762415450; x=1763020250;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=4oSZTMv5D/sOGGLnpJ+IvuCz5xyHo5sq+jQga6CKtnM=;
 b=LLXKG8xPEr3P+yK9cmYKcxJzoEJjF49jaLdBOhLCE5eK1pOijA9sA6TnwV9oewWQMC
 fxiHQx6PBro/wEwZ+3uyuWjYHsIeDRVAdO8i0NEsC2YEHSD3TCUCRZKmYbq+kd5WZyR2
 QumE/+RY7Skg9Vef0T3rdEHr2ahxD/d1klTdjQzPhAY61ILGJpWDrDRJ2xMvMK7qeur2
 F2RIYCd+E20QXww/XUq8uPNuu2ncFVqAqD9uH+32cIzoL77IyZ5QjQcc6XqusLZuHyYr
 M3k50M3XXstYXXGWJFvnbJFUObIjq3caSdZ+T7vN1Q1sp99ecALZtJbNol0bqMu/E0Ua
 +c9w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVYLZykdZ+Y3pWeRmTiNA7Osc5QuQZSac34umTj/zShjUzH+2g6VHi/DIGQHogHVsfDUyGHLqS7/rPLug==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxMa4duXvmdgYB/1P12RxW2jQYijujmf51wG6dJCXDCEl6DCnPs
 4t24/+9ME9c98TwS4+/2KyR6UJI3cmBkP0r2tCGGLo2g+CODJRucIMPnaqogkB5J83mgRpR6l41
 BrW06KMHBz79IOVH/iE+vtRMaW+gEpJERSqjMdwLj9g==
X-Gm-Gg: ASbGnct1Ud+zqMoBuzhgjjSSSFDvrtC0ob6y82bNYHO3ozQ4O+iax0UdgSYCVi+dUrQ
 kY+ZB6Qek2hGwjxLMtDmpgaFM3Lw11OGZtFIx2hfnEphSL3QEqJKEFfu7GuS5uETiZRzVKKwtRk
 iWMMp6l4oAj7mWAsYg/La5QlCYFapeGGgrptWAvAx96QWF1o1ABtvEp6FXcLcSUUKHidWK9shLE
 2BoNgcUvyP6Fp67grH/3CLgzwws4RH9t8qy2aJaRM3ePH4Bt20cdQ9zWWOsyg==
X-Google-Smtp-Source: AGHT+IGTqwA2P7XvjyYF/Izos2lVy+T5to2mL8X2E6WlWDzOEu9Bmz8GxKORg8EJlnHJ5cxaDH8TQQoU0UmnunUk7JI=
X-Received: by 2002:a17:907:94d2:b0:b72:6d68:6663 with SMTP id
 a640c23a62f3a-b728964dea0mr251219566b.31.1762415449844; Wed, 05 Nov 2025
 23:50:49 -0800 (PST)
MIME-Version: 1.0
References: <CAKfTPtCtHquxtK=Zx2WSNm15MmqeUXO8XXi8FkS4EpuP80PP7g@mail.gmail.com>
 <20251106000531.GA1930429@bhelgaas>
 <vrgjkulv22hzbx65olh3zpyqxq6dr7d5mepngjwgc3gudjoxwo@ll7xc2teya2s>
In-Reply-To: <vrgjkulv22hzbx65olh3zpyqxq6dr7d5mepngjwgc3gudjoxwo@ll7xc2teya2s>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Thu, 6 Nov 2025 08:50:37 +0100
X-Gm-Features: AWmQ_bkYpQyZF7OktEjeeIhdfj_KOUOxVV3OYB8DSDbc8qdV2MpPBlN_Lqu--DE
Message-ID: <CAKfTPtB=oMPsfjRFcQrAKM1m97B1LL9RJYVix+ea9Vb0FqDk3A@mail.gmail.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: imx@lists.linux.dev, s32@nxp.com, linux-pci@vger.kernel.org,
 lpieralisi@kernel.org, Frank.li@nxp.com, cassel@kernel.org,
 ghennadi.procopciuc@oss.nxp.com, Christian Bruel <christian.bruel@foss.st.com>,
 kwilczynski@kernel.org, robh@kernel.org, larisa.grigore@nxp.com,
 linux-stm32@st-md-mailman.stormreply.com, Bjorn Helgaas <helgaas@kernel.org>,
 Ionut.Vicovan@nxp.com, Mingkai Hu <mingkai.hu@nxp.com>, bogdan.hamciuc@nxp.com,
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

T24gVGh1LCA2IE5vdiAyMDI1IGF0IDA3OjI0LCBNYW5pdmFubmFuIFNhZGhhc2l2YW0gPG1hbmlA
a2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBXZWQsIE5vdiAwNSwgMjAyNSBhdCAwNjowNTozMVBN
IC0wNjAwLCBCam9ybiBIZWxnYWFzIHdyb3RlOgo+ID4gWytjYyBpbXg2LCBsYXllcnNjYXBlLCBz
dG0zMiBtYWludGFpbmVycyBmb3IgcG9zc2libGUgc3VzcGVuZCBidWddCj4gPgo+ID4gT24gRnJp
LCBPY3QgMjQsIDIwMjUgYXQgMDg6NTA6NDZBTSArMDIwMCwgVmluY2VudCBHdWl0dG90IHdyb3Rl
Ogo+ID4gPiBPbiBXZWQsIDIyIE9jdCAyMDI1IGF0IDIxOjA0LCBCam9ybiBIZWxnYWFzIDxoZWxn
YWFzQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4gPiA+IE9uIFdlZCwgT2N0IDIyLCAyMDI1IGF0IDA3
OjQzOjA4UE0gKzAyMDAsIFZpbmNlbnQgR3VpdHRvdCB3cm90ZToKPiA+ID4gPiA+IEFkZCBpbml0
aWFsIHN1cHBvcnQgb2YgdGhlIFBDSWUgY29udHJvbGxlciBmb3IgUzMyRyBTb2MgZmFtaWx5LiBP
bmx5Cj4gPiA+ID4gPiBob3N0IG1vZGUgaXMgc3VwcG9ydGVkLgo+ID4KPiA+ID4gPiA+ICtzdGF0
aWMgdm9pZCBzMzJnX2luaXRfcGNpZV9jb250cm9sbGVyKHN0cnVjdCBzMzJnX3BjaWUgKnMzMmdf
cHApCj4gPiA+ID4gPiArewo+ID4gPiA+ID4gLi4uCj4gPiA+ID4gPiArICAgICAvKgo+ID4gPiA+
ID4gKyAgICAgICogTWFrZSBzdXJlIHdlIHVzZSB0aGUgY29oZXJlbmN5IGRlZmF1bHRzIChqdXN0
IGluIGNhc2UgdGhlIHNldHRpbmdzCj4gPiA+ID4gPiArICAgICAgKiBoYXZlIGJlZW4gY2hhbmdl
ZCBmcm9tIHRoZWlyIHJlc2V0IHZhbHVlcykKPiA+ID4gPiA+ICsgICAgICAqLwo+ID4gPiA+ID4g
KyAgICAgczMyZ19wY2llX3Jlc2V0X21zdHJfYWNlKHBjaSwgbWVtYmxvY2tfc3RhcnRfb2ZfRFJB
TSgpKTsKPiA+ID4gPgo+ID4gPiA+IFRoaXMgc2VlbXMgc2tldGNoeSBhbmQgbm8gb3RoZXIgZHJp
dmVyIHVzZXMgbWVtYmxvY2tfc3RhcnRfb2ZfRFJBTSgpLgo+ID4gPiA+IFNob3VsZG4ndCBhIHBo
eXNpY2FsIG1lbW9yeSBhZGRyZXNzIGxpa2UgdGhpcyBjb21lIGZyb20gZGV2aWNldHJlZQo+ID4g
PiA+IHNvbWVob3c/Cj4gPiA+Cj4gPiA+IEkgd2FzIHVzaW5nIERUIGJ1dCBoYXMgYmVlbiBhc2tl
ZCB0byBub3QgdXNlIGl0IGFuZCB3YXMgcHJvcG9zZWQgdG8KPiA+ID4gdXNlIG1lbWJsb2NrX3N0
YXJ0X29mX0RSQU0oKSBpbnN0ZWFkCj4gPgo+ID4gQ2FuIHlvdSBwb2ludCBtZSB0byB0aGF0IGNv
bnZlcnNhdGlvbj8KPiA+Cj4gPiA+ID4gPiArICAgICBzMzJnX3BwLT5jdHJsX2Jhc2UgPSBkZXZt
X3BsYXRmb3JtX2lvcmVtYXBfcmVzb3VyY2VfYnluYW1lKHBkZXYsICJjdHJsIik7Cj4gPiA+ID4g
PiArICAgICBpZiAoSVNfRVJSKHMzMmdfcHAtPmN0cmxfYmFzZSkpCj4gPiA+ID4gPiArICAgICAg
ICAgICAgIHJldHVybiBQVFJfRVJSKHMzMmdfcHAtPmN0cmxfYmFzZSk7Cj4gPiA+ID4KPiA+ID4g
PiBUaGlzIGxvb2tzIGxpa2UgdGhlIGZpcnN0IERXQyBkcml2ZXIgdGhhdCB1c2VzIGEgImN0cmwi
IHJlc291cmNlLiAgSXMKPiA+ID4gPiB0aGlzIHNvbWV0aGluZyB1bmlxdWUgdG8gczMyZywgb3Ig
ZG8gb3RoZXIgZHJpdmVycyBoYXZlIHNvbWV0aGluZwo+ID4gPiA+IHNpbWlsYXIgYnV0IHVzZSBh
IGRpZmZlcmVudCBuYW1lPwo+ID4gPgo+ID4gPiBBRkFJQ1QgdGhpcyBzZWVtcyB0byBiZSBzMzJn
IHNwZWNpZmljIGluIHRoZSBSTQo+ID4KPiA+IEl0IGRvZXMgbG9vayBsaWtlIHRoZXJlJ3MgdmVy
eSBsaXR0bGUgY29uc2lzdGVuY3kgaW4gcmVnLW5hbWVzIGFjcm9zcwo+ID4gZHJpdmVycywgc28g
SSBndWVzcyBpdCdzIGZpbmUuCj4gPgo+ID4gPiA+ID4gK3N0YXRpYyBpbnQgczMyZ19wY2llX3N1
c3BlbmRfbm9pcnEoc3RydWN0IGRldmljZSAqZGV2KQo+ID4gPiA+ID4gK3sKPiA+ID4gPiA+ICsg
ICAgIHN0cnVjdCBzMzJnX3BjaWUgKnMzMmdfcHAgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsKPiA+
ID4gPiA+ICsgICAgIHN0cnVjdCBkd19wY2llICpwY2kgPSAmczMyZ19wcC0+cGNpOwo+ID4gPiA+
ID4gKwo+ID4gPiA+ID4gKyAgICAgaWYgKCFkd19wY2llX2xpbmtfdXAocGNpKSkKPiA+ID4gPiA+
ICsgICAgICAgICAgICAgcmV0dXJuIDA7Cj4gPiA+ID4KPiA+ID4gPiBEb2VzIHNvbWV0aGluZyBi
YWQgaGFwcGVuIGlmIHlvdSBvbWl0IHRoZSBsaW5rIHVwIGNoZWNrIGFuZCB0aGUgbGluawo+ID4g
PiA+IGlzIG5vdCB1cCB3aGVuIHdlIGdldCBoZXJlPyAgVGhlIGNoZWNrIGlzIHJhY3kgKHRoZSBs
aW5rIGNvdWxkIGdvIGRvd24KPiA+ID4gPiBiZXR3ZWVuIGR3X3BjaWVfbGlua191cCgpIGFuZCBk
d19wY2llX3N1c3BlbmRfbm9pcnEoKSksIHNvIGl0J3Mgbm90Cj4gPiA+ID4gY29tcGxldGVseSBy
ZWxpYWJsZS4KPiA+ID4gPgo+ID4gPiA+IElmIHlvdSBoYXZlIHRvIGNoZWNrLCBwbGVhc2UgYWRk
IGEgY29tbWVudCBhYm91dCB3aHkgdGhpcyBkcml2ZXIgbmVlZHMKPiA+ID4gPiBpdCB3aGVuIG5v
IG90aGVyIGRyaXZlciBkb2VzLgo+ID4gPgo+ID4gPiBkd19wY2llX3N1c3BlbmRfbm9pcnEgcmV0
dXJucyBhbiBlcnJvciBhbmQgdGhlIHN1c3BlbmQgZmFpbHMKPiA+Cj4gPiBUaGUgaW1wbGljYXRp
b24gaXMgdGhhdCAqZXZlcnkqIHVzZXIgb2YgZHdfcGNpZV9zdXNwZW5kX25vaXJxKCkgd291bGQK
PiA+IGhhdmUgdG8gY2hlY2sgZm9yIHRoZSBsaW5rIGJlaW5nIHVwLiAgVGhlcmUgYXJlIG9ubHkg
dGhyZWUgZXhpc3RpbmcKPiA+IGNhbGxlcnM6Cj4gPgo+ID4gICBpbXhfcGNpZV9zdXNwZW5kX25v
aXJxKCkKPiA+ICAgbHNfcGNpZV9zdXNwZW5kX25vaXJxKCkKPiA+ICAgc3RtMzJfcGNpZV9zdXNw
ZW5kX25vaXJxKCkKPiA+Cj4gPiBidXQgbm9uZSBvZiB0aGVtIGNoZWNrcyBmb3IgdGhlIGxpbmsg
YmVpbmcgdXAuCj4gPgo+Cj4gSWYgbm8gZGV2aWNlcyBhcmUgYXR0YWNoZWQgdG8gdGhlIGJ1cywg
dGhlbiB0aGVyZSBpcyBubyBuZWVkIHRvIGJyb2FkY2FzdAo+IFBNRV9UdXJuX09mZiBhbmQgd2Fp
dCBmb3IgTDIvTDMuIEkndmUganVzdCBzZW50IG91dCBhIHNlcmllcyB0aGF0IGZpeGVzIGl0IFsx
XS4KPiBIb3BlZnVsbHksIHRoaXMgd2lsbCBhbGxvdyBWaW5jZW50IHRvIHVzZSBkd19wY2llX3tz
dXNwZW5kL3Jlc3VtZX1fbm9pcnEoKSBBUElzLgoKSSdtIGdvaW5nIHRvIHRlc3QgaXQKClRoYW5r
cwoKPgo+IC0gTWFuaQo+Cj4gWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXBjaS8y
MDI1MTEwNjA2MTMyNi44MjQxLTEtbWFuaXZhbm5hbi5zYWRoYXNpdmFtQG9zcy5xdWFsY29tbS5j
b20vCj4KPiAtLQo+IOCuruCuo+Cuv+CuteCuo+CvjeCuo+CuqeCvjSDgrprgrqTgrr7grprgrr/g
rrXgrq7gr40KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlz
dGluZm8vbGludXgtc3RtMzIK
