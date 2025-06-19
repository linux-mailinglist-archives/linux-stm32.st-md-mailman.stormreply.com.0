Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D78ADFE65
	for <lists+linux-stm32@lfdr.de>; Thu, 19 Jun 2025 09:10:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D90AAC36B36;
	Thu, 19 Jun 2025 07:10:11 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D063DC36B35
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Jun 2025 07:10:10 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-45348bff79fso5287475e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Jun 2025 00:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750317010; x=1750921810;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xJ7WKC8SwlHWnkxUpPjJRL3c4L2d7RoKGqvzAae/doc=;
 b=X38eff7B5jXCx8Mk0i96Qz1GgAlyMdGb6pjndU1q7PHgCTFcQbCa9vl6DBv8bCK0H/
 fH9nXN4+SanrUSPfgY2FHmrUvzVaBmWZxTAHdhHqtlZ/6G/ml+G8nq1pnvkHHzmBfW3s
 SlD2TauXHPk2fCQm437EqqiynqttJJSOcD1WuFiLAWdQMB617kMyNZ1KxvNn/ZK/ksFV
 yrqdJ46JgW/boO13D/Dy+tElMpOFRP5v96zCx85XXyuYEnE9w938KriayzGGjw53jfto
 xOTy6EWUeu3a26q56l9vAOVI6jLq52bBwgtkhcnWwtEuQ3BlwbkY616apd4vgbx3EvaR
 S9dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750317010; x=1750921810;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xJ7WKC8SwlHWnkxUpPjJRL3c4L2d7RoKGqvzAae/doc=;
 b=IaGV+ghWUKt2r9i4k9m8/j21vJHMcfjyQLSpJ3MGBmEdABaVbZzD74W45vEYZ5PPLK
 0i7ObQOlq++hQWfI5v3UfmmPI3HXsR6z75BoXS2tuKrKIRGcrCwOMNwR5+clc6OUnbG3
 sNS6iHI3IrMVgNiV04ms+hs8QF5Jvf2y0+RPk7fkpRC2tF1S0VRmZ+UjS/8kzkvhSEW0
 rlBx4/FBV7/6nkchvLI40/ARwP6AVLFrQV66RzE40pquqBbNAw1j5vm9cCtzxlu0yXBD
 U7JvbYhlPdBDlK9BGFg9Dvwx8tMikTS96gD0f3xviz50E+gbhwwws6FcKt6PvMmOfL7L
 u5Xw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWnMYQi24bfu/8jxIv/I9BQfJsawWcM/Wia1bi0ma6yTA97JgM0eWbyX66tVqY1PQu2ACnVdob0UHs5CQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwDSf1DsTI1kHAaPaHYn/07p/afnAQwQmGD+D4VofblVAUSkAyp
 TozCHg9U2+59PWgY25PhSK5smxL0ytc9IUQdQwzhl/vf/uqh/mIKhNsDYBoR0Amp85g=
X-Gm-Gg: ASbGncsRZFKn/6q8LN8S9spbuJumoCvjW5KgXO/lgpCRcd7GuSgYddp88i7GQNCQMt+
 rD38Uk0a+4oq8vd8GVVhhBWl8liFyymLe/S55dppP1DEQe1y/fSGWGz5Ne4eFZDMkkrJfDJOoLJ
 WBXhZpx2tzbky21lBCWwqF3ywCpfL+5Iz3CsYbTqRLpZSeyFlYgv7ng3tR5FTg7TkTUMNaqBAZz
 nweIRbEXhkiTnUayHt/1LiJtPO2FUpxEfi0aDmlOzd+Bp2fdu8oZnvVJJnRxix6CBiEYRC922+F
 zBGpA62damgp75oKD8ZGU/P0jP1nEgLAXUpIV44F2CQSwrVdrXSwOOO98BFfCd8=
