Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C068290E7F3
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Jun 2024 12:12:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 70BBFC78014;
	Wed, 19 Jun 2024 10:12:15 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B0B36C78013
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Jun 2024 10:12:14 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-a6ef8bf500dso727469166b.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Jun 2024 03:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718791933; x=1719396733;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Qi4aJYEUuIQ/V13fBIYhBcSSVZbkz2WHC3xkADAjAwY=;
 b=NG+J2Zlz0VcGkD6XUy5Zgy/jcd5knlkqCRkEvhm9eK4ATMn2kRKlNLKZiXx8b4itdQ
 kors4VO1yO/ZTL8n+IcLZ7RtqLdlNhhdEI5equk59PclDIKpCZpwajep4I6EAtSHSZNz
 Zh9GDD4hN+TTX6QapPq2zy52IicGSnDn7JEQL0fD/atGLdPNACgKB7a1B6aRmLHVRj16
 x+1rA74GgvdzahgkuHNB7En/tOCJu25eJa6ZLlkRAOWk+djxB3wOQXX0dpE4SWkhGVJS
 7mT2oYRXJioa7bCFZVEu2DXCkBNdxfJKF9mF3bYTVCqQaTXUpxhoZ7KqprQCGxIoLSal
 l6mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718791933; x=1719396733;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Qi4aJYEUuIQ/V13fBIYhBcSSVZbkz2WHC3xkADAjAwY=;
 b=B2p3EUI7XCPoOfqU6HTGNkl6JsHXgGroC2sEnJ5ppJtpKQ61ntUDsgTunLOP0Hw5GH
 fzZBdhiuMhPiGrQ5Q0mIVh4iFJglw71u/sHuN6BJ3CdoC6V/Ooxxg3DhaS+m6kepfNCG
 nMnBzHUeRcGVs9bJZ1QX2RHUP7nlgt1IJZqi4OvI/HLkY0N/GMB0rSDAX/BwTdZjK4GC
 KwABHg5Pu9Ra4h2zGpHBM0BlDZKyk3g9KBp0POzUoxaF7pmFRzVqwjo146BOy2fEE9BH
 LfdzLincS+Wd6wBDsrM+EiIQDGoAb2yURwXAO8dWHuHL97QTT7FDeb4ZIK+4fQRQ0uzf
 ephA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWP/BuaNc3vQ6X5YICpNRlplenAp/7VQdyQdTaxblEYTb44bMwkP57fFLkz3Mplfx1/Oy5LExy8ggvak8+D1FXf4y8xtMIYcVGO1djm9ZxBVbkfK9D3eVkW
X-Gm-Message-State: AOJu0YwzmM9ApybvgXvq9VCnanUMRP5Z/gt8Vg+9AXRXZPf86/74WdBZ
 z37iGbXYek7Wdok78JOGI49/6K4RoZHAKd5aGdIB+45DIjrgJ3kynwHpYx4vzis=
X-Google-Smtp-Source: AGHT+IEvkBeb1adtQps5uR2c9XR/Xi41EP+Gxj4qPXO+OoA/UyIlWg8yqWZ8kfEL9FPggix9HVnzKw==
X-Received: by 2002:a17:907:1682:b0:a6f:98b6:36e with SMTP id
 a640c23a62f3a-a6fab605048mr169655966b.11.1718791933291; 
 Wed, 19 Jun 2024 03:12:13 -0700 (PDT)
Received: from localhost (p509153eb.dip0.t-ipconnect.de. [80.145.83.235])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-363a23143dfsm1168204f8f.87.2024.06.19.03.12.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jun 2024 03:12:13 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 William Breathitt Gray <wbg@kernel.org>, Lee Jones <lee@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Wed, 19 Jun 2024 12:11:45 +0200
Message-ID: <6c8fcc4ed159992a1dbb0796087e6ceb10c39c96.1718791090.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1718791090.git.u.kleine-koenig@baylibre.com>
References: <cover.1718791090.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1147;
 i=u.kleine-koenig@baylibre.com; h=from:subject:message-id;
 bh=zia9ohJCDf6pPTMCj3l2MlOJgs40Pm2zXv4CKnsKZ4Y=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBmcq7oy8mveEdP8uq3o2jBR0yAiv7fDFKSJltQ4
 YkOueb1NN2JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZnKu6AAKCRCPgPtYfRL+
 TrX5B/0USVLFzo4MlcaT5z91XGN6knZpVjFtzoHUM0al+H/HJnjOPt2QItflEUYgFAJQzvuiGBb
 AZhX+KiO1s5etz6fLwixuy9K3rJ1JXcuBQ5FRDBf3PsZHXNKY3Htb4q3VYI34xmH8S8gLwCMk27
 DoObyZ4OWbW++D14JjTSStR8wGDREHItW8erobR0HABTTDcP9K8n+HqNXDPyvgReo1fB+VlDwr/
 IBtUTkomTjRAmLKMk0kQz6IzO6UmIpQC3VRx/R4fVBWGsq+gypGxPqP8kyoDhONcuf/bPJTt6C7
 0rKidDi+2qnuyqmHz9QOjbqCFPs74jFe1MNyOrRuKdTNk/s8
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Cc: linux-pwm@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, Thorsten Scherer <T.Scherer@eckelmann.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 4/5] mfd: stm32-timers: Drop unused
	TIM_DIER_CC_IE
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

