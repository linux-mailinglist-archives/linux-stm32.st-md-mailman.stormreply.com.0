Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E41A808505
	for <lists+linux-stm32@lfdr.de>; Thu,  7 Dec 2023 10:56:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F27F0C6C85F;
	Thu,  7 Dec 2023 09:56:42 +0000 (UTC)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com
 [209.85.219.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 242AAC6B475
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 Dec 2023 09:56:41 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id
 3f1490d57ef6-dafe04717baso776706276.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 07 Dec 2023 01:56:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701943000; x=1702547800;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TJnq125j0YdWG47h8sgeSrpDhVFiAnTytxHlskk2EhY=;
 b=dW9yYP02H6azWWtQb0Wu1vdZIOXPS2gBLd5CqRiC6RF//Hkh8m1Qz6uGMsMU7RXrt7
 DkaIUJVTo1AfTgb4v2gRdnoNK9YI5m/6kX7+KKXQ9HAaVdvTYJ3kIllreD+fB7uhnIiO
 EAS7MLlNMuHcZV8nYXN7FhNtp60Lv1HYvlnviuhZy9CUhnzbyXgkPdW+lMe7TTYjnXQo
 DrUAUiZHNqCYllZX+tAiaq8Xv75C/lmaJ+48aRs/O8sXFbhAOXFk2Y/0d9TBA6tkPGTv
 gBmONSL9PSr1+Q3xGRYifm/thl7jg23gFgLHIW4bYUjVs2kKX9dJvXrsYG5g2XQXOecv
 p8BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701943000; x=1702547800;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TJnq125j0YdWG47h8sgeSrpDhVFiAnTytxHlskk2EhY=;
 b=gkhRldqE3iiKHCBDuZclK0PtyoUZgxhKHHcxuG3DbWZAG/pVXpupkpIZLohKwM1+F2
 DSpFhIrTvA8br3lg4ipGJT/0ItmoocJhbeNJpLYIxwfFk35a3eyetGm2phbn/4+TBQqG
 GWdk4Jxv4lX1YpkLSSFZXw3CVe8RWUxs3bQSb9/I7jaJPZrPn+bq8/yj/x1HNV8LVRJ3
 nWBkBSHRP9b2NU2UWcLasnHDfxKKxMmQ2IE1jfCRcIkJPrnUzD8IgAGgVKDcqXm1P071
 qUdeAp/ayBXe1r+7zj6bRBFVEYx5QAc+KtwNYv9F45ZDBjqA07ASFFlCJ5YPwbhKwbVX
 +Agg==
X-Gm-Message-State: AOJu0YwukWcBWP3a6ABbRQ03VffRufZyQpY+Sr0X9M+xCVbueNUHyzLz
 OrewwnGATWVfb14atyOQHYDgQ5a0cDeZv/vVzBPCHw==
X-Google-Smtp-Source: AGHT+IFmG5Eix/w4QK05D8maIWu4NoSnt+3uvdJ7TmBB3MpQnzAeGZpXme98S/yULZnvsP6j+GPexkcwj6QKWJI6sGg=
X-Received: by 2002:a25:190a:0:b0:da3:76d3:e4fb with SMTP id
 10-20020a25190a000000b00da376d3e4fbmr1627701ybz.26.1701942999893; Thu, 07 Dec
 2023 01:56:39 -0800 (PST)
MIME-Version: 1.0
References: <20231204203357.2897008-1-ben.wolsieffer@hefring.com>
 <20231204203357.2897008-3-ben.wolsieffer@hefring.com>
In-Reply-To: <20231204203357.2897008-3-ben.wolsieffer@hefring.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 7 Dec 2023 10:56:50 +0100
Message-ID: <CACRpkdZKjcE5yMF0=E+4BRTEmrShSqFzCcyH8Rug7u7kOotUQQ@mail.gmail.com>
To: Ben Wolsieffer <ben.wolsieffer@hefring.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/2] pinctrl: stm32: fix GPIO level
	interrupts
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

T24gTW9uLCBEZWMgNCwgMjAyMyBhdCA5OjM14oCvUE0gQmVuIFdvbHNpZWZmZXIKPGJlbi53b2xz
aWVmZmVyQGhlZnJpbmcuY29tPiB3cm90ZToKCj4gVGhlIFNUTTMyIGRvZXNuJ3Qgc3VwcG9ydCBH
UElPIGxldmVsIGludGVycnVwdHMgaW4gaGFyZHdhcmUsIHNvIHRoZQo+IGRyaXZlciB0cmllcyB0
byBlbXVsYXRlIHRoZW0gdXNpbmcgZWRnZSBpbnRlcnJ1cHRzLCBieSByZXRyaWdnZXJpbmcgdGhl
Cj4gaW50ZXJydXB0IGlmIG5lY2Vzc2FyeSBiYXNlZCBvbiB0aGUgcGluIHN0YXRlIGFmdGVyIHRo
ZSBoYW5kbGVyCj4gZmluaXNoZXMuCj4KPiBDdXJyZW50bHksIHRoaXMgZnVuY3Rpb25hbGl0eSBk
b2VzIG5vdCB3b3JrIGJlY2F1c2UgdGhlIGlycWNoaXAgdXNlcwo+IGhhbmRsZV9lZGdlX2lycSgp
LCB3aGljaCBkb2Vzbid0IHJ1biB0aGUgaXJxX2VvaSgpIG9yIGlycV91bm1hc2soKQo+IGNhbGxi
YWNrcyBhZnRlciBoYW5kbGluZyB0aGUgaW50ZXJydXB0LiBUaGlzIHBhdGNoIGZpeGVzIHRoaXMg
YnkgdXNpbmcKPiBoYW5kbGVfbGV2ZWxfaXJxKCkgZm9yIGxldmVsIGludGVycnVwdHMsIHdoaWNo
IGNhdXNlcyBpcnFfdW5tYXNrKCkgdG8gYmUKPiBjYWxsZWQgdG8gcmV0cmlnZ2VyIHRoZSBpbnRl
cnJ1cHQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBCZW4gV29sc2llZmZlciA8YmVuLndvbHNpZWZmZXJA
aGVmcmluZy5jb20+CgpSZXZpZXdlZC1ieTogTGludXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBs
aW5hcm8ub3JnPgoKTWFyYyBaIGNhbiBhcHBseSBhbGwgdGhlIHBhdGNoZXMgdG8gdGhlIGlycSB0
cmVlIG9uY2UgaGUncyBoYXBweQp3aXRoIHRoZSBzb2x1dGlvbi4KCllvdXJzLApMaW51cyBXYWxs
ZWlqCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXN0bTMyCg==
