Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA8B966C1C
	for <lists+linux-stm32@lfdr.de>; Sat, 31 Aug 2024 00:12:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2B98DC6C841;
	Fri, 30 Aug 2024 22:12:12 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0DF36CFAC50
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 30 Aug 2024 22:12:05 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-5344ab30508so3166141e87.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 30 Aug 2024 15:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725055924; x=1725660724;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Rwh8M6A1//w3NduZYo3bZPoTmO8CDMDW24C3pIoKiLU=;
 b=vyGtSYm+N5QBjelCMQurJUdnls3+FImuOZLbFLi1dSfRmrCWqbCEXeMmw72/lvmFuJ
 44a69HReQ3Fm3n4LXCW5FdO5mR904C+wPlung//A+aJLngzUXla4F+v08838PsosSBfN
 ++SUqC8m6LsWzzBPUbnlW4X31870a7KGrrAp9KuqSXgCczDyY22Y0hPKCXDjxbZXlj2s
 DZlolX+3RqAJXrJ/RnX26FSqT+fnERslMrxmhrJrkX2E3nKZ4ywUiCESg8NWZHSPZucz
 N2HJbLBvt7s7rXxTewiyQzcoK/e6yONTeJjIEL/icyMVQgo5j4Qbt7gYAPMpYExasy8N
 eD+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725055924; x=1725660724;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Rwh8M6A1//w3NduZYo3bZPoTmO8CDMDW24C3pIoKiLU=;
 b=e58gf/qlG76eV/Zdukx7pdFqSlZEw4jbCkG8uDcdSu08ZscFc1Ex0oTx4zFaK5S3MR
 h6Wg+ownmTwTNFx9fls1AWf1GgBQEsF996C6eHojJFwy0mJzWUIJGr71cRgLAPqVK3Kf
 y9RTpLirzQtfLsnOxIPiIesoUeVv0V51N9XxTKAkzQBzj1SL1PHByP2miihUtivOU6kZ
 Yeix0stnK6OcqstIoX99BVvDqrnOe92H8FRZ3mn9ERsA9OXgv5aljke3waPl5PGEgMYZ
 jdnmNQwknafJg26kzBmgCUtkerqWXDF07G+27ZBQrdYrr554q9cU3AYwqdYxg0xYgj/0
 LpOw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVpVjVdol78IJRcHDmv9pYxYIF9KDV3VRTQAeU4/e4/vB+K48bi0la18EKTsN2aBRlilZQSHZlI2SYUZg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzlO5+J9sbdBCLEGfN7swbpkLkCkzA0vhcjrZzzQw9BwFWB3Dsi
 zvNM3rUh5AzWH2BBCO9OYEbPBYcC9x1WxveKsZs8GN0UdshNWbKUE5LFaie5+PILEkIU9EZuLmY
 j1oawTQar5J4UO6P3JbXIhL1BArGqC6ltv/orVQ==
X-Google-Smtp-Source: AGHT+IG2GimMLBi5lPm379Nq+PM2LjCqEC72eUxNPBP5FlNmfqi3CtzsuE6fdy7fqHbWAp4512GJZfLvCgLXmPidcY4=
X-Received: by 2002:a05:6512:2308:b0:534:53ce:54a8 with SMTP id
 2adb3069b0e04-5354636e9f9mr1052118e87.30.1725055923441; Fri, 30 Aug 2024
 15:12:03 -0700 (PDT)
MIME-Version: 1.0
References: <20240826095306.1420628-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20240826095306.1420628-1-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 31 Aug 2024 00:11:52 +0200
Message-ID: <CACRpkdabwp611SQDDkDRDT3EG-SVirLu3Eg1P6X+BLOxLdGtyg@mail.gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v1 1/1] pinctrl: stmfx: Use string_choices
 API instead of ternary operator
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

T24gTW9uLCBBdWcgMjYsIDIwMjQgYXQgMTE6NTPigK9BTSBBbmR5IFNoZXZjaGVua28KPGFuZHJp
eS5zaGV2Y2hlbmtvQGxpbnV4LmludGVsLmNvbT4gd3JvdGU6Cgo+IFVzZSBtb2Rlcm4gc3RyaW5n
X2Nob2ljZXMgQVBJIGluc3RlYWQgb2YgbWFudWFsbHkgZGV0ZXJtaW5pbmcgdGhlCj4gb3V0cHV0
IHVzaW5nIHRlcm5hcnkgb3BlcmF0b3IuCj4KPiBTaWduZWQtb2ZmLWJ5OiBBbmR5IFNoZXZjaGVu
a28gPGFuZHJpeS5zaGV2Y2hlbmtvQGxpbnV4LmludGVsLmNvbT4KClBhdGNoIGFwcGxpZWQhCgpZ
b3VycywKTGludXMgV2FsbGVpagpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20v
bWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
