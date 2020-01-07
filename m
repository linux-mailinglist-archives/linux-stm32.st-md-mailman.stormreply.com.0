Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 379841325D4
	for <lists+linux-stm32@lfdr.de>; Tue,  7 Jan 2020 13:15:18 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0145DC36B0B;
	Tue,  7 Jan 2020 12:15:18 +0000 (UTC)
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
 [209.85.208.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9EE91C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Jan 2020 12:15:15 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id c26so50152409eds.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 07 Jan 2020 04:15:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=dkoKwK15oscs3r0V8scapeKxlP48dhvoGFKEGuBFTog=;
 b=i+Lb1ywoUudeLdDezbVfEsRCdr1VeI0ipWrWFqgLN4Gl1qulTOSsgKPNhxoQ/r99h9
 0569b7W62fUexP33w+FJI2JXJa9ll26wVSGCNP47MajoWHATb49it6OXQVPknyeeBHLG
 HHmuzP+yKgF0vY+4l88eZK7bZZiQk+APx6XibN7CLJjwBiig2XjonlhTTUIttfijeEYH
 8Ovqwjt6y7zuP9+jMmeUN1F1bzIuk7SIbMj2ydimTkE+uYOl1Fxs2/m41Fa/za0+VQeS
 8PrBOMKaZfctJCvh9eXUp7O0hmsbFiR9HwGGA1AyNwmlogknUuIitfpbKPXkIyNzboKa
 gnjQ==
X-Gm-Message-State: APjAAAWkhUDGrLTDS7XJfShJytajtvO7uUhruujMuPJkQNCr1f1MhmAM
 sfnNJsQUI6joX9n2siC2ams=
X-Google-Smtp-Source: APXvYqwW9wXBZpzOMfTBS/kbOe4ZNckfdL5+6WOz5BazFgA1mugpFZqXKx0VrM2wxvGj7bgEnT9msA==
X-Received: by 2002:a17:906:eda9:: with SMTP id
 sa9mr109435185ejb.297.1578399315230; 
 Tue, 07 Jan 2020 04:15:15 -0800 (PST)
Received: from pi3 ([194.230.155.149])
 by smtp.googlemail.com with ESMTPSA id f9sm7382215edr.66.2020.01.07.04.15.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2020 04:15:14 -0800 (PST)
Date: Tue, 7 Jan 2020 13:15:12 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Message-ID: <20200107121512.GA319@pi3>
References: <20191230172113.17222-1-krzk@kernel.org>
 <20191230172113.17222-2-krzk@kernel.org>
 <20200107072645.ko247bwhh3ibdu73@pengutronix.de>
 <20200107082539.GA31827@pi3>
 <20200107104234.wq74fska3szrg4ii@pengutronix.de>
 <20200107110359.GA32423@pi3>
 <20200107113354.ggq6zarewq5ip354@pengutronix.de>
 <20200107115429.GA32632@pi3>
 <20200107120926.cgrxk6b4rchf6i42@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200107120926.cgrxk6b4rchf6i42@pengutronix.de>
Cc: linux-pwm@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 kernel@pengutronix.de, linux-amlogic@lists.infradead.org,
 linux-tegra@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/2] pwm: Enable compile testing for some
	of drivers
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

T24gVHVlLCBKYW4gMDcsIDIwMjAgYXQgMDE6MDk6MjZQTSArMDEwMCwgVXdlIEtsZWluZS1Lw7Zu
aWcgd3JvdGU6Cj4gPiA+IChPaCwgSEFTX0RNQSBpcyBkZWZpbmVkIHVzaW5nICJkZXBlbmRzIG9u
ICFOT19ETUEiICsgImRlZmF1bHQgeSIuCj4gPiA+IE5PX0RNQSBoYXMgdGhyZWUgZGlmZmVyZW50
IGRlZmluaXRpb25zLiBUd28gb2YgdGhlbSAoaW4KPiA+ID4gZHJpdmVycy9jcnlwdG8vY2NyZWUv
Y2NfaHdfcXVldWVfZGVmcy5oIGFuZCBhcmNoL2FybS9pbmNsdWRlL2FzbS9kbWEuaCkKPiA+ID4g
dW5yZWxhdGVkLikKPiA+IAo+ID4gWWVzLCBIQVNfRE1BIGlzIHRoZSBzZWNvbmQgbWlzc2luZyBw
aWVjZSBmb3IgVU0uCj4gCj4gU28gc29tZXRoaW5nIGxpa2U6Cj4gCj4gCSMgVXNlcm1vZGUgbGlu
dXggZG9lc24ndCBwcm92aWRlIEhBU19ETUEgYW5kIEhBU19JT01FTS4gIFRvIG5vdCBoYXZlIHRv
Cj4gCSMgY2x1dHRlciBtb3N0IGRlcGVuZGVuY2llcyB3aXRoIHRoZXNlIGp1c3QgZXhjbHVkZSBV
TUwgZnJvbSBjb21waWxlCj4gCSMgdGVzdGluZy4KPiAKPiBhcyBjb21tZW50IGZvciBDT01QSUxF
X1RFU1QncyBkZXBlbmQgbGluZSBzaG91bGQgYmUgZmluZSwgcmlnaHQ/Cj4gCgpJIHRoaW5rIHll
cy4KCkJlc3QgcmVnYXJkcywKS3J6eXN6dG9mCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBz
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
