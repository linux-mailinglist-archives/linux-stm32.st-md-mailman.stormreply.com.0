Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 039EC90E6F5
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Jun 2024 11:26:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A5451C78014;
	Wed, 19 Jun 2024 09:26:50 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1A7CDC78006
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Jun 2024 09:26:45 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-421a1b834acso53850465e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Jun 2024 02:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718789205; x=1719394005;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DR7DaLA90oi7Sx2UQfP1lchaT92bhvbec7yBR4cuGW8=;
 b=lJdgIJZ/BtBf70+1LRAxZehXtE9tBmYb11dZNXPcPLUPvBuw+AZyHbPTNYOEDsbMpE
 UBs6evuwKToj6+t1zNzhl3hqDHYd1UvL4MVVq0CqcnSZr918LXIjQpqJkT4MQgQD8srx
 VeZP2T3cmw//s31s6JW4KUcT8FMB81eBI1LvkVg4t6pFqOpzlebONgSgaQz5uj4J7/8L
 vgPtHTaNiVv8MrPSpoSvWPlAPMSMl5ZBIb2wZA80C4pEA5304agNrXVsESb3m1qjLRN3
 pTZC6OBJUbhFjSe34cK7OK77WWN64JTeIL/bM/eEE0zXwavmVjC4dMERDOJAxazylvvD
 ZSrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718789205; x=1719394005;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DR7DaLA90oi7Sx2UQfP1lchaT92bhvbec7yBR4cuGW8=;
 b=Asg72D3gSzobrYlGJ6xqY8L+IPs4q6Q/qxEf3gJKyh8cg6Ubu2glCa3XZTNuF81LTq
 k/7JkDZQvEBsNJ0x1cb0lykRexelqd3bmTLDNCsqtzpxsWMlazofSLNj4Qge8hdlXQke
 ScqleMtIAeDzGkUc/SNRu7JcWFsC3vemVM3ea/96reU0yAsgUP1naDzh8N+8FTGp/L5r
 //Ub3WRpH8B/QiPBEkOJrdm3PdWD6RfZzdu+qrvF8Z9xeAQw4ZlOAh46Rwz6SoyT1vll
 AAONWFHyYk6EYCyBG3kEWl5RZl/e+keyQJ2I+fqKrEN48Zars+NwsQK+xUH5/BuhvWL3
 DrrA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVV6et8Cz5hAu1ERg8GNyVJFA42rAuTTNTvxKleu0epL2yNT1H0R19ZQrJhhAD+bx1OQEwcIm+QfDiYoXe4la3RQCAdc3XDiS+j0706Gc1D3RFPNxV+/s+2
X-Gm-Message-State: AOJu0YxFQhy9fG+1QlIl1DK4vkKq7/tlDHIjqwXvFgWFBPUcMqGE0Ch4
 +hPapX72veb0fkSaZz3oszJ5e4KHJBEGUCcmoBaqvHPguWj5peJI2zKFchgHs2k=
X-Google-Smtp-Source: AGHT+IECQtiC0VKWzrySd3phzgKGLPkfzADfJEpWsC3603JzVYfretGLD12PgHyZjjXmDS4xZ154rg==
X-Received: by 2002:a7b:cd07:0:b0:422:370a:ca57 with SMTP id
 5b1f17b1804b1-4247529bd22mr12959225e9.36.1718789204826; 
 Wed, 19 Jun 2024 02:26:44 -0700 (PDT)