X-Google-Smtp-Source: AGHT+IHzP+i1T5dB4ay7/aTiSPYaINe2A3Zw6rt9PEf6xWeqmugHB7dSuPeuV0xJhfe2MdtyIcwRZQ==
X-Received: by 2002:a05:6000:1881:b0:3a4:e5fa:73f0 with SMTP id
 ffacd0b85a97d-3a572397846mr17415430f8f.20.1750317009976; 
 Thu, 19 Jun 2025 00:10:09 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:c485:fe15:c9ab:c72f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a568b628ecsm18982991f8f.92.2025.06.19.00.10.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jun 2025 00:10:09 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 =?UTF-8?q?Cl=C3=A9ment=20Le=20Goffic?= <clement.legoffic@foss.st.com>
Date: Thu, 19 Jun 2025 09:10:08 +0200
Message-ID: <175031700235.8154.11042956002137082224.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250613-hdp-upstream-v5-0-6fd6f0dc527c@foss.st.com>
References: <20250613-hdp-upstream-v5-0-6fd6f0dc527c@foss.st.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] (subset) [PATCH v5 0/9] Introduce HDP support for
	STM32MP platforms
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

RnJvbTogQmFydG9zeiBHb2xhc3pld3NraSA8YmFydG9zei5nb2xhc3pld3NraUBsaW5hcm8ub3Jn
PgoKCk9uIEZyaSwgMTMgSnVuIDIwMjUgMTI6MTQ6MTEgKzAyMDAsIENsw6ltZW50IExlIEdvZmZp
YyB3cm90ZToKPiBUaGlzIHBhdGNoIHNlcmllcyBpbnRyb2R1Y2VzIHRoZSBIYXJkd2FyZSBEZWJ1
ZyBQb3J0IChIRFApIHN1cHBvcnQgZm9yCj4gU1RNMzJNUCBwbGF0Zm9ybXMuCj4gCj4gSXQgaW5j
bHVkZXMgdXBkYXRlcyB0byB0aGUgbW1pbyBncGlvIGRyaXZlciwgdGhlIGFkZGl0aW9uIG9mIGRl
dmljZSB0cmVlCj4gYmluZGluZ3MsIHRoZSBIRFAgZHJpdmVyLCBhbmQgdXBkYXRlcyB0byB0aGUg
ZGV2aWNlIHRyZWUgZmlsZXMgZm9yCj4gU1RNMzJNUDEzLCBTVE0zMk1QMTUsCj4gYW5kIFNUTTMy
TVAyNSBTb0NzLgo+IFRoZSBzZXJpZXMgYWxzbyB1cGRhdGVzIHRoZSBNQUlOVEFJTkVSUyBmaWxl
IHRvIGluY2x1ZGUgbXlzZWxmIGFzIHRoZQo+IG1haW50YWluZXIgZm9yIHRoZSBTVE0zMiBIRFAg
ZHJpdmVyIGFuZCBhZGRzIHRoZSBuZWNlc3NhcnkKPiBwaW5tdXggY29uZmlndXJhdGlvbnMgZm9y
IEhEUCBwaW5zIG9uIFNUTTMyTVAxNTdDLURLMiBhcyBleGFtcGxlLgo+IAo+IFsuLi5dCgpBcHBs
aWVkLCB0aGFua3MhCgpbMS85XSBncGlvOiBtbWlvOiBhZGQgQkdQSU9GX05PX0lOUFVUIGZsYWcg
Zm9yIEdQTyBncGlvY2hpcAogICAgICBodHRwczovL2dpdC5rZXJuZWwub3JnL2JyZ2wvbGludXgv
Yy9kZWVmYzcwODM0MTRkZTgxYWFkMTAyYjYwZjAzOTBmNjAwZDdlYjc5CgpCZXN0IHJlZ2FyZHMs
Ci0tIApCYXJ0b3N6IEdvbGFzemV3c2tpIDxiYXJ0b3N6LmdvbGFzemV3c2tpQGxpbmFyby5vcmc+
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0
bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
Cmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXN0bTMyCg==
