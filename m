Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BBFC8B2E59A
	for <lists+linux-stm32@lfdr.de>; Wed, 20 Aug 2025 21:31:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 74F2CC3F94F;
	Wed, 20 Aug 2025 19:31:23 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A8853C3087A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 Aug 2025 19:31:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 3660E468C9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 Aug 2025 19:31:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB258C19423
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 Aug 2025 19:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755718280;
 bh=JdMnN/QvHNdC14uZpSWSeOLbLF7avgHXV6bfeFE314E=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Yu6IS+2rAMGJh231e/ku6+3QUu1+1Ein3CYcEm1ASrU/len+ETeYqFXARZKfFTbxs
 VgoLqHIPCKXW8EPPpVEm6J+F5kQ0nEOyiKop/hyK+VCdh5zIF7HJyuOWhgBG94kUsS
 +uGHWN65CsHOZFmjGv+7fbZN7+3YpZPA+ozyk9LmyK9zGPiLkBFJvTQ9xUG+ElYjp+
 L0yvbMet50tW8sX27/KLFikx9dk7CMlw7VnqpNiylgCNb036CP4II/90qQ8nZUcQqZ
 0yx9rJ3mM3w/BTO/lK2WQFhYjMViWN9qJVjaOJlXwWEkTk4e5YW2btkMQnukIibZPP
 prFynl2iw6Jtg==
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-619487c8865so2241267a12.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 Aug 2025 12:31:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCU53unbG+/eyayo7Osroakvva7ewcVwkV0ojyOWP6+SVsRech0FvgdkVbFh2Ttv0eAo9qLD1WM+ls/z1A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzRiz3i5O9ot6Vvm0uWTZOp0StCcYrRQKR8S3DDanC3Fk3lb+5r
 b+eBN8HY4sIOUG4I5ioT8GKqjTqks5obnmq7acBvkCWfV8S4KaHdhd4J1+i8Gj32CEsziCkp7Z+
 2LwqUZd5e5qDCKrW/YV0RbtpMrBvPDw==
X-Google-Smtp-Source: AGHT+IHMduLqupXwUu5+wGeCnTMcG3KEnZjSMqXY8A1R3KzTvJxS2yEXoVkoMeeJWEbKS/NfptZmMJOd2EyU0/q6v2E=
X-Received: by 2002:a17:907:6e8b:b0:afc:aac3:6d2 with SMTP id
 a640c23a62f3a-afe02b475a2mr72725966b.2.1755718278469; Wed, 20 Aug 2025
 12:31:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250819213831.1368296-1-robh@kernel.org>
 <CAEnQRZDga2cX=YPY5Z9NDyro94bxFjK9k5Xm5Vt2vVzf4ysKyA@mail.gmail.com>
In-Reply-To: <CAEnQRZDga2cX=YPY5Z9NDyro94bxFjK9k5Xm5Vt2vVzf4ysKyA@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 20 Aug 2025 14:31:07 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJ1btLjZO_Z7H+qYZhWwTn0Wpq4Ji=deKdUxTwLHw-pTA@mail.gmail.com>
X-Gm-Features: Ac12FXyzu14Kh1oSkN3MJaRVyez-SIK2NK1snFRbS1U4LOUdSfMmoXWd92DoGYw
Message-ID: <CAL_JsqJ1btLjZO_Z7H+qYZhWwTn0Wpq4Ji=deKdUxTwLHw-pTA@mail.gmail.com>
To: Daniel Baluta <daniel.baluta@gmail.com>
Cc: imx@lists.linux.dev, Peng Fan <peng.fan@nxp.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-remoteproc@vger.kernel.org,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Magnus Damm <magnus.damm@gmail.com>, Aisheng Dong <aisheng.dong@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Iuliana Prodan <iuliana.prodan@nxp.com>, linux-arm-msm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-arm-kernel@lists.infradead.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>,
 linux-renesas-soc@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v5] remoteproc: Use
	of_reserved_mem_region_* functions for "memory-region"
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

