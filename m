Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 60EC46B66FA
	for <lists+linux-stm32@lfdr.de>; Sun, 12 Mar 2023 14:51:36 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 15779C6A619;
	Sun, 12 Mar 2023 13:51:36 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 406D2C6905A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 12 Mar 2023 13:51:35 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id s11so38710396edy.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 12 Mar 2023 06:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678629095;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KkVYC+wu1aL5ZaMnE/Wfc7AXFtfPa1srDddtutZjKIg=;
 b=PBBLFoWjxELJQdQqoNyC8b9CBEZ06P7rxyzovfxm0JB/Fbi4q/v0iFUED2KasnzcOk
 8p0vSh2PNexacdl0rT66R1xo4xfYHBhAdvmDNLiKo2WyfMimKUWBQwoe+IHH5SR0m8Op
 5kSdKutzy2mg7yXsS1cQJ3DIpek6WEfkWGS8pfFqcWpDJTyT6JCPMym49C0XeekjoH/H
 yXua0nfUOtONQikxtKOV5NK3VLk1evSaoYx4DgxD0liykRfJlkOi5qXTrZXB7DmiQtUN
 llTaSfrEGJiPYgL2KkuOorgc9z2iSasmkoeFWBqb+lg1i0TMkhRlzEbP6TS9duL2rdsY
 AI6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678629095;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KkVYC+wu1aL5ZaMnE/Wfc7AXFtfPa1srDddtutZjKIg=;
 b=X5EpB75wji+zggQMLkGRZSAF598CsmhC7HnuTCgqBNwicXAMXazD1z3GuXTDOFoBJo
 cYgXlUzoc7ZoDeMNfFxu5Unv+IENVVzz3pmq9YrV6X+TdlPMvM8yzZV4cKpBSIwbiIef
 Y11i0RqQSQJlNqimUI80ujxs8FjA1GwPvuJ9AhPYMnRSX1gaGDPhPSDBD/nIMG/Mxrea
 xOtM9jvJscs7bYJxu+T3l8zJpjheGNBCjB2fxW6nObffq2nBZGBr+8ceh1UlnMaQtnmG
 39uxsjvAICYj8lraUpTxU7JJ7NSZw+VzMmjjQNcV6aZ2p+3J4ipJU6MgcgdVNcpBaXmw
 Z47w==
X-Gm-Message-State: AO0yUKVjpAVsA8aFphVgIPQh/zRnhCSavf2bdU+w2ZgalHBHPlGXIZY/
 68wU0UNtHW6CT4L+ttOFnMWZwQ==
X-Google-Smtp-Source: AK7set/IuMUxX046CBxVvW3ePmZ3nQnQZMlQCR0hcIwerZxQ/d61QF6Fl9Vbf2CQ3y4g0fuGBg7g5w==
X-Received: by 2002:a17:907:ca85:b0:922:3a53:46f8 with SMTP id
 ul5-20020a170907ca8500b009223a5346f8mr3960276ejc.64.1678629094817; 
 Sun, 12 Mar 2023 06:51:34 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:d9f6:3e61:beeb:295a])
 by smtp.gmail.com with ESMTPSA id
 n20-20020a170906701400b008b17fe9ac6csm2263946ejj.178.2023.03.12.06.51.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Mar 2023 06:51:34 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-pwm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Date: Sun, 12 Mar 2023 14:51:20 +0100
Message-Id: <20230312135120.357713-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230312135120.357713-1-krzysztof.kozlowski@linaro.org>
References: <20230312135120.357713-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [Linux-stm32] [PATCH v2 2/2] pwm: stm32-lp: drop of_match_ptr for
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
biB0aG91Z2ggaXQgbWlnaHQgbm90IGJlIHJlbGV2YW50IGhlcmUpLiAgVGhpcwphbHNvIGZpeGVz
ICFDT05GSUdfT0YgZXJyb3I6CgogIGRyaXZlcnMvcHdtL3B3bS1zdG0zMi1scC5jOjI0NTozNDog
ZXJyb3I6IOKAmHN0bTMyX3B3bV9scF9vZl9tYXRjaOKAmSBkZWZpbmVkIGJ1dCBub3QgdXNlZCBb
LVdlcnJvcj11bnVzZWQtY29uc3QtdmFyaWFibGU9XQoKU2lnbmVkLW9mZi1ieTogS3J6eXN6dG9m
IEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnPgoKLS0tCgpDaGFuZ2Vz
IHNpbmNlIHYxOgoxLiBFeHRlbmQgY29tbWl0IG1zZy4KLS0tCiBkcml2ZXJzL3B3bS9wd20tc3Rt
MzItbHAuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlv
bigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvcHdtL3B3bS1zdG0zMi1scC5jIGIvZHJpdmVycy9w
d20vcHdtLXN0bTMyLWxwLmMKaW5kZXggZjMxNWZhMTA2YmU4Li5iYjNhMDQ1YTczMzQgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvcHdtL3B3bS1zdG0zMi1scC5jCisrKyBiL2RyaXZlcnMvcHdtL3B3bS1z
dG0zMi1scC5jCkBAIC0yNTIsNyArMjUyLDcgQEAgc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9kcml2
ZXIgc3RtMzJfcHdtX2xwX2RyaXZlciA9IHsKIAkucHJvYmUJPSBzdG0zMl9wd21fbHBfcHJvYmUs
CiAJLmRyaXZlcgk9IHsKIAkJLm5hbWUgPSAic3RtMzItcHdtLWxwIiwKLQkJLm9mX21hdGNoX3Rh
YmxlID0gb2ZfbWF0Y2hfcHRyKHN0bTMyX3B3bV9scF9vZl9tYXRjaCksCisJCS5vZl9tYXRjaF90
YWJsZSA9IHN0bTMyX3B3bV9scF9vZl9tYXRjaCwKIAkJLnBtID0gJnN0bTMyX3B3bV9scF9wbV9v
cHMsCiAJfSwKIH07Ci0tIAoyLjM0LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
