Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D5B36B66F9
	for <lists+linux-stm32@lfdr.de>; Sun, 12 Mar 2023 14:51:36 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F189BC6A610;
	Sun, 12 Mar 2023 13:51:35 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 67631C6905A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 12 Mar 2023 13:51:34 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id r15so11532671edq.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 12 Mar 2023 06:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678629094;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JDnsPd/LWUjlQN35JHFuhsEYXZwtHp7Tg6xyrNKkcx0=;
 b=leBUfM+kGmFx3lbw8Ds4LVAFb0egI+bpB6A6mZMS/VNVxu+4LPnPL28e8VsC1XrG3i
 2CAyg+YYxTPz5SkZ1ZbvFBj9aVsaD2i4aG2QkhlrYGx0qWrcFh4P9M9+2byWYonW5fog
 Kc6pcOdb62onyN7rODrAxvycOm0YoDb5yby5JYkvMar5Z81FR+N/XRoNw6ZfT3TRHKyW
 i/Sj5bY6LfKwb3+hyElcwSxDtUmDJzNRmfM8MOxfdk2LrXdUw4h4fEKzeTATAwN8zw0H
 NVIbhrzFARIYBJphMTx+paHb47T1pTPQnIttnaGCTXh77Sxst8zvE0qF9EYk2MR1uArV
 trWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678629094;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JDnsPd/LWUjlQN35JHFuhsEYXZwtHp7Tg6xyrNKkcx0=;
 b=AiSgvouVQzWi6E+y0O0K0lJfvyRiKwBQtS1q3cPTPrOHVew7dFz322mr35wapPyQKO
 akTMERQA6zM21GF9W8ISVWrrFuHCzu7Mx1R6YsCC0pfev/P+593FQSOB654MbXjO7z3v
 YHzNUZ2Y0fhCSFDGYTFuGCTZ1jGVb/da/0KgBxH9LhmFSZUMqL0kSNZ00/lMiFQhSSlf
 46fY7CHegCCTiriyAfwppcL7HfInNjnARVCVTwEad23DJyFPSsd1NFgfwf96CETFEvyJ
 KSshuXxeioqq06ceLyiZbHZnbjvp7q/MI40LxEPgIGZ0azyqVAknaqhXhHrcNOOD4AUn
 X0oA==
X-Gm-Message-State: AO0yUKUv7cJvwD8rr5vh+Y7yI2oxmY1iVnJ/wlMeq7+vJ2luP2UoiRVK
 3d/r7uqlPVdjXZfz9U12cH5TGw==
X-Google-Smtp-Source: AK7set8AeZI1EJibmWQqUYa4b/A/UWGiDLtXaCZSIsf/yj70h2qpSmPI1UJGcprS5rWdcrtwc7TkPQ==
X-Received: by 2002:a17:907:980b:b0:88c:4f0d:85af with SMTP id
 ji11-20020a170907980b00b0088c4f0d85afmr39938981ejc.75.1678629093861; 
 Sun, 12 Mar 2023 06:51:33 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:d9f6:3e61:beeb:295a])
 by smtp.gmail.com with ESMTPSA id
 n20-20020a170906701400b008b17fe9ac6csm2263946ejj.178.2023.03.12.06.51.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Mar 2023 06:51:33 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-pwm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Date: Sun, 12 Mar 2023 14:51:19 +0100
Message-Id: <20230312135120.357713-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [Linux-stm32] [PATCH v2 1/2] pwm: rcar: drop of_match_ptr for ID
	table
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
biB0aG91Z2ggaXQgbWlnaHQgbm90IGJlIHJlbGV2YW50IGhlcmUpLiAgVGhpcwphbHNvIGZpeGVz
ICFDT05GSUdfT0YgZXJyb3I6CgogIGRyaXZlcnMvcHdtL3B3bS1yY2FyLmM6MjUyOjM0OiBlcnJv
cjog4oCYcmNhcl9wd21fb2ZfdGFibGXigJkgZGVmaW5lZCBidXQgbm90IHVzZWQgWy1XZXJyb3I9
dW51c2VkLWNvbnN0LXZhcmlhYmxlPV0KClNpZ25lZC1vZmYtYnk6IEtyenlzenRvZiBLb3psb3dz
a2kgPGtyenlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4KCi0tLQoKQ2hhbmdlcyBzaW5jZSB2
MToKMS4gRXh0ZW5kIGNvbW1pdCBtc2cuCi0tLQogZHJpdmVycy9wd20vcHdtLXJjYXIuYyB8IDIg
Ky0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvcHdtL3B3bS1yY2FyLmMgYi9kcml2ZXJzL3B3bS9wd20tcmNhci5jCmlu
ZGV4IDU1ZjQ2ZDA5NjAyYi4uOGYzMWYzY2M5M2Q1IDEwMDY0NAotLS0gYS9kcml2ZXJzL3B3bS9w
d20tcmNhci5jCisrKyBiL2RyaXZlcnMvcHdtL3B3bS1yY2FyLmMKQEAgLTI2MCw3ICsyNjAsNyBA
QCBzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciByY2FyX3B3bV9kcml2ZXIgPSB7CiAJLnJl
bW92ZSA9IHJjYXJfcHdtX3JlbW92ZSwKIAkuZHJpdmVyID0gewogCQkubmFtZSA9ICJwd20tcmNh
ciIsCi0JCS5vZl9tYXRjaF90YWJsZSA9IG9mX21hdGNoX3B0cihyY2FyX3B3bV9vZl90YWJsZSks
CisJCS5vZl9tYXRjaF90YWJsZSA9IHJjYXJfcHdtX29mX3RhYmxlLAogCX0KIH07CiBtb2R1bGVf
cGxhdGZvcm1fZHJpdmVyKHJjYXJfcHdtX2RyaXZlcik7Ci0tIAoyLjM0LjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcg
bGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
