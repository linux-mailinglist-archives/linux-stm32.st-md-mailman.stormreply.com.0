Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DCCE631A98
	for <lists+linux-stm32@lfdr.de>; Mon, 21 Nov 2022 08:49:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C3CF3C65E47;
	Mon, 21 Nov 2022 07:49:13 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BFB5BC0D2C0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Nov 2022 01:55:07 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id f27so25438638eje.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 20 Nov 2022 17:55:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N/w2w13+mMWO6nBDKGCXMZSCYwmXc/qjKkmDVe/55kA=;
 b=ukSmjE2ZDkr5MBplaKJox8349Bq/DFiq/a+pyIyb/dlA/5xXDM2fH0vK6PKGnWpHkY
 WdbkNQfkGfBgc+fqQZ5Avx95WjORzzRqj2KqksT/e5UN5a4UNVVmTnnr9TkYmq94lq6Y
 AEtOcit1AdlVUNZ4kJbth4iUfDPhXwFfgrk7/UZ8XaGJtPggN+hS645yy1IV5SeQJGWh
 QNmIf7CsqpsYBZa1EgAbQ6VSFIF7O2S4J2gmpjbEsZyoG1YbkBoKfM3mwQfxc8UNootx
 8+c4vL+jyPU2rIR80jERU92JSOhVf55BiCCNb+6/3Gad2i1L5DutvxH/Bjeci4OyEcYg
 aT7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=N/w2w13+mMWO6nBDKGCXMZSCYwmXc/qjKkmDVe/55kA=;
 b=vnxtSFKvkbCZc6eESUoU+12lXld8/llqsad4hO13vBdqqGar14Nm2r4QADw7RQuh63
 VnAqsMij/FKhB0xDLAggv/HyjBxwb5rno8uVCpvXeiu9o4bAEWJgzyLnIzu0DD7HeToO
 oYiV1YtD1q7smlXLBXTm0T2qJgRvr4r+HJodf1ck2RtGKXOAmVbti/A/HLK3PK/MzB0O
 Tpg20ZkxUbliZLo0x4fhh23DmdZiNaP83m5HnXs+3s13mBOojYIZf4QMCHQmCnXKJGky
 HJCo7OgumpzyUqPE2sYTUN3PgfhPZdEZlcjOnHcD98X/Sga8EVuW0v8cO8MZH0oz93dU
 ha3Q==
X-Gm-Message-State: ANoB5pngCZQ5e2iFpKV4qDu9a9beo+D2cmAbq/D/NfB5hxDFrA8PT3cf
 PPr4FxiGauaggqu396S+lzUIxQ==
X-Google-Smtp-Source: AA0mqf5AZ2xmEjYJZfawEV5yKJs7UGrH3Rw1OX9e0ct+5T3lY1OESXQajfo4ZcuEXEWOAgUov53/1g==
X-Received: by 2002:a17:907:9890:b0:783:6c5:c49e with SMTP id
 ja16-20020a170907989000b0078306c5c49emr13775680ejc.483.1668995707442; 
 Sun, 20 Nov 2022 17:55:07 -0800 (PST)
Received: from c64.fritz.box ([2a01:2a8:8108:8301:7643:bec8:f62b:b074])
 by smtp.gmail.com with ESMTPSA id
 g2-20020a170906538200b00782e3cf7277sm4415513ejo.120.2022.11.20.17.55.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Nov 2022 17:55:07 -0800 (PST)
From: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To: devicetree@vger.kernel.org
Date: Mon, 21 Nov 2022 02:54:43 +0100
Message-Id: <20221121015451.2471196-2-bero@baylibre.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221121015451.2471196-1-bero@baylibre.com>
References: <20221121015451.2471196-1-bero@baylibre.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 21 Nov 2022 07:49:11 +0000
Cc: khilman@baylibre.com, krzysztof.kozlowski@linaro.org,
 linux-mediatek@lists.infradead.org, mcoquelin.stm32@gmail.com,
 matthias.bgg@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 1/9] pinctrl: mediatek: common: Remove check
	for pins-are-numbered
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

UmVtb3ZlIHRoZSBjaGVjayBmb3IgdGhlIHVubmVjZXNzYXJ5IHBpbnMtYXJlLW51bWJlcmVkIERl
dmljZXRyZWUgcHJvcGVydHkuCgpTaWduZWQtb2ZmLWJ5OiBCZXJuaGFyZCBSb3Nlbmtyw6RuemVy
IDxiZXJvQGJheWxpYnJlLmNvbT4KLS0tCiBkcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvcGluY3Ry
bC1tdGstY29tbW9uLmMgfCA2IC0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDYgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9waW5jdHJsL21lZGlhdGVrL3BpbmN0cmwtbXRrLWNvbW1v
bi5jIGIvZHJpdmVycy9waW5jdHJsL21lZGlhdGVrL3BpbmN0cmwtbXRrLWNvbW1vbi5jCmluZGV4
IDA3NmFlMGIzOGUzZDcuLjU1M2QxNjcwMzQ3NWIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvcGluY3Ry
bC9tZWRpYXRlay9waW5jdHJsLW10ay1jb21tb24uYworKysgYi9kcml2ZXJzL3BpbmN0cmwvbWVk
aWF0ZWsvcGluY3RybC1tdGstY29tbW9uLmMKQEAgLTEwNTcsNyArMTA1Nyw2IEBAIGludCBtdGtf
cGN0cmxfaW5pdChzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2LAogCXN0cnVjdCBwaW5jdHJs
X3Bpbl9kZXNjICpwaW5zOwogCXN0cnVjdCBtdGtfcGluY3RybCAqcGN0bDsKIAlzdHJ1Y3QgZGV2
aWNlX25vZGUgKm5wID0gcGRldi0+ZGV2Lm9mX25vZGUsICpub2RlOwotCXN0cnVjdCBwcm9wZXJ0
eSAqcHJvcDsKIAlpbnQgcmV0LCBpOwogCiAJcGN0bCA9IGRldm1fa3phbGxvYygmcGRldi0+ZGV2
LCBzaXplb2YoKnBjdGwpLCBHRlBfS0VSTkVMKTsKQEAgLTEwNjYsMTEgKzEwNjUsNiBAQCBpbnQg
bXRrX3BjdHJsX2luaXQoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldiwKIAogCXBsYXRmb3Jt
X3NldF9kcnZkYXRhKHBkZXYsIHBjdGwpOwogCi0JcHJvcCA9IG9mX2ZpbmRfcHJvcGVydHkobnAs
ICJwaW5zLWFyZS1udW1iZXJlZCIsIE5VTEwpOwotCWlmICghcHJvcCkKLQkJcmV0dXJuIGRldl9l
cnJfcHJvYmUoZGV2LCAtRUlOVkFMLAotCQkJCSAgICAgIm9ubHkgc3VwcG9ydCBwaW5zLWFyZS1u
dW1iZXJlZCBmb3JtYXRcbiIpOwotCiAJbm9kZSA9IG9mX3BhcnNlX3BoYW5kbGUobnAsICJtZWRp
YXRlayxwY3RsLXJlZ21hcCIsIDApOwogCWlmIChub2RlKSB7CiAJCXBjdGwtPnJlZ21hcDEgPSBz
eXNjb25fbm9kZV90b19yZWdtYXAobm9kZSk7Ci0tIAoyLjM4LjEKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApM
aW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
