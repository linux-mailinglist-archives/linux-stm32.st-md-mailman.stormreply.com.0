Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 260E19085B7
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Jun 2024 10:10:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BFF75C6C83A;
	Fri, 14 Jun 2024 08:10:46 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3121DC6C83A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Jun 2024 08:10:43 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-57cbc2a2496so1442878a12.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Jun 2024 01:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718352643; x=1718957443;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QuD6ZawdHgTLobNaH080KGKIoeRkT2obaCLXk+nSsgs=;
 b=jj17QGGuNDfI9GumCVeYwOGU7EbIptTwLrnfEp5FQqkjh5kvQ3ABsxGfozcXsx+Bcz
 OGUHYqRwPuypofC4GfvrBPdlPMWMOMTF9qmJBe6i3nHMr09u0PfkBHKmST7TIXMaIclk
 0XoDHCgEk++WKJSAie/jfvGPjFYZ/beG4EdeS5I9C0NJd4xdAchIIpirhFWkd1LSG4wV
 gk86R5p7K7z2dN8xNCMKsFVCfSQZjt2mA/3dVa1hkNBXFQD9+KXjat4YCuB9KrkPsMX6
 ouh+ChCWuIhqodJ/Rzdz+7FG0NeXAjWrMrjWVYpGgghb+WkdIMWQKrqfsSjqsLO1Ovak
 VWyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718352643; x=1718957443;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QuD6ZawdHgTLobNaH080KGKIoeRkT2obaCLXk+nSsgs=;
 b=ady/ZfhIcol+81nbMeilyzuha6K/VfLhHDxbl9O44OT2eeqPBYaykh1qFFvkU7kL/3
 rnI59GvUL2mfU1ZZ8g0X4zpkd3jtUWUbgIQJoOEH6Pf/SvNF1knKeg4UVlH/r8i6ai1Y
 DfC0cK8PCZbr/PfWBSzlt6yEj0CQeOUQ25ijok7csA4d1UrviZ+s4f+5F+Grj+4HsvFy
 C6bE/cXLa851I9GZzMEYPv8mJRoqj0EpOdKI+GhxEleLFOl10MSOokmdXx6kjTHWhe7z
 vFqPtz9bE+h/qw+FcqqTk/QxEoEqAgx8pQzPc1b6Rfjnil9tIZUzGE6UuEX8VjGiErWw
 w7Lg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUyvvQygDeZN0Mt145jYqMqpDx+o5O0n0ct048rqZfv9ga+pjmLW3DDN26G6j9cGYKHQiN6utlbK7asmmeWsE1XUNygPNUdrGKXweaQoyWIUAXPvg4fyhjB
X-Gm-Message-State: AOJu0Yx8+t8vW/65Qlabz6WnvC4YcTGFgdWb2dozPlVwROCcfFdawYTj
 d/bJn61q1fAScDZZPrj4X7RrkK/Tz3ZYjXEKL6PCGwaw6nAV+Hk0F3C2aVYK/oU=
X-Google-Smtp-Source: AGHT+IEMqu+7qslewN1co84cafFARFjbCnFeAoVQrrE+AEY5A7JPk+vqDfcPd1ImJxyVDUqPyuhaJA==
X-Received: by 2002:a50:a699:0:b0:574:f27a:b3ec with SMTP id
 4fb4d7f45d1cf-57cbd66dedcmr1630042a12.16.1718352643400; 
 Fri, 14 Jun 2024 01:10:43 -0700 (PDT)
