Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A900641538
	for <lists+linux-stm32@lfdr.de>; Sat,  3 Dec 2022 10:23:01 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A3A37C65E5A;
	Sat,  3 Dec 2022 09:23:00 +0000 (UTC)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com
 [209.85.219.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2EC96C01E98
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  3 Dec 2022 09:22:59 +0000 (UTC)
Received: by mail-yb1-f177.google.com with SMTP id l67so8800026ybl.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 03 Dec 2022 01:22:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MQEVpJWky6tIJ89XqczxI7S0ZUfSn6CIT0hg/X+OSlY=;
 b=Rgbj5fbB+ubXc5lxB75411Bq0YmdYG16G6Y4s8Bew+CQGHNAiOQfiXNuLqe7UTm8rJ
 DOZ9Pa8SlSBOucCgI358McADb8KVdwQOPUXPEmJInzjAs5sghOG1QuDuAsaDlEPn/f29
 oOAov/y1c9gnUiqembRyjEXpk47JHllvwX4bxUcXP3YAfbG+ji8sqfi9v8ZiZaOgZhMK
 Ez1ejr1CKCwK1iGF+dRePOkFRuQsU971NosoDjxupXHgb5WdafzCOLqNkATzIo5/nbeY
 xZBo0BhSHDTV5YdM/on3vlA+1/WnKfbvvCU1xkHiRMN7bEQ93FmQLnsZKxYLYGgIkIle
 qWUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MQEVpJWky6tIJ89XqczxI7S0ZUfSn6CIT0hg/X+OSlY=;
 b=e638FtU8Z3+2bE8MfSPoCdhmR3xOe7AjaqMIEGiJPcygEQpT15FSGrwCI+3t5yFrkR
 UIhkApKo8nfm69V+uoajkjNtj11Mw2tByLzFyH8OkerKIhxnopV1ZMkiymuB4iqoHYAt
 LRJqCC8a420xx9r6mdJCQWtvrgo0wuZQATb273exVZYwLSUS36jjktdx29PeBrwLzB1E
 LwVVRgMSq+dPowPM+Jq3zRMWix2olWPaPA4rC/updvdAcfZf2JnSRcOpmewitkgYxtiO
 MPe6oJZ95mykvSBfAFLvulPMpWOOzMaxMTe4DA9bXpDB1C+Ik+b9mpVQcBowP/A2HwKx
 /r/Q==
X-Gm-Message-State: ANoB5pmwPKOaiYzOyzQyxb2C6Lv9TgPxzVe962+DMFXTfLVhmJLsjx3L
 5uqwPWiYsj/6uCqiR0DBZlZTADiKVBE1LWiyM8X9jA==
X-Google-Smtp-Source: AA0mqf5ZQfNSD0/07kd5VFeFh5McEsaO3GSOFBR7Nh6mdhMxqXu71Xyg3wJZ63scyLjajbGzBwDjWGjBa0hVSp8aKBc=
X-Received: by 2002:a25:bc8a:0:b0:6ee:e865:c2e2 with SMTP id
 e10-20020a25bc8a000000b006eee865c2e2mr8564584ybk.206.1670059377999; Sat, 03
 Dec 2022 01:22:57 -0800 (PST)
MIME-Version: 1.0
References: <20221129023401.278780-1-bero@baylibre.com>
In-Reply-To: <20221129023401.278780-1-bero@baylibre.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 3 Dec 2022 10:22:47 +0100
Message-ID: <CACRpkda75U=b50rK=WecNvaEoTdN2UzGyEwfPRaO6jG9FGyWhw@mail.gmail.com>
To: =?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>
Cc: devicetree@vger.kernel.org, khilman@baylibre.com,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 krzysztof.kozlowski@linaro.org, linux-mediatek@lists.infradead.org,
 mcoquelin.stm32@gmail.com, matthias.bgg@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com
Subject: Re: [Linux-stm32] [PATCH v3 0/7] Remove the pins-are-numbered DT
	property
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

SGkgQmVybywKCmxvbmcgdGltZSBubyBzZWUhCgpPbiBUdWUsIE5vdiAyOSwgMjAyMiBhdCAzOjM0
IEFNIEJlcm5oYXJkIFJvc2Vua3LDpG56ZXIgPGJlcm9AYmF5bGlicmUuY29tPiB3cm90ZToKCj4g
RHVyaW5nIHRoZSByZXZpZXcgb2YgbXkgTVQ4MzY1IHN1cHBvcnQgcGF0Y2hzZXQKPiAoaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtbWVkaWF0ZWsvMjAyMjExMTcyMTAzNTYuMzE3ODU3OC0x
LWJlcm9AYmF5bGlicmUuY29tLyksCj4gdGhlIGlzc3VlIG9mIHRoZSAicGlucy1hcmUtbnVtYmVy
ZWQiIERldmljZVRyZWUgcHJvcGVydHkgaGFzIGNvbWUgdXAuCgooLi4uKQo+IFRoaXMgcGF0Y2hz
ZXQgcmVtb3ZlcyBhbGwgdXNlcyBvZiBwaW5zLWFyZS1udW1iZXJlZCBhbmQgbWFya3MgdGhlCj4g
cHJvcGVydHkgYXMgZGVwcmVjYXRlZC4KCkkgZG9uJ3QgcmVtZW1iZXIgYW55IG1vcmUgd2h5IHRo
aXMgcHJvcGVydHkgd2FzIGludHJvZHVjZWQsIGJ1dApJIGFtIGhhcHB5IHRvIHNlZSBpdCBnby4K
Cj4gQmVybmhhcmQgUm9zZW5rcsOkbnplciAoNyk6Cj4gICBwaW5jdHJsOiBtZWRpYXRlazogY29t
bW9uOiBSZW1vdmUgY2hlY2sgZm9yIHBpbnMtYXJlLW51bWJlcmVkCj4gICBwaW5jdHJsOiBzdG0z
MjogUmVtb3ZlIGNoZWNrIGZvciBwaW5zLWFyZS1udW1iZXJlZAo+ICAgZHQtYmluZGluZ3M6IHBp
bmN0cmw6IG1lZGlhdGVrLG10NjV4eDogRGVwcmVjYXRlIHBpbnMtYXJlLW51bWJlcmVkCj4gICBk
dC1iaW5kaW5nczogcGluY3RybDogc3Qsc3RtMzI6IERlcHJlY2F0ZSBwaW5zLWFyZS1udW1iZXJl
ZAoKSSBhcHBsaWVkIHBhdGNoZXMgMS00IHRvIHRoZSBwaW4gY29udHJvbCB0cmVlIGZvciB2Ni4y
LApwbGVhc2UgZnVubmVsIHRoZSByZXN0IHRocm91Z2ggbWVkaWF0ZWsvc3RtMzIgYW5kClNvQyB0
cmVlcyEKCllvdXJzLApMaW51cyBXYWxsZWlqCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBz
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
