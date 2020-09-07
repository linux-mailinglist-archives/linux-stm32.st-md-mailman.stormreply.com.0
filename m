Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EF74525F746
	for <lists+linux-stm32@lfdr.de>; Mon,  7 Sep 2020 12:08:01 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8C9DCC36B37;
	Mon,  7 Sep 2020 10:08:01 +0000 (UTC)
Received: from mail-ua1-f66.google.com (mail-ua1-f66.google.com
 [209.85.222.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 69B4DC36B35
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  7 Sep 2020 10:07:58 +0000 (UTC)
Received: by mail-ua1-f66.google.com with SMTP id v5so3788769uau.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 07 Sep 2020 03:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=QuNLltsEiIW4LCbpFyTWl1p44IkTT3QJmbdClg97dn0=;
 b=GdR9hDKN5L9o4E+D9klMf226TdSBiyQrmIJFqTy1wvu7JgUOP5hnq9D/dbGUt34nVN
 XTE9ZkkMZYDWJkEj8/LXyenZz3T0Irx/WXSUQIYDB4F7XGGOjeU/eP0cHxgH70gtpxoS
 593wZnUVUiqgZqhmNZJBvdbDOEAjelVZNg7W3uJxmMeE2W2+4ryrLED4uLWr5d2on/1Y
 V+k0+LPGbknr9eHhBtS9n9cOKc/o9fFLWU4T/+6C9EhAuV3OtNNgAG8pjet6UXydTeg8
 /OlJ55P8StYowRupDWz7iqCrO55GZV8SHF0Qf78K+dPX1qyWPG1Pi5uUN5Re3N+8QgpF
 Opsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=QuNLltsEiIW4LCbpFyTWl1p44IkTT3QJmbdClg97dn0=;
 b=PzvC53A1t990XL1/ze5Mz0XI4f1EPOOokmRimMX1rkyltMtXjGLNJziVfn31QtscVk
 V2ZdN3aw+5t02xpFFzfHj6L6Bj++idL5hyWVO34O/TNTlTqvMpYlpamIwO3LgOVzHkJ8
 Xr1dqMMaXlsQk9546uXAId7h0UBWAitMa3giZxf99e1VjrcJsV5HWkh4NmTaYE+Ru21W
 l7ylHnmo23qPIruY0dEiZFX1Y7MmWfii/bDQpTGjL96fsJilPx/qBD687yxdvh/Lb9JT
 /UhpGRRfxf+rH/eINzfzMa14/QihYMmnpddpOo1/7uZ3sSMNJM4/vzVR8IJL4g1EJUkK
 7+yg==
X-Gm-Message-State: AOAM533viH39EUcqRh8SzOLUNZtjzA2scTeaZHXJrjbkb5mMKKynsVqY
 ZVs9t1UDAIyXUrI7cXHEwJSUFfhzmRXg9S0nVqoyaw==
X-Google-Smtp-Source: ABdhPJylvGTfdGwP02Q+D0hgvcDauwlOQni6HAn5s7aLot2eLwS2w0Wmn0FgXWKx98K2aaDsiVxs7F4QHZfQitRnsZs=
X-Received: by 2002:ab0:130a:: with SMTP id g10mr1522518uae.100.1599473277782; 
 Mon, 07 Sep 2020 03:07:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200904164315.24618-1-krzk@kernel.org>
In-Reply-To: <20200904164315.24618-1-krzk@kernel.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 7 Sep 2020 12:07:21 +0200
Message-ID: <CAPDyKFrzDeNqvM4cc69iCdVW7QnF=O9C=v13+o5bGBSCSzZfWA@mail.gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-omap <linux-omap@vger.kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arm-kernel@axis.com, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Manjunath M B <manjumb@synopsys.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Prabu Thangamuthu <prabu.t@synopsys.com>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 linux-tegra <linux-tegra@vger.kernel.org>,
 Manuel Lauss <manuel.lauss@gmail.com>, Kishon Vijay Abraham I <kishon@ti.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v2 1/2] mmc: host: Drop unneeded MMC
	dependency in Kconfig
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

T24gRnJpLCA0IFNlcCAyMDIwIGF0IDE4OjQzLCBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gQWxsIGVudHJpZXMgaW4gS2NvbmZpZyBhcmUgYWxyZWFkeSBw
YXJ0IG9mICJpZiBNTUMiLCBzbyB0aGVyZSBpcyBubyBuZWVkCj4gZm9yIGFkZGl0aW9uYWwgZGVw
ZW5kZW5jeSBvbiBNTUMuCj4KPiBTdWdnZXN0ZWQtYnk6IE1pY2hhxYIgTWlyb3PFgmF3IDxtaXJx
LWxpbnV4QHJlcmUucW1xbS5wbD4KPiBTaWduZWQtb2ZmLWJ5OiBLcnp5c3p0b2YgS296bG93c2tp
IDxrcnprQGtlcm5lbC5vcmc+CgpBcHBsaWVkIGZvciBuZXh0LCB0aGFua3MhCgpLaW5kIHJlZ2Fy
ZHMKVWZmZQoKCj4KPiAtLS0KPgo+IENoYW5nZXMgc2luY2UgdjE6Cj4gMS4gTmV3IHBhdGNoCj4g
LS0tCj4gIGRyaXZlcnMvbW1jL2hvc3QvS2NvbmZpZyB8IDQgKystLQo+ICAxIGZpbGUgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvbW1jL2hvc3QvS2NvbmZpZyBiL2RyaXZlcnMvbW1jL2hvc3QvS2NvbmZpZwo+IGluZGV4IGI5
NWY3OWY1MzM5NS4uZWVhMDFmZGUwNTkxIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbW1jL2hvc3Qv
S2NvbmZpZwo+ICsrKyBiL2RyaXZlcnMvbW1jL2hvc3QvS2NvbmZpZwo+IEBAIC00MjIsNyArNDIy
LDcgQEAgY29uZmlnIE1NQ19TREhDSV9JUFJPQwo+Cj4gIGNvbmZpZyBNTUNfTUVTT05fR1gKPiAg
ICAgICAgIHRyaXN0YXRlICJBbWxvZ2ljIFM5MDUvR1gqL0FYRyBTRC9NTUMgSG9zdCBDb250cm9s
bGVyIHN1cHBvcnQiCj4gLSAgICAgICBkZXBlbmRzIG9uIEFSQ0hfTUVTT04gJiYgTU1DCj4gKyAg
ICAgICBkZXBlbmRzIG9uIEFSQ0hfTUVTT04KPiAgICAgICAgIGhlbHAKPiAgICAgICAgICAgVGhp
cyBzZWxlY3RzIHN1cHBvcnQgZm9yIHRoZSBBbWxvZ2ljIFNEL01NQyBIb3N0IENvbnRyb2xsZXIK
PiAgICAgICAgICAgZm91bmQgb24gdGhlIFM5MDUvR1gqL0FYRyBmYW1pbHkgb2YgU29Dcy4gIFRo
aXMgY29udHJvbGxlciBpcwo+IEBAIC00NTgsNyArNDU4LDcgQEAgY29uZmlnIE1NQ19NRVNPTl9N
WF9TRElPCj4KPiAgY29uZmlnIE1NQ19NT1hBUlQKPiAgICAgICAgIHRyaXN0YXRlICJNT1hBUlQg
U0QvTU1DIEhvc3QgQ29udHJvbGxlciBzdXBwb3J0Igo+IC0gICAgICAgZGVwZW5kcyBvbiBBUkNI
X01PWEFSVCAmJiBNTUMKPiArICAgICAgIGRlcGVuZHMgb24gQVJDSF9NT1hBUlQKPiAgICAgICAg
IGhlbHAKPiAgICAgICAgICAgVGhpcyBzZWxlY3RzIHN1cHBvcnQgZm9yIHRoZSBNT1hBUlQgU0Qv
TU1DIEhvc3QgQ29udHJvbGxlci4KPiAgICAgICAgICAgTU9YQSBwcm92aWRlcyBvbmUgbXVsdGkt
ZnVuY3Rpb25hbCBjYXJkIHJlYWRlciB3aGljaCBjYW4KPiAtLQo+IDIuMTcuMQo+Cl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxp
bmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8v
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMy
Cg==
