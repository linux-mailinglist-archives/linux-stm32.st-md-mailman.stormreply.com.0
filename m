Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C010AC5D5F
	for <lists+linux-stm32@lfdr.de>; Wed, 28 May 2025 00:47:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CCE10C36B19;
	Tue, 27 May 2025 22:47:43 +0000 (UTC)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com
 [209.85.221.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 923BDC36B17
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 May 2025 22:47:42 +0000 (UTC)
Received: by mail-vk1-f179.google.com with SMTP id
 71dfb90a1353d-52e728960c3so1490916e0c.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 May 2025 15:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748386061; x=1748990861;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nxxTE8N1NiBs4G5g2I9AK/16Q2IKP+a3RuAqB4TehIU=;
 b=Id4+w5EHFBJZQaMmJxWA5tm29utkQGjLMnSfWml/PNeeItEeHk5uK0ASVwKGkbLuJH
 oYenL95rTUgxEZKc93CswQpRRlBHjY03WKVAjJeFgaHKAe85RJz/nk9FCN4gfNEZjoRQ
 QyL7IehXG1uu5gktJYGCy9DnqurnG+TnGO9G3jy+syulW3S/761D9xRQhDXfElBo2wXd
 9b+bqOUBh6cS6fZF5n8B8KEnv36YIWKIJesWhEwgB31pM2tcor7IFOHaPBOPFMy2zd6A
 7WisA4IEqGa4GtQ/kSf+/raBDA55JHU0KurG9IkuPlXGEDCTiYVcuAHH+3Hif/iXfXtM
 SWYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748386061; x=1748990861;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nxxTE8N1NiBs4G5g2I9AK/16Q2IKP+a3RuAqB4TehIU=;
 b=HidiUvVtGtgpNJh3xkqxP2vX9zoHHeZiJWgCnSFslsHeYw8ujFHX3624mcCGeOLRWz
 nR5QYXULUXJ125wFPs/PVBsqjjk+RP8CkTlF6JxCNq5EVGB276gu702vvd5ga89mJiwa
 zOMD9eFQqiYF12Fpdsyo2LlFDvPderxXjQI+vfwu2kD7HJC07wRnNVjZtuzHV8bD2QIx
 G5KDCIPBYioa2vV4i4HS/F+sZ3jUo4FbNMtPoawWp6hX+yyZJlDN7SEGFywRo6OKula/
 BZvCkYihL+Gn28BbaevAIpr4T7wkEDN+3/fn5bOWlyC/SEZqOhFaUNWFtZjqJmlY5jHW
 8t6w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXVlllITQJ0yy0CGIq1LdekjhyJF4XYJp3/0LhxTMw1/0BUgc8QBOzuLl4u2yEMiZlitH29CvB/DII0Cg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzUXYHCiv/67+9iMWnmYXWFDjYoR5+xo0j+L5UNz2nRP6657nQ8
 jTXjzU1/w+pqgJc7Vn4HclK8pPV5CA7v+HYG9ehUj0ws1qB0IEJjqXDl3F/4gBgdJTxbgPQFRgx
 meS6CPSNpYvsy/5HIZfvJcfJp8uTlzMc=
X-Gm-Gg: ASbGncse3AlwVy7/+wZ6359JTcYn4/idm8ut+K/UdqfGPF/OTanPwRtlEVqyx4iHuFg
 PKMcud0PNqGQU3u1tUgxax8mg2oYntqRrAEH67AfmkdcPlRcrzOo7Ns0XIkqH/vNbCXD0qLdFIa
 9jDuCv+PmJcKbVmQN10Sb5g6tSUBq1PaOn5w==
X-Google-Smtp-Source: AGHT+IEIHMkdlH/en+uXp0oVsAoqX5M/MWpWjcwQtNcI4RUU/vNIUEP2JP+Exp7QavSYY/Cs2DChtfMhjj8/xUWGVBU=
X-Received: by 2002:a05:6122:3087:b0:530:63d9:115a with SMTP id
 71dfb90a1353d-53063d913a6mr831217e0c.4.1748386061291; Tue, 27 May 2025
 15:47:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250527175558.2738342-1-james.hilliard1@gmail.com>
 <631ed4fe-f28a-443b-922b-7f41c20f31f3@lunn.ch>
 <CADvTj4rGdb_kHV_gjKTJNkzYEPMzqLcHY_1xw7wy5r-ryqDfNQ@mail.gmail.com>
 <fe8fb314-de99-45c2-b71e-5cedffe590b0@lunn.ch>
 <CADvTj4qRmjUQJnhamkWNpHGNAtvFyOJnbaQ5RZ6NYYqSNhxshA@mail.gmail.com>
 <014d8d63-bfb1-4911-9ea6-6f4cdabc46e5@lunn.ch>
 <CADvTj4oVj-38ohw7Na9rkXLTGEEFkLv=4S40GPvHM5eZnN7KyA@mail.gmail.com>
 <93bfec74-c679-400f-8ce4-3bc84d6d803f@lunn.ch>
In-Reply-To: <93bfec74-c679-400f-8ce4-3bc84d6d803f@lunn.ch>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 27 May 2025 16:47:30 -0600
X-Gm-Features: AX0GCFtPGtsaGbTe2C2G-Irv_0PosK6COEhRkyls49G6hbvQpWVi2Nid9Q5gamo
Message-ID: <CADvTj4oF4UOnDUvVUtuaM6U5RR4WF02qmheqg8fEafev2En3eQ@mail.gmail.com>
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

T24gVHVlLCBNYXkgMjcsIDIwMjUgYXQgMzo0OOKAr1BNIEFuZHJldyBMdW5uIDxhbmRyZXdAbHVu
bi5jaD4gd3JvdGU6Cj4KPiBPbiBUdWUsIE1heSAyNywgMjAyNSBhdCAwMjozNzowM1BNIC0wNjAw
LCBKYW1lcyBIaWxsaWFyZCB3cm90ZToKPiA+IE9uIFR1ZSwgTWF5IDI3LCAyMDI1IGF0IDI6MzDi
gK9QTSBBbmRyZXcgTHVubiA8YW5kcmV3QGx1bm4uY2g+IHdyb3RlOgo+ID4gPgo+ID4gPiA+IFN1
cmUsIHRoYXQgbWF5IG1ha2Ugc2Vuc2UgdG8gZG8gYXMgd2VsbCwgYnV0IEkgc3RpbGwgZG9uJ3Qg
c2VlCj4gPiA+ID4gaG93IHRoYXQgaW1wYWN0cyB0aGUgbmVlZCB0byBydW50aW1lIHNlbGVjdCB0
aGUgUEhZIHdoaWNoCj4gPiA+ID4gaXMgY29uZmlndXJlZCBmb3IgdGhlIGNvcnJlY3QgTUZELgo+
ID4gPgo+ID4gPiBJZiB5b3Uga25vdyB3aGF0IHZhcmlhbnQgeW91IGhhdmUsIHlvdSBvbmx5IGlu
Y2x1ZGUgdGhlIG9uZSBQSFkgeW91Cj4gPiA+IGFjdHVhbGx5IGhhdmUsIGFuZCBwaHktaGFuZGxl
IHBvaW50cyB0byBpdCwganVzdCBhcyBub3JtYWwuIE5vIHJ1bnRpbWUKPiA+ID4gc2VsZWN0aW9u
Lgo+ID4KPiA+IE9oLCBzbyBoZXJlJ3MgdGhlIGlzc3VlLCB3ZSBoYXZlIGJvdGggUEhZIHZhcmlh
bnRzLCBvbGRlciBoYXJkd2FyZQo+ID4gZ2VuZXJhbGx5IGhhcyBBQzIwMCBQSFkncyB3aGlsZSBu
ZXdlciBzaGlwcyBBQzMwMCBQSFkncywgYnV0Cj4gPiB3aGVuIEkgc3VydmV5ZWQgb3VyIGRlcGxv
eWVkIGhhcmR3YXJlIHVzaW5nIHRoZXNlIGJvYXJkcyBtYW55Cj4gPiBzeXN0ZW1zIG9mIHNpbWls
YXIgYWdlIHdvdWxkIHJhbmRvbWx5IG1peCBBQzIwMCBhbmQgQUMzMDAgUEhZJ3MuCj4KPiBBcmUg
dGhleSBwaW4gY29tcGF0aWJsZT8KCkZyb20gbXkgdW5kZXJzdGFuZGluZyB0aGV5IGFyZSBlbnRp
cmVseSBwaW4gY29tcGF0aWJsZS4KCj4gQnV0IGkgYXNzdW1lIG5vbmUgb2YgdGhlc2UgYm9hcmRz
IC5kdHMgZmlsZXMgYXJlIGFjdHVhbGx5IGluIG1haW5saW5lPwo+IFNvIHRoZXkgbmVlZCB0byBn
byB0aHJvdWdoIHJldmlldywgYW5kIGFyZSBsaWtlbHkgdG8gYmUgaG9ycmlibHkKPiBicm9rZW4g
YW5kIG5lZWQgZml4aW5nPyBTbyB5b3UgY2FuIGZpeCB1cCB0aGUgUEhZIG5vZGUgYXMgcGFydCBv
ZiB0aGUKPiBjbGVhbnVwLgoKVGhlIHNwZWNpZmljIGJvYXJkIEknbSB3b3JraW5nIHdpdGggaXMg
bm90IGluIG1haW5saW5lLCBob3dldmVyIHRoZXJlCmFyZSBib2FyZHMgaW4gbWFpbmxpbmUgdGhh
dCB3aWxsIGhhdmUgdGhlIGV4YWN0IHNhbWUgaXNzdWUuIFRoZXkgc2ltcGx5CmRvIG5vdCBjdXJy
ZW50bHkgaGF2ZSBhbnkgaGFyZGxpbmUgZXRoZXJuZXQgc3VwcG9ydCBpbiBtYWlubGluZSBhdCB0
aGUKbW9tZW50IGFuZCBoYXZlIHRvIHJlbHkgb24gd2lmaSBmb3IgaW50ZXJuZXQgY29ubmVjdGl2
aXR5IHVubGVzcyB1c2luZwpvdXQgb2YgdHJlZSBwYXRjaGVzLgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGlu
dXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
