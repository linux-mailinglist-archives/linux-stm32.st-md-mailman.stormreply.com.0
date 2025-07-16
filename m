Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C9E1FB07D92
	for <lists+linux-stm32@lfdr.de>; Wed, 16 Jul 2025 21:26:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3B479C3F938;
	Wed, 16 Jul 2025 19:26:52 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DC988C3F933
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Jul 2025 19:26:50 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-451dbe494d6so1774285e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Jul 2025 12:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752694010; x=1753298810;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xDDM8l3h0Fw3qJuqS7zowlihC7cLJKPy3Un6rJmnlMs=;
 b=Wa9VV870mCliWqtSNswDKdnogG/nVR6KebtY+PYfxoMIgrfJ3Q04JPiAZ7MpTYgUYj
 lAdVxVB5eqwZmwRcdIWr2Lo1Xeew9bCCb94xzfBKWF71fnq4GjfUej1JlIjQixlogKke
 q9eC6o2QVGa63iKeLDlX7tLOxEmFQ2NeFRcRQUJFhHme3ngSrnEyBMz5aXpbFDTOiiGn
 8OALXuxoDoLrvoi3UDaFBnsoC2pgfqrgSDSxmS7P1Q8yoyTbf59Day8ADvK26m3P6fBI
 l3/oqLrblPmNmwBKRpzV4hX9T3DNjMDLnAjZxqrXyO39gqtvT4riVwKO63VRWTQYbcyp
 bHUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752694010; x=1753298810;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xDDM8l3h0Fw3qJuqS7zowlihC7cLJKPy3Un6rJmnlMs=;
 b=ROJLhBXef3/vx2/BIQ4GPCdHE/ydHz2HHWsH8/5xgaorFXRvjk+NfqIwlg5z72b0H3
 mc2XUWDyNWQMuG4iUYO+z8l9TVafO8nLQQ5cPldOEVIweyQ0rJfoMZ7Pl9FEp/f4aURj
 jX1fqkSyJVs9PuHD0dDp83reSwobJZQ1gkQnW0AP38UZSBO+qPK6cxEFHxIpL1g5AGpV
 zDFTkpxVq4hbkPjLewzJS5N8dcQCIBrcHfEWaEAGvH1bmyZIqgHTvD0mgbE1MiySVl70
 H0v+SB3HO4/jGX39S6vc51T9CkCW1gSxxtBPRnocU7GbRjsGV8611yf5c+KZU3hVoqNI
 //Jg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWdF2dfD6ItF/Wj3uPV2bjAXeCvgEf3sWr4oY0bf4znBL6g6W0MkDe65Zn0P9sW/MyOuHH3DRjQhQY1CA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yyhc9btNdR1Ti8/kb/ix+zU4KuWepdU8APi61rgTuq0Xq9VQkXW
 m8d7UMe3Uki+wfs4XqSPEVVRZT/dWUZhCmfY64cCkeeZfB5g4BBbt/6bEpwimL3l6iK51einkbN
 ReHLq+IzBBy2Y4GB8wORuK4FisCBavkk=
X-Gm-Gg: ASbGncsdJX2ZbtuJW/9e/5/+YFZ2UUXFX0ZOCukBM5y8N/cWn8+0clqLb0PtHS8KFTc
 AokzaKHL8nxRJAeR0URAwk883dSi2lzJRA2nRW3UwqdqQvoxD1vUaOQawm3IIWNcn5yInNH/I23
 Yh7V+p/bc4KrBr5TsvtGLtlLTFwCvf8P+P09pgTBR9mDjlm4gQ535+UPOZfNX193ZERYozFVmuC
 hTRJeBVsVryBEtZAqw=
