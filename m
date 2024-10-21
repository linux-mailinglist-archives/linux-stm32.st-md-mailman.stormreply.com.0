Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB979A5E68
	for <lists+linux-stm32@lfdr.de>; Mon, 21 Oct 2024 10:18:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1022EC78035;
	Mon, 21 Oct 2024 08:18:13 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 74A81C71292
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Oct 2024 08:18:06 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-2fb5111747cso45761351fa.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Oct 2024 01:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729498685; x=1730103485;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eoi9k7Ygt7ktavMqWKGD7qsQYEk2fiEFaSEeoaagxAI=;
 b=pGmh99VefqcZgwpjEJgg6s0NZLWZEDhicxi3Ss293N/seet1hJBcQi6fT/pBHWoqpy
 S/pOmHKmKbegMrewai1JOoZmx055ocGsVg4EaKX1RghyAgic2dbkTT9vNLgeKdF6S1zR
 gSWpf3afuP4HxQQJJhu7B6E7sRdMV27wHi+akxsxivNZ77YbDQzFst8LfHL4Cu4xLJ5z
 lI3pA/pPjH8AMOHt3fmwU/7UlG6vMz/mZKd0iz8ijPzrL0zD/yr5+5MgyCQc/2yHPmVS
 HYOHlN5cwgNXX9bI51/W6MRq9+A4Tp4j2LolDneuJjL+OcPDx4TPIPCpcl5uqsRD/DfQ
 EJSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729498686; x=1730103486;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eoi9k7Ygt7ktavMqWKGD7qsQYEk2fiEFaSEeoaagxAI=;
 b=vJuBzF+1MoUgHVj0/NJqENEQAnRBrVFApDhRozSYM6BE87VVgtwucpI9XMINDhlc6N
 JZ8HqSHNhD0yG849fJfPV70Hbt3zrPUn6o1J4iudJepyFvn3FhOEvtPDZBSpikT4vx1Y
 OoNFgtmuj/Cu6qoGrPx/1aal8K+36B6LQm9Wli/of7jTZQuf9YPeCp+OtGDh80kGSI9k
 He6CLxQiW6t6uoWoWngcP04ELMxYOHCyYIE5sjI0U0kHfOc7Yl3okuTnER3UgFXEQAzW
 XZqMCfJJgEvhBhEz5q5N2tYefWJHHBKUnSmq70iI/XGQQkgvX2EWwQ2qDoURBjIFftdm
 FrhQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVI5eLHxPnKZ93uN+9XYIcyyZ0jO+J7ZuEDt3dtERqyUBJa8ehn24rLqiIKarRY/Xt3FB6gf9y8qATt7g==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyHopL9tBu1SV/edZWS1fnRG9KpmQKg6N+HSMJ3AFsvJrxsxn8e
 l+/z2RCf2rAquSsSw7/05Y2B+CgAhM5l0K/MbEI6Ur8HkepJsr+tsYIxm6L6NdLga3kdAWwsA/m
 1z0u2PIfms8e9aGHj6zak6k49x8fvqs4ABDmLoQ==
X-Google-Smtp-Source: AGHT+IHqcu6/cs+18LQiPhDruAMJcQI78x11uXeyZZCo4iTRJVHXBAwnvIbkLUHZqP7mp8QjrS5VJe0fWAo0cI/9A4E=
X-Received: by 2002:a05:651c:1502:b0:2fb:593c:2bf2 with SMTP id
 38308e7fff4ca-2fb82e90cebmr38651181fa.3.1729498685512; Mon, 21 Oct 2024
 01:18:05 -0700 (PDT)
MIME-Version: 1.0
References: <20241016-arm-kasan-vmalloc-crash-v2-0-0a52fd086eef@linaro.org>
 <20241016-arm-kasan-vmalloc-crash-v2-1-0a52fd086eef@linaro.org>
In-Reply-To: <20241016-arm-kasan-vmalloc-crash-v2-1-0a52fd086eef@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 21 Oct 2024 10:17:53 +0200
Message-ID: <CACRpkdY8pA_z6DSzOVUH+wRt2uDpWtD=ipkCs0aZyWgfZ7fyjQ@mail.gmail.com>
To: Clement LE GOFFIC <clement.legoffic@foss.st.com>,
 Russell King <linux@armlinux.org.uk>, Kees Cook <kees@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Mark Brown <broonie@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Ard Biesheuvel <ardb@kernel.org>,
 Melon Liu <melon1335@163.com>
Cc: stable@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 1/2] ARM: ioremap: Sync PGDs for
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

