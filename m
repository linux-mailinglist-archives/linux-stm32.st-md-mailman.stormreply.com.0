Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 08872BAFA88
	for <lists+linux-stm32@lfdr.de>; Wed, 01 Oct 2025 10:36:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B79A1C3F93C;
	Wed,  1 Oct 2025 08:36:54 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A9424C3F938
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  1 Oct 2025 08:36:53 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-371e4858f74so8910101fa.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 01 Oct 2025 01:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759307813; x=1759912613;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gzIdYM+jt7Tm5Uc0vWk+e7hcdztHdOIk7pXCG5DPn00=;
 b=zd0kKAboPbxA+ch89HHqf3YaxtLo+oQiJ9juRISZE30CTdkrF2CjBPr3QnhLBHvZmN
 jzryCaDAN/L2UtKxWWS3aD384BFXN0pj6CFITsC0i7KNlfkdTaBEBuVlaY3F6DHo+vQl
 sFpHm2Un/SEgmHet0lFBK+M8VLNh27YlX6Q/bCuT/zGXUEheguB8V4qq66Zfs03KGE5h
 lwHgFZ2ejVf2y6PSte7dlMui5Lq3xqe5K1+n4jqInSQlZ/6/4zJYMEGnL/TTCimbN6/C
 RrRSX2rVyWA7V5f+ELnQaYCwTCxAHK/2R92Fm1AvMhTiMdfb/6PYTJRNIR1yGsnsmYDk
 JPIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759307813; x=1759912613;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gzIdYM+jt7Tm5Uc0vWk+e7hcdztHdOIk7pXCG5DPn00=;
 b=DaNzbi9Q24QiHD9TfM8AQucqm41syfDcp4K+A3ytdeMKeuFb8H9cYVpcVGiuPe6JBG
 F871t7fJbOch+NjaNCnoB7JGhMGBujqJaXHw9wINzpQbSFDrAr7VatK5C4EEh46a6y4c
 fuGylebwXblqmpdhWrS9cws+6tHEtpgW/dHYPURQlom7279nLw9dL722gYZYpUgDgTUf
 Z2KaFphnCCjyerLA6EVXAPQrCXtc4DClCFptgzAEhZi9xvBwy5KwJnVmNi/UIiX76/Pc
 bpvvOgxkJ1rASPo2u1bubD0KsNmbg0gqYZ/mZZRxSZ0XQ5ZfqHD/koZGh2HHBDdiWjmb
 gQGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZKyl91WIbaLxijy7mLkzpb0AjmdThWFiy+DbUn+hqFHRXUK8vr/QzUpHg1aNwM6fs7CMxfn3AQGQE0Q==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwqInbuEy+KLqo0l4HhxUtAYpffAqQUZBGqR8ExcJI8UTBAKw+z
 4qU1mBvFvbym6mDGtSPvfKwFSmyfZfzT8Fou1F52+FNuGKenx5+7htxyGMFjxgPgLkOA4xwytaI
 t41Y3ys5zEBQMeok0+6g7MccqgbpO/Ht/oQmOZCZmIQ==
X-Gm-Gg: ASbGncvT5NZ7CpFm+F6WgIyhOfjL7exscO/uGg9J2/KppMJiFKcPHhgj3v1vlj6pm6k
 LjpmKWelxlOEprGlTuu2Emusx3i2gLtXYXTg/7nv4ophGkK1q7pC+wHWhmw4DeOlYBuxmkBm8dt
 s57lczzBl80gr2plu5GxxgrcUhRyuvbgDNRfydWvMdi4PWt3NeN4UZAIi4Fz8lopgvfOvQc0+Px
 3Mx0wLFa0nnD+0AoskRhqkS2uaHcDUAvESq13AVzA==
