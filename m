Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C5BBFA7C882
	for <lists+linux-stm32@lfdr.de>; Sat,  5 Apr 2025 11:27:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8CA20C78F89;
	Sat,  5 Apr 2025 09:27:41 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 570B5C78F8B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  5 Apr 2025 09:27:40 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-5e677f59438so4395302a12.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 05 Apr 2025 02:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1743845260; x=1744450060;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/vhjgPM25WIrJtvsOvWD9TP3Lhl6m8KVBdL4zwgprPU=;
 b=Kt8/GrIILnRboWPtkF6l6HPeZ38WTTAypUORHpIpUbTv80bI24/3qF4/FI3lMBoVEW
 +1ANAhqkcQxc4y3Px0qHxGphT1+D/4TwpSc2eteXnEmfcUGARfrOuWYC/sLlAmdWi/wn
 FdIssks4Vpo0llPI9RWZ1W5s4CrClY6FP2szTPWlrlAmjMU94xcr2VRnvWM7JNRcYSwl
 b29jmAMcBXc/yXwp6wZ/+eZUWPUhsfo/xYAwmoD+zewLfoaf5rk9/UkcroNNB9pNnpG1
 aMt7s49EdQTYx2NCwgeYGBejLtjCu3vZFVuib+A5oW7yPqYofpt4yieMvxbrA2cFHY67
 g5kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743845260; x=1744450060;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/vhjgPM25WIrJtvsOvWD9TP3Lhl6m8KVBdL4zwgprPU=;
 b=tWnf1F+JoR6xmCKYWqWXUkQLftaYtui0H+iA6DLrjjSjqepfvHpkNPciY5j9TRfWuG
 mVBUxDxfW+uTeIMjRCbbqu42srGerZdCZH4W8+dqhG2ieBYQRrVt2apqdpvUcbBzEMn1
 M0pm4tTLvF0Nm1k4aNyyux604VK+ijbwcsZyz5wVmKHPfKz2rJnwq9SFEnSNJozRRx+4
 WvrAIrm6i8Wiv+8k0OsPNPNoo6b4ZuNJLWaV9jKllCqKGNpg2e99GdG+ZRtpOZnWfsN0
 rtz5Ba6o2sRZ4bBCY/Rx9l1fVwNKSPm+Dm5CB2VeXCLbTXf3CAILyu2sniBqbafsrhnI
 brew==
X-Forwarded-Encrypted: i=1;
 AJvYcCV7wbJPd3REZgN9J9xtaDm5ooFD3vINuxBUx9n/23UNBs3/5OSmRrb64I3TC/pE2SJE6pCe85YPh9yYEg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yzbx7b/Mq3Tn+yMYHG08kEGTTNZ+AdLCiIo1AJ+eOpvhQ2qzg6+
 LEjWGIPLhfUa6R0VHBAdlD77EhUo1wMFvsvwi95+hnlD2sc+IC0sxn/j+X36Gow=
X-Gm-Gg: ASbGncs4TbVPugPBLN5mGoXLHHha+4J7P3HsTLadkCsC89WuYSxslTP8LcsCRIyiWzp
 CxmhwQg5F7gW5pjsEvlCMUbKhNpwqj6KcIJJa6ByAGjuvfrnPkiVmDm1W75CVxJZPlInP2kH8f8
 uu7492PgBG4VHKEANqHVB3HevgIFTNJDzALfPt8AxypoSUxLjG7D+k6d+G6l9J6oD5tAyBqrClM
 0f7eTkIsiXSpHxTubRijVnN3R/VS0s58knqwnqXYckyADj3y1gKHQgkOGnH9E5KGRvqAbXdKsFq
 rEoLeaORrAzH4NFbZd16axRQrVEEb55xFI9lCgu0Br0upCd5og==
X-Google-Smtp-Source: AGHT+IGxU6AQk/lGxA5BuJalTi4YDJdWHCrI3Gxv3qwNMs4ENzrJKR1Xxmjq53bryBeUQ1gqPpBg8A==
X-Received: by 2002:a17:906:f588:b0:ac7:7526:46a7 with SMTP id
 a640c23a62f3a-ac7d6c9f9f8mr456183566b.1.1743845259603; 
 Sat, 05 Apr 2025 02:27:39 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
 by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-ac7bfe5d3d8sm392574566b.31.2025.04.05.02.27.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Apr 2025 02:27:39 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: linux-pwm@vger.kernel.org
Date: Sat,  5 Apr 2025 11:27:13 +0200
Message-ID: <f0c50df31daa3d6069bfa8d7fb3e71fae241b026.1743844730.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <cover.1743844730.git.u.kleine-koenig@baylibre.com>
References: <cover.1743844730.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1609;
 i=u.kleine-koenig@baylibre.com; h=from:subject:message-id;
 bh=kHydnSM0ULFQvWKEWgBJvoEZ4DMOWEDjsKpnVZckxBc=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBn8Pd1OuSd8laVmWsGMsZDQ3jElzoOQdmOU0iVj
 Pfwnc8P+kaJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZ/D3dQAKCRCPgPtYfRL+
 Tkw/B/9jCyatQhCnULqdSAYE6atXCRb8xNFBivDhozOExipctqkbMkUxZN9AKJ1YgwFfWHLNl0z
 PUSP8gpGwtEQUxTzzp2s5toba5GXknwV0rO6+9YdTjf5SlLRVO9Vuru9m3Z6I67iUD7FG+8/20T
 hftKLgmwm1MFOxcN1nEr+5L9o9Il8jAkXqLMNWPtkiKBFDz3s4WDY6Utex2YaiDmbUdYGJTUOuM
 3kXU1Dbmc9xQDzmoJPIU+ivoT7mGih87U1/i4W7s2iaJbgDM7KXly4D591nvm3oGGu9BMh4DKEn
 9z21R0ghSUi0Z2k+g2BOV3Esx3ZQWrT//64X88x1buPhHoD6
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Cc: linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 2/6] pwm: stm32: Search an appropriate
	duty_cycle if period cannot be modified
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