T24gV2VkLCBPY3QgMTYsIDIwMjQgYXQgOToxNeKAr1BNIExpbnVzIFdhbGxlaWogPGxpbnVzLndh
bGxlaWpAbGluYXJvLm9yZz4gd3JvdGU6Cgo+IFdoZW4gc3luYzppbmcgdGhlIFZNQUxMT0MgYXJl
YSB0byBvdGhlciBDUFVzLCBtYWtlIHN1cmUgdG8gYWxzbwo+IHN5bmMgdGhlIEtBU0FOIHNoYWRv
dyBtZW1vcnkgZm9yIHRoZSBWTUFMTE9DIGFyZWEsIHNvIHRoYXQgd2UKPiBkb24ndCBnZXQgc3Rh
bGUgZW50cmllcyBmb3IgdGhlIHNoYWRvdyBtZW1vcnkgaW4gdGhlIHRvcCBsZXZlbCBQR0QuCj4K
PiBTaW5jZSB3ZSBhcmUgbm93IGNvcHlpbmcgUEdEcyBpbiB0d28gaW5zdGFuY2VzLCBjcmVhdGUg
YSBoZWxwZXIKPiBmdW5jdGlvbiBuYW1lZCBtZW1jcHlfcGdkKCkgdG8gZG8gdGhlIGFjdHVhbCBj
b3B5aW5nLCBhbmQKPiBjcmVhdGUgYSBoZWxwZXIgdG8gbWFwIHRoZSBhZGRyZXNzZXMgb2YgVk1B
TExPQ19TVEFSVCBhbmQKPiBWTUFMTE9DX0VORCBpbnRvIHRoZSBjb3JyZXNwb25kaW5nIHNoYWRv
dyBtZW1vcnkuCj4KPiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwo+IEZpeGVzOiA1NjVjYmFh
ZDgzZDggKCJBUk06IDkyMDIvMToga2FzYW46IHN1cHBvcnQgQ09ORklHX0tBU0FOX1ZNQUxMT0Mi
KQo+IExpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWFybS1rZXJuZWwvYTFhMWQw
NjItZjNhMi00ZDA1LTk4MzYtM2IwOThkZTlkYjZkQGZvc3Muc3QuY29tLwo+IFJlcG9ydGVkLWJ5
OiBDbGVtZW50IExFIEdPRkZJQyA8Y2xlbWVudC5sZWdvZmZpY0Bmb3NzLnN0LmNvbT4KPiBTdWdn
ZXN0ZWQtYnk6IE1hcmsgUnV0bGFuZCA8bWFyay5ydXRsYW5kQGFybS5jb20+Cj4gU3VnZ2VzdGVk
LWJ5OiBSdXNzZWxsIEtpbmcgKE9yYWNsZSkgPGxpbnV4QGFybWxpbnV4Lm9yZy51az4KPiBTaWdu
ZWQtb2ZmLWJ5OiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+CgpBcyBp
dCB0dXJucyBvdXQgaW4gbXkgY29uZnVzaW9uIEkgaGF2ZSBtaXNzZWQgdGhhdCB0aGUgbW9yZSBv
ciBsZXNzIGlkZW50aWNhbApwYXRjaCB3aXRoIGEgZGlmZmVyZW50IHN1YmplY3QgKHRhbGtpbmcg
YWJvdXQgcmVjdXJzaW9uKSBpcyBhbHJlYWR5IHN1Ym1pdHRlZApieSBNZWxvbiBMaXUgYW5kIHdh
aXRpbmcgaW4gdGhlIHBhdGNoIHRyYWNrZXI6Cmh0dHBzOi8vd3d3LmFybS5saW51eC5vcmcudWsv
ZGV2ZWxvcGVyL3BhdGNoZXMvdmlld3BhdGNoLnBocD9pZD05NDI3LzEKCkkndmUgdGVzdGVkIGl0
IGFuZCBpdCBzb2x2ZXMgdGhlIHByb2JsZW0gZXF1YWxseSB3ZWxsLgoKSSBldmVuIHJldmlld2Vk
IHRoYXQgYW5kIGRpZG4ndCByZW1lbWJlciBpdC4uLgoKSSB3aWxsIHN1Ym1pdCBwYXRjaCAyLzIg
aW50byB0aGUgcGF0Y2ggdHJhY2tlciBhbmQgbGV0IE1lbG9uJ3MKcGF0Y2ggZGVhbCB3aXRoIHRo
aXMgaXNzdWUuCgpZb3VycywKTGludXMgV2FsbGVpagpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3Rt
MzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
