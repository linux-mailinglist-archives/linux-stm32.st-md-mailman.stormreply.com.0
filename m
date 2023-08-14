Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BFEE177B9F8
	for <lists+linux-stm32@lfdr.de>; Mon, 14 Aug 2023 15:28:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 82AC6C6B479;
	Mon, 14 Aug 2023 13:28:56 +0000 (UTC)
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com
 [209.85.218.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2F39FC6B478
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Aug 2023 13:28:55 +0000 (UTC)
Received: by mail-ej1-f65.google.com with SMTP id
 a640c23a62f3a-99357737980so576580366b.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Aug 2023 06:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1692019735; x=1692624535;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XdPyv6Fu9+Y66puo5x11N4oIzMH43gN51/s59ClZHmA=;
 b=IuSnIBz6z82KUjtI6wiKj8hJa4qftmemd9mgMzAI8h4Fv1kKPo/PALBaB1etMp0+fL
 g9B6+R4et7rMOQeiLPpqPatGThPnvfTBcOExV/MYm4EA0QtAOJV3H9QQUDF840RuySA7
 NfCiwGniqosro+lHICC4CutCFEeVaYoc+qF9c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692019735; x=1692624535;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XdPyv6Fu9+Y66puo5x11N4oIzMH43gN51/s59ClZHmA=;
 b=Lh9keYstPAn9e12ZYqQPwMrwQdI9u+29VKP6CG1YOqsUMmopniuhP44v0+KmkzzuCX
 zy/Qt68w6ExTccG/2ZBj6UzmzbUg2qqWA5j7V7szGkoUB3hi2j+HULDf06L1NAuDlIaE
 oxDR5qYreQfjFgSZr6BUCZ9rAjR+JsYO3RoTlNYAEhSYNsXC98sU3aYUdy1r9VpBo8Hx
 rANvOnNqp4X/G004ByluY3CrN8lW3dBagGIBk5wGlYDDtJs//hFR46pr/15k9+yjjgYt
 JjyZYnO3XOglkruTLgqRlDkDtnQT/4yq72hj2EDbey1xgfVile1pwhxjYeatl70u2Ddz
 4Iug==
X-Gm-Message-State: AOJu0Yxabd35ZMtbRMf6HJlKuzZ02Bw0lvNTsf9EantNE/BExSbVapq7
 A4xHZsyvASji9oDndEK9EESKEg==
X-Google-Smtp-Source: AGHT+IGFjehVMqUTz4FbuoG5ps0I4stw/UjQAKeX7ZcjzJkQpFgCENcR7WDugJj6HQ82X4gP+YQRew==
X-Received: by 2002:a17:906:9ca:b0:99c:441:ffa with SMTP id
 r10-20020a17090609ca00b0099c04410ffamr7926229eje.29.1692019734816; 
 Mon, 14 Aug 2023 06:28:54 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-80-180-23-204.pool80180.interbusiness.it. [80.180.23.204])
 by smtp.gmail.com with ESMTPSA id
 e3-20020a170906248300b0099d02ca4327sm5662066ejb.54.2023.08.14.06.28.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Aug 2023 06:28:54 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Mon, 14 Aug 2023 15:28:44 +0200
Message-Id: <20230814132844.113312-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230814132844.113312-1-dario.binacchi@amarulasolutions.com>
References: <20230814132844.113312-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 michael@amarulasolutions.com,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v8 4/4] ARM: dts: stm32: support display on
	stm32f746-disco board
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

