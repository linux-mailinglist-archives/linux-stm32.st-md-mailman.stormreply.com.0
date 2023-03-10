Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1E06B5349
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Mar 2023 22:46:54 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C76CCC6A60C;
	Fri, 10 Mar 2023 21:46:53 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4F5B8C65E60
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Mar 2023 21:46:52 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id u9so26178728edd.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Mar 2023 13:46:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678484812;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cXkeI9EeTTwYzqS8yh9dXecDUjO0MyQx/L2af0F4moE=;
 b=rxWWjbUO8rJ97FJPVEFDo7oU7FjP8u/rEsKV/5EOl6dj3XiLbs93OlAjpxA7EfxgcG
 Tz6CdfursdQopp7xcuk3pGth7B2oloQRPjpr7MpIJwEVYOtUKUrQirTEiCnm/UQJ1vb1
 FOcgfucgjChDKOR7B5OJNrtaSfzxdaJhslaEYbBLAtS5K4z3qObS+mzs13cuZYS32Ena
 H6z71v0dZ2I8nHC7cs9N1+1cPJf/CtMqLpggIkUUAYRRkf9+kckxm2F1AxiPA7p6e03g
 bkc5OpBl00nAbkUr2EQwaOTLaL1fK7qtrEAI9KYr3A7pIA79M0+rH83tVyRRzIEwtn/w
 lmlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678484812;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cXkeI9EeTTwYzqS8yh9dXecDUjO0MyQx/L2af0F4moE=;
 b=09evqUH42qgoKTIg7Neh7GO3+a3rTLnxQzKDLjTQq3EpvTA0FgT5Vyic6ZECFwwtEr
 NIY7yWaYBxdZb6l2veQbXMobb2qC/+ghs0tUfJVwW1zdHmW8ITsByOg0xrUeLAXljaH4
 SS0kwa/RBmx+6JSmqHjv3CW5IWi3tH4UYjHEwlUjyagoEF+AVx2EhuPbYAajnGRYaMiu
 iKSHd/cu3mzUcBrf8ptRM+aBISHiMkiIxqS90Cc/erJRF9HIBr611Nw6Qhl5MYKK6awS
 vUEdv5zuJ7x6NRsC+TuMB86MMpaQCY+PX2ZARDU23VYWA++leFr/IIuw3fQEt8vIgp5k
 v15g==
X-Gm-Message-State: AO0yUKXm04grN0oeIoDUhWbNwKyH0mPAhnymhb/zbJ7JtmEYNUgPIilt
 0QnpryFZqZx4p3oZ0Vnqi3dNaQ==
X-Google-Smtp-Source: AK7set9FnQbKV7O9a3DrWLVTokM/lU2Y8DlMciq0r4LeGCxvD6J/xsbXRQD1z+zirQTi2clWFbtiFQ==
X-Received: by 2002:a05:6402:2d3:b0:4c3:15f0:1100 with SMTP id
 b19-20020a05640202d300b004c315f01100mr25626233edx.29.1678484811998; 
 Fri, 10 Mar 2023 13:46:51 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:34:52e3:a77e:cac5])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a50ab45000000b004bf7905559asm488088edc.44.2023.03.10.13.46.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Mar 2023 13:46:47 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Byungho An <bh74.an@samsung.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Date: Fri, 10 Mar 2023 22:46:31 +0100
Message-Id: <20230310214632.275648-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230310214632.275648-1-krzysztof.kozlowski@linaro.org>
References: <20230310214632.275648-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [Linux-stm32] [PATCH 4/5] net: samsung: sxgbe: drop of_match_ptr
	for ID table
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
biB0aG91Z2ggaXQgaXMgbm90IHJlbGV2YW50IGhlcmUpLgoKICBkcml2ZXJzL25ldC9ldGhlcm5l
dC9zYW1zdW5nL3N4Z2JlL3N4Z2JlX3BsYXRmb3JtLmM6MjIwOjM0OiBlcnJvcjog4oCYc3hnYmVf
ZHRfaWRz4oCZIGRlZmluZWQgYnV0IG5vdCB1c2VkIFstV2Vycm9yPXVudXNlZC1jb25zdC12YXJp
YWJsZT1dCgpTaWduZWQtb2ZmLWJ5OiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296
bG93c2tpQGxpbmFyby5vcmc+Ci0tLQogZHJpdmVycy9uZXQvZXRoZXJuZXQvc2Ftc3VuZy9zeGdi
ZS9zeGdiZV9wbGF0Zm9ybS5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvc2Ftc3Vu
Zy9zeGdiZS9zeGdiZV9wbGF0Zm9ybS5jIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvc2Ftc3VuZy9z
eGdiZS9zeGdiZV9wbGF0Zm9ybS5jCmluZGV4IDkyNjUzMjQ2NjY5MS4uNGU1NTI2MzAzZjA3IDEw
MDY0NAotLS0gYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9zYW1zdW5nL3N4Z2JlL3N4Z2JlX3BsYXRm
b3JtLmMKKysrIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvc2Ftc3VuZy9zeGdiZS9zeGdiZV9wbGF0
Zm9ybS5jCkBAIC0yMjksNyArMjI5LDcgQEAgc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIg
c3hnYmVfcGxhdGZvcm1fZHJpdmVyID0gewogCS5kcml2ZXIJPSB7CiAJCS5uYW1lCQk9IFNYR0JF
X1JFU09VUkNFX05BTUUsCiAJCS5wbQkJPSAmc3hnYmVfcGxhdGZvcm1fcG1fb3BzLAotCQkub2Zf
bWF0Y2hfdGFibGUJPSBvZl9tYXRjaF9wdHIoc3hnYmVfZHRfaWRzKSwKKwkJLm9mX21hdGNoX3Rh
YmxlCT0gc3hnYmVfZHRfaWRzLAogCX0sCiB9OwogCi0tIAoyLjM0LjEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlz
dApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
