Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FDBBA5C2B3
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Mar 2025 14:30:42 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BDE90C78F85;
	Tue, 11 Mar 2025 13:30:41 +0000 (UTC)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com
 [209.85.221.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 853D6C71289
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Mar 2025 13:30:40 +0000 (UTC)
Received: by mail-vk1-f173.google.com with SMTP id
 71dfb90a1353d-51eb1a6ca1bso2243374e0c.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Mar 2025 06:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741699839; x=1742304639;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OS+kx1EYJx8zGVZAVZxDQft66T1VTJ/fMWqkBxUi750=;
 b=CxSH6i+lU9ki7Muo4ShrZIc1rYHyDfpPcLd8FcLrYgDIFYsmN81vckM+6qcuBYX5i8
 IpCR9qVzf9iOKc9AhRTDBzfqmkojcicefNiXAeUVA+1IhTyeguNgmMlPQbK0y6bgXve2
 u5bW/OgdRFWEaH+KKc2j046LF3FV9ePX+UU4N6PSTu/emr0j3mz4TImp3Wuz24E8D1vA
 Oybeqk1n7YYph8Mkss79vO3ltYokNarU3y4r7++NS+t3eyZY2SVcYcpKabcjL5rmup0W
 1GMq0v553a1cGL+k/FnPFZoclj86QjCiU5yCk8X7gioWhxyQfhMr5wA9LvPw05Oe6Fug
 SxXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741699839; x=1742304639;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OS+kx1EYJx8zGVZAVZxDQft66T1VTJ/fMWqkBxUi750=;
 b=AmzHydTX4NTo+7ZtpZk98LGWtoS2BnleN6paoMHZg1VoEpyO0s5HWD7z6VvEhAMufd
 9MbWubmbdVEyoPnPwoj81f0cWjd863uEEBEgYPMLZQACBj5dysAR03ejRVcrJPcoXrz9
 OS0BdT/rEWGwjs+p6/D/g4pk2fva1eHindxF2D3HmhFDRWtdl1MSi7d8MvJtFqlOtw0f
 Km136wRiMxqJCUbdciXpi7nf3xu3GQi/VdxnASQqb13UGsTYAToFEehpZpVtKXbnOY+T
 nZtszaneOJ54xmwdU1Am4K03VzCOuzuGaf38h9vm/O09U0JXaib0pewcyskkK6hcmyNj
 vHQQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUG13VYKAoer7Z1VEmkeM56P9fHrvJ8uG0sEaLcYeDcHWKhChMBF8DYTkfLePOd4qBLJkw+DjoQXzv0SQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yz79kYTqpJoXBz1HLRTRvXd7/Im0go49SETrj+/brHes15ykyeU
 62McTXYiz+D8vNrEPF+iOwk8MwBB51c3sUrM0kSl324gLY+/5XI73U8YDju3PZbu+AI5PVWVx05
 D28Ko3K4IG2XmqWVMd8iy7dUTdWk=
X-Gm-Gg: ASbGnct6j1jY7hwWl5HaOl7QfvtZ1OTW8I2abog/6Gc7iDOOM4TRH1qReuJmjQK7Guu
 VI1k/757oHtFRSLIgkXy1em1yX+QVZ7yn8LEwfZ6J87vBeX8woDLEwFeB4NdzHYYOFuC1NNVgdi
 onh9tTZygtXEEJL7XBWOUSfurZ6Q==
X-Google-Smtp-Source: AGHT+IFy2Sl8rkBIl4+/ZfojG+Lp511BkNoNkiebfxbXz25a/xXmKtCtJuK/D9U65TOMGgOaav+c8ESCttCkqV6X1J8=
X-Received: by 2002:a05:6122:2011:b0:520:42d3:91aa with SMTP id
 71dfb90a1353d-523e3ff118fmr11782712e0c.2.1741699839299; Tue, 11 Mar 2025
 06:30:39 -0700 (PDT)
MIME-Version: 1.0
References: <Z82tWYZulV12Pjir@shell.armlinux.org.uk>
 <E1trIAQ-005nto-3w@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1trIAQ-005nto-3w@rmk-PC.armlinux.org.uk>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 11 Mar 2025 13:30:13 +0000
X-Gm-Features: AQ5f1Jp3UtuRRhR-96fKi5aM9eNN6ctPoGEYrjWhhbpHpPNGlFs33K9fIDMWwbw
Message-ID: <CA+V-a8u34cKgccW=qEw=FC34HH+Q6pVmRqeMq7Q_btxqkqNtnQ@mail.gmail.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Emil Renner Berthing <kernel@esmil.dk>,
 Eric Dumazet <edumazet@google.com>, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
 Alexandre Ghiti <alex@ghiti.fr>, Jose Abreu <joabreu@synopsys.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Minda Chen <minda.chen@starfivetech.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 Conor Dooley <conor@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 6/7] dt-bindings: deprecate "snps,
 en-tx-lpi-clockgating" property
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

