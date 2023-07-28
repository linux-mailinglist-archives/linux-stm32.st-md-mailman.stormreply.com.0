Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF7E76642E
	for <lists+linux-stm32@lfdr.de>; Fri, 28 Jul 2023 08:34:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 32AE3C6B465;
	Fri, 28 Jul 2023 06:34:28 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A7F66C6B463
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Jul 2023 06:34:26 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-51de9c2bc77so2212773a12.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Jul 2023 23:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1690526066; x=1691130866;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x4zfk9+w42D4Vl03+U/DigAoB0zXZh0Gh/1uuAJ0hLQ=;
 b=coD2+ErD1H/tMiWFxYbwD3Apev1+9aIZlthe+ztq56bfnfXpmVs8LMwr64b3MY2U1a
 oF6wJrG/o0Eduv4oKOZywDGBQ4zqrofs0hX5dNl/+y9TezfNxlLuAFhIv4lGE+W+MRBV
 sYoj8QzbajZeb5hGULBH0zSd2zcTAzjPUN8FE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690526066; x=1691130866;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=x4zfk9+w42D4Vl03+U/DigAoB0zXZh0Gh/1uuAJ0hLQ=;
 b=ivtVI5ZKUKXUIasheeNaBriBhZTaq5bOZEBeJOxx59eM/x1oq7f6hLjLxAkOzUkyCS
 f0XpN9PA3/UMnhop/95c0gZfumw2C0WbgGwzAk5PdmXmQ2NjuN05x64Pllr/YuUfyQk8
 /HBP03FLn4kcnO/T8d2hTaoQ6GnwZNDJ9OJtW4+dx1MJNNsjDbjFbmEDzbmgdO/5sX2F
 FJO8h+TeW9jYIz1dt7vPKQFL099VJTg1REs+A6zODCxjnDo4t6Riqh3uyOw5y4CF266S
 UON+tJhb2MRT7CAGd6L5lRw2fcJKuA+uUhkvajL+51WjhERKb73mRtFl40s7ZIsGx0ww
 l6cA==
X-Gm-Message-State: ABy/qLbM/9/GtN7xIAvVngB/vKeKyUx21j3P23e/TA3kXD/g4uQfQ9Ye
 V8CXQz4PkQIj2Zj7L4gsU8sIpQ==
X-Google-Smtp-Source: APBJJlExcM9nsUMinTrlbRyT2/HWEEoSamyFcmaPaQEvX5nWwoO/D+suXZBHBjXeV/Vd57iiM5ytww==
X-Received: by 2002:aa7:d847:0:b0:520:f5dd:3335 with SMTP id
 f7-20020aa7d847000000b00520f5dd3335mr928262eds.41.1690526066222; 
 Thu, 27 Jul 2023 23:34:26 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-95-232-62-70.retail.telecomitalia.it. [95.232.62.70])
 by smtp.gmail.com with ESMTPSA id
 n21-20020aa7d055000000b0051e26c7a154sm1425057edo.18.2023.07.27.23.34.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 23:34:25 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Fri, 28 Jul 2023 08:34:16 +0200
