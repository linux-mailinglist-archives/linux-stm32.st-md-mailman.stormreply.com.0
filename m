Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 40FAD5163A9
	for <lists+linux-stm32@lfdr.de>; Sun,  1 May 2022 12:34:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E4004C6047D;
	Sun,  1 May 2022 10:34:51 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C2741C60462
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  1 May 2022 10:34:50 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id k23so23088385ejd.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 01 May 2022 03:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vHtGiwef2dz9fg142iHKNmyNB93LeSN0WJVlgXLSJeA=;
 b=ZiBy8AAwXRIQDb4eipR3rYvyBUQLvxEuYJlQ7hJvlfa8QhkLB6cS+WDPIQRMJzgsia
 XfyrPBhsKUSer6cIRoaRR7gtYu7EGBjFg4VAKya+pHVyjQQFu2UMkudHGiiXr2dcPZLc
 YEK2Gg8Ry+GyiZBWV2GE1klM97vmQ5ltbCSUV8QBPXIun8vo8WTcgbQm2lANJUhc1guk
 bLRH87kf0aBf36Jst+BcJK6B0BzOtwh03gYWwTG/hSpytged597v9R6zdiE4HVBps/mm
 ECoF+MDYUTZeNJHq7faFFAfOp6GdCO14WIHX4Rdy0a+tDcRbidy/6gS+jbxDX3MptQ+a
 37sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vHtGiwef2dz9fg142iHKNmyNB93LeSN0WJVlgXLSJeA=;
 b=PUcjxEpzcxhNlVctPoogwQ9z9HoPAKidVE9x9ldYd3UdM2FwY34PD0IVtzCstmKI/k
 cyMLOtgPWigo6RKnyZhbhd9hEhssfdX5i1I/yVwAF8ZzQYQCrn5HdBk+BouGrW0Smg3F
 rCXlV9db0lDMGFVXztNVQOwSFCuHiQlLWG1D05uKxmfndqz/naQf3uERHZdsa7Y08HOJ
 HDkmsqWnuT37HWNj0KZf61c9a1/VvY1ODZSu+Llfi0Pyz7KZ5Na9PZWpXZHGmfNWlqCL
 BB71mXegh+NFqx28+0JMolQFpyJroEUWVJZH+DQRkcRb8PU+wyAWWP7OzOZ66muYRkN6
 Tmcw==
X-Gm-Message-State: AOAM532EvH/RO5c2ZNiX1HawINPXDbCiFKAivw4CymR7rdsPGsLOHYrU
 gzxr4l9oCQ7+G6B5Za6wN3lEnw==
X-Google-Smtp-Source: ABdhPJxq4DgO/P3uaMY15/vVwOPYXLDmQLY+kki3wiNdStibVXVMEcRIfzHdj+9FmES9/ahJpjZ9NA==
X-Received: by 2002:a17:906:148a:b0:6f3:833d:5a0f with SMTP id
 x10-20020a170906148a00b006f3833d5a0fmr6933104ejc.49.1651401290366; 
 Sun, 01 May 2022 03:34:50 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 rb48-20020a170907693000b006f3ef214e11sm2492945ejc.119.2022.05.01.03.34.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 May 2022 03:34:49 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-iio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Sun,  1 May 2022 12:34:46 +0200
Message-Id: <20220501103447.111392-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [Linux-stm32] [PATCH 1/2] iio: stmpe-adc: use of_device_id for OF
	matching
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

VGhlIG9mX2RldmljZV9pZCB3YXMgYWRkZWQgdG8gYWxsb3cgbW9kdWxlIGF1dG9sb2FkaW5nLCBi
dXQgaXQgc2hvdWxkIGJlCmFsc28gdXNlZCB0byBhbGxvdyBkcml2ZXIgbWF0Y2hpbmcgdmlhIERl
dmljZXRyZWUuCgpUaGlzIGFsc28gZml4ZXMgVz0xIHdhcm5pbmc6CiAgZHJpdmVycy9paW8vYWRj
L3N0bXBlLWFkYy5jOjM1NzozNDogZXJyb3I6IOKAmHN0bXBlX2FkY19pZHPigJkgZGVmaW5lZCBi
dXQgbm90IHVzZWQgWy1XZXJyb3I9dW51c2VkLWNvbnN0LXZhcmlhYmxlPV0KClNpZ25lZC1vZmYt
Ynk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4K
LS0tCiBkcml2ZXJzL2lpby9hZGMvc3RtcGUtYWRjLmMgfCAxMyArKysrKysrLS0tLS0tCiAxIGZp
bGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvaWlvL2FkYy9zdG1wZS1hZGMuYyBiL2RyaXZlcnMvaWlvL2FkYy9zdG1wZS1hZGMu
YwppbmRleCBkMmQ0MDUzODg0OTkuLjAyMDg3ODlmYzBmNSAxMDA2NDQKLS0tIGEvZHJpdmVycy9p
aW8vYWRjL3N0bXBlLWFkYy5jCisrKyBiL2RyaXZlcnMvaWlvL2FkYy9zdG1wZS1hZGMuYwpAQCAt
MzQ1LDIxICszNDUsMjIgQEAgc3RhdGljIGludCBfX21heWJlX3VudXNlZCBzdG1wZV9hZGNfcmVz
dW1lKHN0cnVjdCBkZXZpY2UgKmRldikKIAogc3RhdGljIFNJTVBMRV9ERVZfUE1fT1BTKHN0bXBl
X2FkY19wbV9vcHMsIE5VTEwsIHN0bXBlX2FkY19yZXN1bWUpOwogCitzdGF0aWMgY29uc3Qgc3Ry
dWN0IG9mX2RldmljZV9pZCBzdG1wZV9hZGNfaWRzW10gPSB7CisJeyAuY29tcGF0aWJsZSA9ICJz
dCxzdG1wZS1hZGMiLCB9LAorCXsgfSwKK307CitNT0RVTEVfREVWSUNFX1RBQkxFKG9mLCBzdG1w
ZV9hZGNfaWRzKTsKKwogc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIgc3RtcGVfYWRjX2Ry
aXZlciA9IHsKIAkucHJvYmUJCT0gc3RtcGVfYWRjX3Byb2JlLAogCS5kcml2ZXIJCT0gewogCQku
bmFtZQk9ICJzdG1wZS1hZGMiLAogCQkucG0JPSAmc3RtcGVfYWRjX3BtX29wcywKKwkJLm9mX21h
dGNoX3RhYmxlID0gc3RtcGVfYWRjX2lkcywKIAl9LAogfTsKIG1vZHVsZV9wbGF0Zm9ybV9kcml2
ZXIoc3RtcGVfYWRjX2RyaXZlcik7CiAKLXN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lk
IHN0bXBlX2FkY19pZHNbXSA9IHsKLQl7IC5jb21wYXRpYmxlID0gInN0LHN0bXBlLWFkYyIsIH0s
Ci0JeyB9LAotfTsKLU1PRFVMRV9ERVZJQ0VfVEFCTEUob2YsIHN0bXBlX2FkY19pZHMpOwotCiBN
T0RVTEVfQVVUSE9SKCJTdGVmYW4gQWduZXIgPHN0ZWZhbi5hZ25lckB0b3JhZGV4LmNvbT4iKTsK
IE1PRFVMRV9ERVNDUklQVElPTigiU1RNUEVYWFggQURDIGRyaXZlciIpOwogTU9EVUxFX0xJQ0VO
U0UoIkdQTCB2MiIpOwotLSAKMi4zMi4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
