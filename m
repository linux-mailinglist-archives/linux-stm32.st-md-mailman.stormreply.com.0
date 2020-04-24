Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D6A1B6F3B
	for <lists+linux-stm32@lfdr.de>; Fri, 24 Apr 2020 09:45:22 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C69A5C36B0B;
	Fri, 24 Apr 2020 07:45:21 +0000 (UTC)
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
 [209.85.221.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 64770C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Apr 2020 07:45:20 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id b11so9550177wrs.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Apr 2020 00:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=SG53LOGVaYSrSbMxtiTrlXAzhLKqp75bh+EmCNg5dN0=;
 b=a+DsWnfI8BxEYpw24cMf1ubciUzpfQylo8DC8e2EEMjIGJAT5XO0tgJRc4zm/7UKFj
 yP+UatvpM1GtMmXPpD5t6YQ4MasDgMtoYBWExtSpG/3qslXrxpKJuKOxPK6aDwnRbbNW
 6yJkklIByWlX/orJ1QKHiLb1RV9hXPUxXRysqlf+BZvjvB7SyZ++FH1taB7SxqUTSMKd
 Mj7oXh41AlY1haAGy3/VSB+UViganSyx20+MVCqJlMMbYhZ1eBZnDu7arB/dsxjdJR9g
 cMWMghusSfqfUS/ZTQ+cVhwDE8raguIokO5x2X3TnwoyGJPxoQ5N3TuXUvUMUuXGQXsL
 2u6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=SG53LOGVaYSrSbMxtiTrlXAzhLKqp75bh+EmCNg5dN0=;
 b=ETdHhqouXEeeztjdUbcN4GWvyA07bL43hQg4fUxawmytJTuoT4SZPKuBg3M5CwszPj
 /SqPkn/2RbOKfxk0R4uzQ1ASoK50iufUI3lDA9O+T+dEsGyass9vJwGzjjr/aAo3Kezm
 q/m03L4vQHXmSPrMucSWNwJBoZbFcihdoBGG5MSIkMiR2FtkuikHjj9P14CnRt5wc6MK
 A0U2LFGRN9/bYBWS0rnMqm3fUlToCzJl91T3098BNvhREz/SAsmNGe1bRW0BaNHc/enJ
 0VNgJmP219duWUdSZxgg/4DjcGcQbWUEmJ/92HbFYRU/9iEIoAOcKJGtjd4lw5WoQ7mO
 bawA==
X-Gm-Message-State: AGi0PuZ3A2FdBvURty0tHvKOQLukyCMzzzRHV01Dr61WNbJGln89d7V9
 8Ywz7TwxyoxvUTjYy8xgObIFaw==
X-Google-Smtp-Source: APiQypJQnsAmYnrESuH25hDMC1DnFFclkWGp9gSfFlUxWpilxTxaT5ID13BjavkGNKAVWmlFxdLMmw==
X-Received: by 2002:adf:82f5:: with SMTP id 108mr9200402wrc.43.1587714320260; 
 Fri, 24 Apr 2020 00:45:20 -0700 (PDT)
Received: from dell ([2.31.163.63])
 by smtp.gmail.com with ESMTPSA id o3sm7034174wru.68.2020.04.24.00.45.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Apr 2020 00:45:18 -0700 (PDT)
Date: Fri, 24 Apr 2020 08:45:17 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Christophe Kerello <christophe.kerello@st.com>
Message-ID: <20200424074517.GN3612@dell>
References: <1586966256-29548-1-git-send-email-christophe.kerello@st.com>
 <1586966256-29548-3-git-send-email-christophe.kerello@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1586966256-29548-3-git-send-email-christophe.kerello@st.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, marex@denx.de,
 vigneshr@ti.com, tony@atomide.com, richard@nod.at,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2 02/12] mfd: stm32-fmc2: add STM32 FMC2
 controller driver
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