VGhpcyBtYWNybyBpcyBtaXNsZWFkaW5nIGFzCgoJVElNX0RJRVJfQ0NfSUUoMSkgPT0gVElNX0RJ
RVJfQ0MySUUKCi4gVGhlIG9ubHkgdXNlciB3YXMgdXBkYXRlZCB0byB1c2UgVElNX0RJRVJfQ0N4
SUUoKSBpbnN0ZWFkIHdoaWNoCmRvZXNuJ3Qgc3VmZmVyIGZyb20gdGhpcyBtaXNtYXRjaCwgc28g
VElNX0RJRVJfQ0NfSUUgY2FuIGJlIGRyb3BwZWQuCgpTaWduZWQtb2ZmLWJ5OiBVd2UgS2xlaW5l
LUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQGJheWxpYnJlLmNvbT4KLS0tCiBpbmNsdWRlL2xpbnV4
L21mZC9zdG0zMi10aW1lcnMuaCB8IDEgLQogMSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRpb24oLSkK
CmRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L21mZC9zdG0zMi10aW1lcnMuaCBiL2luY2x1ZGUv
bGludXgvbWZkL3N0bTMyLXRpbWVycy5oCmluZGV4IDkyYjQ1YTU1OTY1Ni4uZjA5YmE1OThjOTdh
IDEwMDY0NAotLS0gYS9pbmNsdWRlL2xpbnV4L21mZC9zdG0zMi10aW1lcnMuaAorKysgYi9pbmNs
dWRlL2xpbnV4L21mZC9zdG0zMi10aW1lcnMuaApAQCAtNDcsNyArNDcsNiBAQAogI2RlZmluZSBU
SU1fRElFUl9DQzJJRQkJVElNX0RJRVJfQ0N4SUUoMikJCQkvKiBDQzIgSW50ZXJydXB0IEVuYWJs
ZQkJCQkqLwogI2RlZmluZSBUSU1fRElFUl9DQzNJRQkJVElNX0RJRVJfQ0N4SUUoMykJCQkvKiBD
QzMgSW50ZXJydXB0IEVuYWJsZQkJCQkqLwogI2RlZmluZSBUSU1fRElFUl9DQzRJRQkJVElNX0RJ
RVJfQ0N4SUUoNCkJCQkvKiBDQzQgSW50ZXJydXB0IEVuYWJsZQkJCQkqLwotI2RlZmluZSBUSU1f
RElFUl9DQ19JRSh4KQlCSVQoKHgpICsgMSkJCQkJLyogQ0MxLCBDQzIsIENDMywgQ0M0IGludGVy
cnVwdCBlbmFibGUJCSovCiAjZGVmaW5lIFRJTV9ESUVSX1VERQkJQklUKDgpCQkJCQkvKiBVcGRh
dGUgRE1BIHJlcXVlc3QgRW5hYmxlCQkJKi8KICNkZWZpbmUgVElNX0RJRVJfQ0N4REUoeCkJQklU
KDkgKyAoKHgpIC0gMSkpCQkJLyogQ0N4IERNQSByZXF1ZXN0IEVuYWJsZSAoeCDiiIggezEsIC4u
IDR9KQkqLwogI2RlZmluZSBUSU1fRElFUl9DQzFERQkJVElNX0RJRVJfQ0N4REUoMSkJCQkvKiBD
QzEgRE1BIHJlcXVlc3QgRW5hYmxlCQkJKi8KLS0gCjIuNDMuMAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0Ckxp
bnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
