Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C8B77B0C132
	for <lists+linux-stm32@lfdr.de>; Mon, 21 Jul 2025 12:22:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 73893C32E8F;
	Mon, 21 Jul 2025 10:22:44 +0000 (UTC)
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com
 [209.85.166.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 25481C32E8E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Jul 2025 10:22:43 +0000 (UTC)
Received: by mail-il1-f171.google.com with SMTP id
 e9e14a558f8ab-3e290cbe6d0so14865945ab.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Jul 2025 03:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753093362; x=1753698162;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VHEm6bHDLYflRAkB3nDyc8N9yM14dw/BsI6dT8qL9b8=;
 b=haf0sqTTG4URZNN0j14uAMKy2mM0Ffcn1LFwjCjJVciLA3LLZVup2DEfSuMN1lZxmw
 fbuLUtaXETm6lFElKPuLJM6+fgkGZlNe+q41Mjp/yVQTxd7gMlNOxjUOK/lnF/U1VK/J
 c3dbwB6fdBEWsW9U/OSZB2TffI0j/VNeDA2bveUcLw1fMDvaLFDvisXxPXQBemrisGma
 NizccxigSv9bcc3i1m7kKXkwDPd9nCe9cJJhxMmp64gFCn/vKTJdJiYcAullEz3hgeBt
 jvqmFLrPvNjr/Uo9Kl/fqe31hq6CkSlTG5MOvPB+J2y7dPCjkYw5NXsiCD1xbhw3aRf8
 t/Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753093362; x=1753698162;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VHEm6bHDLYflRAkB3nDyc8N9yM14dw/BsI6dT8qL9b8=;
 b=uCugGeYeItdKdWPNouHttONzaDnBC96YaD96qIm7Cghg2408M/d4m76tO0C/r1j89G
 KYFxsY+naP1pkUUWnycKcfFo2OU/+emySg4U4Pku/sVxaiH8kjksxl8LCSwHE+1Dt3Pn
 kl4qMe13XTtL9vq/SfrI5Ub+FnbMabLeRaCy3LTEytc/DiWC0QjMDgA9eraQstKClks5
 nZgs8RMbAakLWHZQW+iCsL7IIFBHGPN6INacuM1ql5VHgmOTCZPp1IS1RhFgaPVwTmmd
 o/CvQRqSfLrxKYWCTBQ2L0bdluBZyl5mkmQX8xE9Ih226tYYsf3GzDeB8WnPfJhWKSr9
 CrkQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW1E8WwpQtwGLx8hxCMwOg9eSRcC+nAWDVZuW09BO4Fi27qeaYHvyu9ojHPmAnVBIVNay9byB8hUZ6HcQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyJgvf+Jr+L3+SjMjqck76y8+YvorLFX5vFvstmIZ5t/SCaxTzN
 Y1O9Zto5XT3g5ljJKCUUhLOR9jW1gUbPnhgDI2HXzx2CEZn+QhK1gRjt0oiR8yhJpPwMaWbPE+o
 RfW7u7S7AxmS7zXCfjDODIaJjeblHkYs=
X-Gm-Gg: ASbGnctyjLE+tilOAU7SWqy+ekz2tRimVwZjXmOJP00UxsS8HmR/NxNRB/mRsFv5RRC
 qxuccSSgGtaNW6fg6VvnmtYj/5nXaMKtrW7vRTIW905PfiMNePX2k1fpaad2idAFwi683IwYqZD
 TvvAbkPsXGiPzuvmgW5UVS2Mm2eBVd7dfSSV/ZoFHEQASYZc0rwOapkhscquPCJ+H5NgXgQ2PYU
 zpnHhk/IJMiI9P78w==
X-Google-Smtp-Source: AGHT+IFXBPH0yx8S02iqQkJZIi4L0Jm+RaJLQnvPek++YwE2QGcqsWI+nl8r2YrcQAJo6zGNTHvEyQhndIVsVoiBNsI=
X-Received: by 2002:a05:6e02:1806:b0:3e2:9e93:b673 with SMTP id
 e9e14a558f8ab-3e29e93b68cmr100435465ab.1.1753093361694; Mon, 21 Jul 2025
 03:22:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250721083343.16482-1-kerneljasonxing@gmail.com>
 <20250721083343.16482-3-kerneljasonxing@gmail.com>
 <20250721101217.GC2459@horms.kernel.org>
In-Reply-To: <20250721101217.GC2459@horms.kernel.org>
From: Jason Xing <kerneljasonxing@gmail.com>
Date: Mon, 21 Jul 2025 18:22:05 +0800
X-Gm-Features: Ac12FXxglQj0R4EkMw3SzP0qFiFwMjjIS-PnIkKo_EqhulukoCpP4A9yL3kNbVo
Message-ID: <CAL+tcoAEtRVvX5YkK980OtfaKHAf2+dw+WFR-HwPO2GO0nemyA@mail.gmail.com>
To: Simon Horman <horms@kernel.org>
Cc: edumazet@google.com, anthony.l.nguyen@intel.com,
 linux-stm32@st-md-mailman.stormreply.com, daniel@iogearbox.net,
 przemyslaw.kitszel@intel.com, john.fastabend@gmail.com, sdf@fomichev.me,
 intel-wired-lan@lists.osuosl.org, kuba@kernel.org, pabeni@redhat.com,
 Jason Xing <kernelxing@tencent.com>, maciej.fijalkowski@intel.com,
 hawk@kernel.org, ast@kernel.org, magnus.karlsson@intel.com,
 netdev@vger.kernel.org, andrew+netdev@lunn.ch, bjorn@kernel.org,
 mcoquelin.stm32@gmail.com, jonathan.lemon@gmail.com, bpf@vger.kernel.org,
 davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH net-next 2/2] igb: xsk: solve underflow of
 nb_pkts in zerocopy mode
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

