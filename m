Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C3592C6F6B3
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Nov 2025 15:49:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 74F50C36B3E;
	Wed, 19 Nov 2025 14:49:44 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C1CF8C36B2A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Nov 2025 14:49:42 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-5969c5af23bso476287e87.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Nov 2025 06:49:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763563781; x=1764168581;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=U4rPsaXkkkPPqP8F89aStRjGcZr5tE7ulQ3b9FN2Uak=;
 b=DFuZsbYYnp0eNnzUoOGRkY52lcSPN38eQnUfvxmWs8eJNYzPTWQu5BolSdp2tD64my
 P5qMvOtrZi7pZTUv1rzYN39Smp5oyp+qkoLarfyquUtMHHHFooCZCRN2JEzh25abv3m5
 vyBmAmkdR9Vz6vraT8BHoudAbWnbYjmbHWOTG2k6y3RUQIS2yEgMgclDZlPa/KtnuFBr
 MY6ejAV5p4HfG8KWfuZEPAwiGaCNgkRhvNxW8dfBEwecyGaGhFPjb3lUHnXSaQLuste4
 bMZc6HOkY8MvKP4xj+5L1+kT3hPiAHWhonyj78qHaf3L4LutqKRxnJ1lk+jh2SrxWekQ
 /WAg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX672FA2W4YgKA/W+Ip9VkI20yOCIrGNL9Wlj5si/qVYYP/lxLq1XnJUwU9DaGEF6SE+gGSmT9QZwkRQw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwERhyY9aT3zOJPY+y6Oyi7l1DhbHe5l+9VzFUW6tJFRV5o/6Uw
 AzWeaAgAPT3e3Br2ykajFpM30vkj984gcgX1zRGRs7ZS0Q2qbgx9nLwUV8RzZ06I
X-Gm-Gg: ASbGncsR830X8J73lc+IOBkxOYq8ybsyo5asHeMgsGGxYCpfWTndoXWFATE5zLabRrY
 2G4ugqKfBaHjY0wd5d1Ir3EjZy+hU4rVC8Yb5Bp/AKokmZSA4rHmuCawfXU4j7hoRzcWliSyym9
 urQzYjtxmK5SOCFOAMIPnWUMZDRjL7RYS8YrsB9L+oOVoByiAKWV9oU7/m2ZUUcmIScD/VeKdrF
 hejnuU6+f+sMq1OnZ3R8FEAWxLNRqqDizhwu8Miit2oYwXEa3JF0VE5I5oKKDz74X2ZL0l8PHZ8
 KnQLTTHVzlRXmzG9M7/BRj8rgwhuqKl//Ss8+TdSRoSk7kzg7chCqRbj+pRHwOkCrckZdce5a6U
 XqMaNd7pkCapw7wh87irfJYIok4X5hZokcrfLS82N3kJJXGZvNkRLGrE4RV4+vMcAKIekemZwJS
 m21t5DpaHjxMUKWbVMyg3sXcL6V7WPSE+LeMahjxFgAPV2MQZfChKraA==
X-Google-Smtp-Source: AGHT+IHdchzqFV6wasmv7lyt0UOT2mAdWXDqTJk1bQQruLmLw9ZTqaqAtPZkkN7aRLvKwDjPFT1BMQ==
X-Received: by 2002:a05:6512:3e0a:b0:594:2db8:312b with SMTP id
 2adb3069b0e04-5958419f5fbmr7097288e87.7.1763563780790; 
 Wed, 19 Nov 2025 06:49:40 -0800 (PST)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com.
 [209.85.208.172]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-37b9ce080a6sm41587231fa.4.2025.11.19.06.49.40
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Nov 2025 06:49:40 -0800 (PST)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-37a5bc6b491so53412831fa.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Nov 2025 06:49:40 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXzDPjx859bKybQo0ZEKUtrfxUN0C7Rhr+bwRG0ny2S+wI2thLOiKCa2KB3j/Tsvgmj8Cpy3dAPT4D7UQ==@st-md-mailman.stormreply.com
X-Received: by 2002:a2e:9ace:0:b0:372:904d:add4 with SMTP id
 38308e7fff4ca-37babd35f8amr45635351fa.28.1763563413779; Wed, 19 Nov 2025
 06:43:33 -0800 (PST)
MIME-Version: 1.0
References: <aR2V0Kib7j0L4FNN@shell.armlinux.org.uk>
 <E1vLf2U-0000000FMN2-0SLg@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1vLf2U-0000000FMN2-0SLg@rmk-PC.armlinux.org.uk>
