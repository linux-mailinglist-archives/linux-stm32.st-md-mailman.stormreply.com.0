Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EFB478FEBD
	for <lists+linux-stm32@lfdr.de>; Fri,  1 Sep 2023 16:10:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C54CFC6B458;
	Fri,  1 Sep 2023 14:10:38 +0000 (UTC)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com
 [209.85.219.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 79967C6B44E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  1 Sep 2023 14:10:37 +0000 (UTC)
Received: by mail-yb1-f178.google.com with SMTP id
 3f1490d57ef6-d7b89ae27d3so1535008276.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 01 Sep 2023 07:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693577436; x=1694182236;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w5ivJRk6mwgIHtFh3KMVKCYCuw+/3Xv2OEnm7TPvNFg=;
 b=UBNeM1CWQr3vZ/JPW2xo5IwJceJMWI/gTOxXibmtGsWZ67XZXV/dWgy8nYef/61+60
 +awaM+XMSV7ucxOLj8ZEBOy3Se5it9ka7C6t4y4eNsMHo8wdIzVsXNwEf4Y1GkCEfuwr
 paK9/vXXch2DrF4RnlzuSGgFfDHM33wyrreNWoe63W5Y/ZlIPMrZ3BCbNo/bbIigPmw/
 kY005YQDzeLebjWOR3/j7W4xFgwY7w2cu4VtLgqplylbaRyxb96J+RvdklUYW/CPx3R4
 10ZGVmQEs6/2l3sri/6gs7SFrZzfID0IzNB0sb8gu+PoJdLMDBp/2iZqEsqwvvAgXQ0j
 FaQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693577436; x=1694182236;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w5ivJRk6mwgIHtFh3KMVKCYCuw+/3Xv2OEnm7TPvNFg=;
 b=jn/hGDX2NVp+NDy81yvIVfpTA2BrEWJXB+2OT7i1ygWOP6pkpTZ3IYan6pm9MFJPem
 DJx/iIp4lej79FLJ/plG9872wGqSgx6FD3oNBOC2IgMYP26XfcXfIsg54tm7CUqm0qLl
 PHeMVCqcqOkwXMMFdOYEo/boE/l7I7Y3qEEpWpXnSEexg6f+08oltTZPeGImVGS3np/2
 hUU0ePQ3uMgNQHSll6Y5R29sGDtTdIQSFXfXU9Xglq/g/z2Fa3axVHqU6Gg5D/HhlWvM
 qvBpMpUkkBDU57guIEpA7R2499Jtm4Q6pZ0puRd/2BYvOtBxc7QbTIsJO5+dHdt1Zazg
 YBAg==
X-Gm-Message-State: AOJu0Yxqvewe5gbzy5knMilwJIt+PEbbg95AMzkr39e0NPWhftbkI5FA
 nPEolLBAjYNAQOezRUqB6X/Cq4q0frS6dEjgwcpLpw==
X-Google-Smtp-Source: AGHT+IGeX6+J14WR9ieCPyefDidZy7twC0zUDNwqm05Rh5OKw5fhGR/Ho7cwhgB+niUlVC3unnXfoiKzgYTT1vOvBGg=
X-Received: by 2002:a25:258f:0:b0:d7a:edf3:f0a9 with SMTP id
 l137-20020a25258f000000b00d7aedf3f0a9mr2880483ybl.50.1693577435568; Fri, 01
 Sep 2023 07:10:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230901120836.1057900-1-yann.gautier@foss.st.com>
In-Reply-To: <20230901120836.1057900-1-yann.gautier@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 1 Sep 2023 16:10:23 +0200
Message-ID: <CACRpkdacRe5cPoSFJyEdo6nZrtmUHTNqMxf55CntvsdpFqhhrQ@mail.gmail.com>
To: Yann Gautier <yann.gautier@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Yang Yingliang <yangyingliang@huawei.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] mmc: mmci: stm32: add SDIO in-band
	interrupt mode
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

