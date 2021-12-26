Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4015C47F68A
	for <lists+linux-stm32@lfdr.de>; Sun, 26 Dec 2021 12:25:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D1AE7C5E2CC;
	Sun, 26 Dec 2021 11:25:13 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 88185C5C82B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 26 Dec 2021 11:25:12 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id b73so7930852wmd.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 26 Dec 2021 03:25:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MfySaQF3GaGT3rKhp9bzdbdDRm7QyTsYlFaa9SIqgGk=;
 b=qT65bImUN96BSUsorxOakT1Pmg3FQcOtCRO8UOzh45/+T06C3mZuMn0Fw+gQOU2F21
 soEjAjCbxIVI4iZZnAsvS9VvHfGJKBXRCf6NmwN0G130W+OZaFKnH7EZnkrdHkgwHROP
 +0KZ6T+OlQgI72s2f6TBshRmysdplrfFcFkDAyzkTGmYZURMW8d1LMFqaaleqd+3rlMQ
 0RlSdf0Dcd9KhEK2cf8yjWFGIyXH/znLFv6huY92C7k1icypdPx6UWBCUOSuSZwu6vg6
 kWmA2y2c1dWmV7bC/lIKDWe6XAQxmMAhNgTLhJ9hRliz+ENdROWuc90jenrwx80PqFzu
 yx2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MfySaQF3GaGT3rKhp9bzdbdDRm7QyTsYlFaa9SIqgGk=;
 b=ONRN+vH741Z3rS6QTPEdSB6YHouCNGkG9JPZmYhSbDyoxCZP7MZxTj8lv4jkActSCX
 R1RbE7xPqO48Ncc+Q9QsJ8iBFecRGkuWC3j6fgPSfDK9MBLkywsQXo5rKXlKPG70XWMr
 mloMvvPrvZwb42DuOl0Ie2aUOr4wtZspQ2ZzBdaVag06wqlFQvH+YxWook5inR9Dv63Y
 cX8IKTtzcH56lEbR9ONZlFABbQraqz9uyoYCXw1/VN8ZVCZKo21aWR0MS2SuXrjgI3et
 qKWFwvzaX3kgfUS5qlaSXa9bzGUgToPFWr1rWc2USXH0rHfV5mJHNy+yo5sNN4qfpCeo
 OlrQ==
X-Gm-Message-State: AOAM531ylX4One8IA7CHv29CsXBWu3m2iy4hY7yP2uNbGcbhB2++TAbR
 vAxlIPMj2LTv/znl9ePRBi8=
X-Google-Smtp-Source: ABdhPJw59MvLvZ2RZ+XzSNYkTilLCKgdLom4W7pXuZ8fRzh57pIUaKcZzFzTnlj18iy9FRBp2KTB3w==
X-Received: by 2002:a7b:c08c:: with SMTP id r12mr10128651wmh.161.1640517912047; 
 Sun, 26 Dec 2021 03:25:12 -0800 (PST)
Received: from localhost.localdomain ([217.113.240.86])
 by smtp.gmail.com with ESMTPSA id g12sm13654743wrd.71.2021.12.26.03.25.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Dec 2021 03:25:11 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: contact@emersion.fr
Date: Sun, 26 Dec 2021 12:24:57 +0100
Message-Id: <20211226112503.31771-1-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Subject: [Linux-stm32] [PATCH v3 0/6] Add missing format_mod_supported
	functions
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

