Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6241E770F10
	for <lists+linux-stm32@lfdr.de>; Sat,  5 Aug 2023 11:32:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 217B3C6B473;
	Sat,  5 Aug 2023 09:32:10 +0000 (UTC)
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com
 [209.85.218.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 04D19C6B46E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  5 Aug 2023 09:32:09 +0000 (UTC)
Received: by mail-ej1-f65.google.com with SMTP id
 a640c23a62f3a-99c4923195dso402161566b.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 05 Aug 2023 02:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1691227928; x=1691832728;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kSb7V+l5INAZZY1BiIqNw95KAR1Jhg86zX4iEYTQuGQ=;
 b=Dh2UTNNMhDdp3D18SCMzub1XDaxi9J93/+Mk33+I/zqU0B7vsfOY1ag068EeG1dWZL
 BWrBI7OwDoYOIXftTZwEQk5O6L3bFUBO/QJ983iN6Sq4TeEFzPossnTk+9TVcNAKQ0Kz
 E1VWqzbPDCO/SfNj/q99vDee5HbikKoTKlX2M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691227928; x=1691832728;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kSb7V+l5INAZZY1BiIqNw95KAR1Jhg86zX4iEYTQuGQ=;
 b=gDzx5iCqK64ZeZpbS5oWb4Jn7yQg3yexHWJWLO6GPuPLRGGLCEz12vfvteRe6mwWGJ
 i5JeZa4gWqWBtqlaAkdYzmFJMjM0L7kN0mT/TLO9mfNJ3NVvoOpT2Q4NNsOmvdcR6b4m
 crsFpNZ3rIsKgvg+k8Uq1dIbbunnKYmUngOJO4YPDvx0y6QBRkE3aD4B8R1N67i9pb1w
 2SRjiiVlEL5oEEAX7tQ+J5qqyX00mdzY0XG4mUrFiGJraDcHBWGA0UqlEi0qBGWCRCyv
 PSM1iithONIhQNOM9lKIELV3BzsfcVllRsKPqZ/kPUh3bVu96IdbAHW6eO8XzfRkko3m
 nEhA==
X-Gm-Message-State: AOJu0YytEO49cP6I0QUqdbBVKhmJOF8NNB73PJcfVbXhBtjzD+zksZUE
 V5KZPsyN31MGvX8vvZZ0VbvOew==
X-Google-Smtp-Source: AGHT+IG6tPUj15ayZgNSb6hJwTs1tpYV27gmxLpUVe4h+xaQyP0nhYgPqh/GN2YCgDMxiER80YT/Lg==
X-Received: by 2002:a17:906:31c8:b0:99b:fdbb:31f1 with SMTP id
 f8-20020a17090631c800b0099bfdbb31f1mr3922911ejf.16.1691227928673; 
 Sat, 05 Aug 2023 02:32:08 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-82-52-12-96.retail.telecomitalia.it. [82.52.12.96])
 by smtp.gmail.com with ESMTPSA id
 j15-20020a170906430f00b0099b76c3041csm2491083ejm.7.2023.08.05.02.32.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Aug 2023 02:32:08 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Sat,  5 Aug 2023 11:32:00 +0200
Message-Id: <20230805093203.3988194-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230805093203.3988194-1-dario.binacchi@amarulasolutions.com>
References: <20230805093203.3988194-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 michael@amarulasolutions.com,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [RESEND PATCH v7 1/3] ARM: dts: stm32: add ltdc
	support on stm32f746 MCU
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
