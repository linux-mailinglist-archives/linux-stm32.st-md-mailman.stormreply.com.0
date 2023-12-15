Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C878167C1
	for <lists+linux-stm32@lfdr.de>; Mon, 18 Dec 2023 08:53:03 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4C2BBC6DD71;
	Mon, 18 Dec 2023 07:53:03 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1BB82C6A5EA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Dec 2023 20:48:11 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-40c6736d10fso13220185e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Dec 2023 12:48:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jrtc27.com; s=gmail.jrtc27.user; t=1702673290; x=1703278090;
 darn=st-md-mailman.stormreply.com; 
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XkbA3FPlNo1r+U6O6Ao4SqV6N3qGQHbqxTmiKmAK7ww=;
 b=i+8QfayZKBHD/jIagGntaBp2X76rMc8OE/rJPX72+uhKgls+XQlK6brYWly1mOEqxE
 ZuWKtBp9m6hMWiuSzB5owFLmJkoYS2xaHBghQdsoH9uWrbUF6cJLqN7cxyOtpgS/Tni+
 UUOjgrhsb2OsbGRH3gKyvhT3oTz9RTTDD9YtRIKx5yMFqYv4RMdUlNP6ECFVQmux1zEM
 qKh18fsY11aOEPZm6GYHNRJ3twLy6LMZaBPhPX7J/eSvARaM6iiguU/HoZqTKHowiNjs
 DyPb6B6ny+fo/JfkTB7Cus8K70XahFR/4fZk/IBb6ivoLargsVI07O3cWfjS9fajea+T
 514Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702673290; x=1703278090;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XkbA3FPlNo1r+U6O6Ao4SqV6N3qGQHbqxTmiKmAK7ww=;
 b=Od9WmnWVnG/0F+tiJ2pnwF8Rn9wWVnxr5EJRpzUi+m6Sf8xJ2Ol//4xzLaKPLHEMfK
 Wmf9/Nttd7A7CnnoZdH2QlGouwUZx/2IPX/Q+ZxV4GCNm+Od6TYrjbejR5JeOz7UcQoy
 hz1209IxhMu0wubWznr1Ht8LcSsm5lg18Yh7D9LfZd+Rymmw8PmELA3imd7GOQNUHpMH
 F4lswcMEj1ftJb+ohTKBZnDAbpp2E92HSJ4V/TqFgdhcXPAnSfHOCjDHVkQyEnZI7XO0
 Foq9600dYrg3V3LLitSQaixSmlgbfbr8k4QdyDgfeNM2r84eh0Eaw1k3prFx7jIiqUtt
 uxMA==
X-Gm-Message-State: AOJu0YxCqn+Ckt2Qp4ffqDl4G/VHyMND0yJEF6Vaf/iSFbUmvM+g4euP
 xFLvtt55lm2xtA4wPveZM3sm5g==
X-Google-Smtp-Source: AGHT+IHmyxYXA7TlsEHSBZ2x2Q3ZtE6ks/hZmTMZ9YZV6t1R+oDgMn/QNCqxM1cqDO/CM4Y9PqXh7w==
X-Received: by 2002:a05:600c:808b:b0:40b:5e21:dd24 with SMTP id
 ew11-20020a05600c808b00b0040b5e21dd24mr6411929wmb.82.1702673290406; 
 Fri, 15 Dec 2023 12:48:10 -0800 (PST)
Received: from smtpclient.apple ([131.111.5.246])
 by smtp.gmail.com with ESMTPSA id
 p8-20020a05600c358800b0040b40468c98sm31891322wmq.10.2023.12.15.12.48.09
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 15 Dec 2023 12:48:09 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.200.91.1.1\))
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <20231215204050.2296404-3-cristian.ciocaltea@collabora.com>
Date: Fri, 15 Dec 2023 20:47:58 +0000
Message-Id: <A7C96942-07CB-40FD-AAAA-4A8947DEE7CA@jrtc27.com>
References: <20231215204050.2296404-1-cristian.ciocaltea@collabora.com>
 <20231215204050.2296404-3-cristian.ciocaltea@collabora.com>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
X-Mailer: Apple Mail (2.3774.200.91.1.1)
X-Mailman-Approved-At: Mon, 18 Dec 2023 07:52:59 +0000
Cc: Emil Renner Berthing <kernel@esmil.dk>,
 Michael Turquette <mturquette@baylibre.com>,
 Eric Dumazet <edumazet@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, kernel@collabora.com,
 linux-clk@vger.kernel.org, Hal Feng <hal.feng@starfivetech.com>,
 Jose Abreu <joabreu@synopsys.com>, Samin Guo <samin.guo@starfivetech.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Richard Cochran <richardcochran@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 LKML <linux-kernel@vger.kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH v3 2/9] dt-bindings: net: starfive,
 jh7110-dwmac: Add JH7100 SoC compatible
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

