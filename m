Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1266C5148
	for <lists+linux-stm32@lfdr.de>; Wed, 22 Mar 2023 17:52:35 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F22BBC6A5F6;
	Wed, 22 Mar 2023 16:52:34 +0000 (UTC)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com
 [209.85.217.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 26866C65E59
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Mar 2023 16:52:34 +0000 (UTC)
Received: by mail-vs1-f50.google.com with SMTP id cz11so10330163vsb.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Mar 2023 09:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1679503953;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1VOeoUcGtu8I/LNjwpgSIfUemk29T20g+8kE34NnXUY=;
 b=B+Pel4iYm4+myzpPtGIv8tSiY2AGXnr3Lg85FHBpdckoFQF2IH0E/4//gOTUUshGhY
 omJhWZ+4mkixXkTF/Ws/L9s1ZI4gvXdjfZ/i/zqoajAHcQ3KM1zbvwoZuQ4hCHRh+gQC
 J172P5aMjumBuF/sqoanpzFrvXSPD4S+hROOb/pqSoYFyrUDGS2Th6Gdj9ntNE3XiN0r
 OOw0av91RF6BIndkZUJwLAscJwM7m4ocQSN6La2ejQcor3PLocMcUAtDQjMqQQcs4wEE
 pX8IhKdMc1OzvOzIyS5alNcRoMOp8uxFon0WHmrhVxKDcn9TGfJllaQ3gRh/aKWRuOxB
 uAYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679503953;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1VOeoUcGtu8I/LNjwpgSIfUemk29T20g+8kE34NnXUY=;
 b=GcOqIIDwENLjfguD1qaLizimiIGAGmuCmGP1DkyNZ+w0GO50e4aWEAb9sSHfnF6E66
 4Me2rWVY463B3aVWerjnwQlT4cj1056oeQkKkLjLqSM5GdFlbmjiGA/U1g706nxgdAgA
 GJTm9ktO5UwMF42GPVWrkFl9Yx8Wk0S/MgCYhLJ5JFe3HqH55ZNFCVI1Ok6VbBPzAI2J
 JaGbNXMo5vcnwDTCtOs23ycCPfCxHvYYv90G0LJLr4/sRuYL5EBYxunAohol+8S75EC9
 B+J78iuX9tfNXoEmeX9r2xO8AImZA0qGV1a/JWiTM2YMEBqtYaKmaxvXUk+f+KS+YHv3
 jQzg==
X-Gm-Message-State: AO0yUKX4+kX5lgq8wruD3V2LIDnxyk5JtooMs3rclMeDYgHp9ZoO1D4V
 eq68KMO6rtI2FtyRPq5SXkRdP6rY/PikhAJIAV5s6g==
X-Google-Smtp-Source: AK7set9uqvOFeY69mtvgqjWDOW7WFoxn2AmLfYZ6iHFg9tp/cYqBk8yxKQyfO17Xrbl4/yDoBerqEoXm5s5UPnJVDG0=
X-Received: by 2002:a05:6102:4751:b0:425:d6a1:173d with SMTP id
 ej17-20020a056102475100b00425d6a1173dmr102213vsb.0.1679503953023; Wed, 22 Mar
 2023 09:52:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230316-immutable-chips-2-v1-0-053d6ede831b@linaro.org>
In-Reply-To: <20230316-immutable-chips-2-v1-0-053d6ede831b@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 22 Mar 2023 17:52:21 +0100
Message-ID: <CAMRc=Mc-UL-Yz4V+svG-b94zFevYKm5MKpOAY36iiN36JthLZw@mail.gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-kernel@vger.kernel.org, Srinivas Neeli <srinivas.neeli@xilinx.com>,
 Robert Richter <rric@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Scott Branden <sbranden@broadcom.com>, Manivannan Sadhasivam <mani@kernel.org>,
 Ray Jui <rjui@broadcom.com>,
 Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
 Michal Simek <michal.simek@xilinx.com>, linux-gpio@vger.kernel.org,
 Thorsten Scherer <t.scherer@eckelmann.de>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Marc Zyngier <maz@kernel.org>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 linux-unisoc@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 0/9] Mass convert GPIO IRQ chips to be
	immutable part 2
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

