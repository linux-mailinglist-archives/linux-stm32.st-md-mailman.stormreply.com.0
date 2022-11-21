Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B1ABF631A9F
	for <lists+linux-stm32@lfdr.de>; Mon, 21 Nov 2022 08:49:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 764A3C65E5D;
	Mon, 21 Nov 2022 07:49:14 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A4B13C6507B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Nov 2022 01:55:13 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id h23so6377457edj.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 20 Nov 2022 17:55:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s0ctC1HBzrEcX8aGCkBsEcMDXbkMcvKFankt1AR6uBI=;
 b=oVCf0dBaQRUO/gNISGiOEDyHf8reuBaW9Oxyg1O/ZGzHJ5YXsDFXnlrjsLPEDwA6iY
 1B7mGDWxJ73VNrrjyOjgUsSs92kTyc1G+XG6xfKt8nIxEdr2ZKDUlJtfN5QVy8BuTwsB
 9W7b/HerQrh81GVwJAMabl6TMfsl4lII31gonekpYq4KqggIGhhtGRRpcONaqIi23c3b
 oY2+tgIg7Q+TrwHZZDGupOXL81I5c5UaOpUX50ra50fhIwuTU5EQhHYy3whJew9KFPoe
 ri6ovgIpdlKPxqR//i7BF56aNDfWijWLOfoMcDoFQ4b4rroG1R4N5oF0FOaq2x9eZivn
 oRXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s0ctC1HBzrEcX8aGCkBsEcMDXbkMcvKFankt1AR6uBI=;
 b=m3sIOpPVR2bJZ/I0q0dkDscF7p5YSOfIBvgcRkL3b6KT9aFhS7vdFPZVQdJFxbofxY
 zeVrYQ1y3dBE2pR6ySvFmjfIrjwu4fGB2swDs5uv1xpd69CZrhwSSB0GrkNyO96c48xW
 tmMcK0NgKlkyZ3wAtzbIZLFk0emUiALVtDjdxzz0k/EWEnQuYZ7JiAC2c7kmAHIvusvC
 99DJnI+Dc04j5jasmJKA15YTydsns2FBvbLZMTcJm0v7oL9av5QIBI8Wm7MGY2EoPHeE
 hdWlZF00Snq8mclYtMXFCEkV0LgG8aRzjp9R4f2MFsttffGWr0LByoWbrV/drcfv9bIl
 c+Og==
X-Gm-Message-State: ANoB5pmdu1ly5LywQeiP17whmxjiS0Q8eBAZiIjAL4TyEG7JOIUN40J7
 2iVn4cw0bE+oo/lCLWpTsQgJRg==
X-Google-Smtp-Source: AA0mqf5nzqeHeQ0W8nAAWBt3HPWJvXZEGRmFHyAZn6AsruvHH8sia9+rdRmozi+VGBC6564aCklRpw==
X-Received: by 2002:a05:6402:294d:b0:467:6b55:3cf5 with SMTP id
 ed13-20020a056402294d00b004676b553cf5mr14476119edb.22.1668995713305; 
 Sun, 20 Nov 2022 17:55:13 -0800 (PST)
Received: from c64.fritz.box ([2a01:2a8:8108:8301:7643:bec8:f62b:b074])
 by smtp.gmail.com with ESMTPSA id
 g2-20020a170906538200b00782e3cf7277sm4415513ejo.120.2022.11.20.17.55.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Nov 2022 17:55:13 -0800 (PST)
From: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To: devicetree@vger.kernel.org
Date: Mon, 21 Nov 2022 02:54:50 +0100
Message-Id: <20221121015451.2471196-9-bero@baylibre.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221121015451.2471196-1-bero@baylibre.com>
References: <20221121015451.2471196-1-bero@baylibre.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 21 Nov 2022 07:49:11 +0000
Cc: khilman@baylibre.com, krzysztof.kozlowski@linaro.org,
 linux-mediatek@lists.infradead.org, mcoquelin.stm32@gmail.com,
 matthias.bgg@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 8/9] dt-bindings: pinctrl: mediatek,
	mt65xx: Drop the pins-are-numbered property
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

RHJvcCB0aGUgcGlucy1hcmUtbnVtYmVyZWQgcHJvcGVydHkgZnJvbSB0aGUgTWVkaWF0ZWsgTVQ2
NXh4IERldmljZVRyZWUKc2NoZW1hCgpTaWduZWQtb2ZmLWJ5OiBCZXJuaGFyZCBSb3Nlbmtyw6Ru
emVyIDxiZXJvQGJheWxpYnJlLmNvbT4KLS0tCiAuLi4vYmluZGluZ3MvcGluY3RybC9tZWRpYXRl
ayxtdDY1eHgtcGluY3RybC55YW1sICAgICAgICAgICB8IDYgLS0tLS0tCiAxIGZpbGUgY2hhbmdl
ZCwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvcGluY3RybC9tZWRpYXRlayxtdDY1eHgtcGluY3RybC55YW1sIGIvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BpbmN0cmwvbWVkaWF0ZWssbXQ2NXh4LXBpbmN0cmwu
eWFtbAppbmRleCBjY2E5Y2M1OGE2OTM0Li5jYjQ1MGRhNDllNmU5IDEwMDY0NAotLS0gYS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGluY3RybC9tZWRpYXRlayxtdDY1eHgtcGlu
Y3RybC55YW1sCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waW5jdHJs
L21lZGlhdGVrLG10NjV4eC1waW5jdHJsLnlhbWwKQEAgLTI4LDExICsyOCw2IEBAIHByb3BlcnRp
ZXM6CiAgIHJlZzoKICAgICBtYXhJdGVtczogMQogCi0gIHBpbnMtYXJlLW51bWJlcmVkOgotICAg
ICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL2ZsYWcKLSAgICBkZXNjcmlw
dGlvbjogfAotICAgICAgU3BlY2lmeSB0aGUgc3Vibm9kZXMgYXJlIHVzaW5nIG51bWJlcmVkIHBp
bm11eCB0byBzcGVjaWZ5IHBpbnMuCi0KICAgZ3Bpby1jb250cm9sbGVyOiB0cnVlCiAKICAgIiNn
cGlvLWNlbGxzIjoKQEAgLTE0OSw3ICsxNDQsNiBAQCBleGFtcGxlczoKICAgICAgICAgICBjb21w
YXRpYmxlID0gIm1lZGlhdGVrLG10ODEzNS1waW5jdHJsIjsKICAgICAgICAgICByZWcgPSA8MCAw
eDEwMDBCMDAwIDAgMHgxMDAwPjsKICAgICAgICAgICBtZWRpYXRlayxwY3RsLXJlZ21hcCA9IDwm
c3lzY2ZnX3BjdGxfYT4sIDwmc3lzY2ZnX3BjdGxfYj47Ci0gICAgICAgICAgcGlucy1hcmUtbnVt
YmVyZWQ7CiAgICAgICAgICAgZ3Bpby1jb250cm9sbGVyOwogICAgICAgICAgICNncGlvLWNlbGxz
ID0gPDI+OwogICAgICAgICAgIGludGVycnVwdC1jb250cm9sbGVyOwotLSAKMi4zOC4xCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBt
YWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRw
czovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1z
dG0zMgo=
