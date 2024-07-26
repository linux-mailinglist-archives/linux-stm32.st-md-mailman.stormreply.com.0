Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B1693D9D9
	for <lists+linux-stm32@lfdr.de>; Fri, 26 Jul 2024 22:37:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6E256C78018;
	Fri, 26 Jul 2024 20:37:40 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 96638C71280
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Jul 2024 20:37:33 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-52f04150796so2597834e87.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Jul 2024 13:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1722026253; x=1722631053;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=657P5JeC8SjYcUxgWCTWkbvBvs/fWchllBX/2A8VqhE=;
 b=Zku6I+w6ajhEo60OAeLZA1zHN8AclxNdRgUO7xARggAz1+ybKHYyLULAoOwxV9FFRs
 D/7NtzlIao0AMT9znlwAqTVGiuoYZvKl1XV+idrKsjIAROCWUknCB698bN1uvz8Ehwg+
 W6u2fLYZMo7NmRJZOYRSBU9WAF/aIJspajfO5i/3KpGZhbjXtaVIiMnJ4kSbZ9dCKB3X
 eWGTZpejSW9VCpz/q9iyO/du8l44a+VG4NPatBeDGHpA0AliLZWuigTc0HvB94uqLbWZ
 Hia0eAdFkHHT6v28uvncKrv1KLyLhS0f8kA/z1MBR3pDzwwZpTiM6X6TxtRwdGM9vqNK
 VvMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722026253; x=1722631053;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=657P5JeC8SjYcUxgWCTWkbvBvs/fWchllBX/2A8VqhE=;
 b=Wjfk8TRNq5voG281q+B9XvJBs12W9CnLe7YdNPtnOy4XoNRl91uWbEcv3KXPYK6L23
 zeb2xMlAhSir8En1di2GBEYLINx+qXZnhMH+68M+m+QSkze5HM077/yfuXoBus1LtQFu
 GOfnvZRQA+G3uyQCVzy5LY49yt8vEwMHFfcqaijf+XYuEjL7+9H7N9nPWCARPEMnO4nB
 dKYerKAjFk3V+FDq9n88EDfYzhBaUntW2+HlP0j+PZ5HE1Pt3OsviQDa+2klehEOlkpW
 4GO1tG8eIX8MhICMQCYkOth3/41lUzirMux76PtAo/CfCnlHUabXIjIlrWd2oRdQ8eaS
 cSNA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXru48lXNlaAOJiR0veZmbNtI+/5pzwX2GOWks7OlzgK/sGn53WK5pSotEq/Lme4iqchSKHYDqcWcT1gu4S/5Vee3X15R4XFiBVQhs8tWxzSkiW/LWtSqXb
X-Gm-Message-State: AOJu0YyzqTvaLksw0geLbw8G95BBWMsXjr5/nH1ENmcxh0OEX6u4DZCo
 n3qGNa4diThw8ZlO6gZv3RAOBmxXUSbswS3LpNH+WiEUi5kQir5kOsm4gp3xeykghYtujKi0uHX
 qUGN0Hn9+kIPQtKwMZbwO8vw90DVXZSDxPAMwHA==
X-Google-Smtp-Source: AGHT+IHJKjb7DhnOe6IE0tF8j9C9EWdehdE6mzT6mGSHyOSD6devxjVA8ebqqDI8599aitXQ59+ccERwN/3nlh8FY+w=
X-Received: by 2002:a05:6512:246:b0:52c:d967:79c6 with SMTP id
 2adb3069b0e04-5309b270bd5mr545733e87.20.1722026252672; Fri, 26 Jul 2024
 13:37:32 -0700 (PDT)
MIME-Version: 1.0
References: <20240722160022.454226-1-valentin.caron@foss.st.com>
In-Reply-To: <20240722160022.454226-1-valentin.caron@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 26 Jul 2024 22:37:21 +0200
Message-ID: <CACRpkdbphGF_2P+bezdaYLE4n_1Z5NYjJfcuCh01ysB6QHC=qQ@mail.gmail.com>
To: Valentin Caron <valentin.caron@foss.st.com>
Cc: linux-rtc@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 0/4] rtc: stm32: add pinctrl interface
	to handle RTC outs
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