QWRkIHN1cHBvcnQgdG8gUm9ja3RlY2ggUkswNDNGTjQ4SCBkaXNwbGF5IG9uIHN0bTMyZjc0Ni1k
aXNjbyBib2FyZC4KClNpZ25lZC1vZmYtYnk6IERhcmlvIEJpbmFjY2hpIDxkYXJpby5iaW5hY2No
aUBhbWFydWxhc29sdXRpb25zLmNvbT4KUmV2aWV3ZWQtYnk6IFJhcGhhw6tsIEdhbGxhaXMtUG91
IDxyYXBoYWVsLmdhbGxhaXMtcG91QGZvc3Muc3QuY29tPgoKLS0tCgpDaGFuZ2VzIGluIHY4Ogot
IEFkZCB0aGUgJ3Bvd2VyLXN1cHBseScgcHJvcGVydHkgdG8gcGFuZWwtcmdiIG5vZGUuCi0gTW92
ZSBiYWNrbGlnaHQgYW5kIHBhbmVsLXJnYiBub2RlcyBhZnRlciB0aGUgdmNjLTN2MyBub2RlLgoK
Q2hhbmdlcyBpbiB2NzoKLSBBZGQgJ1Jldmlld2VkLWJ5JyB0YWdzIEkgZm9yZ290IGluIHY2Lgog
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWFybS1rZXJuZWwvMjAyMzA2MjkwODM3MjYu
ODQ5MTAtMS1kYXJpby5iaW5hY2NoaUBhbWFydWxhc29sdXRpb25zLmNvbS9ULwotIEFkZCAnUmV2
aWV3ZWQtYnknIHRhZyBJIGZvcmdvdCBpbiB2Ni4KICBodHRwczovL2xvcmUua2VybmVsLm9yZy9s
aW51eC1hcm0ta2VybmVsLzIwMjMwNjI5MDgzNzI2Ljg0OTEwLTEtZGFyaW8uYmluYWNjaGlAYW1h
cnVsYXNvbHV0aW9ucy5jb20vVC8KCkNoYW5nZXMgaW4gdjY6Ci0gUmVtb3ZlIGRtYSBub2RlcyBm
cm9tIHN0bTMyZjc0Ni1kaXNjby5kdHMsIHRoZXkgYXJlIG5vdCB1c2VkIGJ5IExUREMsCiAgc28g
dGhlcmUgaXMgbm8gbmVlZCB0byBlbmFibGUgdGhlbS4KCkNoYW5nZXMgaW4gdjU6CkkgYW0gY29u
ZmlkZW50IHRoYXQgZnJhbWVidWZmZXIgc2l6aW5nIGlzIGEgcmVhbCByZXF1aXJlbWVudCBmb3Ig
U1RNMzIgYm9hcmRzLApidXQgSSBuZWVkIHNvbWUgdGltZSB0byB1bmRlcnN0YW5kIGlmIGFuZCBo
b3cgdG8gaW50cm9kdWNlIHRoaXMgZnVuY3Rpb25hbGl0eS4KVGhlcmVmb3JlLCBJIGRyb3AgdGhl
IGZvbGxvd2luZyBwYXRjaGVzIHRvIGFsbG93IHRoZSBzZXJpZXMgdG8gYmUgZnVsbHkgbWVyZ2Vk
OgogLSBbNC82XSBkdC1iaW5kaW5nczogZGlzcGxheTogc3RtMzItbHRkYzogYWRkIG9wdGlvbmFs
IHN0LGZiLWJwcCBwcm9wZXJ0eQogLSBbNS82XSBBUk06IGR0czogc3RtMzI6IHNldCBmcmFtZWJ1
ZmZlciBiaXQgZGVwdGggb24gc3RtMzJmNzQ2LWRpc2NvCiAtIFs2LzZdIGRybS9zdG06IHNldCBm
cmFtZWJ1ZmZlciBiaXQgZGVwdGggdGhyb3VnaCBEVFMgcHJvcGVydHkKCkNoYW5nZXMgaW4gdjQ6
Ci0gVXNlIERUUyBwcm9wZXJ0eSBpbnN0ZWFkIG9mIG1vZHVsZSBwYXJhbWV0ZXIgdG8gc2V0IHRo
ZSBmcmFtZWJ1ZmZlciBiaXQgZGVwdGguCgpDaGFuZ2VzIGluIHYzOgotIGRyb3AgWzQvNl0gZHQt
YmluZGluZ3M6IGRpc3BsYXk6IHNpbXBsZTogYWRkIFJvY2t0ZWNoIFJLMDQzRk40OEgKICBBcHBs
aWVkIHRvIGh0dHBzOi8vYW5vbmdpdC5mcmVlZGVza3RvcC5vcmcvZ2l0L2RybS9kcm0tbWlzYy5n
aXQgKGRybS1taXNjLW5leHQpOgogIGh0dHBzOi8vY2dpdC5mcmVlZGVza3RvcC5vcmcvZHJtL2Ry
bS1taXNjL2NvbW1pdC8/aWQ9YzQyYTM3YTI3Yzc3N2Q2Mzk2MWRkNjM0YTMwZjdjODg3OTQ5NDkx
YQotIGRyb3AgWzUvNl0gZHJtL3BhbmVsOiBzaW1wbGU6IGFkZCBzdXBwb3J0IGZvciBSb2NrdGVj
aCBSSzA0M0ZONDhIIHBhbmVsCiAgQXBwbGllZCB0byBodHRwczovL2Fub25naXQuZnJlZWRlc2t0
b3Aub3JnL2dpdC9kcm0vZHJtLW1pc2MuZ2l0IChkcm0tbWlzYy1uZXh0KQogIGh0dHBzOi8vY2dp
dC5mcmVlZGVza3RvcC5vcmcvZHJtL2RybS1taXNjL2NvbW1pdC8/aWQ9MTNjZGQxMmE5ZjkzNDE1
OGY0ZWM4MTdjZjA0OGZjYjQzODRhYTlkYwoKIGFyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMyZjc0
Ni1kaXNjby5kdHMgfCA0NCArKysrKysrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2Vk
LCA0NCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvc3Qvc3Rt
MzJmNzQ2LWRpc2NvLmR0cyBiL2FyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMyZjc0Ni1kaXNjby5k
dHMKaW5kZXggNGU3ODUwMzliYTVhLi5iZjkxZjZiMWMwZjMgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJt
L2Jvb3QvZHRzL3N0L3N0bTMyZjc0Ni1kaXNjby5kdHMKKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMv
c3Qvc3RtMzJmNzQ2LWRpc2NvLmR0cwpAQCAtNjAsNiArNjAsMTkgQEAgbWVtb3J5QGMwMDAwMDAw
IHsKIAkJcmVnID0gPDB4QzAwMDAwMDAgMHg4MDAwMDA+OwogCX07CiAKKwlyZXNlcnZlZC1tZW1v
cnkgeworCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsKKwkJI3NpemUtY2VsbHMgPSA8MT47CisJCXJh
bmdlczsKKworCQlsaW51eCxjbWEgeworCQkJY29tcGF0aWJsZSA9ICJzaGFyZWQtZG1hLXBvb2wi
OworCQkJbm8tbWFwOworCQkJc2l6ZSA9IDwweDgwMDAwPjsKKwkJCWxpbnV4LGRtYS1kZWZhdWx0
OworCQl9OworCX07CisKIAlhbGlhc2VzIHsKIAkJc2VyaWFsMCA9ICZ1c2FydDE7CiAJfTsKQEAg
LTg1LDYgKzk4LDI1IEBAIHZjY18zdjM6IHZjYy0zdjMgewogCQlyZWd1bGF0b3ItbWluLW1pY3Jv
dm9sdCA9IDwzMzAwMDAwPjsKIAkJcmVndWxhdG9yLW1heC1taWNyb3ZvbHQgPSA8MzMwMDAwMD47
CiAJfTsKKworCWJhY2tsaWdodDogYmFja2xpZ2h0IHsKKwkJY29tcGF0aWJsZSA9ICJncGlvLWJh
Y2tsaWdodCI7CisJCWdwaW9zID0gPCZncGlvayAzIEdQSU9fQUNUSVZFX0hJR0g+OworCQlzdGF0
dXMgPSAib2theSI7CisJfTsKKworCXBhbmVsX3JnYjogcGFuZWwtcmdiIHsKKwkJY29tcGF0aWJs
ZSA9ICJyb2NrdGVjaCxyazA0M2ZuNDhoIjsKKwkJcG93ZXItc3VwcGx5ID0gPCZ2Y2NfM3YzPjsK
KwkJYmFja2xpZ2h0ID0gPCZiYWNrbGlnaHQ+OworCQllbmFibGUtZ3Bpb3MgPSA8JmdwaW9pIDEy
IEdQSU9fQUNUSVZFX0hJR0g+OworCQlzdGF0dXMgPSAib2theSI7CisJCXBvcnQgeworCQkJcGFu
ZWxfaW5fcmdiOiBlbmRwb2ludCB7CisJCQkJcmVtb3RlLWVuZHBvaW50ID0gPCZsdGRjX291dF9y
Z2I+OworCQkJfTsKKwkJfTsKKwl9OwogfTsKIAogJmNsa19oc2UgewpAQCAtOTksNiArMTMxLDE4
IEBAICZpMmMxIHsKIAlzdGF0dXMgPSAib2theSI7CiB9OwogCismbHRkYyB7CisJcGluY3RybC0w
ID0gPCZsdGRjX3BpbnNfYT47CisJcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsKKwlzdGF0dXMg
PSAib2theSI7CisKKwlwb3J0IHsKKwkJbHRkY19vdXRfcmdiOiBlbmRwb2ludCB7CisJCQlyZW1v
dGUtZW5kcG9pbnQgPSA8JnBhbmVsX2luX3JnYj47CisJCX07CisJfTsKK307CisKICZzZGlvMSB7
CiAJc3RhdHVzID0gIm9rYXkiOwogCXZtbWMtc3VwcGx5ID0gPCZ2Y2NfM3YzPjsKLS0gCjIuMzQu
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
c3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8v
bGludXgtc3RtMzIK