From: Chen-Yu Tsai <wens@csie.org>
Date: Wed, 19 Nov 2025 22:43:18 +0800
X-Gmail-Original-Message-ID: <CAGb2v65syu47YAy8-24LDXt1MC2K7r+weOyCWn5fZzRgSFhnDA@mail.gmail.com>
X-Gm-Features: AWmQ_bnEwqpydG-ZRtqWc8I4l30DitJuwNrACYzTdhyRCjLGsAnpeFb-cKD8BLA
Message-ID: <CAGb2v65syu47YAy8-24LDXt1MC2K7r+weOyCWn5fZzRgSFhnDA@mail.gmail.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Drew Fustini <fustini@kernel.org>, s32@nxp.com,
 Heiko Stuebner <heiko@sntech.de>, Andrew Lunn <andrew@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Guo Ren <guoren@kernel.org>,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-rockchip@lists.infradead.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Keguang Zhang <keguang.zhang@gmail.com>, linux-sunxi@lists.linux.dev,
 Jan Petrous <jan.petrous@oss.nxp.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Fu Wei <wefu@redhat.com>
Subject: Re: [Linux-stm32] [PATCH net-next 1/3] net: stmmac: pass struct
 device to init()/exit() methods
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
Reply-To: wens@csie.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

T24gV2VkLCBOb3YgMTksIDIwMjUgYXQgNjowNOKAr1BNIFJ1c3NlbGwgS2luZyAoT3JhY2xlKQo8
cm1rK2tlcm5lbEBhcm1saW51eC5vcmcudWs+IHdyb3RlOgo+Cj4gQXMgc3RydWN0IHBsYXRfc3Rt
bWFjZW5ldF9kYXRhIGlzIG5vdCBwbGF0Zm9ybV9kZXZpY2Ugc3BlY2lmaWMsIHBhc3MKPiBhIHN0
cnVjdCBkZXZpY2UgaW50byB0aGUgaW5pdCgpIGFuZCBleGl0KCkgbWV0aG9kcyB0byBhbGxvdyB0
aGVtIHRvCj4gYmVjb21lIGluZGVwZW5kZW50IG9mIHRoZSB1bmRlcmx5aW5nIGRldmljZS4KPgo+
IFNpZ25lZC1vZmYtYnk6IFJ1c3NlbGwgS2luZyAoT3JhY2xlKSA8cm1rK2tlcm5lbEBhcm1saW51
eC5vcmcudWs+Cj4gLS0tCj4gIC4uLi9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1hbmFy
aW9uLmMgICB8ICA0ICstLQo+ICAuLi4vZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtZWlj
NzcwMC5jICAgfCAgNCArLS0KPiAgLi4uL2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLWxv
b25nc29uMS5jIHwgMTIgKysrKy0tLS0KPiAgLi4uL3N0bWljcm8vc3RtbWFjL2R3bWFjLXJlbmVz
YXMtZ2JldGguYyAgICAgIHwgIDQgKy0tCj4gIC4uLi9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1t
YWMvZHdtYWMtczMyLmMgICB8IDE0ICsrKysrLS0tLS0KPiAgLi4uL2V0aGVybmV0L3N0bWljcm8v
c3RtbWFjL2R3bWFjLXNvY2ZwZ2EuYyAgIHwgIDIgKy0KPiAgLi4uL25ldC9ldGhlcm5ldC9zdG1p
Y3JvL3N0bW1hYy9kd21hYy1zdGkuYyAgIHwgIDQgKy0tCgoKPiAgLi4uL25ldC9ldGhlcm5ldC9z
dG1pY3JvL3N0bW1hYy9kd21hYy1zdW44aS5jIHwgMTAgKysrLS0tLQo+ICAuLi4vbmV0L2V0aGVy
bmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLXN1bnhpLmMgfCAgNCArLS0KCkZvciBzdW44aSAvIHN1
bnhpLAoKQWNrZWQtYnk6IENoZW4tWXUgVHNhaSA8d2Vuc0BrZXJuZWwub3JnPgoKPiAgLi4uL25l
dC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy10aGVhZC5jIHwgIDIgKy0KPiAgLi4uL2V0
aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0bW1hY19wbGF0Zm9ybS5jIHwgMjggKysrKysrKysrKy0t
LS0tLS0tLQo+ICBpbmNsdWRlL2xpbnV4L3N0bW1hYy5oICAgICAgICAgICAgICAgICAgICAgICAg
fCAgNCArLS0KPiAgMTIgZmlsZXMgY2hhbmdlZCwgNDcgaW5zZXJ0aW9ucygrKSwgNDUgZGVsZXRp
b25zKC0pCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXN0bTMyCg==
