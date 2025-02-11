Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 299F9A30FF4
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Feb 2025 16:38:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D02FBC7A824;
	Tue, 11 Feb 2025 15:38:20 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 830E0C7A820
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Feb 2025 15:38:13 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-30613802a6bso61602061fa.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Feb 2025 07:38:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739288293; x=1739893093;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t8fkS7ujYdQIX4pBzwLiRogGSQ0eNgx3SFtN5MHEIaI=;
 b=S+MdLAUN5A7Cu7swGFjDbH0mt4d9dyhRqSQSagdFNRp+TLwv6qEWMPmkv9RmgyBnC+
 g5tJpvrhJ3TnQYg327tI7aZCSEbQJ88BcTHgQXDAhzKpVqGkF1GPpgBWOKM1/poZMMLr
 xlROisyi51a4H6Hc1qr2ip8yUSsdjmVwd7+mrX4doWzUKIXzETtxrqhamya+Jc4RwIqm
 /8wTWCwkwtONrhSFdWbzf+HB9nPt4ypy0DJk/cs4NOaQUs4f3LZPsZeSoypcPBO1PPDE
 JVMneVGrgwXutze4JlBdWdF3TAi3xNgcMqOTm6dLcG3m3/50dODfS/i6yCFUKhQTbmmr
 CgDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739288293; x=1739893093;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=t8fkS7ujYdQIX4pBzwLiRogGSQ0eNgx3SFtN5MHEIaI=;
 b=oDN4s/OrYu1cWXsLX2/eDzf9BDhRa4xbXN82ujzrpQXJ+hbBe8yNTwy29ifsRugJPI
 KlCvMYt5EBUXcKRzFyw+W5A71Ma9hrBT48mPAfS3t54Jb3vZ80OPSA3O2NxEgCpYO/tU
 Hs/WjNvDSObGijyZZw1Uu6VXDGqGGd9mkwVoVpPS+gMZp/TXIUhWhqAHREKFPxx/c2jL
 mE1d/cP9mgyzCaJ5ydzCMMr/1wyI28A5BtkF4KasY4x+MRhM94tF4QYkmu/4um/lS7Av
 EecNAs7SSWwlxY7CFUzlHw5LXHv7rVAAS9BlUYT0ZV5ygG7w4V8Mi2BbM/f/ld3YnwKG
 OoUQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU//nJTFPi6zfw9CCKZvhk1+v5uiWaj+PVubZGvlAW8EXfLUIe0hvUxq7iCZ7JCyQVs/sMGc+cEW6O5Kw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxRPMJCWR1AYtr0GMcKkf/cFjO5q1w8DxeO2RU8Ur/RfD4LCnj4
 9mngG6SsYBoDOgIZJih1DMXBvSojCJhCwIQd4+JCIfwTWrfl/D0dCBuI0gkqcfSZH/7FK2F44Kk
 1ZDVYsx/V1z/p5H4fiUHNDqLQGRsOV2trUU8P9A==
X-Gm-Gg: ASbGncvYUrEDbG6yyzpIAdkDLkD+kA/4vWvy5B7j6BSc+yARqG0FYP1LuDSAazq0Vdw
 W3Y5W6OASdvWF7RR2CZPFWOeNEMMDeW6b/zPY2JOgFh3fRQi/z5/2FWMZWwzht35ofxAv2wy9GY
 B45JWAiVuhl/j0QPv2toIBNhqpnHc=
X-Google-Smtp-Source: AGHT+IErfIT8Go25NkDLkQfR5NhzuzlhLOzheD8LdphohjPe9lEedbA+M9hKeD09JvDHlwEEcEqYU/xf/b/UxeLa/b4=
X-Received: by 2002:a05:651c:2129:b0:308:f01f:1829 with SMTP id
 38308e7fff4ca-308f01f1f54mr26709121fa.6.1739288292563; Tue, 11 Feb 2025
 07:38:12 -0800 (PST)
MIME-Version: 1.0
References: <20250211144300.964-1-vulab@iscas.ac.cn>
In-Reply-To: <20250211144300.964-1-vulab@iscas.ac.cn>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 11 Feb 2025 16:38:01 +0100
X-Gm-Features: AWEUYZleW_jmzFJ6vP032FNVqBGUdDWvspy9Oc7CZIhN6a5pEweY78yBo9eHn50
Message-ID: <CAMRc=Mf+yuM-g1XMVpTvOXfMvf6t+saMJYfKXuCZU8fSfzxdtA@mail.gmail.com>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: linus.walleij@linaro.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, mcoquelin.stm32@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] gpio: stmpe: Check return value of
	stmpe_reg_read in stmpe_gpio_irq_sync_unlock
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

T24gVHVlLCBGZWIgMTEsIDIwMjUgYXQgMzo0M+KAr1BNIFdlbnRhbyBMaWFuZyA8dnVsYWJAaXNj
YXMuYWMuY24+IHdyb3RlOgo+Cj4gVGhlIHN0bXBlX3JlZ19yZWFkIGZ1bmN0aW9uIGNhbiBmYWls
LCBidXQgaXRzIHJldHVybiB2YWx1ZSBpcyBub3QgY2hlY2tlZAo+IGluIHN0bXBlX2dwaW9faXJx
X3N5bmNfdW5sb2NrLiBUaGlzIGNhbiBsZWFkIHRvIHNpbGVudCBmYWlsdXJlcyBhbmQKPiBpbmNv
cnJlY3QgYmVoYXZpb3IgaWYgdGhlIGhhcmR3YXJlIGFjY2VzcyBmYWlscy4KPgo+IFRoaXMgcGF0
Y2ggYWRkcyBjaGVja3MgZm9yIHRoZSByZXR1cm4gdmFsdWUgb2Ygc3RtcGVfcmVnX3JlYWQuIElm
IHRoZQo+IGZ1bmN0aW9uIGZhaWxzLCBhbiBlcnJvciBtZXNzYWdlIGlzIGxvZ2dlZCBhbmQgdGhl
IGZ1bmN0aW9uIHJldHVybnMKPiBlYXJseSB0byBhdm9pZCBmdXJ0aGVyIGlzc3Vlcy4KPgoKV291
bGQgeW91IG1pbmQgYWRkaW5nIEZpeGVzOiBhbmQgQ2M6IHN0YWJsZSB0YWdzPwoKQmFydApfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBt
YWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRw
czovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1z
dG0zMgo=
