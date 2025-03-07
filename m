Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EBE3A5701A
	for <lists+linux-stm32@lfdr.de>; Fri,  7 Mar 2025 19:07:09 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E14CBC78F97;
	Fri,  7 Mar 2025 18:07:08 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AEBB2C78F96
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 Mar 2025 18:07:07 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-ac25313ea37so220996766b.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 07 Mar 2025 10:07:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741370827; x=1741975627;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8wkOomTGttoakawgqhoO+GpdOmml5a28PHZWdVY9aEg=;
 b=UWxV4RX0jzyaaqZYRodOUZrG3RT6ps0vNrgGQvU1AY0wc1r3IN3j1DrU5g6x1kDXC8
 558EuLUEBiKW5Yx15p/GtjGUXs7xftIogQ57Xv/BJ3nhal2u0PkLYQEqRHIJ2QN3TRyb
 5CEbJ1wGe0in0UQwXlnYnjDsaCA4i5gmTIeCu/6KFyYURHFSc0UBjdSQmGe6M6+grt95
 JfRUF1XGwvXwN1+j6Rrqv8vGx/AZF4SXuH5l4D9pk3WQZiTmJEbW7Y7KZ8FKbXusTphX
 AnAi9RvTciPmLpbX/2qDgaPehnnRvfaAYDxgfca0DHXNbZVQyvDPVPAbNPuxq+zlRWCV
 zMSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741370827; x=1741975627;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8wkOomTGttoakawgqhoO+GpdOmml5a28PHZWdVY9aEg=;
 b=QMziIHV1xFtHrPYEhF9DH11QlitqtBy10FPxrJqCRkHMLSRv4AgYWxsFBIddl4Y2Pd
 9YCcDgxV+LWGYzVCtqvg7RFg5AHBklIPo8aEvqKQtnTtLNbYrxgtWouQjFP93zvgExoq
 xYeSovuT69kFDBRa2U6qlv01BXenYiH7QNmff44AsnpYpsQ0TsdawCg2tvU18bykoMXq
 4f2iQpOAVsY0jf4tU8tEzIDwJCTCfsw75GrTuRiqUFi8GMRwwF6wUmqyY9pJRvll3vil
 A5et4v5QDE6VCHUhChKW8//zHXf1DQdRmO4g592VZv3RoXD5bo3OJfqIyyzGyVmJOMdy
 gXng==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9NvR4v65IYm5y7gGwu+QtR3XOauQ+yNbZRx7hJGn6hLQlCnABxkQV+9mrr5xf1o5oKcSVILkP+o4u4w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxNqjJoLblkOT6WBIB43HQVqECeMZ0lYGZ7vGcjn1S3UP/yjE36
 lRSBFByc3wkWNqe83k0GMJIFsPJ4wr9QOG1D4rVkG3/Qp1VeOqQDBeEmTvfNp2B/z8zu3jIofM1
 mJqpSGZZfZ6TwUXwFo57/k2AEw6A=
X-Gm-Gg: ASbGncuR33ZvXp3jiWJ7l5OaUBh/4nAAf1btAwi1EbtHplFpAVcJjxFcXEI9548SZ+O
 IvK3un+OtgRi8U/rHZtNkELiPsCxK3DSiWrB919LtOEcLtqOnBF5p4jVrPxkjUwpMRz1ETceEAp
 3nEt4AQ00hBf0D9iuIMYfsMeI7uwUk
X-Google-Smtp-Source: AGHT+IFBf7glgDcgWmZiKnDmmcF21bxMSuMDhbcpDZPMMBRIr6Vb+pd9XoZN62iofvl9sTrgCJwFci7pDGa5B6mFURE=
X-Received: by 2002:a17:907:a193:b0:abf:51b7:6071 with SMTP id
 a640c23a62f3a-ac2525f212emr392804766b.13.1741370826759; Fri, 07 Mar 2025
 10:07:06 -0800 (PST)
MIME-Version: 1.0
References: <20250227121522.1802832-1-yong.liang.choong@linux.intel.com>
 <20250227121522.1802832-6-yong.liang.choong@linux.intel.com>
 <Z8lLm9Ze9VAx3cE_@surfacebook.localdomain>
 <601c88fb-8ec8-4866-a45d-f28dea6d9625@linux.intel.com>
 <CAHp75VeOKbAsvSuf5+VQnGFmUcN92TNnR2eF1+70h3PjaMdMqA@mail.gmail.com>
 <d7c0094e-7fd3-4113-8d00-91b7a83ffd1f@linux.intel.com>
 <257769403908de3ac6271059e1febee88654fbdc.camel@linux.intel.com>
 <19b78790-d4d3-45db-9b1f-fbe40f8ed795@linux.intel.com>