T24gV2VkLCAxNSBBcHIgMjAyMCwgQ2hyaXN0b3BoZSBLZXJlbGxvIHdyb3RlOgoKPiBUaGUgZHJp
dmVyIGFkZHMgdGhlIHN1cHBvcnQgZm9yIHRoZSBTVE1pY3JvZWxlY3Ryb25pY3MgRk1DMiBjb250
cm9sbGVyCj4gZm91bmQgb24gU1RNMzJNUCBTT0NzLgo+IAo+IFRoZSBGTUMyIGZ1bmN0aW9uYWwg
YmxvY2sgbWFrZXMgdGhlIGludGVyZmFjZSB3aXRoOiBzeW5jaHJvbm91cyBhbmQKPiBhc3luY2hy
b25vdXMgc3RhdGljIG1lbW9yaWVzIChzdWNoIGFzIFBTTk9SLCBQU1JBTSBvciBvdGhlcgo+IG1l
bW9yeS1tYXBwZWQgcGVyaXBoZXJhbHMpIGFuZCBOQU5EIGZsYXNoIG1lbW9yaWVzLgo+IAo+IFNp
Z25lZC1vZmYtYnk6IENocmlzdG9waGUgS2VyZWxsbyA8Y2hyaXN0b3BoZS5rZXJlbGxvQHN0LmNv
bT4KPiAtLS0KPiBDaGFuZ2VzIGluIHYyOgo+ICAtIHJlbW92ZSBvcHMgZnJvbSBzdG0zMl9mbWMy
IHN0cnVjdHVyZQo+ICAtIGFkZCAyIEFQSXMgdG8gbWFuYWdlIEZNQzIgZW5hYmxlL2Rpc2FibGUK
PiAgLSBhZGQgMiBBUElzIHRvIG1hbmFnZSBGTUMyIE5XQUlUIHNoYXJlZCBzaWduYWwKPiAKPiAg
ZHJpdmVycy9tZmQvS2NvbmZpZyAgICAgICAgICAgIHwgIDEyICsrKwo+ICBkcml2ZXJzL21mZC9N
YWtlZmlsZSAgICAgICAgICAgfCAgIDEgKwo+ICBkcml2ZXJzL21mZC9zdG0zMi1mbWMyLmMgICAg
ICAgfCAxMzYgKysrKysrKysrKysrKysrKysrKysrKysrKwo+ICBpbmNsdWRlL2xpbnV4L21mZC9z
dG0zMi1mbWMyLmggfCAyMjUgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysKPiAgNCBmaWxlcyBjaGFuZ2VkLCAzNzQgaW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9kZSAx
MDA2NDQgZHJpdmVycy9tZmQvc3RtMzItZm1jMi5jCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNs
dWRlL2xpbnV4L21mZC9zdG0zMi1mbWMyLmgKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZmQv
S2NvbmZpZyBiL2RyaXZlcnMvbWZkL0tjb25maWcKPiBpbmRleCAyYjIwMzI5Li41MjYwNTgyIDEw
MDY0NAo+IC0tLSBhL2RyaXZlcnMvbWZkL0tjb25maWcKPiArKysgYi9kcml2ZXJzL21mZC9LY29u
ZmlnCj4gQEAgLTE5MjIsNiArMTkyMiwxOCBAQCBjb25maWcgTUZEX1JPSE1fQkQ3MTgyOAo+ICAJ
ICBBbHNvIGluY2x1ZGVkIGlzIGEgQ291bG9tYiBjb3VudGVyLCBhIHJlYWwtdGltZSBjbG9jayAo
UlRDKSwgYW5kCj4gIAkgIGEgMzIuNzY4IGtIeiBjbG9jayBnYXRlLgo+ICAKPiArY29uZmlnIE1G
RF9TVE0zMl9GTUMyCj4gKwl0cmlzdGF0ZSAiU3VwcG9ydCBmb3IgRk1DMiBjb250cm9sbGVycyBv
biBTVE0zMk1QIFNvQ3MiCj4gKwlkZXBlbmRzIG9uIE1BQ0hfU1RNMzJNUDE1NyB8fCBDT01QSUxF
X1RFU1QKPiArCXNlbGVjdCBNRkRfQ09SRQo+ICsJc2VsZWN0IFJFR01BUAo+ICsJc2VsZWN0IFJF
R01BUF9NTUlPCj4gKwloZWxwCj4gKwkgIFNlbGVjdCB0aGlzIG9wdGlvbiB0byBlbmFibGUgU1RN
MzIgRk1DMiBkcml2ZXIgdXNlZCBmb3IgRk1DMiBFeHRlcm5hbAo+ICsJICBCdXMgSW50ZXJmYWNl
IGNvbnRyb2xsZXIgYW5kIEZNQzIgTkFORCBmbGFzaCBjb250cm9sbGVyLiBUaGlzIGRyaXZlcgo+
ICsJICBwcm92aWRlcyBjb3JlIHN1cHBvcnQgZm9yIHRoZSBTVE0zMiBGTUMyIGNvbnRyb2xsZXJz
LCBpbiBvcmRlciB0byB1c2UKPiArCSAgdGhlIGFjdHVhbCBmdW5jdGlvbmFsaXR5IG9mIHRoZSBk
ZXZpY2Ugb3RoZXIgZHJpdmVycyBtdXN0IGJlIGVuYWJsZWQuCgpOb3Qgc3VyZSBob3cgbWFueSB0
aW1lcyBJIGhhdmUgdG8gc2F5IHRoaXMgYmVmb3JlIHBlb3BsZSBzdG9wCmF0dGVtcHRpbmcgdG8g
cGFzcyB0aGVzZSBraW5kcyBvZiByZWxhdGlvbnNoaXBzIG9mZiBhcyBNRkRzOgoKQSBtZW1vcnkg
ZGV2aWNlIGFuZCBpdHMgYnVzIGlzIG5vdCBhbiBNRkQuICBJbiBhIHNpbWlsYXIgdmFpbiB0byB0
aGUKdGhvdXNhbmRzIG9mIFVTQiwgSTJDLCBTUEksIFBDSSBhbmQgdGhlIGxpa2UgZGV2aWNlcyB0
aGF0IGFyZW4ndCBNRkRzCmVpdGhlci4KClBsZWFzZSBmaW5kIGFub3RoZXIgd2F5IHRvIGFzc29j
aWF0ZSB5b3VyIGRldmljZSB3aXRoIGl0cyBidXMuCgotLSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9d
CkxpbmFybyBTZXJ2aWNlcyBUZWNobmljYWwgTGVhZApMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJj
ZSBzb2Z0d2FyZSBmb3IgQVJNIFNvQ3MKRm9sbG93IExpbmFybzogRmFjZWJvb2sgfCBUd2l0dGVy
IHwgQmxvZwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0
aW5mby9saW51eC1zdG0zMgo=
