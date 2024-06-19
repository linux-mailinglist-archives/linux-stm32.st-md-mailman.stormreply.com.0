Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E5FF90E7F5
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Jun 2024 12:12:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 845C3C78018;
	Wed, 19 Jun 2024 10:12:15 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AEDBBC78012
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Jun 2024 10:12:08 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-2e724bc466fso75471581fa.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Jun 2024 03:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718791928; x=1719396728;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hcu8+Zif/ccINpaWODxcQKH3yfc3YxmRr6966jXAh7I=;
 b=AtIekdDizcXiAZg1e8SvWNbCmMnPpoqeafICvtvOjo6aH3L5TcneU4HH3XzoIwELVR
 J2F3gVS0f9gwuE2u00k+/pmQDuE6hHqmmOtpBx4hgpvMRCied9O4wGwqa694v4ZDh4x4
 jTaUpk0XelZ5Lt258rbDTM0AIf2fDQ7zEl/SIOK5rHIIZbOA1r7MnnK/5BFER6bhIbzl
 PpWQJwfBcz4c+P0lfuEUGZtfgyWURJzSH/otu96rx9iXuhdsA9E6K/am6g2ugwTQDpVi
 JTtblcRX9u03VOTvBFTo1x3JsP/t9FKVN93zioSJ8O/2/+PYcvp5gYIU6y08YAh5+o0s
 godg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718791928; x=1719396728;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hcu8+Zif/ccINpaWODxcQKH3yfc3YxmRr6966jXAh7I=;
 b=puFtWjPP8eDNHUG5oNo55OSNmiU7HRtnWFkjhEpicT4o2F5CCdYv1DzjIyTBwX75Hl
 rhPhyrs5Vu9lWOlLJ2fdRNtuFqdOHpH1uF/CN8GpPaxi2hTP+te+aE+JDgPe0vE/nUua
 HSAe/f7CjqdBjwHEKPwgpLdq+X6hZHYaTP+kNK6ORHT+88jfVALPH3wAsESa9ehh+zvq
 yZ+mNh8Y+aEVwZ2y/kP13Nn7OxYj2NF/CPAYcK22UTKV8qA07PLtv4IKF7+RVYSLVlyU
 Ilpg9w/XFrBOXJsNbY+xKbr2oaDMKG+6D2HwThnq+KpHb5jYfBgBNHoePuIWFzzioYAV
 8hyg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVzI1Bfm2qyqS7TUW71esVLdjKNSsHnLVK9g4HCiyiPs6JUlNkaxNpFf/YoTU50sakaI/ZXSKMgH17orB5uDvBJv9067YhwuQ0MykLissoqdUtTkUgePt0W
X-Gm-Message-State: AOJu0YyMHp81SbKb+RhSDnv8mCJX83ZNpAmNanyFWxf9EDFcHUWdpV5G
 spY1618vEgq2OBIcUPAguFNgbGACAhtQfH/vCITtLn8zfuCb982KFc4/xTSaiOs=
X-Google-Smtp-Source: AGHT+IEzhMWtxs5cTYTajp8i9SldB6gh0A8ivaB2clHoeVqUAeVMsyroeG07KMstx6mQ8pQMtp+O1Q==
X-Received: by 2002:a2e:90d1:0:b0:2eb:2e0b:72c with SMTP id
 38308e7fff4ca-2ec3ce940c5mr14717371fa.16.1718791927842; 
 Wed, 19 Jun 2024 03:12:07 -0700 (PDT)
Received: from localhost (p509153eb.dip0.t-ipconnect.de. [80.145.83.235])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-422f6320bcdsm226186795e9.35.2024.06.19.03.12.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jun 2024 03:12:07 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 William Breathitt Gray <wbg@kernel.org>, Lee Jones <lee@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Wed, 19 Jun 2024 12:11:41 +0200
Message-ID: <cover.1718791090.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1724;
 i=u.kleine-koenig@baylibre.com; h=from:subject:message-id;
 bh=kHY1vH6BBkxxZFRnYufEk6fxcSBFGkIlkEUUcK6K/FU=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBmcq7erMUf6iircChQ0RcAdlPwtSu8f0VDee7Kn
 n3MWM2MKluJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZnKu3gAKCRCPgPtYfRL+
 TrTCCACLqYUAHkJZT0Tw/SLsxP+jGGK0k7jYsnE8R/rp8lXu7e3RVClxmNFOaUN9xqaQUfTKV1R
 thDnxrP64UR7FGN9NufoxhW5qJhmwi6FG9pmcjAwCvDqTJBe4k0UvavEtH/y2freKrnVKYZUoIv
 tcDhHbm2O9AP7a1tvAE5sbS0wIo53nVho728sKSY6yJRjTVj/1PyN+Ev0Kd8ae29xEqtMoCLpQu
 GAxYhrXrkgQbHQ2YsfTe3Pp8xyJ6uMmRBIbr6LAVbnT2IPcbePU0T1Sn8p5XUS7Xlme8dbG1phD
 wDtnbmSwF5mY9vILtIlNAoUe7S2pwq3C7hUMppx6gou2E4ts
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Cc: linux-pwm@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, Thorsten Scherer <T.Scherer@eckelmann.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 0/5] mfd: stm32-timers: Make register
	definition more flexible
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

