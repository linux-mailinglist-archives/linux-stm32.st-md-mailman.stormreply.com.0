Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 59455766427
	for <lists+linux-stm32@lfdr.de>; Fri, 28 Jul 2023 08:34:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 16AA6C6B468;
	Fri, 28 Jul 2023 06:34:25 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CD2A7C6B45C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Jul 2023 06:34:23 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-4fdfefdf5abso2981680e87.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Jul 2023 23:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1690526063; x=1691130863;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kSb7V+l5INAZZY1BiIqNw95KAR1Jhg86zX4iEYTQuGQ=;
 b=YD4Cp6NO75tumNAqCVjMej9Rug0LbmNWvceQr0SzbwAKu2Nygozw4URutDcKKYfext
 DusewMKsW8+lLIjRK0r++OK7/20chp1hOy3DcfnF0h7ZXU9l5SJiXO8SroYMZ0xNXUri
 JT2QOSm017MWFpT6zSsy3Qzr1/5s69EccMGEA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690526063; x=1691130863;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kSb7V+l5INAZZY1BiIqNw95KAR1Jhg86zX4iEYTQuGQ=;
 b=Z2CnGZvDnHPdVqPIdWS/2oPjb94HLks1aHC1eOT3MJEWlZozXulmkGU9912Jbe7cHR
 1NlkaRyFX0hZzmZqQ8a+jGSg9jrCCIoGlYchHXaR4R+5CUv0JMYM5nZ/jVut/G0v6dGT
 I+dJfwJCMMM2Wo563BOkJHNU2n+f7b6XDyf/hY2sQB/kkL0xdo/qyBLjDsozHaewu/ZY
 qfWH+idTAKclcYLDBQuNZahWErdfFMz/ky7jjfd1biUk6vBw+AmDRmCWNDuUnsFP6aow
 HgCCg0NhJZATkPI/fwcViOf9Us6m3HfG8/E8ZSGJI4It/sFySgDE+cwZruGeDG+UFXff
 S2pw==
X-Gm-Message-State: ABy/qLY5zpQ6dq3KVVHaOf3hVuUpQx2yYTAzxERyiYWXSa7re6oH6zVE
 jUOjs0/KMYhb/ajhw2B63yb7/Q==
X-Google-Smtp-Source: APBJJlEOqWif6a+SBSBCiAAO7oieIt/NQUYY623dGOgj4qHsxvy+5BMXSEmHibFtUpg/cSz5KRNRHQ==
X-Received: by 2002:a05:6512:4007:b0:4fb:829b:196e with SMTP id
 br7-20020a056512400700b004fb829b196emr1042929lfb.2.1690526063051; 
 Thu, 27 Jul 2023 23:34:23 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-95-232-62-70.retail.telecomitalia.it. [95.232.62.70])
 by smtp.gmail.com with ESMTPSA id
 n21-20020aa7d055000000b0051e26c7a154sm1425057edo.18.2023.07.27.23.34.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 23:34:22 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Fri, 28 Jul 2023 08:34:14 +0200
Message-Id: <20230728063417.2980091-2-dario.binacchi@amarulasolutions.com>
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
Subject: [Linux-stm32] [PATCH v7 1/3] ARM: dts: stm32: add ltdc support on
	stm32f746 MCU
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

QWRkIExUREMgKExjZC10ZnQgRGlzcGxheSBDb250cm9sbGVyKSBzdXBwb3J0LgoKU2lnbmVkLW9m
Zi1ieTogRGFyaW8gQmluYWNjaGkgPGRhcmlvLmJpbmFjY2hpQGFtYXJ1bGFzb2x1dGlvbnMuY29t
PgpSZXZpZXdlZC1ieTogUmFwaGHDq2wgR2FsbGFpcy1Qb3UgPHJhcGhhZWwuZ2FsbGFpcy1wb3VA
Zm9zcy5zdC5jb20+CgotLS0KCkNoYW5nZXMgaW4gdjc6Ci0gQWRkICdSZXZpZXdlZC1ieScgdGFn
IEkgZm9yZ290IGluIHY2LgogIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWFybS1rZXJu
ZWwvMjAyMzA2MjkwODM3MjYuODQ5MTAtMS1kYXJpby5iaW5hY2NoaUBhbWFydWxhc29sdXRpb25z
LmNvbS9ULwoKIGFyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMyZjc0Ni5kdHNpIHwgMTAgKysrKysr
KysrKwogMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9hcmNo
L2FybS9ib290L2R0cy9zdC9zdG0zMmY3NDYuZHRzaSBiL2FyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0
bTMyZjc0Ni5kdHNpCmluZGV4IGQxODAyZWZkMDY3Yy4uMzZlZGExNTYyZTgzIDEwMDY0NAotLS0g
YS9hcmNoL2FybS9ib290L2R0cy9zdC9zdG0zMmY3NDYuZHRzaQorKysgYi9hcmNoL2FybS9ib290
L2R0cy9zdC9zdG0zMmY3NDYuZHRzaQpAQCAtNTA3LDYgKzUwNywxNiBAQCBwd20gewogCQkJfTsK
IAkJfTsKIAorCQlsdGRjOiBkaXNwbGF5LWNvbnRyb2xsZXJANDAwMTY4MDAgeworCQkJY29tcGF0
aWJsZSA9ICJzdCxzdG0zMi1sdGRjIjsKKwkJCXJlZyA9IDwweDQwMDE2ODAwIDB4MjAwPjsKKwkJ
CWludGVycnVwdHMgPSA8ODg+LCA8ODk+OworCQkJcmVzZXRzID0gPCZyY2MgU1RNMzJGN19BUEIy
X1JFU0VUKExUREMpPjsKKwkJCWNsb2NrcyA9IDwmcmNjIDEgQ0xLX0xDRD47CisJCQljbG9jay1u
YW1lcyA9ICJsY2QiOworCQkJc3RhdHVzID0gImRpc2FibGVkIjsKKwkJfTsKKwogCQlwd3JjZmc6
IHBvd2VyLWNvbmZpZ0A0MDAwNzAwMCB7CiAJCQljb21wYXRpYmxlID0gInN0LHN0bTMyLXBvd2Vy
LWNvbmZpZyIsICJzeXNjb24iOwogCQkJcmVnID0gPDB4NDAwMDcwMDAgMHg0MDA+OwotLSAKMi4z
NC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5m
by9saW51eC1zdG0zMgo=