T24gMTUgRGVjIDIwMjMsIGF0IDIwOjQwLCBDcmlzdGlhbiBDaW9jYWx0ZWEgPGNyaXN0aWFuLmNp
b2NhbHRlYUBjb2xsYWJvcmEuY29tPiB3cm90ZToKPiAKPiBUaGUgU3lub3BzeXMgRGVzaWduV2Fy
ZSBNQUMgZm91bmQgb24gU3RhckZpdmUgSkg3MTAwIFNvQyBpcyBtb3N0bHkKPiBzaW1pbGFyIHRv
IHRoZSBuZXdlciBKSDcxMTAsIGJ1dCBpdCByZXF1aXJlcyBvbmx5IHR3byBpbnRlcnJ1cHRzIGFu
ZCBhCj4gc2luZ2xlIHJlc2V0IGxpbmUsIHdoaWNoIGlzICdhaGInIGluc3RlYWQgb2YgdGhlIGNv
bW1vbmx5IHVzZWQKPiAnc3RtbWFjZXRoJy4KPiAKPiBTaW5jZSB0aGUgY29tbW9uIGJpbmRpbmcg
J3NucHMsZHdtYWMnIGFsbG93cyBzZWxlY3RpbmcgJ2FoYicgb25seSBpbgo+IGNvbmp1bmN0aW9u
IHdpdGggJ3N0bW1hY2V0aCcsIGV4dGVuZCB0aGUgbG9naWMgdG8gYWxzbyBwZXJtaXQgZXhjbHVz
aXZlCj4gdXNhZ2Ugb2YgdGhlICdhaGInIHJlc2V0IG5hbWUuICBUaGlzIGVuc3VyZXMgdGhlIGZv
bGxvd2luZyB1c2UgY2FzZXMgYXJlCj4gc3VwcG9ydGVkOgo+IAo+ICBKSDcxMTA6IHJlc2V0LW5h
bWVzID0gInN0bW1hY2V0aCIsICJhaGIiOwo+ICBKSDcxMDA6IHJlc2V0LW5hbWVzID0gImFoYiI7
Cj4gIG90aGVyOiAgcmVzZXQtbmFtZXMgPSAic3RtbWFjZXRoIjsKPiAKPiBBbHNvIG5vdGUgdGhl
IG5lZWQgdG8gdXNlIGEgZGlmZmVyZW50IGR3bWFjIGZhbGxiYWNrLCBhcyB2NS4yMCBhcHBsaWVz
Cj4gdG8gSkg3MTEwIG9ubHksIHdoaWxlIEpINzEwMCByZWxpZXMgb24gdjMuN3guCj4gCj4gU2ln
bmVkLW9mZi1ieTogQ3Jpc3RpYW4gQ2lvY2FsdGVhIDxjcmlzdGlhbi5jaW9jYWx0ZWFAY29sbGFi
b3JhLmNvbT4KPiAtLS0KPiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvc25wcyxkd21hYy55
YW1sICAgfCAgMyArLQo+IC4uLi9iaW5kaW5ncy9uZXQvc3RhcmZpdmUsamg3MTEwLWR3bWFjLnlh
bWwgICB8IDc0ICsrKysrKysrKysrKystLS0tLS0KPiAyIGZpbGVzIGNoYW5nZWQsIDU1IGluc2Vy
dGlvbnMoKyksIDIyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvbmV0L3NucHMsZHdtYWMueWFtbCBiL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvc25wcyxkd21hYy55YW1sCj4gaW5kZXggNWMyNzY5ZGM2
ODlhLi5jMTM4MGZmMWMwNTQgMTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL25ldC9zbnBzLGR3bWFjLnlhbWwKPiArKysgYi9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvbmV0L3NucHMsZHdtYWMueWFtbAo+IEBAIC05NSw2ICs5NSw3IEBAIHBy
b3BlcnRpZXM6Cj4gICAgICAgICAtIHNucHMsZHdtYWMtNS4yMAo+ICAgICAgICAgLSBzbnBzLGR3
eGdtYWMKPiAgICAgICAgIC0gc25wcyxkd3hnbWFjLTIuMTAKPiArICAgICAgICAtIHN0YXJmaXZl
LGpoNzEwMC1kd21hYwo+ICAgICAgICAgLSBzdGFyZml2ZSxqaDcxMTAtZHdtYWMKPiAKPiAgIHJl
ZzoKPiBAQCAtMTQ2LDcgKzE0Nyw3IEBAIHByb3BlcnRpZXM6Cj4gICByZXNldC1uYW1lczoKPiAg
ICAgbWluSXRlbXM6IDEKPiAgICAgaXRlbXM6Cj4gLSAgICAgIC0gY29uc3Q6IHN0bW1hY2V0aAo+
ICsgICAgICAtIGVudW06IFtzdG1tYWNldGgsIGFoYl0KPiAgICAgICAtIGNvbnN0OiBhaGIKCkni
gJltIG5vdCBzbyB3ZWxsLXZlcnNlZCBpbiB0aGUgWUFNTCBiaW5kaW5ncywgYnV0IHdvdWxkIHRo
aXMgbm90IGFsbG93CnJlc2V0LW5hbWVzID0gImFoYiIsICJhaGIiPwoKSmVzcwoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGlu
ZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9z
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
