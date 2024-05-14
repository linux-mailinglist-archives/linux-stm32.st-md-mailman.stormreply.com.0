Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 59EA08C4D78
	for <lists+linux-stm32@lfdr.de>; Tue, 14 May 2024 10:07:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 131ACC5E2D1;
	Tue, 14 May 2024 08:07:24 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com
 [209.85.128.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4ABE5C5E2CB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 May 2024 08:07:17 +0000 (UTC)
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-61b68644ab4so49744087b3.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 May 2024 01:07:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715674035; x=1716278835;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mAZGt+1Rc/qtuBUqNnzX2rBGCR5XoalBEqWaRtcOihM=;
 b=CAwul32th5Dr6SILoi8WgoM2irO+IT7uCx4GrzcJIPkqlbsBUCTTzBrEvqdcQGrQYK
 73iaRXFzDWEO/R+/xcta8K+B2ieOUyX4FvSk0Wi1A9CIkQIzjgvmpzGJtiS5IEKcApoP
 /7ac7q8mY0z06/PdwtxQK06cJDJh7FxkHy3D6NWgv6mcDE7UUwrz8FkpfKYLlgwfzmA9
 KjB41M9qCBy7sEznhKoJxpxnt3NQXlCnII8a8l7gqBgpesoiQrqW4z07slIU6PJwGJBA
 ObXKNTcq55HtooLJKCw9clydv8lwFfdWIZ+NKpleNmoCqnCww+seG6JcOLMu2k7cXvXW
 5xgQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNgEsHpJsdPFH5iB/t665pWCkkrNzhx2fQhh84YpMfVhVo8zDyQqZ6x3Xzid91jE9OHKoBsIzdXHDi+zVtuQKNe/tJDYSKyC8fRJA3ln1aThe+qYLt51lm
X-Gm-Message-State: AOJu0YyZ/OmovKX5rE54CkPXtcm7TNbJ22KH4EBim3ZM2qoYtqDAa2Gi
 muGMh/4e+UbcawKNg/j2avfgGeNhogu2PHUuqRr3x3jXzm/oya8j9s89L6fF
X-Google-Smtp-Source: AGHT+IFG3CpL5GqTkydcO7Czm8GnYkmWsqiLQWLXIwoeTegdpNb0XZM1q9p2XAV5Q03YmNhhBtFkcg==
X-Received: by 2002:a05:690c:640d:b0:61b:33ae:e065 with SMTP id
 00721157ae682-622afdc8cbcmr130870047b3.0.1715674035486; 
 Tue, 14 May 2024 01:07:15 -0700 (PDT)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com.
 [209.85.219.172]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-6209e379521sm24223587b3.120.2024.05.14.01.07.15
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 May 2024 01:07:15 -0700 (PDT)
Received: by mail-yb1-f172.google.com with SMTP id
 3f1490d57ef6-de59daab3f3so5039161276.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 May 2024 01:07:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVp+taLSP/k79XgfS/NXDBYnL9FvctSPz0YA3VhrX1vnUp59qQTX0DkEKNT3oLFU3jxRgsHCP3GsgsH6fcTuEUWAKRS7bGgPbwLnwYHYifRcvyxdQ7ZhPE/
X-Received: by 2002:a05:690c:fd0:b0:611:7132:e6ba with SMTP id
 00721157ae682-622b0147778mr138786587b3.40.1715674014345; Tue, 14 May 2024
 01:06:54 -0700 (PDT)
MIME-Version: 1.0
References: <20240504-pinctrl-cleanup-v2-0-26c5f2dc1181@nxp.com>
 <20240504-pinctrl-cleanup-v2-7-26c5f2dc1181@nxp.com>
 <CAMuHMdUD=1rpns_mLF2rMM-x5EnOK7TExaJxoJVkbXjVz1H8uQ@mail.gmail.com>
 <CACRpkdaUecnwvHFdtGkuM80SObvXpXZkWGYoUMgnNHcvObYF0g@mail.gmail.com>
 <CAMuHMdWCD+k8=iX8+tcK76DU_m9quR8BV+K68K73SygJzCz5VA@mail.gmail.com>
 <CACRpkdYS8=cHT=7tGbzWZ73jbLhjqdpssbaHH-qREe=bcHYe2A@mail.gmail.com>
In-Reply-To: <CACRpkdYS8=cHT=7tGbzWZ73jbLhjqdpssbaHH-qREe=bcHYe2A@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 14 May 2024 10:06:42 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUucOu-c7tbeBBCMaoouFcUnJi0aRU--pc2Gk9QWNrANg@mail.gmail.com>
Message-ID: <CAMuHMdUucOu-c7tbeBBCMaoouFcUnJi0aRU--pc2Gk9QWNrANg@mail.gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: imx@lists.linux.dev, Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Peng Fan <peng.fan@nxp.com>, Heiko Stuebner <heiko@sntech.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Tony Lindgren <tony@atomide.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, linux-tegra@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, Shawn Guo <shawnguo@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Hal Feng <hal.feng@starfivetech.com>, Fabio Estevam <festevam@gmail.com>,
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Emil Renner Berthing <kernel@esmil.dk>, linux-samsung-soc@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, Chunyan Zhang <zhang.lyra@gmail.com>,
 openbmc@lists.ozlabs.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Jacky Bai <ping.bai@nxp.com>, Joel Stanley <joel@jms.id.au>,
 Orson Zhai <orsonzhai@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Chester Lin <chester62515@gmail.com>,
 "Peng Fan \(OSS\)" <peng.fan@oss.nxp.com>,
 Stephen Warren <swarren@wwwdotorg.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-gpio@vger.kernel.org, soc@kernel.org,
 Damien Le Moal <dlemoal@kernel.org>, linux-mediatek@lists.infradead.org,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Dong Aisheng <aisheng.dong@nxp.com>, Matthias Brugger <mbrugger@suse.com>,
 Dvorkin Dmitry <dvorkin@tibbo.com>, Sean Wang <sean.wang@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Nicolas Ferre <nicolas.ferre@microchip.com>, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org,
 Jianlong Huang <jianlong.huang@starfivetech.com>,
 linux-riscv@lists.infradead.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Viresh Kumar <vireshk@kernel.org>, Wells Lu <wellslutw@gmail.com>,
 Shiraz Hashim <shiraz.linux.kernel@gmail.com>
Subject: Re: [Linux-stm32] [PATCH v2 07/20] pinctrl: renesas: Use scope
	based of_node_put() cleanups
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

T24gVHVlLCBNYXkgMTQsIDIwMjQgYXQgOTozM+KAr0FNIExpbnVzIFdhbGxlaWogPGxpbnVzLndh
bGxlaWpAbGluYXJvLm9yZz4gd3JvdGU6Cj4gT24gVHVlLCBNYXkgMTQsIDIwMjQgYXQgODozNuKA
r0FNIEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4ay5vcmc+IHdyb3RlOgo+ID4g
PiBEb2VzIHRoaXMgZ28gaW50byB0aGUgUmVuZXNhcyBwYXRjaCBzdGFjaz8KPiA+ID4gSSB0aGlu
ayB0aGUgcGF0Y2ggc3RhbmRzIGZpbmUgd2l0aG91dCB0aGUgcmVzdCBvZiB0aGUgc2VyaWVzLgo+
ID4KPiA+IFN1cmUsIEkgY2FuIGRvIHRoYXQuCj4KPiBQbGVhc2UgYXBwbHkgaXQhCgpPSywgd2ls
bCBxdWV1ZSBpbiByZW5lc2FzLXBpbmN0cmwgZm9yIHY2LjExLgoKPiA+IEZyb20geW91ciBwb3Np
dGl2ZSByZXNwb25zZSB0byB2MSwgSSB0aG91Z2h0IHRoYXQgcGVyaGFwcyB5b3UganVzdAo+ID4g
d2FudGVkIHRvIHRha2UgdGhlIGZ1bGwgc2VyaWVzIHlvdXJzZWxmPwo+Cj4gU29ycnksIEkgYWx3
YXlzIHByZWZlciBzdWJtYWludGFpbmVycyB0byBwaWNrIHRoZWlyIHN0dWZmLCB0aGV5Cj4ga25v
dyB3aGF0IHRoZXkgYXJlIGRvaW5nIGFuZCB0aGV5IGNhbiB0ZXN0IHRoZSBlbnRpcmUgcGF0Y2gK
PiBzdGFjayBwcm9wZXJseS4KCk9LLCB3aWxsICh0cnkgdG8gOy0pIHJlbWVtYmVyLi4uCgpHcntv
ZXRqZSxlZXRpbmd9cywKCiAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0CgotLSAKR2VlcnQg
VXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVy
dEBsaW51eC1tNjhrLm9yZwoKSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNh
bCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dAp3aGVuIEknbSB0YWxraW5nIHRv
IGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRo
YXQuCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIg
bWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0
cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgt
c3RtMzIK
