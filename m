Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A174707A8
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Dec 2021 18:49:09 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9A4A1C5F1EB;
	Fri, 10 Dec 2021 17:49:09 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3C970C5F1E0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Dec 2021 17:49:08 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id
 j5-20020a17090a318500b001a6c749e697so8546433pjb.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Dec 2021 09:49:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7Nc8TwxfVSVe1wllVo9dJ3a2pGJ8q3XwPSEkE8/FYhQ=;
 b=MM1upYS/L61PPHLwy82sz4xLdDLCNMYLsz3hvq5k4dJ0seo7e2I8P9hGsJaVnRj4Qo
 wGId760gCZIOES6wHXn6bALjUUSUB5H9uw2SKJdOzi4rlEj63e9F/GkmvVh7vulHUFnY
 tmAjwVLLN+vjQ2fTVO4KWh5+c/sUw+g17cdh4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7Nc8TwxfVSVe1wllVo9dJ3a2pGJ8q3XwPSEkE8/FYhQ=;
 b=sgzz3dfVH5ip3zwN+psFKPfZtNTfbD2oYPyExiHk/4fY44VXRYN/TaCq6fE5V8ZEsu
 J18kyAppn5Xx7pnqsp9HjXVHlgdKMObNpHhES0aViFOJSd/Idr+5OddrH2AC58iAMOvT
 x84SepSrdN6jaVvZmTszadB/9jYIZHjrC4DdTwtIRGDXJQ2NeAgxM0AYMbMFNHKCLoQ5
 7fVkDUOg6eJR4EVwflHIrBh6+dik9JWzhmyz83q/XtWJMlRH7la+1sFLy7QwX+PM46F/
 n+80BgRc9tK3bcqWx2DjxIA8KT2zdXCILgSf5Q9G3l0LgriaMStsMxQydg7Xd+kiDGe9
 K3CQ==
X-Gm-Message-State: AOAM5330xIKk0zA2A7Z8y2bYjKCEK3Dia1IlZmCV9DbvMT4JnBvgRNA6
 iQkjkMce+Pc+kAkusc4IpanxjA==
X-Google-Smtp-Source: ABdhPJzzBhRewYnBoc9OlhBIdNPvxMiLbkkqd4UnFm0O7xyADqdLzVdA2mRgO/x3MXNAD3M5iCbqcg==
X-Received: by 2002:a17:902:c702:b0:144:ce0e:d47 with SMTP id
 p2-20020a170902c70200b00144ce0e0d47mr75825180plp.69.1639158546872; 
 Fri, 10 Dec 2021 09:49:06 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a0a9:28d6:2bae:633e:b110])
 by smtp.gmail.com with ESMTPSA id w1sm4039644pfg.11.2021.12.10.09.49.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Dec 2021 09:49:06 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Maxime Ripard <mripard@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Fri, 10 Dec 2021 23:18:18 +0530
Message-Id: <20211210174819.2250178-2-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211210174819.2250178-1-jagan@amarulasolutions.com>
References: <20211210174819.2250178-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Cc: linux-amarula@amarulasolutions.com,
 linux-stm32@st-md-mailman.stormreply.com, dri-devel@lists.freedesktop.org,
 Jagan Teki <jagan@amarulasolutions.com>
Subject: [Linux-stm32] [PATCH 2/3] Revert "drm/bridge: dw-mipi-dsi: Find the
	possible DSI devices"
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

