Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D826429DE
	for <lists+linux-stm32@lfdr.de>; Mon,  5 Dec 2022 14:52:11 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 441CDC65E6A;
	Mon,  5 Dec 2022 13:52:11 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 21C2AC6507A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Dec 2022 13:52:10 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id m19so8769660wms.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 05 Dec 2022 05:52:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=tY5QKpgq2/3jzaTOJQNlt/Q86yQh5wKQ2sDulmkg2KI=;
 b=IKDFAlrDyxXK2EEK+ACFA1JPj32DVH9XgXokFfk+Yxaz7H2tgkE+MwTdD0iWz34gT2
 kGu/7VCPmfBZSD0bSQi1NaquemVdzGnINllybPA3DuggEyxpLkCDportqRPdfaQdHHb5
 8vJnYNRf+kq/YfRdjhkHNSw0AComi83Du6PJCNa80DInUGelaQ5gBo2QoVGV7S9PMFQ2
 EB7xLFbfI4duQ+816dRZz5wuUf3/uwpuN7H8Us3+fwHC8B/5HI5kz5+M7AA+wMlpz6Ai
 Gn6oFyyKp5BXQ4GwQdiFZVWDv6QyBKD6PLBtb0JCCB5Q6XS/BN3XowRQqVOGV7sRNJgO
 R2Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tY5QKpgq2/3jzaTOJQNlt/Q86yQh5wKQ2sDulmkg2KI=;
 b=RwWFzRTLX7Fmi2h13nMiEhBvlN2YpNy9E3aPzXBur9eUPgBzf9EgC2ksWq1RPpP1j2
 jzG9ItodfMzDO8YgmXqMMDLvbHfjIn9ZOKeOsXlhk9lDPicAWEg202u97CTAWuLz/l0W
 3sArXjqSOiHgSJ/4gA5rVgPTcnJ3yRc7cEuUmZa7NCTV2XexMyzYWFrBLx9qID9E0j4B
 bW1bDEFsyY/2L1EOE0zSb9UseTXSfa2dcibI8I9wHOLg2Xv6omLyRdh7XzNSO4MNjtXg
 5vxjCxMvQl9KrsfdwsAsOHsJUFEykwALGWYKA75ZXCHaUG+U2l/mYfNCBn/3ggGRBhf3
 65/A==
X-Gm-Message-State: ANoB5pmvIYFje/0Wp+e2/Qp1UvhBDsS9BsMuOPLV7Rs6nMicitiO4vJt
 KnplNdbjbJw8S5WErz88rsNYuA==
X-Google-Smtp-Source: AA0mqf6QY6Tthxm6x2fqOOdM80szIi1eOKD06IVk7s/SIwGmjuxQjE19iKfLT/DaINP5IMUfgk0RLg==
X-Received: by 2002:a05:600c:4e88:b0:3b5:477:1e80 with SMTP id
 f8-20020a05600c4e8800b003b504771e80mr60778976wmq.200.1670248329707; 
 Mon, 05 Dec 2022 05:52:09 -0800 (PST)
Received: from predatorhelios.baylibre
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id
 a3-20020adffac3000000b0024245e543absm9012700wrs.88.2022.12.05.05.52.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Dec 2022 05:52:09 -0800 (PST)
From: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, krzysztof.kozlowski@linaro.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 khilman@baylibre.com, linux-gpio@vger.kernel.org
Date: Mon,  5 Dec 2022 14:51:56 +0100
Message-Id: <20221205135158.1842465-2-bero@baylibre.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221205135158.1842465-1-bero@baylibre.com>
References: <20221205135158.1842465-1-bero@baylibre.com>
MIME-Version: 1.0
Subject: [Linux-stm32] [PATCH v4 1/3] arm64: dts: mediatek: Remove
	pins-are-numbered property
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