In-Reply-To: <19b78790-d4d3-45db-9b1f-fbe40f8ed795@linux.intel.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 7 Mar 2025 20:06:30 +0200
X-Gm-Features: AQ5f1JoeMb52MrYyvd86gAym0UFqsglYSq0MjE2RDPOAAk4Ejr9eExmge1UjnS8
Message-ID: <CAHp75VcXtwe3zutnZUDNXBPe1qgwP+GbBF9KSFHOPioEvSk3Pw@mail.gmail.com>
To: Choong Yong Liang <yong.liang.choong@linux.intel.com>
Cc: Dave Hansen <dave.hansen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org, David E Box <david.e.box@intel.com>,
 Eric Dumazet <edumazet@google.com>, david.e.box@linux.intel.com,
 "H . Peter Anvin" <hpa@zytor.com>, linux-stm32@st-md-mailman.stormreply.com,
 x86@kernel.org, Russell King <linux@armlinux.org.uk>,
 Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>,
 Mengyuan Lou <mengyuanlou@net-swift.com>, Jose Abreu <Jose.Abreu@synopsys.com>,
 Simon Horman <horms@kernel.org>, Richard Cochran <richardcochran@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>, Jiawen Wu <jiawenwu@trustnetic.com>,
 Borislav Petkov <bp@alien8.de>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 linux-arm-kernel@lists.infradead.org, Paolo Abeni <pabeni@redhat.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
 "David S . Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next v9 5/6] net: stmmac: configure
 SerDes according to the interface mode
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

