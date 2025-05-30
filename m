Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C8017AC9871
	for <lists+linux-stm32@lfdr.de>; Sat, 31 May 2025 01:46:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6505CC3F92D;
	Fri, 30 May 2025 23:46:45 +0000 (UTC)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com
 [209.85.217.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 47013C3089F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 30 May 2025 23:46:43 +0000 (UTC)
Received: by mail-vs1-f43.google.com with SMTP id
 ada2fe7eead31-4e591544d42so841899137.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 30 May 2025 16:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748648802; x=1749253602;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o8r1VhQxE8YGMw2E+RF6ib2Y5lg3+2mjo9SImYhpolU=;
 b=hFASyUhlPWyDAoHSQNJDoLgZ2xtd8e4+t2ryjL/n2zgtbOJJZU+u/I4RmmpFdKoM1Z
 NxefiTi3OQ2fSdyjcAcVtVgafauprVqvAo7sFiboMSmtzf7dE+fW5VVMpckML6zvtd33
 c3jlFIdPVesmruTuFxLvNr7N365mOn/AUR0EmbODmauq08VnndUwYWi14FjLCpHRT/8S
 MoikrS1748xIRqCb62v2DTi2TmsN/ZQkVJuMPlR0haJnOwLBptXEnUYerBvq7fGtxqc7
 kyxtqIkCVYFuGJpfhUQ4FdTLzYonv+8hkzgk9fEODceuwfFuYxnVQxv/G97GIaaK8OsU
 Dh2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748648802; x=1749253602;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=o8r1VhQxE8YGMw2E+RF6ib2Y5lg3+2mjo9SImYhpolU=;
 b=gDxOcuuvO9jjeI3RFm+q0+nr1c4q+h8G0EuQ7ZCPuVfI6tD9jHF7pyZLBnvrfvjRAX
 krxURR20T27qeK6KysqBMi9+8apBjllUFkyo5dyBXd2b095DPrYvFYQq1CkhP+tBbkyy
 yPCFKeZAVlTX1zer4R0CaHbiLJa8osKvOhmedhAplTAJJVp/9sua8D5YuXSEa4gxAZpR
 TPJwFYT/Ny/aYUiqHeQUe+IpsGPy/BNnekK7NRYTbVbGLAfOc0t0IaMzjDYFvhtPl8mJ
 c2Ik6bdrnoSPDEPZjksrJmlfY3sFqkifczFatErILbOuTeBMmBxN5Q2EJNiHIHBOJMqw
 bZ0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXxlc8OLH0bLII6fSF3FseIzMcTI4JbpiG0JeAGB2bSce7RJBsrjPfpTfU0I9gfs8KYQ4enLuUFefo3cg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwQD4eitYhpNOz6Gk7rxcyXjWifhWWoEJRdxBUYEidjl8VSTWSE
 Bnxn+TwipozmxkJhhGq3DHwmn7CRFtmfqii1rw1HQvqy3m/3ONI+cnicdjkf415DBJDE0EZ6cfG
 u/ruAvL1aXsb1oNN5s1Ovg0qnMgB3iDU=
X-Gm-Gg: ASbGncs2evPDyaw0U7GJqLQeWj6oVlzeJjmWYaeNl4dfNKQaT/Xnmn3gx4KUqZyO/at
 7rQUouitHBiw2wpYO/V2XS0ibK5B9lElKcBD827Ybia3NHnou4qIXaodcr8lCZ5J1FnGSgMYiJa
 0XyS0QS0q9M0aqD3xCf9yRilEDZG5iJUPzGQ==
X-Google-Smtp-Source: AGHT+IGWYRqljBTNqRjcHJ1Qx5MgLEMU3w+EcX3w2i25x1ph1+e4wdYuKsPwq6FXpfXezjeuLLMkh2UEwUEoxLdnS0I=
X-Received: by 2002:a05:6102:41ab:b0:4e6:1a8c:13dd with SMTP id
 ada2fe7eead31-4e701bcd515mr59445137.7.1748648802024; Fri, 30 May 2025
 16:46:42 -0700 (PDT)
MIME-Version: 1.0
References: <20250527175558.2738342-1-james.hilliard1@gmail.com>
 <631ed4fe-f28a-443b-922b-7f41c20f31f3@lunn.ch>
 <CADvTj4rGdb_kHV_gjKTJNkzYEPMzqLcHY_1xw7wy5r-ryqDfNQ@mail.gmail.com>
 <fe8fb314-de99-45c2-b71e-5cedffe590b0@lunn.ch>
In-Reply-To: <fe8fb314-de99-45c2-b71e-5cedffe590b0@lunn.ch>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 30 May 2025 17:46:30 -0600
X-Gm-Features: AX0GCFsAv-uR3T4qW04ZGESiTbXNp1RMaFKH2XrMAyyDm-M83KQe_2yzaPmKFXE
Message-ID: <CADvTj4posNXP4FCXPqABtP0cMD1dPUH+hXcRQnetZ65ReKjOKQ@mail.gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Furong Xu <0x1207@gmail.com>, linux-kernel@vger.kernel.org,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 1/3] net: stmmac: allow drivers to
 explicitly select PHY device
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

