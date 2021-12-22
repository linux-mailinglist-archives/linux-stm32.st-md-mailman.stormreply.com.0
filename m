Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A1D47D032
	for <lists+linux-stm32@lfdr.de>; Wed, 22 Dec 2021 11:45:16 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E5DC4C5F1F4;
	Wed, 22 Dec 2021 10:45:15 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C9D70C5F1EF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Dec 2021 09:05:59 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id e5so3477498wrc.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Dec 2021 01:05:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qqsydkxhhK8OhNALZ+VHv5FZny2skJQWB82QtY63Q9s=;
 b=iD43qYAfHKgHEkC7nFjFdmgKXSLsUqD1tOX38fFtuZq3qwU1j0wOHmZyk7cmiVanwf
 giLn4KfQ9FO/4viWuK2riNg5PiCPdD4ewWsqhFlEkiTV3nTPKAyrcHFu7M1bsoRhNrHb
 DdjPxoxSwSl/T6YDCv1lW4ghDMwcvgq1aFQVMWAxSSg+mmGR6ivWF3EEl+DT2KkwejeC
 q4iVCkw85/sEWSRS0UaCHotTDsBlulj+yeCrxqRIlEoCSP9aawdEQovt91JUKIKS4xmj
 fwAYgHhTLBy0VF70R1A+BOhUwvuYUvC2NVVlPdorxD2IOIdOmjlLF/8qIHczAgPfW/R/
 huXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qqsydkxhhK8OhNALZ+VHv5FZny2skJQWB82QtY63Q9s=;
 b=pXJA2zlALjpWDTWBHZwJviCf4vn4ruOYSbudBF4a2q68r13E3eC0A5rTkG8PQuaqZZ
 FfuAFH+56JgqNkK/iVWkdCFK3OjpDKoywZChmXy0+bOJZAQfzSNZFUvgYkTvyxKql8tU
 IhQQhmAdwpsHybEKq8YvOekRfa86opeOFsfhtF4z0oI4P08opPso1keTB609Rcj4UYW1
 wNPffNyzs4eblZSu09vEUcmxirRoVICq83YY0EZNpc4/ohfnYrkVGBh7I1Os7W/sUvn3
 eam8InmnTu7sSqCyZEmapd4MXsEpFcFP936Li9AVKCba1ekGiaa5qIZU0KnrCOUqB+Nw
 eTTg==
X-Gm-Message-State: AOAM530yh9NyrilSRFe8IDA3uz2VUSkrv9nXKsKsneEYQBSS1du2JUvL
 m99uGgdSsNVeSLC3Paue6Qo=
X-Google-Smtp-Source: ABdhPJyT0Au4GEtGNae85W38GmiNwbKwrmg900dN5iNRMKkALJW8orth+l2K+OpmtdJEWYLlqaDVRg==
X-Received: by 2002:a05:6000:1ac9:: with SMTP id
 i9mr1363329wry.531.1640163959472; 
 Wed, 22 Dec 2021 01:05:59 -0800 (PST)
Received: from localhost.localdomain ([217.113.240.86])
 by smtp.gmail.com with ESMTPSA id a22sm1139775wme.19.2021.12.22.01.05.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Dec 2021 01:05:59 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: contact@emersion.fr
Date: Wed, 22 Dec 2021 10:05:48 +0100
Message-Id: <20211222090552.25972-3-jose.exposito89@gmail.com>
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
Subject: [Linux-stm32] [PATCH v2 2/6] drm/plane: Fix typo in
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
IEpvc8OpIEV4cMOzc2l0byA8am9zZS5leHBvc2l0bzg5QGdtYWlsLmNvbT4KLS0tCiBpbmNsdWRl
L2RybS9kcm1fcGxhbmUuaCB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9wbGFuZS5oIGIvaW5j
bHVkZS9kcm0vZHJtX3BsYW5lLmgKaW5kZXggMGMxMTAyZGM0ZDg4Li4wNjc1OWJhZGY5OWYgMTAw
NjQ0Ci0tLSBhL2luY2x1ZGUvZHJtL2RybV9wbGFuZS5oCisrKyBiL2luY2x1ZGUvZHJtL2RybV9w
bGFuZS5oCkBAIC01MTYsNyArNTE2LDcgQEAgc3RydWN0IGRybV9wbGFuZV9mdW5jcyB7CiAJICog
VGhpcyBvcHRpb25hbCBob29rIGlzIHVzZWQgZm9yIHRoZSBEUk0gdG8gZGV0ZXJtaW5lIGlmIHRo
ZSBnaXZlbgogCSAqIGZvcm1hdC9tb2RpZmllciBjb21iaW5hdGlvbiBpcyB2YWxpZCBmb3IgdGhl
IHBsYW5lLiBUaGlzIGFsbG93cyB0aGUKIAkgKiBEUk0gdG8gZ2VuZXJhdGUgdGhlIGNvcnJlY3Qg
Zm9ybWF0IGJpdG1hc2sgKHdoaWNoIGZvcm1hdHMgYXBwbHkgdG8KLQkgKiB3aGljaCBtb2RpZmll
ciksIGFuZCB0byB2YWxkaWF0ZSBtb2RpZmllcnMgYXQgYXRvbWljX2NoZWNrIHRpbWUuCisJICog
d2hpY2ggbW9kaWZpZXIpLCBhbmQgdG8gdmFsaWRhdGUgbW9kaWZpZXJzIGF0IGF0b21pY19jaGVj
ayB0aW1lLgogCSAqCiAJICogSWYgbm90IHByZXNlbnQsIHRoZW4gYW55IG1vZGlmaWVyIGluIHRo
ZSBwbGFuZSdzIG1vZGlmaWVyCiAJICogbGlzdCBpcyBhbGxvd2VkIHdpdGggYW55IG9mIHRoZSBw
bGFuZSdzIGZvcm1hdHMuCi0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBz
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
