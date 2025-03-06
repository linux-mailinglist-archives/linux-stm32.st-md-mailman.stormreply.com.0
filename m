Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD4FA545D0
	for <lists+linux-stm32@lfdr.de>; Thu,  6 Mar 2025 10:05:47 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B501FC78002;
	Thu,  6 Mar 2025 09:05:46 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3975CC71289
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Mar 2025 09:05:45 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-abf64aa2a80so81600266b.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 06 Mar 2025 01:05:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741251944; x=1741856744;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qF1a4xy5g06O2GkwhB05ytvAS2BqrA8TH0Jy33gZxiw=;
 b=l5u4RkLOrYWex65Os3ojIDm27PcmdO0oS9CV+yQan5YWsm9c55/Eac3ScMgqBqs8rO
 /s4iXor5uRR9zm6i2zylzrbiz5N56eYK4GJ0aSVUQXg7JA1ISwaHFrx0RYo8nZgEnadQ
 /k5hr2h+2eXHI+o31353MSowK8Y5ueH4URAo0W47eTTfBMVdcscqiUQ+ojnuyTZctFOr
 o9e6or4uJ3wGsxFjOWfiloyIv2PuDtvwTNyqwC71iRTmMIHlOxkyXTwNc680Zo71u2J8
 ow2t/BrAWj+UhCoCxYOP5hrdZnnKPd46Utb+1uDWUoYiW24nw/y/tbXOIuYr3LCKhWYV
 wz5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741251944; x=1741856744;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qF1a4xy5g06O2GkwhB05ytvAS2BqrA8TH0Jy33gZxiw=;
 b=HbyZkLI79FEptjlzD4EiT642LfVTOSvgh75zfe61CrFKbvLT1FrIFfLOb/KX13f+J3
 Z19uTjctorM1Rgoo/pVbCwZ4tglY0bN2C5SL+13BqTk2HccSy1fdluiT/6KjQeEXSSNS
 xKBNOWlt75FtjrVRXnb9LidDBbBDgUA/oj3sOxI4gk+CrmpJP0Ys9P6S4sf3YQg0k+3M
 4MIZ5iwznv62ntqFlNBQYAr73r8J1mkCGB7bjZNJWadXZFmiHniG4BpFNzPbI2STc35j
 V1LXn7B6ivn7RwFwGIFboo2fDubMj3PhkgoN5A1NtE0naLvIU7/74PywQq3vdz/i7EqA
 G/EA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXhM0yweIZFy3N4bXIPIUkkxKCWGmCkJEVB8wKeK/IbYxpW/o02kRgPD86YLTZ+cjLwsBq51VU3MHlqCg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzJRXJ72KOjpBVLXXP3FgavIQLnUBpjo/a025FzgPm3LFRHD9rp
 E4b2YpstHmLSV2oS9uUxgKMRr+LOZKHsLH2r534f7yLEjnoDrVFd4zZtjR3L5K9dfVsKdf4Y1Ux
 3WrKezaYZcurMVY1wnsUJ83PgkyI=
X-Gm-Gg: ASbGncsOkGsQqZIG/E4R6zrC81Q8wEUq2v+/HXZTp92VSmI3EVVXaDCfLdw/qE+F4lQ
 PmeDVlesEJsRiiE61lYQ4hBo6iJkcu0fY1ktvXfTDzn7XF92hS2sHSDKDM3WL2dDegoJMZjWJGC
 1SOvWS8PX3eRgwaJDesc1YeAwXEhjX
X-Google-Smtp-Source: AGHT+IEZf+mByLmt2C5pECGvzvf9DNU4dvPx4rdt3aJSm/Ho3YYl4NaclXM6a/5zGcCuNqGotXObOzkukzSbT9Fj/lE=
X-Received: by 2002:a17:907:2d21:b0:ac1:de84:dea1 with SMTP id
 a640c23a62f3a-ac20da878e7mr662880966b.43.1741251944175; Thu, 06 Mar 2025
 01:05:44 -0800 (PST)
MIME-Version: 1.0
References: <20250227121522.1802832-1-yong.liang.choong@linux.intel.com>
 <20250227121522.1802832-6-yong.liang.choong@linux.intel.com>
 <Z8lLm9Ze9VAx3cE_@surfacebook.localdomain>
 <601c88fb-8ec8-4866-a45d-f28dea6d9625@linux.intel.com>
