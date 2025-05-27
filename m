Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 291E2AC5B6A
	for <lists+linux-stm32@lfdr.de>; Tue, 27 May 2025 22:37:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D0803C36B19;
	Tue, 27 May 2025 20:37:18 +0000 (UTC)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com
 [209.85.217.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4C0F9C36B17
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 May 2025 20:37:17 +0000 (UTC)
Received: by mail-vs1-f42.google.com with SMTP id
 ada2fe7eead31-4e59012c7eeso646045137.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 May 2025 13:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748378236; x=1748983036;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6ID6k8G/m1AUKE94pO2jDeI/QTg83jtJQKI9yRG0MB4=;
 b=lGipR8BJCpPKJZmWm6+18fKvBkvn0GQxXrMcO3cwoOw0M4lycYnKQ+RqgokA40M6h0
 i9CeM2YGqXDIujtTPOZwn3/k3CxxnWIY0UCAhxvUIR/EyQwWGogVigRkDHOMBxERuRfq
 HOIt5VoumXbzMR8YW6MMgek+LOiGUQ9kjhrjYcztmXoIWhELCKWkRj0ga6sndJDMOyKQ
 7LlcxM3LiwIwRq5G2zxGGY9H0/2J3wPq+ZHUQuphp5gmmtzxyroW7AKEJqhBPmwQ2t7y
 aQK0t6Gn0VWvSGDvq7HYWSrgQ/sPENRsek+jhFqwcjwIiH8neoQ7qAHFPYiA56BbW+2H
 6UOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748378236; x=1748983036;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6ID6k8G/m1AUKE94pO2jDeI/QTg83jtJQKI9yRG0MB4=;
 b=A4MF6Suwfzf/2F/gfyAo8xx4mKRk/zFycf6EUjPmVltuavEnQpoDvwIHyylCkr+A/O
 kJg9zjPls5dGUEkuDkfGNf2/j2G9x+cptw9/5JKstuCeAmGDsfu61Yo6c4JGnYre3rPo
 hVBtRMcxeuQ7RNFO3eFEHztfQ9tukVKrpvdok2Nm2Zc+NQekSZ+9rTZFG0TNia9fQlm5
 RR4uPiptqKM0RHX+X841kXbbBa0OxFuIN0F1pSivS+QlzAxordIq7gZYLPC9AL2K9RoM
 P4qO49SdC06yW+2F3hBWrJRRQBEXvQ0DImrxX+ZkJ8Lmz0ZxS6EW+NaOj0sZYpdeluIk
 UU/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCU2Kuw3dufwBaZIy2PMLAXe0jW2AJMXFkuGHYPYt7W821QbYepsH132W+MX3tSXjoFMKgvP8katAaAFrw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yxb4OKH5eF8YrqGvQXhsrjHbuBfbExWcor5wlD2KFX/RCsIDomN
 qgORNLJJ2pL5si2dZGGfozFGBopUYZ/CZNxvZBCyeGGlw0i6lInucsFT369wO/U6lqx888xJVf9
 Kax9pY0aS5a5yOUQNaUO8/w2gh6ukzBw=
X-Gm-Gg: ASbGnct531ItgW14M5F0IyHni9qDcSFuzjNuTQEuoVyvSAX8sowDwNhruBZI713t+Wv
 yjynfdCCnjpYkPT25ldSaa5L8J6YuOh4dRw7QjWBtuNXfSyjKuXb+6Uwipy4Bu/x+29e8wj5Kko
 WvDb4zhYghJ0tDr4DHIWfjjDM/F90T0B9/mg==
X-Google-Smtp-Source: AGHT+IE6IGadDKaQe14cmUEPJjOThWelmyPbRkm0rWeExh7Z+iiuaCMzGmZ+bOotchpiLT4AwMawTY9UCWRMvMcye3A=
X-Received: by 2002:a05:6102:cd1:b0:4e2:91ce:8cad with SMTP id
 ada2fe7eead31-4e4241911f0mr12890455137.24.1748378235982; Tue, 27 May 2025
 13:37:15 -0700 (PDT)
MIME-Version: 1.0
References: <20250527175558.2738342-1-james.hilliard1@gmail.com>
 <631ed4fe-f28a-443b-922b-7f41c20f31f3@lunn.ch>
 <CADvTj4rGdb_kHV_gjKTJNkzYEPMzqLcHY_1xw7wy5r-ryqDfNQ@mail.gmail.com>
 <fe8fb314-de99-45c2-b71e-5cedffe590b0@lunn.ch>
 <CADvTj4qRmjUQJnhamkWNpHGNAtvFyOJnbaQ5RZ6NYYqSNhxshA@mail.gmail.com>
 <014d8d63-bfb1-4911-9ea6-6f4cdabc46e5@lunn.ch>
In-Reply-To: <014d8d63-bfb1-4911-9ea6-6f4cdabc46e5@lunn.ch>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 27 May 2025 14:37:03 -0600
X-Gm-Features: AX0GCFsHvzxiinsPSv0WqpWYNJug5PA_MZLWR3SDuULgtlfcH0M8oGfitOEajfo
Message-ID: <CADvTj4oVj-38ohw7Na9rkXLTGEEFkLv=4S40GPvHM5eZnN7KyA@mail.gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Furong Xu <0x1207@gmail.com>, linux-kernel@vger.kernel.org,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 1/3] net: stmmac: allow drivers to
 explicitly select PHY device
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

