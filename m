Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 60762BEAF4F
	for <lists+linux-stm32@lfdr.de>; Fri, 17 Oct 2025 19:02:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 13106C597BC;
	Fri, 17 Oct 2025 17:02:56 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 37E7AC597BB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Oct 2025 17:02:55 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-427007b1fe5so1287734f8f.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Oct 2025 10:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760720574; x=1761325374;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=55RDAqJOlsF7cspILuwSRpcdchDKHFWIMFN0rshDS00=;
 b=YMMqvhrxJVhuRvsJFHfayH05IlgJcyRojyP+r3nLt7drgQoZOWzxeDE3ZT2vE1cHhv
 39pLp5Y4sExzSBDNtIPV/FOYIsI6Co28jr6LG/MY66u2oIa1vt4MizzyQkuWfNlX0m6p
 WgTfdjSIR1WFLNfta7RUbVSuDYq91UnNGOi8gisbCgKNY9sVP73xUQYuKnJxWn+PJKhk
 ucff5qYkIM05HoW5mF3MLBJOJM79PQAYEBSa9L30UYMNwqw4pGNVZAvLeesX6fICwJbT
 orbtNk1wGijUjbbCisRB9xU3QGzdR6At43/SkqEMX8pRQxXANDHxKWHmXrL8EvOFYF8a
 J/sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760720574; x=1761325374;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=55RDAqJOlsF7cspILuwSRpcdchDKHFWIMFN0rshDS00=;
 b=drY+fC5yyRgiCVFTtWWf4qJ8qkQXH+2kxoO1Igjea4DbB5tDBlkxLYmxHOrHO0Dn6y
 ZzFkTpZ75enMfnzcHVDxm5KFyl9xMnQ9Tv3S3kDTbMK0YIIXqkELty5BEBQURO4FbFSk
 yDGt6Ic2xRIy72PzZ5PFbhdGJlz7cNZv7n4mCsE+roNRSxlC9s79fHT6fK48vKmoxuyh
 abZS8Sov4IBuhafnnKR0ywflMQenFI0IGfxnNmr92tc684VSWZgW66U/AzCZGAe40lm7
 ZudwwVIDWiK63CgZgVHVaYDxH/sIB81XbViJzUB8VsxGsPMkEdmF/JFMiYGwWC1iO87N
 aRqQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXu4lptjnDS3fEA4dLbjMttjiRImcgO1hnZdIR4IdLhTdfHCbCNtkqDfL5Q/uoa+wDTTSp7HY14Bjzxsw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yzlqpern3O60pllu9rlQePx7T2x7YYwZeB5yAiiV0e/78Qqi0Nn
 Xsszzz/8K66ARVonyRORrs+S46DjxRwfWEjs0sV9YUe0nqv9ZZHEXscyyUcqoDWI4R1LzUdHOeB
 SKyGe9VH8OiNBRzjZHwhlL5+FfrR7+bQ=
X-Gm-Gg: ASbGncuSALVA46+zrQL+0aOXzZQAf3FrMnDj3bovt2PzdJ6IRUf0N3MpBjd4D/JJPV3
 s4daLCS9b1OZt1giaY+rl0qfPn7KOeIi+Pm/orbJBRknj9A8QEvgz2dTf2sfalM6PLwalV8S/Tr
 wPjLdgpfzRwai9ucsGDTqWE2PatvUAFqvIvUI2gfBwgfK2+HyQzh9LH7Jr8bPMKKSXr6Wd6sx5F
 d/j/+w/Py2JIz51g4pxWI+kpBMqej9Nfd0KO+xJKiMumhCmWescbBSjUiDbEw==
