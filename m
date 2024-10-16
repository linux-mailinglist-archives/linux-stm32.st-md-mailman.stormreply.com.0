Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E96B09A1230
	for <lists+linux-stm32@lfdr.de>; Wed, 16 Oct 2024 21:00:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A022EC78032;
	Wed, 16 Oct 2024 19:00:42 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 86342C78031
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Oct 2024 19:00:35 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-2fb443746b8so2315001fa.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Oct 2024 12:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729105235; x=1729710035;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0+9rFH2EyIhLeVd0k2EbmyRJcB/lNaDtVTgDaUM7QHw=;
 b=n/bKEuCAPWLh6t5mBsAwmEwIFUqQi2BQtxms6Z25kOIT3D5Lz3tzrx7iglIyXvW7ZH
 5kZpThH5T0FHBNt7yswo0AOJr+YlhytdqFLhFRV7hKW1MHAM3iBa8WFQn2VM9YQQIALE
 YhNfGXH0PkAs1CSuPQG93CgGzK3ON8DQAFpeuRyjcs1iYXySJoVqgg49N9HhsJrBjCCY
 1ZeBUa8dG8nLDhKdImw5CABSMQ8YhkJKyJZ2UDptBGGWc8jWlRRlOPYuwJrB9RwqFKM9
 +UtBKRsQHexdpIN1slIdd/2kL/Iim4U4LDiqYRI+VG7PquoC2mKMk+32/oBaDTAIetny
 PCIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729105235; x=1729710035;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0+9rFH2EyIhLeVd0k2EbmyRJcB/lNaDtVTgDaUM7QHw=;
 b=nrYayvuXI5GrIlEdTdqAmrUMNDTM7se/twExgQuKGCvjZ3kPrJFgLffJOzaLTLXl6n
 nkpdtssj0Vr8RJFfcZyOzivC3KOAFlraD3idNs0sPeYbW6rBpdQ7xffC3VGbH7tJhIvX
 EvT9UALfRYK6cpZIEjK4BTgFsqM5rXIRqhg6wxRK9GjsdiyZWM+Bvk8Zo1ADihe3bccm
 8Rk9w2GgHpnt7PbdBRIDdp4e+MQnt4/XMyBweEHZxsr4aSZZ6n11Wk9QSKziY/ZwE7w6
 B83sjsgriBRsOZHD3qP3Tf4wDbs043zICFPz2cq9awzTRC1cuM0b9GnpN8MGEF3L89oJ
 RgBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJU8h73dtOT1XwSuX4lx5IyewPI1IMf2TzZAKhfiC7LH0O1LN6QPxRRHpeYFj37uEQHwMyY9shHNPsZw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yz9rMfGbHiVQLp72bPdlH5Nu22PA474J0UoB4bZrcwrkmXL1lmH
 fDW3UB61JUOu6i2sfJ5Z2lZkV1KnT15y3I7xBuHdubfcRdGC6u9mDQb30X/2julGPzTRcSHNhvF
 gU/Kk1g29nuoZ7j28ryQEaneoy4mkFvhHuQKPUQ==
X-Google-Smtp-Source: AGHT+IGmz3SDIjwUf650O06/BOGFOUeZSuH0R/NJnsSCnd6RILHZH+mod4oXz7sd4joI8dbQKVS0+waCt4VbSo3X3Nw=
X-Received: by 2002:a05:651c:2123:b0:2fb:3d86:d932 with SMTP id
 38308e7fff4ca-2fb61b4c18fmr35985921fa.12.1729105234513; Wed, 16 Oct 2024
 12:00:34 -0700 (PDT)
MIME-Version: 1.0
References: <Zw5D2aTkkUVOK89g@J2N7QTR9R3>
 <CACRpkdY79nbBoaHe6ijuyJS9dDduNw_sv1J90pz121YDgCvC3Q@mail.gmail.com>
 <Zw51fhCkmCYrTOeV@J2N7QTR9R3.cambridge.arm.com>
 <CAMj1kXEcLD3PWd-9osjo9AOe5Jg-NMOmJ8afB_x7VeboueLoeQ@mail.gmail.com>
 <Zw59x0LVS-kvs9Jv@J2N7QTR9R3.cambridge.arm.com>
 <CAMj1kXEnhHkxywh8TH1i=fmyAR8cXZ8D-rvV43X-N7GpCf2Axw@mail.gmail.com>
 <Zw6Jk74-d0mhR0jx@J2N7QTR9R3.cambridge.arm.com>
 <CAMj1kXG3bwMGpArYNUm-qMO7PPgb3--wy5kp-3Ks2Uv9M479xg@mail.gmail.com>
 <Zw6X9KQT0-z7r7SY@J2N7QTR9R3.cambridge.arm.com>
 <CAMj1kXGGmsWs2XpM7zLURjKp67Uz2ePi1pSV1=rPCMgviLVUgw@mail.gmail.com>
 <Zw9_imsl2KLf7_GY@J2N7QTR9R3>
In-Reply-To: <Zw9_imsl2KLf7_GY@J2N7QTR9R3>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 16 Oct 2024 21:00:22 +0200
Message-ID: <CACRpkda8tO=QLF_zznoNjdNfNZJVntY_3+247E=qK6zNqRnVSA@mail.gmail.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Kees Cook <kees@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 Mark Brown <broonie@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [Linux-stm32] Crash on armv7-a using KASAN
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