UmVtb3ZlIHRoZSB1bm5lY2Vzc2FyeSBwaW5zLWFyZS1udW1iZXJlZCBwcm9wZXJ0eSBmcm9tCmFy
bTY0IE1lZGlhdGVrIERldmljZVRyZWVzCgpTaWduZWQtb2ZmLWJ5OiBCZXJuaGFyZCBSb3Nlbmty
w6RuemVyIDxiZXJvQGJheWxpYnJlLmNvbT4KUmV2aWV3ZWQtYnk6IEFuZ2Vsb0dpb2FjY2hpbm8g
RGVsIFJlZ25vIDxhbmdlbG9naW9hY2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5jb20+CkFja2Vk
LWJ5OiBLZXZpbiBIaWxtYW4gPGtoaWxtYW5AYmF5bGlicmUuY29tPgotLS0KIGFyY2gvYXJtNjQv
Ym9vdC9kdHMvbWVkaWF0ZWsvbXQyNzEyZS5kdHNpICAgIHwgMSAtCiBhcmNoL2FybTY0L2Jvb3Qv
ZHRzL21lZGlhdGVrL210ODE2Ny5kdHNpICAgICB8IDEgLQogYXJjaC9hcm02NC9ib290L2R0cy9t
ZWRpYXRlay9tdDgxNzMtZWxtLmR0c2kgfCAxIC0KIGFyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0
ZWsvbXQ4MTczLmR0c2kgICAgIHwgMSAtCiBhcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210
ODUxNi5kdHNpICAgICB8IDEgLQogNSBmaWxlcyBjaGFuZ2VkLCA1IGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQyNzEyZS5kdHNpIGIvYXJj
aC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDI3MTJlLmR0c2kKaW5kZXggOTIyMTJjZGRkMzdl
Ni4uODc5ZGZmMjRkY2QzYiAxMDA2NDQKLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRl
ay9tdDI3MTJlLmR0c2kKKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDI3MTJl
LmR0c2kKQEAgLTI3MCw3ICsyNzAsNiBAQCBwaW86IHBpbmN0cmxAMTAwMGIwMDAgewogCQljb21w
YXRpYmxlID0gIm1lZGlhdGVrLG10MjcxMi1waW5jdHJsIjsKIAkJcmVnID0gPDAgMHgxMDAwYjAw
MCAwIDB4MTAwMD47CiAJCW1lZGlhdGVrLHBjdGwtcmVnbWFwID0gPCZzeXNjZmdfcGN0bF9hPjsK
LQkJcGlucy1hcmUtbnVtYmVyZWQ7CiAJCWdwaW8tY29udHJvbGxlcjsKIAkJI2dwaW8tY2VsbHMg
PSA8Mj47CiAJCWludGVycnVwdC1jb250cm9sbGVyOwpkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9i
b290L2R0cy9tZWRpYXRlay9tdDgxNjcuZHRzaSBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0
ZWsvbXQ4MTY3LmR0c2kKaW5kZXggZmJlMWExMTI4Y2M2YS4uNmE1NDMxNWNmNjUwMiAxMDA2NDQK
LS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxNjcuZHRzaQorKysgYi9hcmNo
L2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE2Ny5kdHNpCkBAIC0xMTcsNyArMTE3LDYgQEAg
cGlvOiBwaW5jdHJsQDEwMDBiMDAwIHsKIAkJCWNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTY3
LXBpbmN0cmwiOwogCQkJcmVnID0gPDAgMHgxMDAwYjAwMCAwIDB4MTAwMD47CiAJCQltZWRpYXRl
ayxwY3RsLXJlZ21hcCA9IDwmc3lzY2ZnX3BjdGw+OwotCQkJcGlucy1hcmUtbnVtYmVyZWQ7CiAJ
CQlncGlvLWNvbnRyb2xsZXI7CiAJCQkjZ3Bpby1jZWxscyA9IDwyPjsKIAkJCWludGVycnVwdC1j
b250cm9sbGVyOwpkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgx
NzMtZWxtLmR0c2kgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE3My1lbG0uZHRz
aQppbmRleCBlMjFmZWI4NWQ4MjJiLi4xOGUyMTQ0NjRhMmQzIDEwMDY0NAotLS0gYS9hcmNoL2Fy
bTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE3My1lbG0uZHRzaQorKysgYi9hcmNoL2FybTY0L2Jv
b3QvZHRzL21lZGlhdGVrL210ODE3My1lbG0uZHRzaQpAQCAtOTI5LDcgKzkyOSw2IEBAIGNsb2Nr
OiBtdDYzOTdjbG9jayB7CiAKIAkJcGlvNjM5NzogcGluY3RybCB7CiAJCQljb21wYXRpYmxlID0g
Im1lZGlhdGVrLG10NjM5Ny1waW5jdHJsIjsKLQkJCXBpbnMtYXJlLW51bWJlcmVkOwogCQkJZ3Bp
by1jb250cm9sbGVyOwogCQkJI2dwaW8tY2VsbHMgPSA8Mj47CiAJCX07CmRpZmYgLS1naXQgYS9h
cmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE3My5kdHNpIGIvYXJjaC9hcm02NC9ib290
L2R0cy9tZWRpYXRlay9tdDgxNzMuZHRzaQppbmRleCA3NjQwYjUxNThmZjlkLi5jNDdkN2Q5MDBm
MjgzIDEwMDY0NAotLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE3My5kdHNp
CisrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTczLmR0c2kKQEAgLTM3NSw3
ICszNzUsNiBAQCBwaW86IHBpbmN0cmxAMTAwMGIwMDAgewogCQkJY29tcGF0aWJsZSA9ICJtZWRp
YXRlayxtdDgxNzMtcGluY3RybCI7CiAJCQlyZWcgPSA8MCAweDEwMDBiMDAwIDAgMHgxMDAwPjsK
IAkJCW1lZGlhdGVrLHBjdGwtcmVnbWFwID0gPCZzeXNjZmdfcGN0bF9hPjsKLQkJCXBpbnMtYXJl
LW51bWJlcmVkOwogCQkJZ3Bpby1jb250cm9sbGVyOwogCQkJI2dwaW8tY2VsbHMgPSA8Mj47CiAJ
CQlpbnRlcnJ1cHQtY29udHJvbGxlcjsKZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMv
bWVkaWF0ZWsvbXQ4NTE2LmR0c2kgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODUx
Ni5kdHNpCmluZGV4IGQxYjY3YzgyZDc2MTcuLjExODAyNTI2M2EyOWIgMTAwNjQ0Ci0tLSBhL2Fy
Y2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4NTE2LmR0c2kKKysrIGIvYXJjaC9hcm02NC9i
b290L2R0cy9tZWRpYXRlay9tdDg1MTYuZHRzaQpAQCAtMjI5LDcgKzIyOSw2IEBAIHBpbzogcGlu
Y3RybEAxMDAwYjAwMCB7CiAJCQljb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODUxNi1waW5jdHJs
IjsKIAkJCXJlZyA9IDwwIDB4MTAwMGIwMDAgMCAweDEwMDA+OwogCQkJbWVkaWF0ZWsscGN0bC1y
ZWdtYXAgPSA8JnN5c2NmZ19wY3RsPjsKLQkJCXBpbnMtYXJlLW51bWJlcmVkOwogCQkJZ3Bpby1j
b250cm9sbGVyOwogCQkJI2dwaW8tY2VsbHMgPSA8Mj47CiAJCQlpbnRlcnJ1cHQtY29udHJvbGxl
cjsKLS0gCjIuMzguMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxt
YW4vbGlzdGluZm8vbGludXgtc3RtMzIK