Received: from localhost (p509153eb.dip0.t-ipconnect.de. [80.145.83.235])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-422870e9590sm257894845e9.23.2024.06.19.02.26.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jun 2024 02:26:44 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Lee Jones <lee@kernel.org>, Thierry Reding <treding@nvidia.com>
Date: Wed, 19 Jun 2024 11:26:24 +0200
Message-ID: <c523cc0fa14dd16785c85f4b204ba6d5e02a77a3.1718788826.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1718788826.git.u.kleine-koenig@baylibre.com>
References: <cover.1718788826.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=916;
 i=u.kleine-koenig@baylibre.com; h=from:subject:message-id;
 bh=t/egHWd+wmcQlgsPv+ZLw8ZljE6PdVD/61DykbjcgzU=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBmcqREO8R0IRhIv2cdHZmB13NIe9ta4LYlDZM/y
 NzbWbt7RF2JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZnKkRAAKCRCPgPtYfRL+
 TiHoB/0RVZ9pnx+IyNBO+qORuAclGa8F4EDvd1uHdrU9quZ5Vo2GZqZGHKe+jsPAwrnq5cDTuVL
 uRzTEYQN15LjnjI3DVpjzCXMdmxlSX8AR3oENWmvoURE8AvQjDS/aEEmkIC2M5qjg5JqtRSO475
 b90u24VQc9RElRsZ+/44CaINWsndASrwah18oJ9ymattO4Zreaz2tyKDe08sImU50zAekOAbtAj
 /l7p8ln/vSiXb4xAuR9aSaknu6FuWBlgumoeguo47sJFpL7zbrOg1yTPdBW2JELuJ6JMbMSI9uS
 SuECLulflPslzng2EkpawVELbT7Kaeg/FdHL4xsR7rKXmJL7
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Cc: linux-pwm@vger.kernel.org, stable@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 1/2] pwm: stm32: Refuse too small period
	requests
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

SWYgcGVyaW9kX25zIGlzIHNtYWxsLCBwcmQgbWlnaHQgd2VsbCBiZWNvbWUgMC4gQ2F0Y2ggdGhh
dCBjYXNlIGJlY2F1c2UKb3RoZXJ3aXNlIHdpdGgKCglyZWdtYXBfd3JpdGUocHJpdi0+cmVnbWFw
LCBUSU1fQVJSLCBwcmQgLSAxKTsKCmEgZmV3IGxpbmVzIGRvd24gcXVpdGUgYSBiaWcgcGVyaW9k
IGlzIGNvbmZpZ3VyZWQuCgpGaXhlczogN2VkZjczNjkyMDViICgicHdtOiBBZGQgZHJpdmVyIGZv
ciBTVE0zMiBwbGFmdG9ybSIpCkNjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnClNpZ25lZC1vZmYt
Ynk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAYmF5bGlicmUuY29tPgotLS0K
IGRyaXZlcnMvcHdtL3B3bS1zdG0zMi5jIHwgMiArKwogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvcHdtL3B3bS1zdG0zMi5jIGIvZHJpdmVycy9w
d20vcHdtLXN0bTMyLmMKaW5kZXggYTJmMjMxZDEzYTlmLi4zZTdiMmE4ZTM0ZTcgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvcHdtL3B3bS1zdG0zMi5jCisrKyBiL2RyaXZlcnMvcHdtL3B3bS1zdG0zMi5j
CkBAIC0zMzcsNiArMzM3LDggQEAgc3RhdGljIGludCBzdG0zMl9wd21fY29uZmlnKHN0cnVjdCBz
dG0zMl9wd20gKnByaXYsIHVuc2lnbmVkIGludCBjaCwKIAogCXByZCA9IG11bF91NjRfdTY0X2Rp
dl91NjQocGVyaW9kX25zLCBjbGtfZ2V0X3JhdGUocHJpdi0+Y2xrKSwKIAkJCQkgICh1NjQpTlNF
Q19QRVJfU0VDICogKHByZXNjYWxlciArIDEpKTsKKwlpZiAoIXByZCkKKwkJcmV0dXJuIC1FSU5W
QUw7CiAKIAkvKgogCSAqIEFsbCBjaGFubmVscyBzaGFyZSB0aGUgc2FtZSBwcmVzY2FsZXIgYW5k
IGNvdW50ZXIgc28gd2hlbiB0d28KLS0gCjIuNDMuMAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0
bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
