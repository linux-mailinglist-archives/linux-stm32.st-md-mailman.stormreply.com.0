Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A2E05163AA
	for <lists+linux-stm32@lfdr.de>; Sun,  1 May 2022 12:34:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F070CC628A0;
	Sun,  1 May 2022 10:34:52 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ABD34C60462
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  1 May 2022 10:34:51 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id bv19so23068896ejb.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 01 May 2022 03:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=w2ns7ipBZOIfI9eYR5XNbFPvQdAnHfmlBHB+KUxSjlA=;
 b=XKrhM7A9/fGhlDKnSBy713skq8Jb6hNY5w3j5RcEu+Kq6biOP3KN1blmkItGAqYLEn
 GvmtgSP0m5j3IVPJE/gOLXtQPds0HXF1OLznJUy8rwuLaVc/dwZQZyUi0DPYzV9YVdr/
 OoeOkquJP0RSTwFUvTCcNj+EZ7N8KhpiZvuWlhUm0Zm3ujPOj3pm7wgrQryJgr16cxV/
 csIlDioGBoRPm7CP1sAiaWVMOybenEYO7YXUbHPbj0OwZzcSnld6dNF9btfO2zM/EU/R
 dnyj1pbbN5T2WyL3xZ+RGUSZD7G8vXOi5PyEsjgdyA7+IZxvesXiyVg+FXHbw7egT7wz
 xI1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=w2ns7ipBZOIfI9eYR5XNbFPvQdAnHfmlBHB+KUxSjlA=;
 b=uf/tvIMQbRTzDXH3xDIeJsp037vIqUBEENn50uNX5OdR9epxOfq3Bd/kNIeOeQWSYf
 amDK6NIGwYik85AHVl4yJ9Gf4dka1SUuHMJVUekteTEudHprrXFbejZz9wiQn1QbST2S
 I4kigVO0UvCZnEPeDbIN5JBBvj/hbrkttrlp5g1NZW9xiuN9rY8FsRdejDpnomHdOs3i
 x+WyGcSjN1u2NuU7QlQzarz0MbCzNgESvrDY8Nn3aK7rUmICKeRx0loBwI3zddYyXD0x
 DkLykvb07/5fHWPzCCFfhxaNy9aGkDAudttAaTKXysWF2q2YHo50OmztKvMRODrpnCgz
 x4hA==
X-Gm-Message-State: AOAM532fQN5uODS/idNaa1zk1vxvn0bF3+hBC4OTFS6qewgbrwaXgAzN
 DHykeR7fl7HIJhJ7mWEEtmY5+g==
X-Google-Smtp-Source: ABdhPJwZhJl6e4trr4YOaYl/CYYLw9KiekLiz8lTQZvRTpDBo+Hw3P6ZJeQaLMTFJfS8pK/1BqiRiA==
X-Received: by 2002:a17:907:a413:b0:6f3:a9e5:d076 with SMTP id
 sg19-20020a170907a41300b006f3a9e5d076mr6891556ejc.183.1651401291330; 
 Sun, 01 May 2022 03:34:51 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 rb48-20020a170907693000b006f3ef214e11sm2492945ejc.119.2022.05.01.03.34.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 May 2022 03:34:50 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-iio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Sun,  1 May 2022 12:34:47 +0200
Message-Id: <20220501103447.111392-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220501103447.111392-1-krzysztof.kozlowski@linaro.org>
References: <20220501103447.111392-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [Linux-stm32] [PATCH 2/2] iio: ti-ads8688: use of_device_id for OF
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
L3RpLWFkczg2ODguYzo1MDE6MzQ6IGVycm9yOiDigJhhZHM4Njg4X29mX21hdGNo4oCZIGRlZmlu
ZWQgYnV0IG5vdCB1c2VkIFstV2Vycm9yPXVudXNlZC1jb25zdC12YXJpYWJsZT1dCgpTaWduZWQt
b2ZmLWJ5OiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5v
cmc+Ci0tLQogZHJpdmVycy9paW8vYWRjL3RpLWFkczg2ODguYyB8IDEgKwogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9paW8vYWRjL3RpLWFkczg2
ODguYyBiL2RyaXZlcnMvaWlvL2FkYy90aS1hZHM4Njg4LmMKaW5kZXggMjJjMjU4M2VlZGQwLi43
MDhjY2EwYTYzYmUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvaWlvL2FkYy90aS1hZHM4Njg4LmMKKysr
IGIvZHJpdmVycy9paW8vYWRjL3RpLWFkczg2ODguYwpAQCAtNTA4LDYgKzUwOCw3IEBAIE1PRFVM
RV9ERVZJQ0VfVEFCTEUob2YsIGFkczg2ODhfb2ZfbWF0Y2gpOwogc3RhdGljIHN0cnVjdCBzcGlf
ZHJpdmVyIGFkczg2ODhfZHJpdmVyID0gewogCS5kcml2ZXIgPSB7CiAJCS5uYW1lCT0gImFkczg2
ODgiLAorCQkub2ZfbWF0Y2hfdGFibGUgPSBhZHM4Njg4X29mX21hdGNoLAogCX0sCiAJLnByb2Jl
CQk9IGFkczg2ODhfcHJvYmUsCiAJLnJlbW92ZQkJPSBhZHM4Njg4X3JlbW92ZSwKLS0gCjIuMzIu
MAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
c3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8v
bGludXgtc3RtMzIK
