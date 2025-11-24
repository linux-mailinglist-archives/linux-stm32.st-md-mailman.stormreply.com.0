Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD24C81E91
	for <lists+linux-stm32@lfdr.de>; Mon, 24 Nov 2025 18:34:19 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 937E0C32EB0;
	Mon, 24 Nov 2025 17:34:19 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 70ED4C36B3C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Nov 2025 17:34:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 61448601DF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Nov 2025 17:34:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDFFDC19425
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Nov 2025 17:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764005656;
 bh=QrwrudDXcmBwv5MpjExmSZyNDnG2x6mJE3eaNfxGUrk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=cSMluTDn9fYYcsY96+RxCVmBU1UT6UeyACkllJmWSzU7gZrvo4gGKXo7uyft1pw/J
 X0UATKXVk+76/kBFRGVF3WN6uZgdNS3IO4AInkWQW27lHULnedM31JIF4SYAhBxdt1
 htoENAzwePRLjk5wCvlNeLCA2EhSsiJdEzldD7GbpiOoH+JZ0hIPxhLZNrJGTVLqyY
 2rgtF3juLEX+iTIqseecGdaakgW0CW4dYuyzvYUgbL2kageR3wIVXZrIeJIMhRFjpw
 s8V/JiAZGEYvkqjz/CuBiFxqZYv8hiBAk1mJsvk15Xna/VKLCOvT4hJYMMNMBq/vD8
 cuwKoO9s+/KJg==
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-b7277324054so681943266b.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Nov 2025 09:34:15 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXLJpal+D38/vAzVNzAbvtLiJnei7Dn68vOvGnix6u9Ah/eLnJVdWRZISfcVXXw0uvWScje0XxD0u/wbQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyQCPrpbzk93/N5nC4tZLhvwzLL7NQYsxkuxWHaKwH6KrTcbJMb
 O9EfSmi7h7KIo+6zviSVq/otTVUb7SIKbQ+xr42wnTAomfVThlCaG2U3x3I6p4N5/A4UFEzq8l4
 fFJVAvPfve2/aif8UOAwsUzyZ8P3PKw==
X-Google-Smtp-Source: AGHT+IH4zThrBiVwTM/gMTFGPCf7Ko+9nQcpXA9JRi2zbFqO9WDmcAZTQclKPHj9NMzyHEHvrVsg+wN6QcpewpApah8=
X-Received: by 2002:a17:907:1b0f:b0:b6d:573d:bbc5 with SMTP id
 a640c23a62f3a-b767170cca7mr1240223266b.37.1764005654444; Mon, 24 Nov 2025
 09:34:14 -0800 (PST)
MIME-Version: 1.0
References: <20251031175926.1465360-1-robh@kernel.org> <aRN0fdOAV0B728qo@p14s>
 <20251111195923.GA3629535-robh@kernel.org>
 <CANLsYkwcbrTaKASdr5fj0m9ARS4xUgzVH8iWQKwTCvEsoZDDsQ@mail.gmail.com>
 <CAL_JsqL7HcDkPgJjcqJSagdN=gH2rv6noVS57QMGNRp0YCxUBw@mail.gmail.com>
 <aRX6DJoaP4MXG3fN@p14s>
In-Reply-To: <aRX6DJoaP4MXG3fN@p14s>
From: Rob Herring <robh@kernel.org>
Date: Mon, 24 Nov 2025 11:34:02 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJGtQTVdaJ99DKiqbo3GfxmU7V6QjroTxHi7gR53Dfe-Q@mail.gmail.com>
X-Gm-Features: AWmQ_bmPMfxmmKwhG7Mzx1bAQRdZoKMheTTGVeWZ-CEQx6BfmTyQnFsumwKZ_Xg
Message-ID: <CAL_JsqJGtQTVdaJ99DKiqbo3GfxmU7V6QjroTxHi7gR53Dfe-Q@mail.gmail.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: imx@lists.linux.dev, Peng Fan <peng.fan@nxp.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-remoteproc@vger.kernel.org,
 Shawn Guo <shawnguo@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
 Fabio Estevam <festevam@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v6] remoteproc: Use
	of_reserved_mem_region_* functions for "memory-region"
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

