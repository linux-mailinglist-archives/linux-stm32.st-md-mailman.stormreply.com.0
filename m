Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 974F56B5F21
	for <lists+linux-stm32@lfdr.de>; Sat, 11 Mar 2023 18:37:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5B876C6A608;
	Sat, 11 Mar 2023 17:37:39 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C9D74C6A5F6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 11 Mar 2023 17:37:37 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id y4so3593939edo.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 11 Mar 2023 09:37:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678556257;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=B0p0qqpSJoTCtFb+Kr7i0GNnHTIvTQKai2vdNlxuKcM=;
 b=WK3QS4sDwcl1MqsLZ8ZlJxBQN83C2NF1ZVUas7Zl16IihZuW8nnIiAdMlXVMQstawm
 aSFXBEdoeRHAIlLChzTvHtvDu26dyUkunrmDxTMVkpIkxs2BkyC5bOVJyCR0YxQLFJSa
 x/depFRKep/anvIBotssZD8NTUXO1cfEOd3ZXEFJ+un3wIKGeIS6yibWWrSKqBTEAjOl
 jMN+Ct87AroeiHIqPLojAgVZZ733+E8IUZ9Ap1uT5gT3PezCbTk4W3g+bIL9RAnHRdMV
 S8ODEW3VD0b9RaZmdAiddu87FtWTOM6/TrhR9jBcOi7tV9E9yJruCRrsSBcqNiHs7KPm
 6nxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678556257;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=B0p0qqpSJoTCtFb+Kr7i0GNnHTIvTQKai2vdNlxuKcM=;
 b=eD5hhGEAcr2MtgUbA2p82DwmQjTkvLKkEHh31AXIpdgMhk/dE6OcL6Zrla1sA487Br
 qbyjtLUMQHtoYQ1E/wXf+vraZMK1ADZSyWeRqtTAJ+anh+K3wCkbCIbTvJ2+xICe7ykh
 YhTwHqeU+LgCattJgPA6DQeKTDsd7VjWX6WpZePC1K4Bng/R3f0L4+8+uk+WXTep6LmL
 cAE4wFJP9hJ6RbuTpdFO9Q2opNFg2wl+4y3jpFbflMcIF4ovCYYKG1f/AyN0iA9U/UUK
 u1rpXUd3tK7dkAzdSqfjVNw+Qp4fXz2V3tUCfALpKciMscoe55hiUi2eX/gyHgHLGXtW
 SU8w==
X-Gm-Message-State: AO0yUKUEZ+2F323LaICJjiQLIIZe99Vje+tCNOEnp1doujGLf2z6m8e5
 RlyaQy1c+8X0gT17wejrkycUow==
X-Google-Smtp-Source: AK7set8RZc0nvHdqJFDMyISOImOTBaMDNv5a9BgnTgUHSP/vQIbWUHqUGpilsm9lUqmtf3eDSf0ZFg==
X-Received: by 2002:a05:6402:10c9:b0:4f9:9be3:a538 with SMTP id
 p9-20020a05640210c900b004f99be3a538mr3722729edu.13.1678556257370; 
 Sat, 11 Mar 2023 09:37:37 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:6927:e94d:fc63:9d6e])
 by smtp.gmail.com with ESMTPSA id
 k15-20020a50ce4f000000b004d8287c775fsm1444903edj.8.2023.03.11.09.37.36
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
Date: Sat, 11 Mar 2023 18:37:34 +0100
Message-Id: <20230311173735.263293-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [Linux-stm32] [PATCH 1/2] pwm: rcar: drop of_match_ptr for ID table
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
d20tcmNhci5jOjI1MjozNDogZXJyb3I6IOKAmHJjYXJfcHdtX29mX3RhYmxl4oCZIGRlZmluZWQg
YnV0IG5vdCB1c2VkIFstV2Vycm9yPXVudXNlZC1jb25zdC12YXJpYWJsZT1dCgpTaWduZWQtb2Zm
LWJ5OiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+
Ci0tLQogZHJpdmVycy9wd20vcHdtLXJjYXIuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvcHdtL3B3bS1y
Y2FyLmMgYi9kcml2ZXJzL3B3bS9wd20tcmNhci5jCmluZGV4IDU1ZjQ2ZDA5NjAyYi4uOGYzMWYz
Y2M5M2Q1IDEwMDY0NAotLS0gYS9kcml2ZXJzL3B3bS9wd20tcmNhci5jCisrKyBiL2RyaXZlcnMv
cHdtL3B3bS1yY2FyLmMKQEAgLTI2MCw3ICsyNjAsNyBAQCBzdGF0aWMgc3RydWN0IHBsYXRmb3Jt
X2RyaXZlciByY2FyX3B3bV9kcml2ZXIgPSB7CiAJLnJlbW92ZSA9IHJjYXJfcHdtX3JlbW92ZSwK
IAkuZHJpdmVyID0gewogCQkubmFtZSA9ICJwd20tcmNhciIsCi0JCS5vZl9tYXRjaF90YWJsZSA9
IG9mX21hdGNoX3B0cihyY2FyX3B3bV9vZl90YWJsZSksCisJCS5vZl9tYXRjaF90YWJsZSA9IHJj
YXJfcHdtX29mX3RhYmxlLAogCX0KIH07CiBtb2R1bGVfcGxhdGZvcm1fZHJpdmVyKHJjYXJfcHdt
X2RyaXZlcik7Ci0tIAoyLjM0LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
