Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B33947F68F
	for <lists+linux-stm32@lfdr.de>; Sun, 26 Dec 2021 12:25:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 20130C5F1F0;
	Sun, 26 Dec 2021 11:25:22 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 11B8EC5F1F2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 26 Dec 2021 11:25:20 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id l4so7907157wmq.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 26 Dec 2021 03:25:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2sH9LpoHKM1nYuCNdjrxssHqCL8Z5G+nLzADIXmtmn8=;
 b=mAetoydiC9DFErqK91+G/B0kP4LJaIEX6wTtFjgxIx2puQBkWT35g7OEs0I6Wxm4eT
 DIS4O5D0u43xloptLbFpnamIbkbZp4QW1A5pN+Ad2pADFD6SEdOMQyLza03nFZ8lW8/3
 Eesto4lZJ3IicDl5rRiAAttyieCY8P8S5nM1MM/+1js3SzqevyK2awp22JsgoAOcP7eZ
 OptHCawHlqbW35aAG3+Wq4go/qCvwqqXt16SSXCJoYAnFMvUPqjB4E0JWPAhZRvtpJr8
 /sV2Bn9XrAl+tgezM0TeuEPuu3A4TNULvoMGSlh58yjiIkGU3uZ6N06sfsiT5q/eDeSa
 /v2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2sH9LpoHKM1nYuCNdjrxssHqCL8Z5G+nLzADIXmtmn8=;
 b=5QGzPUAbcqZBzGR4iCu19qDZ7mRqCgHmQ1K6BrNuGQjnwe+BWYnmnqw4EgwbhczSst
 eHAUkBe2v9Rd8hm7oTHpORX1pqZj/wz3rI+zUwR2PZo7871KExaAjl/CEbqxRZHPQYfY
 EPyEMzOOXz5SOBL49FDP8PMU2S87bDFmT/UrLQxu8mhTYvEG769hU085V/1cVIjvRstc
 Gf32Op1J2JqqzpaPfqsH7Pt7vEf++pb8w9Y2KKgB/edI7YszOEpKNnamLE3XC5+gHNUZ
 VrKyN3nqHhF52/4FwyMHrON9EK2xYnmcOssBePJ2A8+j32MTAInQrXvoAqPdkQvo34uW
 gUjw==
X-Gm-Message-State: AOAM530dQEx904Uie9RkfFkoIOJcf0I5qmzgBd8pgZy4RgGMHHxvRQkt
 7cQ0rU1D0p7YJQkC6OLmJ4I=
X-Google-Smtp-Source: ABdhPJz4lUyJV89AeASjgwh8PQuZGePew9x5IF62xdHwLSvNvHxbwPsKoabWCJpDvO3twBCqWu015Q==
X-Received: by 2002:a05:600c:3787:: with SMTP id
 o7mr10046954wmr.110.1640517919698; 
 Sun, 26 Dec 2021 03:25:19 -0800 (PST)
Received: from localhost.localdomain ([217.113.240.86])
 by smtp.gmail.com with ESMTPSA id g12sm13654743wrd.71.2021.12.26.03.25.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Dec 2021 03:25:19 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: contact@emersion.fr
Date: Sun, 26 Dec 2021 12:25:01 +0100
Message-Id: <20211226112503.31771-5-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211226112503.31771-1-jose.exposito89@gmail.com>
References: <20211226112503.31771-1-jose.exposito89@gmail.com>
MIME-Version: 1.0
Cc: airlied@linux.ie, joonas.lahtinen@linux.intel.com,
 alexandre.torgue@foss.st.com, stefan@agner.ch, benjamin.gaignard@linaro.org,
 festevam@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 ville.syrjala@linux.intel.com, marex@denx.de, linux-imx@nxp.com,
 intel-gfx@lists.freedesktop.org, daniel@ffwll.ch, s.hauer@pengutronix.de,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 jani.nikula@linux.intel.com, rodrigo.vivi@intel.com, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, yannick.fertre@foss.st.com, linux-kernel@vger.kernel.org,
 mcoquelin.stm32@gmail.com, dmitry.baryshkov@linaro.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 shawnguo@kernel.org
Subject: [Linux-stm32] [PATCH v3 4/6] drm/i915/display: Drop
	format_mod_supported function
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

VGhlICJkcm1fcGxhbmVfZnVuY3MuZm9ybWF0X21vZF9zdXBwb3J0ZWQiIGNhbiBiZSByZW1vdmVk
IGluIGZhdm9yIG9mCnRoZSBkZWZhdWx0IGltcGxlbWVudGF0aW9uLgoKU2lnbmVkLW9mZi1ieTog
Sm9zw6kgRXhww7NzaXRvIDxqb3NlLmV4cG9zaXRvODlAZ21haWwuY29tPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfY3Vyc29yLmMgfCA4IC0tLS0tLS0tCiAxIGZpbGUg
Y2hhbmdlZCwgOCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkx
NS9kaXNwbGF5L2ludGVsX2N1cnNvci5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9p
bnRlbF9jdXJzb3IuYwppbmRleCAxMTg0MmYyMTI2MTMuLjZhNWUwMjJmNWUyMSAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9jdXJzb3IuYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2N1cnNvci5jCkBAIC02MDIsMTMgKzYwMiw2
IEBAIHN0YXRpYyBib29sIGk5eHhfY3Vyc29yX2dldF9od19zdGF0ZShzdHJ1Y3QgaW50ZWxfcGxh
bmUgKnBsYW5lLAogCXJldHVybiByZXQ7CiB9CiAKLXN0YXRpYyBib29sIGludGVsX2N1cnNvcl9m
b3JtYXRfbW9kX3N1cHBvcnRlZChzdHJ1Y3QgZHJtX3BsYW5lICpfcGxhbmUsCi0JCQkJCSAgICAg
IHUzMiBmb3JtYXQsIHU2NCBtb2RpZmllcikKLXsKLQlyZXR1cm4gbW9kaWZpZXIgPT0gRFJNX0ZP
Uk1BVF9NT0RfTElORUFSICYmCi0JCWZvcm1hdCA9PSBEUk1fRk9STUFUX0FSR0I4ODg4OwotfQot
CiBzdGF0aWMgaW50CiBpbnRlbF9sZWdhY3lfY3Vyc29yX3VwZGF0ZShzdHJ1Y3QgZHJtX3BsYW5l
ICpfcGxhbmUsCiAJCQkgICBzdHJ1Y3QgZHJtX2NydGMgKl9jcnRjLApAQCAtNzQ1LDcgKzczOCw2
IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX3BsYW5lX2Z1bmNzIGludGVsX2N1cnNvcl9wbGFu
ZV9mdW5jcyA9IHsKIAkuZGVzdHJveSA9IGludGVsX3BsYW5lX2Rlc3Ryb3ksCiAJLmF0b21pY19k
dXBsaWNhdGVfc3RhdGUgPSBpbnRlbF9wbGFuZV9kdXBsaWNhdGVfc3RhdGUsCiAJLmF0b21pY19k
ZXN0cm95X3N0YXRlID0gaW50ZWxfcGxhbmVfZGVzdHJveV9zdGF0ZSwKLQkuZm9ybWF0X21vZF9z
dXBwb3J0ZWQgPSBpbnRlbF9jdXJzb3JfZm9ybWF0X21vZF9zdXBwb3J0ZWQsCiB9OwogCiBzdHJ1
Y3QgaW50ZWxfcGxhbmUgKgotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJA
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