X-Google-Smtp-Source: AGHT+IGR364l0fZkqCbX1kIjKIvYDxXIcwBHw+lqJUfFGXSzirJ8uNvUMS79/HggJOLuN/qEVcxWH5dtrV9+RyqdghU=
X-Received: by 2002:a05:651c:210c:b0:357:ccfc:64ac with SMTP id
 38308e7fff4ca-372fa205204mr25896051fa.4.1759307812626; Wed, 01 Oct 2025
 01:36:52 -0700 (PDT)
MIME-Version: 1.0
References: <20250910-make-compound-literals-normal-again-v1-0-076ee7738a0b@linaro.org>
 <20250910-make-compound-literals-normal-again-v1-2-076ee7738a0b@linaro.org>
 <CAMuHMdWoEXLTPyQL4kt1OPVbrDDcBdBigqUM7EbNZjZUsSmRHQ@mail.gmail.com>
 <CAMRc=Mej9fQk-1zYKhPK6aWdptXKvjq28TywRyP+iZExRuX9og@mail.gmail.com>
In-Reply-To: <CAMRc=Mej9fQk-1zYKhPK6aWdptXKvjq28TywRyP+iZExRuX9og@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 1 Oct 2025 10:36:40 +0200
X-Gm-Features: AS18NWDoMdvnOzF6_wDEnr52XVC2ihE3QCB2mnLOoQUz_n36xv-rRAEh7yvMfRw
Message-ID: <CACRpkdbo88o1g_VCp0+C9hfi1VQkP99x2Mnkw_DTctBEtVAa_g@mail.gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
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

T24gVGh1LCBTZXAgMjUsIDIwMjUgYXQgOTo1MuKAr0FNIEJhcnRvc3ogR29sYXN6ZXdza2kgPGJy
Z2xAYmdkZXYucGw+IHdyb3RlOgoKPiBUaGlzIGlzIGEgbGluayB0byB0aGUgZGlzY3Vzc2lvbiB3
aXRoIEFuZHkgYXMgcGVyIExpbnVzIFRvcnZhbGRzJwo+IHJlY2VudCByZXF1ZXN0IHRvIHVzZSB0
aGUgTGluazogdGFnIHRvIHBvaW50IHRvIGFjdHVhbGx5IHVzZWZ1bAo+IGluZm9ybWF0aW9uIHJh
dGhlciB0aGFuIGp1c3QgdGhlIHBhdGNoJ3Mgb3JpZ2luLiBMaW51cyBXYWxsZWlqIGRvZXNuJ3QK
PiB1c2UgYjQgc28gdGhlIG9yaWdpbiBsaW5rIHlvdSdkIG5vcm1hbGx5IGV4cGVjdCB0byBiZSBh
ZGRlZAo+IGF1dG9tYXRpY2FsbHkgaXMgbm90IHRoZXJlIGF0IGFsbC4gVGhhdCdzIHByb2JhYmx5
IHdoYXQgY2F1c2VkIHRoZQo+IGNvbmZ1c2lvbi4KCldoYXQ/IEkgdXNlIGI0IGZvciBldmVyeXRo
aW5nLCBJIGRvbid0IGtub3cgd2hhdCBnYXZlIHlvdQp0aGF0IGltcHJlc3Npb24uLi4uCgpJIGhh
dmUgaG93ZXZlciByZW1vdmVkIHRoZSBhdXRvbWF0ZWQgTGluazogdGFncyBnZW5lcmF0ZWQgZnJv
bSBtYWdpYwpnaXRjb25maWcgaG9va3MgYXMgcmVxdWVzdGVkIGJ5IFRvcnZhbGRzIGluIHY2LjE3
LXJjNToKaHR0cHM6Ly9sd24ubmV0L0FydGljbGVzLzEwMzcwNjkvCgpUaGlzIGlzIGFsc28gbWVu
dGlvbmVkIGluIG15IHBpbiBjb250cm9sIHB1bGwgcmVxdWVzdCBmcm9tIHllc3RlcmRheS4KCllv
dXJzLApMaW51cyBXYWxsZWlqCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
