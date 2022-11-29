Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C32763B7EA
	for <lists+linux-stm32@lfdr.de>; Tue, 29 Nov 2022 03:34:09 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4BE66C65E60;
	Tue, 29 Nov 2022 02:34:09 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8DD15C65E6D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Nov 2022 02:34:06 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id b2so14224995eja.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Nov 2022 18:34:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q1wkbH4Fwaa8TmYZ/6/PrOawCFc3B7G23QtdfVs16J4=;
 b=XBccz8PXofY6f+tvbfXJrE132NfvQoLMkwiFtRpevRN5WX0sRKgnZiT9zFFG5hQghR
 4tOp9yBdOYbBkBz2fmgfp1fMHhVyHIQuwO2sH7bRmY282S9LxuRzgXhgVujROSqykY3N
 7whmBNi8M8RWGzTcgVwQoqew0uq7O8ll+LStP/zaHkDNt1YrKiGLbub4Kclu/imI8z8/
 OzjGID039MbTWBFAoR9VyqRuPis4qjyNfmPt7CopqM6UQTzs8hMXP4WGL50gvkz1r7nr
 QMrZFup1DAxMS8peRNEkpnhYZyEqhlA5XIcJlnUocIcNHIlI7+NjmG2UqzRG2M4TVZg2
 Tzag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Q1wkbH4Fwaa8TmYZ/6/PrOawCFc3B7G23QtdfVs16J4=;
 b=22RMAifO7hxeX6Ol68879INGrzTOGuGp7ICXePOIG9Yt2mZQVhfhUS5xtii065xnpM
 pWEOFVYEoGzygcpS2AXQGXAOBKSAn2gzczSX0q5P785FNX7nPcrX2YBYgMLQDEW4+8TK
 67G1dnOuQ/BDLg/12OpNACE/P4TFQ6t0TgApAnfg5xIuz85+DkRfFbRbS68zMDOhrmJV
 yaqbZabTilLGG1N0TdARIGujqRsU+6G7jSjM/cuBSfXUS5SSBtD//oCQUDnTLJqF4i9H
 LonOaxYhglE7TcVNMMMCj1Cef/mLtjW3K2YAiMPXt3KyDFSwP7cy9LivAPvwF0+DzoSW
 ICjw==
X-Gm-Message-State: ANoB5pla05z4vcDJ3ZDJO03UJGkES+0iEhrs1pdD0U3HFBebhjFAqe/9
 i3n7XCdG6K0OLNes3oixcVM47w==
X-Google-Smtp-Source: AA0mqf49fk527w7g9GqZ/PawNHpaqWh+mthJxsBRUu/tjzjEI2+aP48+dmF5anMP67j4bdYS7fcWYw==
X-Received: by 2002:a17:906:1445:b0:7a1:6786:444f with SMTP id
 q5-20020a170906144500b007a16786444fmr29233592ejc.409.1669689246257; 
 Mon, 28 Nov 2022 18:34:06 -0800 (PST)
Received: from c64.fritz.box ([81.221.122.240])
 by smtp.gmail.com with ESMTPSA id
 a4-20020aa7d744000000b004615f7495e0sm5733817eds.8.2022.11.28.18.34.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Nov 2022 18:34:05 -0800 (PST)
From: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To: devicetree@vger.kernel.org
Date: Tue, 29 Nov 2022 03:33:57 +0100
Message-Id: <20221129023401.278780-4-bero@baylibre.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221129023401.278780-1-bero@baylibre.com>
References: <20221129023401.278780-1-bero@baylibre.com>
MIME-Version: 1.0
Cc: khilman@baylibre.com, linus.walleij@linaro.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 krzysztof.kozlowski@linaro.org, linux-mediatek@lists.infradead.org,
 mcoquelin.stm32@gmail.com, matthias.bgg@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com
Subject: [Linux-stm32] [PATCH v3 3/7] dt-bindings: pinctrl: mediatek,
	mt65xx: Deprecate pins-are-numbered
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