In-Reply-To: <601c88fb-8ec8-4866-a45d-f28dea6d9625@linux.intel.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 6 Mar 2025 11:05:08 +0200
X-Gm-Features: AQ5f1JpWFPB7HB7xwoyOVydwoKV_kFgASdMk4fd6Z1W-9JCutpUYIBvLsaYm1DU
Message-ID: <CAHp75VeOKbAsvSuf5+VQnGFmUcN92TNnR2eF1+70h3PjaMdMqA@mail.gmail.com>
To: Choong Yong Liang <yong.liang.choong@linux.intel.com>
Cc: Dave Hansen <dave.hansen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org, David E Box <david.e.box@intel.com>,
 Eric Dumazet <edumazet@google.com>, David E Box <david.e.box@linux.intel.com>,
 "H . Peter Anvin" <hpa@zytor.com>, linux-stm32@st-md-mailman.stormreply.com,
 x86@kernel.org, Russell King <linux@armlinux.org.uk>,
 Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>,
 Mengyuan Lou <mengyuanlou@net-swift.com>, Jose Abreu <Jose.Abreu@synopsys.com>,
 Simon Horman <horms@kernel.org>, Richard Cochran <richardcochran@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>, Jiawen Wu <jiawenwu@trustnetic.com>,
 Borislav Petkov <bp@alien8.de>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 linux-arm-kernel@lists.infradead.org, Paolo Abeni <pabeni@redhat.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
 "David S . Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next v9 5/6] net: stmmac: configure
 SerDes according to the interface mode
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

T24gVGh1LCBNYXIgNiwgMjAyNSBhdCAxMDozOeKAr0FNIENob29uZyBZb25nIExpYW5nCjx5b25n
LmxpYW5nLmNob29uZ0BsaW51eC5pbnRlbC5jb20+IHdyb3RlOgo+IE9uIDYvMy8yMDI1IDM6MTUg
cG0sIEFuZHkgU2hldmNoZW5rbyB3cm90ZToKPiA+IFRodSwgRmViIDI3LCAyMDI1IGF0IDA4OjE1
OjIxUE0gKzA4MDAsIENob29uZyBZb25nIExpYW5nIGtpcmpvaXR0aToKCi4uLgoKPiA+PiBjb25m
aWcgRFdNQUNfSU5URUwKPiA+PiAgICAgIGRlZmF1bHQgWDg2Cj4gPj4gICAgICBkZXBlbmRzIG9u
IFg4NiAmJiBTVE1NQUNfRVRIICYmIFBDSQo+ID4+ICAgICAgZGVwZW5kcyBvbiBDT01NT05fQ0xL
Cj4gPj4gKyAgICBkZXBlbmRzIG9uIEFDUEkKPiA+IFN0cmF5IGFuZCB1bmV4cGxhaW5lZCBjaGFu
Z2UuIFBsZWFzZSwgZml4IGl0LiBXZSBkb24ndCBuZWVkIHRoZSBkZXBlbmRlbmNpZXMKPiA+IHdo
aWNoIGFyZSBub3QgcmVhbGlzZWQgaW4gdGhlIGNvbXBpbGUgdGltZS4KPgo+IFRoZSBkZXBlbmRl
bmN5IG9uIEFDUEkgaXMgbmVjZXNzYXJ5IGJlY2F1c2UgdGhlIGludGVsX3BtY19pcGMuaCBoZWFk
ZXIKPiByZWxpZXMgb24gQUNQSSBmdW5jdGlvbmFsaXR5IHRvIGludGVyYWN0IHdpdGggdGhlIElu
dGVsIFBNQy4KClNvLCB0aGF0IGhlYWRlciBoYXMgdG8gYmUgZml4ZWQgYXMgQUNQSSBoZXJlIGlz
IHJlYWxseSB1bm5lZWRlZApkZXBlbmRlbmN5IGZvciB0aGUgY2FzZXMgd2hlbiBzb21lYm9keSAo
Zm9yIHdoYXRldmVyIHJlYXNvbnMpIHdhbnQgdG8KYnVpbGQgYSBrZXJuZWwgd2l0aG91dCBBQ1BJ
IHN1cHBvcnQgYnV0IHdpdGggdGhlIGRyaXZlciBlbmFibGVkIGZvcgpsZXQncyBzYXkgUENJIGRl
dmljZS4KCgotLSAKV2l0aCBCZXN0IFJlZ2FyZHMsCkFuZHkgU2hldmNoZW5rbwpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5n
IGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
