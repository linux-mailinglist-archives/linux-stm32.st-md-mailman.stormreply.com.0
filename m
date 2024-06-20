Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC2790FDA2
	for <lists+linux-stm32@lfdr.de>; Thu, 20 Jun 2024 09:25:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E8C92C6A613;
	Thu, 20 Jun 2024 07:25:18 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C2644C5E2D0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Jun 2024 07:25:11 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-2ec461d1005so3358761fa.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Jun 2024 00:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1718868311; x=1719473111;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yRH5412s3wX0CB4KIXqQXWuDqJc61xtQQ1UqcTmYbLs=;
 b=3GrOjB1CPGV/UnOXbaoVkRK7u9LdGA1Dhhwe4fHxCmbU/xM+aVjVU8dnhrYdOcJZLS
 uuIMc3bORH0YD9ku2vpt3+4QptYmrTiDuvVvjwYuQFByVsU9lSWx0rkgbyT09R2fO3FO
 ZTQyAdo4jmK7yxZuR/IeGQNEdbgHfd10SQCZtGJ2ggDAuPmNQhj+RPUv7OvsRTxdrmv1
 4AStsMzReChqW2R4anJ4qu9bui4nCXnnH7nXcL//NZ990hk+yB+x2fFwiqdGWRWAtZzU
 MwuWaZDV/SnJx8sjWiULpTZmWXWHBXkEjEEWkpHOMtCyOMfLj5k6VxWsqWiAaCxIvqqx
 q8nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718868311; x=1719473111;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yRH5412s3wX0CB4KIXqQXWuDqJc61xtQQ1UqcTmYbLs=;
 b=LzvEvxda8cloEkzk27KfbSHYa4tr6Wr7S5ONdXqrZ8IPbIW3UUhJDd3UTu3mJ9f0K8
 bUpmjZFxQu9PMQoq462toRZDLCu21LP3ICy66oUabMcLRvmaro95szKD4l6AbYpJYgFM
 ptfsDaf+rgoFKYWOzU7PqcO+ST9QH/MmK0sgKGUuuXUHdxAaB0J10QmDzsYA7DuX4vor
 HU7I4KGv+2qA+oQgzxaO+OnkkmzmhkMocz2iiLW51Stmr32Bfc7Ub88bH8WMIEnbr832
 w1012E1QKPaDXcn3NoQ/Ws4Bcc9XSmOkUBs2aOMVmyGsB7lsnU/FDKY3i0cH8XXFyJjN
 TwdA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV//KGVZLHrYNRyjAo49rybbZKwqewUcb7NGMGbE1CUDGUugN48on+TxjN94PiacBrZJA+fWoRT4S8FwcRFiA/03NNyo4791ThrvV2tooPVNIIlEiLQBHvr
X-Gm-Message-State: AOJu0Yw/hw2XXZ0SIKWaolYM97zTpEBevj1KfvnsL7cxHmgWBbPPa0uR
 F997nm8ahtLKLwP2sq+PmWmqaT2+UXqjRkzIgdf/ZwQO9keqGBte0jiZuieUHG0KKzwle/n42Ut
 BQtzHA59+KGRV++CgOftH8tXsj4fSRw7Xom+I0w==
X-Google-Smtp-Source: AGHT+IEdeM9R3n/NNtQDYZHx3TkVh4Vr7+gb+bkwvyCIBlqBU2TmaHrNNS+3vlKpjGfCJsXmfuuse+wN8rhE8KzDejs=
X-Received: by 2002:a05:6512:ad5:b0:52c:86e0:97b5 with SMTP id
 2adb3069b0e04-52cca1c57b8mr1464365e87.16.1718868310875; Thu, 20 Jun 2024
 00:25:10 -0700 (PDT)
MIME-Version: 1.0
References: <20240619184550.34524-1-brgl@bgdev.pl>
 <20240619184550.34524-6-brgl@bgdev.pl>
 <44cf011b-ec81-4826-b7c2-1a8d57594fca@lunn.ch>
In-Reply-To: <44cf011b-ec81-4826-b7c2-1a8d57594fca@lunn.ch>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 20 Jun 2024 09:24:59 +0200
Message-ID: <CAMRc=Mc0wN=zkduCnKetXyMsuY2k-BzrZ19ehPDntZRDu_o6fA@mail.gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Russell King <linux@armlinux.org.uk>,
 Vinod Koul <vkoul@kernel.org>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-arm-msm@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 5/8] net: phy: aquantia: wait for
 FW reset before checking the vendor ID
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

T24gV2VkLCBKdW4gMTksIDIwMjQgYXQgOToyN+KAr1BNIEFuZHJldyBMdW5uIDxhbmRyZXdAbHVu
bi5jaD4gd3JvdGU6Cj4KPiBPbiBXZWQsIEp1biAxOSwgMjAyNCBhdCAwODo0NTo0NlBNICswMjAw
LCBCYXJ0b3N6IEdvbGFzemV3c2tpIHdyb3RlOgo+ID4gRnJvbTogQmFydG9zeiBHb2xhc3pld3Nr
aSA8YmFydG9zei5nb2xhc3pld3NraUBsaW5hcm8ub3JnPgo+ID4KPiA+IENoZWNraW5nIHRoZSBm
aXJtd2FyZSByZWdpc3RlciBiZWZvcmUgaXQgYm9vdHMgbWFrZXMgbm8gc2Vuc2UsIGl0IHdpbGwK
PiA+IHJlcG9ydCAwIGV2ZW4gaWYgRlcgaXMgbG9hZGVkLiBBbHdheXMgd2FpdCBmb3IgRlcgdG8g
Ym9vdCBiZWZvcmUKPiA+IGNvbnRpbnVpbmcuCj4KPiBQbGVhc2Ugc3BsaXQgdGhpcyBwYXRjaCB1
cC4gT25lIHBhdGNoIHdoaWNoIHJlbmFtZXMgdGhlIG1ldGhvZCB0byB0aGUKPiBtb3JlIGdlbmVy
aWMgYXFyXyBzaW5jZSBpdCBpcyB1c2VkIGJ5IG1vcmUgdGhhbiBhcXIxMDcuIFRoZW4gYWRkIHRo
ZQo+IG5ldyB1c2Ugb2YgaXQuCj4KCldpbGwgZG8uCgo+IElzIHRoaXMgYWN0dWFsbHkgYSBmaXg/
IFdoYXQgaGFwcGVucyB0byB0aGUgZmlybXdhcmUgaWYgeW91IHRyeSB0bwo+IGRvd25sb2FkIGl0
IHdoaWxlIGl0IGlzIHN0aWxsIGJvb3Rpbmc/IE9yIGRvIHlvdSBlbmQgdXAgZG93bmxvYWRpbmcK
PiBmaXJtd2FyZSB3aGVuIGl0IGlzIG5vdCBhY3R1YWxseSBuZWVkZWQ/IFBsZWFzZSBleHBhbmQg
dGhlIGNvbW1pdAo+IG1lc3NhZ2UuCj4KCkl0IHNheXMgJzAnIGFuZCB0aGUgZHJpdmVyIHRyaWVz
IHRvIGxvYWQgaXQgZnJvbSBudm1lbSwgdGhlbiB0aGUKZmlsZXN5c3RlbSBhbmQgYmFpbHMtb3V0
IGFmdGVyIHRoZXNlIHR3byBmYWlsLiBJJ2xsIGV4dGVuZCB0aGUgY29tbWl0Cm1lc3NhZ2UuCgpC
YXJ0Cgo+ICAgICBBbmRyZXcKPgo+IC0tLQo+IHB3LWJvdDogY3IKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0Ckxp
bnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