SWYgYW5vdGhlciBjaGFubmVsIGlzIGFscmVhZHkgZW5hYmxlZCBwZXJpb2QgbXVzdCBub3QgYmUg
bW9kaWZpZWQuIElmCnRoZSByZXF1ZXN0ZWQgcGVyaW9kIGlzIHNtYWxsZXIgdGhhbiB0aGlzIHVu
Y2hhbmdhYmxlIHBlcmlvZCB0aGUgZHJpdmVyCmlzIHN0aWxsIHN1cHBvc2VkIHRvIHNlYXJjaCBh
IGR1dHlfY3ljbGUgYWNjb3JkaW5nIHRvIHRoZSB1c3VhbCByb3VuZGluZwpydWxlcy4KClNvIGRv
bid0IHNldCB0aGUgZHV0eV9jeWNsZSB0byAwIGJ1dCBjb250aW51ZSB0byBkZXRlcm1pbmUgYW4K
YXBwcm9wcmlhdGUgdmFsdWUgZm9yIGNjci4KCkZpeGVzOiBkZWFiYTljZmY4MDkgKCJwd206IHN0
bTMyOiBJbXBsZW1lbnRhdGlvbiBvZiB0aGUgd2F2ZWZvcm0gY2FsbGJhY2tzIikKU2lnbmVkLW9m
Zi1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BiYXlsaWJyZS5jb20+Ci0t
LQogZHJpdmVycy9wd20vcHdtLXN0bTMyLmMgfCAxMiArKystLS0tLS0tLS0KIDEgZmlsZSBjaGFu
Z2VkLCAzIGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9wd20vcHdtLXN0bTMyLmMgYi9kcml2ZXJzL3B3bS9wd20tc3RtMzIuYwppbmRleCBhNTlkZTRk
ZTE4YjYuLmVjMmMwNWM5ZWU3YSAxMDA2NDQKLS0tIGEvZHJpdmVycy9wd20vcHdtLXN0bTMyLmMK
KysrIGIvZHJpdmVycy9wd20vcHdtLXN0bTMyLmMKQEAgLTEwMywyMiArMTAzLDE2IEBAIHN0YXRp
YyBpbnQgc3RtMzJfcHdtX3JvdW5kX3dhdmVmb3JtX3RvaHcoc3RydWN0IHB3bV9jaGlwICpjaGlw
LAogCQlpZiAocmV0KQogCQkJZ290byBvdXQ7CiAKLQkJLyoKLQkJICogY2FsY3VsYXRlIHRoZSBi
ZXN0IHZhbHVlIGZvciBBUlIgZm9yIHRoZSBnaXZlbiBQU0MsIHJlZnVzZSBpZgotCQkgKiB0aGUg
cmVzdWx0aW5nIHBlcmlvZCBnZXRzIGJpZ2dlciB0aGFuIHRoZSByZXF1ZXN0ZWQgb25lLgotCQkg
Ki8KIAkJYXJyID0gbXVsX3U2NF91NjRfZGl2X3U2NCh3Zi0+cGVyaW9kX2xlbmd0aF9ucywgcmF0
ZSwKIAkJCQkJICAodTY0KU5TRUNfUEVSX1NFQyAqICh3Zmh3LT5wc2MgKyAxKSk7CiAJCWlmIChh
cnIgPD0gd2Zody0+YXJyKSB7CiAJCQkvKgotCQkJICogcmVxdWVzdGVkIHBlcmlvZCBpcyBzbWFs
bCB0aGFuIHRoZSBjdXJyZW50bHkKKwkJCSAqIHJlcXVlc3RlZCBwZXJpb2QgaXMgc21hbGxlciB0
aGFuIHRoZSBjdXJyZW50bHkKIAkJCSAqIGNvbmZpZ3VyZWQgYW5kIHVuY2hhbmdhYmxlIHBlcmlv
ZCwgcmVwb3J0IGJhY2sgdGhlIHNtYWxsZXN0Ci0JCQkgKiBwb3NzaWJsZSBwZXJpb2QsIGkuZS4g
dGhlIGN1cnJlbnQgc3RhdGU7IEluaXRpYWxpemUKLQkJCSAqIGNjciB0byBhbnl0aGluZyB2YWxp
ZC4KKwkJCSAqIHBvc3NpYmxlIHBlcmlvZCwgaS5lLiB0aGUgY3VycmVudCBzdGF0ZSBhbmQgcmV0
dXJuIDEKKwkJCSAqIHRvIGluZGljYXRlIHRoZSB3cm9uZyByb3VuZGluZyBkaXJlY3Rpb24uCiAJ
CQkgKi8KLQkJCXdmaHctPmNjciA9IDA7CiAJCQlyZXQgPSAxOwotCQkJZ290byBvdXQ7CiAJCX0K
IAogCX0gZWxzZSB7Ci0tIAoyLjQ3LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
