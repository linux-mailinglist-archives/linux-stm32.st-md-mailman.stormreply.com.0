Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 330DB7513CC
	for <lists+linux-stm32@lfdr.de>; Thu, 13 Jul 2023 00:56:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E4646C6B44D;
	Wed, 12 Jul 2023 22:56:52 +0000 (UTC)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com
 [209.85.219.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 62C9FC6B442
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Jul 2023 22:56:52 +0000 (UTC)
Received: by mail-yb1-f182.google.com with SMTP id
 3f1490d57ef6-bd77424c886so8591877276.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Jul 2023 15:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689202611; x=1691794611;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VB9ypz/KY/xV4cSqtZ+tUlnGhLGfTgqW2/3T6mN7ebg=;
 b=zqXzgzWKFV6nFUVPIAAPE0mvcmohHovWT46vSnWqga+md0s0CjPw+S/slrQmtYD/+I
 Fu0NJj/cGiDczTnmqqNEItLDzKpArQ+WRuNWc3U3XMwXODsKJkLrAVbsPysme2TvZlIQ
 1nYVNxGO7F7Ylo2QbTcDyees8UGOWMay7cQq9+ubv3fb6bXR1CbmePyVVhhqIA0AS9RT
 tL8OHX1Mp9QLdxnzRYNhfIXauDWWOUboIKDr0iOGH5r+D74mbNsha1Himxc8/xYDV/BD
 jTjCUY8Qz1/Nl5IiMjzjvKt8+BjcT526DZvxuID7aGVOFHbTflMIReO9ZOI+Evkv/6ik
 qlNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689202611; x=1691794611;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VB9ypz/KY/xV4cSqtZ+tUlnGhLGfTgqW2/3T6mN7ebg=;
 b=DMEaxmxVUmV13l0l1bnAAtL1fi822orwQaTy7wbo3YFx9oXDDKkFUtdBaYahL8KSgJ
 ovstVhX/15aAHGoM1AJOJIrpp+BGSPa5gueJET5tgVrmR1wOe11LthO5zNqozX1LEGeM
 yiciaf1bFC/7rPRXYSt4gy+Rl5baKkZhnWUECo5XLcZfoQFylxDZp4xn9e5mKiNDRBnO
 Mb+qzvqKwvGYfijO91BFQzklKRpTzqxskzc4Uy3S30h/L0HwbSFKU1uqwQam9c7INdFl
 hNnWVDT6uGQ4mIDDIHxtXN1SlN3KJOiYkPBBBWOEhqbrE1O7HC1qDBhqR2j+rC3yrCmX
 8KXA==
X-Gm-Message-State: ABy/qLaa+n7X13JetS0oI54tW9/38UIV3n2CTDvBIwYsV/bB35QrhGCa
 WfW3VLKtdKmfjEmct3BzLe5s+1GUIR20X8w5WSzlJg==
X-Google-Smtp-Source: APBJJlF4igHjEc2KmL3nrfbBjOxJjhZo34FKjrNMDYKyWYjw8zNV/gZXWKTyO+6j1ecKjSoqtvT+UHPYSbZAxvI2mT4=
X-Received: by 2002:a81:9281:0:b0:57a:897e:abce with SMTP id
 j123-20020a819281000000b0057a897eabcemr24404ywg.7.1689202611241; Wed, 12 Jul
 2023 15:56:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230706073719.1156288-1-thomas.bourgoin@foss.st.com>
 <20230706073719.1156288-3-thomas.bourgoin@foss.st.com>
 <CACRpkdaHn8fhZtuhU4sXHK1xoxO3-xYg_Xb=3=bX8i-uJM9KDA@mail.gmail.com>
 <a584c152-329e-9c79-ec62-795485302a55@foss.st.com>
In-Reply-To: <a584c152-329e-9c79-ec62-795485302a55@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 13 Jul 2023 00:56:39 +0200
Message-ID: <CACRpkdYStm_dxo-FMo4Kdw_Lm3iG+xppf7O5W6cxtoiRy1DOsw@mail.gmail.com>
To: Thomas BOURGOIN <thomas.bourgoin@foss.st.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Rob Herring <robh+dt@kernel.org>, linux-crypto@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/7] crypto: stm32 - add new algorithms
	support
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

