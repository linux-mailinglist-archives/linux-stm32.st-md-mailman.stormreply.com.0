Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EC356AE4140
	for <lists+linux-stm32@lfdr.de>; Mon, 23 Jun 2025 14:56:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9BC6AC32E8D;
	Mon, 23 Jun 2025 12:56:46 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E07BEC36B2E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Jun 2025 12:56:44 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-553b544e7b4so4278822e87.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Jun 2025 05:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750683404; x=1751288204;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8/PYDyDKGZYKEGjVXXHlyij22R64l8wztxMeZv4XmnE=;
 b=HC5svrmzUJVjBCctS1zolQAMfFnX9hLuhTfkmsP+2EwLjVtd3HC/u+ATJAxfmOGGxb
 5VuH8R6ddmD5zWusn+sPVLt7Ovd7KF/PlsHZP+Nwyi7DrVQWKBDfk7dtgyMdjSULIPoD
 Ey5QNQ5nuvyaqGs9Zyc2l+OyA6g+fzqPZQTFRVXew8SHTYF/PI/RVXzxmuwfT1KG0kN0
 hlvgodAqp8ySOhlt5N4WNl/QZKI2VXwGX8cgbnKmJ3Khu2GG6aZVFK+9/FGGmRU6idOI
 ikCUOHkmCZTQSvdcuflNwcTpAzqI134tM5UB4dk5vLJQgf7hvmMmdyxreaAiKsR2NqqR
 pkVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750683404; x=1751288204;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8/PYDyDKGZYKEGjVXXHlyij22R64l8wztxMeZv4XmnE=;
 b=uG2YtYXnSZIRkIdgborsfdPFUGd7zw3QNOrE5NYaPXhjJlqO8ybEdf1ITe9NjAJqsx
 aJXjxOyVirYN7MWXmIWFeGNAQIOTsGzsaY0Edc+3aly5vDdMq/UYgbCYqfEXNWNyNvgd
 oeOl340vfJcypVcyBlxKlPRgMyct6dFMR66evm+hNza2u3/aJEtQmwkD5X/VfNBMi95U
 yffpEtFZkYN7ZXtFqNTQrCs74L4vnkmOgYbZNWx1DyY2yW6sbF9z8PbCTfqrctmxbU0j
 OPWdp6O/2Wr7rApJ9Pk9xVgPC2y9pepGA+rfHAkSJmQzoshMblo9+B3+4guo9HdUcq1o
 2now==
X-Forwarded-Encrypted: i=1;
 AJvYcCUBQiblG4N0fajq0voWG7auJcxnHDFaV7dR+yjHegc/lIc6G0oJvdWlKBjcq2kSYUrXDFkoexjDYhLWYA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyKLXPmb3Unsi9wnPT4dmi/WZ/8xMayK14vVsnG+DFMfhrGDqP1
 ZCNvMGobHQKkleAjx0gC/BiR8QIXkvOftmW2ZK/D+MFyroiO10ucirkf5LC1uQA50F0axGbnChU
 LxwGS6AqoqqrNHjGPT/WhQ8Q847ve9Ro=
X-Gm-Gg: ASbGncuRQ/qEtIIRZPCgVF0sxkPUpIDOd9YYzfKao8Bcyy2Qh4Mvtxgi5n1Kr2hSBdQ
 cxIKyaHxEswOF3dXywPnpCQ2fz9thsJbvYmt4R/j7Hc0rglAZrOxtEV4THMVWmSS5BYnHWjVUkb
 s3Hcly0qncA488OPJV3iuZzMj1VzxxGZ0hT2rNKnrqY+EC1QCRGddXicflxURK5buW9Q7xLCnv0
 ek=
X-Google-Smtp-Source: AGHT+IHVX0GlIPq3TBaQtLm46YetyZZ0s+N9/Y4hGKlfh5oMqO78Ds4mOXk6wiprWLKaWnye4Cex5x6r2Jq+usWNPy8=
X-Received: by 2002:a05:6512:159d:b0:553:ceed:c85f with SMTP id
 2adb3069b0e04-553e3bb4cbbmr3113374e87.21.1750683403609; Mon, 23 Jun 2025
 05:56:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250623095732.2139853-1-joy.zou@nxp.com>
 <20250623095732.2139853-9-joy.zou@nxp.com>
In-Reply-To: <20250623095732.2139853-9-joy.zou@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 23 Jun 2025 09:56:31 -0300
X-Gm-Features: AX0GCFuGOUHw2mx0QPMnuqMm-hZkSD1S0Ck80ClMf9fqxc9r2EVikPukaYObI_I
Message-ID: <CAOMZO5AzU03qEg80vhyU=CrgVgYt+rn=WQ7SphtADxOc5eG5tQ@mail.gmail.com>
To: Joy Zou <joy.zou@nxp.com>
Cc: imx@lists.linux.dev, ulf.hansson@linaro.org, ping.bai@nxp.com,
 catalin.marinas@arm.com, frank.li@nxp.com, edumazet@google.com,
 will@kernel.org, linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, s.hauer@pengutronix.de,
 devicetree@vger.kernel.org, conor+dt@kernel.org, ye.li@nxp.com,
 mcoquelin.stm32@gmail.com, richardcochran@gmail.com,
 linux-arm-kernel@lists.infradead.org, aisheng.dong@nxp.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch,
 kernel@pengutronix.de, krzk+dt@kernel.org, shawnguo@kernel.org,
 davem@davemloft.net, linux-pm@vger.kernel.or
Subject: Re: [Linux-stm32] [PATCH v6 8/9] pmdomain: imx93-blk-ctrl: mask DSI
 and PXP PD domain register on i.MX91
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

T24gTW9uLCBKdW4gMjMsIDIwMjUgYXQgNzowMOKAr0FNIEpveSBab3UgPGpveS56b3VAbnhwLmNv
bT4gd3JvdGU6Cgo+ICtzdGF0aWMgY29uc3Qgc3RydWN0IGlteDkzX2Jsa19jdHJsX2RhdGEgaW14
OTFfbWVkaWFfYmxrX2N0bF9kZXZfZGF0YSA9IHsKPiArICAgICAgIC5kb21haW5zID0gaW14OTNf
bWVkaWFfYmxrX2N0bF9kb21haW5fZGF0YSwKPiArICAgICAgIC5za2lwX21hc2sgPSBCSVQoSU1Y
OTNfTUVESUFCTEtfUERfTUlQSV9EU0kpIHwgQklUKElNWDkzX01FRElBQkxLX1BEX1BYUCksCj4g
KyAgICAgICAubnVtX2RvbWFpbnMgPSBBUlJBWV9TSVpFKGlteDkzX21lZGlhX2Jsa19jdGxfZG9t
YWluX2RhdGEpLAo+ICsgICAgICAgLmNsa19uYW1lcyA9IChjb25zdCBjaGFyICpbXSl7ICJheGki
LCAiYXBiIiwgIm5pYyIsIH0sCj4gKyAgICAgICAubnVtX2Nsa3MgPSAzLAoKSW5zdGVhZCBvZiBo
YXJkY29kaW5nIHRoZSBudW1iZXIgb2YgY2xvY2tzLCB3aGF0IGFib3V0IHVzaW5nCkFSUkFZX1NJ
WkUoKSBpbnN0ZWFkPwoKTGlrZSBpdCB3YXMgZG9uZSBoZXJlOgoKaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvbGludXgtYXJtLWtlcm5lbC8yMDI1MDYxOTA2MjEwOC4yMDE2NTExLTEteGlhb2xlaS53
YW5nQHdpbmRyaXZlci5jb20vCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