X-Google-Smtp-Source: AGHT+IG4hycp+esWmsd2Z1+rpj9/YEraQLvhtZn7APofxtvpj7YLxfhmQfzBkZnpCvMDICpuYr9ivl1mVrd1KFZdmyg=
X-Received: by 2002:a05:600c:8b67:b0:456:19be:5cc with SMTP id
 5b1f17b1804b1-4562e38a883mr37986905e9.14.1752694009872; Wed, 16 Jul 2025
 12:26:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250705170326.106073-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250705170326.106073-1-biju.das.jz@bp.renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 16 Jul 2025 20:26:23 +0100
X-Gm-Features: Ac12FXzHx2y0J4y7k-9UUt0aRslx85AqxD4tqzLHcP623nHbyWD8RXhTbillqKI
Message-ID: <CA+V-a8tZKMfDjxmrkTJhN+=WoGBR0711yoZYgQWDKd361f9q_A@mail.gmail.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Biju Das <biju.das.au@gmail.com>, linux-kernel@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac:
 dwmac-renesas-gbeth: Add PM suspend/resume callbacks
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

T24gU2F0LCBKdWwgNSwgMjAyNSBhdCA2OjAz4oCvUE0gQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJw
LnJlbmVzYXMuY29tPiB3cm90ZToKPgo+IEFkZCBQTSBzdXNwZW5kL3Jlc3VtZSBjYWxsYmFja3Mg
Zm9yIFJaL0czRSBTTUFSQyBFVksuCj4KPiBUaGUgUE0gZGVlcCBlbnRyeSBpcyBleGVjdXRlZCBi
eSBwcmVzc2luZyB0aGUgU0xFRVAgYnV0dG9uIGFuZCBleGl0IGZyb20KPiBlbnRyeSBpcyBieSBw
cmVzc2luZyB0aGUgcG93ZXIgYnV0dG9uLgo+Cj4gTG9nczoKPiByb290QHNtYXJjLXJ6ZzNlOn4j
IFBNOiBzdXNwZW5kIGVudHJ5IChkZWVwKQo+IEZpbGVzeXN0ZW1zIHN5bmM6IDAuMTE1IHNlY29u
ZHMKPiBGcmVlemluZyB1c2VyIHNwYWNlIHByb2Nlc3Nlcwo+IEZyZWV6aW5nIHVzZXIgc3BhY2Ug
cHJvY2Vzc2VzIGNvbXBsZXRlZCAoZWxhcHNlZCAwLjAwMiBzZWNvbmRzKQo+IE9PTSBraWxsZXIg
ZGlzYWJsZWQuCj4gRnJlZXppbmcgcmVtYWluaW5nIGZyZWV6YWJsZSB0YXNrcwo+IEZyZWV6aW5n
IHJlbWFpbmluZyBmcmVlemFibGUgdGFza3MgY29tcGxldGVkIChlbGFwc2VkIDAuMDAxIHNlY29u
ZHMpCj4gcHJpbnRrOiBTdXNwZW5kaW5nIGNvbnNvbGUocykgKHVzZSBub19jb25zb2xlX3N1c3Bl
bmQgdG8gZGVidWcpCj4gTk9USUNFOiAgQkwyOiB2Mi4xMC41KHJlbGVhc2UpOjIuMTAuNS9yel9z
b2NfZGV2LTE2Mi1nNzE0OGJhODM4Cj4gTk9USUNFOiAgQkwyOiBCdWlsdCA6IDE0OjIzOjU4LCBK
dWwgIDUgMjAyNQo+IE5PVElDRTogIEJMMjogU1lTX0xTSV9NT0RFOiAweDEzZTA2Cj4gTk9USUNF
OiAgQkwyOiBTWVNfTFNJX0RFVklEOiAweDg2Nzk0NDcKPiBOT1RJQ0U6ICBCTDI6IFNZU19MU0lf
UFJSOiAweDAKPiBOT1RJQ0U6ICBCTDI6IEJvb3RpbmcgQkwzMQo+IHJlbmVzYXMtZ2JldGggMTVj
MzAwMDAuZXRoZXJuZXQgZW5kMDogTGluayBpcyBEb3duCj4gRGlzYWJsaW5nIG5vbi1ib290IENQ
VXMgLi4uCj4gcHNjaTogQ1BVMyBraWxsZWQgKHBvbGxlZCAwIG1zKQo+IHBzY2k6IENQVTIga2ls
bGVkIChwb2xsZWQgMCBtcykKPiBwc2NpOiBDUFUxIGtpbGxlZCAocG9sbGVkIDAgbXMpCj4gRW5h
Ymxpbmcgbm9uLWJvb3QgQ1BVcyAuLi4KPiBEZXRlY3RlZCBWSVBUIEktY2FjaGUgb24gQ1BVMQo+
IEdJQ3YzOiBDUFUxOiBmb3VuZCByZWRpc3RyaWJ1dG9yIDEwMCByZWdpb24gMDoweDAwMDAwMDAw
MTQ5NjAwMDAKPiBDUFUxOiBCb290ZWQgc2Vjb25kYXJ5IHByb2Nlc3NvciAweDAwMDAwMDAxMDAg
WzB4NDEyZmQwNTBdCj4gQ1BVMSBpcyB1cAo+IERldGVjdGVkIFZJUFQgSS1jYWNoZSBvbiBDUFUy
Cj4gR0lDdjM6IENQVTI6IGZvdW5kIHJlZGlzdHJpYnV0b3IgMjAwIHJlZ2lvbiAwOjB4MDAwMDAw
MDAxNDk4MDAwMAo+IENQVTI6IEJvb3RlZCBzZWNvbmRhcnkgcHJvY2Vzc29yIDB4MDAwMDAwMDIw
MCBbMHg0MTJmZDA1MF0KPiBDUFUyIGlzIHVwCj4gRGV0ZWN0ZWQgVklQVCBJLWNhY2hlIG9uIENQ
VTMKPiBHSUN2MzogQ1BVMzogZm91bmQgcmVkaXN0cmlidXRvciAzMDAgcmVnaW9uIDA6MHgwMDAw
MDAwMDE0OWEwMDAwCj4gQ1BVMzogQm9vdGVkIHNlY29uZGFyeSBwcm9jZXNzb3IgMHgwMDAwMDAw
MzAwIFsweDQxMmZkMDUwXQo+IENQVTMgaXMgdXAKPiBkd21hYzQ6IE1hc3RlciBBWEkgcGVyZm9y
bXMgZml4ZWQgYnVyc3QgbGVuZ3RoCj4gMTVjMzAwMDAuZXRoZXJuZXQgZW5kMDogTm8gU2FmZXR5
IEZlYXR1cmVzIHN1cHBvcnQgZm91bmQKPiAxNWMzMDAwMC5ldGhlcm5ldCBlbmQwOiBJRUVFIDE1
ODgtMjAwOCBBZHZhbmNlZCBUaW1lc3RhbXAgc3VwcG9ydGVkCj4gMTVjMzAwMDAuZXRoZXJuZXQg
ZW5kMDogY29uZmlndXJpbmcgZm9yIHBoeS9yZ21paS1pZCBsaW5rIG1vZGUKPiBkd21hYzQ6IE1h
c3RlciBBWEkgcGVyZm9ybXMgZml4ZWQgYnVyc3QgbGVuZ3RoCj4gMTVjNDAwMDAuZXRoZXJuZXQg
ZW5kMTogTm8gU2FmZXR5IEZlYXR1cmVzIHN1cHBvcnQgZm91bmQKPiAxNWM0MDAwMC5ldGhlcm5l
dCBlbmQxOiBJRUVFIDE1ODgtMjAwOCBBZHZhbmNlZCBUaW1lc3RhbXAgc3VwcG9ydGVkCj4gMTVj
NDAwMDAuZXRoZXJuZXQgZW5kMTogY29uZmlndXJpbmcgZm9yIHBoeS9yZ21paS1pZCBsaW5rIG1v
ZGUKPiBPT00ga2lsbGVyIGVuYWJsZWQuCj4gUmVzdGFydGluZyB0YXNrczogU3RhcnRpbmcKPiBS
ZXN0YXJ0aW5nIHRhc2tzOiBEb25lCj4gcmFuZG9tOiBjcm5nIHJlc2VlZGVkIG9uIHN5c3RlbSBy
ZXN1bXB0aW9uCj4gUE06IHN1c3BlbmQgZXhpdAo+Cj4gMTVjMzAwMDAuZXRoZXJuZXQgZW5kMDog
TGluayBpcyBVcCAtIDFHYnBzL0Z1bGwgLSBmbG93IGNvbnRyb2wgcngvdHgKPiByb290QHNtYXJj
LXJ6ZzNlOn4jIGlmY29uZmlnIGVuZDAgMTkyLjE2OC4xMC43IHVwCj4gcm9vdEBzbWFyYy1yemcz
ZTp+IyBwaW5nIDE5Mi4xNjguMTAuMQo+IFBJTkcgMTkyLjE2OC4xMC4xICgxOTIuMTY4LjEwLjEp
IDU2KDg0KSBieXRlcyBvZiBkYXRhLgo+IDY0IGJ5dGVzIGZyb20gMTkyLjE2OC4xMC4xOiBpY21w
X3NlcT0xIHR0bD02NCB0aW1lPTIuMDUgbXMKPiA2NCBieXRlcyBmcm9tIDE5Mi4xNjguMTAuMTog
aWNtcF9zZXE9MiB0dGw9NjQgdGltZT0wLjkyOCBtcwo+Cj4gU2lnbmVkLW9mZi1ieTogQmlqdSBE
YXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPgo+IC0tLQo+IFRoaXMgcGF0Y2ggaXMgdGVz
dGVkIHdpdGggb3V0LW9mIHRyZWUgcGF0Y2ggZm9yIHNhdmUvcmVzdG9yZQo+IGV0aGVybmV0IE9F
TiByZWdpc3RlcnMgaW4gdGhlIHBpbmN0cmwgYmxvY2suCj4gLS0tCj4gIGRyaXZlcnMvbmV0L2V0
aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLXJlbmVzYXMtZ2JldGguYyB8IDEgKwo+ICAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPgpSZXZpZXdlZC1ieTogTGFkIFByYWJoYWthciA8
cHJhYmhha2FyLm1haGFkZXYtbGFkLnJqQGJwLnJlbmVzYXMuY29tPgoKQ2hlZXJzLApQcmFiaGFr
YXIKCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3
bWFjLXJlbmVzYXMtZ2JldGguYyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFj
L2R3bWFjLXJlbmVzYXMtZ2JldGguYwo+IGluZGV4IDlhNzc0MDQ2NDU1Yi4uZGY0Y2E4OTdhNjBj
IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFj
LXJlbmVzYXMtZ2JldGguYwo+ICsrKyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3Rt
bWFjL2R3bWFjLXJlbmVzYXMtZ2JldGguYwo+IEBAIC0xMzYsNiArMTM2LDcgQEAgc3RhdGljIHN0
cnVjdCBwbGF0Zm9ybV9kcml2ZXIgcmVuZXNhc19nYmV0aF9kcml2ZXIgPSB7Cj4gICAgICAgICAu
cHJvYmUgID0gcmVuZXNhc19nYmV0aF9wcm9iZSwKPiAgICAgICAgIC5kcml2ZXIgPSB7Cj4gICAg
ICAgICAgICAgICAgIC5uYW1lICAgICAgICAgICA9ICJyZW5lc2FzLWdiZXRoIiwKPiArICAgICAg
ICAgICAgICAgLnBtICAgICAgICAgICAgID0gJnN0bW1hY19wbHRmcl9wbV9vcHMsCj4gICAgICAg
ICAgICAgICAgIC5vZl9tYXRjaF90YWJsZSA9IHJlbmVzYXNfZ2JldGhfbWF0Y2gsCj4gICAgICAg
ICB9LAo+ICB9Owo+IC0tCj4gMi40My4wCj4KPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJA
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
