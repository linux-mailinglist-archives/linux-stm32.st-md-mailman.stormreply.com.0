Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CEE0960981
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Aug 2024 14:04:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 38654C6DD9A;
	Tue, 27 Aug 2024 12:04:04 +0000 (UTC)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com
 [209.85.219.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 01D1BC6DD6E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Aug 2024 12:03:56 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id
 3f1490d57ef6-e165825ebfdso5345905276.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Aug 2024 05:03:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724760236; x=1725365036;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+1y6MVpUHGHncGeq7J2eB1au+7eWBsmfRUGHQOxkYTA=;
 b=i4afUh2jVVRLcOP3u9dBTTd+T/6cjQeOn0kw4b0ItOnhp1Y8Y1RwPOu8F5cBGyG81V
 UnVlwL2SJf0og6rGc7rZOokbKlSxPovfZUAbVVQGfEsdIjcKd4MwezX0Cq9wFVaHNRoh
 TNiPE+1P67n3PSUlg12n+/s/juF87BYVPgccNf8QUmoi4W/LYcEk18NJGpXPY6mNjw1e
 PlPNvs9yX0XLBVZMb8ADbeBtefCtM83L95mXcqB9k6XLVSXu1qDRQo+raUV+DVNmCwo/
 Kuyq/VDPsnaXGVHYxU3imbh3FkrSO224nvHkIGQYJydCQrTKYwh89RrnOkWXwiEITGFP
 l6Bg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXG/GuixGqb1FDgoV5OMPTqLSjUpEexflon14RtDQJKv5JH+31QdcqAMA04s957doC9vaL0nTwaY/p3Zg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyOhmwmKdY7x5Q21WHa/ppqRr5p2wJPe4sAZK2YXdYgrncDLt2w
 wU1CsR2V1OV/1H8z6TrzH56QmUedbzPadg1dBj3PWdRGEjYjosT754UxE9b6
X-Google-Smtp-Source: AGHT+IEqPN0w3UxOBeVwjpCBWwoF30NwNUr2bdbp5ML6WN1ALNLElpASPB2NzzZT1IpAYavyV8emuw==
X-Received: by 2002:a05:690c:9e:b0:6b2:28c3:b706 with SMTP id
 00721157ae682-6cfbb6fe00dmr31155707b3.34.1724760235829; 
 Tue, 27 Aug 2024 05:03:55 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com.
 [209.85.128.180]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-6c39d3a9ef4sm18659967b3.102.2024.08.27.05.03.55
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Aug 2024 05:03:55 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-6c130ffa0adso54576667b3.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Aug 2024 05:03:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCW5ZUq5tnOb22PtlDLZpgYIpvkZjS0PPzg2XjBw1SyuHb2NR16gHmZLfnZf8CrTCNKscNljDgKWyfg9xA==@st-md-mailman.stormreply.com
X-Received: by 2002:a05:690c:ed2:b0:64b:52e8:4ae3 with SMTP id
 00721157ae682-6cfb950a4e6mr28198917b3.3.1724760235154; Tue, 27 Aug 2024
 05:03:55 -0700 (PDT)
MIME-Version: 1.0
References: <20240827095712.2672820-1-frank.li@vivo.com>
 <20240827095712.2672820-6-frank.li@vivo.com>
In-Reply-To: <20240827095712.2672820-6-frank.li@vivo.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 27 Aug 2024 14:03:42 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX2NxBqBxkSXo8pnsDk2BMgrunwNhtb75g-17KOZ7RSEQ@mail.gmail.com>
Message-ID: <CAMuHMdX2NxBqBxkSXo8pnsDk2BMgrunwNhtb75g-17KOZ7RSEQ@mail.gmail.com>
To: Yangtao Li <frank.li@vivo.com>
Cc: andrew@lunn.ch, marcin.s.wojtas@gmail.com, linus.walleij@linaro.org,
 edumazet@google.com, linux-stm32@st-md-mailman.stormreply.com,
 f.fainelli@gmail.com, sd@queasysnail.net, linux@armlinux.org.uk,
 joabreu@synopsys.com, u.kleine-koenig@pengutronix.de, jacob.e.keller@intel.com,
 kuba@kernel.org, pabeni@redhat.com, clement.leger@bootlin.com,
 mcoquelin.stm32@gmail.com, ulli.kroll@googlemail.com,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 horms@kernel.org, justinstitt@google.com, olteanv@gmail.com,
 davem@davemloft.net, hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [net-next v3 5/9] net: dsa: rzn1_a5psw: Convert
	to devm_clk_get_enabled()
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

T24gVHVlLCBBdWcgMjcsIDIwMjQgYXQgMTE6NDTigK9BTSBZYW5ndGFvIExpIDxmcmFuay5saUB2
aXZvLmNvbT4gd3JvdGU6Cj4gQ29udmVydCBkZXZtX2Nsa19nZXQoKSwgY2xrX3ByZXBhcmVfZW5h
YmxlKCkgdG8gYSBzaW5nbGUKPiBjYWxsIHRvIGRldm1fY2xrX2dldF9lbmFibGVkKCksIGFzIHRo
aXMgaXMgZXhhY3RseQo+IHdoYXQgdGhpcyBmdW5jdGlvbiBkb2VzLgo+Cj4gU2lnbmVkLW9mZi1i
eTogWWFuZ3RhbyBMaSA8ZnJhbmsubGlAdml2by5jb20+CgpSZXZpZXdlZC1ieTogR2VlcnQgVXl0
dGVyaG9ldmVuIDxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT4KCkdye29ldGplLGVldGluZ31zLAoK
ICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQKCi0tIApHZWVydCBVeXR0ZXJob2V2ZW4gLS0g
VGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3Jn
CgpJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxs
IG15c2VsZiBhIGhhY2tlci4gQnV0CndoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBq
dXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4KICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcwpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGlu
dXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
