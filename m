Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD19AC449D
	for <lists+linux-stm32@lfdr.de>; Mon, 26 May 2025 23:09:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 971A4C36B11;
	Mon, 26 May 2025 21:09:09 +0000 (UTC)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com
 [209.85.222.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A6B35C36B10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 May 2025 21:09:07 +0000 (UTC)
Received: by mail-ua1-f43.google.com with SMTP id
 a1e0cc1a2514c-87dffa24b5cso386315241.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 May 2025 14:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748293746; x=1748898546;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=87fhuAp8NmqR1otDh/HGxIh14e89XZX4r9lz9YqYugM=;
 b=NZaz3qb1uEA2vCjhVRigmQGIzohJY30/dQIkQ9DkrCDtompzWJz6HyUUeG6MWdbYxU
 4KNezYdaebA2cIevDKNKM3rUHc8hmjXCXAJayqrznIlUdJjCGXBBk5AKOnVPNaJgpo+d
 9XonIkZNWMjERPELvqKMnS/PgzQuFtZSVs2ygFBH5DK4tifSU5Nb6M60tf/XzcUwzf9E
 i7NVbFLiPR3qKNt4zI1GsK240pxjWCgxs0wUcdAbFNcmHHNheHR0+6kgddELcG+fKKDv
 L6ij5UpDgkQMIBVOqffWtTvEy0s4dGKRvk0J/5Npt0VHRjGirUfCzlZtqZ9Rb/1lJTUI
 jCMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748293746; x=1748898546;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=87fhuAp8NmqR1otDh/HGxIh14e89XZX4r9lz9YqYugM=;
 b=ES/Pl9eJU882yYK21mgVMJrN84pPXau1lx6K1/GCEG4fcYAuKcQqucTy10FfcOgl8k
 OlLr21e1tpUGf6m5tDJm1ePW70B2qe4UvoEanidT/6dbQWK3aNNkr6MmAlIPaJlVo0Ks
 Wyx2dOeJHd8ANtHnGVLqch7o3Tf+i2+Nob1grgSrIiqX1n5Ug22TSR4v4VgWSp09AKh/
 4ULuKlC/nepyf9HWAeEHJFIUy1nyz7vKYdHQf6Qz/Tmp+tsMaPqGAQO7gUgjxbyLIEBx
 xEi9a7/LG9Z3US47XYglXDmhmh5siivhZ+6QdqwWFLDOSSGlJToa37GkUBBbnDnEf5tm
 CJTw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXSlZDjgRmSt057G0yE0bOPS4IdLfxX+m8n4CisyhbzpXhk8+gGnXFK3ZxgJCV6d2Q7Ag3zJ1VRsJD0Tw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxU5ZRT5hCn6NBiLpkMEh/f9MUhboGb+VDQVPsDlrIDD61Xyjrt
 i4mT/BcyIPqBOrLRzJ1xVzaIv/iztqhkYNc4KCaY4UeiAxevAc0D2pw8WA0EZLKRJwSyQxTmfIz
 vmtMV/Nb8cfk3swEnE2hpwQXuMzPs6us=
X-Gm-Gg: ASbGncuL+QjVqULtTR36B38eSYzE8trTwLj37ExJfNKSlyJbaE0n3ke9NkmXbIaPdpO
 8txiv3nEA8tGk6m23cixUCLRgPlcLzm4sGN35oeZAF49k6lpjQf7vLLdL6EOrsTg5OcMt84zmXd
 8OKSmC0aTM98YBJxE99+LKKRE6qhjTqrWwIg==
X-Google-Smtp-Source: AGHT+IHJS491hwCg7QPzHL8sgVSadrrDFwt5Fkv2jVRTS71w6+V06+FNAv/Rmt5Zw/NYt58vCJJpAIGoZZeec3aMqrg=
X-Received: by 2002:a05:6102:6e85:b0:4e4:5e11:6832 with SMTP id
 ada2fe7eead31-4e45e116d29mr2273063137.7.1748293746485; Mon, 26 May 2025
 14:09:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250526182939.2593553-1-james.hilliard1@gmail.com>
 <20250526182939.2593553-2-james.hilliard1@gmail.com>
 <a2ac65eb-e240-48f1-b787-c57b5f3ce135@lunn.ch>
In-Reply-To: <a2ac65eb-e240-48f1-b787-c57b5f3ce135@lunn.ch>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 26 May 2025 15:08:54 -0600
X-Gm-Features: AX0GCFvBOmoEuniobTH4Q2bGCB-bMqy5gqMhcJ9AabATXY_w6ImnhtwMSjGOdz0
Message-ID: <CADvTj4rO-thqYE3VZPE0B0fTTR_v=gJDAxBA3=fo501OL+qvNg@mail.gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Eric Dumazet <edumazet@google.com>,
 linux-stm32@st-md-mailman.stormreply.com, Samuel Holland <samuel@sholland.org>,
 Jinjie Ruan <ruanjinjie@huawei.com>, Yanteng Si <si.yanteng@linux.dev>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-sunxi@lists.linux.dev, Paul Kocialkowski <paulk@sys-base.io>,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 linux-arm-kernel@lists.infradead.org, Feiyang Chen <chenfeiyang@loongson.cn>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH v1 2/3] net: stmmac: dwmac-sun8i: Allow
 runtime AC200/AC300 phy selection
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