SGVsbG8sCgooaW1wbGljaXQpIHYxIGlzIGF2YWlsYWJsZSBhdApodHRwczovL2xvcmUua2VybmVs
Lm9yZy9sa21sL2NvdmVyLjE3MTgzNTIwMjIuZ2l0LnUua2xlaW5lLWtvZW5pZ0BiYXlsaWJyZS5j
b20KLgoKQ2hhbmdlcyBpbnRyb2R1Y2VkIGhlcmU6CgogLSBTcGxpdCB0aGUgcGF0Y2ggcmVtb3Zp
bmcgVElNX0RJRVJfQ0NfSUUoKSBhbmQgdXNlIGFwcHJvcHJpYXRlIHN1YmplY3QKICAgcHJlZml4
ZXMuIExlZSBhbmQgV2lsbGlhbSBkaWRuJ3QgbGlrZSB0aGUgcGF0Y2ggdG91Y2hpbmcgYm90aAog
ICBpbmNsdWRlL2xpbnV4L21mZC9zdG0zMi10aW1lcnMuaCBhbmQKICAgZHJpdmVycy9jb3VudGVy
L3N0bTMyLXRpbWVyLWNudC5jIG5vdCBoYXZpbmcgYSBoaW50IHRvIHRoZSBjb3VudGVyCiAgIHN1
YnN5c3RlbSAoYXQgbGVhc3QgdGhhdCdzIG15IGludGVycHJldGF0aW9uIG9mIHRoZWlyIGZlZWRi
YWNrKS4KICAgTm90IG1lbnRpb25pbmcgbWZkIGRpZG4ndCBzZWVtIHRvIGJlIGNvbnNpZGVyYWJs
eSBiZXR0ZXIgaW4gbXkgZXllcywKICAgc28gSSBzcGxpdCB0aGlzIHBhdGNoLgogLSBGaXggdHlw
byBub3RpY2VkIGJ5IFRob3JzdGVuLgogLSBVcGRhdGUgc3ViamVjdCBwcmVmaXggb2YgdGhlIGxh
c3QgcGF0Y2ggdG8gbWF0Y2ggd2hhdCBpcyB1c3VhbGx5IGRvbmUKICAgZm9yIHB3bS4KCkkgaGF2
ZSBzb21lIGZ1cnRoZXIgdXBkYXRlcyB0byB0aGUgcHdtLXN0bTMyIGRyaXZlciB0aGF0IHdpbGwg
cHJvYmFibHkKZ28gaW4gYmVmb3JlIHY2LjEwLXJjMS4gVGhleSBzaG91bGRuJ3QgY29uZmxpY3Qs
IHN0aWxsIEknZCBwcmVmZXIgdG8gbGV0CnRoZSBwd20gcGF0Y2ggZ28gaW4gdmlhIG15IHRyZWUg
YXMgSSBtaWdodCBoYXZlIHNvbWUgZnVydGhlciBjaGFuZ2VzIGZvcgp0aGF0IGRyaXZlci4gU28g
aWYgdGhpcyBpcyBtZXJnZWQgdXNpbmcgdGhlIG1mZCBvciBjb3VudGVyIHRyZWUsIHBsZWFzZQpz
a2lwIHRoZSBwd20gcGF0Y2guIEEgc3RhYmxlIGJyYW5jaCB3b3VsZCBiZSB3ZWxjb21lIGluIHRo
aXMgY2FzZS4KCkJlc3QgcmVnYXJkcwpVd2UKCgpVd2UgS2xlaW5lLUvDtm5pZyAoNSk6CiAgbWZk
OiBzdG0zMi10aW1lcnM6IFVuaWZ5IGFsaWdubWVudCBvZiByZWdpc3RlciBkZWZpbml0aW9uCiAg
bWZkOiBzdG0zMi10aW1lcnM6IEFkZCBzb21lIHJlZ2lzdGVyIGRlZmluaXRpb25zIHdpdGggYSBw
YXJhbWV0ZXIKICBjb3VudGVyOiBzdG0zMi10aW1lci1jbnQ6IFVzZSBUSU1fRElFUl9DQ3hJRSh4
KSBpbnN0ZWFkIG9mCiAgICBUSU1fRElFUl9DQ3hJRSh4KQogIG1mZDogc3RtMzItdGltZXJzOiBE
cm9wIHVudXNlZCBUSU1fRElFUl9DQ19JRQogIHB3bTogc3RtMzI6IE1ha2UgdXNlIG9mIHBhcmFt
ZXRyaXNlZCByZWdpc3RlciBkZWZpbml0aW9ucwoKIGRyaXZlcnMvY291bnRlci9zdG0zMi10aW1l
ci1jbnQuYyB8ICAgNCArLQogZHJpdmVycy9wd20vcHdtLXN0bTMyLmMgICAgICAgICAgIHwgIDIy
ICsrLS0KIGluY2x1ZGUvbGludXgvbWZkL3N0bTMyLXRpbWVycy5oICB8IDE3OSArKysrKysrKysr
KysrKysrLS0tLS0tLS0tLS0tLS0KIDMgZmlsZXMgY2hhbmdlZCwgMTA3IGluc2VydGlvbnMoKyks
IDk4IGRlbGV0aW9ucygtKQoKYmFzZS1jb21taXQ6IDE2MTNlNjA0ZGYwY2QzNTljZjJhN2ZiZDli
ZTdhMGJjZmFjZmFiZDAKLS0gCjIuNDMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
