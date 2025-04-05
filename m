Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DD651A7C883
	for <lists+linux-stm32@lfdr.de>; Sat,  5 Apr 2025 11:27:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A5632C78F8E;
	Sat,  5 Apr 2025 09:27:42 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D23DCC78F8E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  5 Apr 2025 09:27:41 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-5e6ff035e9aso5422444a12.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 05 Apr 2025 02:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1743845261; x=1744450061;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+9siO1d0OJXf+kmdtXu0qBtLgacxuY3xseG/1b/zOl0=;
 b=oibXEO26tc7Nyvag1hB1L3vZojwk/fh+O9G1KwUag/T6nAkM7jIuuMoKZ+N7fFlS8y
 IEsgYqYS+C0rzA9wrE5TL3srE3RqfcnIElhAHmtbYEwMyILVCJX9teRPLH5rnfwBFR5U
 6ZSVQWtQVI24Zk4VYZ6GBD9iGoANOIX5MTDD+ANWhEM0wcksAeRTqiHBzHXEdbLHLFVz
 QVnaZ1bvXMGBz/t1HDoLW45JLtQxks/RKatzVXF2UdR5tcXIMluKPDxEEzZjhwCf5vuL
 YyeztmanUzbe5lkkLHEOpf+oWkws5NNFO7eL8xZm3iwWbM4dhoftjBYMNxTVd6ZU5BcN
 hIXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743845261; x=1744450061;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+9siO1d0OJXf+kmdtXu0qBtLgacxuY3xseG/1b/zOl0=;
 b=vhW4+jzA2RRquAt9rqaKgi3UB1WoF6DcRdRvoz6xoG+2tNeulqWz1A6M9IoPrbuydb
 4xIo2OqhESPw/pDJEEMpWX5qlGNKKLqGQe8t1kWeYipZ/8/YJqGdCIgCxLLu2buja6b7
 RPLn7H1Lzsa+mZI8Xn97K41HB4NSkF73zBH7VOXE/yb5VOtx4dofCjMJt8uIYS8HkMmI
 kCwGZeQwCMXiVWmIl1XZ2oXlz93JmOEdr9QmRO9J5uoukFxkk6uEbC8opZwvqQWkzVKC
 Zw1lQGh/32s8CzIkgODsQfVUBtTy1kExXxGrd2TpM6f241MzUZdhyN86qS17GfJzZkQF
 ekcA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXgULAt2Kb4MCd4Str4rK5irY9t+22/78LFszeV11yeXjzaxIcKHxMb+pUnPQiE03W6I92cuiP60Oj6rA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yy2lEpEOUwUfdBCJX5kRHdqORXKdhdu4Fxxy+G21VZjzBkjGLD8
 cAl8aiB9U6N8jj7DsAmQ7NJHT6viwouVyRngFxceWD5/OL/q4hwBDzW+IFkqc5Q=
X-Gm-Gg: ASbGncsd2I+bO4k0ZFCeWvoHX+oySs8j1pVH7T6dvyml+u0nbyVOJQi8QgGgJD4q0vY
 DdPCmjCKRvIDyKAxnwrzQ0k1O7dELNJ12IehOBXqTTQOmMPmUYjBzC5rnNfeKK/Up5Q2gHHlFwk
 f342B9glIq7eSB5zl9T+LT3f+mQbxmxMzteyIkOXEnrXjRtSzEzsMV/OXwcrD/LtebJcAxe4DPP
 gwDEBUW+lLa0FNRbc2G78ebMhLpSAl7600Xma2OEKGWL0vINkYDw3Wa5r1xdCtXMdJtUnY20hxS
 SS3C2Y8TpcadKDcA0q4h1sXVHo4mqSpyqA7k8bbjbS6WSkvQnqREPHQbVF2j
