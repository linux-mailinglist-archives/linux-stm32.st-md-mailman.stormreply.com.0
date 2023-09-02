Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D3927908B8
	for <lists+linux-stm32@lfdr.de>; Sat,  2 Sep 2023 18:43:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 02E84C6B442;
	Sat,  2 Sep 2023 16:43:21 +0000 (UTC)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com
 [209.85.219.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DBC70C6A613
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  2 Sep 2023 16:43:19 +0000 (UTC)
Received: by mail-yb1-f176.google.com with SMTP id
 3f1490d57ef6-d7b91422da8so75339276.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 02 Sep 2023 09:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693672999; x=1694277799;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RUQI1IMPxq/0QcnuPOG+oY2Cvb8cpMwVnmqwILZAnjE=;
 b=D/wR5ljpj6MA0EgGhw3oFr9pfO8njUR8X5MUYOnBfpoLu0JsS3Mz/9QExAxRx05691
 myN8IFUQ6L2STibdaMl1WeEnEexdiSfx9ywJJ6gkrZvDjWuTvYLruNgmACvpPC79giS0
 GWClOsWykGy9/0w0ej711VHFuAV19E7HkWO+mjDqcrpfIIIhDrDPqNGlyiM3OBWBemCT
 tEJdZRTFlFpa7kZ87+bYT5LcvWBo0nz3LefxWqHgJXWHyGm6A0Xedpz3cXwNVVppAUVY
 mVVLyaJfDl+xJkggA4dhFEZ/PjrdPx8pU3O6G7k1gHhe/ndTIPdTMK7UC/baKYktXB+N
 damw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693672999; x=1694277799;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RUQI1IMPxq/0QcnuPOG+oY2Cvb8cpMwVnmqwILZAnjE=;
 b=U4cZ4PXqmmAHCgYW7IixkjIFnPaTD/8NpQJ9fqZqWhuVMnnqP/V2OVlJ8mQwdac3cg
 /DkwKCZHXdh17/sWVOjsU4MYpskTAHen8782fZC+egvV9lM5bdFARrV1ayVpOA3ZMcFV
 dPP3NB3/dcQs/l5ofIoPWGqmAIJXqftluWCQhsxRdp0lbsKMYnycYlhEfjWWESYYiehJ
 6qOoCCdIaiganx9KFgnQ9CMdDSCsSd1VZzhsSqwrwUivamtfFl0PPSTnxZd7GHWw21Io
 o7CzrT5NPkcc/5Fmc2iF9IphMgYyPVzduJ7x1i6H+EIbHfPwv117IrkIu2yjLTlmHGPm
 ZJ6Q==
X-Gm-Message-State: AOJu0YwjaHUGLc4HEpGJ1knI2QrE+gM/8kNj0RQbiCxcWqa3wMqKZICl
 XmXhJLh5ob31Gm+BonCf2DY7WRitPhD3VEUjyR5mzQ==
X-Google-Smtp-Source: AGHT+IE/lyKUxC+R61qFXqvryIakPGcGdMcW/bi3SrxhNQy2coxvc4NC7uGhbA7OM2U7ZRuQsjY6HNyjJvBnSDvaMR4=
X-Received: by 2002:a25:2495:0:b0:d78:1f87:d6f1 with SMTP id
 k143-20020a252495000000b00d781f87d6f1mr5941437ybk.33.1693672998777; Sat, 02
 Sep 2023 09:43:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230901120836.1057900-1-yann.gautier@foss.st.com>
In-Reply-To: <20230901120836.1057900-1-yann.gautier@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 2 Sep 2023 18:43:07 +0200
Message-ID: <CACRpkdaj6bEQTo6a5gOJQne-wKqBLvuxiOe9kE+q-nkYLOU7Pw@mail.gmail.com>
To: Yann Gautier <yann.gautier@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Yang Yingliang <yangyingliang@huawei.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] mmc: mmci: stm32: add SDIO in-band
	interrupt mode
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

