Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 538C96AB2D4
	for <lists+linux-stm32@lfdr.de>; Sun,  5 Mar 2023 23:12:00 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0CF63C6904A;
	Sun,  5 Mar 2023 22:12:00 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com
 [209.85.128.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D4989C6410A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  5 Mar 2023 22:11:58 +0000 (UTC)
Received: by mail-yw1-f174.google.com with SMTP id
 00721157ae682-536c2a1cc07so150818427b3.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 05 Mar 2023 14:11:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VOAZ0bGuvBp/Aobr9qER3nHn+lNrIRRfqJCfBY1Kvv4=;
 b=gjMCt91aKj3KnGGeBKpADkPrRbbByh/HbyOao5EYCMmIKFQZuta8xQBBvACOMSXs3Y
 cdy3mk1yMMEY4hzjzOtxMLSBbgveLrpi9L1tJbEL8JQkHiiqPHRfVR/n2Buc/sbcWJLe
 3oAv4mL6NsCqcGl4kSrVqNctGFeGdYVj2uLPgWa2XWTwVha1qjwVRnLNXUOALM5aRL0S
 BrG+wTjwv9ZiHZo2JSTsQw6AArnp7by4I52AqvoB44V5yZpPY2R+xNWhaK3X3f43co+z
 BTmxWua/F2R0ZN9n+n9EfxjdQ795CaI7i0XteZt0mGqezR9OAVMah3l/8R8bjSNcC9AO
 3+yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VOAZ0bGuvBp/Aobr9qER3nHn+lNrIRRfqJCfBY1Kvv4=;
 b=f5rdxRfTOX3xyNoVxD0PcNnXXje3L5e1yi+BRPKr3heD+Fpc7Yr4nwa7nu33IgFn+U
 pIvsFY02p1d/XkJmSbQEBJdCCnrW7tisWv7i1kPOpTS0Q0VN0v9keHFpdg0+2wOEtU5f
 JEXxzFL5RYa1F4Qj5HRk+jd3Fj4DWVmhpavUZC4S3EUcb7M7fD5veD2wolf9jTFaRGUB
 xZlLGGUIywdvMi2KrnAqynbUiqsCoe/DuT2JHvLnNUDB477OkGtxa+e7PoKT/1e3iWN8
 sm5nK+eMY98B6Q3h3d8D2n0aKNI84YlWGicj2ScryVySu0g6pDcKUcYrQSpdORbW3vhD
 gHJg==
X-Gm-Message-State: AO0yUKX3+868XVNPTDojwX7giGIMmsLOKG4x0lDt6Au/iWxTzsvIn6Gd
 cfsgnRCVNiBP4e858xGOjpLdi+rUOgIczoqnWa5SKQ==
X-Google-Smtp-Source: AK7set+Q8NbS3q7qTFquSTzpie0bRNI7LjXs1EmcDoQ1MgyChDNmE71Qt9JWMzSp4ctpJWlHnEc+39tao4m9fEws64M=
X-Received: by 2002:a81:a783:0:b0:533:9b80:a30e with SMTP id
 e125-20020a81a783000000b005339b80a30emr5155244ywh.10.1678054317791; Sun, 05
 Mar 2023 14:11:57 -0800 (PST)
MIME-Version: 1.0
References: <ZAMQjOdi8GfqDUQI@gondor.apana.org.au>
 <E1pYOKJ-000GZ9-VW@formenos.hmeau.com>
In-Reply-To: <E1pYOKJ-000GZ9-VW@formenos.hmeau.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 5 Mar 2023 23:11:46 +0100
Message-ID: <CACRpkdaqzdwzG4fuO9C4SUymP3i2F1RcfqGMVLHHkoFDABdBFw@mail.gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Li kunyu <kunyu@nfschina.com>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-crypto@vger.kernel.org,
 mcoquelin.stm32@gmail.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [v5 PATCH 4/7] crypto: stm32 - Remove unused
	hdev->err field
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

T24gU2F0LCBNYXIgNCwgMjAyMyBhdCAxMDozN+KAr0FNIEhlcmJlcnQgWHUgPGhlcmJlcnRAZ29u
ZG9yLmFwYW5hLm9yZy5hdT4gd3JvdGU6Cgo+IFRoZSB2YXJpYWJsZSBoZGV2LT5lcnIgaXMgbmV2
ZXIgcmVhZCBzbyBpdCBjYW4gYmUgcmVtb3ZlZC4KPgo+IEFsc28gcmVtb3ZlIGEgc3B1cmlvdXMg
aW5jbHVzaW9uIG9mIGxpbnV4L2NyeXB0by5oLgo+Cj4gU2lnbmVkLW9mZi1ieTogSGVyYmVydCBY
dSA8aGVyYmVydEBnb25kb3IuYXBhbmEub3JnLmF1PgoKUmV2aWV3ZWQtYnk6IExpbnVzIFdhbGxl
aWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4KVGVzdGVkLWJ5OiBMaW51cyBXYWxsZWlqIDxs
aW51cy53YWxsZWlqQGxpbmFyby5vcmc+CgpZb3VycywKTGludXMgV2FsbGVpagpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5n
IGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
