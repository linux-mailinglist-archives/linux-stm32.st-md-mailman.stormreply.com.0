Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EDAF95CB69
	for <lists+linux-stm32@lfdr.de>; Fri, 23 Aug 2024 13:33:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0ECC8C71289;
	Fri, 23 Aug 2024 11:33:30 +0000 (UTC)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com
 [209.85.219.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 300C9C71287
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Aug 2024 11:33:23 +0000 (UTC)
Received: by mail-yb1-f169.google.com with SMTP id
 3f1490d57ef6-e13d5cbc067so1882707276.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Aug 2024 04:33:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724412800; x=1725017600;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LMEH/Ww3lGUsG6S84gzaZZHFTkxZjOmIG5r+YsgcND4=;
 b=Wf64BK1G83wFpH2XNP9RWjBNuh8WnXZflBHhxJUDsK0J0t26i8M4BfXWM05ySTUvpq
 mFiCSAckeKy5YnRpkBePjepjZt5jasMjjBrMqRLSafwn/2qs9vAs8fcODcsjwez/33G5
 2mDsswsYsfjqcM5IHCE7N7qPceY0IneVSPJ1EkkWzMvUOd7iQzASRasIrSxDunyysq/p
 ZYwBg7Zg4x5BVJYffhgSphUIcife2/gII4o33V8xDtZlx0+AskQnDm2PGHP44akFBg5Y
 1aJdXOdCVddn0qhV9b0QTz0ps2FkU3Xz42j7/2O0Q4vHXFCjGeFf96U0sCzw3EXn11R1
 1THg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6arEYoXNE9NI678R6gASX8tsTrXb8AdFKCBIVIJtS9pagb7kAHk9EAv9F1OinB18Syhyx89doiEiOUQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyK+sk+hbb7i3VdEhbzqTH1dwhbJZO9gSkew1VCNE9nSPPb3qgf
 Ql+KQ3XiQJZzCbUntghksrUJhf6bvacFfg7iQrEyA+DVz6OSESJa4mUA6/au
X-Google-Smtp-Source: AGHT+IHIuzoZIMo4Fp+Ocj+hclciWfXcmPjDrncqBfgVvQ0DWfscryKchHwuM8x5rX4TcFQWRI0Ajg==
X-Received: by 2002:a05:690c:2f86:b0:6ae:7b2c:aefa with SMTP id
 00721157ae682-6c6267c5df7mr15814197b3.21.1724412799686; 
 Fri, 23 Aug 2024 04:33:19 -0700 (PDT)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com.
 [209.85.128.177]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-6c39d3a9d1dsm5208347b3.91.2024.08.23.04.33.19
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Aug 2024 04:33:19 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-6b59a67ba12so18245777b3.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Aug 2024 04:33:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUa+aLVqRmXZXGtGUxCs6xbN/fwzZDVPsI1IuQjJ5qlTE6VUf4XFmDEC8NIaGWdqB8RLrposiCCNs0hdA==@st-md-mailman.stormreply.com
X-Received: by 2002:a05:690c:2845:b0:6c1:699f:cf8 with SMTP id
 00721157ae682-6c625e27412mr19164117b3.14.1724412798745; Fri, 23 Aug 2024
 04:33:18 -0700 (PDT)
MIME-Version: 1.0
References: <20240818173014.122073-1-krzysztof.kozlowski@linaro.org>
 <20240818173014.122073-3-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240818173014.122073-3-krzysztof.kozlowski@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 23 Aug 2024 13:33:06 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXT2r8mTOye5S4JKZbXcBmavwrP96oe5aVnORm8UUqONA@mail.gmail.com>
Message-ID: <CAMuHMdXT2r8mTOye5S4JKZbXcBmavwrP96oe5aVnORm8UUqONA@mail.gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
 Michael Turquette <mturquette@baylibre.com>, linux-mips@vger.kernel.org,
 linux-clk@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Magnus Damm <magnus.damm@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Elaine Zhang <zhangqing@rock-chips.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 linux-arm-kernel@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>,
 patches@opensource.cirrus.com,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Serge Semin <fancer.lancer@gmail.com>, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [Linux-stm32] [PATCH 3/5] dt-bindings: clock: renesas,
	cpg-clocks: add top-level constraints
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

T24gU3VuLCBBdWcgMTgsIDIwMjQgYXQgNzozMOKAr1BNIEtyenlzenRvZiBLb3psb3dza2kKPGty
enlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4gd3JvdGU6Cj4gUHJvcGVydGllcyB3aXRoIHZh
cmlhYmxlIG51bWJlciBvZiBpdGVtcyBwZXIgZWFjaCBkZXZpY2UgYXJlIGV4cGVjdGVkIHRvCj4g
aGF2ZSB3aWRlc3QgY29uc3RyYWludHMgaW4gdG9wLWxldmVsICJwcm9wZXJ0aWVzOiIgYmxvY2sg
YW5kIGZ1cnRoZXIKPiBjdXN0b21pemVkIChuYXJyb3dlZCkgaW4gImlmOnRoZW46Ii4gIEFkZCBt
aXNzaW5nIHRvcC1sZXZlbCBjb25zdHJhaW50cwo+IGZvciBjbG9ja3MgYW5kIGNsb2NrLW91dHB1
dC1uYW1lcy4KPgo+IFNpZ25lZC1vZmYtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyenlzenRv
Zi5rb3psb3dza2lAbGluYXJvLm9yZz4KClJldmlld2VkLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4g
PGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPgppLmUuIHdpbGwgcXVldWUgaW4gcmVuZXNhcy1jbGsg
Zm9yIHY2LjEyLgoKR3J7b2V0amUsZWV0aW5nfXMsCgogICAgICAgICAgICAgICAgICAgICAgICBH
ZWVydAoKLS0gCkdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5
b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcKCkluIHBlcnNvbmFsIGNvbnZlcnNhdGlv
bnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQKd2hl
biBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBz
b21ldGhpbmcgbGlrZSB0aGF0LgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExp
bnVzIFRvcnZhbGRzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
