Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CA2A5A1B5A1
	for <lists+linux-stm32@lfdr.de>; Fri, 24 Jan 2025 13:21:05 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 84E90C78F85;
	Fri, 24 Jan 2025 12:21:05 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 38923C78F73
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Jan 2025 09:09:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id C55E3A41309
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Jan 2025 09:08:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67EBDC4CEE5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Jan 2025 09:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1737709789;
 bh=6ODapJhhQGi6PIhN0lVMoDCWGSUnfR1hVh+dZ2hFuZU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=D/CNhJT1iq1VYsG5Y2ZI8HFz67jLp/v0T6K+8uGnhtITcpn7w55gY+nNXFi1PUGHY
 l2drx1RXWkDsIIi1BCW3GplM8xyKT6x9jvnK/utNeFTjjCzM8jdxSmHSOdczFlrx2b
 6E+gGqSBwvPb1Qwz+cKoOI1oyv5M0mGn54CK/AUArIOyU/n4NRxMIMqx5Ji1aLJ8bM
 02XRZ6Nx2xU1yMlsOWCamUbqdTR8xROse9WOfTKyrKty0xBpRg9bRTXYGjVnumg80n
 YYZNm+PB9WGgPQbnBYrRQX7VNzDaVgjflgFpXSsBMs5BZ/buTxOJJkUABZpy4HUGJ8
 8o/D3FdiyZsMw==
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-ab2c9b8aecaso332440566b.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Jan 2025 01:09:49 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUTqkV/J/76PI+hsUNtj2S98OhxK82fA1/iGu9Ihe1MiiBU4Zl2W0POlm39vP+iMNPvkHK44SV5BoTR6w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yy9m4mc7NPZesDvqZ+ce0XUKX0VgxvDpj9iKkAYiZZbVOf1T9Zm
 ep9XIwW+8mtDTItDcNd/f4hBfDCvczUYmQwoAiamMr4OIt7YvlesJB/8Gjj/yFkunm10UWLJLga
 rzn/S43i526nZS2vKVTb6WFZ2rJs=
X-Google-Smtp-Source: AGHT+IGTuAf8HhxS55jC5emGy1X+8qNgDIgPU/o1SgJWkl820wvVBBoCo7jL58E2K6QC878sjf/FnZgeOx4+ewldUuc=
X-Received: by 2002:a17:907:7fa4:b0:ab6:511d:8908 with SMTP id
 a640c23a62f3a-ab6511d8af9mr1112359566b.40.1737709787937; Fri, 24 Jan 2025
 01:09:47 -0800 (PST)
MIME-Version: 1.0
References: <20250121093703.2660482-1-chenhuacai@loongson.cn>
 <20250122133450.GI390877@kernel.org>
In-Reply-To: <20250122133450.GI390877@kernel.org>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 24 Jan 2025 17:09:39 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4=FQbZakx_=V-qcoWuBzbVyL31qmStNS9OFt-49w20bw@mail.gmail.com>
X-Gm-Features: AWEUYZlq08fDdXgdubKEAY1DJZk-M0VOQOeQI5in40fIJ5XHXxgmvkwOvdPO5R4
Message-ID: <CAAhV-H4=FQbZakx_=V-qcoWuBzbVyL31qmStNS9OFt-49w20bw@mail.gmail.com>
To: Simon Horman <horms@kernel.org>
X-Mailman-Approved-At: Fri, 24 Jan 2025 12:21:05 +0000
Cc: Chong Qiao <qiaochong@loongson.cn>, Feiyang Chen <chenfeiyang@loongson.cn>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Yanteng Si <si.yanteng@linux.dev>, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Serge Semin <fancer.lancer@gmail.com>, loongarch@lists.linux.dev,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Huacai Chen <chenhuacai@loongson.cn>
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: dwmac-loongson: Set correct
	{tx, rx}_fifo_size
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