TWFrZSBwaW5zLWFyZS1udW1iZXJlZCBvcHRpb25hbCBhbmQgZGVwcmVjYXRlIGl0CgpTaWduZWQt
b2ZmLWJ5OiBCZXJuaGFyZCBSb3Nlbmtyw6RuemVyIDxiZXJvQGJheWxpYnJlLmNvbT4KUmV2aWV3
ZWQtYnk6IE1hdHRoaWFzIEJydWdnZXIgPG1hdHRoaWFzLmJnZ0BnbWFpbC5jb20+CkFja2VkLWJ5
OiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+Ci0t
LQogLi4uL2RldmljZXRyZWUvYmluZGluZ3MvcGluY3RybC9tZWRpYXRlayxtdDY1eHgtcGluY3Ry
bC55YW1sIHwgNSArKy0tLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMyBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
cGluY3RybC9tZWRpYXRlayxtdDY1eHgtcGluY3RybC55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL3BpbmN0cmwvbWVkaWF0ZWssbXQ2NXh4LXBpbmN0cmwueWFtbAppbmRl
eCAzM2I1Zjc5ZTc0MWFiLi4xYjQ0MzM1YjFlOTQ3IDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvcGluY3RybC9tZWRpYXRlayxtdDY1eHgtcGluY3RybC55YW1s
CisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waW5jdHJsL21lZGlhdGVr
LG10NjV4eC1waW5jdHJsLnlhbWwKQEAgLTMxLDcgKzMxLDggQEAgcHJvcGVydGllczoKICAgcGlu
cy1hcmUtbnVtYmVyZWQ6CiAgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlv
bnMvZmxhZwogICAgIGRlc2NyaXB0aW9uOiB8Ci0gICAgICBTcGVjaWZ5IHRoZSBzdWJub2RlcyBh
cmUgdXNpbmcgbnVtYmVyZWQgcGlubXV4IHRvIHNwZWNpZnkgcGlucy4KKyAgICAgIFNwZWNpZnkg
dGhlIHN1Ym5vZGVzIGFyZSB1c2luZyBudW1iZXJlZCBwaW5tdXggdG8gc3BlY2lmeSBwaW5zLiAo
VU5VU0VEKQorICAgIGRlcHJlY2F0ZWQ6IHRydWUKIAogICBncGlvLWNvbnRyb2xsZXI6IHRydWUK
IApAQCAtNjIsNyArNjMsNiBAQCBwcm9wZXJ0aWVzOgogCiByZXF1aXJlZDoKICAgLSBjb21wYXRp
YmxlCi0gIC0gcGlucy1hcmUtbnVtYmVyZWQKICAgLSBncGlvLWNvbnRyb2xsZXIKICAgLSAiI2dw
aW8tY2VsbHMiCiAKQEAgLTE1MCw3ICsxNTAsNiBAQCBleGFtcGxlczoKICAgICAgICAgICBjb21w
YXRpYmxlID0gIm1lZGlhdGVrLG10ODEzNS1waW5jdHJsIjsKICAgICAgICAgICByZWcgPSA8MCAw
eDEwMDBCMDAwIDAgMHgxMDAwPjsKICAgICAgICAgICBtZWRpYXRlayxwY3RsLXJlZ21hcCA9IDwm
c3lzY2ZnX3BjdGxfYT4sIDwmc3lzY2ZnX3BjdGxfYj47Ci0gICAgICAgICAgcGlucy1hcmUtbnVt
YmVyZWQ7CiAgICAgICAgICAgZ3Bpby1jb250cm9sbGVyOwogICAgICAgICAgICNncGlvLWNlbGxz
ID0gPDI+OwogICAgICAgICAgIGludGVycnVwdC1jb250cm9sbGVyOwotLSAKMi4zOC4xCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBt
YWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRw
czovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1z
dG0zMgo=
