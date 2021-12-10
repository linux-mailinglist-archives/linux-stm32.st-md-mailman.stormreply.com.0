Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E0AB64707A6
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Dec 2021 18:49:04 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8C02DC5F1EA;
	Fri, 10 Dec 2021 17:49:04 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AC7D8C5E2C1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Dec 2021 17:49:03 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id n8so6750909plf.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Dec 2021 09:49:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7rizF6SQspxzLCdP3CjSaNCfkk6zM5V4SVHSi6B5RlY=;
 b=efryh0xRJUvLAkTjk8rcTuQxNNAq+ZT6D18XBsHqpl3oLZLjWZzkLzPCYH80F5y5Ee
 2s1eoRrSydKRv2QDCAccM2XsF3028pBNhnSRl7WxJpPPiiX4QXaHkoJI+sR/XskF2p1Y
 hbjdOtoKjV/tKfUCJZFKUUYfuY/7x7SPQZfWs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7rizF6SQspxzLCdP3CjSaNCfkk6zM5V4SVHSi6B5RlY=;
 b=ZsZJ8FZar7dlISeTKwCrkynOiZUVIz6jXBg1Dindx6x2AccGe8FRggGBBoeXD0U9TO
 AC/QsEq66r723XL1fMnJAp/Sst0fyZPIf+7WkjJwWeTzO2Kr7OWHYW2eDaNMDygZYH1v
 eJnxIdjA1aWpCM4ceoim3MasVoFPSIux7sq/C9wCq1JuNeqiKygJ3s8GKhmN5Kx+TJtp
 sRiUQUFbHxor37/AIRqbm8Z3xIDb4hfxZDGpZxFrGFi/S+0ujt3G/M3TYhuiEXuInWIG
 UxbiMH46R2d8o9PXCCMAUHhHe0w5gx/UyhyC/hCjXFXZG/b2hzvN3Hf+L94WAkVLQ1la
 1vqQ==
X-Gm-Message-State: AOAM531Q8p0Bf231E6avIeCvXRwVl00t5R0TU20hgfp11ZdkMKEMf4n0
 cIsPMdyHy/jGDpPwVvEP8YvR6g==
X-Google-Smtp-Source: ABdhPJw6D4Sw9ZXAUU2cCDfkecah7QHCPq4BMBCJvsEh/soIldjXBhw7aSCmWNiFyQ93KeD5Qr57iQ==
X-Received: by 2002:a17:90a:e60a:: with SMTP id
 j10mr25948578pjy.169.1639158542156; 
 Fri, 10 Dec 2021 09:49:02 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a0a9:28d6:2bae:633e:b110])
 by smtp.gmail.com with ESMTPSA id w1sm4039644pfg.11.2021.12.10.09.48.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Dec 2021 09:49:01 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Maxime Ripard <mripard@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Fri, 10 Dec 2021 23:18:17 +0530
Message-Id: <20211210174819.2250178-1-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
 linux-amarula@amarulasolutions.com, linux-stm32@st-md-mailman.stormreply.com,
 dri-devel@lists.freedesktop.org, Jagan Teki <jagan@amarulasolutions.com>
Subject: [Linux-stm32] [PATCH 1/3] drm: bridge: nwl-dsi: Drop panel_bridge
	from nwl_dsi
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

cGFuZWxfYnJpZGdlIHBvaW50ZXIgbmV2ZXIgdXNlZCBhbnl3aGVyZSBleGNlcHQgdGhlIG9uZSBp
dApsb29rZWQgdXAgYXQgbndsX2RzaV9icmlkZ2VfYXR0YWNoLgoKRHJvcCBpdCBmcm9tIHRoZSBu
d2xfZHNpIHN0cnVjdHVyZS4KCkNjOiBHdWlkbyBHw7xudGhlciA8YWd4QHNpZ3hjcHUub3JnPgpT
aWduZWQtb2ZmLWJ5OiBKYWdhbiBUZWtpIDxqYWdhbkBhbWFydWxhc29sdXRpb25zLmNvbT4KLS0t
CiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL253bC1kc2kuYyB8IDcgKystLS0tLQogMSBmaWxlIGNo
YW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYnJpZGdlL253bC1kc2kuYyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvbnds
LWRzaS5jCmluZGV4IGE3Mzg5YTBmYWNmYi4uNmJlY2RjZGM5OWZlIDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYnJpZGdlL253bC1kc2kuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdl
L253bC1kc2kuYwpAQCAtNjUsNyArNjUsNiBAQCBzdHJ1Y3QgbndsX2RzaV90cmFuc2ZlciB7CiBz
dHJ1Y3QgbndsX2RzaSB7CiAJc3RydWN0IGRybV9icmlkZ2UgYnJpZGdlOwogCXN0cnVjdCBtaXBp
X2RzaV9ob3N0IGRzaV9ob3N0OwotCXN0cnVjdCBkcm1fYnJpZGdlICpwYW5lbF9icmlkZ2U7CiAJ
c3RydWN0IGRldmljZSAqZGV2OwogCXN0cnVjdCBwaHkgKnBoeTsKIAl1bmlvbiBwaHlfY29uZmln
dXJlX29wdHMgcGh5X2NmZzsKQEAgLTkyNCwxMyArOTIzLDExIEBAIHN0YXRpYyBpbnQgbndsX2Rz
aV9icmlkZ2VfYXR0YWNoKHN0cnVjdCBkcm1fYnJpZGdlICpicmlkZ2UsCiAJCWlmIChJU19FUlIo
cGFuZWxfYnJpZGdlKSkKIAkJCXJldHVybiBQVFJfRVJSKHBhbmVsX2JyaWRnZSk7CiAJfQotCWRz
aS0+cGFuZWxfYnJpZGdlID0gcGFuZWxfYnJpZGdlOwogCi0JaWYgKCFkc2ktPnBhbmVsX2JyaWRn
ZSkKKwlpZiAoIXBhbmVsX2JyaWRnZSkKIAkJcmV0dXJuIC1FUFJPQkVfREVGRVI7CiAKLQlyZXR1
cm4gZHJtX2JyaWRnZV9hdHRhY2goYnJpZGdlLT5lbmNvZGVyLCBkc2ktPnBhbmVsX2JyaWRnZSwg
YnJpZGdlLAotCQkJCSBmbGFncyk7CisJcmV0dXJuIGRybV9icmlkZ2VfYXR0YWNoKGJyaWRnZS0+
ZW5jb2RlciwgcGFuZWxfYnJpZGdlLCBicmlkZ2UsIGZsYWdzKTsKIH0KIAogc3RhdGljIHZvaWQg
bndsX2RzaV9icmlkZ2VfZGV0YWNoKHN0cnVjdCBkcm1fYnJpZGdlICpicmlkZ2UpCi0tIAoyLjI1
LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXN0bTMyCg==
