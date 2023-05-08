Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 424BB6F9FED
	for <lists+linux-stm32@lfdr.de>; Mon,  8 May 2023 08:30:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DC227C6A5F7;
	Mon,  8 May 2023 06:30:23 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com
 [209.85.128.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B0717C6904F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 May 2023 06:30:22 +0000 (UTC)
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-55cc8aadc97so61699517b3.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 07 May 2023 23:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683527421; x=1686119421;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EiW0EErM60L5kKyN8Tg1XRCsrwIPCFSbfaR0hDH4fIM=;
 b=PD5U7ZMhII+6+SjvgyG4A5wFy7HdkIORS9BQEGaFBmJjE9+oMN0Vx8HqiWZs4eVOPs
 afuHj1WMTyyw/hS0ED2tANEKGvJ4ptWToyfBrqtRdOtAe6SfT5kQODSfuLqgeUr4tX7o
 mU0JgACABNru85+HGLVuNmKLvj1xgeGQDFlGX5IprfGDeoDm/jnmj3MtccOX8TBDvXPK
 65cCc7knVFso0feyk/QJtDFhd+2nFo4LbgZjLF+Z/r0gtsRAtmxkcyrkqyyMOTHznhrg
 gcRiVhptcrcmE32WIR6JYFjATJ6rWFR9+WRi0NzOlRuGV0gLL9vNkyAM3kH9UFCIAMNo
 hang==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683527421; x=1686119421;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EiW0EErM60L5kKyN8Tg1XRCsrwIPCFSbfaR0hDH4fIM=;
 b=kiM6/zVQ6q9IMJpjGcV3wp6hWW2bNACRUFI47KGXbB8wIhORak6c+RatOipeSPGsM/
 hiKKHzR+qYbvt+SIoX3hsbbeELWXMnnQCMGWLYv6x1F/xYso7gWUz8bmY8NcUFQU49k2
 vMc6U4f+YXOxqtBQGmrizqopWTpFIo6+Q8+vY7SXWY0kYBDJE7jee+mPqU1A+lrtrgNn
 XsQwQ7CxI92LLIeQAIasKIQNfn+jw4ruerjjpTnkE1gkWwexyO8hnCoWbtqgRU/X5bMP
 yNX3/YH8yfuEF8fWtX7qeg/Xcz1JAAOUvWhqbEgxP33XQeO93bShsxnqXD3MHKdWTToo
 77pw==
X-Gm-Message-State: AC+VfDyIrxvpvS8U+Z1adMGz1uthXSdXujwH4cYkO6BXvC/7oue5fgOs
 5/OTV3A/6Y/2BjMp3rAV1c1kdZX0ShUajlwtPgbJgw==
X-Google-Smtp-Source: ACHHUZ56+p3cOj5Ygdf5gAj+LPJUGFCGrlnUoUN/TeVRSYGs3dJ22juJvikJC8sZjsPhzK4znwJaCoGPzbb8PFzrKkw=
X-Received: by 2002:a81:6587:0:b0:555:cee3:d143 with SMTP id
 z129-20020a816587000000b00555cee3d143mr10089004ywb.4.1683527421593; Sun, 07
 May 2023 23:30:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230426-stmpe-dt-bindings-v3-0-eac1d736e488@linaro.org>
 <20230426-stmpe-dt-bindings-v3-1-eac1d736e488@linaro.org>
 <168349835606.3623231.4270033272905089508.robh@kernel.org>
In-Reply-To: <168349835606.3623231.4270033272905089508.robh@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 8 May 2023 08:30:10 +0200
Message-ID: <CACRpkdZsC6s3MjX5Mkr5u763CYSAotJKcK5wZMwCQxgEzvw+vQ@mail.gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 Lee Jones <lee@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Philippe Schenker <philippe.schenker@toradex.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Stefan Agner <stefan@agner.ch>,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-input@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 1/2] dt-bindings: gpio: Add STMPE YAML
	DT schema
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

