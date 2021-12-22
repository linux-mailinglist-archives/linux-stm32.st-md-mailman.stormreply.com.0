Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C070F47D034
	for <lists+linux-stm32@lfdr.de>; Wed, 22 Dec 2021 11:45:16 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 26486C5F1FB;
	Wed, 22 Dec 2021 10:45:16 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D7111C5F1F0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Dec 2021 09:06:02 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id s1so3460751wra.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Dec 2021 01:06:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2sH9LpoHKM1nYuCNdjrxssHqCL8Z5G+nLzADIXmtmn8=;
 b=UipR0N0vfloKnycnLvsHhkmUXID+a0gQSazt/YOOR2lytH2a1gIPVbSVGExE0igs+r
 jekZBCIM4ERZoOESF8YT+xqxsPxjJX6ao8gc3DLIgEz6u4VxUZKP/QWvVLh2/k1tTFVF
 RqZI7l0W9CaC7Is+KWojXzkwg6U0Zk4C0Swdg3QHsoP9hxcvBAG6FSDnmL+KljKT0Vhu
 utXR9E+GV0l9WHj+A+wj+gZz8oUo7US1imEVJt0zSOfEv8XdF9HYFeplt3JgJSXAOc13
 MQmKMU48hY+PocHZHlpYKnPWsE8PE0yiIUICdSV12SyCW2C+NB/bdWoMn+k6XUlky22m
 uEXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2sH9LpoHKM1nYuCNdjrxssHqCL8Z5G+nLzADIXmtmn8=;
 b=1Yl1n1GNJNZRZxC+WE2dBZLvrBuF+TiM/wieplcZ7noXdqFn6xoAbvWZl9vpweQwoN
 oZmw+c+36qdgPqvMUnpPg5Pm2nNJ0lnZ3Q0XrRVCfMMHpeZfOCEZ7a/apWopvats4O9s
 uX0Fc3jycybN+TI5ievlKdSNJGkHJs16nGLZcGjxiPYITTwevmoLXbJcnv21yNzmTvPU
 HK1ss6x+35C8aXKX7KS7m5TRQMRZG+rGQqr+6owLui3BgDZZTCeZriz+Ox2KgHgycAp8
 yK2NQnfY/FBjHdcwcAw95K77WFjs4+a3OLWi4OwXy6b6CfQBrRm/vH0Pv8mt79xYzScg
 o8fA==
X-Gm-Message-State: AOAM533qAzITGu9dwXxJPPjvNtb7ypj2Sl+WDsNjb19BYydNkSdqqBAU
 GMTBdjhOpOPS4vFucyZbuvM=
X-Google-Smtp-Source: ABdhPJw8+ku6Bbt0pa4KdLw4youWpS/O8Jg1GVf6A0XhbJGF74Z2ipnLZF9sGtjl6ocwS7qMUyGAzA==
X-Received: by 2002:adf:e0c8:: with SMTP id m8mr1505861wri.113.1640163962523; 
 Wed, 22 Dec 2021 01:06:02 -0800 (PST)
Received: from localhost.localdomain ([217.113.240.86])
 by smtp.gmail.com with ESMTPSA id a22sm1139775wme.19.2021.12.22.01.06.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Dec 2021 01:06:02 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: contact@emersion.fr
Date: Wed, 22 Dec 2021 10:05:50 +0100
Message-Id: <20211222090552.25972-5-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211222090552.25972-1-jose.exposito89@gmail.com>
References: <20211222090552.25972-1-jose.exposito89@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 22 Dec 2021 10:45:15 +0000
Cc: airlied@linux.ie, joonas.lahtinen@linux.intel.com,
 alexandre.torgue@foss.st.com, stefan@agner.ch, benjamin.gaignard@linaro.org,
 festevam@gmail.com, linux-stm32@st-md-mailman.stormreply.com, marex@denx.de,
 linux-imx@nxp.com, intel-gfx@lists.freedesktop.org, tzimmermann@suse.de,
 s.hauer@pengutronix.de, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 dri-devel@lists.freedesktop.org, rodrigo.vivi@intel.com, daniel@ffwll.ch,
 kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org,
 jani.nikula@linux.intel.com, yannick.fertre@foss.st.com,
 linux-kernel@vger.kernel.org, mcoquelin.stm32@gmail.com,
 dmitry.baryshkov@linaro.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 shawnguo@kernel.org
Subject: [Linux-stm32] [PATCH v2 4/6] drm/i915/display: Drop
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