SGkgU2ltb24sCgpPbiBNb24sIEp1bCAyMSwgMjAyNSBhdCA2OjEy4oCvUE0gU2ltb24gSG9ybWFu
IDxob3Jtc0BrZXJuZWwub3JnPiB3cm90ZToKPgo+IE9uIE1vbiwgSnVsIDIxLCAyMDI1IGF0IDA0
OjMzOjQzUE0gKzA4MDAsIEphc29uIFhpbmcgd3JvdGU6Cj4gPiBGcm9tOiBKYXNvbiBYaW5nIDxr
ZXJuZWx4aW5nQHRlbmNlbnQuY29tPgo+ID4KPiA+IFRoZXJlIGlzIG5vIGJyZWFrIHRpbWUgaW4g
dGhlIHdoaWxlKCkgbG9vcCwgc28gZXZlcnkgdGltZSBhdCB0aGUgZW5kIG9mCj4gPiBpZ2JfeG1p
dF96YygpLCB1bmRlcmZsb3cgb2YgbmJfcGt0cyB3aWxsIG9jY3VyLCB3aGljaCByZW5kZXJzIHRo
ZSByZXR1cm4KPiA+IHZhbHVlIGFsd2F5cyBmYWxzZS4gQnV0IHRoZW9yZXRpY2FsbHksIHRoZSBy
ZXN1bHQgc2hvdWxkIGJlIHNldCBhZnRlcgo+ID4gY2FsbGluZyB4c2tfdHhfcGVla19yZWxlYXNl
X2Rlc2NfYmF0Y2goKS4gV2UgY2FuIHRha2UgaTQwZV94bWl0X3pjKCkgYXMKPiA+IGEgZ29vZCBl
eGFtcGxlLgo+ID4KPiA+IFJldHVybmluZyBmYWxzZSBtZWFucyB3ZSdyZSBub3QgZG9uZSB3aXRo
IHRyYW5zbWlzc2lvbiBhbmQgd2UgbmVlZCBvbmUKPiA+IG1vcmUgcG9sbCwgd2hpY2ggaXMgZXhh
Y3RseSB3aGF0IGlnYl94bWl0X3pjKCkgYWx3YXlzIGRpZCBiZWZvcmUgdGhpcwo+ID4gcGF0Y2gu
IEFmdGVyIHRoaXMgcGF0Y2gsIHRoZSByZXR1cm4gdmFsdWUgZGVwZW5kcyBvbiB0aGUgbmJfcGt0
cyB2YWx1ZS4KPiA+IFR3byBjYXNlcyBtaWdodCBoYXBwZW4gdGhlbjoKPiA+IDEuIGlmIChuYl9w
a3RzIDwgYnVkZ2V0KSwgaXQgbWVhbnMgd2UgcHJvY2VzcyBhbGwgdGhlIHBvc3NpYmxlIGRhdGEs
IHNvCj4gPiAgICByZXR1cm4gdHJ1ZSBhbmQgbm8gbW9yZSBuZWNlc3NhcnkgcG9sbCB3aWxsIGJl
IHRyaWdnZXJlZCBiZWNhdXNlIG9mCj4gPiAgICB0aGlzLgo+ID4gMi4gaWYgKG5iX3BrdHMgPT0g
YnVkZ2V0KSwgaXQgbWVhbnMgd2UgbWlnaHQgaGF2ZSBtb3JlIGRhdGEsIHNvIHJldHVybgo+ID4g
ICAgZmFsc2UgdG8gbGV0IGFub3RoZXIgcG9sbCBydW4gYWdhaW4uCj4gPgo+ID4gRml4ZXM6IGY4
ZTI4NGEwMmFmYyAoImlnYjogQWRkIEFGX1hEUCB6ZXJvLWNvcHkgVHggc3VwcG9ydCIpCj4gPiBT
aWduZWQtb2ZmLWJ5OiBKYXNvbiBYaW5nIDxrZXJuZWx4aW5nQHRlbmNlbnQuY29tPgo+ID4gLS0t
Cj4gPiAgZHJpdmVycy9uZXQvZXRoZXJuZXQvaW50ZWwvaWdiL2lnYl94c2suYyB8IDIgKy0KPiA+
ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiA+Cj4gPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvaW50ZWwvaWdiL2lnYl94c2suYyBiL2Ry
aXZlcnMvbmV0L2V0aGVybmV0L2ludGVsL2lnYi9pZ2JfeHNrLmMKPiA+IGluZGV4IDVjZjY3YmEy
OTI2OS4uMjQzZjQyNDZmZWU4IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9uZXQvZXRoZXJuZXQv
aW50ZWwvaWdiL2lnYl94c2suYwo+ID4gKysrIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvaW50ZWwv
aWdiL2lnYl94c2suYwo+ID4gQEAgLTQ4Miw3ICs0ODIsNyBAQCBib29sIGlnYl94bWl0X3pjKHN0
cnVjdCBpZ2JfcmluZyAqdHhfcmluZywgc3RydWN0IHhza19idWZmX3Bvb2wgKnhza19wb29sKQo+
ID4gICAgICAgaWYgKCFuYl9wa3RzKQo+ID4gICAgICAgICAgICAgICByZXR1cm4gdHJ1ZTsKPiA+
Cj4gPiAtICAgICB3aGlsZSAobmJfcGt0cy0tID4gMCkgewo+ID4gKyAgICAgd2hpbGUgKGkgPCBu
Yl9wa3RzKSB7Cj4KPiBIaSBKYXNvbiwKPgo+IEZXSUlXLCBJIHRoaW5rIHVzaW5nIGEgZm9yIGxv
b3AgaXMgYSBtb3JlIGlkaW9tYXRpYyB3YXkKPiBvZiBoYW5kbGluZyB0aGUgcmVsYXRpb25zaGlw
IGJldHdlZW4gaSwgbmJfcGt0cywgYW5kCj4gdGhlIGl0ZXJhdGlvbnMgb2YgdGhpcyBsb29wLgoK
U3VyZSwgSSBjYW4gdHVybiBpdCBpbnRvICdmb3IgKGkgPSAwOyBpIDwgbmJfcGt0czsgaSsrKScg
aW4gdGhlIG5leHQgdmVyc2lvbi4KClRoYW5rcywKSmFzb24KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4
LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
