Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8947EBAFB6E
	for <lists+linux-stm32@lfdr.de>; Wed, 01 Oct 2025 10:46:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 58000C3F93C;
	Wed,  1 Oct 2025 08:46:37 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9C758C3F938
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  1 Oct 2025 08:46:36 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-586883eb9fbso4566002e87.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 01 Oct 2025 01:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1759308396; x=1759913196;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8D0lPsjedL+kyXW7Dr+b8bXHNiYNOO4VOFO0oJ6yKL8=;
 b=ZS0ob3/lJ6zCmhE9N02LB1Hd6azio/djcACyi9PPFc0EyMO3pZGQUAAEisZMGgbNgM
 uIbJTdr5mD5rzJAiLSg8A30UOvwFd8Wh0O6STKbabR4/MXPF73klizc0R7rfJK1Ref7I
 4RCKQJPYlhr9BLlPkgUl4DQAfi7++Uue/hZtjhKxrZSbOpKBV0kofgKuz4TnpADWL3bg
 qSmnIUKItlcYZSNoJTe7MqN5c2BcqoJ4nUjSg/1rHPdH46cBe4uONQWF80qEgkcdCHJE
 hvxTbXMpP2+7/K+AKFtK9XOuYY3cZi+Zr/xpSRuTIuuKN10iBo+u8aVowTG5/MR6yjSr
 raxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759308396; x=1759913196;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8D0lPsjedL+kyXW7Dr+b8bXHNiYNOO4VOFO0oJ6yKL8=;
 b=YiIbKu5Rbe7G4x4uTLfCQJPNzj4IrSMv6Pka5xoeweiETAJ91xEb87rsPzDybLbe/O
 C3sbjlTRdVEVE4E9bgFlC7WrNt6nOFePayKArrkMr548IzgrKw3BKX/4pRIfl5Lp8iCW
 eICtohdO7ArprfEsdKlvQmXyHHpaQSG4V1xTrAB3xS/eD3xA9gv2DnmC86kidDmbC/D0
 ehvhsUqYziw7ow2L3Plat/Yq6TQEU4HfSQnXgk9Bck3VLlG0Rh18JkT+nBAkxfofOoW/
 +CFVu8MHXZbF3/L8BV+NzsgpgKOvoJtZcBAPXiJocLrwn30GarnyuldSpNQMNj39/yDT
 CEpQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQbmEz/CcG9RUxa4zCIUlqgpJ5qzSf8CFTon3OpqJZR3BHfhoaLlZIUPR8XKXzyShemseSZXllMzAc1w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzHHZZ7UWEf6fvH5X2mImfTdYfL6LOeRpGYU4xMc7mauUQo+jOi
 z3fplBfZOcaKZXLZ7+dyh6A5J4kiE2LB9rYdkuLxB/Enj10+aa+mbIqjzrQUAsWTuzSaAPgCYUK
 RMJPZRihRYmgYD9813Pyj3GuUOsSPA6cX1Wa4J1uzCA==
X-Gm-Gg: ASbGnct0VluzbaRmKxeaKq7K+35nBqaYRheHK/ePojD/fsJBbBejALATubZGEotjlAi
 WDz6DFh02XxCUoUcx5gcw+g86NhXBxFIer3Y/+ft1AUBOtVq/h6MxWNmpPSoBt/b0yEzwK4khPD
 WPD2bqRif6Eak7oOIDR8zhm9w2dDOKUfDsK1FoqVssglA+aS18fRZkoDlC6k9nZkW/0yW0qRzPE
 60qPsFYJ40km8e/PKpau5W6zdqCBrZoFxbVISyiYx6+eOnqngIdKk6Il5oGcEg=
X-Google-Smtp-Source: AGHT+IFOdBqQ3obnIdTm7ru0JPzklPYFIUGqCI693FKE/9RlmuM5kKhUigWL4UNHwLKwqtrOVDs8F+QH4ORLFYFhoak=
X-Received: by 2002:a05:6512:ea7:b0:57a:6d7d:dd7b with SMTP id
 2adb3069b0e04-58af9eadd86mr760851e87.8.1759308395621; Wed, 01 Oct 2025
 01:46:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250910-make-compound-literals-normal-again-v1-0-076ee7738a0b@linaro.org>
 <20250910-make-compound-literals-normal-again-v1-2-076ee7738a0b@linaro.org>
 <CAMuHMdWoEXLTPyQL4kt1OPVbrDDcBdBigqUM7EbNZjZUsSmRHQ@mail.gmail.com>
 <CAMRc=Mej9fQk-1zYKhPK6aWdptXKvjq28TywRyP+iZExRuX9og@mail.gmail.com>
 <CACRpkdbo88o1g_VCp0+C9hfi1VQkP99x2Mnkw_DTctBEtVAa_g@mail.gmail.com>