Message-Id: <20230728063417.2980091-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230728063417.2980091-1-dario.binacchi@amarulasolutions.com>
References: <20230728063417.2980091-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 michael@amarulasolutions.com,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v7 3/3] ARM: dts: stm32: support display on
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
IDxyYXBoYWVsLmdhbGxhaXMtcG91QGZvc3Muc3QuY29tPgoKLS0tCgpDaGFuZ2VzIGluIHY3Ogot
IEFkZCAnUmV2aWV3ZWQtYnknIHRhZyBJIGZvcmdvdCBpbiB2Ni4KICBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9saW51eC1hcm0ta2VybmVsLzIwMjMwNjI5MDgzNzI2Ljg0OTEwLTEtZGFyaW8uYmlu
YWNjaGlAYW1hcnVsYXNvbHV0aW9ucy5jb20vVC8KCkNoYW5nZXMgaW4gdjY6Ci0gUmVtb3ZlIGRt
YSBub2RlcyBmcm9tIHN0bTMyZjc0Ni1kaXNjby5kdHMsIHRoZXkgYXJlIG5vdCB1c2VkIGJ5IExU
REMsCiAgc28gdGhlcmUgaXMgbm8gbmVlZCB0byBlbmFibGUgdGhlbS4KCkNoYW5nZXMgaW4gdjU6
CkkgYW0gY29uZmlkZW50IHRoYXQgZnJhbWVidWZmZXIgc2l6aW5nIGlzIGEgcmVhbCByZXF1aXJl
bWVudCBmb3IgU1RNMzIgYm9hcmRzLApidXQgSSBuZWVkIHNvbWUgdGltZSB0byB1bmRlcnN0YW5k
IGlmIGFuZCBob3cgdG8gaW50cm9kdWNlIHRoaXMgZnVuY3Rpb25hbGl0eS4KVGhlcmVmb3JlLCBJ
IGRyb3AgdGhlIGZvbGxvd2luZyBwYXRjaGVzIHRvIGFsbG93IHRoZSBzZXJpZXMgdG8gYmUgZnVs
bHkgbWVyZ2VkOgogLSBbNC82XSBkdC1iaW5kaW5nczogZGlzcGxheTogc3RtMzItbHRkYzogYWRk
IG9wdGlvbmFsIHN0LGZiLWJwcCBwcm9wZXJ0eQogLSBbNS82XSBBUk06IGR0czogc3RtMzI6IHNl
dCBmcmFtZWJ1ZmZlciBiaXQgZGVwdGggb24gc3RtMzJmNzQ2LWRpc2NvCiAtIFs2LzZdIGRybS9z
dG06IHNldCBmcmFtZWJ1ZmZlciBiaXQgZGVwdGggdGhyb3VnaCBEVFMgcHJvcGVydHkKCkNoYW5n
ZXMgaW4gdjQ6Ci0gVXNlIERUUyBwcm9wZXJ0eSBpbnN0ZWFkIG9mIG1vZHVsZSBwYXJhbWV0ZXIg
dG8gc2V0IHRoZSBmcmFtZWJ1ZmZlciBiaXQgZGVwdGguCgpDaGFuZ2VzIGluIHYzOgotIGRyb3Ag
WzQvNl0gZHQtYmluZGluZ3M6IGRpc3BsYXk6IHNpbXBsZTogYWRkIFJvY2t0ZWNoIFJLMDQzRk40
OEgKICBBcHBsaWVkIHRvIGh0dHBzOi8vYW5vbmdpdC5mcmVlZGVza3RvcC5vcmcvZ2l0L2RybS9k
cm0tbWlzYy5naXQgKGRybS1taXNjLW5leHQpOgogIGh0dHBzOi8vY2dpdC5mcmVlZGVza3RvcC5v
cmcvZHJtL2RybS1taXNjL2NvbW1pdC8/aWQ9YzQyYTM3YTI3Yzc3N2Q2Mzk2MWRkNjM0YTMwZjdj
ODg3OTQ5NDkxYQotIGRyb3AgWzUvNl0gZHJtL3BhbmVsOiBzaW1wbGU6IGFkZCBzdXBwb3J0IGZv
ciBSb2NrdGVjaCBSSzA0M0ZONDhIIHBhbmVsCiAgQXBwbGllZCB0byBodHRwczovL2Fub25naXQu
ZnJlZWRlc2t0b3Aub3JnL2dpdC9kcm0vZHJtLW1pc2MuZ2l0IChkcm0tbWlzYy1uZXh0KQogIGh0
dHBzOi8vY2dpdC5mcmVlZGVza3RvcC5vcmcvZHJtL2RybS1taXNjL2NvbW1pdC8/aWQ9MTNjZGQx
MmE5ZjkzNDE1OGY0ZWM4MTdjZjA0OGZjYjQzODRhYTlkYwoKIGFyY2gvYXJtL2Jvb3QvZHRzL3N0
L3N0bTMyZjc0Ni1kaXNjby5kdHMgfCA0MyArKysrKysrKysrKysrKysrKysrKysrKysKIDEgZmls
ZSBjaGFuZ2VkLCA0MyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9k
dHMvc3Qvc3RtMzJmNzQ2LWRpc2NvLmR0cyBiL2FyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMyZjc0
Ni1kaXNjby5kdHMKaW5kZXggYzExNjE2ZWQ1ZmM2Li5jMDBkMzQxNzllMmUgMTAwNjQ0Ci0tLSBh
L2FyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMyZjc0Ni1kaXNjby5kdHMKKysrIGIvYXJjaC9hcm0v
Ym9vdC9kdHMvc3Qvc3RtMzJmNzQ2LWRpc2NvLmR0cwpAQCAtNjAsMTAgKzYwLDQxIEBAIG1lbW9y
eUBjMDAwMDAwMCB7CiAJCXJlZyA9IDwweEMwMDAwMDAwIDB4ODAwMDAwPjsKIAl9OwogCisJcmVz
ZXJ2ZWQtbWVtb3J5IHsKKwkJI2FkZHJlc3MtY2VsbHMgPSA8MT47CisJCSNzaXplLWNlbGxzID0g
PDE+OworCQlyYW5nZXM7CisKKwkJbGludXgsY21hIHsKKwkJCWNvbXBhdGlibGUgPSAic2hhcmVk
LWRtYS1wb29sIjsKKwkJCW5vLW1hcDsKKwkJCXNpemUgPSA8MHg4MDAwMD47CisJCQlsaW51eCxk
bWEtZGVmYXVsdDsKKwkJfTsKKwl9OworCiAJYWxpYXNlcyB7CiAJCXNlcmlhbDAgPSAmdXNhcnQx
OwogCX07CiAKKwliYWNrbGlnaHQ6IGJhY2tsaWdodCB7CisJCWNvbXBhdGlibGUgPSAiZ3Bpby1i
YWNrbGlnaHQiOworCQlncGlvcyA9IDwmZ3Bpb2sgMyBHUElPX0FDVElWRV9ISUdIPjsKKwkJc3Rh
dHVzID0gIm9rYXkiOworCX07CisKKwlwYW5lbF9yZ2I6IHBhbmVsLXJnYiB7CisJCWNvbXBhdGli
bGUgPSAicm9ja3RlY2gscmswNDNmbjQ4aCI7CisJCWJhY2tsaWdodCA9IDwmYmFja2xpZ2h0PjsK
KwkJZW5hYmxlLWdwaW9zID0gPCZncGlvaSAxMiBHUElPX0FDVElWRV9ISUdIPjsKKwkJc3RhdHVz
ID0gIm9rYXkiOworCQlwb3J0IHsKKwkJCXBhbmVsX2luX3JnYjogZW5kcG9pbnQgeworCQkJCXJl
bW90ZS1lbmRwb2ludCA9IDwmbHRkY19vdXRfcmdiPjsKKwkJCX07CisJCX07CisJfTsKKwogCXVz
Ym90Z19oc19waHk6IHVzYi1waHkgewogCQkjcGh5LWNlbGxzID0gPDA+OwogCQljb21wYXRpYmxl
ID0gInVzYi1ub3AteGNlaXYiOwpAQCAtOTksNiArMTMwLDE4IEBAICZpMmMxIHsKIAlzdGF0dXMg
PSAib2theSI7CiB9OwogCismbHRkYyB7CisJcGluY3RybC0wID0gPCZsdGRjX3BpbnNfYT47CisJ
cGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsKKwlzdGF0dXMgPSAib2theSI7CisKKwlwb3J0IHsK
KwkJbHRkY19vdXRfcmdiOiBlbmRwb2ludCB7CisJCQlyZW1vdGUtZW5kcG9pbnQgPSA8JnBhbmVs
X2luX3JnYj47CisJCX07CisJfTsKK307CisKICZzZGlvMSB7CiAJc3RhdHVzID0gIm9rYXkiOwog
CXZtbWMtc3VwcGx5ID0gPCZtbWNfdmNhcmQ+OwotLSAKMi4zNC4xCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QK
TGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
