Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2775047F68B
	for <lists+linux-stm32@lfdr.de>; Sun, 26 Dec 2021 12:25:17 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E1919C5EC47;
	Sun, 26 Dec 2021 11:25:16 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 63E76C5EC47
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 26 Dec 2021 11:25:15 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 d198-20020a1c1dcf000000b0034569cdd2a2so6942843wmd.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 26 Dec 2021 03:25:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9LTDPcsLit3ZltGpmydxyhDaBvNBfOjBIIApsVidYlU=;
 b=ejlSnBRYPWQDz4Nz+pf/Ob69zbAjcqMfijxXsTWcXhySEQRzUT3JCExyZ5Q1SIvA3c
 kQEyhuRzvpXKwr0S+/rKlCIT/w8ncJ+aQzdm7jpMBRPCQQr/da5ZGlqL/VYyn43hxxCv
 CHtfylV68MCTsg4AhrkoS7zKdwb4IMm7OEpKDU3FaIoEA3fCSGm4fcRNK4c54Tcqvr6/
 zq9E1bBZJSI6Mp+0nnb2zUxeSOTTcaPXWRQkOYUc5TBf57vUoysacqIO7xX3ytpTmfP5
 OepQvrBjQUOgumuDejvOFTQ3kmvegmDblhp3SxIv7Bir6Vv/VhSt9Mkh5t4Y/gKXUW3F
 iQmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9LTDPcsLit3ZltGpmydxyhDaBvNBfOjBIIApsVidYlU=;
 b=i/hKRpakXbmq6VYnICcHv8CNk6OtROknaztSzrbe0SOcywuFQYo+AZrHNcTwnLAr+s
 JmUXB5mNX0dPI9aeY8m2wp4VA3ABfeZyxp8al86n/VZ/xiX7FhEwMN7K3IHluccExEU6
 fVi9JnJbZb1MZVRpValwbfKnkWIZ0sg50R7lSHQH25bb0v4Uo3aPhidMcsOsBmegBOfv
 cBQn+kIdIuBzBUjHzOitkpp7uYm3oSoEU5/1+4szXAgR0uc8wny20M6f+wrDl+a9J6V8
 DvDiip7MPDRgVY6kKL9W1JbFnRc7TYQ2bCxezSrDtpl1gUL7wsKEvQAR19JitaX5yt2Y
 QUxQ==
X-Gm-Message-State: AOAM532urdSMwQ/JJ2T6eu8U7qCCZKl3ZJuLbcAN/depsIzlJGojE646
 CbZBFyqHVHnYB6pZ5RRzzyE=
X-Google-Smtp-Source: ABdhPJxzOeTdg3Sm90f1frrXzLRCNKL4Q9YDL0ikNej0GhBsklk2qdNprmmmNirl5P7CW0Jv6ObHPQ==
X-Received: by 2002:a05:600c:209:: with SMTP id
 9mr10183053wmi.145.1640517915050; 
 Sun, 26 Dec 2021 03:25:15 -0800 (PST)
Received: from localhost.localdomain ([217.113.240.86])
 by smtp.gmail.com with ESMTPSA id g12sm13654743wrd.71.2021.12.26.03.25.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Dec 2021 03:25:14 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: contact@emersion.fr
Date: Sun, 26 Dec 2021 12:24:58 +0100
Message-Id: <20211226112503.31771-2-jose.exposito89@gmail.com>
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
Subject: [Linux-stm32] =?utf-8?q?=5BPATCH_v3_1/6=5D_drm/plane=3A_Make_form?=
	=?utf-8?q?at=5Fmod=5Fsupported_truly=C2=A0optional?=
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

