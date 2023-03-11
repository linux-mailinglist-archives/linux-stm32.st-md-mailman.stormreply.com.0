Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DF4646B5F2F
	for <lists+linux-stm32@lfdr.de>; Sat, 11 Mar 2023 18:38:07 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9ADC6C6A608;
	Sat, 11 Mar 2023 17:38:07 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F0E1DC6A5F6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 11 Mar 2023 17:38:05 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id r15so5869141edq.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 11 Mar 2023 09:38:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678556285;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ADvKOM9mwPGgDKNtE5dHDUeEeCiEDQjXCHZYcW8EzbA=;
 b=CfgPKp92BDxt/iJ36GZbumEkQyrTaHn83Rgu02Fy64E+0eT2AdQkqJa9PkPQJ1sscS
 D35vUWnyMAAeE01nc02vSGHXBFWR6KLslM0C2fs3XrJYDWqzrn8jALpfbKFk3lQSMY/T
 HYdKEE01VjHy2oy2Wlk868ULw7d6hYJm2kOe5nxTArNqJ2ZRlgrzJHxAXOxj0rkz2L3/
 YnF9iDRdFr7S/6/EPaE1Ydrh32BTeLVe8rTxVanE2aZ4z6FJcg5JgQVReOx+Y4rLw+SI
 nRyM4BGzV+6g900B2nNRHVepwruQJgGYKn9MvXi1Dcw7lQy2cgJHjycyG7YWAjnIbV56
 tPCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678556285;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ADvKOM9mwPGgDKNtE5dHDUeEeCiEDQjXCHZYcW8EzbA=;
 b=b4pSU4Lj9uYhUuQ8lqp/cxnnj0ANkrOLNhKSJj7ehi6AT9dd+I46mUiQR6d4NUOX5/
 MP3ty/3DuQVCEi3doz6vet1H+7HrIMov7wuSXYFddnf7+Gq3d7o2+M5n+/KkR2c45y8f
 rp6o4P50D/gdXkdPZ4aOi0F8su3xPL96x6qw6/r6l58FGPM1iqCKIeCDFfa931VnBy1q
 jiRYsM7rmIV6WrgRARuiUNVUp39TnF1CF4Ulr9O0TyKMRNz813nZ1gGODa9eneuHOPVY
 08ubBymsu/hDzlLVZSjBWGZrkFwxCh/X9g8gb8Rc61xIN1bD5nXOZ245AAwjLFPEyt/L
 kS3g==
X-Gm-Message-State: AO0yUKW1AZ/eQslUy/9tFl98/a66QvTHKajr6LolTZK5GyvC1nR87taT
 w8VA98Rg0qfKeHA5iwYHDhvBsw==
X-Google-Smtp-Source: AK7set9QxtYe1KQEiI0JGd+JCQrlJIVoCYHDahDGxoaZhvwxYbQmCI120IdIT+4Rxw+dOw2QsBQqrQ==
X-Received: by 2002:a50:ff0a:0:b0:4fa:fa6a:1a with SMTP id
 a10-20020a50ff0a000000b004fafa6a001amr1170089edu.12.1678556285634; 
 Sat, 11 Mar 2023 09:38:05 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:6927:e94d:fc63:9d6e])
 by smtp.gmail.com with ESMTPSA id
 b4-20020a50ccc4000000b004c09527d62dsm1444082edj.30.2023.03.11.09.38.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Mar 2023 09:38:05 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Date: Sat, 11 Mar 2023 18:38:03 +0100
Message-Id: <20230311173803.263446-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [Linux-stm32] [PATCH] clocksource: stm32-lp: drop of_match_ptr for
	ID table
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

VGhlIGRyaXZlciBjYW4gbWF0Y2ggb25seSB2aWEgdGhlIERUIHRhYmxlIHNvIHRoZSB0YWJsZSBz
aG91bGQgYmUgYWx3YXlzCnVzZWQgYW5kIHRoZSBvZl9tYXRjaF9wdHIgZG9lcyBub3QgaGF2ZSBh
bnkgc2Vuc2UgKHRoaXMgYWxzbyBhbGxvd3MgQUNQSQptYXRjaGluZyB2aWEgUFJQMDAwMSwgZXZl
biB0aG91Z2ggaXQgbWlnaHQgbm90IGJlIHJlbGV2YW50IGhlcmUpLgoKICBkcml2ZXJzL2Nsb2Nr
c291cmNlL3RpbWVyLXN0bTMyLWxwLmM6MjAzOjM0OiBlcnJvcjog4oCYc3RtMzJfY2xrZXZlbnRf
bHBfb2ZfbWF0Y2jigJkgZGVmaW5lZCBidXQgbm90IHVzZWQgWy1XZXJyb3I9dW51c2VkLWNvbnN0
LXZhcmlhYmxlPV0KClNpZ25lZC1vZmYtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyenlzenRv
Zi5rb3psb3dza2lAbGluYXJvLm9yZz4KLS0tCiBkcml2ZXJzL2Nsb2Nrc291cmNlL3RpbWVyLXN0
bTMyLWxwLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRp
b24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2Nsb2Nrc291cmNlL3RpbWVyLXN0bTMyLWxwLmMg
Yi9kcml2ZXJzL2Nsb2Nrc291cmNlL3RpbWVyLXN0bTMyLWxwLmMKaW5kZXggZGIyODQxZDBiZWI4
Li42NDZiYjkwZjVlOTIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvY2xvY2tzb3VyY2UvdGltZXItc3Rt
MzItbHAuYworKysgYi9kcml2ZXJzL2Nsb2Nrc291cmNlL3RpbWVyLXN0bTMyLWxwLmMKQEAgLTIx
MSw3ICsyMTEsNyBAQCBzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciBzdG0zMl9jbGtldmVu
dF9scF9kcml2ZXIgPSB7CiAJLnJlbW92ZSA9IHN0bTMyX2Nsa2V2ZW50X2xwX3JlbW92ZSwKIAku
ZHJpdmVyCT0gewogCQkubmFtZSA9ICJzdG0zMi1scHRpbWVyLXRpbWVyIiwKLQkJLm9mX21hdGNo
X3RhYmxlID0gb2ZfbWF0Y2hfcHRyKHN0bTMyX2Nsa2V2ZW50X2xwX29mX21hdGNoKSwKKwkJLm9m
X21hdGNoX3RhYmxlID0gc3RtMzJfY2xrZXZlbnRfbHBfb2ZfbWF0Y2gsCiAJfSwKIH07CiBtb2R1
bGVfcGxhdGZvcm1fZHJpdmVyKHN0bTMyX2Nsa2V2ZW50X2xwX2RyaXZlcik7Ci0tIAoyLjM0LjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0
bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
Cmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXN0bTMyCg==
