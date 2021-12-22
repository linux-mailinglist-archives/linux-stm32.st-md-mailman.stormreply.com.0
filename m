Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7620A47D031
	for <lists+linux-stm32@lfdr.de>; Wed, 22 Dec 2021 11:45:16 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D5C11C5F1F1;
	Wed, 22 Dec 2021 10:45:15 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4DED4C5A4FE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Dec 2021 09:05:58 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 n14-20020a7bcbce000000b00332f4abf43fso2005367wmi.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Dec 2021 01:05:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4JUlyn+OB9q/nAkx157+4tz8tby5UzCmjnk2cgpU7/E=;
 b=bu3nJO8MFxa2c3oQBbJ83GmuDcUoW/SXO45yCpT+W+biCuOoDSCSUHLDaLok8S5hJO
 AGIc638dQmhbYpVFO3fcT9cyc67PGfn2OhQTD/r1mPw1TTpNMQjoh0TYQr+U02yOW+tu
 X442JQhjJcoe+krNyki1Sg1bJOTF9j3gNtXaGIIPkZZp3cmiigPYVLCFUFLhsYanQnie
 TuzmHfDaVWrRYXrnE27kVoBZrfZiA2Sk8z72o7/mpw+6dFQl8nVHTQNcderx02plvF5i
 nSPpg9Ra28b5DwLGb8L/YCKoscQfG/MHB4XsUEBcGl83DyyOnlwlpLq4zhH15So0AFvo
 r8sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4JUlyn+OB9q/nAkx157+4tz8tby5UzCmjnk2cgpU7/E=;
 b=6wi8ZPlZJ31s4EGxpzujCPiJ6Y/24KqCRJwuh32OQLmQtevncP/UkUIssvpLAWIUnr
 mzZZ0bI4GVXA/S9m3bu98/8Er6XvP6oIAUpfByApv5VEAxG3YDhQUI/NgFAquVYYAvq4
 DmjyEw/yHTJMX25roQ+2y4arN8Lb9HH/fRHESm/qmFwfIGGF6D4CG9ua6yFR7bozg0Pj
 Jo1RN+3i6bLclmNAGYgeHqaMy+7cJbwup7zwDqqpD9nTcI70QEG4ZmBGe7uHLFSOKONW
 qsdD0468Fmsb5oIF1hasNfTZAlt0mQpM4/SxOsHChCegk/7VGzEIMRbohqXldyafjp70
 CJkw==
X-Gm-Message-State: AOAM5327146vxGkj/M2stjdTHvuJkEEdYYQqBkhI9jkq7ILmzvtUYSxf
 U9xMp3FBULWjHa8XyVNSEEs=
X-Google-Smtp-Source: ABdhPJytwBVNsRsjyCUwyNbd1c89P3F94MwHR3ncwRrz/bBC3+610uzB064VOeAclTRMoqfrorHsTQ==
X-Received: by 2002:a05:600c:c6:: with SMTP id u6mr219660wmm.8.1640163957972; 
 Wed, 22 Dec 2021 01:05:57 -0800 (PST)
Received: from localhost.localdomain ([217.113.240.86])
 by smtp.gmail.com with ESMTPSA id a22sm1139775wme.19.2021.12.22.01.05.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Dec 2021 01:05:57 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: contact@emersion.fr
Date: Wed, 22 Dec 2021 10:05:47 +0100
Message-Id: <20211222090552.25972-2-jose.exposito89@gmail.com>
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
Subject: [Linux-stm32] =?utf-8?q?=5BPATCH_v2_1/6=5D_drm/plane=3A_Make_form?=
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
eHBvc2l0bzg5QGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX3BsYW5lLmMgfCA4
ICsrLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fcGxhbmUuYyBiL2RyaXZlcnMvZ3B1
L2RybS9kcm1fcGxhbmUuYwppbmRleCA4MmFmYjg1NDE0MWIuLmMxMTg2YjcyMTVlZSAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9wbGFuZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9k
cm1fcGxhbmUuYwpAQCAtMjAyLDE3ICsyMDIsMTMgQEAgc3RhdGljIGludCBjcmVhdGVfaW5fZm9y
bWF0X2Jsb2Ioc3RydWN0IGRybV9kZXZpY2UgKmRldiwgc3RydWN0IGRybV9wbGFuZSAqcGxhbmUK
IAogCW1lbWNweShmb3JtYXRzX3B0cihibG9iX2RhdGEpLCBwbGFuZS0+Zm9ybWF0X3R5cGVzLCBm
b3JtYXRzX3NpemUpOwogCi0JLyogSWYgd2UgY2FuJ3QgZGV0ZXJtaW5lIHN1cHBvcnQsIGp1c3Qg
YmFpbCAqLwotCWlmICghcGxhbmUtPmZ1bmNzLT5mb3JtYXRfbW9kX3N1cHBvcnRlZCkKLQkJZ290
byBkb25lOwotCiAJbW9kID0gbW9kaWZpZXJzX3B0cihibG9iX2RhdGEpOwogCWZvciAoaSA9IDA7
IGkgPCBwbGFuZS0+bW9kaWZpZXJfY291bnQ7IGkrKykgewogCQlmb3IgKGogPSAwOyBqIDwgcGxh
bmUtPmZvcm1hdF9jb3VudDsgaisrKSB7Ci0JCQlpZiAocGxhbmUtPmZ1bmNzLT5mb3JtYXRfbW9k
X3N1cHBvcnRlZChwbGFuZSwKKwkJCWlmICghcGxhbmUtPmZ1bmNzLT5mb3JtYXRfbW9kX3N1cHBv
cnRlZCB8fAorCQkJICAgIHBsYW5lLT5mdW5jcy0+Zm9ybWF0X21vZF9zdXBwb3J0ZWQocGxhbmUs
CiAJCQkJCQkJICAgICAgIHBsYW5lLT5mb3JtYXRfdHlwZXNbal0sCiAJCQkJCQkJICAgICAgIHBs
YW5lLT5tb2RpZmllcnNbaV0pKSB7Ci0KIAkJCQltb2QtPmZvcm1hdHMgfD0gMVVMTCA8PCBqOwog
CQkJfQogCQl9Ci0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