Received: from localhost (p509153eb.dip0.t-ipconnect.de. [80.145.83.235])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57cbe89005asm793351a12.10.2024.06.14.01.10.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jun 2024 01:10:43 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 William Breathitt Gray <wbg@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Lee Jones <lee@kernel.org>
Date: Fri, 14 Jun 2024 10:10:13 +0200
Message-ID: <0735860960b1b38570bffa5b0de81a97f6e3230e.1718352022.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1718352022.git.u.kleine-koenig@baylibre.com>
References: <cover.1718352022.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2513;
 i=u.kleine-koenig@baylibre.com; h=from:subject:message-id;
 bh=faoC0aeZeNEfEVsHdHCE5eVAIcbP0yTOlxeegES5oTc=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBma/rtEc7IHIN9qA4dnveZ4BER9+A4ph4YG5vIG
 0BOSzwLPdiJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZmv67QAKCRCPgPtYfRL+
 TjOfCACq2XuFlh4CnT20SjoRKQccZkfidv12GiVm+wFpwrQlC5PCRsW7L9WbNMds9LRBx5onDHh
 B9HwIJfTTzKlP4gcJ3NoqB6fONRz92enPgVK2EC5pzoWL5EcvhKzLJiG8qazQyqgkg1ZRn3VyU+
 3sunS2v8z2B/3ZkJ1wTHyB+AI4uI1upJvsc/zBOgomUmpXdyAd4zMLtLSH9aW/a79D7nl0ZWFxN
 KAk2p5c7c/G46lHyMy/Td6IXIdWg2iGloDUQkg6SPztybGlg8EMNdE/LGv+LizH1uKiRXTyCN5f
 Mv3ymYg98p7/bdw0r/CUZxVLyPnv5bMUM2G/y3fdCmA6MMKg
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Cc: linux-iio@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH 3/4] mfd: stm32-timers: Drop TIM_DIER_CC_IE(x)
	in favour of TIM_DIER_CCxIE(x)
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

