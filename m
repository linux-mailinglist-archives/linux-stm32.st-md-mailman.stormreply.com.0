Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F0347F692
	for <lists+linux-stm32@lfdr.de>; Sun, 26 Dec 2021 12:25:24 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5A36BC5F1F0;
	Sun, 26 Dec 2021 11:25:24 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 50604C5F1F6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 26 Dec 2021 11:25:23 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id d9so26632244wrb.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 26 Dec 2021 03:25:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3w0cyRxbnflG1Lzaa+D9LFgBBXj2WLi8B2+0IaB0cco=;
 b=PwXLZV+6O9zswzpPoQeLANPNLyAa5j9TTefYDsBvxzJHw7hsiT7vgEJO67viIuaBiK
 joS9USvBHQU7W3SIlSlVlgL1mYDZ9GdAj6OOVHGzOLhwrXOtxouH24D1FvTOcNPBx1hu
 cgYJFZ0JNDK45DRlTqL7+hohi4LKCBmpHJMZ7FYsBeaLfb3+QvZpNbnybehWxIYzAW9A
 zIdhrscxtU7zpauASJezylBL9be5Gt7PrhZ4YGNwtTDe/dk3r/8eHOBjzyS88i2wv2vz
 I6dy2YgPWM+zzpAj2FRI6ftDhWK37okU082jWiQr1P8b2ZnvThZubK2qMqrpGqHTwjcb
 AcZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3w0cyRxbnflG1Lzaa+D9LFgBBXj2WLi8B2+0IaB0cco=;
 b=k9kRkubVORGq6NEDyFBn01Uhbb73jMRonccI1JSa4uU+6ndKAGYn+rCD4ic6b0B24J
 TUyixkaDQTRkZUcT9FIHLWOI0dnL6YSJgWWcVh1i3vcKFfrTdcAOYaeHZE5aqnt2CoH2
 T4eXX5kutC26iME3ScgedrBwmxS8hUP2yupHStcih0f3wv/WhhiyBOMMb8sMZ17IYDdv
 Oxa/vdyyN+dcCkdTiedfAJ9fQEiiPgmOe1DJuvUekGkY9vWhEMsnphZy8n8BJOaAZ7nv
 dLb3KnXFTCjD4liNxMqVcX0OwPeok7+xRzdGKMoHICU0rCAuCZkY2bLtNL+redeYfcHN
 LXyw==
X-Gm-Message-State: AOAM531QvJb5B3yh1QRb2cx9EMjrGurFfqPdAEiucGMld0T8YrakdK++
 LgtiJQtbQM1KPSxJyXFxRpI=
X-Google-Smtp-Source: ABdhPJyMMwBvN0I/TVcPJvi99lJUbcE0uky0CFSE//bOHq3fI8piG76lCpdID1rhkzRsL/yanK1mSw==
X-Received: by 2002:a5d:638b:: with SMTP id p11mr9352371wru.241.1640517922894; 
 Sun, 26 Dec 2021 03:25:22 -0800 (PST)
Received: from localhost.localdomain ([217.113.240.86])
 by smtp.gmail.com with ESMTPSA id g12sm13654743wrd.71.2021.12.26.03.25.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Dec 2021 03:25:22 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: contact@emersion.fr
Date: Sun, 26 Dec 2021 12:25:03 +0100
Message-Id: <20211226112503.31771-7-jose.exposito89@gmail.com>
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
Subject: [Linux-stm32] [PATCH v3 6/6] drm/stm: ltdc: Drop
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