T24gTW9uLCBNYXkgOCwgMjAyMyBhdCAxMjoyNuKAr0FNIFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5l
bC5vcmc+IHdyb3RlOgo+IE9uIFN1biwgMDcgTWF5IDIwMjMgMjM6MTk6MTkgKzAyMDAsIExpbnVz
IFdhbGxlaWogd3JvdGU6Cgo+ID4gVGhpcyBhZGRzIGEgc2NoZW1hIGZvciB0aGUgU1RNUEUgR1BJ
TyB0aGF0IHdoaWxlIGl0IGlzIHVzZWQgYQo+ID4gbG90IGluIHRoZSBrZXJuZWwgdHJlZSBpcyBh
bnl3YXkgbWlzc2luZyBpdHMgYmluZGluZ3MuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogTGludXMg
V2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPgo+ID4gLS0tCj4gPiBDaGFuZ2VMb2cg
djItPnYzOgo+ID4gLSBVc2UgYSBjb21wYWN0IGhvZyBub2RlIHNjaGVtYSBiYWNrZWQgYnkgdGhl
IHN0YW5kYXJkIGhvZwo+ID4gICBzY2hlbWEuCj4gPiBDaGFuZ2VMb2cgdjEtPnYyOgo+ID4gLSBO
ZXcgcGF0Y2ggc3BsaXQgb2ZmIGZyb20gdGhlIE1GRCBwYXRjaC4KPiA+IC0tLQo+ID4gIC4uLi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2dwaW8vc3Qsc3RtcGUtZ3Bpby55YW1sICAgIHwgNTEgKysrKysr
KysrKysrKysrKysrKysrKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA1MSBpbnNlcnRpb25zKCspCj4g
Pgo+Cj4gTXkgYm90IGZvdW5kIGVycm9ycyBydW5uaW5nICdtYWtlIERUX0NIRUNLRVJfRkxBR1M9
LW0gZHRfYmluZGluZ19jaGVjaycKPiBvbiB5b3VyIHBhdGNoIChEVF9DSEVDS0VSX0ZMQUdTIGlz
IG5ldyBpbiB2NS4xMyk6Cj4KPiB5YW1sbGludCB3YXJuaW5ncy9lcnJvcnM6Cj4KPiBkdHNjaGVt
YS9kdGMgd2FybmluZ3MvZXJyb3JzOgo+IC9idWlsZHMvcm9iaGVycmluZy9kdC1yZXZpZXctY2kv
bGludXgvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL2kyYy9vdnRpLG92
MjY4NS5leGFtcGxlLmR0YjogY2FtZXJhLXNlbnNvckAzYzogcG9ydDplbmRwb2ludDpkYXRhLWxh
bmVzOiBbWzFdXSBpcyB0b28gc2hvcnQKPiAgICAgICAgIEZyb20gc2NoZW1hOiAvYnVpbGRzL3Jv
YmhlcnJpbmcvZHQtcmV2aWV3LWNpL2xpbnV4L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9tZWRpYS9pMmMvb3Z0aSxvdjI2ODUueWFtbAo+IC9idWlsZHMvcm9iaGVycmluZy9kdC1y
ZXZpZXctY2kvbGludXgvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL3Jv
Y2tjaGlwLWlzcDEuZXhhbXBsZS5kdGI6IGNhbWVyYUAzYzogcG9ydDplbmRwb2ludDpkYXRhLWxh
bmVzOiBbWzFdXSBpcyB0b28gc2hvcnQKPiAgICAgICAgIEZyb20gc2NoZW1hOiAvYnVpbGRzL3Jv
YmhlcnJpbmcvZHQtcmV2aWV3LWNpL2xpbnV4L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9tZWRpYS9pMmMvb3Z0aSxvdjI2ODUueWFtbAo+IC9idWlsZHMvcm9iaGVycmluZy9kdC1y
ZXZpZXctY2kvbGludXgvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BjaS9mc2ws
aW14NnEtcGNpZS1lcC5leGFtcGxlLmR0YjogcGNpZS1lcEAzMzgwMDAwMDogVW5ldmFsdWF0ZWQg
cHJvcGVydGllcyBhcmUgbm90IGFsbG93ZWQgKCdhc3NpZ25lZC1jbG9jay1wYXJlbnRzJywgJ2Fz
c2lnbmVkLWNsb2NrLXJhdGVzJywgJ2Fzc2lnbmVkLWNsb2Nrcycgd2VyZSB1bmV4cGVjdGVkKQo+
ICAgICAgICAgRnJvbSBzY2hlbWE6IC9idWlsZHMvcm9iaGVycmluZy9kdC1yZXZpZXctY2kvbGlu
dXgvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BjaS9mc2wsaW14NnEtcGNpZS1l
cC55YW1sCgpMb29rcyBsaWtlIHRoZXNlIGFyZSBub3QgbWluZS4uLgoKWW91cnMsCkxpbnVzIFdh
bGxlaWoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtc3RtMzIK
