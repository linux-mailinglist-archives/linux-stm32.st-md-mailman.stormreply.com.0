Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EE8616B5346
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Mar 2023 22:46:47 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B45A8C6A60E;
	Fri, 10 Mar 2023 21:46:47 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C0B88C6A60D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Mar 2023 21:46:46 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id x3so26035629edb.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Mar 2023 13:46:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678484806;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+zUn8pocVr2r//jTaSouyLBckQgozo/ZDRdK2pwrVA0=;
 b=GjLYdtr76cD0tlTAO5wV6H9B8LZ6F/EFXKOnWg1IxJwkCGZAzUnFpk7PBzYJ1AvYq8
 2rks8v/8oV46X62O+pd5bpO6mbBk3DqNnW1I9G6xyBAzX0uu7ZRXXtlMq/OxFDa+IELj
 7eMzDplpZODmeUbl2GUVzI4XFsYV5vhpQFiRVNx7sMlbwH35Z4B5HMxFQUvZcY7Vr3jA
 WZ4i7baGBsMT0qR0bqjnEAccsBOWnlZYlVgFdTn46lFAP8CBVi0XYAi1iGX5yyNf960U
 jHdYGIxKcEZM7NTpdJpPe4VoDWCjZlMJT2WTB4sEBG4DsrKNTRIBn59halFopEvYTV+B
 hfkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678484806;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+zUn8pocVr2r//jTaSouyLBckQgozo/ZDRdK2pwrVA0=;
 b=sjpa5xjlzOmZjryFsRHo2kKc4XtW53K5ZRrdFMlIRvvaicc8oFVLqv6sRqdFaCjffD
 oK91VftQ0WcWPHqQrotVqrVLI0A3KSpF0QC5UgpuMqUU2UQ+UWwGiiradl+qiLYq+T8L
 crIQXS5N+y2YJda5ZNqLoq+COJ/TqI9hyo/yf0dxtYvgkB2IUc8IU+9OC10g4q36VUaq
 jrHAyljOEaHNC+BBmiLV/PGVOa7+15b3qZKIiUsHXwioj9MBXH3cBwatDrWj3jnGCScM
 As/qyRGbTBpBqdf14mneWEAflyKbEj0TswdRObz/NasDjFn+LLgm9lFdWTJ7zbTtLFpR
 EztA==
X-Gm-Message-State: AO0yUKX9OBDEujaVZ0gnqnUKtDMks3EYE6PbSENAy97CJWr3sUdAR/m1
 iQqVYaktfCLb+rMxuW0isCmx8w==
X-Google-Smtp-Source: AK7set9z+aZBSopwb5K37dZnsHY8LksXJaCSbHMf2DdGMdLvLsqY5zIox8FrR0zcO/9qVVkZepZBRA==
X-Received: by 2002:a17:907:6a8a:b0:90b:20bf:42cc with SMTP id
 ri10-20020a1709076a8a00b0090b20bf42ccmr28105595ejc.21.1678484806327; 
 Fri, 10 Mar 2023 13:46:46 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:34:52e3:a77e:cac5])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a50ab45000000b004bf7905559asm488088edc.44.2023.03.10.13.46.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Mar 2023 13:46:45 -0800 (PST)
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
Date: Fri, 10 Mar 2023 22:46:30 +0100
Message-Id: <20230310214632.275648-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230310214632.275648-1-krzysztof.kozlowski@linaro.org>
References: <20230310214632.275648-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [Linux-stm32] [PATCH 3/5] net: marvell: pxa168_eth: drop
	of_match_ptr for ID table
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
dC9tYXJ2ZWxsL3B4YTE2OF9ldGguYzoxNTc1OjM0OiBlcnJvcjog4oCYcHhhMTY4X2V0aF9vZl9t
YXRjaOKAmSBkZWZpbmVkIGJ1dCBub3QgdXNlZCBbLVdlcnJvcj11bnVzZWQtY29uc3QtdmFyaWFi
bGU9XQoKU2lnbmVkLW9mZi1ieTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxv
d3NraUBsaW5hcm8ub3JnPgotLS0KIGRyaXZlcnMvbmV0L2V0aGVybmV0L21hcnZlbGwvcHhhMTY4
X2V0aC5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvbWFydmVsbC9weGExNjhfZXRo
LmMgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9tYXJ2ZWxsL3B4YTE2OF9ldGguYwppbmRleCA4N2Zm
ZjUzOWQzOWQuLmQ1NjkxYjZhMmJjNSAxMDA2NDQKLS0tIGEvZHJpdmVycy9uZXQvZXRoZXJuZXQv
bWFydmVsbC9weGExNjhfZXRoLmMKKysrIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvbWFydmVsbC9w
eGExNjhfZXRoLmMKQEAgLTE1ODYsNyArMTU4Niw3IEBAIHN0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1f
ZHJpdmVyIHB4YTE2OF9ldGhfZHJpdmVyID0gewogCS5zdXNwZW5kID0gcHhhMTY4X2V0aF9zdXNw
ZW5kLAogCS5kcml2ZXIgPSB7CiAJCS5uYW1lCQk9IERSSVZFUl9OQU1FLAotCQkub2ZfbWF0Y2hf
dGFibGUJPSBvZl9tYXRjaF9wdHIocHhhMTY4X2V0aF9vZl9tYXRjaCksCisJCS5vZl9tYXRjaF90
YWJsZQk9IHB4YTE2OF9ldGhfb2ZfbWF0Y2gsCiAJfSwKIH07CiAKLS0gCjIuMzQuMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFp
bGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6
Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3Rt
MzIK