T24gVHVlLCBNYXkgMjcsIDIwMjUgYXQgMjowMuKAr1BNIEFuZHJldyBMdW5uIDxhbmRyZXdAbHVu
bi5jaD4gd3JvdGU6Cj4KPiBPbiBUdWUsIE1heSAyNywgMjAyNSBhdCAwMToyMToyMVBNIC0wNjAw
LCBKYW1lcyBIaWxsaWFyZCB3cm90ZToKPiA+IE9uIFR1ZSwgTWF5IDI3LCAyMDI1IGF0IDE6MTTi
gK9QTSBBbmRyZXcgTHVubiA8YW5kcmV3QGx1bm4uY2g+IHdyb3RlOgo+ID4gPgo+ID4gPiBPbiBU
dWUsIE1heSAyNywgMjAyNSBhdCAxMTo1NTo1NEFNIC0wNjAwLCBKYW1lcyBIaWxsaWFyZCB3cm90
ZToKPiA+ID4gPiBTb21lIGRldmljZXMgbGlrZSB0aGUgQWxsd2lubmVyIEg2MTYgbmVlZCB0aGUg
YWJpbGl0eSB0byBzZWxlY3QgYSBwaHkKPiA+ID4gPiBpbiBjYXNlcyB3aGVyZSBtdWx0aXBsZSBQ
SFkncyBtYXkgYmUgcHJlc2VudCBpbiBhIGRldmljZSB0cmVlIGR1ZSB0bwo+ID4gPiA+IG5lZWRp
bmcgdGhlIGFiaWxpdHkgdG8gc3VwcG9ydCBtdWx0aXBsZSBTb0MgdmFyaWFudHMgd2l0aCBydW50
aW1lCj4gPiA+ID4gUEhZIHNlbGVjdGlvbi4KPiA+ID4KPiA+ID4gSSdtIG5vdCBjb252aW5jZWQg
YWJvdXQgdGhpcyB5ZXQuIEFzIGZhciBhcyBpIHNlZSwgaXQgaXMgZGlmZmVyZW50Cj4gPiA+IHZh
cmlhbnRzIG9mIHRoZSBINjE2LiBUaGV5IHNob3VsZCBoYXZlIGRpZmZlcmVudCBjb21wYXRpYmxl
cywgc2luY2UKPiA+ID4gdGhleSBhcmUgbm90IGFjdHVhbGx5IGNvbXBhdGlibGUsIGFuZCB5b3Ug
c2hvdWxkIGhhdmUgZGlmZmVyZW50IERUCj4gPiA+IGRlc2NyaXB0aW9ucy4gU28geW91IGRvbid0
IG5lZWQgcnVudGltZSBQSFkgc2VsZWN0aW9uLgo+ID4KPiA+IERpZmZlcmVudCBjb21wYXRpYmxl
cyBmb3Igd2hhdCBzcGVjaWZpY2FsbHk/IEkgbWVhbiB0aGUgUEhZIGNvbXBhdGlibGVzCj4gPiBh
cmUganVzdCB0aGUgZ2VuZXJpYyAiZXRoZXJuZXQtcGh5LWllZWU4MDIuMy1jMjIiIGNvbXBhdGli
bGVzLgo+Cj4gWW91IGF0IGxlYXN0IGhhdmUgYSBkaWZmZXJlbnQgTVREIGRldmljZXMsIGV4cG9y
dGluZyBkaWZmZXJlbnQKPiBjbG9ja3MvUFdNL1Jlc2V0IGNvbnRyb2xsZXJzLiBUaGF0IHNob3Vs
ZCBoYXZlIGRpZmZlcmVudCBjb21wYXRpYmxlcywKPiBzaW5jZSB0aGV5IGFyZSBub3QgY29tcGF0
aWJsZS4gWW91IHRoZW4gbmVlZCBwaGFuZGxlcyB0byB0aGVzZQo+IGRpZmZlcmVudCBjbG9ja3Mv
UFdNL1Jlc2V0IGNvbnRyb2xsZXJzLCBhbmQgZm9yIG9uZSBvZiB0aGUgUEhZcyB5b3UKPiBuZWVk
IGEgcGhhbmRsZSB0byB0aGUgSTJDIGJ1cywgc28gdGhlIFBIWSBkcml2ZXIgY2FuIGRvIHRoZQo+
IGluaXRpYWxpc2F0aW9uLiBTbyBpIHRoaW5rIGluIHRoZSBlbmQgeW91IGtub3cgd2hhdCBQSFkg
eW91IGhhdmUgb24KPiB0aGUgYm9hcmQsIHNvIHRoZXJlIGlzIG5vIG5lZWQgdG8gZG8gcnVudGlt
ZSBkZXRlY3Rpb24uCgpIbW0sIHRoaW5raW5nIGFib3V0IHRoaXMgYWdhaW4sIG1heWJlIGl0IG1h
a2VzIHNlbnNlIHRvIGp1c3QKZG8gdGhlIHJ1bnRpbWUgZGV0ZWN0aW9uIGluIHRoZSBNRkQgZHJp
dmVyIGVudGlyZWx5LCBhcyBpdCB0dXJucwpvdXQgdGhlIEFDMzAwIGluaXRpYWxpemF0aW9uIHNl
cXVlbmNlIGlzIGxhcmdlbHkgYSBzdWJzZXQgb2YgdGhlCkFDMjAwIGluaXRpYWxpemF0aW9uIHNl
cXVlbmNlKEFDMzAwIHdvdWxkIGp1c3Qgbm90IG5lZWQgYW55CmkyYyBwYXJ0IG9mIHRoZSBpbml0
aWFsaXphdGlvbiBzZXF1ZW5jZSkuIFNvIGlmIHdlIHVzZSB0aGUgc2FtZQpNRkQgZHJpdmVyIHdo
aWNoIGludGVybmFsbHkgZG9lcyBhdXRvZGV0ZWN0aW9uIHRoZW4gd2UgY2FuCmF2b2lkIHRoZSBu
ZWVkIGZvciBzZWxlY3Rpbmcgc2VwYXJhdGUgUEhZJ3MgZW50aXJlbHkuIFRoaXMgYXQKbGVhc3Qg
aXMgbGFyZ2VseSBob3cgdGhlIHZlbmRvciBCU1AgZHJpdmVyIHdvcmtzIGF0IHRoZSBtb21lbnQu
CgpXb3VsZCB0aGlzIGFwcHJvYWNoIG1ha2Ugc2Vuc2U/Cgo+IFdoYXQgeW91IG1pZ2h0IHdhbnQg
aG93ZXZlciBpcyB0byB2YWxpZGF0ZSB0aGUgTVREIGRldmljZSBjb21wYXRpYmxlCj4gYWdhaW5z
dCB0aGUgZnVzZSBhbmQgcmV0dXJuIC1FTk9ERVYgaWYgdGhlIGNvbXBhdGlibGUgaXMgd3Jvbmcg
Zm9yIHRoZQo+IGZ1c2UuCj4KPiAgICAgICAgIEFuZHJldwpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgt
c3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
