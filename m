Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D79D5AC5A93
	for <lists+linux-stm32@lfdr.de>; Tue, 27 May 2025 21:21:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 53AF0C36B19;
	Tue, 27 May 2025 19:21:36 +0000 (UTC)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com
 [209.85.217.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 561E3C36B17
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 May 2025 19:21:34 +0000 (UTC)
Received: by mail-vs1-f44.google.com with SMTP id
 ada2fe7eead31-4e45a626663so618704137.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 May 2025 12:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748373693; x=1748978493;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aWXT/WupRqW0CupybvTkEKLCMDuWAmD/tW/zMc48HoA=;
 b=cV4NnMZkKB6NNhal9N1kBaIjrvJBw7JkdzAwLqo+GoeU+RnTCMVhERxCRf84y7iYSQ
 lGITnp1KTq/lG/lkbPAiAVd5E7XuCuy5jJjlhjW/3IYV5WHKkK6xxMd2FEyXcSaSfOoX
 Q64yU/Eeh9ywQNr/hLT0mzk9A4Bwtx2okpzWQKxDNGYDgmJW2UyZ/eJbodAGWmYyH9gJ
 m2PwDJqe2TiXdD4/EcG50whgdcv2lnB715Fb+AFHS+M0Y97y8vBtCLOlI0tiBvt/SwjP
 FirX9EZQJAW293/dc/lD0tbTEFBqey9/ij5ZSjhCxXIhrqjtN+SGxgK6tLyEnIjTeSK5
 gCCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748373693; x=1748978493;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aWXT/WupRqW0CupybvTkEKLCMDuWAmD/tW/zMc48HoA=;
 b=qyhnW4HLl1APmkdseoPNOtozXwQvgvmCJgCCFKJPiZGcxxVhLRRsODcVhWbXTGCY1S
 rgo3FBtGUXQirRt6u+VM8HWVOcA9EHoxtvXaJW1dmzGcefqXodeq+cavmawjFGyRNPQW
 KtW/PsxrtE2pLLsvm+ZXwsHMiwUfsPCjEkxTHU20XT1vEyYZ9CcOwa0c4NORTRdexKLp
 OCwkB+qFmxRoiMsSCu4XajEqIV5g9QdJyUnNtB50Ib6ypLZwRfexKojIMtWzf4il6vW6
 M+VaqKIcs+urmhjOsoxTm1euQPGYPzp1ZeQpqdmpIAmZL9Z+qSnYaDzgkOfGKi3u9739
 LjtQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWTxCgLCp+ai1iRzioFXTB/IgMDDJjMuN4oaprdwkFkG8TxzUe4UqyKm8t5229zT+WYFSVk9VQSiTVp7Q==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxvUqFyEjJQyreQlPvxC6mG1Qj2pnHykrur3vro3lGl4BLHnWss
 YG17NsA2BGk66Vv+pBZM2w1aNVbHLUZF0mHKn+eVm+3yaX3XcYiAAJtIFKNtE6IfOHZA7smX7N/
 S3yu97tA+sEziSkGDx8KX5MuZVI70d74=
X-Gm-Gg: ASbGncvvhRXoURWFTBm9c+SxraoGQxIgWG3LerL5QhL+jQlLpS9S5y6JBiw0e6rgHb+
 +dw6KvF1SWwRQDcnI19RgU83WPZGcdW45neVwX5QaEHrtZzFziyF9Roz5Z2BgYeqSoWO3UNyRuv
 rUJTkmN6nc+McrnMR6nYQ6V9dyAIhnEEhbLw==
X-Google-Smtp-Source: AGHT+IEChjVJAaQHlGSjHa9hTKxCJFyJzR7c9+aL/0QxNkhj4bg8SHCtIwSUXtZJZi5/vjBpZfQlumATcldCYDUWxqA=
X-Received: by 2002:a05:6102:290c:b0:4e5:9c06:39d6 with SMTP id
 ada2fe7eead31-4e59c063ae6mr471806137.2.1748373693026; Tue, 27 May 2025
 12:21:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250527175558.2738342-1-james.hilliard1@gmail.com>
 <631ed4fe-f28a-443b-922b-7f41c20f31f3@lunn.ch>
In-Reply-To: <631ed4fe-f28a-443b-922b-7f41c20f31f3@lunn.ch>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 27 May 2025 13:21:21 -0600
X-Gm-Features: AX0GCFvF6Ti9-VC-WdHc6MfKeYhf1F3qOQDDP4BI4jj848sa9rzAvWhhkHP0KPs
Message-ID: <CADvTj4rGdb_kHV_gjKTJNkzYEPMzqLcHY_1xw7wy5r-ryqDfNQ@mail.gmail.com>
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

T24gVHVlLCBNYXkgMjcsIDIwMjUgYXQgMToxNOKAr1BNIEFuZHJldyBMdW5uIDxhbmRyZXdAbHVu
bi5jaD4gd3JvdGU6Cj4KPiBPbiBUdWUsIE1heSAyNywgMjAyNSBhdCAxMTo1NTo1NEFNIC0wNjAw
LCBKYW1lcyBIaWxsaWFyZCB3cm90ZToKPiA+IFNvbWUgZGV2aWNlcyBsaWtlIHRoZSBBbGx3aW5u
ZXIgSDYxNiBuZWVkIHRoZSBhYmlsaXR5IHRvIHNlbGVjdCBhIHBoeQo+ID4gaW4gY2FzZXMgd2hl
cmUgbXVsdGlwbGUgUEhZJ3MgbWF5IGJlIHByZXNlbnQgaW4gYSBkZXZpY2UgdHJlZSBkdWUgdG8K
PiA+IG5lZWRpbmcgdGhlIGFiaWxpdHkgdG8gc3VwcG9ydCBtdWx0aXBsZSBTb0MgdmFyaWFudHMg
d2l0aCBydW50aW1lCj4gPiBQSFkgc2VsZWN0aW9uLgo+Cj4gSSdtIG5vdCBjb252aW5jZWQgYWJv
dXQgdGhpcyB5ZXQuIEFzIGZhciBhcyBpIHNlZSwgaXQgaXMgZGlmZmVyZW50Cj4gdmFyaWFudHMg
b2YgdGhlIEg2MTYuIFRoZXkgc2hvdWxkIGhhdmUgZGlmZmVyZW50IGNvbXBhdGlibGVzLCBzaW5j
ZQo+IHRoZXkgYXJlIG5vdCBhY3R1YWxseSBjb21wYXRpYmxlLCBhbmQgeW91IHNob3VsZCBoYXZl
IGRpZmZlcmVudCBEVAo+IGRlc2NyaXB0aW9ucy4gU28geW91IGRvbid0IG5lZWQgcnVudGltZSBQ
SFkgc2VsZWN0aW9uLgoKRGlmZmVyZW50IGNvbXBhdGlibGVzIGZvciB3aGF0IHNwZWNpZmljYWxs
eT8gSSBtZWFuIHRoZSBQSFkgY29tcGF0aWJsZXMKYXJlIGp1c3QgdGhlIGdlbmVyaWMgImV0aGVy
bmV0LXBoeS1pZWVlODAyLjMtYzIyIiBjb21wYXRpYmxlcy4KCj4KPiAgICAgICAgIEFuZHJldwpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0z
MiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpo
dHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51
eC1zdG0zMgo=
