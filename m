Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2420077B3B9
	for <lists+linux-stm32@lfdr.de>; Mon, 14 Aug 2023 10:17:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CCE4DC6B472;
	Mon, 14 Aug 2023 08:17:15 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A6372C6A613
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Aug 2023 08:17:14 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-318015ade49so3679064f8f.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Aug 2023 01:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692001034; x=1692605834;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=e3CFhGYYBnmc/7BGz71n+APKSrpv4uhL75vkasqQJ4o=;
 b=iQkwPbQN3DsEDOtJk3CJaT+avcrhQmZRMrmuydv4HhzxFDJqxw9vGX/2VyMkUMA1wL
 jk+ff37u88MZw/dBof5+1vAQrQoUsZRVs3rlTi0p0x633eGOAj0RobNrihc/vuOa7pHG
 6eAH/89w+vFWZOFZKuerCFUtKJltGh7FmZ8pO7PYlqTZ0a/VC8XtnkggkA2JAFhJv0Bq
 XuPNI1tM13nTx7WnwNrHP7EJRu30NfUNL14KiE7pfsaKcQNbGHrbWnb6HNFNCHTwS0HG
 GcFhASxwqz+vqOX7V/nyAXR1aQ+K6hWKSIyZVhA20KJfGBBz8iVnsEyNGQ2cl706sOdd
 157Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692001034; x=1692605834;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=e3CFhGYYBnmc/7BGz71n+APKSrpv4uhL75vkasqQJ4o=;
 b=HjvsMOLpTnIv+qYCUpXMCe4jBU5KuYZ5vveTKWO85qu8iKPDlPS1DXNnaxoRgdrpnX
 5T0Lb4A8NkI49jW5ezcq7W3Kv/VTTYCcZWPt4F+rayVRFTafE4IJYmNJ5etLL6Yd1hB7
 ccFQrZ+z3WHZq5SRcIcsCwdV+CldKZP2JfMT9AIHlDhwOxvZNVACBup5yJTOUW0t87Zu
 +9JulW2fVWqGnbxP//4NxrV8ba9rLP+gVkMpUv0ZLwy7PRE/f0Qs+FS+6q3H0gVhVJth
 sydvPw+A7eIeqSPM/7lMZas6qAY5S10vzDta0ydL+693zrK6pUA2Ul2lpwM17mMJRojN
 S5gg==
X-Gm-Message-State: AOJu0YyfNNfe6d7SUneD0xpYpBJv6jvQaZSvAKYhSOjgGcYXcxTwc19C
 FxIAG4hBDMk5t53eBYjGa5T1xA==
X-Google-Smtp-Source: AGHT+IEXbvgn6LW0yU+nkhHkcfkiCGwjUBAMcP+fKEDjyEF9E2V8kNEM6NVC/BjPKkIdX0hZ6fKCKg==
X-Received: by 2002:adf:f24e:0:b0:319:7b50:cf5e with SMTP id
 b14-20020adff24e000000b003197b50cf5emr880096wrp.19.1692001034196; 
 Mon, 14 Aug 2023 01:17:14 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:a3d8:b217:d82c:9bc0?
 ([2a01:e0a:982:cbb0:a3d8:b217:d82c:9bc0])
 by smtp.gmail.com with ESMTPSA id
 x13-20020a5d444d000000b00317f29ad113sm13580045wrr.32.2023.08.14.01.17.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Aug 2023 01:17:13 -0700 (PDT)
Message-ID: <ff999018-8490-0f58-0a50-e82f1effce5c@linaro.org>
Date: Mon, 14 Aug 2023 10:17:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: neil.armstrong@linaro.org
Content-Language: en-US
To: Linus Walleij <linus.walleij@linaro.org>
References: <20230630-topic-oxnas-upstream-remove-v2-0-fb6ab3dea87c@linaro.org>
 <20230630-topic-oxnas-upstream-remove-v2-9-fb6ab3dea87c@linaro.org>
 <a9074f2d-ffa2-477f-e3b5-2c7d213ec72c@linaro.org>
 <CACRpkdbMy=JWAgybtimQXJRQ7jsVZ1g-DfqjryjP31JT9f=Prg@mail.gmail.com>
Organization: Linaro Developer Services
In-Reply-To: <CACRpkdbMy=JWAgybtimQXJRQ7jsVZ1g-DfqjryjP31JT9f=Prg@mail.gmail.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, linux-mtd@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-clk@vger.kernel.org,
 Marc Zyngier <maz@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, Jose Abreu <joabreu@synopsys.com>,
 Daniel Golle <daniel@makrotopia.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-pm@vger.kernel.org, linux-gpio@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Andy Shevchenko <andy@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 netdev@vger.kernel.org, Sebastian Reichel <sre@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Weinberger <richard@nod.at>, linux-oxnas@groups.io,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH v2 09/15] pinctrl: pinctrl-oxnas: remove
 obsolete pinctrl driver
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
Reply-To: neil.armstrong@linaro.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

T24gMDcvMDgvMjAyMyAxNTo0NCwgTGludXMgV2FsbGVpaiB3cm90ZToKPiBPbiBNb24sIEp1bCAz
MSwgMjAyMyBhdCA0OjQ04oCvUE0gTmVpbCBBcm1zdHJvbmcKPiA8bmVpbC5hcm1zdHJvbmdAbGlu
YXJvLm9yZz4gd3JvdGU6Cj4+IE9uIDMwLzA2LzIwMjMgMTg6NTgsIE5laWwgQXJtc3Ryb25nIHdy
b3RlOgo+Pj4gRHVlIHRvIGxhY2sgb2YgbWFpbnRlbmFuY2UgYW5kIHN0YWxsIG9mIGRldmVsb3Bt
ZW50IGZvciBhIGZldyB5ZWFycyBub3csCj4+PiBhbmQgc2luY2Ugbm8gbmV3IGZlYXR1cmVzIHdp
bGwgZXZlciBiZSBhZGRlZCB1cHN0cmVhbSwgcmVtb3ZlIHN1cHBvcnQKPj4+IGZvciBPWDgxMCBh
bmQgT1g4MjAgcGluY3RybCAmIGdwaW8uCj4+Cj4+IERvIHlvdSBwbGFuIHRvIHRha2UgcGF0Y2hl
cyA5LCAxMCAmIDExIG9yIHNob3VsZCBJIGZ1bm5lbCB0aGVtIHZpYSBhIGZpbmFsIFNvQyBQUiA/
Cj4gCj4gSSB0cmllZCB0byBhcHBseSB0aGVtIHRvIHRoZSBwaW5jdHJsIHRyZWUgYnV0IHRoYXQg
ZmFpbHMgLi4uCj4gQ291bGQgeW91IHJlYmFzZSBwYXRjaGVzIDksMTAsMTEgb250byBteSAiZGV2
ZWwiIGJyYW5jaAo+IGFuZCBzZW5kIHNlcGFyYXRlbHk/IFRoZW4gSSB3aWxsIGFwcGx5IHRoZW0g
cmlnaHQgYXdheS4KClN1cmUsIHNlbnQgdGhlbSByaWdodCBub3chCgpUaHgsCk5laWwKCj4gCj4g
WW91cnMsCj4gTGludXMgV2FsbGVpagoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