T24gV2VkLCBKdWwgMTIsIDIwMjMgYXQgOTo1OOKAr0FNIFRob21hcyBCT1VSR09JTgo8dGhvbWFz
LmJvdXJnb2luQGZvc3Muc3QuY29tPiB3cm90ZToKCj4gRGlkIHlvdSBydW4geW91ciB0ZXN0IG9u
bHkgd2l0aCB0aGUgcGF0Y2ggYWRkaW5nIHRoZSBzdXBwb3J0IGZvcgo+IFNUTTMyTVAxMyBvciBk
aWQgeW91IHRyeSB0aGUgd2hvbGUgcGF0Y2ggc2V0ID8KCkJvdGgsIGFjdHVhbGx5LgoKPiBUaGUg
ZXJyb3IgaXMgb24gdGhlIHRlc3QgdmVjdG9yIG51bWJlciA0LCB3aGljaCBpcyBhbiBIQVNIIG9m
IDY0IGJ5dGVzCj4gd2hpY2ggaXMgZXhhY3RseSB0aGUgc2l6ZSBvZiBhIGJsY29rIGZvciBTSEEx
Lgo+Cj4gRGlkIHlvdSB0cnkgdG8gcnVuIHRoZSB0ZXN0IGZvciBTSEEyNTYgPyAoSSBndWVzcyB5
b3Ugd2lsbCBzZWUgdGhlIHNhbWUKPiBlcnJvciBvbiB0ZXN0IHZlY3RvciA0KQoKWWVzLi4uIEkg
cG9zdGVkIGEgbG9nIHdpdGggYm90aCBTSEEyNTYgYW5kIFNIQTEuCgo+IEkgZm91bmQgYSB0eXBv
IGluIHRoZSBudW1iZXIgb2YgQ1NSIHRvIHNhdmUvcmVzdG9yZSBmb3IgdGhlIFNIQTEgYW5kCj4g
U0hBMjU2IGFsZ29yaXRobS4gSXQgc2hvdWxkIGJlIDM4IGluc3RlYWQgb2YgMjIuCj4gVGVsbCBt
ZSBpZiBpdCBmaXhlcyB0aGUgcmVncmVzc2lvbi4KClllcyB0aGlzIGZpeGVzIHRoZSBidWcgYW5k
IHRoZSB0ZXN0cyBwYXNzIGZpbmUgOikKSSB3b25kZXIgd2h5IFNIQTEgd2FzIGFmZmVjdGVkPyBT
YW1lIGNvZGVwYXRoPwoKPiBJdCBjb3VsZCBiZSBwb3NzaWJsZSB0byBkaXZpZGUgdGhlIHBhdGNo
IGluIDIgKG9uZSBwYXRjaCByZXdvcmsKPiBwcmVwYXJpbmcgTVAxMyBhbmQgb25lIHBhdGNoIHdp
dGggdGhlIG5ldyBhbGdvcml0aG0pIGJ1dCBmb3IgdGhlCj4gdXBzdHJlYW0gSSBkbyBub3Qga25v
dyBpZiBpdCBpcyByZWxldmFudCB0byBoYXZlIDIgcGF0Y2hlcyBpbnN0ZWFkIG9mIG9uZS4KClRo
ZSBtYWpvciBwb2ludCBvZiBzcGxpdHRpbmcgcGF0Y2hlcyB0byAib25lIHRlY2huaWNhbCBzdGVw
IiBpcyB0byBiZQphYmxlIHRvIGRvIGZpbmUtZ3JhaW5lZCBnaXQgYmlzZWN0IHRvIGZpbmQgYnVn
cyBzdWNoIGFzIHRoaXMgb25lIDpECkJ1dCBhZG1pdHRlZGx5IHRoZSBkZWZpbnRpb24gb2YgInRl
Y2hpY2FsIHN0ZXAiIGlzIGEgYml0IGZ1enp5LgoKWW91cnMsCkxpbnVzIFdhbGxlaWoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFp
bGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6
Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3Rt
MzIK