X-Google-Smtp-Source: AGHT+IEHAOg5qx1HK7FVLs7W0Qxv+LAaqChGFqw4tVT6n8qLbrhokvGfFob/wI9f+X8IvCQ2yZT+tQ==
X-Received: by 2002:a05:6402:501a:b0:5ec:7909:1a with SMTP id
 4fb4d7f45d1cf-5f0b3b90213mr5271124a12.12.1743845261362; 
 Sat, 05 Apr 2025 02:27:41 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
 by smtp.gmail.com with UTF8SMTPSA id
 4fb4d7f45d1cf-5f088084eecsm3379240a12.57.2025.04.05.02.27.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Apr 2025 02:27:41 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: linux-pwm@vger.kernel.org
Date: Sat,  5 Apr 2025 11:27:14 +0200
Message-ID: <7803f63b1310ddbd706f51f2f42d30b6dd786b03.1743844730.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <cover.1743844730.git.u.kleine-koenig@baylibre.com>
References: <cover.1743844730.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=696;
 i=u.kleine-koenig@baylibre.com; h=from:subject:message-id;
 bh=CS0yADAVELCrL+iW8Kx2zSuRfLKasMZMlkMKaonSN2U=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBn8Pd49kNiv7t7/o7GyEzogIHT7M1lDxUwJzEce
 gRP4hWfBuqJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZ/D3eAAKCRCPgPtYfRL+
 TkdAB/9t2HkMqkvlwY+Jf7FhSonomLwZB3nkfQZIxIbs37gW1zKYpAhW6k4zurBX/T+oPhnxlQv
 S5KxirYFhXffyyRqQncJrWlccSheAw0YjjPm7KCRLGqPfVO4dCvQDaYxNVfqYouDH/BK73jwIGe
 +ipg3OBU3Z2JOcrxZ7nRNsntv+UTTnGcAdCcu/FybQ11FZgcDILFaBDKYIhstF20JRKxb6bksfC
 /4e2hEFa1YynnIZ/p+efhShJeeO/UIvNHXhmmsT9hHxDR8LxwrCY/NMRvASLGSuPX/eZEuZX/Ez
 PmCs1OBnCmlGUeEdy8pu1jPMM/37D8zcim5+N9bBUnm+MfUk
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Cc: linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 3/6] pwm: stm32: Don't open-code
	TIM_CCER_CCxE()
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

SW5zdGVhZCBvZiBtYW51YWxseSBjYWxjdWxhdGluZyB0aGUgb2Zmc2V0IG9mIHRoZSBjaGFubmVs
cyBDQ3hFIGJpdCwKbWFrZSB1c2Ugb2YgdGhlIFRJTV9DQ0VSX0NDeEUgbWFjcm8uCgpTaWduZWQt
b2ZmLWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQGJheWxpYnJlLmNvbT4K
LS0tCiBkcml2ZXJzL3B3bS9wd20tc3RtMzIuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvcHdtL3B3bS1z
dG0zMi5jIGIvZHJpdmVycy9wd20vcHdtLXN0bTMyLmMKaW5kZXggZWMyYzA1YzllZTdhLi5jNjYy
NWY1MWExOTkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvcHdtL3B3bS1zdG0zMi5jCisrKyBiL2RyaXZl
cnMvcHdtL3B3bS1zdG0zMi5jCkBAIC04OCw3ICs4OCw3IEBAIHN0YXRpYyBpbnQgc3RtMzJfcHdt
X3JvdW5kX3dhdmVmb3JtX3RvaHcoc3RydWN0IHB3bV9jaGlwICpjaGlwLAogCiAJcmF0ZSA9IGNs
a19nZXRfcmF0ZShwcml2LT5jbGspOwogCi0JaWYgKGFjdGl2ZV9jaGFubmVscyhwcml2KSAmIH4o
MSA8PCBjaCAqIDQpKSB7CisJaWYgKGFjdGl2ZV9jaGFubmVscyhwcml2KSAmIH5USU1fQ0NFUl9D
Q3hFKGNoICsgMSkpIHsKIAkJdTY0IGFycjsKIAogCQkvKgotLSAKMi40Ny4yCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5n
IGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
