Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B09B06B5F22
	for <lists+linux-stm32@lfdr.de>; Sat, 11 Mar 2023 18:37:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6F78CC6A60D;
	Sat, 11 Mar 2023 17:37:40 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B25E4C6A5F6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 11 Mar 2023 17:37:38 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id da10so33135454edb.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 11 Mar 2023 09:37:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678556258;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IEgoJS3qrsEtaJMFetSvJY9kS8Ao4kP1CN24XfSlZMM=;
 b=gnJTMg/R/DM4MDRV1H/VEF1WdEk7JlqpqKKwv8TemZESQtQv5gycYDmeGOpnhsmw4C
 hjmlJydNmTCujjKEUWGov7jPWyWWmuwht47dZgr2jVN0s/DFbws2FyZK8/hletoEFvCh
 mAvpYsBvdtV++kmwIw4hX7PKnYqMVwAVk2zlc9Ds632IcqnYZel2I0x3cEERhdlKZ0kv
 ISi0EzHweuKng9p4FXYs6o3Ot6sIv14Kvve7CxfJBY1bku8HTJ0zFPeDH5ZScSGCwIDp
 G9HfsyiuiCNPFGtfEbNJ7t2z0NwYSi4JqZyZ/mgydtjDxBEaqPo2Kj1MjELpkMyU8L1H
 GV8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678556258;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IEgoJS3qrsEtaJMFetSvJY9kS8Ao4kP1CN24XfSlZMM=;
 b=LmdCgLoQhsXFE2KAzNXkI9j4kAYCn4KTITfQ49tXDTwoy2ilr88ptEFPuSjKeCiQc+
 8kyA2mxuWgKaX3JnJgUXk1Bege4KtyHFRinjMfL1Xe2I8ahmpHxOK1qxhHjQBA0bThSJ
 +C+fbUnhWhZ9H9kp5LPSlT1j2EE4JJdcCEDx0AXEoSVleetjgFR7xHn3OCBjTaEMdqqw
 qXvQP/TlZBYKKBPamx80w/7Rgq2gp6HffNeydL91oUHKiMQlnSpblfAI5Yrb9zVFneh3
 iOSj8XLTxvnPLFRGcKEqDd/0PFJ4GofS4Q02SrRC9ZXkCBi+W5aXCeVEkEAi7KQRGdOG
 d5yg==
X-Gm-Message-State: AO0yUKWfBpU2Q0kIy4V33iHQ3l8dbJywSR1ezR3oZOrXTfhpXmoIPMSM
 uC+Vc2S84p7O895ScBN/SZgxRA==
X-Google-Smtp-Source: AK7set8xmYF6AhvJ6Vqs03dYavXCjrvSUKQ4YnoBkZt3pwgrd+3nGWiiNNmwUu2NnSSirCtELHMrUA==
X-Received: by 2002:a17:907:d02:b0:8b1:7eba:de5 with SMTP id
 gn2-20020a1709070d0200b008b17eba0de5mr6402947ejc.10.1678556258246; 
 Sat, 11 Mar 2023 09:37:38 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:6927:e94d:fc63:9d6e])
 by smtp.gmail.com with ESMTPSA id
 k15-20020a50ce4f000000b004d8287c775fsm1444903edj.8.2023.03.11.09.37.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Mar 2023 09:37:37 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-pwm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Date: Sat, 11 Mar 2023 18:37:35 +0100
Message-Id: <20230311173735.263293-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230311173735.263293-1-krzysztof.kozlowski@linaro.org>
References: <20230311173735.263293-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [Linux-stm32] [PATCH 2/2] pwm: stm32-lp: drop of_match_ptr for ID
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
biB0aG91Z2ggaXQgbWlnaHQgbm90IGJlIHJlbGV2YW50IGhlcmUpLgoKICBkcml2ZXJzL3B3bS9w
d20tc3RtMzItbHAuYzoyNDU6MzQ6IGVycm9yOiDigJhzdG0zMl9wd21fbHBfb2ZfbWF0Y2jigJkg
ZGVmaW5lZCBidXQgbm90IHVzZWQgWy1XZXJyb3I9dW51c2VkLWNvbnN0LXZhcmlhYmxlPV0KClNp
Z25lZC1vZmYtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3psb3dza2lAbGlu
YXJvLm9yZz4KLS0tCiBkcml2ZXJzL3B3bS9wd20tc3RtMzItbHAuYyB8IDIgKy0KIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvcHdtL3B3bS1zdG0zMi1scC5jIGIvZHJpdmVycy9wd20vcHdtLXN0bTMyLWxwLmMKaW5kZXgg
ZjMxNWZhMTA2YmU4Li5iYjNhMDQ1YTczMzQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvcHdtL3B3bS1z
dG0zMi1scC5jCisrKyBiL2RyaXZlcnMvcHdtL3B3bS1zdG0zMi1scC5jCkBAIC0yNTIsNyArMjUy
LDcgQEAgc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIgc3RtMzJfcHdtX2xwX2RyaXZlciA9
IHsKIAkucHJvYmUJPSBzdG0zMl9wd21fbHBfcHJvYmUsCiAJLmRyaXZlcgk9IHsKIAkJLm5hbWUg
PSAic3RtMzItcHdtLWxwIiwKLQkJLm9mX21hdGNoX3RhYmxlID0gb2ZfbWF0Y2hfcHRyKHN0bTMy
X3B3bV9scF9vZl9tYXRjaCksCisJCS5vZl9tYXRjaF90YWJsZSA9IHN0bTMyX3B3bV9scF9vZl9t
YXRjaCwKIAkJLnBtID0gJnN0bTMyX3B3bV9scF9wbV9vcHMsCiAJfSwKIH07Ci0tIAoyLjM0LjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0
bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
Cmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXN0bTMyCg==