T24gV2VkLCBPY3QgMTYsIDIwMjQgYXQgMTA6NTXigK9BTSBNYXJrIFJ1dGxhbmQgPG1hcmsucnV0
bGFuZEBhcm0uY29tPiB3cm90ZToKCj4gSSBiZWxpZXZlIHRoYXQncyBuZWNlc3NhcnkgZm9yIHRo
ZSBsYXp5IFRMQiBzd2l0Y2gsIGF0IGxlYXN0IGZvciBTTVA6Cj4KPiAgICAgICAgIC8vIENQVSAw
ICAgICAgICAgICAgICAgICAgICAgICAgLy8gQ1BVIDEKPgo+ICAgICAgICAgPDwgc3dpdGNoZXMg
dG8gdGFzayBYJ3MgbW0gPj4KPgo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICA8PCBjcmVhdGVzIGt0aHJlYWQgdGFzayBZID4+Cj4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIDw8IG1hcHMgdGFzayBZJ3MgbmV3IHN0YWNrID4+Cj4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDw8IG1hcHMgdGFzayBZJ3MgbmV3IHNo
YWRvdyA+Pgo+Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC8vIFkg
c3dpdGNoZWQgb3V0Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNv
bnRleHRfc3dpdGNoKC4uLiwgWSwgLi4uLCAuLi4pOwo+Cj4gICAgICAgICAvLyBTd2l0Y2ggZnJv
bSBYIHRvIFkKPiAgICAgICAgIGNvbnRleHRfc3dpdGNoKC4uLiwgWCwgWSwgLi4uKSB7Cj4gICAg
ICAgICAgICAgICAgIC8vIHByZXYgPSBYCj4gICAgICAgICAgICAgICAgIC8vIG5leHQgPSBZCj4K
PiAgICAgICAgICAgICAgICAgaWYgKCFuZXh0LT5tbSkgewo+ICAgICAgICAgICAgICAgICAgICAg
ICAgIC8vIFkgaGFzIG5vIG1tCj4gICAgICAgICAgICAgICAgICAgICAgICAgLy8gTm8gc3dpdGNo
X21tKCkgaGVyZQo+ICAgICAgICAgICAgICAgICAgICAgICAgIC8vIC4uLiBzbyBubyBjaGVja192
bWFsbG9jX3NlcSgpCj4gICAgICAgICAgICAgICAgIH0gZWxzZSB7Cj4gICAgICAgICAgICAgICAg
ICAgICAgICAgLy8gbm90IHRha2VuCj4gICAgICAgICAgICAgICAgIH0KPgo+ICAgICAgICAgICAg
ICAgICAuLi4KPgo+ICAgICAgICAgICAgICAgICAvLyBYJ3MgbW0gc3RpbGwgbGFja3MgWSdzIHN0
YWNrICsgc2hhZG93IGhlcmUKPgo+ICAgICAgICAgICAgICAgICBzd2l0Y2hfdG8ocHJldiwgbmV4
dCwgcHJldik7Cj4gICAgICAgICB9Cj4KPiAuLi4gc28gcHJvYmFibHkgd29ydGggYSBjb21tZW50
IHRoYXQgd2UncmUgZmF1bHRpbmcgaW4gdGhlIG5ldwo+IHN0YWNrK3NoYWRvdyBmb3IgZm9yIGxh
enkgdGxiIHdoZW4gc3dpdGNoaW5nIHRvIGEgdGFzayB3aXRoIG5vIG1tPwoKU3dpdGNoaW5nIHRv
IGEgdGFzayB3aXRoIG5vIG1tID09IHN3aXRjaGluZyB0byBhIGtlcm5lbCBkYWVtb24uCgpBbmQg
dGhvc2Ugb25seSB1c2UgdGhlIGtlcm5lbCBtZW1vcnkgYW5kIHJlbGllcyBvbiB0aGF0IGFsd2F5
cwpiZWluZyBtYXBwZWQgaW4gYW55IHByZXZpb3VzIG1tIGNvbnRleHQsIHJpZ2h0LgoKQnV0IHdo
ZXJlIGRvIHdlIHB1dCB0aGF0IGNvbW1lbnQ/IEluIGtlcm5lbC9zY2hlZC9jb3JlLmMKY29udGV4
dF9zd2l0Y2goKT8KCkl0J3Mgbm8gZGlmZmVyZW50IGluIGFueSBhcmNoaXRlY3R1cmUgSSB0aGlu
aywgYW5kIHRoZXkgcHJldHR5IG11Y2ggYWxsCnVzZSBLQVNBTiB0aGVzZSBkYXlzLgoKT3IgaW4g
QVJNMzIncyBlbnRlcl9sYXp5X3RsYigpIGluIGFyY2gvYXJtL2luY2x1ZGUvYXNtL21tdV9jb250
ZXh0Lmg/CgpJJ20gdW5zdXJlLiBJIHdvdWxkIG1ha2UgaXQgYSBzZXBhcmF0ZSBwYXRjaC4KCj4g
SW4gdGhlIGxhenkgdGxiIGNhc2UgdGhlIGN1cnJlbnQvb2xkIG1hcHBpbmdzIGRvbid0IGRpc2Fw
cGVhciBmcm9tIHRoZQo+IGFjdGl2ZSBtbSwgYW5kIHNvIHdlIGRvbid0IG5lZWQgdG8gZ28gYWRk
IHRob3NlIHRvIHRoZSBuZXcgbW0sIHdoaWNoIGlzIHdoYXQKPiB3ZSBuZWVkIGNoZWNrX3ZtYWxs
b2Nfc2VxKCkgZm9yLgoKWXVwcyB0aGF0J3MgaG93IEkgdW5kZXJzdGFuZCBpdCB0b28uCgpZb3Vy
cywKTGludXMgV2FsbGVpagpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFp
bG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