T24gVGh1LCBOb3YgMTMsIDIwMjUgYXQgOTozMuKAr0FNIE1hdGhpZXUgUG9pcmllcgo8bWF0aGll
dS5wb2lyaWVyQGxpbmFyby5vcmc+IHdyb3RlOgo+Cj4gT24gV2VkLCBOb3YgMTIsIDIwMjUgYXQg
MTA6NTk6NDJBTSAtMDYwMCwgUm9iIEhlcnJpbmcgd3JvdGU6Cj4gPiBPbiBXZWQsIE5vdiAxMiwg
MjAyNSBhdCA5OjQz4oCvQU0gTWF0aGlldSBQb2lyaWVyCj4gPiA8bWF0aGlldS5wb2lyaWVyQGxp
bmFyby5vcmc+IHdyb3RlOgo+ID4gPgo+ID4gPiBPbiBUdWUsIDExIE5vdiAyMDI1IGF0IDEyOjU5
LCBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPiB3cm90ZToKPiA+ID4gPgo+ID4gPiA+IE9u
IFR1ZSwgTm92IDExLCAyMDI1IGF0IDEwOjM4OjA1QU0gLTA3MDAsIE1hdGhpZXUgUG9pcmllciB3
cm90ZToKPiA+ID4gPiA+IEhpIFJvYiwKPiA+ID4gPiA+Cj4gPiA+ID4gPiBQbGVhc2Ugc2VlIG1h
eSBjb21tZW50IGZvciBzdF9yZW1vdGVwcm9jLmMKPiA+ID4gPiA+Cj4gPiA+ID4gPiBPbiBGcmks
IE9jdCAzMSwgMjAyNSBhdCAxMjo1OToyMlBNIC0wNTAwLCBSb2IgSGVycmluZyAoQXJtKSB3cm90
ZToKPiA+ID4gPiA+ID4gVXNlIHRoZSBuZXdseSBhZGRlZCBvZl9yZXNlcnZlZF9tZW1fcmVnaW9u
X3RvX3Jlc291cmNlKCkgYW5kCj4gPiA+ID4gPiA+IG9mX3Jlc2VydmVkX21lbV9yZWdpb25fY291
bnQoKSBmdW5jdGlvbnMgdG8gaGFuZGxlICJtZW1vcnktcmVnaW9uIgo+ID4gPiA+ID4gPiBwcm9w
ZXJ0aWVzLgo+ID4KPiA+IFsuLi5dCj4gPgo+ID4gPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9yZW1vdGVwcm9jL3N0X3JlbW90ZXByb2MuYyBiL2RyaXZlcnMvcmVtb3RlcHJvYy9zdF9yZW1v
dGVwcm9jLmMKPiA+ID4gPiA+ID4gaW5kZXggZTY1NjZhOTgzOWRjLi4wNDMzNDgzNjY5MjYgMTAw
NjQ0Cj4gPiA+ID4gPiA+IC0tLSBhL2RyaXZlcnMvcmVtb3RlcHJvYy9zdF9yZW1vdGVwcm9jLmMK
PiA+ID4gPiA+ID4gKysrIGIvZHJpdmVycy9yZW1vdGVwcm9jL3N0X3JlbW90ZXByb2MuYwo+ID4g
PiA+ID4gPiBAQCAtMTIwLDQwICsxMjAsMzcgQEAgc3RhdGljIGludCBzdF9ycHJvY19wYXJzZV9m
dyhzdHJ1Y3QgcnByb2MgKnJwcm9jLCBjb25zdCBzdHJ1Y3QgZmlybXdhcmUgKmZ3KQo+ID4gPiA+
ID4gPiAgICAgc3RydWN0IGRldmljZSAqZGV2ID0gcnByb2MtPmRldi5wYXJlbnQ7Cj4gPiA+ID4g
PiA+ICAgICBzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wID0gZGV2LT5vZl9ub2RlOwo+ID4gPiA+ID4g
PiAgICAgc3RydWN0IHJwcm9jX21lbV9lbnRyeSAqbWVtOwo+ID4gPiA+ID4gPiAtICAgc3RydWN0
IHJlc2VydmVkX21lbSAqcm1lbTsKPiA+ID4gPiA+ID4gLSAgIHN0cnVjdCBvZl9waGFuZGxlX2l0
ZXJhdG9yIGl0Owo+ID4gPiA+ID4gPiAtICAgaW50IGluZGV4ID0gMDsKPiA+ID4gPiA+ID4gLQo+
ID4gPiA+ID4gPiAtICAgb2ZfcGhhbmRsZV9pdGVyYXRvcl9pbml0KCZpdCwgbnAsICJtZW1vcnkt
cmVnaW9uIiwgTlVMTCwgMCk7Cj4gPiA+ID4gPiA+IC0gICB3aGlsZSAob2ZfcGhhbmRsZV9pdGVy
YXRvcl9uZXh0KCZpdCkgPT0gMCkgewo+ID4gPiA+ID4gPiAtICAgICAgICAgICBybWVtID0gb2Zf
cmVzZXJ2ZWRfbWVtX2xvb2t1cChpdC5ub2RlKTsKPiA+ID4gPiA+ID4gLSAgICAgICAgICAgaWYg
KCFybWVtKSB7Cj4gPiA+ID4gPiA+IC0gICAgICAgICAgICAgICAgICAgb2Zfbm9kZV9wdXQoaXQu
bm9kZSk7Cj4gPiA+ID4gPiA+IC0gICAgICAgICAgICAgICAgICAgZGV2X2VycihkZXYsICJ1bmFi
bGUgdG8gYWNxdWlyZSBtZW1vcnktcmVnaW9uXG4iKTsKPiA+ID4gPiA+ID4gLSAgICAgICAgICAg
ICAgICAgICByZXR1cm4gLUVJTlZBTDsKPiA+ID4gPiA+ID4gLSAgICAgICAgICAgfQo+ID4gPiA+
ID4gPiArICAgaW50IGluZGV4ID0gMCwgbXIgPSAwOwo+ID4gPiA+ID4gPiArCj4gPiA+ID4gPiA+
ICsgICB3aGlsZSAoMSkgewo+ID4gPiA+ID4gPiArICAgICAgICAgICBzdHJ1Y3QgcmVzb3VyY2Ug
cmVzOwo+ID4gPiA+ID4gPiArICAgICAgICAgICBpbnQgcmV0Owo+ID4gPiA+ID4gPiArCj4gPiA+
ID4gPiA+ICsgICAgICAgICAgIHJldCA9IG9mX3Jlc2VydmVkX21lbV9yZWdpb25fdG9fcmVzb3Vy
Y2UobnAsIG1yKyssICZyZXMpOwo+ID4gPiA+ID4gPiArICAgICAgICAgICBpZiAocmV0KQo+ID4g
PiA+ID4gPiArICAgICAgICAgICAgICAgICAgIHJldHVybiAwOwo+ID4gPiA+ID4KPiA+ID4gPiA+
IFRoZSBvcmlnaW5hbCBjb2RlIGNhbGxzIHJwcm9jX2VsZl9sb2FkX3JzY190YWJsZSgpIFsxXSBh
ZnRlciBpdGVyYXRpbmcgdGhyb3VnaAo+ID4gPiA+ID4gdGhlIG1lbW9yeSByZWdpb24sIHNvbWV0
aGluZyB0aGF0IHdvbid0IGhhcHBlbiB3aXRoIHRoZSBhYm92ZS4KPiA+ID4gPgo+ID4gPiA+IElu
ZGVlZC4gaXQgbmVlZHMgdGhlIGZvbGxvd2luZyBpbmNyZW1lbnRhbCBjaGFuZ2UuIEl0IGlzIHNs
aWdodGx5Cj4gPiA+ID4gZGlmZmVyZW50IGluIHRoYXQgcnByb2NfZWxmX2xvYWRfcnNjX3RhYmxl
KCkgaXMgbm90IGNhbGxlZCBpZgo+ID4gPiA+ICdtZW1vcnktcmVnaW9uJyBpcyBtaXNzaW5nLCBi
dXQgdGhlIGJpbmRpbmcgc2F5cyB0aGF0J3MgcmVxdWlyZWQuCj4gPiA+ID4KPiA+ID4gPiA4PC0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gPiA+ID4K
PiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9yZW1vdGVwcm9jL3N0X3JlbW90ZXByb2MuYyBi
L2RyaXZlcnMvcmVtb3RlcHJvYy9zdF9yZW1vdGVwcm9jLmMKPiA+ID4gPiBpbmRleCAwNDMzNDgz
NjY5MjYuLmNiMDljMjQ0ZmRiNSAxMDA2NDQKPiA+ID4gPiAtLS0gYS9kcml2ZXJzL3JlbW90ZXBy
b2Mvc3RfcmVtb3RlcHJvYy5jCj4gPiA+ID4gKysrIGIvZHJpdmVycy9yZW1vdGVwcm9jL3N0X3Jl
bW90ZXByb2MuYwo+ID4gPiA+IEBAIC0xMjAsMTUgKzEyMCwxOSBAQCBzdGF0aWMgaW50IHN0X3Jw
cm9jX3BhcnNlX2Z3KHN0cnVjdCBycHJvYyAqcnByb2MsIGNvbnN0IHN0cnVjdCBmaXJtd2FyZSAq
ZncpCj4gPiA+ID4gICAgICAgICBzdHJ1Y3QgZGV2aWNlICpkZXYgPSBycHJvYy0+ZGV2LnBhcmVu
dDsKPiA+ID4gPiAgICAgICAgIHN0cnVjdCBkZXZpY2Vfbm9kZSAqbnAgPSBkZXYtPm9mX25vZGU7
Cj4gPiA+ID4gICAgICAgICBzdHJ1Y3QgcnByb2NfbWVtX2VudHJ5ICptZW07Cj4gPiA+ID4gLSAg
ICAgICBpbnQgaW5kZXggPSAwLCBtciA9IDA7Cj4gPiA+ID4gKyAgICAgICBpbnQgaW5kZXggPSAw
Owo+ID4gPiA+Cj4gPiA+ID4gICAgICAgICB3aGlsZSAoMSkgewo+ID4gPiA+ICAgICAgICAgICAg
ICAgICBzdHJ1Y3QgcmVzb3VyY2UgcmVzOwo+ID4gPiA+ICAgICAgICAgICAgICAgICBpbnQgcmV0
Owo+ID4gPiA+Cj4gPiA+ID4gLSAgICAgICAgICAgICAgIHJldCA9IG9mX3Jlc2VydmVkX21lbV9y
ZWdpb25fdG9fcmVzb3VyY2UobnAsIG1yKyssICZyZXMpOwo+ID4gPiA+IC0gICAgICAgICAgICAg
ICBpZiAocmV0KQo+ID4gPiA+IC0gICAgICAgICAgICAgICAgICAgICAgIHJldHVybiAwOwo+ID4g
PiA+ICsgICAgICAgICAgICAgICByZXQgPSBvZl9yZXNlcnZlZF9tZW1fcmVnaW9uX3RvX3Jlc291
cmNlKG5wLCBpbmRleCwgJnJlcyk7Cj4gPiA+ID4gKyAgICAgICAgICAgICAgIGlmIChyZXQpIHsK
PiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICBpZiAoaW5kZXgpCj4gPiA+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBicmVhazsKPiA+ID4gPiArICAgICAgICAgICAgICAg
ICAgICAgICBlbHNlCj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZXR1
cm4gcmV0Owo+ID4gPiA+ICsgICAgICAgICAgICAgICB9Cj4gPiA+Cj4gPiA+IFRoaXMgbG9va3Mg
YnJpdHRsZSBhbmQgSSdtIG5vdCBzdXJlIGl0IHdvdWxkIHdvcmsuCj4gPiA+Cj4gPiA+IEdvaW5n
IGJhY2sgdG8gdGhlIG9yaWdpbmFsIGltcGxlbWVudGF0aW9uLCB0aGUgb25seSB0aW1lIHdlIHdh
bnQgdG8KPiA+ID4gImJyZWFrIiBpcyB3aGVuIEBpbmRleCBpcyBlcXVhbCB0byB0aGUgYW1vdW50
IG9mIG1lbW9yeSByZWdpb25zIF9hbmRfCj4gPiA+IHJldCBpcyAtRUlOVkFMLiAgQW55IG90aGVy
IGNvbmRpdGlvbiBzaG91bGQgcmV0dXJuLgo+ID4KPiA+IEBpbmRleCBlcXVhbCB0byBudW1iZXIg
b2YgZW50cmllcyByZXR1cm5zIC1FTk9ERVYsIHNvIHRoYXQgY29uZGl0aW9uCj4gPiBpcyBpbXBv
c3NpYmxlLiBXZSBjYW4gc2ltcGx5IGl0IHRvIHRoaXM6Cj4gPgo+ID4gaWYgKHJldCA9PSAtRU5P
REVWICYmIGluZGV4KQo+ID4gICAgIGJyZWFrOwo+ID4gZWxzZQo+ID4gICAgIHJldHVybiByZXQ7
Cj4KPiBUbyBtZSB0aGlzIG5lZWRzIHRvIGJlOgo+Cj4gZW50cmllcyA9IG9mX3Jlc2VydmVkX21l
bV9yZWdpb25fY291bnQobnApOwoKSWRlYWxseSwgd2UgdHJ5IHRvIGF2b2lkIHBhcnNpbmcgdGhl
IHNhbWUgcHJvcGVydHkgdHdpY2UuIFRoZSBwbGFjZXMKd2UgY291bnQgYW5kIHRoZW4gcmVhZCB0
aGUgcHJvcGVydHkgYWdhaW4gYXJlIHdoZW4gd2UgbmVlZCB0byBhbGxvY2F0ZQphbiBhcnJheSBv
ZiB0aGUgcmlnaHQgc2l6ZSBpbiBiZXR3ZWVuLiBCdXQgaWYgdGhhdCBwdXRzIHRoaXMgcGF0Y2gg
dG8KYmVkIGZpbmFsbHksIHRoZW4gZmluZS4KCj4KPiAuLi4KPiAuLi4KPgo+IGlmIChyZXQgPT0g
LUVOT0RFViAmJiBpbmRleCA9PSBlbnRyaWVzKQo+ICAgICAgICAgYnJlYWs7Cj4gZWxzZQo+ICAg
ICAgICAgcmV0dXJuIHJldDsKPgo+IEJ1dCB0YWtpbmcgYSBzdGVwIGJhY2ssIGl0IG1pZ2h0IGV2
ZW4gYmUgZWFzaWVyIHRvIGdvIGZyb20gYSB3aGlsZSgpIHRvIGEgZm9yKCksCj4gdGhlIHNhbWUg
d2F5IHlvdSBkaWQgaW4gaW14X3Jwcm9jX2FkZHJfaW5pdCgpLgo+Cj4gPgo+ID4gSWYgeW91IHdh
bnQgdG8ga2VlcCB0aGUgcHJpb3IgYmVoYXZpb3Igd2hlbiAnbWVtb3J5LXJlZ2lvbicgaXMKPiA+
IG1pc3NpbmcsIHRoZW4gJyYmIGluZGV4JyBjYW4gYmUgcmVtb3ZlZCwgYnV0IEkgdGhpbmsgdGhh
dCB3YXMgd3JvbmcKPiA+IGJlaGF2aW9yLgo+ID4KPiA+IFJvYgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGlu
dXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
