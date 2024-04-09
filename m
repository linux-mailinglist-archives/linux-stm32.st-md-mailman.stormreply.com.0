Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A7CC189DF03
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Apr 2024 17:28:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5F248C7128A;
	Tue,  9 Apr 2024 15:28:13 +0000 (UTC)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com
 [209.85.219.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4C813C6C858
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Apr 2024 15:28:12 +0000 (UTC)
Received: by mail-yb1-f172.google.com with SMTP id
 3f1490d57ef6-dccb1421bdeso5619838276.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 09 Apr 2024 08:28:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712676491; x=1713281291;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=S9fHLaOg0xQHrvlM1IV1UTtnZ4u0DmXFhb6dRTtO4eE=;
 b=quM/2tPzl40Rb3A57iwDCZ1PJnvIV8gjdiL3fAHAWRpWaVoQi680/svmEcYFqUXFVh
 gQpGD9qInoWhpT5Jeprh9tsPUCA/DYIooXRP/ornvaaptZ9pk9t8lEw2PZk17S7gWuWb
 AGpJ8DNUV44+TV8Wuq4M23ZNL0+cDse/YMn3i9VMYvDdKiszMWaNYZ0R3gRj9F3ewCQT
 g0QeRTCSgbpFQa9ELKLceRjtMrp/DeXor7DqhbKnAsrQVtgxCZLzW9OHMr+CRsn2XJcX
 eUpGgfG1kfnYUnLNQs3XwiDGLb4OKwVmt+efAeIv3db/IU0ncV9TrEUc8mntpPyYfFTz
 rvqw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXrEYfpPsbfj4Fa98yd1aLPecBHohUE6/VuvkYOklj1FCrEpi2mgW3ejuF8+HYFK8UZNUkGJ6KycM4WMJQP2BhHdK+9K8aki7UOwwUmgN5IXmcQfAE0B8HI
X-Gm-Message-State: AOJu0YynKSTLmkaFlcV23kw1WvNaoyE4rjhRTOxHV35DQwn57xg9l34W
 XFsgOGe3F4IZAfmydmEaZ8Hp7j5pHD8J0FWg19aDJXqF1LP6yRFY57RwerZdwXg=
X-Google-Smtp-Source: AGHT+IG0vJGPs1WlQZ+I9Z21R2ih68rIsaqKySSCcsk4/DpSZ0pnCuj2Q4GWCLz6Mw5fy+nfiGXdew==
X-Received: by 2002:a25:b9c6:0:b0:dc6:52ec:7ff8 with SMTP id
 y6-20020a25b9c6000000b00dc652ec7ff8mr101996ybj.4.1712676490827; 
 Tue, 09 Apr 2024 08:28:10 -0700 (PDT)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com.
 [209.85.219.180]) by smtp.gmail.com with ESMTPSA id
 l12-20020a25bccc000000b00dccdf447047sm1711112ybm.65.2024.04.09.08.28.10
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Apr 2024 08:28:10 -0700 (PDT)
Received: by mail-yb1-f180.google.com with SMTP id
 3f1490d57ef6-dc23bf7e5aaso6157782276.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 09 Apr 2024 08:28:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUMyx627lZ3M+ffviZ+aj7v+LIuziX8F2iCN8xjF/0U16cFtHPw98H2YlTpkadj0dB57rPXJ0sL8TcfJWQORTAy4vsNylKthZVh+NxfHczBtUnTJ9Sr9Qzh
X-Received: by 2002:a25:a249:0:b0:dcc:56b6:6606 with SMTP id
 b67-20020a25a249000000b00dcc56b66606mr69104ybi.40.1712676490322; Tue, 09 Apr
 2024 08:28:10 -0700 (PDT)
MIME-Version: 1.0
References: <20240409-rzn1-gmac1-v2-0-79ca45f2fc79@bootlin.com>
 <20240409-rzn1-gmac1-v2-4-79ca45f2fc79@bootlin.com>
In-Reply-To: <20240409-rzn1-gmac1-v2-4-79ca45f2fc79@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 9 Apr 2024 17:27:58 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX-F8LXWx=Ras4f+Dt_r485HKjRDLydDXZsnZBW8HJzxw@mail.gmail.com>
Message-ID: <CAMuHMdX-F8LXWx=Ras4f+Dt_r485HKjRDLydDXZsnZBW8HJzxw@mail.gmail.com>
To: Romain Gantois <romain.gantois@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, devicetree@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Magnus Damm <magnus.damm@gmail.com>,
 Russell King <linux@armlinux.org.uk>, linux-renesas-soc@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
 "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH net-next v2 4/5] net: stmmac: add support
	for RZ/N1 GMAC
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