T24gV2VkLCBKYW4gMjIsIDIwMjUgYXQgOTozNOKAr1BNIFNpbW9uIEhvcm1hbiA8aG9ybXNAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiArIEZlaXlhbmcgQ2hlbiwgWWFudGVuZyBTaSwgQWxleGFuZHJl
IFRvcmd1ZSwgTWF4aW1lIENvcXVlbGluLCBTZXJnZSBTZW1pbiwKPiAgIGxpbnV4LWFybS1rZXJu
ZWwKPgo+IE9uIFR1ZSwgSmFuIDIxLCAyMDI1IGF0IDA1OjM3OjAzUE0gKzA4MDAsIEh1YWNhaSBD
aGVuIHdyb3RlOgo+ID4gTm93IGZvciBkd21hYy1sb29uZ3NvbiB7dHgscnh9X2ZpZm9fc2l6ZSBh
cmUgdW5pbml0aWFsaXNlZCwgd2hpY2ggbWVhbnMKPiA+IHplcm8uIFRoaXMgbWVhbnMgZHdtYWMt
bG9vbmdzb24gZG9lc24ndCBzdXBwb3J0IGNoYW5naW5nIE1UVSwgc28gc2V0IHRoZQo+ID4gY29y
cmVjdCB0eF9maWZvX3NpemUgYW5kIHJ4X2ZpZm9fc2l6ZSBmb3IgaXQgKDE2S0IgbXVsdGlwbGll
ZCBieSBjaGFubmVsCj4gPiBjb3VudHMpLgo+ID4KPiA+IE5vdGU6IHRoZSBGaXhlcyB0YWcgaXMg
bm90IGV4YWN0bHkgcmlnaHQsIGJ1dCBpdCBpcyBhIGtleSBjb21taXQgb2YgdGhlCj4gPiBkd21h
Yy1sb29uZ3NvbiBzZXJpZXMuCj4gPgo+ID4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKPiA+
IEZpeGVzOiBhZDcyZjc4M2RlMDY4MjdhMWYgKCJuZXQ6IHN0bW1hYzogQWRkIG11bHRpLWNoYW5u
ZWwgc3VwcG9ydCIpCj4gPiBTaWduZWQtb2ZmLWJ5OiBDaG9uZyBRaWFvIDxxaWFvY2hvbmdAbG9v
bmdzb24uY24+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBIdWFjYWkgQ2hlbiA8Y2hlbmh1YWNhaUBsb29u
Z3Nvbi5jbj4KPgo+IFRoYW5rcywgdGhpcyBjaGFuZ2UgbG9va3MgZ29vZCB0byBtZS4KPiBBbmQg
SSBhZ3JlZSB0aGF0IE1UVSBzZXR0aW5nIGNhbm5vdCBzdWNjZWVkIHdpdGhvdXQgaXQuCj4KPiBS
ZXZpZXdlZC1ieTogU2ltb24gSG9ybWFuIDxob3Jtc0BrZXJuZWwub3JnPgo+Cj4gU29tZSBwcm9j
ZXNzIG5vdGVzIHJlZ2FyZGluZyBOZXR3b3JraW5nIHBhdGNoZXMgdG8ga2VlcAo+IGluIG1pbmQg
Zm9yIG5leHQgdGltZS4KPgo+IDEuIFBsZWFzZSBzZXQgdGhlIHRhcmdldCB0cmVlLiBJbiB0aGlz
IGNhc2UsIGFzIHRoaXMgaXMgYSBmaXgKPiAgICBmb3IgY29kZSBwcmVzZW50IGluIG5ldC4gSW4g
Z2VuZXJhbCwgb3RoZXJ3aXNlIGl0IHdvdWxkIGJlIG5ldC1uZXh0Lgo+Cj4gICAgU3ViamVjdDog
W1BBVENIIG5ldF0gLi4uCj4KPiAyLiBQbGVhc2UgZ2VuZXJhdGUgYSBDQyBsaXN0IHVzaW5nCj4K
PiAgICAuL3NjcmlwdHMvZ2V0X21haW50YWluZXIucGwgdGhpcy5wYXRjaAo+Cj4gICAgVGhlIGI0
IHRvb2wgY2FuIGhlbHAgd2l0aCB0aGlzLgo+Cj4gTGluazogaHR0cHM6Ly9kb2NzLmtlcm5lbC5v
cmcvcHJvY2Vzcy9tYWludGFpbmVyLW5ldGRldi5odG1sCk9LLCB0aGFua3MuCgpIdWFjYWkKPgo+
ID4gLS0tCj4gPiAgZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtbG9v
bmdzb24uYyB8IDMgKysrCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQo+ID4K
PiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21h
Yy1sb29uZ3Nvbi5jIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMt
bG9vbmdzb24uYwo+ID4gaW5kZXggYmZlNmUyZDYzMWJkLi43OWFjZGYzOGM1MjUgMTAwNjQ0Cj4g
PiAtLS0gYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1sb29uZ3Nv
bi5jCj4gPiArKysgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1s
b29uZ3Nvbi5jCj4gPiBAQCAtNTc0LDYgKzU3NCw5IEBAIHN0YXRpYyBpbnQgbG9vbmdzb25fZHdt
YWNfcHJvYmUoc3RydWN0IHBjaV9kZXYgKnBkZXYsIGNvbnN0IHN0cnVjdCBwY2lfZGV2aWNlX2lk
Cj4gPiAgICAgICBpZiAocmV0KQo+ID4gICAgICAgICAgICAgICBnb3RvIGVycl9kaXNhYmxlX2Rl
dmljZTsKPiA+Cj4gPiArICAgICBwbGF0LT50eF9maWZvX3NpemUgPSBTWl8xNksgKiBwbGF0LT50
eF9xdWV1ZXNfdG9fdXNlOwo+ID4gKyAgICAgcGxhdC0+cnhfZmlmb19zaXplID0gU1pfMTZLICog
cGxhdC0+cnhfcXVldWVzX3RvX3VzZTsKPiA+ICsKPiA+ICAgICAgIGlmIChkZXZfb2Zfbm9kZSgm
cGRldi0+ZGV2KSkKPiA+ICAgICAgICAgICAgICAgcmV0ID0gbG9vbmdzb25fZHdtYWNfZHRfY29u
ZmlnKHBkZXYsIHBsYXQsICZyZXMpOwo+ID4gICAgICAgZWxzZQo+ID4gLS0KPiA+IDIuNDcuMQo+
ID4KPiA+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXN0bTMyCg==
