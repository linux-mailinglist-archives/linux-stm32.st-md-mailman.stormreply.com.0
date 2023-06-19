Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 50842734C0A
	for <lists+linux-stm32@lfdr.de>; Mon, 19 Jun 2023 09:03:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D5D59C6A60D;
	Mon, 19 Jun 2023 07:03:56 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
 [209.85.222.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A1B99C6A5F6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Jun 2023 07:03:54 +0000 (UTC)
Received: by mail-qk1-f175.google.com with SMTP id
 af79cd13be357-7624af57b21so148002185a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Jun 2023 00:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687158233; x=1689750233;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BD0zn/dSyiVOCfeRhW5pho39c7q1GjuHdqlvtRu3jqA=;
 b=w4OcGG8A5Rf7WvGLN3b/lJAnbJKCrQcuVZ9HTVX1BoKvXZl63+knpSsidCVk+bAO1i
 5eOAf+3sb668V+j+R9iN/1TxwaELDHBt/ESvwlbzhwQhLRQmbZm3tTNu11Sf6zJNMCjY
 Wmo3TgS5PgYk/ZCoxlSRpeot3Nos+Fbt6MHa14ANmnz+e3dOKL9DakjoLcoxtddNSW4h
 hq6yUQz7Yk/vc9g+ExAq6w9fkPodchDJ7sbLR7E487oJ6jkgupN1gP19cav7BEtdcAiq
 3moQ8x9iT0ZzEAGHX4wuhdoGHogAfBMy2gkaGniCdeztBFZxXqP+x/locdRxtRdHT64m
 hy3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687158233; x=1689750233;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BD0zn/dSyiVOCfeRhW5pho39c7q1GjuHdqlvtRu3jqA=;
 b=DDf7adOaEN/19P/0iNSTbeGWN1RyTFMJYK5DmTe4b7nx6C79ZR0jDnonYana5v12Lg
 oHQMD90BaNq4saa+0+yL7tFtyDHNjHi5pRFDG0WejqlgsAOD7nG7nIABVjWTCl4iBX6F
 b+BHtZpa0kZpxKIRzBMz4dKa1NvTl7XH6zoCHXHuM1B4NgkY8PzRp2tERWQ2LVDF8vtr
 TYdXXgY8sLQxao0Ri3Ls8uj5UkpEbD5CbOSNUd/RWpeFqfZiXhnzeaoLyzJF3lqqxZFo
 F6HvRJff2Gi82/VD9oBbeEiDF4HEEcN7nzFKMo77vmjnOSYbaHzbzSsQsc6X47tWuEIU
 2GJw==
X-Gm-Message-State: AC+VfDwPaocCsM8txzoL2R40pHb+RFiSUJ684/iQyIJ8NVhM9zHnPpGE
 Amsda6DHe38hhdN5qmULEw+VwKTHfx94V6ToT5iUqg==
X-Google-Smtp-Source: ACHHUZ6/AZutpaAxoSSJ5rEGLJl9sCW2hxbTF0gVbt9G2whH+uajcSBro+NPrPGt1FnuvTRrnLqoZbICzlzKJ4qZMrw=
X-Received: by 2002:a05:6214:764:b0:62d:f68a:ee2d with SMTP id
 f4-20020a056214076400b0062df68aee2dmr9751586qvz.29.1687158233535; Mon, 19 Jun
 2023 00:03:53 -0700 (PDT)
MIME-Version: 1.0
References: <8de3aaf297931d655b9ad6aed548f4de8b85425a.1686998575.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <8de3aaf297931d655b9ad6aed548f4de8b85425a.1686998575.git.christophe.jaillet@wanadoo.fr>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 19 Jun 2023 09:03:42 +0200
Message-ID: <CACRpkdZFQxRyRzxi9E9mtJA_VHKW_k0=hzMnJNGH5RFqsBSZPQ@mail.gmail.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Lee Jones <lee@kernel.org>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] mfd: stmpe: Fix a corner case in
	stmpe_probe()
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

T24gU2F0LCBKdW4gMTcsIDIwMjMgYXQgMTI6NDPigK9QTSBDaHJpc3RvcGhlIEpBSUxMRVQKPGNo
cmlzdG9waGUuamFpbGxldEB3YW5hZG9vLmZyPiB3cm90ZToKCj4gSW4gc3RtcGVfcHJvYmUoKSwg
aWYgc29tZSByZWd1bGF0b3JfZW5hYmxlKCkgY2FsbHMgZmFpbCwgcHJvYmluZyBjb250aW51ZXMK
PiBhbmQgdGhlcmUgaXMgb25seSBhIGRldl93YXJuKCkuCj4KPiBTbywgaWYgc3RtcGVfcHJvYmUo
KSBpcyBjYWxsZWQgdGhlIHJlZ3VsYXRvciBtYXkgbm90IGJlIGVuYWJsZWQuIEl0IGlzCj4gY2xl
YW5lciB0byB0ZXN0IGl0IGJlZm9yZSBjYWxsaW5nIHJlZ3VsYXRvcl9kaXNhYmxlKCkgaW4gdGhl
IHJlbW92ZQo+IGZ1bmN0aW9uLgo+Cj4gRml4ZXM6IDljOWUzMjE0NTVmYiAoIm1mZDogc3RtcGU6
IGFkZCBvcHRpb25hbCByZWd1bGF0b3JzIikKPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGhlIEpB
SUxMRVQgPGNocmlzdG9waGUuamFpbGxldEB3YW5hZG9vLmZyPgoKTG9va3MgY29ycmVjdCEKUmV2
aWV3ZWQtYnk6IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4KCllvdXJz
LApMaW51cyBXYWxsZWlqCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
