Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 174BBA36ED6
	for <lists+linux-stm32@lfdr.de>; Sat, 15 Feb 2025 15:37:48 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ADBC6C78F7F;
	Sat, 15 Feb 2025 14:37:47 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D27E1C78F6B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 15 Feb 2025 14:37:40 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-abb7520028bso59325566b.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 15 Feb 2025 06:37:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739630260; x=1740235060;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nSaNx8YQ2EWhxCnCr/97FLvnOt+570/h4vEIeiMge+k=;
 b=lnYWk6BNAnWcqz4beh76G/XqPZHYBNQHMuo3epz0ZOD4m4rB3TvduSjwF/SS94Zy37
 931vp5j28BqxhKITTmSinNimvxtSHfsmHKyBHHWyRLONBGqDpt9YmZHmYuGCnDDlXtUC
 bIdme07GKd6+PLQHS6yKYeNwylAzWoootcyH97gihdO/WqqiZSDzmiMoYpJeXLnJhjpL
 cr6HELP8N2uKTo7i0xPqMrToAilQDYmQNtoNKmAHgWdhosxzII17Yf1adTpukLapEItJ
 gXz6Eu/eHK4Z/sPi7fhWY30jFS8RHY5FhKowbZGXjJEW+/tP1Q6C5uDXKegyPB0vGgJX
 Z/eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739630260; x=1740235060;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nSaNx8YQ2EWhxCnCr/97FLvnOt+570/h4vEIeiMge+k=;
 b=Bz27RU8UNzk7jsf4PgLHAC/jdpZ12XoW9YYR/HcqzErvlfnR3ph7lO0537ww5CUPwm
 xpFl/yUhGxX1qlET/AkW9JrX1IrNRT8rHpTiyWl8HuGmPZeu2gvPQbCAm7OwQhghmsOL
 EvXPOhFjGad7VGD/oSFwAP+7f9jTrnhbR/aploinpKAB49AF060cjonnsA3E+lmHxOkn
 m6N89+oWeAOe5H7cK9NFwCasZmktwEICugDplGSQuP8T/ArC23wnRc1OEd9PGiNyBzHW
 WjEW5acmM2dnei96MZnSpVlrwbgVqN/jBuAWYoKUd6P0rX0SoSTOPHsdKp1sJa5C++Yf
 BTOw==
X-Gm-Message-State: AOJu0YwwsvAhWV9tncLZbiAL74tB5xixQT8fSCGKG9233UK/thz28TZp
 KTl6k/0UsjXoqFyg1YmeGdL7Z3kAIMor0ACdpFkeBFdc66KeG7Ih+oQaKRKI8xs=
X-Gm-Gg: ASbGncuCVHzEV7MbJ4TQyTDjmqyj31Y2WoBADF2DFulQ7qWPz6IxGmtgMMSjGgYeHgZ
 LyU5pOZJaW0aJtNaCuK+LV0ZdUXRjGTPHZK1QKX/t7hb/e1AdkjD/9MbKnk0mQHsGLgFqIJ04sV
 5t3q5TZuffMStsnRKGce0mT2pt9b95IFSGJZ+Wc31LZ7UPuNTVJa5gnlHKG1xw2K6RfPu8Wz6Hx
 pX0L3L6eiLu9G+5uq/tBA+gnGvLfF+m3qd4Hu/GpslcIkck1YzXlClS0fz56hf+XxrS9EvKO5B1
 JQxsonStxmk2ra+NmUMv
X-Google-Smtp-Source: AGHT+IFt+EQlS1yD/Pqn470UtSRXl2RwFv111R6YU8LvXgLUSAycfdItfiHCwgWYA+V/QSES0Rr1ew==
X-Received: by 2002:a17:906:30db:b0:ab6:f68c:746e with SMTP id
 a640c23a62f3a-abb70d7994bmr260292266b.41.1739630260245; 
 Sat, 15 Feb 2025 06:37:40 -0800 (PST)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aba569dd320sm508104466b.72.2025.02.15.06.37.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Feb 2025 06:37:39 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-pwm@vger.kernel.org
