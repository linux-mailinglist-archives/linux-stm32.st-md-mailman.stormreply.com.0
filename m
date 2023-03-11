Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B716B6115
	for <lists+linux-stm32@lfdr.de>; Sat, 11 Mar 2023 22:45:07 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D3292C6A60C;
	Sat, 11 Mar 2023 21:45:06 +0000 (UTC)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com
 [209.85.219.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 67E4BC6A608
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 11 Mar 2023 21:45:05 +0000 (UTC)
Received: by mail-yb1-f170.google.com with SMTP id h97so1462819ybi.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 11 Mar 2023 13:45:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678571104;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V78i6y2U0JrvgA27xfI4kIOjh7BS243z1h7M0b9g4iI=;
 b=CAWhIbPWKjVi7CdJFPa7TuXndq4ajKqJs7evVWtdvZ1Pm8sMxs5sOFbn2CFGHFiVXS
 g2hzPCQRVOgkYRF8TkjIMf1oF+ZamxeA/w5E/VAufRVu5xWmM6UPUQ4KufBLuxnz96mJ
 GSEor/3TSqHw7KHYRUYMR7Id0wWUxney1RDbUuK/Mi0HT6tj/rjG1po4YeIb8F6GA/AM
 P+vGZB4uQgfLL+XzyZnQiLYZSQmQTFLj4GdkShV0lfzb+z0/DroSnhVMUaHtukAWFc+x
 0AH9qEw13tlZn5lJHc29ngleS1VCBg6q0uAyXPdaFV+w2smVJjxa1PO0cogHtqypnOIE
 yfHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678571104;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V78i6y2U0JrvgA27xfI4kIOjh7BS243z1h7M0b9g4iI=;
 b=1WKtlqHqoF/XRi/HzOiuMMcAzDcrrKl41bbAdQvxvViPe83/N59+cIROZkEx9bUeAe
 8wlXbRIjJgzfdem3prL3bNO6QoHAeA/aWi0EHqjS5UowfnQbuF9Ew+mqG8YxiuXCppW5
 9283zioqFgDfAA73Jpnyq4EuY8yOB93sgUjeXR9C+Rx0sspsdDV2Sc6aBQmcutT+xTGH
 VzHvXgkK38mu9pPeBDROJAJ/ZVyAHvjKM8PEICq2D6Ik/7Hm8xGSoL89j86QBORTu1Q5
 Ed5nMClsPkoDZ86hqHjZvvHLquJw76rWTXHwZ0W0Lkf9RKSXc9vxn3k3mmWo+TkwapTY
 3trg==
X-Gm-Message-State: AO0yUKUWjQ+RsvHvnmutyVrY1WNIjQQAIS6yZEz+ipsSyyssdTZ3beOL
 ECfHPdTteZDSW5q2n9fFNnc23aWTQ0qtomXcUBRLJQ==
X-Google-Smtp-Source: AK7set+39HzMoBpl+vvm9JGXuO6EGGnCk4eBVUYGG6a176w4mALlPDxN42Bby7S6RrQONDPKM6nr5DzH2Xk3Aa6DWwk=
X-Received: by 2002:a05:6902:4f4:b0:a06:5ef5:3a82 with SMTP id
 w20-20020a05690204f400b00a065ef53a82mr14712961ybs.5.1678571104368; Sat, 11
 Mar 2023 13:45:04 -0800 (PST)
MIME-Version: 1.0
References: <ZAxFBR3TdA7jUAgJ@gondor.apana.org.au>
 <E1pavEB-002xbR-I9@formenos.hmeau.com>
In-Reply-To: <E1pavEB-002xbR-I9@formenos.hmeau.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 11 Mar 2023 22:44:52 +0100
Message-ID: <CACRpkdb-tCWAHS3Bt8q2q3sXE5bWVVf42_qOS0ogKhCj_VRksw@mail.gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Li kunyu <kunyu@nfschina.com>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-crypto@vger.kernel.org,
 mcoquelin.stm32@gmail.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [v7 PATCH 7/8] crypto: stm32 - Fix empty message
	processing
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

T24gU2F0LCBNYXIgMTEsIDIwMjMgYXQgMTA6MDnigK9BTSBIZXJiZXJ0IFh1IDxoZXJiZXJ0QGdv
bmRvci5hcGFuYS5vcmcuYXU+IHdyb3RlOgoKPiBDaGFuZ2UgdGhlIGVtcHR5bXNnIGNoZWNrIGlu
IHN0bTMyX2hhc2hfY29weV9oYXNoIHRvIHJlbHkgb24gd2hldGhlcgo+IHdlIGhhdmUgYW55IGV4
aXN0aW5nIGhhc2ggc3RhdGUsIHJhdGhlciB0aGFuIHdoZXRoZXIgdGhpcyBwYXJ0aWN1bGFyCj4g
dXBkYXRlIHJlcXVlc3QgaXMgZW1wdHkuCj4KPiBBbHNvIGF2b2lkIGNvbXB1dGluZyB0aGUgaGFz
aCBmb3IgZW1wdHkgbWVzc2FnZXMgYXMgdGhpcyBjb3VsZCBoYW5nLgo+Cj4gU2lnbmVkLW9mZi1i
eTogSGVyYmVydCBYdSA8aGVyYmVydEBnb25kb3IuYXBhbmEub3JnLmF1PgoKRXhjZWxsZW50IHBh
dGNoLiBBbHNvIHdvcmtzIGZsYXdsZXNzbHkuClJldmlld2VkLWJ5OiBMaW51cyBXYWxsZWlqIDxs
aW51cy53YWxsZWlqQGxpbmFyby5vcmc+ClRlc3RlZC1ieTogTGludXMgV2FsbGVpaiA8bGludXMu
d2FsbGVpakBsaW5hcm8ub3JnPgoKWW91cnMsCkxpbnVzIFdhbGxlaWoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0
CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
