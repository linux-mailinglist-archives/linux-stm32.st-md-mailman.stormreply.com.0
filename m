Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA96232C71
	for <lists+linux-stm32@lfdr.de>; Thu, 30 Jul 2020 09:19:58 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 08A9BC36B30;
	Thu, 30 Jul 2020 07:19:58 +0000 (UTC)
Received: from mail-il1-f193.google.com (mail-il1-f193.google.com
 [209.85.166.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AE9EEC36B25
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Jul 2020 17:40:01 +0000 (UTC)
Received: by mail-il1-f193.google.com with SMTP id g6so5198985ilc.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Jul 2020 10:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=aEIYYq2kW/WiB6gUi4gfbO509LEn/L/Pyhh8ZaCEkmE=;
 b=ZIAkcoprPEJ+NVIytPXW7aSmDNMFVtiigUDPl/ClKFR8KIIQsziLh0oVZ0wnHihULU
 uXFjNq74e7qd8p4nRqlufhnQ+KV4/AnDIfG6PkEccPwwY53UWbBQdoKVHDbnlYm0x/zt
 7g85MxLYVCd60/lbpRH2F1wAn8yCWMLdffq31MXEdjhEL95Y5uXMgJ8QNfLUm6QMcLK0
 gTFcJh5phQAFCZbSYhfQx3ULbKrbPvIYdy8Q8W0XjxIxO9rs75F7+8Bjf9c4SdBjpjdY
 VRqzj/RazUGauvupuwGUFHaVitpZT5dE8vtqXDkAJ/1m5e15P/awYrDdN2P3aNKb0Cjm
 EhwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=aEIYYq2kW/WiB6gUi4gfbO509LEn/L/Pyhh8ZaCEkmE=;
 b=j8JCCVFZbf/qjHitDWZPt5+iy3IIeKHX+JvlLgQbueOme9r6c7fAlqEolziXkUWhu9
 Mi+0tl9DQjZZsvsg4zl5zNNIlEnwmISIFklabBrhw186V9T4rJrqfBOZOLpfZ/ySD7sk
 7tMVkS4NQMioE+jY+do4QjBY7J3EZghIlggwU7uk68xjKEWuifQueaeQQi8XKuPKy9Vn
 yuDBrXfscwg/GUZYZ3YVmJsyaSFjsD7igCfFAWqeQm3gv9BA3kBbSA6eVg+6s79bRMW8
 bqPrQ8wLG5jUgWQGZrlcQfothONA/NI1uQ30244uDtE2vaYVKdzlPN1CWxLICfae4Abw
 ebLw==
X-Gm-Message-State: AOAM532lEzOAegdgKJo5iTYdHyZ9UJgxS6kayO1cNuurCfenr5VImBrn
 G69wPI/wY9GzL3Ck/CPnn0/FM4HsQ3OP3o8paaw=
X-Google-Smtp-Source: ABdhPJwlp3xYVIJRiw+Y130nbuhCK+JvFexj+zBfdC3ovRWCIz3H/lUQR0sXo63rj1TyhNei7XVXo1nGHy8fELiAB2A=
X-Received: by 2002:a92:8946:: with SMTP id n67mr16523409ild.168.1596044400155; 
 Wed, 29 Jul 2020 10:40:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200729160942.28867-1-krzk@kernel.org>
 <20200729160942.28867-2-krzk@kernel.org>
In-Reply-To: <20200729160942.28867-2-krzk@kernel.org>
From: Tomasz Figa <tomasz.figa@gmail.com>
Date: Wed, 29 Jul 2020 19:39:47 +0200
Message-ID: <CA+Ln22E_VkAYz7cpE1TdVGj6AkjWOgyVm01gzSjMPs=JE8+qLw@mail.gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
X-Mailman-Approved-At: Thu, 30 Jul 2020 07:19:57 +0000
Cc: Catalin Marinas <catalin.marinas@arm.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, Will Deacon <will@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 "moderated list:SAMSUNG SOC CLOCK DRIVERS" <linux-samsung-soc@vger.kernel.org>,
 Sylwester Nawrocki <snawrocki@kernel.org>, Cedric Roux <sed@free.fr>,
 Russell King <linux@armlinux.org.uk>,
 "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
 Lihua Yao <ylhuajnu@outlook.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Kukjin Kim <kgene@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Guenter Roeck <linux@roeck-us.net>, Sergio Prado <sergio.prado@e-labworks.com>,
 linux-watchdog@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Simtec Linux Team <linux@simtec.co.uk>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Stephen Boyd <sboyd@kernel.org>, patches@opensource.cirrus.com,
 Vincent Sanders <vince@simtec.co.uk>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Kyungmin Park <kyungmin.park@samsung.com>
Subject: Re: [Linux-stm32] [PATCH 1/7] clk: samsung: s3c64xx: Declare
 s3c64xx_clk_init() in shared header
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

MjAyMOW5tDfmnIgyOeaXpSjmsLQpIDE4OjExIEtyenlzenRvZiBLb3psb3dza2kgPGtyemtAa2Vy
bmVsLm9yZz46Cj4KPiBUaGUgczNjNjR4eF9jbGtfaW5pdCgpIGlzIGRlZmluZWQgYW5kIHVzZWQg
YnkgY2xrLXMzYzY0eHggZHJpdmVyIGFuZAo+IGFsc28gdXNlZCBpbiBtYWNoLXMzYzY0eHggbWFj
aGluZSBjb2RlLiAgTW92ZSB0aGUgZGVjbGFyYXRpb24gdG8gYQo+IGhlYWRlciB0byBmaXggVz0x
IGJ1aWxkIHdhcm5pbmc6Cj4KPiAgICAgZHJpdmVycy9jbGsvc2Ftc3VuZy9jbGstczNjNjR4eC5j
OjM5MToxMzogd2FybmluZzogbm8gcHJldmlvdXMgcHJvdG90eXBlIGZvciAnczNjNjR4eF9jbGtf
aW5pdCcgWy1XbWlzc2luZy1wcm90b3R5cGVzXQo+ICAgICAgIDM5MSB8IHZvaWQgX19pbml0IHMz
YzY0eHhfY2xrX2luaXQoc3RydWN0IGRldmljZV9ub2RlICpucCwgdW5zaWduZWQgbG9uZyB4dGFs
X2YsCj4KPiBTaWduZWQtb2ZmLWJ5OiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprQGtlcm5lbC5v
cmc+Cj4gLS0tCj4gIE1BSU5UQUlORVJTICAgICAgICAgICAgICAgICAgICAgICB8ICAxICsKPiAg
YXJjaC9hcm0vbWFjaC1zM2M2NHh4L2NvbW1vbi5jICAgIHwgIDEgKwo+ICBhcmNoL2FybS9tYWNo
LXMzYzY0eHgvY29tbW9uLmggICAgfCAgMiAtLQo+ICBkcml2ZXJzL2Nsay9zYW1zdW5nL2Nsay1z
M2M2NHh4LmMgfCAgMSArCj4gIGluY2x1ZGUvbGludXgvY2xrL3NhbXN1bmcuaCAgICAgICB8IDIx
ICsrKysrKysrKysrKysrKysrKysrKwo+ICA1IGZpbGVzIGNoYW5nZWQsIDI0IGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL2xpbnV4L2Ns
ay9zYW1zdW5nLmgKPgoKUmV2aWV3ZWQtYnk6IFRvbWFzeiBGaWdhIDx0b21hc3ouZmlnYUBnbWFp
bC5jb20+CgpCZXN0IHJlZ2FyZHMsClRvbWFzegpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJA
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
