Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A181B02428
	for <lists+linux-stm32@lfdr.de>; Fri, 11 Jul 2025 20:53:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 04FF4C3087A;
	Fri, 11 Jul 2025 18:53:18 +0000 (UTC)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com
 [209.85.219.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3F4C2C36B0E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Jul 2025 18:53:17 +0000 (UTC)
Received: by mail-yb1-f172.google.com with SMTP id
 3f1490d57ef6-e897c8ca777so2195506276.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Jul 2025 11:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752259996; x=1752864796;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lnMNvTF+R8ofXhs9BIQ7FQl/jHKBWLPO/PBptuTPHgQ=;
 b=HpAfLwLyl+37u0Vt0RoQ8c7lrby4w1swsjBaA2TdRrvemlmsRDWe0gWCs1JzEyAkui
 BZlcg066DrZgtRYuZixvcCCm+gX8+ScoybTr84O9BBtywiFPlhSYAAQbjT8zyoqk5EDm
 NjdjPYgCQ+sGAgpSEHh6qLgSp/UiSfw4fztwMclNnVIx7f52oAueTBEyfm1bicJJtglB
 JzSOpROH5cus0TB6sfzq5/X1x6zy4Hc9qCTLlVbuLBjgFCQguEfOTAS7Us/C66B8M4Ys
 3/4lYGnkIjGrFaMdLTErsNux8oVtmfCK0HnC6vJqUjvNo+tWBVSr2u2V6MaTdUVP8d2c
 Gyqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752259996; x=1752864796;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lnMNvTF+R8ofXhs9BIQ7FQl/jHKBWLPO/PBptuTPHgQ=;
 b=pE3df26/lD80ZoBzOWlkQDXsx5lPK9yGpvfltnYfQnXXKHZAn+gG8vFty2IRCPLsgB
 5I5yOKTdwf5uitm/2M1jBbLg2sjGsPlX6APL7TviMQwrf3JFf6RXXKZI7o7NuHG6i8OE
 j7v1mf8RaL7YXkW+U9LQZhxPe6OdNOG7TgfFCmyTGqmp5JvUCWUOpnM/l4Ipxi1GUOlX
 7kB8AczHG6KEwYlymQauSL8T74VuHk1d3VJ4JTlPOFsF+Ba8CgiZwz0+AeCsd+7bDuOR
 s0TbfLrRXh9lAtuzzgVsPBYwmVQzxZ1ntTOIhTIFJeiKtW1iRTnTCWlsv7FIk2h9JIub
 nP9w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUaF+9KAx9sSBQUNKsohC3R4ppLzb48B3/IZWD8NtyscJx6J1czlT2Q9sjjML3U7vlUAE3lcxIyUiEvpQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx6EiSC8v63oTUOW+ytDnlM8fJnrf/tmvHA/j3vZzjh4OWQlIK8
 C9jz4bpPUL+VtZo26pirUNTtPtMoLluxoKdEET8+C4x7y+SB+fXuWtxnTCreNPgNkvVpG19v5oo
 1tdH2FVrP2/V/etEDDX5n4gVvu45Gl5xt2G5qokyIuUrx6HmTnAT4
X-Gm-Gg: ASbGncuOhevivVFpZS/Lyk73EwaMNxd2Hu2F1SIY0TztwYmyPqr5eaHQzeQmjYfqimt
 qXOHJCO6486ojbbKIPCC1KOEE+lG2u7OUj0L1lqjW7KM1HKsDbPewH6zfZ/iHOGMcNoYtB5zeaA
 rrg64OcMXz+UGeEimSpIT6BPJMrJnoZPR6arM1TcMmeUIUzN2Zlol+rbdPZGOCyW35l5fayzWnf
 8r1MP6vMi/U0HtErQ==
X-Google-Smtp-Source: AGHT+IHNGHaJapXfEwRUcTXNTWlTsMHXEiPIQ/b0KTpye4KQsUdp1sxBRmAZdNG++EC1bw7xLSQza58HYJgLAxUXYQU=
X-Received: by 2002:a05:690c:6282:b0:70f:87c5:5270 with SMTP id
 00721157ae682-717d5daccbfmr86777077b3.19.1752259996008; Fri, 11 Jul 2025
 11:53:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250711-hdp-upstream-v7-0-faeecf7aaee1@foss.st.com>
In-Reply-To: <20250711-hdp-upstream-v7-0-faeecf7aaee1@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 11 Jul 2025 20:52:58 +0200
X-Gm-Features: Ac12FXxLjA7peUDZIWJhb4cndI_Q2FwVXxO2uVEd8E-6LJKHyzTLqNgXqkM6VhY
Message-ID: <CACRpkda9M6R_vi5FMGvo6PyThB8OJjX7PMMusHjjs5HcX0OF4g@mail.gmail.com>
To: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-gpio@vger.kernel.org,
 =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v7 0/8] Introduce HDP support for STM32MP
	platforms
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

T24gRnJpLCBKdWwgMTEsIDIwMjUgYXQgOTo0M+KAr0FNIENsw6ltZW50IExlIEdvZmZpYwo8Y2xl
bWVudC5sZWdvZmZpY0Bmb3NzLnN0LmNvbT4gd3JvdGU6Cgo+IENsw6ltZW50IExlIEdvZmZpYyAo
OCk6Cj4gICAgICAgZHQtYmluZGluZ3M6IHBpbmN0cmw6IHN0bTMyOiBJbnRyb2R1Y2UgSERQCj4g
ICAgICAgcGluY3RybDogc3RtMzI6IEludHJvZHVjZSBIRFAgZHJpdmVyCj4gICAgICAgTUFJTlRB
SU5FUlM6IGFkZCBDbMOpbWVudCBMZSBHb2ZmaWMgYXMgU1RNMzIgSERQIG1haW50YWluZXIKClRo
ZSB0aHJlZSBwYXRjaGVzIGFwcGxpZWQgdG8gdGhlIHBpbmN0cmwgdHJlZS4KCj4gICAgICAgQVJN
OiBkdHM6IHN0bTMyOiBhZGQgSGFyZHdhcmUgZGVidWcgcG9ydCAoSERQKSBvbiBzdG0zMm1wMTMK
PiAgICAgICBBUk06IGR0czogc3RtMzI6IGFkZCBIYXJkd2FyZSBkZWJ1ZyBwb3J0IChIRFApIG9u
IHN0bTMybXAxNQo+ICAgICAgIEFSTTogZHRzOiBzdG0zMjogYWRkIEhhcmR3YXJlIGRlYnVnIHBv
cnQgKEhEUCkgb24gc3RtMzJtcDI1Cj4gICAgICAgQVJNOiBkdHM6IHN0bTMyOiBhZGQgYWx0ZXJu
YXRlIHBpbm11eCBmb3IgSERQIHBpbiBhbmQgYWRkIEhEUCBwaW5jdHJsIG5vZGUKPiAgICAgICBB
Uk06IGR0czogc3RtMzI6IGFkZCBIYXJkd2FyZSBkZWJ1ZyBwb3J0IChIRFApIG9uIHN0bTMybXAx
NTdjLWRrMiBib2FyZAoKUGxlYXNlIGFwcGx5IHRoZXNlIHRocm91Z2ggdGhlIFNvQyB0cmVlLgoK
WW91cnMsCkxpbnVzIFdhbGxlaWoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
L21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