T24gRnJpLCBNYXIgNywgMjAyNSBhdCA3OjI44oCvQU0gQ2hvb25nIFlvbmcgTGlhbmcKPHlvbmcu
bGlhbmcuY2hvb25nQGxpbnV4LmludGVsLmNvbT4gd3JvdGU6Cj4gT24gNy8zLzIwMjUgNDo1MiBh
bSwgRGF2aWQgRS4gQm94IHdyb3RlOgo+ID4gT24gVGh1LCAyMDI1LTAzLTA2IGF0IDIwOjU2ICsw
ODAwLCBDaG9vbmcgWW9uZyBMaWFuZyB3cm90ZToKPiA+PiBPbiA2LzMvMjAyNSA1OjA1IHBtLCBB
bmR5IFNoZXZjaGVua28gd3JvdGU6Cj4gPj4+IE9uIFRodSwgTWFyIDYsIDIwMjUgYXQgMTA6Mzni
gK9BTSBDaG9vbmcgWW9uZyBMaWFuZwo+ID4+PiA8eW9uZy5saWFuZy5jaG9vbmdAbGludXguaW50
ZWwuY29tPiB3cm90ZToKPiA+Pj4+IE9uIDYvMy8yMDI1IDM6MTUgcG0sIEFuZHkgU2hldmNoZW5r
byB3cm90ZToKPiA+Pj4+PiBUaHUsIEZlYiAyNywgMjAyNSBhdCAwODoxNToyMVBNICswODAwLCBD
aG9vbmcgWW9uZyBMaWFuZyBraXJqb2l0dGk6CgouLi4KCj4gPj4+Pj4+IGNvbmZpZyBEV01BQ19J
TlRFTAo+ID4+Pj4+PiAgICAgICAgZGVmYXVsdCBYODYKPiA+Pj4+Pj4gICAgICAgIGRlcGVuZHMg
b24gWDg2ICYmIFNUTU1BQ19FVEggJiYgUENJCj4gPj4+Pj4+ICAgICAgICBkZXBlbmRzIG9uIENP
TU1PTl9DTEsKPiA+Pj4+Pj4gKyAgICBkZXBlbmRzIG9uIEFDUEkKPiA+Pj4+PiBTdHJheSBhbmQg
dW5leHBsYWluZWQgY2hhbmdlLiBQbGVhc2UsIGZpeCBpdC4gV2UgZG9uJ3QgbmVlZCB0aGUKPiA+
Pj4+PiBkZXBlbmRlbmNpZXMKPiA+Pj4+PiB3aGljaCBhcmUgbm90IHJlYWxpc2VkIGluIHRoZSBj
b21waWxlIHRpbWUuCj4gPj4+PiBUaGUgZGVwZW5kZW5jeSBvbiBBQ1BJIGlzIG5lY2Vzc2FyeSBi
ZWNhdXNlIHRoZSBpbnRlbF9wbWNfaXBjLmggaGVhZGVyCj4gPj4+PiByZWxpZXMgb24gQUNQSSBm
dW5jdGlvbmFsaXR5IHRvIGludGVyYWN0IHdpdGggdGhlIEludGVsIFBNQy4KPiA+Pj4gU28sIHRo
YXQgaGVhZGVyIGhhcyB0byBiZSBmaXhlZCBhcyBBQ1BJIGhlcmUgaXMgcmVhbGx5IHVubmVlZGVk
Cj4gPj4+IGRlcGVuZGVuY3kgZm9yIHRoZSBjYXNlcyB3aGVuIHNvbWVib2R5IChmb3Igd2hhdGV2
ZXIgcmVhc29ucykgd2FudCB0bwo+ID4+PiBidWlsZCBhIGtlcm5lbCB3aXRob3V0IEFDUEkgc3Vw
cG9ydCBidXQgd2l0aCB0aGUgZHJpdmVyIGVuYWJsZWQgZm9yCj4gPj4+IGxldCdzIHNheSBQQ0kg
ZGV2aWNlLgoKPiA+PiBUaGFuayB5b3UgZm9yIHlvdXIgZmVlZGJhY2ssIEFuZHkuCj4gPj4gSSBh
cHByZWNpYXRlIHlvdXIgaW5zaWdodHMgcmVnYXJkaW5nIHRoZSBBQ1BJIGRlcGVuZGVuY3kuCj4g
Pj4gVGhlIGludGVsX3BtY19pcGMuaCBoZWFkZXIgaXMgdW5kZXIgdGhlIG93bmVyc2hpcCBvZiBE
YXZpZCBFIEJveCwgd2hvCj4gPj4gZm9jdXNlcyBvbiB0aGUgcGxhdGZvcm0gY29kZSwgd2hpbGUg
bXkgZm9jdXMgaXMgb24gdGhlIG5ldGRldi4KPiA+Pgo+ID4+IGlmIHlvdSBjb3VsZCBraW5kbHkg
bG9vayBpbnRvIG1ha2luZyB0aGUgQUNQSSBkZXBlbmRlbmN5IG9wdGlvbmFsIGluIHRoZQo+ID4+
IGludGVsX3BtY19pcGMuaCBoZWFkZXIsIGl0IHdvdWxkIGJlIGdyZWF0bHkgYXBwcmVjaWF0ZWQu
Cj4gPj4gSSBhbSBtb3JlIHRoYW4gd2lsbGluZyB0byBwcm92aWRlIGFueSBzdXBwb3J0IG5lY2Vz
c2FyeSB0byBlbnN1cmUgYSBzbW9vdGgKPiA+PiByZXNvbHV0aW9uLgo+ID4KPiA+IENob29uZyB5
b3Ugb25seSBuZWVkIHB1dCB0aGUgZnVuY3Rpb24gdW5kZXIgYSAjaWYgQ09ORklHX0FDUEkgYmxv
Y2sgYW5kIHByb3ZpZGUKPiA+IGFuIGFsdGVybmF0aXZlIHRoYXQgcmV0dXJucyBhbiBlcnJvciB3
aGVuIHRoZSBjb2RlIGlzIG5vdCBidWlsZC4gTGlrZSB0aGlzLAo+ID4KPiA+ICNpZiBDT05GSUdf
QUNQSQo+ID4gc3RhdGljIGlubGluZSBpbnQgaW50ZWxfcG1jX2lwYyhzdHJ1Y3QgcG1jX2lwY19j
bWQgKmlwY19jbWQsIHN0cnVjdCBwbWNfaXBjX3JidWYKPiA+ICpyYnVmKQo+ID4gewo+ID4gICAg
IC4uLgo+ID4gfQo+ID4gI2Vsc2UKPiA+IHN0YXRpYyBpbmxpbmUgaW50IGludGVsX3BtY19pcGMo
c3RydWN0IHBtY19pcGNfY21kICppcGNfY21kLCBzdHJ1Y3QgcG1jX2lwY19yYnVmCj4gPiAqcmJ1
ZikgeyByZXR1cm4gLUVOT0RFVjsgfQo+ID4gI2VuZGlmCj4gPgo+ID4+IFRoaXMgcGF0Y2ggc2Vy
aWVzIGhhcyBhbHJlYWR5IGJlZW4gYWNjZXB0ZWQsIGJ1dCB3ZSByZWNvZ25pemUgdGhlCj4gPj4g
aW1wb3J0YW5jZSBvZiBhZGRyZXNzaW5nIHRoaXMgaXNzdWUgaW4gdGhlIG5leHQgcGF0Y2ggc2Vy
aWVzIGZvciB1cHN0cmVhbS4KPiA+PiBPdXIgZ29hbCBpcyB0byBlbnN1cmUgdGhhdCB0aGUgZHJp
dmVyIGNhbiBiZSBjb21waWxlZCBhbmQgZnVuY3Rpb24KPiA+PiBjb3JyZWN0bHkgaW4gYm90aCBB
Q1BJIGFuZCBub24tQUNQSSBlbnZpcm9ubWVudHMuCj4gPj4KPiA+PiBUaGFuayB5b3UgYm90aCBm
b3IgeW91ciB1bmRlcnN0YW5kaW5nIGFuZCBjb2xsYWJvcmF0aW9uLgoKPiBUaGUgY3VycmVudCBB
Q1BJIGRlcGVuZGVuY3kgZm9yIHRoZSBjb25maWcgRFdNQUNfSU5URUwgaXMgbmVjZXNzYXJ5LAoK
SSBjYW4gYXJndWUgb24gdGhpcy4gVGhlIGRyaXZlciB3b3JrZWQgd2l0aG91dCBwcm9ibGVtcyBv
biB0aGUgY2FzZXMgSQpleHBsYWluZWQsIHNvIHRoZSBkZXBlbmRlbmN5IGludHJvZHVjZWQgdmVy
eSByZWNlbnRseSBhbmQgb25seSBmb3IgYQpzdWJzZXQgb2YgdGhlIGNhc2VzLiBXaGF0IHlvdSBw
cm9iYWJseSB3YW50ZWQgdG8gc2F5IGlzIHRoYXQgInRoZQpkZXBlbmRlbmN5IGlzIG5lZWRlZCB0
byBhdm9pZCBjb21waWxhdGlvbiBlcnJvcnMgaW4gQ09ORklHX0FDUEk9bgpjYXNlcyBzaW5jZSB0
aGUgdXNlZCBBUEkgZG9lc24ndCAoeWV0KSBwcm92aWRlIHRoZSBuZWNlc3Nhcnkgc3R1YnMiLgpX
aXRoIHRoYXQgYmVpbmcgYXNzdW1lZCBJIGFncmVlLgoKPiBidXQgSQo+IGFncmVlIG9uIG1ha2lu
ZyBpdCBvcHRpb25hbC4KPgo+IEltcGxlbWVudGluZyB0aGUgc3VnZ2VzdGlvbiBmcm9tIERhdmlk
IHVzaW5nIHRoZSAiI2lmIENPTkZJR19BQ1BJIiBhcHByb2FjaAo+IHdvdWxkIGFkZHJlc3MgeW91
ciBjb25jZXJuIGFib3V0IHVzZXJzIHdobyBuZWVkIHRvIGJ1aWxkIGEga2VybmVsIHdpdGhvdXQK
PiBBQ1BJIHN1cHBvcnQuCj4KPiBJZiB5b3UgYXJlIG9rYXkgd2l0aCB0aGlzIGFwcHJvYWNoLCB0
aGVuIEkgd2lsbCBzdWJtaXQgdGhlIHNvbHV0aW9uIGZvcgo+IHVwc3RyZWFtLgoKWWVzLCBwbGVh
c2UgZG8gaXQgYXMgdGhlIEFDUEkgZGVwZW5kZW5jeSBicmluZ3MgYSBmZXcgaHVuZHJlZHMgb2YK
a2lsb2J5dGVzIGludG8gdGhlIGtlcm5lbCB3aXRoIGEgbG90IG9mIHBvc3NpYmxlIHVubmVlZGVk
IHN0dWZmLgoKLS0gCldpdGggQmVzdCBSZWdhcmRzLApBbmR5IFNoZXZjaGVua28KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGlu
ZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9z
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