X-Google-Smtp-Source: AGHT+IFVuLjo+i5c3IPWvna7TnCjd/xxCKMaX2xPnsJedsSIowSo9qclvYxNvzwvo+hSZ3qc4RHxZPFW9pF6/iHQQLk=
X-Received: by 2002:a5d:5888:0:b0:426:f38a:a51 with SMTP id
 ffacd0b85a97d-42704d8d684mr3719155f8f.22.1760720574362; Fri, 17 Oct 2025
 10:02:54 -0700 (PDT)
MIME-Version: 1.0
References: <YfEhaK7VtJ4oru03@shell.armlinux.org.uk>
 <CA+V-a8taTL1aQ5L1uYfJ405X38953z1FO=X5S54QBqGxLsF5ow@mail.gmail.com>
In-Reply-To: <CA+V-a8taTL1aQ5L1uYfJ405X38953z1FO=X5S54QBqGxLsF5ow@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 17 Oct 2025 18:02:28 +0100
X-Gm-Features: AS18NWA6rZbliLLfxCHoG6LQgOdssCxpGbGI-5dUFG30WqziM0nwOAV2pUiLnc8
Message-ID: <CA+V-a8ve+6XPgWAQDJNwzG9ox-BSNqOBrO6JU7dL=yfQPgP0Ag@mail.gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Andrew Lunn <andrew@lunn.ch>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next v2 0/7] net: stmmac/xpcs:
	modernise PCS support
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

