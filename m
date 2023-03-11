Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3706F6B5AE5
	for <lists+linux-stm32@lfdr.de>; Sat, 11 Mar 2023 12:15:56 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DFA1AC6A608;
	Sat, 11 Mar 2023 11:15:55 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BCD35C6A602
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 11 Mar 2023 11:15:53 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id j11so30741817edq.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 11 Mar 2023 03:15:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678533353;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rh0AaE38tztpZM2ohnPgfuHoOSFhJbbw1ifzopWRWTg=;
 b=XoOgVoywU/dkNX1q0aTUOIShgGQRC5OxdFExXoreSYkP0YFnLNt8WLyfaT32qIaQjB
 oJS0J0TAKEksWavBxE+5AlvUVBRtQ8jQPBo7TTwVC2lOHyn8d3gLgtpgRwH00PMJf4nk
 Cs3x43nWKwVVFD8WVjzePRK5LljXiDZ7ocpyUweJLPbuMVUZuPkO8udraDQ1zOzS1lsk
 3wXqx+PSa2zJLwAGzHZxYbj8ttM1m/28uYyTHtHVHSKVyrL9GPt4Wwjz0Yi0obQ0qtxw
 ft7xIjMpnCrgRzEsttWzo4D9TQ3+lDRd/ZFJIUe4oeZ+AawCOYSBFIg0IGGBfW/4W+j8
 ksfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678533353;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rh0AaE38tztpZM2ohnPgfuHoOSFhJbbw1ifzopWRWTg=;
 b=gVBEoxOC7jiRsf9ORornRG0jyXe3I60pP7BB4f2P6caSip23WS0h6yh5IWJmXowwtE
 A4+RCXvPHLK/FiGbAw8h2JzXVs1dyA7RbSftHq6CwZ6b0REV89lIaf4xSjftunS16vBt
 D0zu8LP9mKFVky8vABleW2z07yAs1G/TqjblghJk9EJycJaeg9J6ejq8on7lXYTqA66i
 BzBfwb6Huaazikg3+sFZYQ9QJ8XkiAFU31Y7UFLT8WvJz+K4AikXf7zjwRPloNTcz/Jf
 d/xju9vwAxTQvATBY6aUoBLLPidUJdxRDKxQzKgOb69bq3kbNyvla9uEwp/4LiF1LHgX
 YTzQ==
X-Gm-Message-State: AO0yUKWHrpGq1PIux45pe51/aNOryB5Gd5k10z8gBtSGOvV8HHM5oJrn
 KV3nfKTgtoy7+Q8c+m9dg3h/4w==
X-Google-Smtp-Source: AK7set+GSlHcs/+VM9aTKOQkAIk2VfsnWGS7BFmgvL5vGUzzF28rmCh8Gvha/tuzJZKekbGGKPInsA==
X-Received: by 2002:a17:907:7244:b0:8e7:916f:193d with SMTP id
 ds4-20020a170907724400b008e7916f193dmr35472905ejc.28.1678533353349; 
 Sat, 11 Mar 2023 03:15:53 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:fa97:2d7c:bdd7:e1b])
 by smtp.gmail.com with ESMTPSA id
 qw30-20020a1709066a1e00b0092178941cb6sm475847ejc.39.2023.03.11.03.15.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Mar 2023 03:15:53 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Sat, 11 Mar 2023 12:15:51 +0100
Message-Id: <20230311111551.251675-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [Linux-stm32] [PATCH] nvmem: stm32-romem: mark OF related data as
	maybe unused
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

VGhlIGRyaXZlciBjYW4gYmUgY29tcGlsZSB0ZXN0ZWQgd2l0aCAhQ09ORklHX09GIG1ha2luZyBj
ZXJ0YWluIGRhdGEKdW51c2VkOgoKICBkcml2ZXJzL252bWVtL3N0bTMyLXJvbWVtLmM6MjcxOjM0
OiBlcnJvcjog4oCYc3RtMzJfcm9tZW1fb2ZfbWF0Y2jigJkgZGVmaW5lZCBidXQgbm90IHVzZWQg
Wy1XZXJyb3I9dW51c2VkLWNvbnN0LXZhcmlhYmxlPV0KClNpZ25lZC1vZmYtYnk6IEtyenlzenRv
ZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4KLS0tCiBkcml2ZXJz
L252bWVtL3N0bTMyLXJvbWVtLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL252bWVtL3N0bTMyLXJvbWVt
LmMgYi9kcml2ZXJzL252bWVtL3N0bTMyLXJvbWVtLmMKaW5kZXggYmE3NzllMjY5MzdhLi4zOGQw
YmY1NTcxMjkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbnZtZW0vc3RtMzItcm9tZW0uYworKysgYi9k
cml2ZXJzL252bWVtL3N0bTMyLXJvbWVtLmMKQEAgLTI2OCw3ICsyNjgsNyBAQCBzdGF0aWMgY29u
c3Qgc3RydWN0IHN0bTMyX3JvbWVtX2NmZyBzdG0zMm1wMTNfYnNlY19jZmcgPSB7CiAJLnRhID0g
dHJ1ZSwKIH07CiAKLXN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIHN0bTMyX3JvbWVt
X29mX21hdGNoW10gPSB7CitzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBzdG0zMl9y
b21lbV9vZl9tYXRjaFtdIF9fbWF5YmVfdW51c2VkID0gewogCXsgLmNvbXBhdGlibGUgPSAic3Qs
c3RtMzJmNC1vdHAiLCB9LCB7CiAJCS5jb21wYXRpYmxlID0gInN0LHN0bTMybXAxNS1ic2VjIiwK
IAkJLmRhdGEgPSAodm9pZCAqKSZzdG0zMm1wMTVfYnNlY19jZmcsCi0tIAoyLjM0LjEKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1h
aWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBz
Oi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0
bTMyCg==