T24gU3VuLCBNYXIgOSwgMjAyNSBhdCAzOjEz4oCvUE0gUnVzc2VsbCBLaW5nIChPcmFjbGUpCjxy
bWsra2VybmVsQGFybWxpbnV4Lm9yZy51az4gd3JvdGU6Cj4KPiBXaGV0aGVyIHRoZSBNSUkgdHJh
bnNtaXQgY2xvY2sgY2FuIGJlIHN0b3BwZWQgaXMgcHJpbWFyaWx5IGEgcHJvcGVydHkKPiBvZiB0
aGUgUEhZICh0aGVyZSBpcyBhIGNhcGFiaWxpdHkgYml0IHRoYXQgc2hvdWxkIGJlIGNoZWNrZWQg
Zmlyc3QuKQo+IFdoZXRoZXIgdGhlIE1BQyBpcyBjYXBhYmxlIG9mIHN0b3BwaW5nIHRoZSB0cmFu
c21pdCBjbG9jayBpcyBhIHNlcGFyYXRlCj4gaXNzdWUsIGJ1dCB0aGlzIGlzIGFscmVhZHkgaGFu
ZGxlZCBieSB0aGUgY29yZSBEZXNpZ25XYXJlIE1BQyBjb2RlLgo+Cj4gVGhlcmVmb3JlLCBzbnBz
LGVuLXR4LWxwaS1jbG9ja2dhdGluZyBpcyB0ZWNobmljYWxseSBpbmNvcnJlY3QsIHNvIHRoaXMK
PiBjb21taXQgZGVwcmVjYXRlcyB0aGUgcHJvcGVydHkgaW4gdGhlIGJpbmRpbmcuCj4KPiBTaWdu
ZWQtb2ZmLWJ5OiBSdXNzZWxsIEtpbmcgKE9yYWNsZSkgPHJtaytrZXJuZWxAYXJtbGludXgub3Jn
LnVrPgo+IC0tLQo+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0L3NucHMs
ZHdtYWMueWFtbCB8IDEgKwo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPgoKUmV2
aWV3ZWQtYnk6IExhZCBQcmFiaGFrYXIgPHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5l
c2FzLmNvbT4KCkNoZWVycywKUHJhYmhha2FyCgo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvbmV0L3NucHMsZHdtYWMueWFtbCBiL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvc25wcyxkd21hYy55YW1sCj4gaW5kZXggM2YwYWE0NmQ3
OThlLi43OGIzMDMwZGM1NmQgMTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL25ldC9zbnBzLGR3bWFjLnlhbWwKPiArKysgYi9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvbmV0L3NucHMsZHdtYWMueWFtbAo+IEBAIC00OTQsNiArNDk0LDcgQEAg
dGl0bGU6IFN5bm9wc3lzIERlc2lnbldhcmUgTUFDCj4KPiAgICBzbnBzLGVuLXR4LWxwaS1jbG9j
a2dhdGluZzoKPiAgICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL2Zs
YWcKPiArICAgIGRlcHJlY2F0ZWQ6IHRydWUKPiAgICAgIGRlc2NyaXB0aW9uOgo+ICAgICAgICBF
bmFibGUgZ2F0aW5nIG9mIHRoZSBNQUMgVFggY2xvY2sgZHVyaW5nIFRYIGxvdy1wb3dlciBtb2Rl
Cj4KPiAtLQo+IDIuMzAuMgo+Cj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwo+IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+IGxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