T24gRnJpLCBPY3QgMTcsIDIwMjUgYXQgNjowMOKAr1BNIExhZCwgUHJhYmhha2FyCjxwcmFiaGFr
YXIuY3NlbmdnQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBIaSwKPgo+IE9uIFdlZCwgSmFuIDI2LCAy
MDIyIGF0IDEwOjMy4oCvQU0gUnVzc2VsbCBLaW5nIChPcmFjbGUpCj4gPGxpbnV4QGFybWxpbnV4
Lm9yZy51az4gd3JvdGU6Cj4gPgo+ID4gSGksCj4gPgo+ID4gVGhpcyBzZXJpZXMgdXBkYXRlcyB4
cGNzIGFuZCBzdG1tYWMgZm9yIHRoZSByZWNlbnQgY2hhbmdlcyB0byBwaHlsaW5rCj4gPiB0byBi
ZXR0ZXIgc3VwcG9ydCBzcGxpdCBQQ1MgYW5kIHRvIGdldCByaWQgb2YgcHJpdmF0ZSBNQUMgdmFs
aWRhdGlvbgo+ID4gZnVuY3Rpb25zLgo+ID4KPiA+IFRoaXMgc2VyaWVzIGlzIHNsaWdodGx5IG1v
cmUgaW52b2x2ZWQgdGhhbiBvdGhlciBjb252ZXJzaW9ucyBhcyBzdG1tYWMKPiA+IGhhcyBhbHJl
YWR5IGhhZCBvcHRpb25hbCBwcm9wZXIgc3BsaXQgUENTIHN1cHBvcnQuCj4gPgo+ID4gVGhlIGZp
cnN0IHNpeCBwYXRjaGVzIG9mIHRoaXMgc2VyaWVzIHdlcmUgb3JpZ2luYWxseSBwb3N0ZWQgb24g
MTZ0aAo+ID4gRGVjZW1iZXIgZm9yIENGVCwgYW5kIFdvbmcgVmVlIEtoZWUgcmVwb3J0ZWQgaGlz
IEludGVsIEVsa2hhcnQgTGFrZQo+ID4gc2V0dXAgd2FzIGZpbmUgdGhlIGZpcnN0IHNpeCB0aGVz
ZS4gSG93ZXZlciwgbm8gdGVzdGVkLWJ5IHdhcyBnaXZlbi4KPiA+Cj4gPiBUaGUgcGF0Y2hlczoK
PiA+Cj4gPiAxKSBQcm92aWRlIGEgZnVuY3Rpb24gdG8gcXVlcnkgdGhlIHhwY3MgZm9yIHRoZSBp
bnRlcmZhY2UgbW9kZXMgdGhhdAo+ID4gICAgYXJlIHN1cHBvcnRlZC4KPiA+Cj4gPiAyKSBQb3B1
bGF0ZXMgdGhlIE1BQyBjYXBhYmlsaXRpZXMgYW5kIHN3aXRjaGVzIHN0bW1hY192YWxpZGF0ZSgp
IHRvIHVzZQo+ID4gICAgcGh5bGlua19nZXRfbGlua21vZGVzKCkuIFdlIGRvIG5vdCB1c2UgcGh5
bGlua19nZW5lcmljX3ZhbGlkYXRlKCkgeWV0Cj4gPiAgICBhcyAoYSkgd2UgZG8gbm90IGFsd2F5
cyBoYXZlIHRoZSBzdXBwb3J0ZWQgaW50ZXJmYWNlcyBwb3B1bGF0ZWQsIGFuZAo+ID4gICAgKGIp
IHRoZSBleGlzdGluZyBjb2RlIGRvZXMgbm90IHJlc3RyaWN0IGJhc2VkIG9uIGludGVyZmFjZS4g
VGhlcmUKPiA+ICAgIHNob3VsZCBiZSBubyBmdW5jdGlvbmFsIGVmZmVjdCBmcm9tIHRoaXMgcGF0
Y2guCj4gPgo+ID4gMykgUG9wdWxhdGVzIHBoeWxpbmsncyBzdXBwb3J0ZWQgaW50ZXJmYWNlcyBm
cm9tIHRoZSB4cGNzIHdoZW4gdGhlIHhwY3MKPiA+ICAgIGlzIGNvbmZpZ3VyZWQgYnkgZmlybXdh
cmUgYW5kIGFsc28gdGhlIGZpcm13YXJlIGNvbmZpZ3VyZWQgaW50ZXJmYWNlCj4gPiAgICBtb2Rl
LiBOb3RlOiB0aGlzIHdpbGwgcmVzdHJpY3Qgc3RtbWFjIHRvIG9ubHkgc3VwcG9ydGluZyB0aGVz
ZQo+ID4gICAgaW50ZXJmYWNlcyBtb2RlcyAtIHN0bW1hYyBtYWludGFpbmVycyBuZWVkIHRvIHZl
cmlmeSB0aGF0IHRoaXMKPiA+ICAgIGJlaGF2aW91ciBpcyBhY2NlcHRhYmxlLgo+ID4KPiA+IDQp
IHN0bW1hY192YWxpZGF0ZSgpIHRhaWwtY2FsbHMgeHBjc192YWxpZGF0ZSgpLCBidXQgd2UgZG9u
J3QgbmVlZCBpdCB0bwo+ID4gICAgbm93IHRoYXQgUENTIGhhdmUgdGhlaXIgb3duIHZhbGlkYXRp
b24gbWV0aG9kLiBDb252ZXJ0IHN0bW1hYyBhbmQKPiA+ICAgIHhwY3MgdG8gdXNlIHRoaXMgbWV0
aG9kIGluc3RlYWQuCj4gPgo+ID4gNSkgeHBjcyBzZXRzIHRoZSBwb2xsIGZpZWxkIG9mIHBoeWxp
bmtfcGNzIHRvIHRydWUsIG1lYW5pbmcgeHBjcwo+ID4gICAgcmVxdWlyZXMgaXRzIHN0YXR1cyB0
byBiZSBwb2xsZWQuIFRoZXJlIGlzIG5vIG5lZWQgdG8gYWxzbyBzZXQgdGhlCj4gPiAgICBwaHls
aW5rX2NvbmZpZy5wY3NfcG9sbC4gUmVtb3ZlIHRoaXMuCj4gPgo+ID4gNikgU3dpdGNoIHRvIHBo
eWxpbmtfZ2VuZXJpY192YWxpZGF0ZSgpLiBUaGlzIGlzIHByb2JhYmx5IHRoZSBtb3N0Cj4gPiAg
ICBjb250cmF2ZXJ0aWFsIGNoYW5nZSBpbiB0aGlzIHBhdGNoIHNldCBhcyB0aGlzIHdpbGwgY2F1
c2UgdGhlIE1BQyB0bwo+ID4gICAgcmVzdHJpY3QgbGluayBtb2RlcyBiYXNlZCBvbiB0aGUgaW50
ZXJmYWNlIG1vZGUuIEZyb20gYW4gaW5zcGVjdGlvbgo+ID4gICAgb2YgdGhlIHhwY3MgZHJpdmVy
LCB0aGlzIHNob3VsZCBiZSBzYWZlLCBhcyBYUENTIG9ubHkgZnVydGhlcgo+ID4gICAgcmVzdHJp
Y3RzIHRoZSBsaW5rIG1vZGVzIHRvIGEgc3Vic2V0IG9mIHRoZXNlICh3aGV0aGVyIHRoYXQgaXMK
PiA+ICAgIGNvcnJlY3Qgb3Igbm90IGlzIG5vdCBhbiBpc3N1ZSBJIGFtIGFkZHJlc3NpbmcgaGVy
ZS4pIEZvcgo+ID4gICAgaW1wbGVtZW50YXRpb25zIHRoYXQgZG8gbm90IHVzZSB4cGNzLCB0aGlz
IGlzIGEgbW9yZSBvcGVuIHF1ZXN0aW9uCj4gPiAgICBhbmQgbmVlZHMgZmVlZGJhY2sgZnJvbSBz
dG1tYWMgbWFpbnRhaW5lcnMuCj4gPgo+ID4gNykgQ29udmVydCB0byB1c2UgbWFjX3NlbGVjdF9w
Y3MoKSByYXRoZXIgdGhhbiBwaHlsaW5rX3NldF9wY3MoKSB0byBzZXQKPiA+ICAgIHRoZSBQQ1Mg
LSB0aGUgaW50ZW50aW9uIGlzIHRvIGV2ZW50dWFsbHkgcmVtb3ZlIHBoeWxpbmtfc2V0X3Bjcygp
Cj4gPiAgICBvbmNlIHRoZXJlIGFyZSBubyBtb3JlIHVzZXJzIG9mIHRoaXMuCj4gPgo+ID4gdjI6
IGZpeCBzaWdub2ZmIGFuZCB0ZW1wb3Jhcnkgd2FybmluZyBpbiBwYXRjaCA0Cj4gPgo+ID4gIGRy
aXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0bW1hY19tYWluLmMgfCAxNDcgKysr
KysrKy0tLS0tLS0tLS0tLS0tLQo+ID4gIGRyaXZlcnMvbmV0L3Bjcy9wY3MteHBjcy5jICAgICAg
ICAgICAgICAgICAgICAgICAgfCAgNDEgKysrLS0tCj4gPiAgaW5jbHVkZS9saW51eC9wY3MvcGNz
LXhwY3MuaCAgICAgICAgICAgICAgICAgICAgICB8ICAgMyArLQo+ID4gIDMgZmlsZXMgY2hhbmdl
ZCwgNzMgaW5zZXJ0aW9ucygrKSwgMTE4IGRlbGV0aW9ucygtKQo+ID4KPiBBbHRob3VnaCBSWi9W
MkggZG9lc24ndCBoYXZlIFBDUywgaXQgdGVzdGVkIHRoaXMgb24gUmVuZXNhcyBSWi9WMkggRVZL
Cj4gYW5kIGZvdW5kIG5vIHJlZ3Jlc3Npb25zLgo+Ck91Y2ggd3Jvbmcgc2VyaWVzLCByZXRyYWN0
aW5nIHRoZSBUZXN0ZWQtYnkuCgpDaGVlcnMsClByYWJoYWthcgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGlu
dXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