T24gTW9uLCBNYXIgMjAsIDIwMjMgYXQgMTA6NTXigK9BTSBMaW51cyBXYWxsZWlqIDxsaW51cy53
YWxsZWlqQGxpbmFyby5vcmc+IHdyb3RlOgo+Cj4gRm9sbG93aW5nIHVwIG9uIG15IGZpcnN0IHNl
cmllcyB3aXRoIHRoaXMgc2Vjb25kIHNlcmllcwo+IGNvbmNsdWRpbmcgYWxsIHRoZSBsb3ctaGFu
Z2luZyBpbW11dGFibGUgaXJxY2hpcCBjb252ZXJzaW9ucwo+IGluIHRoZSBHUElPIHN1YnN5c3Rl
bS4gVGhlc2UgYXJlIGFsbCBJIGNvdWxkIGVhc2lseQo+IGNvbnZlcnQuCj4KPiBUaGUgcmVtYWlu
aW5nIGlycWNoaXBzIGFyZSBub3QgdXNpbmcgdGhlIEdQSU9MSUJfSVJRQ0hJUAo+IGZvciBvbmUg
b3IgYW5vdGhlciByZWFzb24sIG9yIHRvbyBjb21wbGV4IGZvciBtZSB0bwo+IGRlYWwgd2l0aC4g
TW9zdGx5IHRoZXkgYXJlIHVzaW5nIGdlbmVyaWMgaXJxY2hpcCwgYW5kCj4gSSBndWVzcyB0aG9z
ZSBhcmUgZmluZSBhcy1pcy4KPgo+IFNpZ25lZC1vZmYtYnk6IExpbnVzIFdhbGxlaWogPGxpbnVz
LndhbGxlaWpAbGluYXJvLm9yZz4KPiAtLS0KPiBMaW51cyBXYWxsZWlqICg5KToKPiAgICAgICBn
cGlvOiByZGE6IENvbnZlcnQgdG8gaW1tdXRhYmxlIGlycV9jaGlwCj4gICAgICAgZ3Bpbzogc2lv
eDogQ29udmVydCB0byBpbW11dGFibGUgaXJxX2NoaXAKPiAgICAgICBncGlvOiBzdG1wZTogQ29u
dmVydCB0byBpbW11dGFibGUgaXJxX2NoaXAKPiAgICAgICBncGlvOiB0aHVuZGVyeDogQ29udmVy
dCB0byBpbW11dGFibGUgaXJxX2NoaXAKPiAgICAgICBncGlvOiB0cW14ODY6IENvbnZlcnQgdG8g
aW1tdXRhYmxlIGlycV9jaGlwCj4gICAgICAgZ3BpbzogdmlzY29udGk6IENvbnZlcnQgdG8gaW1t
dXRhYmxlIGlycV9jaGlwCj4gICAgICAgZ3BpbzogeGdzLWlwcm9jOiBDb252ZXJ0IHRvIGltbXV0
YWJsZSBpcnFfY2hpcAo+ICAgICAgIGdwaW86IHhpbGlueDogQ29udmVydCB0byBpbW11dGFibGUg
aXJxX2NoaXAKPiAgICAgICBncGlvOiB4bHA6IENvbnZlcnQgdG8gaW1tdXRhYmxlIGlycV9jaGlw
Cj4KPiAgZHJpdmVycy9ncGlvL2dwaW8tcmRhLmMgICAgICAgfCAyMiArKysrKysrLS0tLS0tCj4g
IGRyaXZlcnMvZ3Bpby9ncGlvLXNpb3guYyAgICAgIHwgNzUgKysrKysrKysrKysrKysrKysrKysr
Ky0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICBkcml2ZXJzL2dwaW8vZ3Bpby1zdG1wZS5jICAgICB8
ICA4ICsrKy0tCj4gIGRyaXZlcnMvZ3Bpby9ncGlvLXRodW5kZXJ4LmMgIHwgMjYgKysrKysrKysr
LS0tLS0tCj4gIGRyaXZlcnMvZ3Bpby9ncGlvLXRxbXg4Ni5jICAgIHwgMjggKysrKysrKysrKyst
LS0tLQo+ICBkcml2ZXJzL2dwaW8vZ3Bpby12aXNjb250aS5jICB8IDUwICsrKysrKysrKysrKysr
KysrKysrKystLS0tLS0tCj4gIGRyaXZlcnMvZ3Bpby9ncGlvLXhncy1pcHJvYy5jIHwgMzIgKysr
KysrKysrKysrLS0tLS0tCj4gIGRyaXZlcnMvZ3Bpby9ncGlvLXhpbGlueC5jICAgIHwgMjMgKysr
KysrKystLS0tLQo+ICBkcml2ZXJzL2dwaW8vZ3Bpby14bHAuYyAgICAgICB8IDE0ICsrKysrKy0t
Cj4gIDkgZmlsZXMgY2hhbmdlZCwgMTgxIGluc2VydGlvbnMoKyksIDk3IGRlbGV0aW9ucygtKQo+
IC0tLQo+IGJhc2UtY29tbWl0OiBmZTE1YzI2ZWUyNmVmYTExNzQxYTdiNjMyZTlmMjNiMDFhY2E0
Y2M2Cj4gY2hhbmdlLWlkOiAyMDIzMDMxNi1pbW11dGFibGUtY2hpcHMtMi1hZDI4MDhkYjgwNTQK
Pgo+IEJlc3QgcmVnYXJkcywKPiAtLQo+IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGlu
YXJvLm9yZz4KPgoKU2VyaWVzIGFwcGxpZWQsIHRoYW5rcyEKCkJhcnQKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0
CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
