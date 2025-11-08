Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BFC5C42CC8
	for <lists+linux-stm32@lfdr.de>; Sat, 08 Nov 2025 13:31:27 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E4FA4C5A4C5;
	Sat,  8 Nov 2025 12:31:26 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D9C24C32EB0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  8 Nov 2025 12:31:24 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id
 98e67ed59e1d1-341d07c020fso2092461a91.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 08 Nov 2025 04:31:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1762605083; x=1763209883;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jFqjvE99b45pu2oCz9ajTBa0meyTTID/k0aUamXBwSM=;
 b=kfM56qhHb3xUe+WPq5JSWJV82JgEabL1ggK0sBEigEGzXI034QuVxC73qDSo3+lgyK
 LwoP6X3En7V9+adL1mQZrZepBhtsG4OEVfPx8DxYOIw8dlsVXhm5W3I0uFPebqeA9Vv8
 ZlVvIN+28MdUh0ZO2FzBIu3fFsULU5rhXrk7Ks1N1dD6Ik5frFWQbxJXKmF5Oii7dGeI
 CnRQA0PGGJEPck4Dcy+9WK3uCYCWFjWhJzbqaZjMwplDZ2V359Q7Wt9PFx7C/9lXpVm1
 KY7ijcvBmL/F/wypW6pmNewI8LA2Hy55MIxP7BzgrIhfsLowVd0V62o4ocynoOZfklBd
 r6vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762605083; x=1763209883;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=jFqjvE99b45pu2oCz9ajTBa0meyTTID/k0aUamXBwSM=;
 b=IwlxU/8hU0MA6wgrmI3ckX/Uo/NFlSFOyg1z/dbrog5MmkltsbioiDMN8TBUycFh9Z
 IfswYyL1W85j4Hvn6QWOoaXDwkQtuWcpgG2nenz8UAotFvy+NE81jqMNTBQs6i5pjCs9
 IH+/5RHI91ld+qOYOtdrqBgYSn4OmWckaexRIQyccWWc1Ok04YY9Gd20M1QyiO1KHYIE
 sbp6CVbXeTNMk/cOOII4+ckebO4ugvnWiu3YtNYnXYMbdC4csDJPGT8RcfETcjGSmOB3
 2tH7I5WKdWAeKlmkB71enabMJJA+Dxh/ewYxnZBJdz9xt+TqX7TMbpVWPHuGaDdU7Qf2
 T1lw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZAGjs+8e3K5YikCimM6MStdnPHrAZfREQady/H1uznWbm+yCbDTnZCotU1I96I+hKpLBit6N1dXNWdw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw1/jd5Q3aivSktocaPY4FHxNl1cwIWGWo6vBVHW5fBQrYMMH+3
 2mig6r9jJgQmOPL2fTI1lR61SBCnbtgdH3qlnkiLOyDbgoyr+r6qcTewOPPybxmwRLzKucWojAs
 5dEavraHz+nEaMa3PeJMid0KjJdgTh5k=
X-Gm-Gg: ASbGncuAgKb6S61YJ9YGG2PxvyWyNxG7VtqekT0bkanvoungPLltRrDh4IcOOxqYIlh
 Jrzqbxm9+5AkPSxvFqYsMHqg9xTh0KRkNmvZkhjQ+71F2q87diZW1taMKR8lKC0lTD8Pm8haKgC
 mgt8OH9uGHns1F9wQ2+WBKuBWEyH774NRtrftz0Q7X/rPkUmDTurzFouV/GJyjIXgHJV6xf4gRw
 YmaPBfUGWqRocZcErtM2Fzy8TPMtdtgK0HpKu8veRSUEeuAzle+LWPyjNu6DeGG9b05GYE497o9
 vZA0jqU34vj+MDq6r12ruKlwcoqoj9H3OKvrOg==
X-Google-Smtp-Source: AGHT+IHx494bsoHJaju4RengP4iXpGRFmMQLliiMWy2Q89R/cSWBMiB3q+hcgQyoomcv+0z0cS+rAooMlyw+VCTekJU=
X-Received: by 2002:a17:902:f791:b0:297:dfc8:8fd with SMTP id
 d9443c01a7336-297e571236dmr29139155ad.51.1762605083407; Sat, 08 Nov 2025
 04:31:23 -0800 (PST)
MIME-Version: 1.0
References: <aQ4ByErmsnAPSHIL@shell.armlinux.org.uk>
 <E1vHNSG-0000000DkSh-4BIj@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1vHNSG-0000000DkSh-4BIj@rmk-PC.armlinux.org.uk>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 8 Nov 2025 13:31:12 +0100
X-Gm-Features: AWmQ_bn_kIDv-pwz4dNwmzBqCanYs2atUFgMMshyNEi0RKuzPdaQ1v4towlIcoM
Message-ID: <CAFBinCBp1x3KWe-5mWoGwFEVxEoSKhTXKYfGgNKS-eDsbW8X+A@mail.gmail.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Emil Renner Berthing <kernel@esmil.dk>,
 Eric Dumazet <edumazet@google.com>,
 Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Keguang Zhang <keguang.zhang@gmail.com>,
 Minda Chen <minda.chen@starfivetech.com>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
 linux-mips@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 09/16] net: stmmac: meson8b: use
	stmmac_get_phy_intf_sel()
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

T24gRnJpLCBOb3YgNywgMjAyNSBhdCAzOjI54oCvUE0gUnVzc2VsbCBLaW5nIChPcmFjbGUpCjxy
bWsra2VybmVsQGFybWxpbnV4Lm9yZy51az4gd3JvdGU6Cj4KPiBVc2Ugc3RtbWFjX2dldF9waHlf
aW50Zl9zZWwoKSB0byBkZWNvZGUgdGhlIFBIWSBpbnRlcmZhY2UgbW9kZSB0byB0aGUKPiBwaHlf
aW50Zl9zZWwgdmFsdWUsIHZhbGlkYXRlIHRoZSByZXN1bHQgYW5kIHVzZSB0aGF0IHRvIHNldCB0
aGUKPiBjb250cm9sIHJlZ2lzdGVyIHRvIHNlbGVjdCB0aGUgb3BlcmF0aW5nIG1vZGUgZm9yIHRo
ZSBEV01BQyBjb3JlLgo+Cj4gU2lnbmVkLW9mZi1ieTogUnVzc2VsbCBLaW5nIChPcmFjbGUpIDxy
bWsra2VybmVsQGFybWxpbnV4Lm9yZy51az4KUmV2aWV3ZWQtYnk6IE1hcnRpbiBCbHVtZW5zdGlu
Z2wgPG1hcnRpbi5ibHVtZW5zdGluZ2xAZ29vZ2xlbWFpbC5jb20+Cl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApM
aW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
