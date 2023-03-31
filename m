Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 693ED6D1ACF
	for <lists+linux-stm32@lfdr.de>; Fri, 31 Mar 2023 10:51:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 18339C6905A;
	Fri, 31 Mar 2023 08:51:34 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com
 [209.85.128.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 33BA2C65E42
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Mar 2023 08:51:32 +0000 (UTC)
Received: by mail-yw1-f171.google.com with SMTP id
 00721157ae682-5456249756bso402895537b3.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Mar 2023 01:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680252691;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Cd/ibuQb3vn5g/cRqzfQk5lg+1/+bjO2UJjaxJoegBM=;
 b=LNzF1nUPzml+JIWoLM4lEKblSafQMhII427hBVE2fYE/IMt5PPojSCas5egWKg+KRc
 ygy0xOK7R4RMFkD7vxSF97RyeOmkq6giu97/zXrN5oKidigfgjHuuAX1t0IMgLo4oZBX
 edyYaG7ch29g3YuQziHv5Jft/d/9abqbc5SVvOGiFX9RiIq31R+jCgvgX/wevIDuGtDP
 lVYFMvg52OandlxR7J/XbiWCqOgv9i0qUzdZ50A6ItgiyqRbKtSt7NsOXjKBZco8abZe
 r8h5pQWUotUJdENoR3OCLdyJleXrOQqAExqWGqNIo/gAEedNYR8Bys3HYgJETvQ50stz
 vW4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680252691;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Cd/ibuQb3vn5g/cRqzfQk5lg+1/+bjO2UJjaxJoegBM=;
 b=z2IQW9zM3iHCpOHTtkZLcbVLy2HwkbxtIhHPDPhEzanC4iknmCe0RJ2raWuRW1A3J5
 hZ1BiyHk53A0WW7a/nTD+6y59cVXT/eWiTjghgbqKMlA0gRVSd7Z5bsABXbFcHPSQlF8
 O0uV5opIbSVJp6eg8YKaSCFkFtNfCJHaItRI92Lc/Y5x7YTn9Kn1kJu7tSyLEhOE5rUG
 kMqFstmqZvufU5cA5yUmKZrdknbLGkibJvNaCgUTMywyIuS7GmSJcX0ORWnbNG4A4sg4
 D1aDvZYdF5ShaSKYtKk3ofX+AG8jTe1gsN+A7/WVG7WCak/PqgMMrcfuJIFKj9THm7fq
 vjiw==
X-Gm-Message-State: AAQBX9eDMu2Nd2wUBK7kYvBZj41tj2VXGvMcm+8QoJifdRqBcckNLqBK
 csYRIJd3mCddrA8bwaKRcUlHhvQNpFbiI3TXDo6sVQ==
X-Google-Smtp-Source: AKy350a6johu/GITQvnR+QBZGVCy3Nh12i/zifBxULJFlWKoDA9ufP4RPovIeYwuYMYc7B3Q1GKWJeXUD/WzDxFgGl8=
X-Received: by 2002:a81:9993:0:b0:544:bbd2:74be with SMTP id
 q141-20020a819993000000b00544bbd274bemr5121733ywg.4.1680252691054; Fri, 31
 Mar 2023 01:51:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230331-topic-oxnas-upstream-remove-v1-0-5bd58fd1dd1f@linaro.org>
In-Reply-To: <20230331-topic-oxnas-upstream-remove-v1-0-5bd58fd1dd1f@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 31 Mar 2023 10:51:19 +0200
Message-ID: <CACRpkdY4GAzE5DbE4yOZ8sFspZoJWWZk+DYTHsKRmm1bpX7WGQ@mail.gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, linux-mtd@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-clk@vger.kernel.org,
 Richard Weinberger <richard@nod.at>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Russell King <linux@armlinux.org.uk>, linux-stm32@st-md-mailman.stormreply.com,
 Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>, Arnd Bergmann <arnd@arndb.de>,
 linux-pm@vger.kernel.org, linux-gpio@vger.kernel.org, soc@kernel.org,
 Rob Herring <robh+dt@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Stephen Boyd <sboyd@kernel.org>, netdev@vger.kernel.org,
 Sebastian Reichel <sre@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Marc Zyngier <maz@kernel.org>,
 Olof Johansson <olof@lixom.net>, "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH RFC 00/20] ARM: oxnas support removal
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

T24gRnJpLCBNYXIgMzEsIDIwMjMgYXQgMTA6MzTigK9BTSBOZWlsIEFybXN0cm9uZwo8bmVpbC5h
cm1zdHJvbmdAbGluYXJvLm9yZz4gd3JvdGU6Cgo+IFdpdGggWzFdIHJlbW92aW5nIE1QQ29yZSBT
TVAgc3VwcG9ydCwgdGhpcyBtYWtlcyB0aGUgT1g4MjAgYmFyZWx5IHVzYWJsZSwKPiBhc3NvY2lh
dGVkIHdpdGggYSBjbGVhciBsYWNrIG9mIG1haW50YWluYW5jZSwgZGV2ZWxvcG1lbnQgYW5kIG1p
Z3JhdGlvbiB0bwo+IGR0LXNjaGVtYSBpdCdzIGNsZWFyIHRoYXQgTGludXggc3VwcG9ydCBmb3Ig
T1g4MTAgYW5kIE9YODIwIHNob3VsZCBiZSByZW1vdmVkLgo+Cj4gSW4gYWRkaXRpb24sIHRoZSBP
WDgxMCBoYXNuJ3QgYmVlbiBib290ZWQgZm9yIHllYXJzIGFuZCBpc24ndCBldmVuIHByZXNlbnQK
PiBpbiBhbiBBUk0gY29uZmlnIGZpbGUuCj4KPiBGb3IgdGhlIE9YODIwLCBsYWNrIG9mIFVTQiBh
bmQgU0FUQSBzdXBwb3J0IG1ha2VzIHRoZSBwbGF0Zm9ybSBub3QgdXNhYmxlCj4gaW4gdGhlIGN1
cnJlbnQgTGludXggc3VwcG9ydCBhbmQgcmVsaWVzIG9uIG9mZi10cmVlIGRyaXZlcnMgaGFja2Vk
IGZyb20gdGhlCj4gdmVuZG9yIChkZWZ1bmN0IGZvciB5ZWFycykgc291cmNlcy4KPgo+IFRoZSBs
YXN0IHVzZXJzIGFyZSBpbiB0aGUgT3BlbldSVCBkaXN0cmlidXRpb24sIGFuZCB0b2RheSdzIHJl
bW92YWwgbWVhbnMKPiBzdXBwb3J0IHdpbGwgc3RpbGwgYmUgaW4gc3RhYmxlIDYuMSBMVFMga2Vy
bmVsIHVudGlsIGVuZCBvZiAyMDI2Lgo+Cj4gSWYgc29tZW9uZSB3YW50cyB0byB0YWtlIG92ZXIg
dGhlIGRldmVsb3BtZW50IGV2ZW4gd2l0aCBsYWNrIG9mIFNNUCwgSSdsbAo+IGJlIGhhcHB5IHRv
IGhhbmQgb2ZmIG1haW50YWluYW5jZS4KPgo+IFRoZSBwbGFuIGlzIHRvIGFwcGx5IHRoZSBmaXJz
dCA0IHBhdGNoZXMgZmlyc3QsIHRoZW4gdGhlIGRyaXZlcnMKPiBmb2xsb3dlZCBieSBiaW5kaW5n
cy4gRmluYWxseSB0aGUgTUFJTlRBSU5BTkNFIGVudHJ5IGNhbiBiZSByZW1vdmVkLgo+Cj4gSSdt
IG5vdCBzdXJlIGFib3V0IHRoZSBwcm9jZXNzIG9mIGJpbmRpbmdzIHJlbW92YWwsIGJ1dCBwZXJo
YXBzIHRoZSBiaW5kaW5ncwo+IHNob3VsZCBiZSBtYXJrZWQgYXMgZGVwcmVjYXRlZCBmaXJzdCB0
aGVuIHJlbW92ZWQgbGF0ZXIgb24gPwo+Cj4gSXQgaGFzIGJlZW4gYSBmdW4gdGltZSBhZGRpbmcg
c3VwcG9ydCBmb3IgdGhpcyBhcmNoaXRlY3R1cmUsIGJ1dCBpdCdzIHRpbWUKPiB0byBnZXQgb3Zl
ciEKPgo+IFBhdGNoIDIgb2J2aW91c2x5IGRlcGVuZHMgb24gWzFdLgo+Cj4gWzFdIGh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL2FsbC8yMDIzMDMyNzEyMTMxNy40MDgxODE2LTEtYXJuZEBrZXJuZWwu
b3JnLwo+Cj4gU2lnbmVkLW9mZi1ieTogTmVpbCBBcm1zdHJvbmcgPG5laWwuYXJtc3Ryb25nQGxp
bmFyby5vcmc+CgpBY2tlZC1ieTogTGludXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8u
b3JnPgoKWW91cnMsCkxpbnVzIFdhbGxlaWoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