VGhlIGRvY3VtZW50YXRpb24gZm9yICJkcm1fcGxhbmVfZnVuY3MuZm9ybWF0X21vZF9zdXBwb3J0
ZWQiIHJlYWRzOgoKICBUaGlzICpvcHRpb25hbCogaG9vayBpcyB1c2VkIGZvciB0aGUgRFJNIHRv
IGRldGVybWluZSBpZiB0aGUgZ2l2ZW4KICBmb3JtYXQvbW9kaWZpZXIgY29tYmluYXRpb24gaXMg
dmFsaWQgZm9yIHRoZSBwbGFuZS4gVGhpcyBhbGxvd3MgdGhlCiAgRFJNIHRvIGdlbmVyYXRlIHRo
ZSBjb3JyZWN0IGZvcm1hdCBiaXRtYXNrICh3aGljaCBmb3JtYXRzIGFwcGx5IHRvCiAgd2hpY2gg
bW9kaWZpZXIpLCBhbmQgdG8gdmFsaWRhdGUgbW9kaWZpZXJzIGF0IGF0b21pY19jaGVjayB0aW1l
LgoKICAqSWYgbm90IHByZXNlbnQqLCB0aGVuIGFueSBtb2RpZmllciBpbiB0aGUgcGxhbmUncyBt
b2RpZmllcgogIGxpc3QgaXMgYWxsb3dlZCB3aXRoIGFueSBvZiB0aGUgcGxhbmUncyBmb3JtYXRz
LgoKSG93ZXZlciwgd2hlcmUgdGhlIGZ1bmN0aW9uIGlzIG5vdCBwcmVzZW50LCBhbiBpbnZhbGlk
IElOX0ZPUk1BVFMgYmxvYgpwcm9wZXJ0eSB3aXRoIG1vZGlmaWVycyBidXQgbm8gZm9ybWF0cyBp
cyBleHBvc2VkIHRvIHVzZXItc3BhY2UuCgpUaGlzIGJyZWFrcyB0aGUgbGF0ZXN0IFdlc3RvbiBb
MV0uIEZvciB0ZXN0aW5nIHB1cnBvc2VzLCBJIGV4dHJhY3RlZCB0aGUKYWZmZWN0ZWQgY29kZSB0
byBhIHN0YW5kYWxvbmUgcHJvZ3JhbSBbMl0uCgpNYWtlICJjcmVhdGVfaW5fZm9ybWF0X2Jsb2Ii
IGJlaGF2ZSBhcyBkb2N1bWVudGVkLgoKWzFdIGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9y
Zy93YXlsYW5kL3dlc3Rvbi8tL2Jsb2IvOS4wL2xpYndlc3Rvbi9iYWNrZW5kLWRybS9rbXMuYyNM
NDMxClsyXSBodHRwczovL2dpdGh1Yi5jb20vSm9zZUV4cG9zaXRvL2RybS1zYW5kYm94L2Jsb2Iv
bWFpbi9pbl9mb3JtYXRzLmMKClNpZ25lZC1vZmYtYnk6IEpvc8OpIEV4cMOzc2l0byA8am9zZS5l
eHBvc2l0bzg5QGdtYWlsLmNvbT4KUmV2aWV3ZWQtYnk6IFNpbW9uIFNlciA8Y29udGFjdEBlbWVy
c2lvbi5mcj4KCi0tLQoKdjI6CgogLSBSZW1vdmUgdW51c2VkICJkb25lOiIgbGFiZWwgdG8gZml4
IGNvbXBpbGUgd2FybmluZwogICBSZXBvcnRlZC1ieToga2VybmVsIHRlc3Qgcm9ib3QgPGxrcEBp
bnRlbC5jb20+CgogLSBBZGQgUmV2aWV3ZWQtYnkgKHRoYW5rcyB0byBTaW1vbiBTZXIpCi0tLQog
ZHJpdmVycy9ncHUvZHJtL2RybV9wbGFuZS5jIHwgOSArKy0tLS0tLS0KIDEgZmlsZSBjaGFuZ2Vk
LCAyIGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2RybV9wbGFuZS5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9wbGFuZS5jCmluZGV4IDgy
YWZiODU0MTQxYi4uZGVlZWM2MGEzMzE1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJt
X3BsYW5lLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9wbGFuZS5jCkBAIC0yMDIsMTcgKzIw
MiwxMyBAQCBzdGF0aWMgaW50IGNyZWF0ZV9pbl9mb3JtYXRfYmxvYihzdHJ1Y3QgZHJtX2Rldmlj
ZSAqZGV2LCBzdHJ1Y3QgZHJtX3BsYW5lICpwbGFuZQogCiAJbWVtY3B5KGZvcm1hdHNfcHRyKGJs
b2JfZGF0YSksIHBsYW5lLT5mb3JtYXRfdHlwZXMsIGZvcm1hdHNfc2l6ZSk7CiAKLQkvKiBJZiB3
ZSBjYW4ndCBkZXRlcm1pbmUgc3VwcG9ydCwganVzdCBiYWlsICovCi0JaWYgKCFwbGFuZS0+ZnVu
Y3MtPmZvcm1hdF9tb2Rfc3VwcG9ydGVkKQotCQlnb3RvIGRvbmU7Ci0KIAltb2QgPSBtb2RpZmll
cnNfcHRyKGJsb2JfZGF0YSk7CiAJZm9yIChpID0gMDsgaSA8IHBsYW5lLT5tb2RpZmllcl9jb3Vu
dDsgaSsrKSB7CiAJCWZvciAoaiA9IDA7IGogPCBwbGFuZS0+Zm9ybWF0X2NvdW50OyBqKyspIHsK
LQkJCWlmIChwbGFuZS0+ZnVuY3MtPmZvcm1hdF9tb2Rfc3VwcG9ydGVkKHBsYW5lLAorCQkJaWYg
KCFwbGFuZS0+ZnVuY3MtPmZvcm1hdF9tb2Rfc3VwcG9ydGVkIHx8CisJCQkgICAgcGxhbmUtPmZ1
bmNzLT5mb3JtYXRfbW9kX3N1cHBvcnRlZChwbGFuZSwKIAkJCQkJCQkgICAgICAgcGxhbmUtPmZv
cm1hdF90eXBlc1tqXSwKIAkJCQkJCQkgICAgICAgcGxhbmUtPm1vZGlmaWVyc1tpXSkpIHsKLQog
CQkJCW1vZC0+Zm9ybWF0cyB8PSAxVUxMIDw8IGo7CiAJCQl9CiAJCX0KQEAgLTIyMyw3ICsyMTks
NiBAQCBzdGF0aWMgaW50IGNyZWF0ZV9pbl9mb3JtYXRfYmxvYihzdHJ1Y3QgZHJtX2RldmljZSAq
ZGV2LCBzdHJ1Y3QgZHJtX3BsYW5lICpwbGFuZQogCQltb2QrKzsKIAl9CiAKLWRvbmU6CiAJZHJt
X29iamVjdF9hdHRhY2hfcHJvcGVydHkoJnBsYW5lLT5iYXNlLCBjb25maWctPm1vZGlmaWVyc19w
cm9wZXJ0eSwKIAkJCQkgICBibG9iLT5iYXNlLmlkKTsKIAotLSAKMi4yNS4xCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5n
IGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
