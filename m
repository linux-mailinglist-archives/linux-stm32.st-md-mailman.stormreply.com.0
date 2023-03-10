Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 187A06B534A
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Mar 2023 22:46:55 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D555BC6A60C;
	Fri, 10 Mar 2023 21:46:54 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 63B37C65E60
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Mar 2023 21:46:53 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id u9so26178884edd.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Mar 2023 13:46:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678484813;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lzFx8euiB+sc2RTiijtv6CruVrC3VvrxIigbNh0lHCw=;
 b=ousR3cOJbxC6x+UkyFQcWklCFj80NWbEJGdyDrSjeFRWdxuO7XkM0J4FPY/a+Re+ud
 ZpQPSczG8puqE9oD4FbTWjxSyafng0QhvyE3rX2OhSQboWmKHtyqLje+08ogR2ZXDZF/
 Hapo4z9OPfoaqBiFcu+qSq9P8cOSrWQz62T+DqqBW62Bier/CICZrks4KZkbSAqP8aOe
 JWzDx2VsbmooiWLykyWUZcSZvQJ6a7Ef/Q0Ln6RJugf7UTqAvF9v2V6OasRULflKUcFj
 f4e2VCpmVGy0HqNMsyeM0Od6H2sF0vA3caiLz1yNPppZ3c2+KRXn7MZubpIOVnj+0YHH
 6mpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678484813;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lzFx8euiB+sc2RTiijtv6CruVrC3VvrxIigbNh0lHCw=;
 b=kccg6Z6d+WJedb5Vh1PH/KSFdjs3kXuZauCMaB0fU4JnSeAsVaa8xY6TsGQz4tB6/G
 HaGvM1KoTIz7JAAcLCyjDfArMkJ0dGfOfrSpI5ocmgEKvs5qSuZtOm9NI6xmqd+j+Pc+
 TnR9SqSb0Yozz4SIY/C95MrYWnnoIbBaD/Eq7k91f+bwqx8E3E+gueapE3g1wX3f18YW
 Ga/EtMohwdJLSbcSLJlCZa9AfVAXr+lHilVhh3cL8zmwqqy26N09BvRaCfNXFUYDcEbP
 dsTo79cJ+QeE1KPGpMPrB9tqcBRJuQzO7ocln6MZ4RXooLVE3ccB+FLRCJA/MfTQVCTi
 +1jw==
X-Gm-Message-State: AO0yUKW5QfTJvnLdCPNnLni3XZU/0xTN4T1jJEFcW5g1PffDYCl/JwyD
 fuvBWetfYp5BcodHPVoTB8+uNQ==
X-Google-Smtp-Source: AK7set8nWd2eBnYgMGQTtXIPbx0OtD6V7+vbCi+nDaI+pK1IzlYRDbizlxwOP2yZnDYzFE6FeI/EFw==
X-Received: by 2002:a05:6402:1a4d:b0:4a2:223d:4514 with SMTP id
 bf13-20020a0564021a4d00b004a2223d4514mr25732913edb.8.1678484813196; 
 Fri, 10 Mar 2023 13:46:53 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:34:52e3:a77e:cac5])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a50ab45000000b004bf7905559asm488088edc.44.2023.03.10.13.46.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Mar 2023 13:46:52 -0800 (PST)
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
Date: Fri, 10 Mar 2023 22:46:32 +0100
Message-Id: <20230310214632.275648-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230310214632.275648-1-krzysztof.kozlowski@linaro.org>
References: <20230310214632.275648-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [Linux-stm32] [PATCH 5/5] net: ni: drop of_match_ptr for ID table
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
dC9uaS9uaXhnZS5jOjEyNTM6MzQ6IGVycm9yOiDigJhuaXhnZV9kdF9pZHPigJkgZGVmaW5lZCBi
dXQgbm90IHVzZWQgWy1XZXJyb3I9dW51c2VkLWNvbnN0LXZhcmlhYmxlPV0KClNpZ25lZC1vZmYt
Ynk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4K
LS0tCiBkcml2ZXJzL25ldC9ldGhlcm5ldC9uaS9uaXhnZS5jIHwgMiArLQogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9u
ZXQvZXRoZXJuZXQvbmkvbml4Z2UuYyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L25pL25peGdlLmMK
aW5kZXggNTZlMDJjYmEwYjhhLi4wZmQxNTYyODZkNGQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbmV0
L2V0aGVybmV0L25pL25peGdlLmMKKysrIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvbmkvbml4Z2Uu
YwpAQCAtMTQyMiw3ICsxNDIyLDcgQEAgc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIgbml4
Z2VfZHJpdmVyID0gewogCS5yZW1vdmUJCT0gbml4Z2VfcmVtb3ZlLAogCS5kcml2ZXIJCT0gewog
CQkubmFtZQkJPSAibml4Z2UiLAotCQkub2ZfbWF0Y2hfdGFibGUJPSBvZl9tYXRjaF9wdHIobml4
Z2VfZHRfaWRzKSwKKwkJLm9mX21hdGNoX3RhYmxlCT0gbml4Z2VfZHRfaWRzLAogCX0sCiB9Owog
bW9kdWxlX3BsYXRmb3JtX2RyaXZlcihuaXhnZV9kcml2ZXIpOwotLSAKMi4zNC4xCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWls
aW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczov
L3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0z
Mgo=
