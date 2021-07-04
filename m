Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD013BAD45
	for <lists+linux-stm32@lfdr.de>; Sun,  4 Jul 2021 15:59:35 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2D24EC57B53;
	Sun,  4 Jul 2021 13:59:35 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ED316C424BD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  4 Jul 2021 13:59:31 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id i13so8590713plb.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 04 Jul 2021 06:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vZchmjbZcuG8d79fGOuJrTm3zKZcJ0x4q/PTaiXaZWo=;
 b=WQmWODfaTpdwEd7USiDiriTpaY76zXQhP0ffAl16+LJ4j8HIgjGmJghZkHu1DWawvc
 nl7cs7+rF1LhOZdVrrWyxJKVA+LEbHHN/r1WyUjBpYBGqRmkMc5yqPYUTRWu1CtSDzkU
 MfR0RVFUlLLgROhfe2A+zMhqo2glKxYpGEQoE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vZchmjbZcuG8d79fGOuJrTm3zKZcJ0x4q/PTaiXaZWo=;
 b=o7jnZ4/X29s0EVDXe7F6uHfJgvLO9HcOoPZMlOPu0mJqv+rK6NnzOzLo2HYtng/KW7
 u4isGhKqaZz2Wdp7WEB4uCyx6+UmEbIrvTUj1oBJQ7Dr5efdarMF2S6J0jLAOwm8Grsc
 ylrLoQlA2UaxtImrJifIkUK7yrKDF6G643x3DbtV2C0XzCuaJYv+5cJZD0UC5ZSjwTAz
 SXtS2OeKIBv/eMcgO0ewArGgKaPZL+sqDcmd1VHjMWV98dLPgKYOzvYuQNb84qFNXeTK
 fCMVPU4jjzr83q972tMwhixaiwKPB/yVVo2LAqPrUjSuQenc8O8zcAb8iubt9O5YIZJ/
 0Eew==
X-Gm-Message-State: AOAM531meBovoaLC8FXIC1CRfBiqmDh+uEXe9Kl8Nsl1FDwUAAi2ohqj
 4EvtNooeORLZf912Px5HeU84hA==
X-Google-Smtp-Source: ABdhPJxVPwt4Nb6yxv4YmtH20r1DKBZ1WMc9WPqPhleaq0VHERawfSzARi/+Gq7kPy5Z6bh6THv/mQ==
X-Received: by 2002:a17:90a:c916:: with SMTP id
 v22mr9950407pjt.47.1625407170239; 
 Sun, 04 Jul 2021 06:59:30 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a884:1ae9:772f:6f0f:3e24])
 by smtp.gmail.com with ESMTPSA id r29sm8387993pfq.177.2021.07.04.06.59.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Jul 2021 06:59:29 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Yannick Fertre <yannick.fertre@foss.st.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>
Date: Sun,  4 Jul 2021 19:29:14 +0530
Message-Id: <20210704135914.268308-1-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: linux-arm-kernel@lists.infradead.org, linux-amarula@amarulasolutions.com,
 linux-stm32@st-md-mailman.stormreply.com, dri-devel@lists.freedesktop.org,
 Jagan Teki <jagan@amarulasolutions.com>
Subject: [Linux-stm32] [PATCH] drm/stm: ltdc: Silence -EPROBE_DEFER till
	bridge attached
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