Date: Sat, 15 Feb 2025 15:37:22 +0100
Message-ID: <20250215143723.636591-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2134;
 i=u.kleine-koenig@baylibre.com; h=from:subject;
 bh=7EURNpoHSBP3WHFlLw0KLAnxXhoJ+QFpagdnWt5h0qo=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBnsKajSFpSGYDQiIEQHcSvInMz9OmjgQlzntWWc
 Yw5UfZs1LaJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZ7CmowAKCRCPgPtYfRL+
 TnJ7B/wLIPZby+assjCEHqaTkuBWgWI4PjQyAydedxwVJ6OmtxlZm4lXOkuVb2m5Y7RFwydwZon
 uduuSGK539qG4tGVF/mcHOhcrRQxmgrWnJgFvaC0UivpfmPti0S5cbveo+ceIMYtHk9bNSHpI/T
 h/oyeSUcj+0NM5MoRLjf5qNpGfOFgfUuTIdDPtcEysOqS5IESFREXBp5xuYrrGzqDRDTbkHF+h6
 6JNKF7pQ2wWw4KnltVBz+aZk6YCp1Cav8vSG1VBIDwBbfkb4W5UaGtD0MnBK4mQSsRL/pbdPyOg
 VglGaQanwAq3ajbxUGR7HoJqrvRrqK/6BYXbFVdgm/GFw7SJ
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Cc: linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] pwm: stmpe: Allow to compile as a module
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

