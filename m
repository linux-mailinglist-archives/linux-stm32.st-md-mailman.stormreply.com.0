Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6798A6AB2A5
	for <lists+linux-stm32@lfdr.de>; Sun,  5 Mar 2023 22:48:20 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0AAEEC6904A;
	Sun,  5 Mar 2023 21:48:20 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com
 [209.85.128.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 97C67C6410A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  5 Mar 2023 21:48:18 +0000 (UTC)
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-53cb9ac9470so149837037b3.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 05 Mar 2023 13:48:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QLT9596esNn9+ZcDd3rcdHbsJUKw8b1aHwiveWbhaq4=;
 b=z8VAIRkfAxemi/FtNcAurB8B2D6jDvXRySFM6h+xAQyuToi6WuFeJY1DcnkWkDln4B
 nK0Hkwwq4ZNcB9OpZhT8qq76gu9rv0NWrg89giWkop6p+o3dcPg5T0/VsDc54iolxtEJ
 LTPZuI8c6nNCHC0IyUrbZvR5NdsIoJEOWL+11zsCe2Qu3NH7ng9qB/h8o8Z0YTyDzvFV
 qW1zS1pNW6fsn9UN9F9d+W70tNZFaFDPCTvp3nnu3hHrDXi1qLXirJzWC3nNNcGeVqDF
 J1aAjvlIGTN0R/Rcj+HBn4PQkVuw4CB4pAqjn3+sQXmn/cdZZO9QNH2EKCosQOn+u+Xi
 065Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QLT9596esNn9+ZcDd3rcdHbsJUKw8b1aHwiveWbhaq4=;
 b=Emt2v+vf9lVEsDPZADihpHDnpd0PsXXiJY7cltR3KijLGlRuP7A9cn7au9WGS2yEmQ
 +lLcydH5uxZPS8z653m1W+S8+vrWJm5ZsUKJv6ZJz3RC+3u5ID7COIi6wyx0aDEyrye/
 RzjyugqlVNkq6hNgc3W8ZkwU6APw0r6QiRZNwujw1CBMMpLR7Cpqu2maMjOEA/KHdWn3
 k1hhs0Hq/ePZeJyyS56KGNEbDoMgQLtcrEOJ8VL865nOpu5rQevgIZATC5KUG6faLiQs
 jsbuvFRcs3ouJdtaxPvlmXrvO/EZixkgZ7xxiCSF98+u6GmBI5s3ySwWn9hGQiv/1rAu
 bHaQ==
X-Gm-Message-State: AO0yUKWsurQQfOBRwXLvhAxzUPBnN+fz/aXE0rXYLtQM67PrFM8I5UTd
 5jPjDnOAtyUcQ5zJUot22HWWi2s4X/GX6UmrDKzz3A==
X-Google-Smtp-Source: AK7set9PwbP37M+qcdmd1OrmePnuWQ5cf/oim9FxyxWYN5ZTGhjFStopLAhPM2VM1sBwIOJyAtQgfJUn/9eHK0O0pGA=
X-Received: by 2002:a81:431e:0:b0:533:8080:16ee with SMTP id
 q30-20020a81431e000000b00533808016eemr5437131ywa.10.1678052897405; Sun, 05
 Mar 2023 13:48:17 -0800 (PST)
MIME-Version: 1.0
References: <ZAMQjOdi8GfqDUQI@gondor.apana.org.au>
 <E1pYOKD-000GYe-HX@formenos.hmeau.com>
In-Reply-To: <E1pYOKD-000GYe-HX@formenos.hmeau.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 5 Mar 2023 22:48:05 +0100
Message-ID: <CACRpkdYcGx_=GufsRwtRm_tCeZFvYFM+R0CGK521=DSRo+WXXw@mail.gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Li kunyu <kunyu@nfschina.com>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-crypto@vger.kernel.org,
 mcoquelin.stm32@gmail.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [v5 PATCH 1/7] crypto: stm32 - Save 54 CSR
	registers
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
ZG9yLmFwYW5hLm9yZy5hdT4gd3JvdGU6Cgo+IFRoZSBDU1IgcmVnaXN0ZXJzIGdvIGZyb20gMCB0
byA1My4gIFNvIHRoZSBudW1iZXIgb2YgcmVnaXN0ZXJzCj4gc2hvdWxkIGJlIDU0Lgo+Cj4gU2ln
bmVkLW9mZi1ieTogSGVyYmVydCBYdSA8aGVyYmVydEBnb25kb3IuYXBhbmEub3JnLmF1PgoKSG0g
SSBkb24ndCBrbm93IHdoZXJlIHRoaXMgbWlzdW5kZXJzdGFuZGluZyBjb21lcyBmcm9tLgpJIHRo
aW5rIGl0J3MgdGhpcyB0ZW5kZW5jeSBieSBzb21lIGVuZ2luZWVycyB0byB1c2UgaW5kZXggMSA6
LwoKVGhlIGRhdGFzaGVldCBmb3IgVTg1MDAgc2F5czoKMHhGOCAgICAgICAgICAgIEhBU0hfQ1NG
VUxMICAgICAgSEFTSCBjb250ZXh0IGZ1bGwgcmVnaXN0ZXIKMHhGQyAgICAgICAgICAgIEhBU0hf
Q1NEQVRBSU4gICAgSEFTSCBjb250ZXh0IHN3YXAgZGF0YSBpbnB1dCByZWdpc3RlcgoweDEwMCAg
ICAgICAgICAgSEFTSF9DU1IwICAgICAgICBIQVNIIGNvbnRleHQgc3dhcCByZWdpc3RlciAwCjB4
MTA0IHRvIDB4MUNDICBIQVNIX0NTUjEgdG8gNTEgIEhBU0ggY29udGV4dCBzd2FwIHJlZ2lzdGVy
IDEgdG8gNTEKCjB4ZjgsIDB4ZmMsIDB4MTAwID0gMyByZWdpc3RlcnMKMHgxMDQgdG8gMHgxY2Mg
PSA1MSByZWdpc3RlcnMKCkluZGVlZCA1NC4KClJldmlld2VkLWJ5OiBMaW51cyBXYWxsZWlqIDxs
aW51cy53YWxsZWlqQGxpbmFyby5vcmc+ClRlc3RlZC1ieTogTGludXMgV2FsbGVpaiA8bGludXMu
d2FsbGVpakBsaW5hcm8ub3JnPgoKWW91cnMsCkxpbnVzIFdhbGxlaWoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0
CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