SGkgWWFubi9DaHJpc3RvcGhlLAoKanVzdCBhIHF1aWNrIG5vdGU6CgpPbiBGcmksIFNlcCAxLCAy
MDIzIGF0IDI6MDjigK9QTSBZYW5uIEdhdXRpZXIgPHlhbm4uZ2F1dGllckBmb3NzLnN0LmNvbT4g
d3JvdGU6Cgo+ICtzdGF0aWMgdm9pZCBzZG1tY19lbmFibGVfc2Rpb19pcnEoc3RydWN0IG1tY2lf
aG9zdCAqaG9zdCwgaW50IGVuYWJsZSkKPiArewo+ICsgICAgICAgdm9pZCBfX2lvbWVtICpiYXNl
ID0gaG9zdC0+YmFzZTsKPiArICAgICAgIHUzMiBtYXNrID0gcmVhZGxfcmVsYXhlZChiYXNlICsg
TU1DSU1BU0swKTsKPiArCj4gKyAgICAgICBpZiAoZW5hYmxlKQo+ICsgICAgICAgICAgICAgICB3
cml0ZWxfcmVsYXhlZChtYXNrIHwgTUNJX1NUX1NESU9JVE1BU0ssIGJhc2UgKyBNTUNJTUFTSzAp
Owo+ICsgICAgICAgZWxzZQo+ICsgICAgICAgICAgICAgICB3cml0ZWxfcmVsYXhlZChtYXNrICYg
fk1DSV9TVF9TRElPSVRNQVNLLCBiYXNlICsgTU1DSU1BU0swKTsKPiArfQo+ICsKPiArc3RhdGlj
IHZvaWQgc2RtbWNfc2Rpb19pcnEoc3RydWN0IG1tY2lfaG9zdCAqaG9zdCwgdTMyIHN0YXR1cykK
PiArewo+ICsgICAgICAgaWYgKHN0YXR1cyAmIE1DSV9TVF9TRElPSVQpIHsKPiArICAgICAgICAg
ICAgICAgc2RtbWNfZW5hYmxlX3NkaW9faXJxKGhvc3QsIDApOwo+ICsgICAgICAgICAgICAgICBz
ZGlvX3NpZ25hbF9pcnEoaG9zdC0+bW1jKTsKPiArICAgICAgIH0KPiArfQoKWW91IG5lZWQgdG8g
bW92ZSB0aGVzZSB0byBtbWNpIGFuZCByZW5hbWUgdGhlbSBzaW5jZSBVeDUwMCB3aWxsIHVzZQp0
aGUgc2FtZSBjYWxsYmFja3MuCgo+ICBzdGF0aWMgc3RydWN0IG1tY2lfaG9zdF9vcHMgc2RtbWNf
dmFyaWFudF9vcHMgPSB7Cj4gICAgICAgICAudmFsaWRhdGVfZGF0YSA9IHNkbW1jX2lkbWFfdmFs
aWRhdGVfZGF0YSwKKC4uLikKPiArICAgICAgIC5lbmFibGVfc2Rpb19pcnEgPSBzZG1tY19lbmFi
bGVfc2Rpb19pcnEsCj4gKyAgICAgICAuc2Rpb19pcnEgPSBzZG1tY19zZGlvX2lycSwKPiAgfTsK
CldoYXQgYWJvdXQgZHJvcHBpbmcgdGhlIHBlci12YXJpYW50IGNhbGxiYWNrcyBhbmQganVzdCBp
bmxpbmUKdGhpcyBpbnRvIG1tY2lfZW5hYmxlX3NkaW9faXJxKCkvbW1jaV9hY2tfc2Rpb19pcnEo
KSBzaW5jZQpzbyBtYW55IHZhcmlhbnRzIGhhdmUgdGhlIHNhbWUgc2NoZW1lPyBJIGhhdmVuJ3Qg
bG9va2VkCmF0IHRoZSBRdWFsY29tbSB2YXJpYW50IHRob3VnaCwgbWF5YmUgaXQgaXMgY29tcGxl
dGVseQpkaWZmZXJlbnQuLi4KCllvdXJzLApMaW51cyBXYWxsZWlqCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApM
aW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