cHdtLXN0bXBlIGlzIHRoZSBvbmx5IGRyaXZlciB0aGF0IGNhbm5vdCBiZSBidWlsdCBhcyBhIG1v
ZHVsZS4gQWRkIHRoZQpuZWNlc3NhcnkgYm9pbGVycGxhdGUgdG8gYWxzbyBtYWtlIHRoaXMgZHJp
dmVyIG1vZHVsYXIuCgpTaWduZWQtb2ZmLWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUt
a29lbmlnQGJheWxpYnJlLmNvbT4KLS0tCiBkcml2ZXJzL3B3bS9LY29uZmlnICAgICB8ICAyICst
CiBkcml2ZXJzL3B3bS9wd20tc3RtcGUuYyB8IDI1ICsrKysrKysrKysrKysrKysrKysrKysrLS0K
IDIgZmlsZXMgY2hhbmdlZCwgMjQgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL3B3bS9LY29uZmlnIGIvZHJpdmVycy9wd20vS2NvbmZpZwppbmRleCBl
Yzg1ZjM4OTU5MzYuLjM1NTU5YjU0MWY4OSAxMDA2NDQKLS0tIGEvZHJpdmVycy9wd20vS2NvbmZp
ZworKysgYi9kcml2ZXJzL3B3bS9LY29uZmlnCkBAIC02NDYsNyArNjQ2LDcgQEAgY29uZmlnIFBX
TV9TVE0zMl9MUAogCSAgd2lsbCBiZSBjYWxsZWQgcHdtLXN0bTMyLWxwLgogCiBjb25maWcgUFdN
X1NUTVBFCi0JYm9vbCAiU1RNUEUgZXhwYW5kZXIgUFdNIGV4cG9ydCIKKwl0cmlzdGF0ZSAiU1RN
UEUgZXhwYW5kZXIgUFdNIGV4cG9ydCIKIAlkZXBlbmRzIG9uIE1GRF9TVE1QRQogCWhlbHAKIAkg
IFRoaXMgZW5hYmxlcyBzdXBwb3J0IGZvciB0aGUgUFdNcyBmb3VuZCBpbiB0aGUgU1RNUEUgSS9P
CmRpZmYgLS1naXQgYS9kcml2ZXJzL3B3bS9wd20tc3RtcGUuYyBiL2RyaXZlcnMvcHdtL3B3bS1z
dG1wZS5jCmluZGV4IGJiOTEwNjJkNWYxZC4uNzNmMTI4NDM5OTlhIDEwMDY0NAotLS0gYS9kcml2
ZXJzL3B3bS9wd20tc3RtcGUuYworKysgYi9kcml2ZXJzL3B3bS9wd20tc3RtcGUuYwpAQCAtMzI2
LDEyICszMjYsMzMgQEAgc3RhdGljIGludCBfX2luaXQgc3RtcGVfcHdtX3Byb2JlKHN0cnVjdCBw
bGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJCXJldHVybiByZXQ7CiAJfQogCisJcGxhdGZvcm1fc2V0
X2RydmRhdGEocGRldiwgY2hpcCk7CisKIAlyZXR1cm4gMDsKIH0KIAorc3RhdGljIHZvaWQgX19l
eGl0IHN0bXBlX3B3bV9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKK3sKKwlz
dHJ1Y3Qgc3RtcGUgKnN0bXBlID0gZGV2X2dldF9kcnZkYXRhKHBkZXYtPmRldi5wYXJlbnQpOwor
CXN0cnVjdCBwd21fY2hpcCAqY2hpcCA9IHBsYXRmb3JtX2dldF9kcnZkYXRhKHBkZXYpOworCisJ
cHdtY2hpcF9yZW1vdmUoY2hpcCk7CisJc3RtcGVfZGlzYWJsZShzdG1wZSwgU1RNUEVfQkxPQ0tf
UFdNKTsKK30KKworLyoKKyAqIHN0bXBlX3B3bV9yZW1vdmUoKSBsaXZlcyBpbiAuZXhpdC50ZXh0
LiBGb3IgZHJpdmVycyByZWdpc3RlcmVkIHZpYQorICogbW9kdWxlX3BsYXRmb3JtX2RyaXZlcl9w
cm9iZSgpIHRoaXMgaXMgb2sgYmVjYXVzZSB0aGV5IGNhbm5vdCBnZXQgdW5ib3VuZCBhdAorICog
cnVudGltZS4gU28gbWFyayB0aGUgZHJpdmVyIHN0cnVjdCB3aXRoIF9fcmVmZGF0YSB0byBwcmV2
ZW50IG1vZHBvc3QKKyAqIHRyaWdnZXJpbmcgYSBzZWN0aW9uIG1pc21hdGNoIHdhcm5pbmcuCisg
Ki8KLXN0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIHN0bXBlX3B3bV9kcml2ZXIgPSB7Citz
dGF0aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciBzdG1wZV9wd21fZHJpdmVyIF9fcmVmZGF0YSA9
IHsKIAkuZHJpdmVyID0gewogCQkubmFtZSA9ICJzdG1wZS1wd20iLAogCX0sCisJLnJlbW92ZSA9
IF9fZXhpdF9wKHN0bXBlX3B3bV9yZW1vdmUpLAogfTsKLWJ1aWx0aW5fcGxhdGZvcm1fZHJpdmVy
X3Byb2JlKHN0bXBlX3B3bV9kcml2ZXIsIHN0bXBlX3B3bV9wcm9iZSk7Cittb2R1bGVfcGxhdGZv
cm1fZHJpdmVyX3Byb2JlKHN0bXBlX3B3bV9kcml2ZXIsIHN0bXBlX3B3bV9wcm9iZSk7CisKK01P
RFVMRV9ERVNDUklQVElPTigiU1RNUEUgZXhwYW5kZXIgUFdNIik7CitNT0RVTEVfTElDRU5TRSgi
R1BMIik7CgpiYXNlLWNvbW1pdDogMjAxNGM5NWFmZWNlZTNlNzZjYTRhNTY5NTZhOTM2ZTIzMjgz
ZjA1YgotLSAKMi40Ny4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFp
bG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
