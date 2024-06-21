Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D3B9127F7
	for <lists+linux-stm32@lfdr.de>; Fri, 21 Jun 2024 16:37:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A7957C7128E;
	Fri, 21 Jun 2024 14:37:46 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7CD43C6907A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Jun 2024 14:37:40 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-a6f21ff4e6dso291859166b.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Jun 2024 07:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718980660; x=1719585460;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DpjbtuRsYUxGDKKpuIwVrQYGfcBuCB+ep5KKwdfomXI=;
 b=D1NGh+leu/AkoQuqhcMbFC5ZrLfZZcIIkG+yZRh36wVTVolAwm+8ynP2iG/4LyWXT3
 hWfr6R4qShRlSR+IkHxGMTjX8CtXpiU966o4cTi8WqArZGVqYGg9yx4S9rCIROwsROmV
 BcknR0QbNirN8OaHTOdBo8rSQrljtHrndSdj4XelZTZtV2ULc+YTbzGh/4lBV7mwHr9r
 ZOSI+ghPf6yz+30bCZ/S5wmygF0E6Lef60ltgfwx7FDoXX9vNlcCkguAfOo6pSi79Bop
 +ph5m9cAlaFQD0ZjGdRHameibHl49fL0CeCbAnBDLCE+ZJa0dflyg1Bbs/tQlz+d7nfo
 iN1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718980660; x=1719585460;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DpjbtuRsYUxGDKKpuIwVrQYGfcBuCB+ep5KKwdfomXI=;
 b=M+Tj4gjtQmk7RzWfCgP34dpvMnxZ+FegGQtjDNdW8lX8/9bHpMBvqp9X7dta2ISiwh
 HLpZw+E4bmA0inbWRADyvMQa5LqgGs9KSN+dbk1bqs13RwlmlUkAirY9wpAQhgI2o0Xe
 rxtCJDFGJ0yai5UmPGegWhsJkLrEU5I0IXntbFxodF79x3N+Cn5jKLVKUNqmtu5Rxenb
 sh/Rr3YoW+hnKzqwhMr2Pk+JRUB2g2ocW/cTtIHQpb6X7nM9ZGfTaUreo0b1/NasBWLp
 mN5fEIrJXzs7PV+hys0vSkl5g7tylqYWRCCwdybD5KvjXOe+5fWNG9a2Abpuh/Osaq9N
 uw1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZBWt3vAYtONtaYXG0P2lbnM6mMI0DvSEGyK37k4Kz/kXWMuP8QS8DwaOE3gA9poj6glAeRSkoaIdVEkKWQfOmq3o/uWOxGMZ3xp/4jaOCA6DA2D1wNJTr
X-Gm-Message-State: AOJu0YwUfu0t0wtPC7KV8+QYxZzo+T6AbphHSKhkFYAznf+YcriFcNZX
 SVR1DcZFD3QfhamGdAxPWuj6+ZHEu5nOyft2qZ4wf3PmznhhU+yy8u6RiAaU2dw=
X-Google-Smtp-Source: AGHT+IFnG8vPc7gD/zkJj+cDdWoK1zUqRd6sd4hZoStrTa7UEp0SdW6Bnq1Jrrg14s9KXzb7mLfmvQ==
X-Received: by 2002:a17:907:a646:b0:a6f:5192:6f4d with SMTP id
 a640c23a62f3a-a6fab60321fmr603671866b.8.1718980660351; 
 Fri, 21 Jun 2024 07:37:40 -0700 (PDT)
Received: from localhost (p5091583d.dip0.t-ipconnect.de. [80.145.88.61])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6fcf56ece7sm90255466b.208.2024.06.21.07.37.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jun 2024 07:37:39 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Lee Jones <lee@kernel.org>, Thierry Reding <treding@nvidia.com>
Date: Fri, 21 Jun 2024 16:37:12 +0200
Message-ID: <b86f62f099983646f97eeb6bfc0117bb2d0c340d.1718979150.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1718979150.git.u.kleine-koenig@baylibre.com>
References: <cover.1718979150.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=969;
 i=u.kleine-koenig@baylibre.com; h=from:subject:message-id;
 bh=77m9S/e76ZnqolXIdKGvPpQwodpWtsZsa1irYtdWzSg=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBmdZAb+JF1Lt4sQgcrKfQpUfAROKFoD9THKpVyX
 3OGJ7yuteKJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZnWQGwAKCRCPgPtYfRL+
 TogNB/4wXOzt1/fRlY9bvWJQ8dB2JW/44VfPAoPIjaBk7pL32PDPR21QrNgn1+8ThreMJc6YFht
 BTJPKzI2CtXXdaR/N90Zdv+6Hl+EAxR3+JzPp1fN0F0v74hQ/DsWOPXcQFG+21256SX25ScI2Hv
 s6m/49IIBgcyGmVdHiIZVt/IaoQyXtW7PfhKWqZBCcmOs2zLOhhllZQFwiLhhr5ADfObNftH080
 nIxbYKKHZ+lHZIHeAKH74pq2GjrYAHvlzoSHMnHg7IcbB369mX5L2nxfkwOq/un0+QEzy8PGj0C
 TosDsIqF3zMkjlyMqWdIzyKTzTVNQg5bgLc9w2hB5UsIeZSq
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Cc: Trevor Gamblin <tgamblin@baylibre.com>, linux-pwm@vger.kernel.org,
 stable@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 1/3] pwm: stm32: Refuse too small period
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
ciBTVE0zMiBwbGFmdG9ybSIpCkNjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnClJldmlld2VkLWJ5
OiBUcmV2b3IgR2FtYmxpbiA8dGdhbWJsaW5AYmF5bGlicmUuY29tPgpTaWduZWQtb2ZmLWJ5OiBV
d2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQGJheWxpYnJlLmNvbT4KLS0tCiBkcml2
ZXJzL3B3bS9wd20tc3RtMzIuYyB8IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3B3bS9wd20tc3RtMzIuYyBiL2RyaXZlcnMvcHdtL3B3
bS1zdG0zMi5jCmluZGV4IGEyZjIzMWQxM2E5Zi4uM2U3YjJhOGUzNGU3IDEwMDY0NAotLS0gYS9k
cml2ZXJzL3B3bS9wd20tc3RtMzIuYworKysgYi9kcml2ZXJzL3B3bS9wd20tc3RtMzIuYwpAQCAt
MzM3LDYgKzMzNyw4IEBAIHN0YXRpYyBpbnQgc3RtMzJfcHdtX2NvbmZpZyhzdHJ1Y3Qgc3RtMzJf
cHdtICpwcml2LCB1bnNpZ25lZCBpbnQgY2gsCiAKIAlwcmQgPSBtdWxfdTY0X3U2NF9kaXZfdTY0
KHBlcmlvZF9ucywgY2xrX2dldF9yYXRlKHByaXYtPmNsayksCiAJCQkJICAodTY0KU5TRUNfUEVS
X1NFQyAqIChwcmVzY2FsZXIgKyAxKSk7CisJaWYgKCFwcmQpCisJCXJldHVybiAtRUlOVkFMOwog
CiAJLyoKIAkgKiBBbGwgY2hhbm5lbHMgc2hhcmUgdGhlIHNhbWUgcHJlc2NhbGVyIGFuZCBjb3Vu
dGVyIHNvIHdoZW4gdHdvCi0tIAoyLjQzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBz
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