VGhpcyByZXZlcnRzIGNvbW1pdCBjMjA2YzdmYWViMzI2M2E3Y2M3YjRkZTQ0M2EzODc3Y2Q3YTVl
NzRiLgoKSW4gb3JkZXIgdG8gYXZvaWQgYW55IHByb2JlIG9yZGVyaW5nIGlzc3VlcywgdGhlIEky
QyBiYXNlZCBkb3duc3RyZWFtCmJyaWRnZSBkcml2ZXJzIG5vdyByZWdpc3RlciBhbmQgYXR0YWNo
wqB0aGUgRFNJIGRldmljZXMgYXQgdGhlIHByb2JlCmluc3RlYWQgb2YgZG9pbmcgaXQgb24gZHJt
X2JyaWRnZV9mdW5jdGlvbi5hdHRhY2goKS4KCkV4YW1wbGVzIG9mIHRob3NlIGNvbW1pdHMgYXJl
OgoKY29tbWl0IDw2ZWY3ZWU0ODc2NWY+ICgiZHJtL2JyaWRnZTogc242NWRzaTgzOiBSZWdpc3Rl
ciBhbmQgYXR0YWNoIG91cgpEU0kgZGV2aWNlIGF0IHByb2JlIikKY29tbWl0IDxkODkwNzhjMzdi
MTA+ICgiZHJtL2JyaWRnZTogbHQ4OTEyYjogUmVnaXN0ZXIgYW5kIGF0dGFjaCBvdXIgRFNJCmRl
dmljZSBhdCBwcm9iZSIpCmNvbW1pdCA8ODY0YzQ5YTMxZDZiPiAoImRybS9icmlkZ2U6IGFkdjc1
MTE6IFJlZ2lzdGVyIGFuZCBhdHRhY2ggb3VyIERTSQpkZXZpY2UgYXQgcHJvYmUiKQoKZHctbWlw
aS1kc2kgaGFzIHBhbmVsIG9yIGJyaWRnZSBmaW5kaW5nIGNvZGUgYmFzZWQgb24gcHJldmlvdXMg
ZG93bnN0cmVhbQpicmlkZ2VzLCBzbyByZXZlcnQgdGhlIHNhbWUgYW5kIG1ha2UgdGhlIHBhbmVs
IG9yIGJyaWRnZSBmdW5kaW5nIGluIGhvc3QKYXR0YWNoIGFzIGJlZm9yZS4KClNpZ25lZC1vZmYt
Ynk6IEphZ2FuIFRla2kgPGphZ2FuQGFtYXJ1bGFzb2x1dGlvbnMuY29tPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctbWlwaS1kc2kuYyB8IDU4ICsrKysrLS0tLS0tLS0t
LS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCA0MyBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LW1pcGktZHNp
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LW1pcGktZHNpLmMKaW5kZXgg
ZTQ0ZTE4YTAxMTJhLi43OTAwZGExZDQzMjUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9i
cmlkZ2Uvc3lub3BzeXMvZHctbWlwaS1kc2kuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdl
L3N5bm9wc3lzL2R3LW1pcGktZHNpLmMKQEAgLTI0Niw3ICsyNDYsNiBAQCBzdHJ1Y3QgZHdfbWlw
aV9kc2kgewogCiAJc3RydWN0IGNsayAqcGNsazsKIAotCWJvb2wgZGV2aWNlX2ZvdW5kOwogCXVu
c2lnbmVkIGludCBsYW5lX21icHM7IC8qIHBlciBsYW5lICovCiAJdTMyIGNoYW5uZWw7CiAJdTMy
IGxhbmVzOwpAQCAtMzEwLDM3ICszMDksMTMgQEAgc3RhdGljIGlubGluZSB1MzIgZHNpX3JlYWQo
c3RydWN0IGR3X21pcGlfZHNpICpkc2ksIHUzMiByZWcpCiAJcmV0dXJuIHJlYWRsKGRzaS0+YmFz
ZSArIHJlZyk7CiB9CiAKLXN0YXRpYyBpbnQgZHdfbWlwaV9kc2lfcGFuZWxfb3JfYnJpZGdlKHN0
cnVjdCBkd19taXBpX2RzaSAqZHNpLAotCQkJCSAgICAgICBzdHJ1Y3QgZGV2aWNlX25vZGUgKm5v
ZGUpCi17Ci0Jc3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZTsKLQlzdHJ1Y3QgZHJtX3BhbmVsICpw
YW5lbDsKLQlpbnQgcmV0OwotCi0JcmV0ID0gZHJtX29mX2ZpbmRfcGFuZWxfb3JfYnJpZGdlKG5v
ZGUsIDEsIDAsICZwYW5lbCwgJmJyaWRnZSk7Ci0JaWYgKHJldCkKLQkJcmV0dXJuIHJldDsKLQot
CWlmIChwYW5lbCkgewotCQlicmlkZ2UgPSBkcm1fcGFuZWxfYnJpZGdlX2FkZF90eXBlZChwYW5l
bCwKLQkJCQkJCSAgICBEUk1fTU9ERV9DT05ORUNUT1JfRFNJKTsKLQkJaWYgKElTX0VSUihicmlk
Z2UpKQotCQkJcmV0dXJuIFBUUl9FUlIoYnJpZGdlKTsKLQl9Ci0KLQlkc2ktPnBhbmVsX2JyaWRn
ZSA9IGJyaWRnZTsKLQotCWlmICghZHNpLT5wYW5lbF9icmlkZ2UpCi0JCXJldHVybiAtRVBST0JF
X0RFRkVSOwotCi0JcmV0dXJuIDA7Ci19Ci0KIHN0YXRpYyBpbnQgZHdfbWlwaV9kc2lfaG9zdF9h
dHRhY2goc3RydWN0IG1pcGlfZHNpX2hvc3QgKmhvc3QsCiAJCQkJICAgc3RydWN0IG1pcGlfZHNp
X2RldmljZSAqZGV2aWNlKQogewogCXN0cnVjdCBkd19taXBpX2RzaSAqZHNpID0gaG9zdF90b19k
c2koaG9zdCk7CiAJY29uc3Qgc3RydWN0IGR3X21pcGlfZHNpX3BsYXRfZGF0YSAqcGRhdGEgPSBk
c2ktPnBsYXRfZGF0YTsKKwlzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlOworCXN0cnVjdCBkcm1f
cGFuZWwgKnBhbmVsOwogCWludCByZXQ7CiAKIAlpZiAoZGV2aWNlLT5sYW5lcyA+IGRzaS0+cGxh
dF9kYXRhLT5tYXhfZGF0YV9sYW5lcykgewpAQCAtMzU0LDE0ICszMjksMjIgQEAgc3RhdGljIGlu
dCBkd19taXBpX2RzaV9ob3N0X2F0dGFjaChzdHJ1Y3QgbWlwaV9kc2lfaG9zdCAqaG9zdCwKIAlk
c2ktPmZvcm1hdCA9IGRldmljZS0+Zm9ybWF0OwogCWRzaS0+bW9kZV9mbGFncyA9IGRldmljZS0+
bW9kZV9mbGFnczsKIAotCWlmICghZHNpLT5kZXZpY2VfZm91bmQpIHsKLQkJcmV0ID0gZHdfbWlw
aV9kc2lfcGFuZWxfb3JfYnJpZGdlKGRzaSwgaG9zdC0+ZGV2LT5vZl9ub2RlKTsKLQkJaWYgKHJl
dCkKLQkJCXJldHVybiByZXQ7CisJcmV0ID0gZHJtX29mX2ZpbmRfcGFuZWxfb3JfYnJpZGdlKGhv
c3QtPmRldi0+b2Zfbm9kZSwgMSwgMCwKKwkJCQkJICAmcGFuZWwsICZicmlkZ2UpOworCWlmIChy
ZXQpCisJCXJldHVybiByZXQ7CiAKLQkJZHNpLT5kZXZpY2VfZm91bmQgPSB0cnVlOworCWlmIChw
YW5lbCkgeworCQlicmlkZ2UgPSBkcm1fcGFuZWxfYnJpZGdlX2FkZF90eXBlZChwYW5lbCwKKwkJ
CQkJCSAgICBEUk1fTU9ERV9DT05ORUNUT1JfRFNJKTsKKwkJaWYgKElTX0VSUihicmlkZ2UpKQor
CQkJcmV0dXJuIFBUUl9FUlIoYnJpZGdlKTsKIAl9CiAKKwlkc2ktPnBhbmVsX2JyaWRnZSA9IGJy
aWRnZTsKKworCWRybV9icmlkZ2VfYWRkKCZkc2ktPmJyaWRnZSk7CisKIAlpZiAocGRhdGEtPmhv
c3Rfb3BzICYmIHBkYXRhLT5ob3N0X29wcy0+YXR0YWNoKSB7CiAJCXJldCA9IHBkYXRhLT5ob3N0
X29wcy0+YXR0YWNoKHBkYXRhLT5wcml2X2RhdGEsIGRldmljZSk7CiAJCWlmIChyZXQgPCAwKQpA
QCAtMTAxNiwxNiArOTk5LDYgQEAgc3RhdGljIGludCBkd19taXBpX2RzaV9icmlkZ2VfYXR0YWNo
KHN0cnVjdCBkcm1fYnJpZGdlICpicmlkZ2UsCiAJLyogU2V0IHRoZSBlbmNvZGVyIHR5cGUgYXMg
Y2FsbGVyIGRvZXMgbm90IGtub3cgaXQgKi8KIAlicmlkZ2UtPmVuY29kZXItPmVuY29kZXJfdHlw
ZSA9IERSTV9NT0RFX0VOQ09ERVJfRFNJOwogCi0JaWYgKCFkc2ktPmRldmljZV9mb3VuZCkgewot
CQlpbnQgcmV0OwotCi0JCXJldCA9IGR3X21pcGlfZHNpX3BhbmVsX29yX2JyaWRnZShkc2ksIGRz
aS0+ZGV2LT5vZl9ub2RlKTsKLQkJaWYgKHJldCkKLQkJCXJldHVybiByZXQ7Ci0KLQkJZHNpLT5k
ZXZpY2VfZm91bmQgPSB0cnVlOwotCX0KLQogCS8qIEF0dGFjaCB0aGUgcGFuZWwtYnJpZGdlIHRv
IHRoZSBkc2kgYnJpZGdlICovCiAJcmV0dXJuIGRybV9icmlkZ2VfYXR0YWNoKGJyaWRnZS0+ZW5j
b2RlciwgZHNpLT5wYW5lbF9icmlkZ2UsIGJyaWRnZSwKIAkJCQkgZmxhZ3MpOwpAQCAtMTIwOCw3
ICsxMTgxLDYgQEAgX19kd19taXBpX2RzaV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpw
ZGV2LAogI2lmZGVmIENPTkZJR19PRgogCWRzaS0+YnJpZGdlLm9mX25vZGUgPSBwZGV2LT5kZXYu
b2Zfbm9kZTsKICNlbmRpZgotCWRybV9icmlkZ2VfYWRkKCZkc2ktPmJyaWRnZSk7CiAKIAlyZXR1
cm4gZHNpOwogfQotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
