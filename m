Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F8CC63B7E8
	for <lists+linux-stm32@lfdr.de>; Tue, 29 Nov 2022 03:34:06 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 397ABC65E6C;
	Tue, 29 Nov 2022 02:34:06 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A16A5C65E62
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Nov 2022 02:34:05 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id l11so17983533edb.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Nov 2022 18:34:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=770v95sUrIlvtNLFG2ZFJPK2miGjPEzCsACcRdRH3P0=;
 b=KtIorSIdh3d3uWlsZA1SrhGsQlbfGeLfo+VHQYFWQtkxRniNSTYERELjM3I5xCQPES
 iW1aMNWCA9wC7C4/aaVQa1DNgKcQlD0kCogEmpTnekZQiNNzVXywkUMmwJMXV0124wTT
 VgIr5sURQfKCiUWg8xMSU0fSEODUS2kcAv9kRtnb9l1e7VpAUXIMggTPsR0gGavSYVYf
 HqrY+qMUOQrxu0XjRe7Wfr0gZbyPsUhV1JpPtywD4DPBiIRVzADw4dzQ0nrS+5Ig4HrG
 hZ5ltam91ISEz7Ri66w20yPQLBDRWqJmKpiEJuMtkP2obRkKfBAZCudmfLLTnn4gm0SG
 HfxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=770v95sUrIlvtNLFG2ZFJPK2miGjPEzCsACcRdRH3P0=;
 b=5HAiX+7SOb/PzzljVz7aN/5ixltyF8JKjdQzl3a1EEifRICo51Fprymdnth/l5cI6A
 qFPvxuXMjF/Xfwd6fg7wbDADYaG5LoT2IumulSLE6wBrWWO++BFh889wa+9LuEq6wFlY
 PQ5OvDP6z+ZyISOtkuDzzTADk20JOnos9GE6VTNCkWefaEZCL3wqbnMpIpJF6bF0X4Rv
 Z1xYX2Ul691NZH7cpACwbuvFzJpc7vQboc8nNzFvcYdLKWOtzqo8wu6LwNIZuG6OW3aw
 LKAnGBwVl2uLZp/xySjCvtQlZiqLEHwvCPmj8U7WQgTT2kI2P34xVVdRVyfL4p4IYKI0
 EjIw==
X-Gm-Message-State: ANoB5plMRuZKbID71WY0KVnENoIl505ud+KEPnu8Owkd11Doob6jRnE3
 Gk4vbi65aV0OIpG4dZH+lHyMfMjziNCu9Q==
X-Google-Smtp-Source: AA0mqf50ZSA74qR3XCOCM6LUBeSegCpn3qM55F0v3CAeeDj/+bX11XGwWL8FKbwRauaJFIssCHLC4g==
X-Received: by 2002:a05:6402:5483:b0:468:d5a9:cb4b with SMTP id
 fg3-20020a056402548300b00468d5a9cb4bmr35890314edb.409.1669689245330; 
 Mon, 28 Nov 2022 18:34:05 -0800 (PST)
Received: from c64.fritz.box ([81.221.122.240])
 by smtp.gmail.com with ESMTPSA id
 a4-20020aa7d744000000b004615f7495e0sm5733817eds.8.2022.11.28.18.34.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Nov 2022 18:34:05 -0800 (PST)
From: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To: devicetree@vger.kernel.org
Date: Tue, 29 Nov 2022 03:33:56 +0100
Message-Id: <20221129023401.278780-3-bero@baylibre.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221129023401.278780-1-bero@baylibre.com>
References: <20221129023401.278780-1-bero@baylibre.com>
MIME-Version: 1.0
Cc: khilman@baylibre.com, linus.walleij@linaro.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 krzysztof.kozlowski@linaro.org, linux-mediatek@lists.infradead.org,
 mcoquelin.stm32@gmail.com, matthias.bgg@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com
Subject: [Linux-stm32] [PATCH v3 2/7] pinctrl: stm32: Remove check for
	pins-are-numbered
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

UmVtb3ZlIHRoZSBjaGVjayBmb3IgdGhlIHVubmVjZXNzYXJ5IHBpbnMtYXJlLW51bWJlcmVkCkRl
dmljZVRyZWUgcHJvcGVydHkKClNpZ25lZC1vZmYtYnk6IEJlcm5oYXJkIFJvc2Vua3LDpG56ZXIg
PGJlcm9AYmF5bGlicmUuY29tPgpSZXZpZXdlZC1ieTogTWF0dGhpYXMgQnJ1Z2dlciA8bWF0dGhp
YXMuYmdnQGdtYWlsLmNvbT4KQWNrZWQtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyenlzenRv
Zi5rb3psb3dza2lAbGluYXJvLm9yZz4KLS0tCiBkcml2ZXJzL3BpbmN0cmwvc3RtMzIvcGluY3Ry
bC1zdG0zMi5jIHwgNSAtLS0tLQogMSBmaWxlIGNoYW5nZWQsIDUgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9waW5jdHJsL3N0bTMyL3BpbmN0cmwtc3RtMzIuYyBiL2RyaXZlcnMv
cGluY3RybC9zdG0zMi9waW5jdHJsLXN0bTMyLmMKaW5kZXggY2M5NDcyYjI4NDA0Ny4uMWNkZGNh
NTA2YWQ3ZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9waW5jdHJsL3N0bTMyL3BpbmN0cmwtc3RtMzIu
YworKysgYi9kcml2ZXJzL3BpbmN0cmwvc3RtMzIvcGluY3RybC1zdG0zMi5jCkBAIC0xNDk5LDEx
ICsxNDk5LDYgQEAgaW50IHN0bTMyX3BjdGxfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAq
cGRldikKIAlpZiAoIW1hdGNoX2RhdGEpCiAJCXJldHVybiAtRUlOVkFMOwogCi0JaWYgKCFkZXZp
Y2VfcHJvcGVydHlfcHJlc2VudChkZXYsICJwaW5zLWFyZS1udW1iZXJlZCIpKSB7Ci0JCWRldl9l
cnIoZGV2LCAib25seSBzdXBwb3J0IHBpbnMtYXJlLW51bWJlcmVkIGZvcm1hdFxuIik7Ci0JCXJl
dHVybiAtRUlOVkFMOwotCX0KLQogCXBjdGwgPSBkZXZtX2t6YWxsb2MoZGV2LCBzaXplb2YoKnBj
dGwpLCBHRlBfS0VSTkVMKTsKIAlpZiAoIXBjdGwpCiAJCXJldHVybiAtRU5PTUVNOwotLSAKMi4z
OC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5m
by9saW51eC1zdG0zMgo=
