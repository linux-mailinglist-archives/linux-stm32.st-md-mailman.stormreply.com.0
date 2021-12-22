Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C417A47D035
	for <lists+linux-stm32@lfdr.de>; Wed, 22 Dec 2021 11:45:16 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3C8CAC5F1FE;
	Wed, 22 Dec 2021 10:45:16 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 66789C5F1EE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Dec 2021 09:06:04 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id b73so1120577wmd.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Dec 2021 01:06:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3uC+zpueN0jaqztWM7eUqBfpEMbmsR8tb66iIJAnvGU=;
 b=DN/hezu8BpvlioFiGvPzdpBnLgh7II07BN9W7INVCzSlG/W+L+9oRlBVBOiyDVwRzN
 BxgyMTO/wmtmvNY2yXs/gCKyTnr8BxUmdvjzLD3hV1ZGJ2BdB+8MLPEPziAae6wboQaN
 ct81mDMbeL8K1H6rjhaTxYKOMQmxKDQyYUYXFmLa6yleKnfY7pur/hrESfd4/7lXHtR0
 67vFJ1qpR18/R1lSFtZJYGFK26vg4J3pntLCw3ctkAYE+u2xLA95KJ0zfx6oMhr99A2L
 qFh4JurVj8/5urKMAIyJ7sljhjX2t06BNLt5+W0Mw36NQiXYgzUd/f17GYlA+Edw5nP8
 5XPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3uC+zpueN0jaqztWM7eUqBfpEMbmsR8tb66iIJAnvGU=;
 b=eU9o+XIa96VUefi9L4aFadUEAr8NhIWuxcWAzPgwMotoNxkj5kb9nBjxCNwaU8vkoV
 oM2LMttrxz87//whryWjev7hA1mPfdwf19s7aSHHKzKFawSdSdiEwC12AoZhflifJYq1
 sdFTbvx53XV/gnSOmT0NZlUNfOH8Z1/x+CpSnWLW3BwMM2P5KITg9JmJhETvCJjv9Qj+
 BQyBnrt2LbXkXbbZif9+ofkxtP+4Y+wPLc+gHyrk3bIhjWYkyzM6WrhYPpydVF5RQiX5
 RlAquit9fImavjUDic46YqMP0XfuIgdUHPgPxErtx2OnXHd0fNgxl24Op6wWQD1fasSy
 Kp2w==
X-Gm-Message-State: AOAM532hvNq7yFt0mFcjMJniqOHShLT5NFifGT5QBAU/rEyoy1sPggmb
 Qt00WH5a+A/cjhmFM4MrZd0=
X-Google-Smtp-Source: ABdhPJwjkqCU2eOiLPDiEpUgnr87YSHM9DTy3lNdv7hPr78L5Q1Nuo13SkbxfvjjlDc4nJ6/guabtA==
X-Received: by 2002:a05:600c:296:: with SMTP id 22mr208645wmk.11.1640163964078; 
 Wed, 22 Dec 2021 01:06:04 -0800 (PST)
Received: from localhost.localdomain ([217.113.240.86])
 by smtp.gmail.com with ESMTPSA id a22sm1139775wme.19.2021.12.22.01.06.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Dec 2021 01:06:03 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: contact@emersion.fr
Date: Wed, 22 Dec 2021 10:05:51 +0100
Message-Id: <20211222090552.25972-6-jose.exposito89@gmail.com>
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
Subject: [Linux-stm32] [PATCH v2 5/6] drm: mxsfb: Drop format_mod_supported
	function
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
Z3B1L2RybS9teHNmYi9teHNmYl9rbXMuYyB8IDggLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA4
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9teHNmYi9teHNmYl9r
bXMuYyBiL2RyaXZlcnMvZ3B1L2RybS9teHNmYi9teHNmYl9rbXMuYwppbmRleCAwNjU1NTgyYWU4
ZWQuLmRmMzJlMWMzY2M1ZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL214c2ZiL214c2Zi
X2ttcy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9teHNmYi9teHNmYl9rbXMuYwpAQCAtNTU0LDEz
ICs1NTQsNiBAQCBzdGF0aWMgdm9pZCBteHNmYl9wbGFuZV9vdmVybGF5X2F0b21pY191cGRhdGUo
c3RydWN0IGRybV9wbGFuZSAqcGxhbmUsCiAJd3JpdGVsKGN0cmwsIG14c2ZiLT5iYXNlICsgTENE
Q19BU19DVFJMKTsKIH0KIAotc3RhdGljIGJvb2wgbXhzZmJfZm9ybWF0X21vZF9zdXBwb3J0ZWQo
c3RydWN0IGRybV9wbGFuZSAqcGxhbmUsCi0JCQkJICAgICAgIHVpbnQzMl90IGZvcm1hdCwKLQkJ
CQkgICAgICAgdWludDY0X3QgbW9kaWZpZXIpCi17Ci0JcmV0dXJuIG1vZGlmaWVyID09IERSTV9G
T1JNQVRfTU9EX0xJTkVBUjsKLX0KLQogc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fcGxhbmVfaGVs
cGVyX2Z1bmNzIG14c2ZiX3BsYW5lX3ByaW1hcnlfaGVscGVyX2Z1bmNzID0gewogCS5hdG9taWNf
Y2hlY2sgPSBteHNmYl9wbGFuZV9hdG9taWNfY2hlY2ssCiAJLmF0b21pY191cGRhdGUgPSBteHNm
Yl9wbGFuZV9wcmltYXJ5X2F0b21pY191cGRhdGUsCkBAIC01NzIsNyArNTY1LDYgQEAgc3RhdGlj
IGNvbnN0IHN0cnVjdCBkcm1fcGxhbmVfaGVscGVyX2Z1bmNzIG14c2ZiX3BsYW5lX292ZXJsYXlf
aGVscGVyX2Z1bmNzID0gewogfTsKIAogc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fcGxhbmVfZnVu
Y3MgbXhzZmJfcGxhbmVfZnVuY3MgPSB7Ci0JLmZvcm1hdF9tb2Rfc3VwcG9ydGVkCT0gbXhzZmJf
Zm9ybWF0X21vZF9zdXBwb3J0ZWQsCiAJLnVwZGF0ZV9wbGFuZQkJPSBkcm1fYXRvbWljX2hlbHBl
cl91cGRhdGVfcGxhbmUsCiAJLmRpc2FibGVfcGxhbmUJCT0gZHJtX2F0b21pY19oZWxwZXJfZGlz
YWJsZV9wbGFuZSwKIAkuZGVzdHJveQkJPSBkcm1fcGxhbmVfY2xlYW51cCwKLS0gCjIuMjUuMQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3Rt
MzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20K
aHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtc3RtMzIK
