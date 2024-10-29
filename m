Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A3CC9B551A
	for <lists+linux-stm32@lfdr.de>; Tue, 29 Oct 2024 22:33:09 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1DBB5C7801A;
	Tue, 29 Oct 2024 21:33:09 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D47A7C78016
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Oct 2024 21:33:01 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-2fb4fa17044so59864601fa.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Oct 2024 14:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730237581; x=1730842381;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q8g0feFRM/g+KnXJgAODk2AAUgWx4QsqawCDf5AlE04=;
 b=rL/L66krCv9rZJheTlZ3raeldh6snuQx/2eAi7gOHbkDMUHx/z4z4JX3aeuK1MCHPF
 NaZg7ZzBuqB0RjOgbvRZ4YhlJ0ibe6hBiJYaJS/jnjRVdl3uqLBHz+bSs0V14nPgLDFA
 hjCHbJHQBA9PtGNuGECFqcOeNbUPlS2sw2sOrS4cU1HBfBpJpzmQPOFQRApb0ABm5D5Q
 QecWYf7nTpwJUwYLr///Rm5Bg+s3jo9zM0USiLOMdlMVpViR2RIwRtpcnoQkQZIJ6Zk2
 pS8w9de8tZAXYY0p3MRiVlUToXSlmcvgTM4O3A7HVN8IBvSVqq45wewDCF3Q2VD6Hxz5
 HCQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730237581; x=1730842381;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q8g0feFRM/g+KnXJgAODk2AAUgWx4QsqawCDf5AlE04=;
 b=MyO28wU1qto0J08UckF+A60knqAs1O7K/SBji+mlkKQm2TtF60hC6JWtm2EHECdXzC
 ONcpdzn7n/4ykVQW1lkB4F1fDDWskGPierEl6/Va00mrMU1L9CcnTmm/YbHDEEVklmcx
 IvrkirZBxWnBVBJBAuxJ0G/eJq3gh81vXeblwMfE5Vw2GcpxUQ/Ig9vPtvsG3oNfhheX
 66FnvSUaHNFNnBGsijpoovZzujRTMygCiLx1TVrT8z3BZSVMpVc0OxYOWi7eBV0Q/U7n
 ZcQofLGxINVaXBUZcheWUk/mJV/pxAXPgvPqKYATDYOoDfxp7T++JZRhQIyqTTHuz/Rm
 vrwA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVstmTrQkDoPp4tcCSo6hzvu9dwk2NZluz0nEQ6DYGgpx2hbNulO3nOWg/OrQV4itxoc92pzMVP6hReaQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwfJGiX8VU85dJsMK+WYurgXJd06t2SfOMgbMjH4bg+QY7slk+P
 71w+YNBEDrMEgaaUQtw1xpGf5a5PcoULGjMxvqoynMxC8QrJERc3s8qVe0T3oELiS90iECqtAIM
 wj4PjJr63Ahac1hx1x1JH1ysqL7zQ5XKMiVk3C5LKrM3G/kPi
X-Google-Smtp-Source: AGHT+IGz/3o5I5pu/IvRI0ZSy55BS620aj8UcTY9J52CZ6B8oesgnwPYNjKruN7W2FCVabsplBzN7qiPeSUE29LMc/w=
X-Received: by 2002:a2e:be9f:0:b0:2fb:3bef:6233 with SMTP id
 38308e7fff4ca-2fcbe08cf3bmr60977061fa.33.1730237580772; Tue, 29 Oct 2024
 14:33:00 -0700 (PDT)
MIME-Version: 1.0
References: <20241017-arm-kasan-vmalloc-crash-v3-0-d2a34cd5b663@linaro.org>
 <20241017-arm-kasan-vmalloc-crash-v3-1-d2a34cd5b663@linaro.org>
 <69f71ac8-4ba6-46ed-b2ab-e575dcada47b@foss.st.com>
 <CACRpkdYvgZj1R4gAmzFhf4GmFOxZXhpHVTOio+hVP52OBAJP0A@mail.gmail.com>
 <46336aba-e7dd-49dd-aa1c-c5f765006e3c@foss.st.com>
 <CACRpkdY2=qdY_0GA1gB03yHODPEvxum+4YBjzsXRVnhLaf++6Q@mail.gmail.com>
 <f3856158-10e6-4ee8-b4d5-b7f2fe6d1097@foss.st.com>
 <CACRpkdZa5x6NvUg0kU6F0+HaFhKhVswvK2WaaCSBx3-JCVFcag@mail.gmail.com>
 <CACRpkdYtG3ObRCghte2D0UgeZxkOC6oEUg39uRs+Z0nXiPhUTA@mail.gmail.com>
 <aeef0000-2b08-4fd5-b834-0ead5c122223@foss.st.com>
