Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AC96AAC68A6
	for <lists+linux-stm32@lfdr.de>; Wed, 28 May 2025 13:57:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4E7ABC36B35;
	Wed, 28 May 2025 11:57:52 +0000 (UTC)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com
 [209.85.222.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5AB27C36B31
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 May 2025 11:57:51 +0000 (UTC)
Received: by mail-ua1-f48.google.com with SMTP id
 a1e0cc1a2514c-86d6fd581f4so471930241.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 May 2025 04:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748433470; x=1749038270;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DM2QbUzIiVq1oAO1zYgkeLSN01UQu1uYF+2linnaY0w=;
 b=YJZyRvRMBqDP8wUyBWOpXbPNpUhufHXkpKFyhGjvlsHoY/9eOmXDFIX01wDJjYKskx
 2PpSgI3y9orHQTL+lY06etXWRDGno8mDcaALFLB+IsKUj/OK6CglgP6MztrNLWfYnF5Q
 Ybh2hPzzesMyTgTCojSCDs+3RB5spNWhP8w4EKKADZdYe9AEDSSfRvpdaULIHKZa4dHa
 lmEPXGHb7gMFu2XC1b5Nnlr7uATvVx5V2nRfroQEJUtZbewuw8VckhqmVVj72ql33mdo
 p76I8GfjFt6RdKB9DgUGWwaJSto5N5uXYa9T0EqWDMc/TeRkTs527kV1G2IeAFOqbPn3
 j1lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748433470; x=1749038270;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DM2QbUzIiVq1oAO1zYgkeLSN01UQu1uYF+2linnaY0w=;
 b=wNUwJ/t/2yi7pqe0/VBQlUS0oLPc1dmou/CsKgjnlH9OOJWXRq8uDGrSdlO4y4Of3v
 buC8DNCyRcFpcWvGdZv0bkoWFlGNHZRuyRc50C0x9DTzgfgJZRwnVurjBvWNqvHar73n
 zyLIyk8kaOc94kFKprsWyN2K01W1q6DPEApjwTjT0n2kpY8kQmi+MkKrv1coyZA3yO9F
 bMU+E+cOR0ILxHO37eSHl10LOsjdBt2qPDazqJYbykLZez91lLc1zvcIEpmpVE2plppu
 tgnHlYjiF9OTIMD5zBbnNJ/x9aXsO6N+lzSTTfDJvTTeMDiwrAM8zUeItQxP3N8zya1q
 wrng==
X-Forwarded-Encrypted: i=1;
 AJvYcCXf+xwNgdVSiHJxvX2BmRL58nJvoUU6dwVqU4rcwUZgNvpPKaU6uvyG7tkvRGSFgTfdqeDEn6esipLFhg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwVThecycPwGMdDOMxwcgVV1fDJp4gd4wJM5/hu3VRPHT5akG0B
 53fASj1dfc7r+dJOnZ1wlUvByo+/nfnXAjZYnKIV2eXdfRHG9iqcGaOsQCEkvQZjDZ/ymO9pGQw
 ReCekuuyD+/Ww366U2aN336hGqvnSt8c=
X-Gm-Gg: ASbGncvWE/GxkxjQuj9IiZJzQrrfHRE/FaVRuEqjr0281SDyc5hPOhS9wpqoTpEo7mw
 xZZgMjKmFyPHZy5svpX56/ZqVnFUnQzi/OLV9Ox0EBr8wytdtD2BtJgLVwGmArR4ynFP0PMjvkU
 ACOekzf1bbPftRpwnQsQvJg7mD8EdTvyuNRw==
X-Google-Smtp-Source: AGHT+IHccZ6u3wYBlr61chnbgjUWRM+9FVRKkSPAvmULH6YUlgEgMZxUk6AOBWwMA6JVLhM/7o4896YpQLK4HFLW4VU=
X-Received: by 2002:a67:e70d:0:b0:4e4:1d6d:56cc with SMTP id
 ada2fe7eead31-4e597dee6afmr4608606137.12.1748433470075; Wed, 28 May 2025
 04:57:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250527175558.2738342-1-james.hilliard1@gmail.com>
 <631ed4fe-f28a-443b-922b-7f41c20f31f3@lunn.ch>
 <CADvTj4rGdb_kHV_gjKTJNkzYEPMzqLcHY_1xw7wy5r-ryqDfNQ@mail.gmail.com>
 <fe8fb314-de99-45c2-b71e-5cedffe590b0@lunn.ch>
 <CADvTj4qRmjUQJnhamkWNpHGNAtvFyOJnbaQ5RZ6NYYqSNhxshA@mail.gmail.com>
 <014d8d63-bfb1-4911-9ea6-6f4cdabc46e5@lunn.ch>
 <CADvTj4oVj-38ohw7Na9rkXLTGEEFkLv=4S40GPvHM5eZnN7KyA@mail.gmail.com>
 <aDbA5l5iXNntTN6n@shell.armlinux.org.uk>
In-Reply-To: <aDbA5l5iXNntTN6n@shell.armlinux.org.uk>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 28 May 2025 05:57:38 -0600
X-Gm-Features: AX0GCFvRg1G8o6RHpRasEA3gbglv1Max4m9hoMAbkTOqRd30AqyfzVMQn3V1-wU
Message-ID: <CADvTj4qP_enKCG-xpNG44ddMOJj42c+yiuMjV_N9LPJPMJqyOg@mail.gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Furong Xu <0x1207@gmail.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
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

T24gV2VkLCBNYXkgMjgsIDIwMjUgYXQgMTo1M+KAr0FNIFJ1c3NlbGwgS2luZyAoT3JhY2xlKQo8
bGludXhAYXJtbGludXgub3JnLnVrPiB3cm90ZToKPgo+IE9uIFR1ZSwgTWF5IDI3LCAyMDI1IGF0
IDAyOjM3OjAzUE0gLTA2MDAsIEphbWVzIEhpbGxpYXJkIHdyb3RlOgo+ID4gT24gVHVlLCBNYXkg
MjcsIDIwMjUgYXQgMjozMOKAr1BNIEFuZHJldyBMdW5uIDxhbmRyZXdAbHVubi5jaD4gd3JvdGU6
Cj4gPiA+Cj4gPiA+ID4gU3VyZSwgdGhhdCBtYXkgbWFrZSBzZW5zZSB0byBkbyBhcyB3ZWxsLCBi
dXQgSSBzdGlsbCBkb24ndCBzZWUKPiA+ID4gPiBob3cgdGhhdCBpbXBhY3RzIHRoZSBuZWVkIHRv
IHJ1bnRpbWUgc2VsZWN0IHRoZSBQSFkgd2hpY2gKPiA+ID4gPiBpcyBjb25maWd1cmVkIGZvciB0
aGUgY29ycmVjdCBNRkQuCj4gPiA+Cj4gPiA+IElmIHlvdSBrbm93IHdoYXQgdmFyaWFudCB5b3Ug
aGF2ZSwgeW91IG9ubHkgaW5jbHVkZSB0aGUgb25lIFBIWSB5b3UKPiA+ID4gYWN0dWFsbHkgaGF2
ZSwgYW5kIHBoeS1oYW5kbGUgcG9pbnRzIHRvIGl0LCBqdXN0IGFzIG5vcm1hbC4gTm8gcnVudGlt
ZQo+ID4gPiBzZWxlY3Rpb24uCj4gPgo+ID4gT2gsIHNvIGhlcmUncyB0aGUgaXNzdWUsIHdlIGhh
dmUgYm90aCBQSFkgdmFyaWFudHMsIG9sZGVyIGhhcmR3YXJlCj4gPiBnZW5lcmFsbHkgaGFzIEFD
MjAwIFBIWSdzIHdoaWxlIG5ld2VyIHNoaXBzIEFDMzAwIFBIWSdzLCBidXQKPiA+IHdoZW4gSSBz
dXJ2ZXllZCBvdXIgZGVwbG95ZWQgaGFyZHdhcmUgdXNpbmcgdGhlc2UgYm9hcmRzIG1hbnkKPiA+
IHN5c3RlbXMgb2Ygc2ltaWxhciBhZ2Ugd291bGQgcmFuZG9tbHkgbWl4IEFDMjAwIGFuZCBBQzMw
MCBQSFkncy4KPiA+Cj4gPiBJdCBhcHBlYXJzIHRoZXJlIHdhcyBhIGZhaXJseSBsb25nIHRyYW5z
aXRpb24gcGVyaW9kIHdoZXJlIGJvdGggdmFyaWFudHMKPiA+IHdlcmUgYmVpbmcgc2hpcHBlZC4K
Pgo+IEdpdmVuIHRoYXQgRFQgaXMgc3VwcG9zZWQgdG8gZGVzY3JpYmUgdGhlIGhhcmR3YXJlIHRo
YXQgaXMgYmVpbmcgcnVuIG9uLAo+IGl0IHNob3VsZCBfZGVzY3JpYmVfIF90aGVfIF9oYXJkd2Fy
ZV8gdGhhdCB0aGUga2VybmVsIGlzIGJlaW5nIHJ1biBvbi4KPgo+IFRoYXQgbWVhbnMgbm90IGVu
dW1lcmF0aW5nIGFsbCBwb3NzaWJpbGl0aWVzIGluIERUIGFuZCB0aGVuIGhhdmluZyBtYWdpYwo+
IGluIHRoZSBrZXJuZWwgdG8gc2VsZWN0IHRoZSByaWdodCB2YXJpYW50LiBUaGF0IG1lYW5zIGhh
dmluZyBhIGNvcnJlY3QKPiBkZXNjcmlwdGlvbiBpbiBEVCBmb3IgdGhlIGtlcm5lbCB0byB1c2Uu
CgpUaGUgYXBwcm9hY2ggSSdtIHVzaW5nIGlzIElNTyBxdWl0ZSBzaW1pbGFyIHRvIHNheSBvdGhl
ciBoYXJkd2FyZQp2YXJpYW50IHJ1bnRpbWUgZGV0ZWN0aW9uIERUIGZlYXR1cmVzIGxpa2UgdGhp
czoKaHR0cHM6Ly9naXRodWIuY29tL3RvcnZhbGRzL2xpbnV4L2NvbW1pdC8xNTdjZThmMzgxZWZl
MjY0OTMzZTkzNjZkYjgyOGQ4NDViYWRlM2ExCgpUaGVyZSdzIGFscmVhZHkgYSBnb29kIGJpdCBv
ZiBtZGlvIGF1dG9kZXRlY3Rpb24gY29kZSBsaWtlCnRoYXQgd2hpY2ggc2NhbnMgbWRpbyBidXNl
cyBmb3IgUEhZIElEJ3MgaW4gc3RtbWFjLiBUbyBtZQp0aGlzIGlzIGp1c3QgYWxsb3dpbmcgZm9y
IGRldmljZSBzcGVjaWZpYyBhdXRvZGV0ZWN0aW9uIGxvZ2ljLCBpdCdzCm5vdCBsaWtlIHdlIGRv
bid0IGFscmVhZHkgaGF2ZSBhIGdvb2QgYml0IG9mIGdlbmVyaWMgUEhZIGF1dG8KZGV0ZWN0aW9u
IGNvZGUgaW4gdGhlIGtlcm5lbCBhbHJlYWR5LgoKPiBJIGRvbid0IHRoaW5rIHRoYXQgYWJ1c2lu
ZyAicGh5cyIgaXMgYSBnb29kIGlkZWEuCj4KPiBJdCdzIHF1aXRlIG5vcm1hbCBmb3IgdGhlIGJv
b3QgbG9hZGVyIHRvIGZpeCB1cCB0aGUgZGV2aWNlIHRyZWUKPiBhY2NvcmRpbmcgdG8gdGhlIGhh
cmR3YXJlIC0gZm9yIGV4YW1wbGUsIGFkZGluZyB0aGUgYWN0dWFsIG1lbW9yeQo+IGxvY2F0aW9u
IGFuZCBzaXplcyB0aGF0IGFyZSBwcmVzZW50LCBhZGRpbmcgcmVzZXJ2ZWQgbWVtb3J5IHJlZ2lv
bnMsCj4gZXRjLiBJIGRvbid0IHNlZSB3aHkgeW91IGNvdWxkbid0IGRldGVjdCB0aGUgZGlmZmVy
ZW5jZXMgYW5kIGhhdmUKPiB0aGUgYm9vdCBsb2FkZXIgcGF0Y2ggdGhlIGRldmljZSB0cmVlIGFw
cHJvcHJpYXRlbHkuCgpJIG1lYW4sIHN1cmUsIHRoYXQncyB0ZWNobmljYWxseSBwb3NzaWJsZSwg
aXQganVzdCBzZWVtcyBsaWtlIGl0J3MKbm90IHRoZSBiZXN0IGZpdCBvcHRpb24gaGVyZSBzaW5j
ZSB0aGVyZSBzZWVtcyB0byBiZSBubyByZWFsCnJlYXNvbiB0aGlzIHNvcnQgb2YgYXV0b2RldGVj
dGlvbiBjYW4ndCBiZSBoYW5kbGVkIGluIHRoZQprZXJuZWwgaXRzZWxmLgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxp
c3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