T24gVHVlLCBNYXkgMjcsIDIwMjUgYXQgMjozMOKAr1BNIEFuZHJldyBMdW5uIDxhbmRyZXdAbHVu
bi5jaD4gd3JvdGU6Cj4KPiA+IFN1cmUsIHRoYXQgbWF5IG1ha2Ugc2Vuc2UgdG8gZG8gYXMgd2Vs
bCwgYnV0IEkgc3RpbGwgZG9uJ3Qgc2VlCj4gPiBob3cgdGhhdCBpbXBhY3RzIHRoZSBuZWVkIHRv
IHJ1bnRpbWUgc2VsZWN0IHRoZSBQSFkgd2hpY2gKPiA+IGlzIGNvbmZpZ3VyZWQgZm9yIHRoZSBj
b3JyZWN0IE1GRC4KPgo+IElmIHlvdSBrbm93IHdoYXQgdmFyaWFudCB5b3UgaGF2ZSwgeW91IG9u
bHkgaW5jbHVkZSB0aGUgb25lIFBIWSB5b3UKPiBhY3R1YWxseSBoYXZlLCBhbmQgcGh5LWhhbmRs
ZSBwb2ludHMgdG8gaXQsIGp1c3QgYXMgbm9ybWFsLiBObyBydW50aW1lCj4gc2VsZWN0aW9uLgoK
T2gsIHNvIGhlcmUncyB0aGUgaXNzdWUsIHdlIGhhdmUgYm90aCBQSFkgdmFyaWFudHMsIG9sZGVy
IGhhcmR3YXJlCmdlbmVyYWxseSBoYXMgQUMyMDAgUEhZJ3Mgd2hpbGUgbmV3ZXIgc2hpcHMgQUMz
MDAgUEhZJ3MsIGJ1dAp3aGVuIEkgc3VydmV5ZWQgb3VyIGRlcGxveWVkIGhhcmR3YXJlIHVzaW5n
IHRoZXNlIGJvYXJkcyBtYW55CnN5c3RlbXMgb2Ygc2ltaWxhciBhZ2Ugd291bGQgcmFuZG9tbHkg
bWl4IEFDMjAwIGFuZCBBQzMwMCBQSFkncy4KCkl0IGFwcGVhcnMgdGhlcmUgd2FzIGEgZmFpcmx5
IGxvbmcgdHJhbnNpdGlvbiBwZXJpb2Qgd2hlcmUgYm90aCB2YXJpYW50cwp3ZXJlIGJlaW5nIHNo
aXBwZWQuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXN0bTMyCg==
