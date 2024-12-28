Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 67BD79FDC6C
	for <lists+linux-stm32@lfdr.de>; Sat, 28 Dec 2024 23:55:30 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 09DDDC78032;
	Sat, 28 Dec 2024 22:55:30 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0A57EC78030
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 28 Dec 2024 22:55:22 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-303489e8775so90653351fa.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 28 Dec 2024 14:55:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735426521; x=1736031321;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ma5+6x4L6RmgRS3yZ8s305V7iJUxY/Vzh6XEkM9c4sU=;
 b=gh5jb2Pb8G3/4sole3x6d9+lzVxOnWoFYBv4CAOZAqf2pbmQMViBWQSMdoPjfw25dj
 DZU9YPPyBrftBR0KcE1hqjRMX1bIOn2Z/PrS9gv+13TySWU8FKtk/PtBrMwWu/baRS8m
 tLFqvjzL4Wus9Zmq6bjka35TPl+l/cP+6aZtL1IFK7HQWluRyyjv4pq0Rnm/n86ltBsi
 n84wvdcWBieLz+MYeXcqqkPgA5m58e5tOjEgY9Qhu+YkUpRArtfhBasCdRZlSNAXAdq/
 GhXxzN1k9dlgiPIuSXjE34Wm9XOQXylz11iGvWbG42Qt/uDB2xRyL8QAYfre3USvG712
 4Biw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735426521; x=1736031321;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ma5+6x4L6RmgRS3yZ8s305V7iJUxY/Vzh6XEkM9c4sU=;
 b=WzuydOofUbGC5dwn+lHZaGdBcUZPSVA62GkyRlEmzPKc9mkVnC6fVkHUSzNxLy6+Hy
 UM/a7N8X4pCn7MjBWQZFhNbla8oNFyrzN6+2Eaofw9QEsq6h/klwZk4S/oLepAjhiMOv
 Ru53HUhLujAn0OssFmznI/8i3gC6MpQzZnz/1NfCCwedYzcjKulHOe0LIZT7a5Yh1t/F
 mjg4EFfCbmR2qm6COfClqPscTbSDHdpmgiEV4GaTSzGi0wrWxNu0eX4tVRGuHgJagYKu
 JVbO2g8sSm+bComgvjGJo3/ZWAy4b2dlNwehvepKoddtaBNnLkjYajExDpqzmcP2MC1J
 90mg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX1Ebf7P2d1NHdgEJ5QDhpHBgpY1TNDIte2M5QbsJ3q7cv+wndZAuYGDih/l1TRb5MidY/owZ+P3JDlSw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx7wLREJb2rAmqO5nohbTlMjsBJ0E2N50ejiW3iRaSl4K+tSL17
 NCGbXzonhZzRWiRKG0/W9aG9R4AipGyk/KVa0YDlBy9MDs3Cm0k1+KjWlVcKNc918PvP0jAGme8
 oHh2rQ2G6dbjW6fEGTzEXDqVWFsj8ekZW2fC+zw==
X-Gm-Gg: ASbGncvLpfyCBUsKakimrOCO9UjVo7iwxMDHJVszH86QoaB33O0JWUkO1yZnc4ncpoR
 EsE1GMqlhWmQ3i8mDIcNveOzsgCr/nTIglT6K
X-Google-Smtp-Source: AGHT+IEeHS7qBCOkGJkLci2K1l4MO3cQjjPsp4mJA4mp2Fct0kochwX6HgM8ASkaZLPLeUe5QHN30KZL6jeoExuit3I=
X-Received: by 2002:a05:6512:ba6:b0:540:2160:ade3 with SMTP id
 2adb3069b0e04-5422953c19cmr7875781e87.25.1735426521162; Sat, 28 Dec 2024
 14:55:21 -0800 (PST)
MIME-Version: 1.0
References: <20241228-wake_irq-v1-0-09cfca77cd47@nxp.com>
 <20241228-wake_irq-v1-10-09cfca77cd47@nxp.com>
In-Reply-To: <20241228-wake_irq-v1-10-09cfca77cd47@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 28 Dec 2024 23:55:10 +0100
Message-ID: <CACRpkdYaWTdOoLXcpWG92+OyRwsPMxMbhQ6djdzO07x0sPz4oQ@mail.gmail.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: linux-rtc@vger.kernel.org, Len Brown <len.brown@intel.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Peng Fan <peng.fan@nxp.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-pm@vger.kernel.org,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 Conor Dooley <conor.dooley@microchip.com>, Pavel Machek <pavel@ucw.cz>,
 linux-input@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 10/12] rtc: ab8500: Use resource managed
	API to simplify code
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

T24gU2F0LCBEZWMgMjgsIDIwMjQgYXQgMjoxNuKAr0FNIFBlbmcgRmFuIChPU1MpIDxwZW5nLmZh
bkBvc3MubnhwLmNvbT4gd3JvdGU6Cgo+IEZyb206IFBlbmcgRmFuIDxwZW5nLmZhbkBueHAuY29t
Pgo+Cj4gVXNlIGRldm1fcG1fc2V0X3dha2VfaXJxIGFuZCBkZXZtX2RldmljZV9pbml0X3dha2V1
cCB0byBjbGVhbnVwIHRoZQo+IGVycm9yIGhhbmRsaW5nIGNvZGUgYW5kICdkcml2ZXIucmVtb3Zl
KCknIGhvb2suCj4KPiBTaWduZWQtb2ZmLWJ5OiBQZW5nIEZhbiA8cGVuZy5mYW5AbnhwLmNvbT4K
ClRoaXMgbG9va3MgdmVyeSBuaWNlIHByb3ZpZGVkIHRoZSBjb3JlIGNvZGUgaXMgbWVyZ2VkLgpS
ZXZpZXdlZC1ieTogTGludXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPgoKWW91
cnMsCkxpbnVzIFdhbGxlaWoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21h
aWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
