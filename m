Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BCBEA87B05
	for <lists+linux-stm32@lfdr.de>; Mon, 14 Apr 2025 10:52:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 221E1C78028;
	Mon, 14 Apr 2025 08:52:32 +0000 (UTC)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com
 [209.85.221.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DB6C6C71289
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Apr 2025 08:52:30 +0000 (UTC)
Received: by mail-vk1-f174.google.com with SMTP id
 71dfb90a1353d-52413efd0d3so1707431e0c.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Apr 2025 01:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744620749; x=1745225549;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RK1FjQCAv98Eay4SPuOitMP3sY6he/myS3klmD5dY54=;
 b=Gm1iAmFds726uRoc2t8Zjfao1g+KlAN36HEhhrSF5UcKxGXOnpqS2CM9Pk+7HrlpHG
 Lw2AWOuzToUaJUq766tO6wNKad1GoxCYQq2UL68U5XHr9zRf8F3vioIS4HhfJ4lnsunt
 T8UxPW/6iGKSuonGUog7URnDrPmBe+TUPlvXdHeywopSFyYZSJ6jCS6kbmeTeav11OUE
 aLC9l+TpUSQHn7qRLld7kzOwBOJdUXZRuZ1+MQyWjGAkGoXe+GM9cA55h2o67qPJKYEx
 H5H5nosAOwffRXgw+4FNkmwsmJ2giiRHUnr4NUxirBP9wbJ9PWpXngWQD+N3v20IfG/t
 IrlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744620749; x=1745225549;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RK1FjQCAv98Eay4SPuOitMP3sY6he/myS3klmD5dY54=;
 b=FPc5YdYmJFNY41SfvnC4Phz4yDwkEU1RP6vtMLk5/3/7jciNEHaNpOv3+4xyrAkYWa
 +TkVN1WF4fvagvx4O7ZDju6IJc4vYXw0hbX0rJAaJujj7W5OIqG1iePnN2bAB7ndXqef
 bpOTVhH6MQDYGGoI87WOaSNHI4ni6Qbt2WJlm7PzHg0Bh/tLWoJ0O0mQGd+lMW1CDCAZ
 Jq3+7h1rnxmIiZUX4HruTyk8xfhRTIok3tcOf8sSVpRrNzATL1Ts6IdmJG4cI74bDA1e
 G5G60Sh0wgKPrJ/6bPV84X8q6BVsr52z0HL08TMnVOdACVwJyt4w7JPzotEtn/JjRpWd
 nvuA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUs/F2Mxd4yn/TXoW5HgNYcHQo/nYYgLs02wZ3zxzJCE8CHwfkVGGTHzkfNT/r7xpUks88CWkxuTPUTyQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yxi9aiTL5JuYH5mM80HwBj7PfcB9HEQQxYBhZ0nOvyk93RP0TIc
 9KA+tk3haFw//IPLiA0chLu9Hvotd41atU+FuL0w+RJhStBjPsCgaVwPYN+saXIIu3RcvZ0cPhj
 Jrq7Epzgn32RZIa4KY6pS4w9V6Q0=
X-Gm-Gg: ASbGncvk7Uz9o8KOfgPQlJAEZKyA5I7otU/lPyEhCuPBzy3YIEKcgHNSL+Sd5alEyBZ
 taCS+cglcQL5qPtkLeNMM+ed5RJgLjC6Iulbz/1aldoFehLSDqnhKjDziK5UL1z94XQUHgnjds1
 nhYYFo+anSOBXAOKv/nY7thw==
X-Google-Smtp-Source: AGHT+IHDQYAJXdFj/iNG0npq557KpIZpBxXkLL2l+9hPwfBOs75fehWJLdCe6um+3vhYJFwWD4BbKD7nZni0VXc/gQE=
X-Received: by 2002:a05:6122:319d:b0:527:67da:74ee with SMTP id
 71dfb90a1353d-527c34d1fd1mr7094050e0c.5.1744620749318; Mon, 14 Apr 2025
 01:52:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250407120317.127056-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250407104447.072449cd@kernel.org>
In-Reply-To: <20250407104447.072449cd@kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 14 Apr 2025 09:52:03 +0100
X-Gm-Features: ATxdqUEHxcklYN6PVPbrfMER-iWYYX-JiIMzDYloXSJi2mPCrezqGIzibq2L6CY
Message-ID: <CA+V-a8uqkG+u_ZXztPe7R0BNV6BA46KgGRHRW-G3axBt566pEQ@mail.gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Eric Dumazet <edumazet@google.com>, linux-stm32@st-md-mailman.stormreply.com,
 Rob Herring <robh@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 Jose Abreu <joabreu@synopsys.com>, Paolo Abeni <pabeni@redhat.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, Philipp Zabel <p.zabel@pengutronix.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next v5 0/3] Add GBETH glue layer
 driver for Renesas RZ/V2H(P) SoC
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

SGkgSmFrdWIsCgpPbiBNb24sIEFwciA3LCAyMDI1IGF0IDY6NDTigK9QTSBKYWt1YiBLaWNpbnNr
aSA8a3ViYUBrZXJuZWwub3JnPiB3cm90ZToKPgo+IE9uIE1vbiwgIDcgQXByIDIwMjUgMTM6MDM6
MTQgKzAxMDAgUHJhYmhha2FyIHdyb3RlOgo+ID4gVGhpcyBwYXRjaCBzZXJpZXMgYWRkcyBzdXBw
b3J0IGZvciB0aGUgR0JFVEggKEdpZ2FiaXQgRXRoZXJuZXQpIGdsdWUgbGF5ZXIKPiA+IGRyaXZl
ciBmb3IgdGhlIFJlbmVzYXMgUlovVjJIKFApIFNvQy4gVGhlIEdCRVRIIElQIGlzIGludGVncmF0
ZWQgd2l0aAo+ID4gdGhlIFN5bm9wc3lzIERlc2lnbldhcmUgTUFDICh2ZXJzaW9uIDUuMjApLiBU
aGUgY2hhbmdlcyBpbmNsdWRlIHVwZGF0aW5nCj4gPiB0aGUgZGV2aWNlIHRyZWUgYmluZGluZ3Ms
IGRvY3VtZW50aW5nIHRoZSBHQkVUSCBiaW5kaW5ncywgYW5kIGFkZGluZyB0aGUKPiA+IERXTUFD
IGdsdWUgbGF5ZXIgZm9yIHRoZSBSZW5lc2FzIEdCRVRILgo+Cj4gVGhpcyB3YXMgcG9zdGVkIHBy
aW9yIHRvIHRoZSAibmV0LW5leHQgaXMgT1BFTiIgYW5ub3VuY2VtZW50Ogo+IGh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL2FsbC8yMDI1MDQwNzA1NTQwMy43YThmNDBkZkBrZXJuZWwub3JnLwo+Cj4g
SW4gdGhlIGludGVyZXN0IG9mIGZhaXJuZXNzIHRvd2FyZHMgdGhvc2Ugd2hvIGNvcnJlY3RseSB3
YWl0Cj4gZm9yIHRoZSB0cmVlIHRvIGJlIG9wZW4gSSB3aWxsIGFzayB5b3UgdG8gcmVwb3N0IHRo
aXMgYWdhaW4sCj4gaW4gYSBjb3VwbGUgb2YgZGF5cy4KPgpBcmUgeW91IG9rIGZvciBtZSB0byBu
b3cgcmVzcGluIHRoaXMgc2VyaWVzPwoKQ2hlZXJzLApQcmFiaGFrYXIKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0
CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