SGkgVmFsZW50aW4sCgpPbiBNb24sIEp1bCAyMiwgMjAyNCBhdCA2OjAy4oCvUE0gVmFsZW50aW4g
Q2Fyb24KPHZhbGVudGluLmNhcm9uQGZvc3Muc3QuY29tPiB3cm90ZToKCj4gVGhpcyBzZXJpZXMg
YWRkcyBhIHBpbmN0cmwvcGlubXV4IGludGVyZmFjZSB0byBjb250cm9sIFNUTTMyIFJUQyBvdXRw
dXRzLgoKSW50ZXJlc3RpbmchIEkgdGhpbmsgaXQgaXMgdGhlIGZpcnN0IHBpbiBjb250cm9sbGVy
IG91dHNpZGUgb24KZHJpdmVycy9waW5jdHJsIGluIHRoZSBrZXJuZWwgdHJlZS4KClBsZWFzZSBp
bmNsdWRlIG1lIGFuZCB0aGUgbGludXgtZ3Bpb0B2Z2VyLmtlcm5lbC5vcmcgbGlzdCBpbgpzdWJz
ZXF1ZW50IHBvc3RpbmdzLCBJIHdhbnQgdG8gYmUgc3VyZSB3aGF0IGdldHMgbWVyZ2VkIGhlcmUK
YW5kIEkgb25seSBub3RpY2VkIHRoaXMgZnJvbSB0aGUgTFdOIGRyaXZlciBwYXRjaGVzIHN1bW1h
cnkuCgo+IEFzIGRldmljZS10cmVlcyB3aWxsIGJlIHVwc3RyZWFtZWQgc2VwYXJhdGVseSwgaGVy
ZSBpcyBhbiBleGFtcGxlOgo+Cj4gc3RtMzItcGluY3RybCB7Cj4gICAgIHJ0Y19yc3ZkX3BpbnNf
YTogcnRjLXJzdmQtMCB7Cj4gICAgICAgICBwaW5zIHsKPiAgICAgICAgICAgICBwaW5tdXggPSA8
U1RNMzJfUElOTVVYKCdCJywgMiwgQUYxKT4sIC8qIE9VVDIgKi8KPiAgICAgICAgICAgICAgICAg
ICAgICA8U1RNMzJfUElOTVVYKCdJJywgOCwgQU5BTE9HKT47IC8qIE9VVDJfUk1QICovCj4gICAg
ICAgICB9Owo+ICAgICB9Owo+IH07Cj4KPiBzdG0zMi1ydGMgewo+ICAgICBwaW5jdHJsLTAgPSA8
JnJ0Y19yc3ZkX3BpbnNfYSAmcnRjX2FsYXJtYV9waW5zX2E+OwoKU28gdGhlIGZpcnN0IG9uZSBp
cyBhIGdlbmVyaWMgcGluIGNvbnRyb2wgc2V0dGluZyBhbmQgdGhlIHNlY29uZApvbmUgaXMgYSBo
b2cgZm9yIHRoZSBwaW5zIGRlZmluZWQgYnkgdGhlIGRldmljZSBpdHNlbGYuCgpJdCdzIGNsZXZl
ciwgYW5kIHdvcmtzLiBOaWNlIHdvcmshCgooVGhlcmUgc2hvdWxkIHByb2JhYmx5IGJlIGEgY29t
bWVudCBpbiB0aGUgZGV2aWNlIHRyZWUgdG8gc2F5CndoYXQgaXMgZ29pbmcgb24gc28gcGVvcGxl
IHJlYWRpbmcgaXQgYXJlIG5vdCBjb25mdXNlZC4pCgo+ICAgICAvKiBFbmFibGUgYnkgZm9vLWRl
dmljZSAqLwo+ICAgICBydGNfbHNjb19waW5zX2E6IHJ0Yy1sc2NvLTAgewo+ICAgICAgICAgcGlu
cyA9ICJvdXQyX3JtcCI7Cj4gICAgICAgICBmdW5jdGlvbiA9ICJsc2NvIjsKPiAgICAgfTsKPgo+
ICAgICAvKiBFbmFibGUgYnkgc3RtMzItcnRjIGhvZyAqLwo+ICAgICBydGNfYWxhcm1hX3BpbnNf
YTogcnRjLWFsYXJtYS0wIHsKPiAgICAgICAgIHBpbnMgPSAib3V0MiI7Cj4gICAgICAgICBmdW5j
dGlvbiA9ICJhbGFybS1hIjsKPiAgICAgfTsKCllvdXJzLApMaW51cyBXYWxsZWlqCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxp
bmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8v
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMy
Cg==
