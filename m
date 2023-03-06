Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E766ABA8E
	for <lists+linux-stm32@lfdr.de>; Mon,  6 Mar 2023 10:59:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E8A76C65048;
	Mon,  6 Mar 2023 09:59:20 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com
 [209.85.128.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9E981C01E98
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 Mar 2023 09:59:19 +0000 (UTC)
Received: by mail-yw1-f170.google.com with SMTP id
 00721157ae682-5384ff97993so174378367b3.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 06 Mar 2023 01:59:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kmCoxFXOjygQDIzK1tZa6oHAVDWZOb2fMdPu8gYG9LA=;
 b=R1GDPbh4yVZ0p5iRkuHOTmZh5TuKhZv4Wcznyvdjvx0OoqKh7ZF783XLGZ/vpVQMXz
 bCxdyNge9U+zOI4R5TbF+OpFlm5lbt2Qo3EfdH+Mjpqa+skPMwa6qSsiZjmvWLi7nox0
 EQTgXhI1kvDjXvrCq/9ssHTd0DY3B4thYvsE4B7UoyjGhjV+knXolZqr7rp1nqS/yS6+
 QVLPGBm47vUQoRSG3tH5RMEJoNoVYCEBPeG1o7pAKfR14gefnbQGTHm1yD4PzUq2pYvS
 BMJcXBupsMXISEkc3h9zDNew5Z7P8wyr7AluMml9ITeCq0CbnJdj0VSjQhuk0RAEbZfG
 Oavw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kmCoxFXOjygQDIzK1tZa6oHAVDWZOb2fMdPu8gYG9LA=;
 b=aIpN8YQCrGhy/PVMfaNlUHjoeW/BrV5lpV9ZS2OQtUnOCAzLpHDFCr+rGGCnWapK1H
 Hrk1B3RmTd17Nz3WukRroEayjoicRCEcakrN8hw/ERc6Th8BMSX3+wUoDIFMCKuIy/ph
 V0A4Tw/WxAPCqnPFRfIX83kiM6yF/4zsuIzNZt11cZ/ZMwuFbe7X4a8G+vGXg/lVar8d
 ooRN0eXoVBCfhII/yjI6yMNn1v8o5Ae746uDeUhiIWuReVA2fc4rwiydekl9R2/knPaN
 /OUMnSH6ghQg2tVYjhK6PGjtb/AKeMxmBUQJNNcliVgyEDdJ1n7ctmUlUooK56aEY/KU
 tZdA==
X-Gm-Message-State: AO0yUKXNArPPHrvZxOigip1umK/LWR4eKQpLRn/WVusH1KRjvpdpYl4p
 x7LBwb2Sdw+XGpYlqWlaGMD/OP4uqu2UdlD2mOzI1g==
X-Google-Smtp-Source: AK7set9thiTXKi70kvUYtjvGioPgktg/AQjQIDH9/Y8okcnfS3yBXcctmzIV8JdJro5UMpz5tBKLzbCtxmBve6+SzEo=
X-Received: by 2002:a81:ad24:0:b0:52e:bb2d:2841 with SMTP id
 l36-20020a81ad24000000b0052ebb2d2841mr5996953ywh.10.1678096758438; Mon, 06
 Mar 2023 01:59:18 -0800 (PST)
MIME-Version: 1.0
References: <ZAVu/XHbL9IR5D3h@gondor.apana.org.au>
 <E1pZ2fn-000e1d-Qm@formenos.hmeau.com>
In-Reply-To: <E1pZ2fn-000e1d-Qm@formenos.hmeau.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 6 Mar 2023 10:59:06 +0100
Message-ID: <CACRpkdZj5Ou75TN4pFjDU==5=6nSzBtsszzOiL3U3D3JK=RLqw@mail.gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Li kunyu <kunyu@nfschina.com>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-crypto@vger.kernel.org,
 mcoquelin.stm32@gmail.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [v5 PATCH 5/7] crypto: stm32 - Move hash state
	into separate structure
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

SGkgSGVyYmVydCwKCnRoYW5rcyBmb3Iga2VlcGluZyBnb2luZyBhdCB0aGlzIQoKT24gTW9uLCBN
YXIgNiwgMjAyMyBhdCA1OjQy4oCvQU0gSGVyYmVydCBYdSA8aGVyYmVydEBnb25kb3IuYXBhbmEu
b3JnLmF1PiB3cm90ZToKCj4gQ3JlYXRlIGEgbmV3IHN0cnVjdCBzdG0zMl9oYXNoX3N0YXRlIHNv
IHRoYXQgaXQgbWF5IGJlIGV4cG9ydGVkCj4gaW4gZnV0dXJlIGluc3RlYWQgb2YgdGhlIGVudGly
ZSByZXF1ZXN0IGNvbnRleHQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBIZXJiZXJ0IFh1IDxoZXJiZXJ0
QGdvbmRvci5hcGFuYS5vcmcuYXU+CgpGaXJzdCB0aGUgcGF0Y2ggYnVnZ2VkIGJ1dCBJIGZvdW5k
IHRoZSBwcm9ibGVtIGluIGEgc21hbGwgc2VtYW50aWMKZ2xpdGNoOgoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvY3J5cHRvL3N0bTMyL3N0bTMyLWhhc2guYwpiL2RyaXZlcnMvY3J5cHRvL3N0bTMyL3N0
bTMyLWhhc2guYwppbmRleCBkZTgyNzVhODAyNzEuLjM3NDNmNTViNWMwNCAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9jcnlwdG8vc3RtMzIvc3RtMzItaGFzaC5jCisrKyBiL2RyaXZlcnMvY3J5cHRvL3N0
bTMyL3N0bTMyLWhhc2guYwpAQCAtNzg1LDcgKzc4NSw3IEBAIHN0YXRpYyBpbnQgc3RtMzJfaGFz
aF9maW5hbF9yZXEoc3RydWN0IHN0bTMyX2hhc2hfZGV2ICpoZGV2KQogICAgICAgIGlmIChzdGF0
ZS0+ZmxhZ3MgJiBIQVNIX0ZMQUdTX0ZJTlVQKQogICAgICAgICAgICAgICAgcmV0dXJuIHN0bTMy
X2hhc2hfdXBkYXRlX3JlcShoZGV2KTsKCi0gICAgICAgcmV0dXJuIHN0bTMyX2hhc2hfeG1pdF9j
cHUoaGRldiwgc3RhdGUtPmJ1ZmZlciwgc3RhdGUtPmJ1ZmxlbiwgMSk7CisgICAgICAgcmV0dXJu
IHN0bTMyX2hhc2hfeG1pdF9jcHUoaGRldiwgc3RhdGUtPmJ1ZmZlciwgc3RhdGUtPmJ1ZmNudCwg
MSk7CiB9Cgogc3RhdGljIHZvaWQgc3RtMzJfaGFzaF9lbXB0eW1zZ19mYWxsYmFjayhzdHJ1Y3Qg
YWhhc2hfcmVxdWVzdCAqcmVxKQoKQWZ0ZSB0aGlzIGFsbCAoZXh0ZW5kZWQpIHRlc3RzIHBhc3Mg
ZmluZS4KCkp1c3QgZm9sZCBpbiB0aGlzIGFuZCB5b3UgY2FuIGFkZDoKUmV2aWV3ZWQtYnk6IExp
bnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4KVGVzdGVkLWJ5OiBMaW51cyBX
YWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+CgpZb3VycywKTGludXMgV2FsbGVpagpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0z
MiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpo
dHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51
eC1zdG0zMgo=
