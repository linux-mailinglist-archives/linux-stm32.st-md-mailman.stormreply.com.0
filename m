Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5566B5345
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Mar 2023 22:46:46 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A0725C6A60C;
	Fri, 10 Mar 2023 21:46:46 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 13930C65E60
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Mar 2023 21:46:45 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id s11so26094589edy.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Mar 2023 13:46:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678484804;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mUBJvPnvYIjkmn4O8oZhEpaIiBhxp2RHHJ3TqWmbT9w=;
 b=tDskI9RJYfTcyk2llrpPGWn1h6wrzSUW1lp9Cfe9F/DNykTWKqfCBePXvN/aYXPjPe
 iG5aYvtKFsYuenPQLe4yUniOhM72D9D55CwIREsLrHBS71zK5rORm7FVsJY9BgIcHUv2
 kREB5E4Nd5rW7pR4aSTfQ2lBy8vK3Rd6Mj3dDfPt/KhgG9Wyump95cZ24irvnv5YgHkI
 dEfMeVIL/zWNCSOgFKs/RfzhT3Kg4bmIZ00Y/8nxeVWoUOa7KOm9+PFMKIyvpTvWqqX0
 /1HcSmlKndCGybs/E2LJ7RGVitKUJH3WQV7JGX1HwJhDE1oMmWlQC2hdv2tcolfquWkH
 ZQKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678484804;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mUBJvPnvYIjkmn4O8oZhEpaIiBhxp2RHHJ3TqWmbT9w=;
 b=J+YgpSr9JoPd1GY+iZUc9MHunjN0eu6H293+Cwun3VQ8SG3kpW9vZBL7iOsuhyDRwD
 FySgMPDO/73twg4fJZc6OpvzP9QMcgOJIkgseP44gMvdrV/Lj6X4OHr8JX+ezg48kvjq
 CGVBM3D8kHtWz868hQjD6/P+NSjeC6YIZIuzuqD57Aw4Ld6IVyeTYiAfiyZ9j4NF9ONN
 SB38WnQ4KKfPP7nCn1Ng6kjrB9ZOnb7PLWerso1H/ZVHafxHyjwoU5uKyFVB6oMMuiZf
 Qcdf5dwo4Ro0i2FeSU+xHUzyDi3L45lzkFOU2ygd+wRwnDuF3oXaRgtebln135rPS65D
 1/sg==
X-Gm-Message-State: AO0yUKX0ZNvADnFxSDIACAQY5R2qk2/PCuw4U7beL9X2RYM/iDzPmh/Z
 Y6lEswllxSA4V4XreqWhD8P9jQ==
X-Google-Smtp-Source: AK7set9osGjpQrpxJegDF8sKXKCQx5GDmuDhzB67DU5cdXSBv9c2wl4JYEXcMCat4OxS1PxXgAHWcw==
X-Received: by 2002:a05:6402:1854:b0:4ac:b614:dd00 with SMTP id
 v20-20020a056402185400b004acb614dd00mr22252359edy.30.1678484804740; 
 Fri, 10 Mar 2023 13:46:44 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:34:52e3:a77e:cac5])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a50ab45000000b004bf7905559asm488088edc.44.2023.03.10.13.46.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Mar 2023 13:46:44 -0800 (PST)
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
Date: Fri, 10 Mar 2023 22:46:29 +0100
Message-Id: <20230310214632.275648-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230310214632.275648-1-krzysztof.kozlowski@linaro.org>
References: <20230310214632.275648-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [Linux-stm32] [PATCH 2/5] net: stmmac: generic: drop of_match_ptr
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
dC9zdG1pY3JvL3N0bW1hYy9kd21hYy1nZW5lcmljLmM6NzI6MzQ6IGVycm9yOiDigJhkd21hY19n
ZW5lcmljX21hdGNo4oCZIGRlZmluZWQgYnV0IG5vdCB1c2VkIFstV2Vycm9yPXVudXNlZC1jb25z
dC12YXJpYWJsZT1dCgpTaWduZWQtb2ZmLWJ5OiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0
b2Yua296bG93c2tpQGxpbmFyby5vcmc+Ci0tLQogZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNy
by9zdG1tYWMvZHdtYWMtZ2VuZXJpYy5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvZXRoZXJuZXQv
c3RtaWNyby9zdG1tYWMvZHdtYWMtZ2VuZXJpYy5jIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3Rt
aWNyby9zdG1tYWMvZHdtYWMtZ2VuZXJpYy5jCmluZGV4IDVlNzMxYTcyY2NlOC4uZWY4ZjNhOTQw
OTM4IDEwMDY0NAotLS0gYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21h
Yy1nZW5lcmljLmMKKysrIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdt
YWMtZ2VuZXJpYy5jCkBAIC05MSw3ICs5MSw3IEBAIHN0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJp
dmVyIGR3bWFjX2dlbmVyaWNfZHJpdmVyID0gewogCS5kcml2ZXIgPSB7CiAJCS5uYW1lICAgICAg
ICAgICA9IFNUTU1BQ19SRVNPVVJDRV9OQU1FLAogCQkucG0JCT0gJnN0bW1hY19wbHRmcl9wbV9v
cHMsCi0JCS5vZl9tYXRjaF90YWJsZSA9IG9mX21hdGNoX3B0cihkd21hY19nZW5lcmljX21hdGNo
KSwKKwkJLm9mX21hdGNoX3RhYmxlID0gZHdtYWNfZ2VuZXJpY19tYXRjaCwKIAl9LAogfTsKIG1v
ZHVsZV9wbGF0Zm9ybV9kcml2ZXIoZHdtYWNfZ2VuZXJpY19kcml2ZXIpOwotLSAKMi4zNC4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0z
MiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpo
dHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51
eC1zdG0zMgo=
