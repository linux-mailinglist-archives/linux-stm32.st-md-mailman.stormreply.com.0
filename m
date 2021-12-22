Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BF3E547D033
	for <lists+linux-stm32@lfdr.de>; Wed, 22 Dec 2021 11:45:16 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 11FFBC5F1F7;
	Wed, 22 Dec 2021 10:45:16 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5CD55C5F1EE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Dec 2021 09:06:01 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id g132so1096652wmg.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Dec 2021 01:06:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=udzgSr2XOO8m43wZrlgxQCrOrIrYf8SlPUnoZjFzTYk=;
 b=E3MxQbgD6jp8QTL0eeprZVCT29X4TsAZ9rSxABqoJKJws7UxtL3y3Rb2aRJp575Ctn
 hesvkKOolE8pblgflzdy9N9arwD4TLsVdHjcz4j1NzcMqlx9cge1sYvwMWt+PDGrEnZv
 Y5i0OTQsxOJNGvY9tnt72sq1D1nlChs/Dlk7DLlupN28xGHToNFRR3dsa0SwxLOuKQbY
 5utUtrQy+t8z0vA8wy2xlzgyZq7k4kWhzakGbvKVtthnxoUy3g+/ce/GXp3eUfCWGNTv
 3YHSQ7vjPxoH+APQRxDnNB3K64KnRQzbtCWTUulgJeyw5GEOzsGQN3ujO/QZQbujfoWg
 PFhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=udzgSr2XOO8m43wZrlgxQCrOrIrYf8SlPUnoZjFzTYk=;
 b=VQ2yrN1LqFHPbk5xRIc39joc4b0JqtKxhRbA48+SBWxPAkyfCeGOs885yelHHt3JpZ
 +axss1sylurGIlN16NLbINyjd83vNubGBma9v8EvtxQtr0vGPdSTR/zEezzpOoCTjm+i
 gR+lfWxB/hrSHNeS2f7G5MMW/CYxp3Rsdr+sdUn1VB8IUqwW71herdM9LPNJLIUM2s1z
 up+P3BPeE5gGDAMfD8Aygc6qclkFm2Qyxk8oDq21La0flw9yyFuTE2+D+qwn1Aw7om84
 p4WC4fFf1sISSh+ota2hr+5IcfSvrLJMjRnlu14kD9ISNd/4KTs/qccDsbZQOTzSxoqm
 w7WQ==
X-Gm-Message-State: AOAM532PNdjemSxgNQRn0ax5GQvIhXOsbbT6/PWZcyfDwYd8hdYG03VB
 OjV4naOdnsZyseq6nCRTRF8=
X-Google-Smtp-Source: ABdhPJyucSE6tLj1nZatpMDhi96s0rRJ4voGBbwV+cnaaT+IgfOg7RVHe2BjZm9f/hkIq7HlprLhNQ==
X-Received: by 2002:a1c:440a:: with SMTP id r10mr226427wma.4.1640163961031;
 Wed, 22 Dec 2021 01:06:01 -0800 (PST)
Received: from localhost.localdomain ([217.113.240.86])
 by smtp.gmail.com with ESMTPSA id a22sm1139775wme.19.2021.12.22.01.05.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Dec 2021 01:06:00 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: contact@emersion.fr
Date: Wed, 22 Dec 2021 10:05:49 +0100
Message-Id: <20211222090552.25972-4-jose.exposito89@gmail.com>
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
Subject: [Linux-stm32] [PATCH v2 3/6] drm/simple-kms: Drop
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
