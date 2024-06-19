Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DF4B690E6F4
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Jun 2024 11:26:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 95709C78012;
	Wed, 19 Jun 2024 09:26:50 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 18A6AC78002
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Jun 2024 09:26:44 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-424720e73e0so13191495e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Jun 2024 02:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718789203; x=1719394003;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ezQRRIlNxNy2QrCPuAEV8Oyb8ctHh+po983NuDBnwzw=;
 b=QIEm5m3Yn6mCl5FQpbISCL7CILn/FA3wlNLCGY7mES57mNwBl5IFR7zhW/1dCEoILk
 ulDCiE5vAvaHEyIifudXklf35wWmJzTdjxP1u1204qaIymkB2ri7mZ8SzOq6fzAL6QeR
 UL97jrjeBRvO0Or+Qr6KaNkopHIgHt7Zd92CJFLCogXK2cqmpb+kKX7yElt70vWeGQ05
 JbD8pozXl4lKFqZCjfdkt8yEzHPSTNTfHzLhheYAfhUjQg/HQRDpCk5TilmOEDZGi9wE
 X/NaR6MLgeHbbj8KtGVg6k9yt+MU9ISV3KG+nMxGjTc11zU3yyD1QzSI7qVmD8CJEEmo
 gsUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718789203; x=1719394003;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ezQRRIlNxNy2QrCPuAEV8Oyb8ctHh+po983NuDBnwzw=;
 b=Y4P6VR8SQCfGMSoBqyojLe+QhpG2wzYuRRdi2gU4U9IHEw2hFzbOrAP/kd/iIKNqBq
 Xjw4ROIOZsMvdTEWzZhhG2r+tUt8+pO32EglOX6qaYpa6E+TU/MK11WmG/vDRGkNtXag
 Yi4lxHBXZ72V25Oly0koSUNmPF3oe6mi+bTjUZNt5vwwOwsHR0LHtvCW44bH8HN5texi
 1dq9eRbcaTL4lXAWRElRcy80kvgiZboHR5FL4OltZ/8PCE7uY7/Pu8keJqvANikFXsey
 BZ9CAgvcSIDk8jS6XUqR4kP+mk1xtPLM5PIq4TiMyLiBl/yVgMgfxa9HNkNhUUqRE9wT
 YWkg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXip8rojM4nv+IXr7EWAxp77qWoiPcJMOK3vOFpQM+TGwf8BGaE2JDaRU0sjup2qtaOQG5uzKPw5NeAabGiZQeJB36USS0ej0r6qcr9e+5zK27XtIuuRmGB
X-Gm-Message-State: AOJu0Yz8+cc0UKqs0xLij/AqEdD4YbaAtM+xQEHUwnRmrvOXRjdof/MP
 26XjHQAYm65VMhsoHOBaer13vPDM6xft2EhxxX4YaCIYyYexFEnfscn9MHkW/Wo=
X-Google-Smtp-Source: AGHT+IGgDsBMEJLdwNAcDw3PcY77JcN2xEZg75HuwFgkVWJfFOmTXqt3HCQbJEJog+YJjnIQltEwEg==
X-Received: by 2002:adf:ed47:0:b0:35f:1bb2:4354 with SMTP id
 ffacd0b85a97d-36317b7909bmr1476123f8f.35.1718789203528; 
 Wed, 19 Jun 2024 02:26:43 -0700 (PDT)
Received: from localhost (p509153eb.dip0.t-ipconnect.de. [80.145.83.235])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-363e110ea83sm580059f8f.113.2024.06.19.02.26.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jun 2024 02:26:43 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Lee Jones <lee@kernel.org>, Thierry Reding <treding@nvidia.com>
Date: Wed, 19 Jun 2024 11:26:23 +0200
Message-ID: <cover.1718788826.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=533;
 i=u.kleine-koenig@baylibre.com; h=from:subject:message-id;
 bh=8K+WjM34MR24mhU/bzCFPG1mWsgoIklGhckomjtcqZk=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBmcqRBygtncZJsb5+PFhsyNusHwI7zYAGBSK0ow
 /sCo8fwWMWJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZnKkQQAKCRCPgPtYfRL+
 Ti+yB/4mxgOvo+OmLwR8PCMpp2jnM2ClElhsnuSSTMyl5UN4h5GkJDjmONpNy3bsxwB7117/6k1
 Q9AX6/lRsmtxQGS7IMlXosAFM9qk28M+pwZj/egzcD6HRW4hGQ7N1JpyI7v24WrAIZfoj9/eRkQ
 mCjDkuF+Er8mzuXcd0FFdAb+N1OgS6fLlgy67yROfMaFEWMORwf3+SipVd3yyA+d9jM6gwq40Lk
 JbtwsR49cCGABdieBl1IAaOxQhsu3qe0a7o+cpiAucRu3z9pyuEnn/phsBcsH0eOw2xSCNSacxF
 luZ+roIox0Y4FKoHg1lJpeoYae7clhPM25eg453uqWW7aEOU
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Cc: linux-pwm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 0/2] pwm: stm32: Two fixes
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

SGVsbG8sCgp0aGlzIHNlcmllcyBjb250YWlucyB0d28gZml4ZXMgZm9yIHRoZSAuYXBwbHkoKSBj
YWxsYmFjayB3aGVyZSBib2dvdXMKcGVyaW9kcyB3ZXJlIGNhbGN1bGF0ZWQuCgpJIGludGVuZCB0
byBzZW5kIHRoZXNlIHRvIExpbnVzIGJlZm9yZSB2Ni4xMCwgc28gcGxlYXNlIGlmIHlvdSBoYXZl
CmNvbmNlcm5zIGRvbid0IGhlc2l0YXRlIHRvIGV4cHJlc3MgdGhlbS4KCkJlc3QgcmVnYXJkcwpV
d2UKClV3ZSBLbGVpbmUtS8O2bmlnICgyKToKICBwd206IHN0bTMyOiBSZWZ1c2UgdG9vIHNtYWxs
IHBlcmlvZCByZXF1ZXN0cwogIHB3bTogc3RtMzI6IEZpeCBjYWxjdWxhdGlvbiBvZiBwcmVzY2Fs
ZXIKCiBkcml2ZXJzL3B3bS9wd20tc3RtMzIuYyB8IDE5ICsrKysrKysrKysrKysrLS0tLS0KIDEg
ZmlsZSBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoKYmFzZS1jb21t
aXQ6IDE2MTNlNjA0ZGYwY2QzNTljZjJhN2ZiZDliZTdhMGJjZmFjZmFiZDAKLS0gCjIuNDMuMAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3Rt
MzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20K
aHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtc3RtMzIK