T24gTW9uLCBNYXkgMjYsIDIwMjUgYXQgMTo1NuKAr1BNIEFuZHJldyBMdW5uIDxhbmRyZXdAbHVu
bi5jaD4gd3JvdGU6Cj4KPiBPbiBNb24sIE1heSAyNiwgMjAyNSBhdCAxMjoyOTozNVBNIC0wNjAw
LCBKYW1lcyBIaWxsaWFyZCB3cm90ZToKPiA+IFRoZSBBbGx3aW5uZXIgSDYxNiBzaGlwcyB3aXRo
IHR3byBkaWZmZXJlbnQgb24tZGllIHBoeSB2YXJpYW50cywgaW4KPiA+IG9yZGVyIHRvIGRldGVy
bWluZSB0aGUgcGh5IGJlaW5nIHVzZWQgd2UgbmVlZCB0byByZWFkIGFuIGVmdXNlIGFuZAo+ID4g
dGhlbiBzZWxlY3QgdGhlIGFwcHJvcHJpYXRlIFBIWSBiYXNlZCBvbiB0aGUgQUMzMDAgYml0Lgo+
ID4KPiA+IEJ5IGRlZmluaW5nIGFuIGVtYWMgbm9kZSB3aXRob3V0IGEgcGh5LWhhbmRsZSB3ZSBj
YW4gb3ZlcnJpZGUgdGhlCj4gPiBkZWZhdWx0IFBIWSBzZWxlY3Rpb24gbG9naWMgaW4gc3RtbWFj
IGJ5IHBhc3NpbmcgYSBzcGVjaWZpYyBwaHlfbm9kZQo+ID4gc2VsZWN0ZWQgYmFzZWQgb24gdGhl
IGFjMjAwIGFuZCBhYzMwMCBuYW1lcyBpbiBhIHBoeXMgbGlzdC4KPgo+IFRoZSBub3JtYWwgd2F5
IHRvIGRvIHRoaXMgaXMgcGh5X2ZpbmRfZmlyc3QoKS4KClN1cmUsIGJ1dCB0aGVyZSBhcmUgcHJv
YmxlbXMgd2l0aCB0aGF0IGFwcHJvYWNoIGhlcmUuCgpUaGUgaW5pdGlhbGl6YXRpb24gc2VxdWVu
Y2VzIGFyZSByYXRoZXIgZGlmZmVyZW50IGFuZCB0aGUgZGV2aWNlcwp3b24ndCBiZSB2aXNpYmxl
IG9uIHRoZSBtZGlvIGJ1cyB1bnRpbCBhZnRlciB0aGV5IGFyZSBpbml0aWFsaXplZC4KClRoZSBy
ZXNldHMgd2lsbCBiZSBzcGVjaWZpYyB0byBlaXRoZXIgdGhlIEFDMjAwIG9yIEFDMzAwIHNvIHdl
Cm5lZWQgdG8gY2hvb3NlIHRoZSBjb3JyZWN0IFBIWSBiYXNlZCBvbiB0aGUgZWZ1c2UgdmFsdWUg
cmF0aGVyCnRoYW4gYSBtZGlvIGJ1cyBzY2FuIHRvIGF2b2lkIGEgY2lyY3VsYXIgZGVwZW5kZW5j
eSBlc3NlbnRpYWxseS4KCkFDMjAwOiBpMmMgYmFzZWQgcmVzZXQvaW5pdCBzZXF1ZW5jZQpBQzMw
MDogbWRpbyBiYXNlZCByZXNldC9pbml0IHNlcXVlbmNlCgo+Cj4gICAgIEFuZHJldwo+Cl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1h
aWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBz
Oi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0
bTMyCg==