T24gV2VkLCBBdWcgMjAsIDIwMjUgYXQgMzoxOeKAr0FNIERhbmllbCBCYWx1dGEgPGRhbmllbC5i
YWx1dGFAZ21haWwuY29tPiB3cm90ZToKPgo+IEhpIFJvYiwKPgo+IFRoaXMgcGF0Y2ggd2lsbCBi
cmVhayBJTVggUlBST0Mgc3VwcG9ydC4KPiA8c25pcD4KPgo+ID4gLS0tIGEvZHJpdmVycy9yZW1v
dGVwcm9jL2lteF9ycHJvYy5jCj4gPiArKysgYi9kcml2ZXJzL3JlbW90ZXByb2MvaW14X3Jwcm9j
LmMKPgo+IDxzbmlwPgo+ID4gIHN0YXRpYyBpbnQgaW14X3Jwcm9jX3BhcnNlX2Z3KHN0cnVjdCBy
cHJvYyAqcnByb2MsIGNvbnN0IHN0cnVjdCBmaXJtd2FyZSAqZncpCj4gPHNuaXA+Cj4KPiA+IC0g
ICAgICAgICAgICAgICBwcml2LT5tZW1bYl0uY3B1X2FkZHIgPSBkZXZtX2lvcmVtYXBfd2MoJnBk
ZXYtPmRldiwgcmVzLnN0YXJ0LCByZXNvdXJjZV9zaXplKCZyZXMpKTsKPiA+ICsgICAgICAgICAg
ICAgICBwcml2LT5tZW1bYl0uY3B1X2FkZHIgPSBkZXZtX2lvcmVtYXBfcmVzb3VyY2Vfd2MoJnBk
ZXYtPmRldiwgJnJlcyk7Cj4KPiBkZXZtX2lvcmVtYXBfcmVzb3VyY2Vfd2Mgd29ya3Mgb25seSBm
b3IgSU9SRVNPVVJDRV9NRU0gcmVzb3VyY2VzOgo+Cj4gbGliL2RldnJlcy5jOjEyNAo+IHN0YXRp
YyB2b2lkIF9faW9tZW0gKgo+IF9fZGV2bV9pb3JlbWFwX3Jlc291cmNlKHN0cnVjdCBkZXZpY2Ug
KmRldiwgY29uc3Qgc3RydWN0IHJlc291cmNlICpyZXMsCj4KPiDCuyAgICAgICBpZiAoIXJlcyB8
fCByZXNvdXJjZV90eXBlKHJlcykgIT0gSU9SRVNPVVJDRV9NRU0pIHsKPiDCuyAgICAgICDCuyAg
ICAgICByZXQgPSBkZXZfZXJyX3Byb2JlKGRldiwgLUVJTlZBTCwgImludmFsaWQgcmVzb3VyY2UK
PiAlcFJcbiIsIHJlcyk7Cj4gwrsgICAgICAgwrsgICAgICAgcmV0dXJuIElPTUVNX0VSUl9QVFIo
cmV0KTsKPiDCuyAgICAgICB9Cj4KPiB3aGlsZSB0aGUgZGV2bV9pb3JlbWFwX3djIGRvZXNuJ3Qg
Y2FyZSBhYm91dCB0aGlzLgo+Cj4gU28gd2UgY2Fubm90IHVzZSBkZXZtX2lvcmVtYXBfcmVzb3Vy
Y2Vfd2MgaGVyZSB1bmxlc3MgeW91IGFkZAo+IElPUkVTT1VSQ0VfTUVNIGZsYWdzCj4gdG8gIG9m
X3Jlc2VydmVkX21lbV9yZWdpb25fdG9fcmVzb3VyY2UgYXMgZGlzY3Vzc2VkIGhlcmU6Cj4KPiBo
dHRwczovL2xrbWwub3JnL2xrbWwvMjAyNS80LzI4Lzc1OQo+Cj4gVGhlIHNhbWUgaXNzdWUgd2Ug
YXJlIGFscmVhZHkgZXhwZXJpZW5jaW5nIHdpdGggU291bmQgT3BlbiBGaXJtd2FyZQo+IHdoZXJl
IHRoZSBjaGFuZ2Ugd2FzIGFscmVhZHkgbWVyZ2VkCj4gYW5kIHdlIGhhdmUgYSBidWcgYWxyZWFk
eSByZXBvcnRlZC4KPgo+IEhvdyBzaG91bGQgd2UgZml4IHRoaXM6Cj4KPiAxKSBBZGQgIHJlcy0+
ZmxhZ3MgPSBJT1JFU09VUkNFX01FTTsgaW4gIG9mX3Jlc2VydmVkX21lbV9yZWdpb25fdG9fcmVz
b3VyY2UKClNpZ2guIEkgdGhvdWdodCBJIHJvbGxlZCB0aGF0IGNoYW5nZSBpbnRvIGl0LiBJIGp1
c3Qgc2VudCBhIGZpeFsxXS4KClJvYgoKWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8y
MDI1MDgyMDE5MjgwNS41NjU1NjgtMS1yb2JoQGtlcm5lbC5vcmcvCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApM
aW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