QXMgZHctbWlwaS1kc2kgc3VwcG9ydGVkIGFsbCBwb3NzaWJsZSB3YXlzIHRvIGZpbmQgdGhlIERT
SQpkZXZpY2VzLiBJdCBjYW4gdGFrZSBtdWx0aXBsZSBpdGVyYXRpb25zIGZvciBsdGRjIHRvIGZp
bmQKYWxsIGNvbXBvbmVudHMgYXR0YWNoZWQgdG8gdGhlIERTSSBicmlkZ2UuCgpUaGUgY3VycmVu
dCBsdGRjIGRyaXZlciBmYWlsZWQgdG8gZmluZCB0aGUgZW5kcG9pbnQgYXMKaXQgcmV0dXJuZWQg
LUVJTlZBTCBmb3IgdGhlIGZpcnN0IGl0ZXJhdGlvbiBpdHNlbGYuIFRoaXMgbGVhZHMKdG8gZm9s
bG93aW5nIGVycm9yOgoKWyDCoCDCoDMuMDk5Mjg5XSBbZHJtOmx0ZGNfbG9hZF0gKkVSUk9SKiBp
bml0IGVuY29kZXIgZW5kcG9pbnQgMAoKU28sIGNoZWNrIHRoZSByZXR1cm4gdmFsdWUgYW5kIGNs
ZWFudXAgdGhlIGVuY29kZXIgb25seSBpZiBpdCdzCm5vdCAtRVBST0JFX0RFRkVSLiBUaGlzIG1h
a2UgYWxsIGNvbXBvbmVudHMgaW4gdGhlIGF0dGFjaGVkIERTSQpicmlkZ2UgZm91bmQgcHJvcGVy
bHkuCgpTaWduZWQtb2ZmLWJ5OiBKYWdhbiBUZWtpIDxqYWdhbkBhbWFydWxhc29sdXRpb25zLmNv
bT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vc3RtL2x0ZGMuYyB8IDggKysrKystLS0KIDEgZmlsZSBj
aGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL3N0bS9sdGRjLmMgYi9kcml2ZXJzL2dwdS9kcm0vc3RtL2x0ZGMuYwppbmRl
eCAwOGI3MTI0ODA0NGQuLjk1ZTk4M2QzZmZiNSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L3N0bS9sdGRjLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3N0bS9sdGRjLmMKQEAgLTExMjIsOCAr
MTEyMiw5IEBAIHN0YXRpYyBpbnQgbHRkY19lbmNvZGVyX2luaXQoc3RydWN0IGRybV9kZXZpY2Ug
KmRkZXYsIHN0cnVjdCBkcm1fYnJpZGdlICpicmlkZ2UpCiAKIAlyZXQgPSBkcm1fYnJpZGdlX2F0
dGFjaChlbmNvZGVyLCBicmlkZ2UsIE5VTEwsIDApOwogCWlmIChyZXQpIHsKLQkJZHJtX2VuY29k
ZXJfY2xlYW51cChlbmNvZGVyKTsKLQkJcmV0dXJuIC1FSU5WQUw7CisJCWlmIChyZXQgIT0gLUVQ
Uk9CRV9ERUZFUikKKwkJCWRybV9lbmNvZGVyX2NsZWFudXAoZW5jb2Rlcik7CisJCXJldHVybiBy
ZXQ7CiAJfQogCiAJRFJNX0RFQlVHX0RSSVZFUigiQnJpZGdlIGVuY29kZXI6JWQgY3JlYXRlZFxu
IiwgZW5jb2Rlci0+YmFzZS5pZCk7CkBAIC0xMjY2LDcgKzEyNjcsOCBAQCBpbnQgbHRkY19sb2Fk
KHN0cnVjdCBkcm1fZGV2aWNlICpkZGV2KQogCQlpZiAoYnJpZGdlKSB7CiAJCQlyZXQgPSBsdGRj
X2VuY29kZXJfaW5pdChkZGV2LCBicmlkZ2UpOwogCQkJaWYgKHJldCkgewotCQkJCURSTV9FUlJP
UigiaW5pdCBlbmNvZGVyIGVuZHBvaW50ICVkXG4iLCBpKTsKKwkJCQlpZiAocmV0ICE9IC1FUFJP
QkVfREVGRVIpCisJCQkJCURSTV9FUlJPUigiaW5pdCBlbmNvZGVyIGVuZHBvaW50ICVkXG4iLCBp
KTsKIAkJCQlnb3RvIGVycjsKIAkJCX0KIAkJfQotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QK
TGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
