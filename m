Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9466677B9F5
	for <lists+linux-stm32@lfdr.de>; Mon, 14 Aug 2023 15:28:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 592F8C6B477;
	Mon, 14 Aug 2023 13:28:51 +0000 (UTC)
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com
 [209.85.218.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 862BFC6B475
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Aug 2023 13:28:50 +0000 (UTC)
Received: by mail-ej1-f65.google.com with SMTP id
 a640c23a62f3a-99bf3f59905so576829566b.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Aug 2023 06:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1692019730; x=1692624530;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hi+e70M73VVW2/UtI8fzsCmgrtCHD4hmR1usrA9vrWg=;
 b=hRjTej0q1SmXQ7RxhrPKq8YxYbEMwHfR0pOBtW0MqlX96YJDiK3xC8512YI5hhW9YH
 G+I4elnqAjpQG7Sf/wlM+p8Mh3ySSN7OoT8aXmXFSy0fZ32DsfVBgrTPesgabKvqxqT0
 5v6z9pIF4LORwWFmKVpX4kX+Uh4n9Ejgs5Hdc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692019730; x=1692624530;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hi+e70M73VVW2/UtI8fzsCmgrtCHD4hmR1usrA9vrWg=;
 b=anIJkThxcU9aU8zs/ZzMMxMuIR2SDmT6IGnACzlw3ALngHUcnp4eGPP+FWMuO8p0N5
 xPXdXmTnjKPUuMWgrBJi1dg6cHuXx3jnC88cYngKlsrhwwXp21gSi9y15BnabVDAG+ea
 QX1OpMzBspgtZWZw0NjQziKrbAnFJOWBn+9Urh1tTF/j7dl4UeeepC4UXXHa97vvpol5
 3YcxvYtcmRzMVSR2sanI1aTDNCf6nFiMA6GGEEWdOqx5GDkpext28mxqGk8ixvpEc4fM
 F5OYxkq06XvH0xx+M3rDiy3qJphBIOSwTD+whSvklXC0kScCcJsLmeB8dXJRhM4pUcT+
 ihAA==
X-Gm-Message-State: AOJu0YwhDKIh2dtudpdIrdq+/x/Y+tZIQ4d47LSaJxib2dC8mUlIQJHk
 76rVIECHo0IP0Z6yl54AX6qlhQ==
X-Google-Smtp-Source: AGHT+IHrCP+Ek6oNlG/yQRyJ8LYtU5jUKojVKzaEqEERLy+EkTSqFiav5MqrYVecHq8cJE7AIwBDng==
X-Received: by 2002:a17:907:2c47:b0:99c:980:d551 with SMTP id
 hf7-20020a1709072c4700b0099c0980d551mr7499548ejc.50.1692019729998; 
 Mon, 14 Aug 2023 06:28:49 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-80-180-23-204.pool80180.interbusiness.it. [80.180.23.204])
 by smtp.gmail.com with ESMTPSA id
 e3-20020a170906248300b0099d02ca4327sm5662066ejb.54.2023.08.14.06.28.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Aug 2023 06:28:49 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Mon, 14 Aug 2023 15:28:41 +0200
Message-Id: <20230814132844.113312-2-dario.binacchi@amarulasolutions.com>
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
Subject: [Linux-stm32] [PATCH v8 1/4] ARM: dts: stm32: add ltdc support on
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
Zm9zcy5zdC5jb20+CgotLS0KCihubyBjaGFuZ2VzIHNpbmNlIHY3KQoKQ2hhbmdlcyBpbiB2NzoK
LSBBZGQgJ1Jldmlld2VkLWJ5JyB0YWcgSSBmb3Jnb3QgaW4gdjYuCiAgaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvbGludXgtYXJtLWtlcm5lbC8yMDIzMDYyOTA4MzcyNi44NDkxMC0xLWRhcmlvLmJp
bmFjY2hpQGFtYXJ1bGFzb2x1dGlvbnMuY29tL1QvCgogYXJjaC9hcm0vYm9vdC9kdHMvc3Qvc3Rt
MzJmNzQ2LmR0c2kgfCAxMCArKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9u
cygrKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMyZjc0Ni5kdHNpIGIv
YXJjaC9hcm0vYm9vdC9kdHMvc3Qvc3RtMzJmNzQ2LmR0c2kKaW5kZXggZDE4MDJlZmQwNjdjLi4z
NmVkYTE1NjJlODMgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMyZjc0Ni5k
dHNpCisrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMyZjc0Ni5kdHNpCkBAIC01MDcsNiAr
NTA3LDE2IEBAIHB3bSB7CiAJCQl9OwogCQl9OwogCisJCWx0ZGM6IGRpc3BsYXktY29udHJvbGxl
ckA0MDAxNjgwMCB7CisJCQljb21wYXRpYmxlID0gInN0LHN0bTMyLWx0ZGMiOworCQkJcmVnID0g
PDB4NDAwMTY4MDAgMHgyMDA+OworCQkJaW50ZXJydXB0cyA9IDw4OD4sIDw4OT47CisJCQlyZXNl
dHMgPSA8JnJjYyBTVE0zMkY3X0FQQjJfUkVTRVQoTFREQyk+OworCQkJY2xvY2tzID0gPCZyY2Mg
MSBDTEtfTENEPjsKKwkJCWNsb2NrLW5hbWVzID0gImxjZCI7CisJCQlzdGF0dXMgPSAiZGlzYWJs
ZWQiOworCQl9OworCiAJCXB3cmNmZzogcG93ZXItY29uZmlnQDQwMDA3MDAwIHsKIAkJCWNvbXBh
dGlibGUgPSAic3Qsc3RtMzItcG93ZXItY29uZmlnIiwgInN5c2NvbiI7CiAJCQlyZWcgPSA8MHg0
MDAwNzAwMCAweDQwMD47Ci0tIAoyLjM0LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBz
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
