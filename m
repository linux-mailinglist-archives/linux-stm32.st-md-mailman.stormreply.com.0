Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E0B8BE5B51
	for <lists+linux-stm32@lfdr.de>; Fri, 17 Oct 2025 00:41:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 74495C57B64;
	Thu, 16 Oct 2025 22:41:35 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9F75BC57B53
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Oct 2025 22:41:33 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-376466f1280so11194301fa.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Oct 2025 15:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760654493; x=1761259293;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aMIxLZM/6U/tLtbB22xRRXB39dw+qCRALwooxcdMsi8=;
 b=xhuLIF1mNI8X8d49VtzEquJuBeGL2ZFaovssVlbbY8QWTgzky7zRdygy+QsYpvRE5z
 Lte8I3lPYzTgAW9mwi6LGRR7SkLz2y43RGPB5JZOz6wbYXcbdwd4tdDKxtajeByJkd/N
 Z482XROQDVpk9hJC3Ms3Opom8nSxr4K6H8fQbg16GpELENNMa949CdE86oO34tenDMkQ
 gjUcUeW9eVA6sM/CiISo7ovY/c2P4v1Hxbm1UyzLNe9qpoeVVLfRG9yNq9dMt3QLCWP3
 oLuQe249X7RMZLRFJ1iQzh8SU96XvPcXE2mkn6NxWVcH3LzaxETfGraYIQgWxT+Xk9EB
 fWVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760654493; x=1761259293;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aMIxLZM/6U/tLtbB22xRRXB39dw+qCRALwooxcdMsi8=;
 b=qfN7FF5ausdmxCzoIkfXwDGbEYd46zZWzhCuNbuj1m2Xvh57iYmuLNHEJUHL6Cm3wj
 mlKNE6fCKkuhaVlO1lq5qhmgm9qc2yvUQLFdkvyeVGSPJaoE5SugWkZc0XEi/BsyQzST
 pE4nCE9rmCOZ6Da7YDX0XqrLA6LpEaGaNcO2QRES8ReqdzMyAlcX3qxoEiFSECPJrjsM
 UdKem+niIk9Lx5+3WH/7fGng9wD2MB8mLx6KDdGQeG5suIgnUi1bconbyPE1B4yi7Rp6
 AiWTUcViZEbAdtarvoXT46wcvWY9i1AmeZ0kCZz7SsVNo7LYNJ/goELPPcEcryKuHt9k
 54wg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfPS49cpNHE7x6Mz6a9QwbaOIiQZeQzmBcWA+H1s5W1gY1DRGJj8UjFGpmWNwnUyHNMbVR2UpEIKaqCA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxHB12Lvm03rpY+MQld+S+dQFtaLZMPhPocOcSGR2j2ObKEi5sd
 Mqb4/+aq6FcNGVMcvIDqHbpXKHG49WQd61Z79N3m+gwubAbcwhP8GNIOgaOPLkbifmRymQy7pry
 QfowXKkJRt5A5E0Z/4pyoyQMbBQbyBBwppiEBh60w7Q==
X-Gm-Gg: ASbGncuUsJwEeNKNtltHNDNYmWGUD0DlJ0Sx/58U1qU4yZyuv2X4/QOYRQxoJqP5gpi
 bOLKfOH6DtRMZBN45zJJVAWgUo0YJm12HYEl/MvidjKCyhFB7G15Uc+vzAglFaEMutl+MyVQQzn
 vo0VBlfzfjwe2MDrK3iPjuogcG0VXSbayH/ttrJnqDLohcQ3cx+aSSBgVX6/Jynl3ysPfA3T2/8
 xSX2zohEZsszYie02bVrTLiYFfhN2EGNa8b3kIGroXHN8eV9jHupFvVWEX6
