Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1769E6E1F09
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Apr 2023 11:09:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A0176C6907A;
	Fri, 14 Apr 2023 09:09:26 +0000 (UTC)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com
 [209.85.219.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 492DCC03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Apr 2023 09:09:25 +0000 (UTC)
Received: by mail-yb1-f177.google.com with SMTP id u13so18267235ybu.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Apr 2023 02:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681463364; x=1684055364;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F81GLoXLZtL8vSYDorqAiL9CnEzuuMOCcLiXsP3TrCA=;
 b=pfnBK13xoj6MOIemvnh+e0VZmwkcUJ+TfhPfedGgirQgO5YLUTQmosJzSNe/gHWo/1
 ubKpJ+UjeNxA0eSLk5uTboLOoZ9CVbVps5jQPOuhddVcfEKIRj36V9F6j/Uvfkh+TPpH
 TbQifVNV4ANZnCz2cCmhsbu7MeK1YAI1WPcIgpMyBNuUbh+3rF6x2e5kF/6sSyEanncz
 84fruTtD5nT1/ka61tFRLkbHsJzoaWR7jznJ/7MVP0nShZDKy6/Vq8Fpf9Vled7Z2UhU
 anNFj2syL0/CaF4FpMeFmRw6ZmyAYU8Rq1jnzZZISGDvS81vlH7jZVdZy3oZB7lF9Jbn
 xrsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681463364; x=1684055364;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F81GLoXLZtL8vSYDorqAiL9CnEzuuMOCcLiXsP3TrCA=;
 b=HCa5fb7ZJYxKgKlxbdkFUbgwt45qyxCTTI7+kz4IKzcF1xwFsv7fEcy1z6TIph1LHO
 oteZjnfKEqD3dOWDw+AMoqtVYuNDmWveE8KlDWxGAUp+/y+byhsN4zyzuYa6aUe0btKi
 aHGvmtABHpGMGurIPPJMTIbFbRIeOcBL7UHk4k9kFdXX8jQxLh8BZWmgRNFeIT5UTthQ
 bodiEc7n9rAdzFbzoBIyrd4Nju6Ga4I8zCmAknGuL2ldNVzgAT/JeXDrR6qZZjEKiRGZ
 iBXGDp+M4lep8DGD6NBlN0GfSi8wzvz+B36ObnLUDPVciRCR3C8Xv5n5JNV7DI4pWbhH
 UpZQ==
X-Gm-Message-State: AAQBX9ek/VzvJgv1UdbClcfCYaYsJanMSGrqi3h4gTnRErqy/GINPmIH
 7UXqOvqzn8/QE7qWlWz7G17uQ6ic0oVHGOMLXfYaAQ==
X-Google-Smtp-Source: AKy350bIQo/9mA1ytvcDNUEaapfEg+kfYekEH3BIQxSuBh0eEJRichKnj01FOdNlxlgxYYScjklm2+r1l0zhYAyvmps=
X-Received: by 2002:a25:d40a:0:b0:b8f:32c4:5cc4 with SMTP id
 m10-20020a25d40a000000b00b8f32c45cc4mr3383651ybf.4.1681463364094; Fri, 14 Apr
 2023 02:09:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230403-immutable-irqchips-v1-0-503788a7f6e6@linaro.org>
In-Reply-To: <20230403-immutable-irqchips-v1-0-503788a7f6e6@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 14 Apr 2023 11:09:12 +0200
Message-ID: <CACRpkda8Lp2j_-RWfDb2AppRvkSQ0fdyS56RXS9_OsmeEXqxKg@mail.gmail.com>
To: Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Avi Fishman <avifishman70@gmail.com>, 
 Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
 Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
 Benjamin Fair <benjaminfair@google.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Marc Zyngier <maz@kernel.org>, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 0/9] Convert low hanging pinctrl irqchips
	to be immutable
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

T24gVHVlLCBBcHIgNCwgMjAyMyBhdCAxMTo0M+KAr0FNIExpbnVzIFdhbGxlaWogPGxpbnVzLndh
bGxlaWpAbGluYXJvLm9yZz4gd3JvdGU6Cgo+IFRoaXMgcmVwZWF0cyB0aGUgdHdvLWZvbGQgZXhl
cmNpc2UgaW4gdGhlIEdQSU8gc3Vic3lzdGVtCj4gYnkgZG9pbmcgdGhlIHNhbWUgZm9yIHBpbiBj
b250cm9sOiBsZXQncyBzd2l0Y2ggb3ZlciBhbGwKPiBlYXNpbHkgaWRlbnRpZmlhYmxlIGlycWNo
aXBzIHRvIGJlIGltbXV0YWJsZS4KPgo+IFNpZ25lZC1vZmYtYnk6IExpbnVzIFdhbGxlaWogPGxp
bnVzLndhbGxlaWpAbGluYXJvLm9yZz4KPiAtLS0KPiBMaW51cyBXYWxsZWlqICg5KToKPiAgICAg
ICBwaW5jdHJsOiBpcHJvYzogQ29udmVydCB0byBpbW11dGFibGUgaXJxX2NoaXAKPiAgICAgICBw
aW5jdHJsOiBuc3A6IENvbnZlcnQgdG8gaW1tdXRhYmxlIGlycV9jaGlwCj4gICAgICAgcGluY3Ry
bDogYXJtYWRhLTM3eHg6IENvbnZlcnQgdG8gaW1tdXRhYmxlIGlycV9jaGlwCj4gICAgICAgcGlu
Y3RybDogbnBjbTd4eDogQ29udmVydCB0byBpbW11dGFibGUgaXJxX2NoaXAKPiAgICAgICBwaW5j
dHJsOiBlcXVpbGlicml1bTogQ29udmVydCB0byBpbW11dGFibGUgaXJxX2NoaXAKPiAgICAgICBw
aW5jdHJsOiBtY3AyM3MwODogQ29udmVydCB0byBpbW11dGFibGUgaXJxX2NoaXAKPiAgICAgICBw
aW5jdHJsOiBzdDogQ29udmVydCB0byBpbW11dGFibGUgaXJxX2NoaXAKPiAgICAgICBwaW5jdHJs
OiBzdG1meDogQ29udmVydCB0byBpbW11dGFibGUgaXJxX2NoaXAKPiAgICAgICBwaW5jdHJsOiBz
eDE1MHg6IENvbnZlcnQgdG8gaW1tdXRhYmxlIGlycV9jaGlwCgpObyByZWFjdGlvbiB0byB0aGVz
ZSBwYXRjaGVzLCBzbyBJIGp1c3QgbWVyZ2VkIHRoZW0uCgpZb3VycywKTGludXMgV2FsbGVpagpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0z
MiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpo
dHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51
eC1zdG0zMgo=