SGkgWWFubi9DaHJpc3RvcGhlLAoKdGhhbmtzIGZvciB5b3VyIHBhdGNoIQoKT24gRnJpLCBTZXAg
MSwgMjAyMyBhdCAyOjA44oCvUE0gWWFubiBHYXV0aWVyIDx5YW5uLmdhdXRpZXJAZm9zcy5zdC5j
b20+IHdyb3RlOgoKPiBGcm9tOiBDaHJpc3RvcGhlIEtlcmVsbG8gPGNocmlzdG9waGUua2VyZWxs
b0Bmb3NzLnN0LmNvbT4KPgo+IEFkZCB0aGUgc3VwcG9ydCBvZiBTRElPIGluLWJhbmQgaW50ZXJy
dXB0IG1vZGUgZm9yIFNUTTMyIHZhcmlhbnQuCj4gSXQgYWxsb3dzIHRoZSBTRCBJL08gY2FyZCB0
byBpbnRlcnJ1cHQgdGhlIGhvc3Qgb24gU0RNTUNfRDEgZGF0YSBsaW5lLgo+Cj4gU2lnbmVkLW9m
Zi1ieTogQ2hyaXN0b3BoZSBLZXJlbGxvIDxjaHJpc3RvcGhlLmtlcmVsbG9AZm9zcy5zdC5jb20+
Cj4gU2lnbmVkLW9mZi1ieTogWWFubiBHYXV0aWVyIDx5YW5uLmdhdXRpZXJAZm9zcy5zdC5jb20+
CiguLi4pCj4gKysrIGIvZHJpdmVycy9tbWMvaG9zdC9tbWNpLmgKPiBAQCAtMzMyLDYgKzMzMiw3
IEBAIGVudW0gbW1jaV9idXN5X3N0YXRlIHsKPiAgICogQG9wZW5kcmFpbjogYml0bWFzayBpZGVu
dGlmeWluZyB0aGUgT1BFTkRSQUlOIGJpdCBpbnNpZGUgTU1DSVBPV0VSIHJlZ2lzdGVyCj4gICAq
IEBkbWFfbGxpOiB0cnVlIGlmIHZhcmlhbnQgaGFzIGRtYSBsaW5rIGxpc3QgZmVhdHVyZS4KPiAg
ICogQHN0bTMyX2lkbWFic2l6ZV9tYXNrOiBzdG0zMiBzZG1tYyBpZG1hIGJ1ZmZlciBzaXplLgo+
ICsgKiBAdXNlX3NkaW9faXJxOiBhbGxvdyBTRCBJL08gY2FyZCB0byBpbnRlcnJ1cHQgdGhlIGhv
c3QKClRoZSBkb2N1bWVudGF0aW9uIHRhZyBzaG91bGQgYmUgb25lIGxpbmUgdXAgKGNvbXBhcmUg
dG8gdGhlIG1lbWJlcnMuLi4pCgo+IEBAIC0zNzYsNiArMzc3LDcgQEAgc3RydWN0IHZhcmlhbnRf
ZGF0YSB7Cj4gICAgICAgICB1MzIgICAgICAgICAgICAgICAgICAgICBzdGFydF9lcnI7Cj4gICAg
ICAgICB1MzIgICAgICAgICAgICAgICAgICAgICBvcGVuZHJhaW47Cj4gICAgICAgICB1OCAgICAg
ICAgICAgICAgICAgICAgICBkbWFfbGxpOjE7Cj4gKyAgICAgICB1OCAgICAgICAgICAgICAgICAg
ICAgICB1c2Vfc2Rpb19pcnE6MTsKCjEuIGJvb2wgdXNlX3NkaW9faXJxOwoKMi4gc3VwcG9ydHNf
c2Rpb19pcnEgaXMgbW9yZSB0byB0aGUgcG9pbnQgZG9uJ3QgeW91IHRoaW5rPwogICAgRXNwZWNp
YWxseSBzaW5jZSBpdCBhY3RpdmF0ZXMgdGhlc2UgdHdvIGNhbGxiYWNrczoKCj4gKyAgICAgICB2
b2lkICgqZW5hYmxlX3NkaW9faXJxKShzdHJ1Y3QgbW1jaV9ob3N0ICpob3N0LCBpbnQgZW5hYmxl
KTsKPiArICAgICAgIHZvaWQgKCpzZGlvX2lycSkoc3RydWN0IG1tY2lfaG9zdCAqaG9zdCwgdTMy
IHN0YXR1cyk7CgpGdXJ0aGVyOiBhbGwgdGhlIFV4NTAwIHZhcmlhbnRzIHN1cHBvcnQgdGhpcyAo
Yml0IDIyKSBhcyB3ZWxsLCBzbyBlbmFibGUgdGhvc2UKdG9vIGluIHRoZWlyIHZlbmRvciBkYXRh
LiBBbGwgSSBoYXZlIGlzIG91dC1vZi1iYW5kIHNpZ25hbGluZyB3aXRoIGFuIEdQSU8gSVJRCm9u
IG15IEJyb2FkY29tIGNoaXBzIGJ1dCBJIHRoaW5rIGl0IHdvcmtzIChtYXliZSBVbGYgaGFzIHRl
c3RlZCBpdCBpbiB0aGUKZmFyIHBhc3QpLgoKWW91cnMsCkxpbnVzIFdhbGxlaWoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGlu
ZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9z
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