SGkgYWxsLAoKVGhpcyBwYXRjaHNldCBzdXBlcnNlZGVzIFsxXS4gTm93IHRoZSB0aXRsZSBpcyBh
IGJpdCBtaXNsZWFkaW5nLCBidXQKSSBsZWZ0IGl0IHRoaXMgd2F5IHRvIChob3BlZnVsbHkpIGZh
Y2lsaXRhdGUgdGhlIG1haW50YWluZXJzJyB3b3JrLgoKQSBsaXR0bGUgY29udGV4dDogT3JpZ2lu
YWxseSwgSSBzZW50IGEgcGF0Y2ggYWRkaW5nIG1vZGlmaWVycyB0byB0aGUKVktNUyBkcml2ZXIg
YW5kIFNpbW9uIFNlciBraW5kbHkgcmV2aWV3ZWQgaXQgYW5kIHBvaW50ZWQgb3V0IHRoYXQKImZv
cm1hdF9tb2Rfc3VwcG9ydGVkIiB3YXMgbWlzc2luZyBbMl0uCkkgYXNrZWQgaWYgdGhlIGRvY3Mg
d2VyZSBpbmNvcnJlY3Qgb3IgaWYgaXQgd2FzIGEgYnVnIGluCiJjcmVhdGVfaW5fZm9ybWF0X2Js
b2IiLgoKSW4gdGhlIGZpcnN0IHZlcnNpb24gb2YgdGhpcyBzZXJpZXMsIFNpbW9uIFNlciBhbmQg
RG1pdHJ5IEJhcnlzaGtvdgphZ3JlZWQgWzFdIHRoYXQgdGhlIGNvZGUgc2hvdWxkIGJlaGF2ZSBh
cyBkb2N1bWVudGVkIGFuZAoiY3JlYXRlX2luX2Zvcm1hdF9ibG9iIiBzaG91bGQgYmUgY2hhbmdl
ZC4KClRoZSBzZWNvbmQgdmVyc2lvbiBpbXBsZW1lbnRlZCB0aGUgcmVxdWlyZWQgY2hhbmdlcyBh
bmQgZHJvcHMgdGhlCiJmb3JtYXRfbW9kX3N1cHBvcnRlZCIgaW4gdGhlIGRyaXZlcnMgdGhhdCBj
YW4gdXNlIHRoZSBkZWZhdWx0CmltcGxlbWVudGF0aW9uLiBbM10KClRoaXMgdGhpcmQgdmVyc2lv
biBmaXhlcyBhIGNvbXBpbGVyIHdhcm5pbmcgYW5kIGFkZHMgdGhlIHJldmlld2VkCmJ5IHRhZ3Mu
CgpUaGFua3MsCkpvc8OpIEV4cMOzc2l0bwoKWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2Ry
aS1kZXZlbC9DQUE4RUpwcUotdFdtYjVCYTZYU0s1OXRvQ3RMYjNuUlJtVkg4ZGE0VWRfcnJSWXl0
bXdAbWFpbC5nbWFpbC5jb20vVC8KWzJdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2RyaS1kZXZl
bC8yMDIxMTIxNjE3MDUzMi5HQTE2MzQ5QGVsZW1lbnRhcnkvVC8KWzNdIGh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL2RyaS1kZXZlbC8yMDIxMTIyMjA5MDU1Mi4yNTk3Mi0xLWpvc2UuZXhwb3NpdG84
OUBnbWFpbC5jb20vVC8KCkpvc8OpIEV4cMOzc2l0byAoNik6CiAgZHJtL3BsYW5lOiBNYWtlIGZv
cm1hdF9tb2Rfc3VwcG9ydGVkIHRydWx5wqBvcHRpb25hbAogIGRybS9wbGFuZTogRml4IHR5cG8g
aW4gZm9ybWF0X21vZF9zdXBwb3J0ZWQgZG9jdW1lbnRhdGlvbgogIGRybS9zaW1wbGUta21zOiBE
cm9wIGZvcm1hdF9tb2Rfc3VwcG9ydGVkIGZ1bmN0aW9uCiAgZHJtL2k5MTUvZGlzcGxheTogRHJv
cCBmb3JtYXRfbW9kX3N1cHBvcnRlZCBmdW5jdGlvbgogIGRybTogbXhzZmI6IERyb3AgZm9ybWF0
X21vZF9zdXBwb3J0ZWQgZnVuY3Rpb24KICBkcm0vc3RtOiBsdGRjOiBEcm9wIGZvcm1hdF9tb2Rf
c3VwcG9ydGVkIGZ1bmN0aW9uCgogZHJpdmVycy9ncHUvZHJtL2RybV9wbGFuZS5jICAgICAgICAg
ICAgICAgICB8ICA5ICsrLS0tLS0tLQogZHJpdmVycy9ncHUvZHJtL2RybV9zaW1wbGVfa21zX2hl
bHBlci5jICAgICB8ICA4IC0tLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2lu
dGVsX2N1cnNvci5jIHwgIDggLS0tLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9teHNmYi9teHNmYl9r
bXMuYyAgICAgICAgICAgfCAgOCAtLS0tLS0tLQogZHJpdmVycy9ncHUvZHJtL3N0bS9sdGRjLmMg
ICAgICAgICAgICAgICAgICB8IDExIC0tLS0tLS0tLS0tCiBpbmNsdWRlL2RybS9kcm1fcGxhbmUu
aCAgICAgICAgICAgICAgICAgICAgIHwgIDIgKy0KIDYgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRp
b25zKCspLCA0MyBkZWxldGlvbnMoLSkKCi0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51
eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
