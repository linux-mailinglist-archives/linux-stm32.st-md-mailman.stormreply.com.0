Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C758CFD31
	for <lists+linux-stm32@lfdr.de>; Mon, 27 May 2024 11:39:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 93D51C6DD6E;
	Mon, 27 May 2024 09:39:47 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com
 [209.85.128.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 19CEBC6DD6D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 May 2024 09:39:40 +0000 (UTC)
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-627eb38eb1bso44824707b3.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 May 2024 02:39:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716802778; x=1717407578;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cs7oGWkvAyFJE8iOCwgBBHVZVN7XGrEi9s1+j6aNNq8=;
 b=ohRxfrCRyougpsGnEwWGieRnPQnkJwFA4NZwsru/ATAF9dPIYKtija/NaUk7MSkZIL
 g/d9FSiEUw4rvPBaUlQunlmEjHzCUe+fU5uY8VBLqTk/2Pc6PFlbiXUNi39i2iFV5hPq
 vUh1tekd9+gNmrl9TxSpu0mCoct2YZNYnZISRW6fYeYVz/+vnet/0z3Y0rwjeOzhFoTu
 ZOC8RlP41Mlbqx1/j73ho9LWKsEAaI88Ti6Wv7RTHoukxu1yfK4IRlgEusD9i6E2OGrJ
 KntJ/9+KZwErHGetnlrIyvD3tHBO7G4HNJ9+kyLKI660uyoGQ5lFHPEX/TANsCD2Ey7E
 Ma9g==
X-Forwarded-Encrypted: i=1;
 AJvYcCW9RcGTGqDCk32/LtQkZeK6OCdCvf1xcJ56jHwli8lotczREqTewbZKY7KX/yVJSo3GBGVsxioCfs3e6ZnmMzONxp5Qv2PPfS1abDfz2DfYuC8h6RHTq7FM
X-Gm-Message-State: AOJu0Yzc1j30S17CN5CJ13dVFhDhBR0SatT/Tt97wWrM2kejXovjV4RY
 1/AMYrgmdNB7NdNDqm2txyqP4b8J43xVXnksmZm5fnRkY3Kk8OF0+kBIe4+T
X-Google-Smtp-Source: AGHT+IFCl7AmxcQHOzHdGDUGxEgS/zZ655Kqik19mHB8N68I7PA9yOcRNyS/rSVUR89fddsJR7Kehw==
X-Received: by 2002:a81:498d:0:b0:627:956b:dbca with SMTP id
 00721157ae682-62a08ed9fbcmr83346577b3.40.1716802778037; 
 Mon, 27 May 2024 02:39:38 -0700 (PDT)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com.
 [209.85.219.177]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-62a0a3f77ddsm15808567b3.56.2024.05.27.02.39.37
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 May 2024 02:39:37 -0700 (PDT)
Received: by mail-yb1-f177.google.com with SMTP id
 3f1490d57ef6-df771959b5bso3180752276.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 May 2024 02:39:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWL+Ju4G2WHdvmuTiB7nEXoCBVASDgAdBMhx0EUUdMGXzkljy+dkjIC8cGXFSMZ/ddnPuEFWIyTyBKlXsO6sn6n1gi52ISlk8ysXTjhiRpfBzYYQnthxSky
X-Received: by 2002:a25:9348:0:b0:df4:d5d2:b524 with SMTP id
 3f1490d57ef6-df772184a6cmr8464467276.14.1716802777293; Mon, 27 May 2024
 02:39:37 -0700 (PDT)
MIME-Version: 1.0
References: <20240513-rzn1-gmac1-v7-0-6acf58b5440d@bootlin.com>
 <20240513-rzn1-gmac1-v7-7-6acf58b5440d@bootlin.com>
In-Reply-To: <20240513-rzn1-gmac1-v7-7-6acf58b5440d@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 27 May 2024 11:39:24 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWC=mF0xVwALAT6OsZMn821V-vz6G94HLVsEDvXWRpngQ@mail.gmail.com>
Message-ID: <CAMuHMdWC=mF0xVwALAT6OsZMn821V-vz6G94HLVsEDvXWRpngQ@mail.gmail.com>
To: Romain Gantois <romain.gantois@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, devicetree@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Magnus Damm <magnus.damm@gmail.com>,
 Serge Semin <fancer.lancer@gmail.com>, Russell King <linux@armlinux.org.uk>,
 linux-renesas-soc@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
 "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH net-next v7 7/7] ARM: dts: r9a06g032:
	describe GMAC1
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

T24gTW9uLCBNYXkgMTMsIDIwMjQgYXQgOToyNOKAr0FNIFJvbWFpbiBHYW50b2lzCjxyb21haW4u
Z2FudG9pc0Bib290bGluLmNvbT4gd3JvdGU6Cj4gRnJvbTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVt
ZW50LmxlZ2VyQGJvb3RsaW4uY29tPgo+Cj4gVGhlIHI5YTA2ZzAzMiBTb0Mgb2YgdGhlIFJaL04x
IGZhbWlseSBmZWF0dXJlcyB0d28gR01BQyBkZXZpY2VzIG5hbWVkCj4gR01BQzEvMiwgdGhhdCBh
cmUgYmFzZWQgb24gU3lub3BzeXMgY29yZXMuIEdNQUMxIGlzIGNvbm5lY3RlZCB0byBhCj4gUkdN
SUkvUk1JSSBjb252ZXJ0ZXIgdGhhdCBpcyBhbHJlYWR5IGRlc2NyaWJlZCBpbiB0aGlzIGRldmlj
ZSB0cmVlLgo+Cj4gU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVtZW50LmxlZ2Vy
QGJvb3RsaW4uY29tPgo+IFtyZ2FudG9pczogY29tbWl0IGxvZ10KPiBSZXZpZXdlZC1ieTogR2Vl
cnQgVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT4KPiBTaWduZWQtb2ZmLWJ5
OiBSb21haW4gR2FudG9pcyA8cm9tYWluLmdhbnRvaXNAYm9vdGxpbi5jb20+CgpUaGFua3MsIHdp
bGwgcXVldWUgaW4gcmVuZXNhcy1kZXZlbCBmb3IgdjYuMTEuCgpHcntvZXRqZSxlZXRpbmd9cywK
CiAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0CgotLSAKR2VlcnQgVXl0dGVyaG9ldmVuIC0t
IFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC1tNjhrLm9y
ZwoKSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2Fs
bCBteXNlbGYgYSBoYWNrZXIuIEJ1dAp3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkg
anVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuCiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0Ckxp
bnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