SGkgUm9tYWluLAoKT24gVHVlLCBBcHIgOSwgMjAyNCBhdCAxMToyMeKAr0FNIFJvbWFpbiBHYW50
b2lzCjxyb21haW4uZ2FudG9pc0Bib290bGluLmNvbT4gd3JvdGU6Cj4gRnJvbTogQ2zDqW1lbnQg
TMOpZ2VyIDxjbGVtZW50LmxlZ2VyQGJvb3RsaW4uY29tPgo+Cj4gQWRkIHN1cHBvcnQgZm9yIHRo
ZSBSZW5lc2FzIFJaL04xIEdNQUMuIFRoaXMgc3VwcG9ydCBjYW4gbWFrZSB1c2Ugb2YgYQo+IGN1
c3RvbSBSWi9OMSBQQ1Mgd2hpY2ggaXMgZmV0Y2hlZCBieSBwYXJzaW5nIHRoZSBwY3MtaGFuZGxl
IGRldmljZSB0cmVlCj4gcHJvcGVydHkuCj4KPiBTaWduZWQtb2ZmLWJ5OiAiQ2zDqW1lbnQgTMOp
Z2VyIiA8Y2xlbWVudC5sZWdlckBib290bGluLmNvbT4KPiBDby1kZXZlbG9wZWQtYnk6IFJvbWFp
biBHYW50b2lzIDxyb21haW4uZ2FudG9pc0Bib290bGluLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBS
b21haW4gR2FudG9pcyA8cm9tYWluLmdhbnRvaXNAYm9vdGxpbi5jb20+CgpUaGFua3MgZm9yIHlv
dXIgcGF0Y2ghCgo+IC0tLSBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL0tj
b25maWcKPiArKysgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9LY29uZmln
Cj4gQEAgLTE0Miw2ICsxNDIsMTggQEAgY29uZmlnIERXTUFDX1JPQ0tDSElQCj4gICAgICAgICAg
IFRoaXMgc2VsZWN0cyB0aGUgUm9ja2NoaXAgUkszMjg4IFNvQyBnbHVlIGxheWVyIHN1cHBvcnQg
Zm9yCj4gICAgICAgICAgIHRoZSBzdG1tYWMgZGV2aWNlIGRyaXZlci4KPgo+ICtjb25maWcgRFdN
QUNfUlpOMQo+ICsgICAgICAgdHJpc3RhdGUgIlJlbmVzYXMgUlovTjEgZHdtYWMgc3VwcG9ydCIK
PiArICAgICAgIGRlZmF1bHQgQVJDSF9SWk4xCgpXaHkgZGVmYXVsdCB0byBlbmFibGVkPwoKPiAr
ICAgICAgIGRlcGVuZHMgb24gT0YgJiYgKEFSQ0hfUlpOMSB8fCBDT01QSUxFX1RFU1QpCj4gKyAg
ICAgICBzZWxlY3QgUENTX1JaTjFfTUlJQwo+ICsgICAgICAgaGVscAo+ICsgICAgICAgICBTdXBw
b3J0IGZvciBFdGhlcm5ldCBjb250cm9sbGVyIG9uIFJlbmVzYXMgUlovTjEgU29DIGZhbWlseS4K
PiArCj4gKyAgICAgICAgIFRoaXMgc2VsZWN0cyB0aGUgUmVuZXNhcyBSWi9OMSBTb0MgZ2x1ZSBs
YXllciBzdXBwb3J0IGZvcgo+ICsgICAgICAgICB0aGUgc3RtbWFjIGRldmljZSBkcml2ZXIuIFRo
aXMgc3VwcG9ydCBjYW4gbWFrZSB1c2Ugb2YgYSBjdXN0b20gTUlJCj4gKyAgICAgICAgIGNvbnZl
cnRlciBQQ1MgZGV2aWNlLgo+ICsKPiAgY29uZmlnIERXTUFDX1NPQ0ZQR0EKPiAgICAgICAgIHRy
aXN0YXRlICJTT0NGUEdBIGR3bWFjIHN1cHBvcnQiCj4gICAgICAgICBkZWZhdWx0IEFSQ0hfSU5U
RUxfU09DRlBHQQoKR3J7b2V0amUsZWV0aW5nfXMsCgogICAgICAgICAgICAgICAgICAgICAgICBH
ZWVydAoKLS0gCkdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5
b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcKCkluIHBlcnNvbmFsIGNvbnZlcnNhdGlv
bnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQKd2hl
biBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBz
b21ldGhpbmcgbGlrZSB0aGF0LgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExp
bnVzIFRvcnZhbGRzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
