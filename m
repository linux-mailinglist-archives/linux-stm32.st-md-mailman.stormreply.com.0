Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D038F47D036
	for <lists+linux-stm32@lfdr.de>; Wed, 22 Dec 2021 11:45:16 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5EBE1C60461;
	Wed, 22 Dec 2021 10:45:16 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DC2E2C5F1EA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Dec 2021 09:06:05 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id d9so3580979wrb.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Dec 2021 01:06:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3w0cyRxbnflG1Lzaa+D9LFgBBXj2WLi8B2+0IaB0cco=;
 b=NEDNLzUZDalAufNqiXzyuBQjnHZxUNBoilJQwQfvSmQgK0oXmC8vKCNkZDGX7QCj8f
 xtZzyOs2a4ZO48mM3oad8CfwltMMFIcPiw9yaL8xg/9DpqRIV3FNDYB0GPJABPvceZxx
 kb+Svls2Iyso/lECdtqN+cvpmhawKQYVVZBpiMmFxjnQmU2NcVbyHJ7NupEKBwKFI3ho
 D613SYOBjc53L3M2O+EvZ0JjMLv4xGMQSBGRP/udeR4ro3C7u0wcSuBmhIeGYE9Ll4AG
 aluM0K2Z0cWEqEmiUFyd6NsKVRlaxKgjp7izy4Q/4SvDFUhBRVosqYT/SgjFJ8S7hF33
 7VHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3w0cyRxbnflG1Lzaa+D9LFgBBXj2WLi8B2+0IaB0cco=;
 b=k+CCSG2z1Kp3LAFrLJll0Q9uG81jNRinQAQ3UXTwzVziH6RVSleOaxyAwjwHyZg498
 wokTEDdVjnc53m2Q56CR8/9Se9J8GBB/6qOfQlrzFK3D789IYNvwlQJn+RvZXesDf9nV
 w+JQ2leuGIzBE6b5LQ4Ay2KMY39hQ22uREMG+FhLXGqDWD0U6HdSj6zR3TZRzfX1Gxul
 aQEXowRhkqHjQ8umwBQPX0XaEHW6aYJTr9PomY5AqwWrLy4XCY/LJ2+lOlxfWNThZjY8
 o8/uI+unjpj63L/or7zRrj8xMfSLC5x5bjcPsEbm3lrTkKJ7uHF5y85omKHx9FJJ4hza
 dEdw==
X-Gm-Message-State: AOAM533/5Ut+xzJzh6R+GhcToeQmZ1+1+cDzxj8/Jb0t4/8BXkfRv/Uq
 TAKzQZJfFIBmnqwKk7/Xuh0=
X-Google-Smtp-Source: ABdhPJwXgYqNw9Ycsv3CDZ5xTjRbry7kIK14E/x21CpPObe+VU0LvZpNi+zwa4CuFTHChyhAaxTF8Q==
X-Received: by 2002:a5d:51c9:: with SMTP id n9mr1419745wrv.694.1640163965465; 
 Wed, 22 Dec 2021 01:06:05 -0800 (PST)
Received: from localhost.localdomain ([217.113.240.86])
 by smtp.gmail.com with ESMTPSA id a22sm1139775wme.19.2021.12.22.01.06.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Dec 2021 01:06:05 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: contact@emersion.fr
Date: Wed, 22 Dec 2021 10:05:52 +0100
Message-Id: <20211222090552.25972-7-jose.exposito89@gmail.com>
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
Subject: [Linux-stm32] [PATCH v2 6/6] drm/stm: ltdc: Drop
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
Z3B1L2RybS9zdG0vbHRkYy5jIHwgMTEgLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMSBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vc3RtL2x0ZGMuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9zdG0vbHRkYy5jCmluZGV4IGRiZGVlOTU0NjkyYS4uZWY5MDllNTBmMGU0
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vc3RtL2x0ZGMuYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vc3RtL2x0ZGMuYwpAQCAtOTI1LDE2ICs5MjUsNiBAQCBzdGF0aWMgdm9pZCBsdGRjX3Bs
YW5lX2F0b21pY19wcmludF9zdGF0ZShzdHJ1Y3QgZHJtX3ByaW50ZXIgKnAsCiAJZnBzaS0+Y291
bnRlciA9IDA7CiB9CiAKLXN0YXRpYyBib29sIGx0ZGNfcGxhbmVfZm9ybWF0X21vZF9zdXBwb3J0
ZWQoc3RydWN0IGRybV9wbGFuZSAqcGxhbmUsCi0JCQkJCSAgICB1MzIgZm9ybWF0LAotCQkJCQkg
ICAgdTY0IG1vZGlmaWVyKQotewotCWlmIChtb2RpZmllciA9PSBEUk1fRk9STUFUX01PRF9MSU5F
QVIpCi0JCXJldHVybiB0cnVlOwotCi0JcmV0dXJuIGZhbHNlOwotfQotCiBzdGF0aWMgY29uc3Qg
c3RydWN0IGRybV9wbGFuZV9mdW5jcyBsdGRjX3BsYW5lX2Z1bmNzID0gewogCS51cGRhdGVfcGxh
bmUgPSBkcm1fYXRvbWljX2hlbHBlcl91cGRhdGVfcGxhbmUsCiAJLmRpc2FibGVfcGxhbmUgPSBk
cm1fYXRvbWljX2hlbHBlcl9kaXNhYmxlX3BsYW5lLApAQCAtOTQzLDcgKzkzMyw2IEBAIHN0YXRp
YyBjb25zdCBzdHJ1Y3QgZHJtX3BsYW5lX2Z1bmNzIGx0ZGNfcGxhbmVfZnVuY3MgPSB7CiAJLmF0
b21pY19kdXBsaWNhdGVfc3RhdGUgPSBkcm1fYXRvbWljX2hlbHBlcl9wbGFuZV9kdXBsaWNhdGVf
c3RhdGUsCiAJLmF0b21pY19kZXN0cm95X3N0YXRlID0gZHJtX2F0b21pY19oZWxwZXJfcGxhbmVf
ZGVzdHJveV9zdGF0ZSwKIAkuYXRvbWljX3ByaW50X3N0YXRlID0gbHRkY19wbGFuZV9hdG9taWNf
cHJpbnRfc3RhdGUsCi0JLmZvcm1hdF9tb2Rfc3VwcG9ydGVkID0gbHRkY19wbGFuZV9mb3JtYXRf
bW9kX3N1cHBvcnRlZCwKIH07CiAKIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX3BsYW5lX2hlbHBl
cl9mdW5jcyBsdGRjX3BsYW5lX2hlbHBlcl9mdW5jcyA9IHsKLS0gCjIuMjUuMQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGlu
ZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9z
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
