Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F5482B08A
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Jan 2024 15:24:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4CB9AC6DD73;
	Thu, 11 Jan 2024 14:24:22 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com
 [209.85.128.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DB1E5C6B452
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Jan 2024 14:24:20 +0000 (UTC)
Received: by mail-yw1-f171.google.com with SMTP id
 00721157ae682-5ebca94cf74so52996207b3.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Jan 2024 06:24:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704983059; x=1705587859;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b5H4wGjXC1DdLzQIpv3zBJ0pf8Lkdr1yQJoU8LqpgzM=;
 b=Vxeawz/2subZBimKENL4WFjUFDF4djbg0obcQLuWsU+bDm/DmtvCuz0qN+nJuIiRJy
 DDXVuxEFjmoPmQrwsEtnUKL2f9guorOU7r0+S54+q3fxIJl1HXumGCC+Onfrvrzd7jy+
 WZ0tGzNPH9L66P1RjzuKMLo4hKX4wCGkAi2XFllpwcl4P134vP4xB6m0Xchl0rxcYp9g
 RcZ3nhqwL4RiMljw046iDen8RRCak+0KMNWHUN6fN/mZxBnxW17TB8ZqV+w7dWXPXErL
 zXXns7Xf4NbThQHl1wjuCI0g65Pe7bgTVPH+nuAVukD8cumQ0+N+uKNwPvw+IwXhZndM
 UmdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704983059; x=1705587859;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b5H4wGjXC1DdLzQIpv3zBJ0pf8Lkdr1yQJoU8LqpgzM=;
 b=A05gI1klRuKzuGAHATMUJQLd3wxpA8hMSVlM6gxyz1qjwwvV4cHaasE6FQkhmyA2xG
 Bs1MuTWw9pHD++UwVt2gglivTLnx5nIuTrHdf9Hs74n7T1euRbRQM99yn0+M257FdIMF
 qcdaV/oEgwWi1IJnw2ksY5IWqIIYJUZ4Eep3Ve7iBTkvouxGo7yBXsoVfcJPyoQKqpRw
 bFTJmfC4vJiIGzbk4VIgXh2tngvwDjZBEwW6DgVKkeCj5wMy7Oth2xhBQVxK9IDFfACI
 ylLERgTpWu9wYh91w1+ndOeSKG/Xp8cinkaH9B9nLqYKx6+20j45wXREiHo98ugQS5yF
 tRFQ==
X-Gm-Message-State: AOJu0YxHiPhFK9dl1qf8gLP+YT0NHmDPVMh81eXjilhvWBKjh5GbWmWy
 BQQ6HPPb5/PtwedJUpmlab30MKsUYDBbycUszuZOojdyg70q/Q==
X-Google-Smtp-Source: AGHT+IFaYmLOxFxDAbrD29zJ5P+ZteNYH0C8/fah2rkfr0pwnrnR+2kJeW7gA7vd5Qa94LgZL5/dHpczsnOz/Isabo8=
X-Received: by 2002:a81:d845:0:b0:5f8:ddb6:f38 with SMTP id
 n5-20020a81d845000000b005f8ddb60f38mr564900ywl.0.1704983059775; Thu, 11 Jan
 2024 06:24:19 -0800 (PST)
MIME-Version: 1.0
References: <20240111113146.16011-1-dario.binacchi@amarulasolutions.com>
 <20240111113146.16011-6-dario.binacchi@amarulasolutions.com>
In-Reply-To: <20240111113146.16011-6-dario.binacchi@amarulasolutions.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 11 Jan 2024 15:24:08 +0100
Message-ID: <CACRpkdbvwmvdv1oH6A2a+BHJ7y0gqAU1O5ZM5grAMnrrMRMdQg@mail.gmail.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Andre Przywara <andre.przywara@arm.com>, Lee Jones <lee@kernel.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Michal Simek <michal.simek@amd.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sean Nyekjaer <sean@geanix.com>,
 =?UTF-8?Q?Leonard_G=C3=B6hrs?= <l.goehrs@pengutronix.de>,
 linux-amarula@amarulasolutions.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v7 5/5] ARM: dts: add
	stm32f769-disco-mb1225-revb03-mb1166-reva09
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

T24gVGh1LCBKYW4gMTEsIDIwMjQgYXQgMTI6MzHigK9QTSBEYXJpbyBCaW5hY2NoaQo8ZGFyaW8u
YmluYWNjaGlAYW1hcnVsYXNvbHV0aW9ucy5jb20+IHdyb3RlOgoKPiBBcyByZXBvcnRlZCBpbiB0
aGUgc2VjdGlvbiA4LjMgKGkuIGUuIEJvYXJkIHJldmlzaW9uIGhpc3RvcnkpIG9mIGRvY3VtZW50
Cj4gVU0yMDMzIChpLiBlLiBEaXNjb3Zlcnkga2l0IHdpdGggU1RNMzJGNzY5TkkgTUNVKSB0aGVz
ZSBhcmUgdGhlIGNoYW5nZXMKPiByZWxhdGVkIHRvIHRoZSBib2FyZCByZXZpc2lvbnMgYWRkcmVz
c2VkIGJ5IHRoZSBwYXRjaDoKPiAtIEJvYXJkIE1CMTIyNSByZXZpc2lvbiBCLTAzOgo+ICAgLSBN
ZW1vcnkgTUlDUk9OIE1UNDhMQzRNMzJCMkI1LTZBIHJlcGxhY2VkIGJ5IElTU0kgSVM0MlMzMjQw
MEYtNkJMCj4gLSBCb2FyZCBNQjExNjYgcmV2aXNpb24gQS0wOToKPiAgIC0gTENEIEZSSURBIEZS
RDM5N0IyNTAwOS1ELUNUSyByZXBsYWNlZCBieSBGUklEQSBGUkQ0MDBCMjUwMjUtQS1DVEsKPgo+
IFRoZSBwYXRjaCBvbmx5IGFkZHMgdGhlIERUUyBzdXBwb3J0IGZvciB0aGUgbmV3IGRpc3BsYXkg
d2hpY2ggYmVsb25ncyB0bwo+IHRvIHRoZSBOb3ZhdGVrIE5UMzU1MTAtYmFzZWQgcGFuZWwgZmFt
aWx5Lgo+Cj4gU2lnbmVkLW9mZi1ieTogRGFyaW8gQmluYWNjaGkgPGRhcmlvLmJpbmFjY2hpQGFt
YXJ1bGFzb2x1dGlvbnMuY29tPgoKTG9va3MgZ29vZCB0byBtZSEKUmV2aWV3ZWQtYnk6IExpbnVz
IFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4KCllvdXJzLApMaW51cyBXYWxsZWlq
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0
bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
Cmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXN0bTMyCg==