In-Reply-To: <aeef0000-2b08-4fd5-b834-0ead5c122223@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 29 Oct 2024 22:32:49 +0100
Message-ID: <CACRpkdbgZ2J_-9KLeRz2Y8G4+T2qPo5uax4-o=KZbVFRVEO4Hw@mail.gmail.com>
To: Clement LE GOFFIC <clement.legoffic@foss.st.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Kees Cook <kees@kernel.org>, Mark Brown <broonie@kernel.org>,
 Russell King <linux@armlinux.org.uk>, kasan-dev <kasan-dev@googlegroups.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>, linux-arm-kernel@lists.infradead.org,
 stable@vger.kernel.org, Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Ard Biesheuvel <ardb@kernel.org>, Dmitry Vyukov <dvyukov@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>
Subject: Re: [Linux-stm32] [PATCH v3 1/2] ARM: ioremap: Sync PGDs for
	VMALLOC shadow
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

T24gVHVlLCBPY3QgMjksIDIwMjQgYXQgNDowM+KAr1BNIENsZW1lbnQgTEUgR09GRklDCjxjbGVt
ZW50LmxlZ29mZmljQGZvc3Muc3QuY29tPiB3cm90ZToKCj4gSSBoYXZlIHRlc3RlZCB5b3VyIHBh
dGNoZXMgYWdhaW5zdCBmZXcga2VybmVsIHZlcnNpb25zIHdpdGhvdXQKPiByZXByb2R1Y2luZyB0
aGUgaXNzdWUuCj4gLSBiNjUwNjk4MWY4ODBeCj4gLSB2Ni42LjQ4Cj4gLSB2Ni4xMi1yYzQKPiBJ
IGRpZG4ndCB0b3VjaCB0byBDT05GSUdfVk1BUF9TVEFDSyB0aG91Z2guCj4KPiBUaGUgbWFpbiBk
aWZmZXJlbmNlIGZyb20gbXkgY3Jhc2ggcmVwb3J0IGlzIG15IHRlc3QgZW52aXJvbm1lbnQgd2hp
Y2gKPiB3YXMgYSBkb3duc3RyZWFtIG9uZS4KPgo+IFNvIGl0IHNlZW1zIHJlbGF0ZWQgdG8gU1Qg
ZG93bnN0cmVhbSBrZXJuZWwgdmVyc2lvbiBiYXNlZCBvbiBhIHY2LjYuNDguCj4gRXZlbiB0aG91
Z2ggdGhlIGJhY2t0cmFjZSB3YXMgdGFsa2luZyBhYm91dCB1bndpbmRpbmcgYW5kIGthc2FuLgo+
Cj4gSSB3aWxsIGNvbnRpbnVlIHRvIGludmVzdGlnYXRlIG9uIG15IHNpZGUgaW4gdGhlIG5leHQg
d2Vla3MgYnV0IEkgZG9uJ3QKPiB3YW50IHRvIGJsb2NrIHRoZSBwYXRjaCBpbnRlZ3JhdGlvbiBw
cm9jZXNzIGlmIEkgd2FzLgoKSSB0aGluayB3ZSBjYW4gYXNzdW1lIHRoYXQgdGhlIHBhdGNoZXMg
d2UgaGF2ZSBxdWV1ZWQgaW4gUnVzc2VsbHMKcGF0Y2ggdHJhY2tlciBhdCBsZWFzdCBkb24ndCBt
YWtlIHRoaW5ncyB3b3JzZSwgc28gbGV0J3MgbWVyZ2UgdGhvc2UKYW5kIHRoZW4gc2VlIGlmIHRo
ZXJlIGlzIG1vcmUgZmFsbG91dCB3ZSBuZWVkIHRvIGRpZyBpbnRvIGFzIHlvdSB0ZXN0LgoKVGhh
bmtzIENsZW1lbnQhCgpZb3VycywKTGludXMgV2FsbGVpagpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgt
c3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
