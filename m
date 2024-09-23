Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3E697E852
	for <lists+linux-stm32@lfdr.de>; Mon, 23 Sep 2024 11:15:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 70ECCC78006;
	Mon, 23 Sep 2024 09:15:21 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C305BC78002
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Sep 2024 09:15:14 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-2f75129b3a3so39561601fa.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Sep 2024 02:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727082914; x=1727687714;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l9Bx3i72WLmyjAwVDpDo7xamY2Wn7yIoE8/sEWQgZJU=;
 b=XVT7p8w13EurCdRfILls5m8Jci7HPeJ9NxQ9UDbE/hrYXn0d6sMgPJKD1wiQnwlURz
 Y8FWv/QUBzHubLGUYFc8E5kaY9u/9sNnfbI37XsY9tzwtLWWrHc7Gp2qnf0O+4Wx2EGS
 xtwZEyLThuogdoTDN2QCg8y7jgHWrVc+op/sgyma+fgPrjn9V8a/aLQrIY3fb7h+ESMx
 k50zOP+8lM+c31oAxzEoFS/1J8EsIxR+HrnVD9vhWUsn1NVViH6vNzOH3/R7JhFZzpIs
 aI4gcGUSipBmyp9oqxayRUc//GgyKj7gEoymatYAo2pUHoqXJDZBuA6pigZha/TkhMln
 qM4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727082914; x=1727687714;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=l9Bx3i72WLmyjAwVDpDo7xamY2Wn7yIoE8/sEWQgZJU=;
 b=LFOEE+1LoFoTwV1nuCO+VK+1xrw33drdiPN9wwX/936u977aF/gc3PxH0ZZJmrkbaZ
 s+7sUOFscRqQVsHtfs2K1a76/Fns3D9vffq3Izpd9XZwj1Yy4w4HQECoij35GesfmhZp
 9aEj3qEtClkO0OZ7oe43uxlJg4TaLQZ6/Yw6Uk4w1vNqOWlz7nyu9OhKYeOtoDkoOj7C
 4jCxRxU5VIMkUp2dipnx6vmXKumdHw3ueK3N6Rgat332DyXE1gskoxv0rdDqensxVxXP
 u5Np2ghPQQtNMoAKkjuXf70isDPdffHVt4T3FMwO7QVhSp7wqTmgNdOY4euAmquq0rjv
 wvhQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6aNS3YeaGafTZOh12eBnhvrb7DqQ2GjO3mA4MqLKxBxEAtH4pAUW2q/k8/o0r4OrpBHmyETCD97RYnw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yxiqt3gL6YBltL/ahoWVPeiaupfCBs1eBSYucTjqqEM7UhDhmyl
 AI2RDcx7Oy4JtNn60D5sxloP1x5kHhWt381Ww/2SiUdgK0ghFCpcSKpMmBq3v+acdB9iGzkEoMK
 htvlgAFs4EeKrw9VZt7K6YyeMPjIUAQwMFYVSLQ==
X-Google-Smtp-Source: AGHT+IGm9GYGA96TsHIKMdbS8Ksl+Y69UudH4mPSC68ZSc5eoQB7wn4Q3RxtR+3CXYd3V8oySBmv3CffJB4G3FFeKZ8=
X-Received: by 2002:a05:6512:10cb:b0:536:2337:7de6 with SMTP id
 2adb3069b0e04-536ac2f5b22mr4443437e87.34.1727082913853; Mon, 23 Sep 2024
 02:15:13 -0700 (PDT)
MIME-Version: 1.0
References: <20240906100326.624445-1-make24@iscas.ac.cn>
In-Reply-To: <20240906100326.624445-1-make24@iscas.ac.cn>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 23 Sep 2024 11:15:03 +0200
Message-ID: <CACRpkdYEH+xEeD+pCpe_LPotaWp95X38NHouP4746bww3-hzXQ@mail.gmail.com>
To: Ma Ke <make24@iscas.ac.cn>
Cc: s.shtylyov@omp.ru, akpm@linux-foundation.org,
 bartosz.golaszewski@linaro.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-gpio@vger.kernel.org, mcoquelin.stm32@gmail.com, peng.fan@nxp.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3] pinctrl: stm32: check devm_kasprintf()
	returned value
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

T24gRnJpLCBTZXAgNiwgMjAyNCBhdCAxMjowM+KAr1BNIE1hIEtlIDxtYWtlMjRAaXNjYXMuYWMu
Y24+IHdyb3RlOgoKPiBkZXZtX2thc3ByaW50ZigpIGNhbiByZXR1cm4gYSBOVUxMIHBvaW50ZXIg
b24gZmFpbHVyZSBidXQgdGhpcyByZXR1cm5lZAo+IHZhbHVlIGlzIG5vdCBjaGVja2VkLiBGaXgg
dGhpcyBsYWNrIGFuZCBjaGVjayB0aGUgcmV0dXJuZWQgdmFsdWUuCj4KPiBGb3VuZCBieSBjb2Rl
IHJldmlldy4KPgo+IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnCj4gRml4ZXM6IDMyYzE3MGZm
MTViMCAoInBpbmN0cmw6IHN0bTMyOiBzZXQgZGVmYXVsdCBncGlvIGxpbmUgbmFtZXMgdXNpbmcg
cGluIG5hbWVzIikKPiBTaWduZWQtb2ZmLWJ5OiBNYSBLZSA8bWFrZTI0QGlzY2FzLmFjLmNuPgoK
UGF0Y2ggYXBwbGllZCBmb3IgZml4ZXMuCgpUaGFua3MgZm9yIHdvcmtpbmcgb24gdGhlc2UgbWFs
bG9jIGRldGFpbHMsIG11Y2ggYXBwcmVjaWF0ZWQhCgpZb3VycywKTGludXMgV2FsbGVpagpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBt
YWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRw
czovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1z
dG0zMgo=