VGhlc2UgdHdvIGRlZmluZXMgaGF2ZSB0aGUgc2FtZSBwdXJwb3NlIGFuZCB0aGlzIGNoYW5nZSBk
b2Vzbid0CmludHJvZHVjZSBhbnkgZGlmZmVyZW5jZXMgaW4gZHJpdmVycy9jb3VudGVyL3N0bTMy
LXRpbWVyLWNudC5vLgoKVGhlIG9ubHkgZGlmZmVyZW5jZSBiZXR3ZWVuIHRoZSB0d28gaXMgdGhh
dAoKCVRJTV9ESUVSX0NDX0lFKDEpID09IFRJTV9ESUVSX0NDMklFCgp3aGlsZQoKCVRJTV9ESUVS
X0NDeElFKDEpID09IFRJTV9ESUVSX0NDMUlFCgouIFRoYXQgbWFrZXMgaXQgbmVjZXNzYXJ5IHRv
IGhhdmUgYW4gZXhwbGljaXQgIisgMSIgaW4gdGhlIHVzZXIgY29kZSwKYnV0IElNSE8gdGhpcyBp
cyBhIGdvb2QgdGhpbmcgYXMgdGhpcyBpcyB0aGUgY29kZSBsb2NhdGF0aW9uIHRoYXQKImtub3dz
IiB0aGF0IGZvciBzb2Z0d2FyZSBjaGFubmVsIDEgeW91IGhhdmUgdG8gdXNlIFRJTV9ESUVSX0ND
MklFCihiZWNhdXNlIHNvZnR3YXJlIGd1eXMgc3RhcnQgY291bnRpbmcgYXQgMCwgd2hpbGUgdGhl
IHJlbGV2YW50IGhhcmR3YXJlCmRlc2lnbmVyIHN0YXJ0ZWQgYXQgMSkuCgpTaWduZWQtb2ZmLWJ5
OiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQGJheWxpYnJlLmNvbT4KLS0tCiBk
cml2ZXJzL2NvdW50ZXIvc3RtMzItdGltZXItY250LmMgfCA0ICsrLS0KIGluY2x1ZGUvbGludXgv
bWZkL3N0bTMyLXRpbWVycy5oICB8IDEgLQogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9jb3VudGVyL3N0bTMyLXRp
bWVyLWNudC5jIGIvZHJpdmVycy9jb3VudGVyL3N0bTMyLXRpbWVyLWNudC5jCmluZGV4IDA2NjRl
Zjk2OWY3OS4uMTg2ZTczZDZjY2I0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2NvdW50ZXIvc3RtMzIt
dGltZXItY250LmMKKysrIGIvZHJpdmVycy9jb3VudGVyL3N0bTMyLXRpbWVyLWNudC5jCkBAIC00
NjUsNyArNDY1LDcgQEAgc3RhdGljIGludCBzdG0zMl9jb3VudF9ldmVudHNfY29uZmlndXJlKHN0
cnVjdCBjb3VudGVyX2RldmljZSAqY291bnRlcikKIAkJCXJldCA9IHN0bTMyX2NvdW50X2NhcHR1
cmVfY29uZmlndXJlKGNvdW50ZXIsIGV2ZW50X25vZGUtPmNoYW5uZWwsIHRydWUpOwogCQkJaWYg
KHJldCkKIAkJCQlyZXR1cm4gcmV0OwotCQkJZGllciB8PSBUSU1fRElFUl9DQ19JRShldmVudF9u
b2RlLT5jaGFubmVsKTsKKwkJCWRpZXIgfD0gVElNX0RJRVJfQ0N4SUUoZXZlbnRfbm9kZS0+Y2hh
bm5lbCArIDEpOwogCQkJYnJlYWs7CiAJCWRlZmF1bHQ6CiAJCQkvKiBzaG91bGQgbmV2ZXIgcmVh
Y2ggdGhpcyBwYXRoICovCkBAIC00NzgsNyArNDc4LDcgQEAgc3RhdGljIGludCBzdG0zMl9jb3Vu
dF9ldmVudHNfY29uZmlndXJlKHN0cnVjdCBjb3VudGVyX2RldmljZSAqY291bnRlcikKIAogCS8q
IGNoZWNrIGZvciBkaXNhYmxlZCBjYXB0dXJlIGV2ZW50cyAqLwogCWZvciAoaSA9IDAgOyBpIDwg
cHJpdi0+bmNoYW5uZWxzOyBpKyspIHsKLQkJaWYgKCEoZGllciAmIFRJTV9ESUVSX0NDX0lFKGkp
KSkgeworCQlpZiAoIShkaWVyICYgVElNX0RJRVJfQ0N4SUUoaSArIDEpKSkgewogCQkJcmV0ID0g
c3RtMzJfY291bnRfY2FwdHVyZV9jb25maWd1cmUoY291bnRlciwgaSwgZmFsc2UpOwogCQkJaWYg
KHJldCkKIAkJCQlyZXR1cm4gcmV0OwpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9tZmQvc3Rt
MzItdGltZXJzLmggYi9pbmNsdWRlL2xpbnV4L21mZC9zdG0zMi10aW1lcnMuaAppbmRleCA5MmI0
NWE1NTk2NTYuLmYwOWJhNTk4Yzk3YSAxMDA2NDQKLS0tIGEvaW5jbHVkZS9saW51eC9tZmQvc3Rt
MzItdGltZXJzLmgKKysrIGIvaW5jbHVkZS9saW51eC9tZmQvc3RtMzItdGltZXJzLmgKQEAgLTQ3
LDcgKzQ3LDYgQEAKICNkZWZpbmUgVElNX0RJRVJfQ0MySUUJCVRJTV9ESUVSX0NDeElFKDIpCQkJ
LyogQ0MyIEludGVycnVwdCBFbmFibGUJCQkJKi8KICNkZWZpbmUgVElNX0RJRVJfQ0MzSUUJCVRJ
TV9ESUVSX0NDeElFKDMpCQkJLyogQ0MzIEludGVycnVwdCBFbmFibGUJCQkJKi8KICNkZWZpbmUg
VElNX0RJRVJfQ0M0SUUJCVRJTV9ESUVSX0NDeElFKDQpCQkJLyogQ0M0IEludGVycnVwdCBFbmFi
bGUJCQkJKi8KLSNkZWZpbmUgVElNX0RJRVJfQ0NfSUUoeCkJQklUKCh4KSArIDEpCQkJCS8qIEND
MSwgQ0MyLCBDQzMsIENDNCBpbnRlcnJ1cHQgZW5hYmxlCQkqLwogI2RlZmluZSBUSU1fRElFUl9V
REUJCUJJVCg4KQkJCQkJLyogVXBkYXRlIERNQSByZXF1ZXN0IEVuYWJsZQkJCSovCiAjZGVmaW5l
IFRJTV9ESUVSX0NDeERFKHgpCUJJVCg5ICsgKCh4KSAtIDEpKQkJCS8qIENDeCBETUEgcmVxdWVz
dCBFbmFibGUgKHgg4oiIIHsxLCAuLiA0fSkJKi8KICNkZWZpbmUgVElNX0RJRVJfQ0MxREUJCVRJ
TV9ESUVSX0NDeERFKDEpCQkJLyogQ0MxIERNQSByZXF1ZXN0IEVuYWJsZQkJCSovCi0tIAoyLjQz
LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXN0bTMyCg==
