Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DF57190F6EE
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Jun 2024 21:29:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9AFD9C6B460;
	Wed, 19 Jun 2024 19:29:22 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3391BC6A613
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Jun 2024 19:29:16 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-52bc3130ae6so131774e87.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Jun 2024 12:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1718825355; x=1719430155;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sizxqf/p+Ad13rP5NaIetozu8E9y9ijMGImLu6tat1A=;
 b=yjaBZlXMeomSIqIfe+iPwqIoGTNZovLHzwPch3RsCBMvfqanx5sTwuGkVyBoOO54Tc
 avHTSg3y8APTkxnPrz/RwXPiDg5+wip6ImU8hb4SGmaJDHHi3X+r9vz6julUGmVREG16
 s1LdDQf+09vhfJbkemUIp+9lTH8G88U4mPNxE6KMLe6Gv1tWO+6FA0UjyS31piTut2iq
 YjZ03e/Vf1HLA1mB0fE8z/w/9PhV5zMeD/gZyC57+5gZOJisy5y8DaAmqDIEgHqtWNz/
 H5lkjOE+1RYFrCCpUbXPOHgmrps5deggWVSt9KV5QTjERafEQKQBV2z5cberlrO8z4XG
 gtBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718825355; x=1719430155;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sizxqf/p+Ad13rP5NaIetozu8E9y9ijMGImLu6tat1A=;
 b=lhCttQI0jsEXM2OyL6AP13/k/4C6thuU3OyPyMVbzeP16C10/uSijBKxZiAzAuyC6U
 Y4uuAtsySFAppxyqiqOnKsKRbTkErs4ami+4b512nNeVsn4lRWC4YXaXJ4E77JDt/dFA
 TJAsyYT62nUzpdtHgkvheXffla0sJnSpJu0NI7N9b1mJQIGXdPfYb6NIVJkmMaJwPgUG
 1mr4gOO54PpigZ81I6fZ28CvNA2m0dNsM6c+eFbYZyYll5jb2CUEuDFpgu22TRL8XgNJ
 sQBxzA0w0mcVmvP2pAGeqUBfa8RizamYpsLYww1Dw2Hq/+bhewPZyN4YcL5+2gW7Tzbs
 OCtA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV22Ie8QhIpXka/530og9Y6wXZCULZRMdNT6KIMXtSpE2sTb/ZlB3eQXw9ldFr12uxsle7LR3ACDt7Kr8/OZPanrFXbnRXpiUIGS8RS7JHbl88eS1GpCD4x
X-Gm-Message-State: AOJu0YwdIzkcw7nB+x4TQiv0lS2CydoAExkphEdXoYxAoQy5vRmTuxUx
 ZkmWrql93yI3YODbbWllSNaVO11UJ5BOWt6x2AtZthglqcwUZlEM9hcyUpKfKlL80Kr6Ou4xysM
 WAiUxbT/V6uScH5wCqdqFLF+lUaFSVdKrdhGWlw==
X-Google-Smtp-Source: AGHT+IH/SFsikh0a7Jr/pP4kVDIchxhejysWu07Ul9ypfLKXOG9XTdZtFR6KlZwkn8zT1K3TP7nGNZxnhwc9pC67zws=
X-Received: by 2002:ac2:4c06:0:b0:529:b5ea:fda5 with SMTP id
 2adb3069b0e04-52ccaa5459fmr1881427e87.53.1718825355350; Wed, 19 Jun 2024
 12:29:15 -0700 (PDT)
MIME-Version: 1.0
References: <20240619184550.34524-1-brgl@bgdev.pl>
 <20240619184550.34524-2-brgl@bgdev.pl>
 <bedd74cb-ee1e-4f8d-86ee-021e5964f6e5@lunn.ch>
In-Reply-To: <bedd74cb-ee1e-4f8d-86ee-021e5964f6e5@lunn.ch>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 19 Jun 2024 21:29:03 +0200
Message-ID: <CAMRc=MeCcrvid=+KG-6Pe5_-u21PBJDdNCChVrib8zT+FUfPJw@mail.gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Russell King <linux@armlinux.org.uk>,
 Vinod Koul <vkoul@kernel.org>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-arm-msm@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 1/8] net: phy: add support for
	overclocked SGMII
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

T24gV2VkLCBKdW4gMTksIDIwMjQgYXQgOTowOeKAr1BNIEFuZHJldyBMdW5uIDxhbmRyZXdAbHVu
bi5jaD4gd3JvdGU6Cj4KPiBPbiBXZWQsIEp1biAxOSwgMjAyNCBhdCAwODo0NTo0MlBNICswMjAw
LCBCYXJ0b3N6IEdvbGFzemV3c2tpIHdyb3RlOgo+ID4gRnJvbTogQmFydG9zeiBHb2xhc3pld3Nr
aSA8YmFydG9zei5nb2xhc3pld3NraUBsaW5hcm8ub3JnPgo+ID4KPiA+IFRoZSBBcXVhbnRpYSBB
UVIxMTVDIFBIWSBzdXBwb3J0cyB0aGUgT3ZlcmxvY2tlZCBTR01JSSBtb2RlLiBJbiBvcmRlciB0
bwo+ID4gc3VwcG9ydCBpdCBpbiB0aGUgZHJpdmVyLCBleHRlbmQgdGhlIFBIWSBjb3JlIHdpdGgg
dGhlIG5ldyBtb2RlIGJpdHMgYW5kCj4gPiBwaWVjZXMuCj4KPiBIZXJlIHdlIGdvIGFnYWluLi4u
Lgo+CgpBZG1pdHRlZGx5IEkgZG9uJ3QgcG9zdCB0byBuZXQgdmVyeSBvZnRlbiBhbmQgSSBhc3N1
bWUgdGhlcmUncyBhIHN0b3J5CnRvIHRoaXMgY29tbWVudD8gQ2FyZSB0byBlbGFib3JhdGU/CgpC
YXJ0Cgo+IElzIHRoaXMgMjUwMEJhc2VYIGJ1dCB3aXRob3V0IGluYmFuZCBzaWduYWxsaW5nLCBz
aW5jZSBTR01JSSBpbmJhbmQKPiBzaWduYWxsaW5nIG1ha2VzIG5vIHNlbnNlIGF0IDIuNUc/Cj4K
PiAgICAgICAgIEFuZHJldwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFp
bG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
