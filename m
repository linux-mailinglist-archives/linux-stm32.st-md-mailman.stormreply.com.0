Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ED0E8ACEFE5
	for <lists+linux-stm32@lfdr.de>; Thu,  5 Jun 2025 15:04:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B8F99C32EB5;
	Thu,  5 Jun 2025 13:04:07 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8ED7CC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Jun 2025 13:04:06 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-32925727810so8264651fa.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 05 Jun 2025 06:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1749128646; x=1749733446;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aTZ52CsCJSz/QeNJLPayBq/ppqiw3jdmte3lq8NK6Nk=;
 b=MKd4afI86s6QMxCvt0Wvyl54p+oSCp1BeR412pkzvxAOpNsBe7Dc8O1L2JHVO+e92B
 9+7HTBXaEobE5WbJNUOMRHVzZvsA1hbTkfIF505MvgsbhXqEvBxS5RrLVPO/IRtmu4wW
 zErPARVJlLVAvNCz3iHmW6VQ5LU+E81AjrAqIbwVDIt+fDkAVB4YM9I/Qd2iVkUtHb84
 f+vzy339vEoU5khB4L48rtkDLt8RtEXFiqMTvmVjn5Q2cecJeQGInJ7b/aaV/Q/kT3mL
 wQy6CQsZtrbxmOG3QQzWS2jc08tD5PO/sPra5sZT7fMprwaj8WQMPMmtfBoyS9HBLb9A
 XGlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749128646; x=1749733446;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aTZ52CsCJSz/QeNJLPayBq/ppqiw3jdmte3lq8NK6Nk=;
 b=AjpzNSj0C8PWrXk4x64Rw21oxskFkR30oTSBJfZYKTAeaP7gqYz3oNVWBNFlxu9hWv
 +xE9E6km+6ygzcsqsCEZv9mOyVVG+q1sFMLXEJzx7+ES0iLjMrEsd2mVSi8Kg2Carl8/
 9Vb0REhE9gYOUYBUIcMNQlnNe77s+2uu3xNNA2z7rPXPoyvrti/Bh8Rrk5qUKFTmRff1
 lzGyKrlckwgzSD/WCtiWUJ15ZVKf9XVTAKXh8HphlTTYrAs0YTVl5PPg4O6fGfD9VdfL
 pX7Br9ZZE6eV3CKa+fzZYZ4zN5R8fxF9kgrK+UZ899y7uGsixpa/VW7h0goAeM2iSM6w
 Qd4w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUhpc4yBpu69JZmAiDEuZ3b+5SmloGc1iVxo4v+Xjp8gfNSUH3nHItfh8dXLV3DmUYFskEEifDErw4YdQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yzrb2IsdiY5KQENHKBE1I2ka2qHkgQ3eMxlKqsP5rOcT7XjcsgA
 3m7HQqBb6Su3gqx1xoC4hVX/3z2If4qpv+4AjWk/mjfa7k6lsTWZdAC6V1mLgIOno+tfQojqxy3
 GeqCNsEFkBrtCLs4rFs+XtmU3JHazctp152ApM2SODw==
X-Gm-Gg: ASbGncupXOlx7BDhHsyI/ds/+4gnlbTg3TrRFMtSSp62IsFlm2sou91Lt83AYebVFE8
 aXamHnfYHCsQLuMq1F6Dkir/rivXgp7oDqLFwhSsGCYA+5rVBu4WFlenlzcD704xg1jeaQ6ElWI
 Y/5E3kL1ABAuRpGs9PZdPfPwNrLZNoDtZ0
X-Google-Smtp-Source: AGHT+IFcPULkbbdrU9YX2kszYmWTERZ0//0Le6dHomayrozyq+3I7C/+UGmesPBjV+IcBlIt/T3KkSYORg6xv8C76qs=
X-Received: by 2002:a2e:a90c:0:b0:32a:869e:4c13 with SMTP id
 38308e7fff4ca-32ac71a1ff6mr18438481fa.14.1749128645400; Thu, 05 Jun 2025
 06:04:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250528-hdp-upstream-v4-0-7e9b3ad2036d@foss.st.com>
In-Reply-To: <20250528-hdp-upstream-v4-0-7e9b3ad2036d@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 5 Jun 2025 15:03:54 +0200
X-Gm-Features: AX0GCFs9rU2_ZImIle5775iF8CDEkgQxBaV1si5YeNX6UMb2_fcREUrHEpczaEg
Message-ID: <CACRpkdZ2NUfcn7O7tKSFDyAr8Hni3pvpTN6QpOz7N3J+EsFdLg@mail.gmail.com>
To: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4 0/9] Introduce HDP support for STM32MP
	platforms
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
bWVudC5sZWdvZmZpY0Bmb3NzLnN0LmNvbT4gd3JvdGU6Cgo+IENsw6ltZW50IExlIEdvZmZpYyAo
OSk6Cj4gICAgICAgZ3BpbzogbW1pbzogYWRkIEJHUElPRl9OT19JTlBVVCBmbGFnIGZvciBHUE8g
Z3Bpb2NoaXAKPiAgICAgICBkdC1iaW5kaW5nczogcGluY3RybDogc3RtMzI6IEludHJvZHVjZSBI
RFAKPiAgICAgICBwaW5jdHJsOiBzdG0zMjogSW50cm9kdWNlIEhEUCBkcml2ZXIKPiAgICAgICBN
QUlOVEFJTkVSUzogYWRkIENsw6ltZW50IExlIEdvZmZpYyBhcyBTVE0zMiBIRFAgbWFpbnRhaW5l
cgoKQ2FuIEkgYXBwbHkgdGhlIGRyaXZlciBhbmQgYmluZGluZ3MgcGF0Y2hlcyAxLTQgc2VwYXJh
dGVseQpmcm9tIHRoZSByZXN0IG9mIHRoZSBzZXJpZXM/Cgo+ICAgICAgIEFSTTogZHRzOiBzdG0z
MjogYWRkIEhhcmR3YXJlIGRlYnVnIHBvcnQgKEhEUCkgb24gc3RtMzJtcDEzCj4gICAgICAgQVJN
OiBkdHM6IHN0bTMyOiBhZGQgSGFyZHdhcmUgZGVidWcgcG9ydCAoSERQKSBvbiBzdG0zMm1wMTUK
PiAgICAgICBBUk06IGR0czogc3RtMzI6IGFkZCBIYXJkd2FyZSBkZWJ1ZyBwb3J0IChIRFApIG9u
IHN0bTMybXAyNQo+ICAgICAgIEFSTTogZHRzOiBzdG0zMjogYWRkIGFsdGVybmF0ZSBwaW5tdXgg
Zm9yIEhEUCBwaW4gYW5kIGFkZCBIRFAgcGluY3RybCBub2RlCj4gICAgICAgQVJNOiBkdHM6IHN0
bTMyOiBhZGQgSGFyZHdhcmUgZGVidWcgcG9ydCAoSERQKSBvbiBzdG0zMm1wMTU3Yy1kazIgYm9h
cmQKCk9yIGRvZXMgaXQgbmVlZCB0byBiZSBtZXJnZWQgYWxvbmcgd2l0aCB0aGVzZT8KCllvdXJz
LApMaW51cyBXYWxsZWlqCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
