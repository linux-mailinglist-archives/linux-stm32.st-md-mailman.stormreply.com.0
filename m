Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4446A47F68E
	for <lists+linux-stm32@lfdr.de>; Sun, 26 Dec 2021 12:25:20 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 06F19C5F1F1;
	Sun, 26 Dec 2021 11:25:20 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 82FA3C5EC47
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 26 Dec 2021 11:25:18 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id i22so26451173wrb.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 26 Dec 2021 03:25:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=udzgSr2XOO8m43wZrlgxQCrOrIrYf8SlPUnoZjFzTYk=;
 b=aCJzevHTBUPOKcQPw7hm+UB6JT/t1Fj3BW8O/jb392wnD0zkTkz+ZRTgelV2Yqg4MX
 W56GKzMk7Dzv9jaWuj28ZGU0lVkjYx9uNQh/0FadJ8JoyS4D8EWW4CIAYW1tl0U9P7Lu
 lOPPBpLonGHs296MrSx6PHecvp6ye/GIP5RQ4mgs54meCrWhzDzzmfoqLTwl5T4r5ib9
 Pu/3qMSp+gxIEeM+eE+BXjRwq2tGWwY7trJ/lA3Gq2QHZqATUNoI4JMtTWT95wDJflmL
 miGdPBFBHeeWcNJEd7MBupYAO07XGQ5e+OUbtSazNCYnC5IefApuP8gZt5MQQnVdZSo+
 V4aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=udzgSr2XOO8m43wZrlgxQCrOrIrYf8SlPUnoZjFzTYk=;
 b=o6siQQnSI/G/KRPOEX7IS4Fdo0enOShbsg1j3nsSvGtGpmkVezy/XGx0wR8UoZVB9V
 tZ8wD5YSGVoyFxtqOiJY2NqbTKqS/Wn21SEGbPWNgX3/WTEWhOZ4RsEuW65zb0uaOW2u
 rL42ZzMktjP/pQwA19kQsDNUgQEJfm+vZL8Cd46ndVQbVbc4OiKNjWgtaGXEUR3LnvJK
 RdrdgQh02x5E8Vk37T1OAEYRhZxl9RsR6OOtlUiwmWnty5c5TchV3Jk0h7Uu+my0Qh9n
 B7cP/cLORYQwdvXQYdksDdVPBg68a8dwn0rTN2W/OkY+En6dUrkbEXdj2aDmtsKJ7U54
 7f8Q==
X-Gm-Message-State: AOAM531YKe/tvEJcZUXSUXg/70K8BeDDIoCPqhfWxTiyiY8dS8h4YrpW
 Mqq0UTfYttZW5ZTxQOrgJoE=
X-Google-Smtp-Source: ABdhPJxUGkExUZ7jGhhIux0K+s4/ECaFhn9zxSixHZY9ABIuQhk4H3r2v0oZ1KM30IAWTvYNQ1yqjg==
X-Received: by 2002:a05:6000:1845:: with SMTP id
 c5mr9492151wri.499.1640517918125; 
 Sun, 26 Dec 2021 03:25:18 -0800 (PST)
Received: from localhost.localdomain ([217.113.240.86])
 by smtp.gmail.com with ESMTPSA id g12sm13654743wrd.71.2021.12.26.03.25.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Dec 2021 03:25:17 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: contact@emersion.fr
Date: Sun, 26 Dec 2021 12:25:00 +0100
Message-Id: <20211226112503.31771-4-jose.exposito89@gmail.com>
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
Subject: [Linux-stm32] [PATCH v3 3/6] drm/simple-kms: Drop
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
Z3B1L2RybS9kcm1fc2ltcGxlX2ttc19oZWxwZXIuYyB8IDggLS0tLS0tLS0KIDEgZmlsZSBjaGFu
Z2VkLCA4IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fc2lt
cGxlX2ttc19oZWxwZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fc2ltcGxlX2ttc19oZWxwZXIu
YwppbmRleCA3Mjk4OWVkMWJhYmEuLjJjNmFhNjdjNjk1NiAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2RybV9zaW1wbGVfa21zX2hlbHBlci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1f
c2ltcGxlX2ttc19oZWxwZXIuYwpAQCAtMjg0LDEzICsyODQsNiBAQCBzdGF0aWMgdm9pZCBkcm1f
c2ltcGxlX2ttc19wbGFuZV9jbGVhbnVwX2ZiKHN0cnVjdCBkcm1fcGxhbmUgKnBsYW5lLAogCXBp
cGUtPmZ1bmNzLT5jbGVhbnVwX2ZiKHBpcGUsIHN0YXRlKTsKIH0KIAotc3RhdGljIGJvb2wgZHJt
X3NpbXBsZV9rbXNfZm9ybWF0X21vZF9zdXBwb3J0ZWQoc3RydWN0IGRybV9wbGFuZSAqcGxhbmUs
Ci0JCQkJCQl1aW50MzJfdCBmb3JtYXQsCi0JCQkJCQl1aW50NjRfdCBtb2RpZmllcikKLXsKLQly
ZXR1cm4gbW9kaWZpZXIgPT0gRFJNX0ZPUk1BVF9NT0RfTElORUFSOwotfQotCiBzdGF0aWMgY29u
c3Qgc3RydWN0IGRybV9wbGFuZV9oZWxwZXJfZnVuY3MgZHJtX3NpbXBsZV9rbXNfcGxhbmVfaGVs
cGVyX2Z1bmNzID0gewogCS5wcmVwYXJlX2ZiID0gZHJtX3NpbXBsZV9rbXNfcGxhbmVfcHJlcGFy
ZV9mYiwKIAkuY2xlYW51cF9mYiA9IGRybV9zaW1wbGVfa21zX3BsYW5lX2NsZWFudXBfZmIsCkBA
IC0zMzksNyArMzMyLDYgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fcGxhbmVfZnVuY3MgZHJt
X3NpbXBsZV9rbXNfcGxhbmVfZnVuY3MgPSB7CiAJLnJlc2V0CQkJPSBkcm1fc2ltcGxlX2ttc19w
bGFuZV9yZXNldCwKIAkuYXRvbWljX2R1cGxpY2F0ZV9zdGF0ZQk9IGRybV9zaW1wbGVfa21zX3Bs
YW5lX2R1cGxpY2F0ZV9zdGF0ZSwKIAkuYXRvbWljX2Rlc3Ryb3lfc3RhdGUJPSBkcm1fc2ltcGxl
X2ttc19wbGFuZV9kZXN0cm95X3N0YXRlLAotCS5mb3JtYXRfbW9kX3N1cHBvcnRlZCAgID0gZHJt
X3NpbXBsZV9rbXNfZm9ybWF0X21vZF9zdXBwb3J0ZWQsCiB9OwogCiAvKioKLS0gCjIuMjUuMQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3Rt
MzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20K
aHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtc3RtMzIK
