Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EFE50ACEFD9
	for <lists+linux-stm32@lfdr.de>; Thu,  5 Jun 2025 15:02:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9DF62C32EB5;
	Thu,  5 Jun 2025 13:02:59 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 84853C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Jun 2025 13:02:58 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-553331c3dc7so917801e87.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 05 Jun 2025 06:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1749128577; x=1749733377;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PVT5EJpM+m1cOTQkhZPkhfUXOCLKAPtm4dYD8NRnSuE=;
 b=EsLVb7S1Co9n4K1JTdHlCDf6UFqelOfP6+GukyWE18IteudAb7FlPyLyAqX6ISA32e
 OJnsmy9tw72jBkAABoFTTlVccKKCfLsZmDxfsbnzqvT8AJUI8dKQpXHQ89yjmDJdhLdO
 sswwrkFrwQ6JIrZcC379/6VO8G4uq7MyUbhXGwzBAM+WjYGSopMdrd199mZjhlBUQC6L
 K44m6HqwfcirkhReGZh571bt+zSE6WlWmAOT6TR/J+SmsZxKmIDqvSGfKZTDPVFiG6mT
 PGTTGE3fYR2Y0YlPbSOs206vJm3qP5Iu0wgnHBok53fAcmeztKhB3e5JN1+6pJeOVMZ7
 YNWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749128577; x=1749733377;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PVT5EJpM+m1cOTQkhZPkhfUXOCLKAPtm4dYD8NRnSuE=;
 b=oDo7ZWXrKylw79tbuPSnrS4XhZiZ3S1dsHnCReHP8HUI8m+Vax0/dsY1KKBw+OgfW9
 i/FbCiByKA6q/aSd4y3IF+/DE11aHbmxZW8LRTMf9vLvx+EuTOkMkbClxHtg3cDdAaG3
 ZcuPBAOwUyn5YP1yZ+hnS2wl3yvbP1ZH5VMMuQbRjZ1podFi1CpwkNqS55HkrncG3yc9
 oFYVm7ClWHs+EUWSAMlrp2Ik5ujFwrvZr9fAZgz3qK4sFqK2JfKNhyDlY4jySbBb2h7Q
 2kD+s5kaVEnPZDqIidRxDSpRe64nTsUIm/o4YoLvOYu5dIlud5pohkRsEKLiO9IBeR3b
 XqCQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVSHLFNwEmEn9udUjZdJyHMzxH6NskWFB2deWVV6YdKR8rBEDOWPNLEb9dUH9xmhUg29tlzCrFBYE9wVg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzBVJz06mOF5HTaT64NeWL4n6WOoAQTe7vgKYWfKBnS+rA3k7H9
 vfhZrYp3Dz5VOBFiTP4GNuTQBLLdWxbc0Gauyu/RRz6sLKEG7pgQxXQWygG7FEvXuIV8ZYeBidc
 tT8B5S2C3vOjaiPvbz8xH4u/fBhm89ICsVM/1qVs5kw==
X-Gm-Gg: ASbGncuiN4igjGuLzYF7spXG8v+Di0BbsVKlOREbjEp8T2AqrBEz2X/1CkQ6M7RdXHr
 ZwmT+XWKW5JgaFvJmPHaI+RmDuvSWXkwA5CvrSEe+X8eVwmjm43IH4mRT6Qkmb6kDLh9IOmsVvg
 Bo4wOeu2ZfN+FaY9J7//FQK4YGCMOgvqHq
X-Google-Smtp-Source: AGHT+IEtlN9LmFKCqkTfr1fMDsTcWr6BPb/SNfXLFckAF9Sr8ZXGsmd9lFBvMAQkVfe0s88El5iAUEXMpQYKE5AAkEc=
X-Received: by 2002:a05:6512:3043:b0:553:5283:980f with SMTP id
 2adb3069b0e04-55356df2aeemr2183360e87.51.1749128577147; Thu, 05 Jun 2025
 06:02:57 -0700 (PDT)
MIME-Version: 1.0
References: <20250528-hdp-upstream-v4-0-7e9b3ad2036d@foss.st.com>
 <20250528-hdp-upstream-v4-3-7e9b3ad2036d@foss.st.com>
In-Reply-To: <20250528-hdp-upstream-v4-3-7e9b3ad2036d@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 5 Jun 2025 15:02:45 +0200
X-Gm-Features: AX0GCFun0Zlf8oI1kptxrVzEZHeoQoovvg-1R2vISTKQmzQE4bFTIdqUSf5gGUc
Message-ID: <CACRpkdZsyUR6_Rbxcbs-yUUm=U9UKGCuFp7kmmogqsUAxzTZuw@mail.gmail.com>
To: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4 3/9] pinctrl: stm32: Introduce HDP
	driver
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

T24gV2VkLCBNYXkgMjgsIDIwMjUgYXQgMzozM+KAr1BNIENsw6ltZW50IExlIEdvZmZpYwo8Y2xl
bWVudC5sZWdvZmZpY0Bmb3NzLnN0LmNvbT4gd3JvdGU6Cgo+IFRoaXMgcGF0Y2ggaW50cm9kdWNl
IHRoZSBkcml2ZXIgZm9yIHRoZSBIYXJkd2FyZSBEZWJ1ZyBQb3J0IGF2YWlsYWJsZSBvbgo+IFNU
TTMyTVAgcGxhdGZvcm1zLiBUaGUgSERQIGFsbG93cyB0aGUgb2JzZXJ2YXRpb24gb2YgaW50ZXJu
YWwgU29DCj4gc2lnbmFscyBieSB1c2luZyBtdWx0aXBsZXhlcnMuIEVhY2ggSERQIHBvcnQgY2Fu
IHByb3ZpZGUgdXAgdG8gMTYKPiBpbnRlcm5hbCBzaWduYWxzIChvbmUgb2YgdGhlbSBjYW4gYmUg
c29mdHdhcmUgY29udHJvbGxlZCBhcyBhIEdQTykuCj4KPiBTaWduZWQtb2ZmLWJ5OiBDbMOpbWVu
dCBMZSBHb2ZmaWMgPGNsZW1lbnQubGVnb2ZmaWNAZm9zcy5zdC5jb20+CgpSZXZpZXdlZC1ieTog
TGludXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPgoKWW91cnMsCkxpbnVzIFdh
bGxlaWoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtc3RtMzIK