X-Google-Smtp-Source: AGHT+IGgJO7Zemo+LpoVZasQFrmgPrpk7XQQVTw1/TLYvKF3dmLuG/UrVSSNariPEoGP40bDmIuuuFjLjUnIT++2s6Q=
X-Received: by 2002:a05:651c:211c:b0:365:6b40:8656 with SMTP id
 38308e7fff4ca-37797948f9bmr5445311fa.35.1760654492708; Thu, 16 Oct 2025
 15:41:32 -0700 (PDT)
MIME-Version: 1.0
References: <20251014140451.1009969-1-antonio.borneo@foss.st.com>
 <20251014140451.1009969-3-antonio.borneo@foss.st.com>
 <20251014-barbecue-crewman-717fe614daa6@spud>
 <CACRpkdZT20cdH+G6Gjw8PopAkir+gGgMtRR4pkjnXFrmDkdfog@mail.gmail.com>
 <c2a0f301-ec5e-42d7-9df9-09a852a199ad@lunn.ch>
In-Reply-To: <c2a0f301-ec5e-42d7-9df9-09a852a199ad@lunn.ch>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 17 Oct 2025 00:41:21 +0200
X-Gm-Features: AS18NWCfvCVaxN-I2xhCPM2ryQoUWNo2dnNVl4LEycz99TO_NsvVsr2xAwj_RzE
Message-ID: <CACRpkdZX_KJ-G_teTBTwjm_KNmTa5iX4n==yovixvKTOBqqSXw@mail.gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bartosz Golaszewski <brgl@bgdev.pl>, Conor Dooley <conor@kernel.org>,
 linux-gpio@vger.kernel.org, Fabien Dessenne <fabien.dessenne@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Christophe Roullier <christophe.roullier@foss.st.com>
Subject: Re: [Linux-stm32] [PATCH v3 02/10] dt-bindings: pincfg-node: Add
	properties 'skew-delay-{in, out}put'
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

