Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3837047F68C
	for <lists+linux-stm32@lfdr.de>; Sun, 26 Dec 2021 12:25:19 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EE166C5F1EE;
	Sun, 26 Dec 2021 11:25:18 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C9AD6C5C82B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 26 Dec 2021 11:25:16 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id g132so7922490wmg.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 26 Dec 2021 03:25:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JVsPYyeSs0Z89jpnz+/jWObtkdsoENnAN2PsMGBB0X8=;
 b=Ay89gIcMZst8GS6tyGXp98KOAC6Qgvu1V13cw/bSJfQ0fXJgZG1CyQSXYBVYyvR85x
 chNrltN4WsAL+D/E3LN61lFu800OdW4YqE6Db671ZbGItmrxctjiekoTQY0QMokGJw5/
 dFUWjTEqmeu7+zjUpWpFiuLEq/JaQFOlkPTQPKbBf+sB0HwATkpJjBjYCpHkXvy3l+LB
 Xg+NBHYtfxiRQwHcnYXOynDBNnmRXqt1Y9sodZKjUdDsfBRynMJBPd+bt21AhRYc69WM
 DOS4WhO6K4Oo4XOYxTYk8cqZyoBIkjRq7c4O3pNViYg5skoeqHc5uCCEZq03e9AUZ3xI
 FgVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JVsPYyeSs0Z89jpnz+/jWObtkdsoENnAN2PsMGBB0X8=;
 b=EITIbLX8kYTtHqyFIEGCeCm7/Q6uL4wPvyPzgtcDUiWbW+voX40IIGflWGyOAgzuZK
 2QW3TV8H9BK0RYoiWATT2mmHVozsUNcvK2GYaTCOz1BA7cPvHpUhSQrZbqIWo9xjDIvo
 kHIl1/8ZR6/MTwHyJ3hwGOnRcEkVKbAXSjbG7vVpocjMGiPGHInsit1aUgJgF0F01Xds
 UgFfIAtC6X/pNgteGeRLbshqWdpL+56HWks7DnOoZv7XBqrVs1OAv3Ach0TrhNl2JUMD
 y7ifJwfWsiRBdldxf+7E6i2HUYYlFiPzYXKiPEK64HTXl/ZrWowWR3uOdW48IzBCuSqt
 Bgig==
X-Gm-Message-State: AOAM533+nSAkJiq/5gN2BVfR/SySxVARNWDnS1fsVoAhL2IK29RbnWps
 ka7N/CbqTR86WI1bUYnQvDLPm9Y94RIFMw==
X-Google-Smtp-Source: ABdhPJw57VZXKuh209lrx9BjCOI+QhODbcZjFyWAqCKVxPAtqvffXu2BoHojbDQtI0Ncc1Ggqfq3oA==
X-Received: by 2002:a05:600c:6018:: with SMTP id
 az24mr9821191wmb.103.1640517916521; 
 Sun, 26 Dec 2021 03:25:16 -0800 (PST)
Received: from localhost.localdomain ([217.113.240.86])
 by smtp.gmail.com with ESMTPSA id g12sm13654743wrd.71.2021.12.26.03.25.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Dec 2021 03:25:16 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: contact@emersion.fr
Date: Sun, 26 Dec 2021 12:24:59 +0100
Message-Id: <20211226112503.31771-3-jose.exposito89@gmail.com>
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
Subject: [Linux-stm32] [PATCH v3 2/6] drm/plane: Fix typo in
	format_mod_supported documentation
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

Rml4IG1pbm9yIHR5cG86ICJ2YWxkaWF0ZSIgLT4gInZhbGlkYXRlIi4KClNpZ25lZC1vZmYtYnk6
IEpvc8OpIEV4cMOzc2l0byA8am9zZS5leHBvc2l0bzg5QGdtYWlsLmNvbT4KUmV2aWV3ZWQtYnk6
IFNpbW9uIFNlciA8Y29udGFjdEBlbWVyc2lvbi5mcj4KLS0tCiBpbmNsdWRlL2RybS9kcm1fcGxh
bmUuaCB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9wbGFuZS5oIGIvaW5jbHVkZS9kcm0vZHJt
X3BsYW5lLmgKaW5kZXggMGMxMTAyZGM0ZDg4Li4wNjc1OWJhZGY5OWYgMTAwNjQ0Ci0tLSBhL2lu
Y2x1ZGUvZHJtL2RybV9wbGFuZS5oCisrKyBiL2luY2x1ZGUvZHJtL2RybV9wbGFuZS5oCkBAIC01
MTYsNyArNTE2LDcgQEAgc3RydWN0IGRybV9wbGFuZV9mdW5jcyB7CiAJICogVGhpcyBvcHRpb25h
bCBob29rIGlzIHVzZWQgZm9yIHRoZSBEUk0gdG8gZGV0ZXJtaW5lIGlmIHRoZSBnaXZlbgogCSAq
IGZvcm1hdC9tb2RpZmllciBjb21iaW5hdGlvbiBpcyB2YWxpZCBmb3IgdGhlIHBsYW5lLiBUaGlz
IGFsbG93cyB0aGUKIAkgKiBEUk0gdG8gZ2VuZXJhdGUgdGhlIGNvcnJlY3QgZm9ybWF0IGJpdG1h
c2sgKHdoaWNoIGZvcm1hdHMgYXBwbHkgdG8KLQkgKiB3aGljaCBtb2RpZmllciksIGFuZCB0byB2
YWxkaWF0ZSBtb2RpZmllcnMgYXQgYXRvbWljX2NoZWNrIHRpbWUuCisJICogd2hpY2ggbW9kaWZp
ZXIpLCBhbmQgdG8gdmFsaWRhdGUgbW9kaWZpZXJzIGF0IGF0b21pY19jaGVjayB0aW1lLgogCSAq
CiAJICogSWYgbm90IHByZXNlbnQsIHRoZW4gYW55IG1vZGlmaWVyIGluIHRoZSBwbGFuZSdzIG1v
ZGlmaWVyCiAJICogbGlzdCBpcyBhbGxvd2VkIHdpdGggYW55IG9mIHRoZSBwbGFuZSdzIGZvcm1h
dHMuCi0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
