Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 240DE90FEA2
	for <lists+linux-stm32@lfdr.de>; Thu, 20 Jun 2024 10:20:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C7EBAC6B47A;
	Thu, 20 Jun 2024 08:20:28 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F15BFC6B460
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Jun 2024 08:20:20 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-52bc3130ae6so565584e87.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Jun 2024 01:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1718871620; x=1719476420;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B7yX7rbJbYr/mTm0lEL9vuk9v/WQvi74pV0s5CSPcDg=;
 b=vKqJiyF+oI0g5qEqWT1KB1rOCfgZ1MEUTz/Kbgq/9wkH5CsOQ+KV6f9Ir/+33cgaI4
 ljTcchUj/W0Wa2Go+PLresN/Oh8ogE+1fbWKFkpa9WupUALna2dTqW1EpCxeDzeWibCz
 dnTqgT2cxKWlqGs3DhQDEac6hQHD1jqKV6/DodfdgOE6eEvl3Lve4SiRQ0VwfNmqxWmO
 YlufRShme3pO96a1vrYgrKKecacLv5CBDs+gHrAd13wjSR8xzjzAWtZgejzL3L9jnbwt
 nY+Qt6Pq7yteCymozWjEdMqqvTWxVq6Ej1PWAhC/Lxjeo3xIIq8pJ7vzArE0mjrKNxP0
 k39g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718871620; x=1719476420;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B7yX7rbJbYr/mTm0lEL9vuk9v/WQvi74pV0s5CSPcDg=;
 b=DjBkrihU8XCulcaFhSK9U4Aq8MjCN6Q2QSiMihn4s0HSQ1a8F0oDvfMcHMAs3YlsQK
 ma3mGivOCeHvCzYGR3PXoUarecEV7KjclZpO6Ziio3wU6eQplazRPMBqScifZBKz97VX
 KbDEucKSswbcpqHw7DZ1lDPo4Elg3a17eE0l1axc8hx8aXO6n2bCM8k9D7zo4gdtIE4/
 5nhmspuCwc7v/YAdixFrGb6+HjuxOeUHG/to4UqpdLmvqrt+Z8k7Mor6xq1Rd+TXKpQk
 t2SCF2cefLCTRp6zVPeOobraeblYVrEaDTW1BqqoeEkl/2VioIt5/2xJFHxk6DSu6Ggb
 lzTg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8jcKQU0YFyu79nTJEn3FAtr/z+mvAYh5rTF/YZtRcJWv14FSeFJqF1NO+2mvaL71zZfnOfHPW3IlfhsAzI2AOishBvl/TSxJVn4UT6sOlN+2zUztg5saa
X-Gm-Message-State: AOJu0YzqLeJ5lG9U1peq/n+36Fj1zhDrzd8kz9Pt9a5McnOGh1q2FgVG
 I++ylSRMiqckQMoOpH+d/6KP3+LKHo3iEyFabh3A9ftgCT1EI5jNAWuGR5rODFnpz6f3mrQf71N
 HHw6Jc8attf/vCX7p+D8c03XFFuxXUjwe5m8prw==
X-Google-Smtp-Source: AGHT+IEmop4fSjADk7pSWeD8ON7nqhqCNYoCXWB9xXRFCphWhGBBKaZ3FTBp7MgrIlYFop2ThtyzgoBlAbqZbHjT0uk=
X-Received: by 2002:a05:6512:1182:b0:52c:86d6:e8d7 with SMTP id
 2adb3069b0e04-52ccaa2d4a3mr2435101e87.13.1718871620038; Thu, 20 Jun 2024
 01:20:20 -0700 (PDT)
MIME-Version: 1.0
References: <20240619184550.34524-1-brgl@bgdev.pl>
 <20240619184550.34524-9-brgl@bgdev.pl>
 <f4af7cb3-d139-4820-8923-c90f28cca998@lunn.ch>
In-Reply-To: <f4af7cb3-d139-4820-8923-c90f28cca998@lunn.ch>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 20 Jun 2024 10:20:08 +0200
Message-ID: <CAMRc=MeP9o2n8AqHYNZMno5gFA94DnQCoHupYiofQLLw03bL6A@mail.gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Russell King <linux@armlinux.org.uk>,
 Vinod Koul <vkoul@kernel.org>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-arm-msm@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 8/8] net: stmmac: qcom-ethqos:
 add a DMA-reset quirk for sa8775p-ride-r3
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

T24gV2VkLCBKdW4gMTksIDIwMjQgYXQgOTozM+KAr1BNIEFuZHJldyBMdW5uIDxhbmRyZXdAbHVu
bi5jaD4gd3JvdGU6Cj4KPiBPbiBXZWQsIEp1biAxOSwgMjAyNCBhdCAwODo0NTo0OVBNICswMjAw
LCBCYXJ0b3N6IEdvbGFzemV3c2tpIHdyb3RlOgo+ID4gRnJvbTogQmFydG9zeiBHb2xhc3pld3Nr
aSA8YmFydG9zei5nb2xhc3pld3NraUBsaW5hcm8ub3JnPgo+ID4KPiA+IE9uIHNhODc3NXAtcmlk
ZSB0aGUgUlggY2xvY2tzIGZyb20gdGhlIEFRUjExNUMgUEhZIGFyZSBub3QgYXZhaWxhYmxlIGF0
Cj4gPiB0aGUgdGltZSBvZiB0aGUgRE1BIHJlc2V0IHNvIHdlIG5lZWQgdG8gbG9vcCBUWCBjbG9j
a3MgdG8gUlggYW5kIHRoZW4KPiA+IGRpc2FibGUgbG9vcGJhY2sgYWZ0ZXIgbGluay11cC4gVXNl
IHRoZSBwcm92aWRlZCBjYWxsYmFja3MgdG8gZG8gaXQgZm9yCj4gPiB0aGlzIGJvYXJkLgo+Cj4g
SG93IGRvZXMgdGhpcyBkaWZmZXIgdG8gZXRocW9zX2Nsa3NfY29uZmlnKCk/Cj4KCkknbSBub3Qg
c3VyZSBJIHVuZGVyc3RhbmQgdGhlIHF1ZXN0aW9uLiBUaGlzIGZ1bmN0aW9uIGlzIGNhbGxlZCBh
dApwcm9iZS9yZW1vdmUgYW5kIHN1c3BlbmQvcmVzdW1lLiBJdCdzIG5vdCBsaW5rZWQgdG8gdGhl
IGlzc3VlIHNvbHZlZApoZXJlLgoKQmFydApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