T24gV2VkLCBPY3QgMTUsIDIwMjUgYXQgNjozN+KAr1BNIEFuZHJldyBMdW5uIDxhbmRyZXdAbHVu
bi5jaD4gd3JvdGU6Cgo+ID4gSSBkb24ndCByZWNhbGwgdGhlIHJlYXNvbiBmb3IgdGhpcyB3YXkg
b2YgZGVmaW5pbmcgdGhpbmdzLCBidXQgb25lIHJlYXNvbgo+ID4gY291bGQgYmUgdGhhdCB0aGUg
c2tldy1kZWxheSBpbmN1cnJlZCBieSB0d28gaW52ZXJ0ZXJzIGlzIHZlcnkKPiA+IGRlcGVuZGVu
dCBvbiB0aGUgcHJvZHVjdGlvbiBub2RlIG9mIHRoZSBzaWxpY29uLCBhbmQgY2FuIGJlCj4gPiBu
YW5vc2Vjb25kcyBvciBwaWNvc2Vjb25kcywgdGhlc2UgZGF5cyBtb3N0bHkgcGljb3NlY29uZHMu
Cj4gPiBFeGFtcGxlOiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0L2FkaSxh
ZGluLnlhbWwKPgo+Cj4gSSdtIG1pc3NpbmcgdGhlIGJpZyBwaWN0dXJlIGhlcmUsIGFuZCBpIGRv
bid0IHNlZSBhbiBleGFtcGxlIG9mIHRoZXNlCj4gcHJvcGVydGllcyBiZWluZyB1c2VkLiBIb3dl
dmVyLCBzaW5jZSB5b3UgcmVmZXJlbmNlIGFuIG9sZCBuZXR3b3JraW5nCj4gZXhhbXBsZSwgZm9y
IFJHTUlJIGRlbGF5cy4uLi4KPgo+IGFkaSxyeC1pbnRlcm5hbC1kZWxheS1wcyBzaG91bGQgYmUg
ZGVwcmVjYXRlZCwgd2Ugbm93IGhhdmUgdGhlIGdlbmVyaWMKPiByeC1pbnRlcm5hbC1kZWxheS1w
cy4gVGhlIHBvaW50IGFib3V0IHVzaW5nIC1wcyBpcyBob3dldmVyIHN0aWxsCj4gdmFsaWQuCj4K
PiBIb3dldmVyLCBpIHdvdWxkIG5vdCBsaWtlIHRvIHNlZSBwaW5jdGwgRFQgcHJvcGVydGllcyB1
c2VkIGluIHBsYWNlIG9mCj4gcngtaW50ZXJuYWwtZGVsYXktcHMuIEhvdyB0aGUgRXRoZXJuZXQg
TUFDIGRyaXZlciBpbXBsZW1lbnRzCj4gcngtaW50ZXJuYWwtZGVsYXktcHMgaXMgbGVmdCBvcGVu
LCBzbyBjYWxsaW5nIGEgcGluY3RsIEFQSSB0byBzZXQgdGhlCj4gc2tldyBpcyBmaW5lIGJ5IG1l
LiBBbmQgaWYgdGhlIHJlYWwgdXNlIGNhc2UgaGFzIG5vdGhpbmcgdG8gZG8gd2l0aAo+IG5ldHdv
cmtpbmcsIHRoZW4gaSBkb24ndCBjYXJlLgoKVGhlIHNjb3BlIGhlcmUgaXMgdG8gZGVzY3JpYmUg
c2tld2luZyB0aGUgdGltaW5nIG9mIGFueSBsaW5lCmNvbm5lY3RlZCB0byBhIHBpbiwgbm8gbWF0
dGVyIHRoZSBwdXJwb3NlLiBDb3VsZCBiZSBhbiBNTUMKY2FyZCBmb3IgZXhhbXBsZSwgb3Igc29t
ZXRoaW5nIGVsc2UsIGJ1dCB0aGUgcG9pbnQgaXMgdGhhdAp0aGUgY29udHJvbCByZWdpc3RlcnMg
YXJlIGdlbmVyYWwgYW5kIGluc2lkZSB0aGUgU29DIHBlcmltZXRlciwKaS5lLiBhcm91bmQgdGhl
IHBpbnMsIG5vdCBuZWNlc3NhcmlseSByZWxhdGVkIHRvIGFueSBzcGVjaWZpYwpoYXJkd2FyZSBi
bG9jay4KCkJ1dCBJIGd1ZXNzIGl0IGNvdWxkIGJlIHVzZWQgZm9yIGEgbGluZSB1c2VkIGJ5IHNv
bWUgZXRoZXJuZXQKaW50ZXJmYWNlLgoKQnV0IHRoZSBjb25maWcgaGVyZSBoYXBwZW5zIG9uIHRo
ZSBwaW4gY29udHJvbGxlciwgc28gYSBzcGVjaWZpYwpoYXJkd2FyZSBibG9jayBkaXN0aW5jdCBm
cm9tIGUuZy4gYW4gTU1DIGNvbnRyb2xsZXIgb3IgRXRoZXJuZXQKTUFDLCB0aGUgbGF0dGVyIGp1
c3QgaGF2ZSB0aGVpciBsaW5lcyByb3V0ZWQgdGhyb3VnaCBpdC4KClRoZSBwaW4gY29udHJvbGxl
ciB3aWxsIGhhbmRsZSBzb21lIHBpbiBuYW1lZCAiVFgiLCB3aGljaCBpcwpqdXN0IGEgc3RyaW5n
LCBhIHBpbiBjb250cm9sbGVyIGRvZXMgbm90IGtub3cgd2hhdCB0aGlzIG1lYW5zLAppZiBpdCBp
cyBhIFVBUlQgVFggb3IgYSBNQUMgVFggYnV0IGl0IGNhbiBjb25maWd1cmUgdGhlIHNrZXcKZGVs
YXkgb2YgdGhlIHBpbiBuYW1lZCBsaWtlIHNvLgoKWW91cnMsCkxpbnVzIFdhbGxlaWoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFp
bGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6
Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3Rt
MzIK
