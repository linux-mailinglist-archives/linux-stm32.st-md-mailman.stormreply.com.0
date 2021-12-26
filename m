Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C68C47F690
	for <lists+linux-stm32@lfdr.de>; Sun, 26 Dec 2021 12:25:23 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 36E98C5F1F3;
	Sun, 26 Dec 2021 11:25:23 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 88752C5F1EE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 26 Dec 2021 11:25:21 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id j18so26538048wrd.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 26 Dec 2021 03:25:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3uC+zpueN0jaqztWM7eUqBfpEMbmsR8tb66iIJAnvGU=;
 b=RwDE0YPkDLqtqo7Dvnlm/ydiYanOQlnAMem2isy3ndgorcODT7JcvNFIyr443LTwSg
 WliRTsg8U5K6xpvrcgejsyGKhya4NPPV1Uea3wAuINZpe69Qi4Co3GCY8+RCvB5zICJN
 79sCOX7fKsf0zNbAvzhCEj30xYFAmhu4mxWkaRe0EvJkW/pW8fygcR8ybIZ/WTrgKhBW
 WcMktKG4ZIskNlW/H43GfZIK16XeZawEhw7iKEf6idJrc9oK20T4+HFBD3es+GpMVzr9
 czP8Xc5f78UoC+IsRP3PfKQz9Rc6Zl71pPJ9HwZfuNpEHKkQuf3Bn8gfrACtKdQA8/At
 oNXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3uC+zpueN0jaqztWM7eUqBfpEMbmsR8tb66iIJAnvGU=;
 b=tnLjWDEtM8OkE/gtALhqSsgEdSiJ+QVJXOkSup8YJbaBAB5+h/Pd790KJN1jE3Xuia
 S3AyT0CjTsV7DQgAGQFVEwbwduPGCWdAVm+ZR+G6s4Y8Z2XofJUizezcwpjAar2baFBz
 PnaR4Uty+FDj/JwdijhIaSf+VyNqemUMAWvXNOYUxk4yEmonlrJ0yr4CETfQppbkvJDf
 DFYQsCUm12VU+ibp0R9se2sBTIoIEjkFTQ85a1e3PdTQ4b/ucq7hOFHzpXOxFp4PMVIu
 eFrByPCd2fWM3oHTJLUnoTZyB8iOSkmYWHobyeoj81JiHlR0E5IxaZPdwCrVvvIcFVxA
 /ghg==
X-Gm-Message-State: AOAM532oFT6tvePgyFNbIq03pPwIzFq3Gcu/EdMOtQA8lb3JekMR3t4p
 NMMgV92mw5jM9U5ZVojORRY=
X-Google-Smtp-Source: ABdhPJwPiaAlI5ue8SBY/hNuXdX5I1LiZxPv2bA/DypMkY+1VW51yINEbKM/DxTgrTs1AI5TJvkxhw==
X-Received: by 2002:adf:9004:: with SMTP id h4mr9898117wrh.593.1640517921215; 
 Sun, 26 Dec 2021 03:25:21 -0800 (PST)
Received: from localhost.localdomain ([217.113.240.86])
 by smtp.gmail.com with ESMTPSA id g12sm13654743wrd.71.2021.12.26.03.25.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Dec 2021 03:25:20 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: contact@emersion.fr
Date: Sun, 26 Dec 2021 12:25:02 +0100
Message-Id: <20211226112503.31771-6-jose.exposito89@gmail.com>
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
Subject: [Linux-stm32] [PATCH v3 5/6] drm: mxsfb: Drop format_mod_supported
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