In-Reply-To: <CACRpkdbo88o1g_VCp0+C9hfi1VQkP99x2Mnkw_DTctBEtVAa_g@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 1 Oct 2025 10:46:22 +0200
X-Gm-Features: AS18NWC0XlksXBppS2yCvWpBaDAShYUzQK0jJOB31RgrqudBkZ0MvZktkc5Xz8w
Message-ID: <CAMRc=Mf4kv03+cfB7up==PUJyxHH6U3hHF3q6iKYZWVOZamSTg@mail.gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>, imx@lists.linux.dev,
 Tomer Maimon <tmaimon77@gmail.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Liviu Dudau <liviu.dudau@arm.com>, Tali Perry <tali.perry1@gmail.com>,
 Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
 James Cowgill <james.cowgill@blaize.com>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Andy Shevchenko <andriy.shevchenko@intel.com>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, openbmc@lists.ozlabs.org,
 Lee Jones <lee@kernel.org>, Yinbo Zhu <zhuyinbo@loongson.cn>,
 Nancy Yuen <yuenn@google.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-arm-kernel@lists.infradead.org,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Manivannan Sadhasivam <mani@kernel.org>, Ray Jui <rjui@broadcom.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Matt Redfearn <matt.redfearn@blaize.com>,
 =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 linux-gpio@vger.kernel.org, Hoan Tran <hoan@os.amperecomputing.com>,
 Benjamin Fair <benjaminfair@google.com>, Yang Shen <shenyang39@huawei.com>,
 Scott Branden <sbranden@broadcom.com>, Neil Jones <neil.jones@blaize.com>,
 linux-unisoc@lists.infradead.org, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sudeep Holla <sudeep.holla@arm.com>, Imre Kaloz <kaloz@openwrt.org>,
 Shawn Guo <shawnguo@kernel.org>
Subject: Re: [Linux-stm32] [PATCH 2/3] pinctrl: use more common syntax for
	compound literals
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

T24gV2VkLCBPY3QgMSwgMjAyNSBhdCAxMDozNuKAr0FNIExpbnVzIFdhbGxlaWogPGxpbnVzLndh
bGxlaWpAbGluYXJvLm9yZz4gd3JvdGU6Cj4KPiBPbiBUaHUsIFNlcCAyNSwgMjAyNSBhdCA5OjUy
4oCvQU0gQmFydG9zeiBHb2xhc3pld3NraSA8YnJnbEBiZ2Rldi5wbD4gd3JvdGU6Cj4KPiA+IFRo
aXMgaXMgYSBsaW5rIHRvIHRoZSBkaXNjdXNzaW9uIHdpdGggQW5keSBhcyBwZXIgTGludXMgVG9y
dmFsZHMnCj4gPiByZWNlbnQgcmVxdWVzdCB0byB1c2UgdGhlIExpbms6IHRhZyB0byBwb2ludCB0
byBhY3R1YWxseSB1c2VmdWwKPiA+IGluZm9ybWF0aW9uIHJhdGhlciB0aGFuIGp1c3QgdGhlIHBh
dGNoJ3Mgb3JpZ2luLiBMaW51cyBXYWxsZWlqIGRvZXNuJ3QKPiA+IHVzZSBiNCBzbyB0aGUgb3Jp
Z2luIGxpbmsgeW91J2Qgbm9ybWFsbHkgZXhwZWN0IHRvIGJlIGFkZGVkCj4gPiBhdXRvbWF0aWNh
bGx5IGlzIG5vdCB0aGVyZSBhdCBhbGwuIFRoYXQncyBwcm9iYWJseSB3aGF0IGNhdXNlZCB0aGUK
PiA+IGNvbmZ1c2lvbi4KPgo+IFdoYXQ/IEkgdXNlIGI0IGZvciBldmVyeXRoaW5nLCBJIGRvbid0
IGtub3cgd2hhdCBnYXZlIHlvdQo+IHRoYXQgaW1wcmVzc2lvbi4uLi4KPgoKQWgsIHNvcnJ5IGZv
ciB0aGlzLiBJIGFzc3VtZWQgdGhlIGxhY2sgb2YgTGluayBpcyBkdWUgdG8gbm8gYjQuIFNob3Vs
ZApoYXZlIGxvb2tlZCBhdCBnaXQgbG9nIGZpcnN0LgoKPiBJIGhhdmUgaG93ZXZlciByZW1vdmVk
IHRoZSBhdXRvbWF0ZWQgTGluazogdGFncyBnZW5lcmF0ZWQgZnJvbSBtYWdpYwo+IGdpdGNvbmZp
ZyBob29rcyBhcyByZXF1ZXN0ZWQgYnkgVG9ydmFsZHMgaW4gdjYuMTctcmM1Ogo+IGh0dHBzOi8v
bHduLm5ldC9BcnRpY2xlcy8xMDM3MDY5Lwo+Cj4gVGhpcyBpcyBhbHNvIG1lbnRpb25lZCBpbiBt
eSBwaW4gY29udHJvbCBwdWxsIHJlcXVlc3QgZnJvbSB5ZXN0ZXJkYXkuCj4KClNvIGl0IGlzIGEg
cG9saWN5IGFmdGVyIGFsbCBhbmQgbm90IGEgInBsZWFzZSI/IExldCBtZSByZW1vdmUgdGhlIGhv
b2tzIHRoZW4uLi4KCkJhcnQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21h
aWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
