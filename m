Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 975B02F5E3B
	for <lists+linux-stm32@lfdr.de>; Thu, 14 Jan 2021 11:03:17 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 470BDC5660F;
	Thu, 14 Jan 2021 10:03:17 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E23A7C3FAD6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Jan 2021 10:03:15 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id q18so5138258wrn.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Jan 2021 02:03:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=oVf5kDc7i4gGrzg222CFywiTCholDlEVEzBooRbeXN8=;
 b=lNr9TM2KRK50yFUSVqvQRC2+d8NR6/ezTC8nz87RztuEm0sg8oFVZ8y/GwJu5fmbuy
 fYHUI2RWogLsikN9SnHQipAiHDGDc1iscx3mN0jbaxwjTcDQ0ZVtTW8fUsLtiGBQW1Q1
 AKfeQ1ODq0/1MA3AOJBalS1gNW0n1axzkT2WZXyba4RRsLVzZn2saNJpv/dEYHRUicJF
 cy5rlCwzCpe0zLOzmTd1UhR5H8lUdW/NIPwujCtBAv7zdrfaCFXLG4Tew5MNdkvkGGm0
 1fvVpBLtBl0dMLy8xB3oQ4gsFCDJ3uv0n491bAWkFkP/SVR3QtNXDcjHubOMox2quEnn
 hbJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=oVf5kDc7i4gGrzg222CFywiTCholDlEVEzBooRbeXN8=;
 b=IA4HQWYfMryXcLfSUb1PyoPov1zZolP50EINW9Fv3MIlP+z87VGxsPKhmNIPJ+hluo
 raIAv+VIvQQ5AXMGw+3X7kV8Qn77pdQUv/h2lIc6zuFqa5yZnTvo5FLZYyJk6gxM8xFl
 aqspuAE5zZ+HEeTltegu7WxUN2X4ou91F/50zs3tNSXJaEl/zgFKY2TgXlbIUIxebFY0
 qzoWf1Ai+DhvypdXyEPIzmTghhB594AWOa0oDmOY2GP4fvxocnpzwR9Hm9AxffvYnbP5
 3tkYrAgrMaz59nuETBmOC/Il3m5skXUfKpDtRTj+gY/+2SU/k8hmi6NyDU4Iw7lcj4VP
 zNdQ==
X-Gm-Message-State: AOAM530r9FIQZ7uRHH3+m+1SUNNO3YsG1Zku8f5x6kZ0vRaw7QYcXe/h
 8ZwFC0HQQR1WxuzGtYQ+eTp/dg==
X-Google-Smtp-Source: ABdhPJx/ZTFqNdbwMrPPQXGb4a5AARaWdvmncwYK2q1w7//JoVyn/n68+kesxeF+gvUR8rMoynCXCw==
X-Received: by 2002:adf:ef06:: with SMTP id e6mr6917001wro.231.1610618595259; 
 Thu, 14 Jan 2021 02:03:15 -0800 (PST)
Received: from dell ([91.110.221.178])
 by smtp.gmail.com with ESMTPSA id b3sm2474771wrn.70.2021.01.14.02.03.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 02:03:14 -0800 (PST)
Date: Thu, 14 Jan 2021 10:03:12 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Alexander Dahl <post@lespocky.de>
Message-ID: <20210114100312.GL3975472@dell>
References: <20201228163217.32520-1-post@lespocky.de>
 <20201228163217.32520-2-post@lespocky.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201228163217.32520-2-post@lespocky.de>
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Alexander Dahl <ada@thorsis.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, Jeff LaBundy <jeff@labundy.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-leds@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v9 1/4] dt-bindings: mfd: Fix schema
	warnings for pwm-leds
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

T24gTW9uLCAyOCBEZWMgMjAyMCwgQWxleGFuZGVyIERhaGwgd3JvdGU6Cgo+IFRoZSBub2RlIG5h
bWVzIGZvciBkZXZpY2VzIHVzaW5nIHRoZSBwd20tbGVkcyBkcml2ZXIgZm9sbG93IGEgY2VydGFp
bgo+IG5hbWluZyBzY2hlbWUgKG5vdykuICBQYXJlbnQgbm9kZSBuYW1lIGlzIG5vdCBlbmZvcmNl
ZCwgYnV0IHJlY29tbWVuZGVkCj4gYnkgRFQgcHJvamVjdC4KPiAKPiAgIERUQyAgICAgRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21mZC9pcXM2MnguZXhhbXBsZS5kdC55YW1sCj4g
ICBDSEVDSyAgIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZmQvaXFzNjJ4LmV4
YW1wbGUuZHQueWFtbAo+IC9ob21lL2FsZXgvYnVpbGQvbGludXgvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL21mZC9pcXM2MnguZXhhbXBsZS5kdC55YW1sOiBwd21sZWRzOiAncGFu
ZWwnIGRvZXMgbm90IG1hdGNoIGFueSBvZiB0aGUgcmVnZXhlczogJ15sZWQoLVswLTlhLWZdKyk/
JCcsICdwaW5jdHJsLVswLTldKycKPiAgICAgICAgIEZyb20gc2NoZW1hOiAvaG9tZS9hbGV4L3Ny
Yy9saW51eC9sZWRzL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9sZWRzL2xlZHMt
cHdtLnlhbWwKPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kZXIgRGFobCA8cG9zdEBsZXNwb2Nr
eS5kZT4KPiBBY2tlZC1ieTogSmVmZiBMYUJ1bmR5IDxqZWZmQGxhYnVuZHkuY29tPgo+IEFja2Vk
LWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgo+IC0tLQo+IAo+IE5vdGVzOgo+ICAg
ICB2OCAtPiB2OToKPiAgICAgICAqIGFkZGVkIGZvcmdvdHRlbiBBY2tlZC1ieSAoSmVmZiBMYUJ1
bmR5KQo+ICAgICAgICogcmViYXNlZCBvbiB2NS4xMS1yYzEKPiAgICAgCj4gICAgIHY3IC0+IHY4
Ogo+ICAgICAgICogcmViYXNlZCBvbiByZWNlbnQgcGF2ZWwvZm9yLW5leHQgKHBvc3QgdjUuMTAt
cmMxKQo+ICAgICAgICogYWRkZWQgQWNrZWQtYnkgKFJvYiBIZXJyaW5nKQo+ICAgICAKPiAgICAg
djYgLT4gdjc6Cj4gICAgICAgKiBhZGRlZCB3YXJuaW5nIG1lc3NhZ2UgdG8gY29tbWl0IG1lc3Nh
Z2UgKEtyenlzenRvZiBLb3psb3dza2kpCj4gICAgIAo+ICAgICB2NjoKPiAgICAgICAqIGFkZGVk
IHRoaXMgcGF0Y2ggdG8gc2VyaWVzCj4gCj4gIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9tZmQvaXFzNjJ4LnlhbWwgfCA1ICsrKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2Vy
dGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpGYWlsZWQgdG8gYXBwbHk6CgpBcHBseWluZzogZHQt
YmluZGluZ3M6IG1mZDogRml4IHNjaGVtYSB3YXJuaW5ncyBmb3IgcHdtLWxlZHMKVXNpbmcgaW5k
ZXggaW5mbyB0byByZWNvbnN0cnVjdCBhIGJhc2UgdHJlZS4uLgpNCURvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9tZmQvaXFzNjJ4LnlhbWwKL2hvbWUvbGVlL3Byb2plY3RzL2xpbnV4
L2tlcm5lbC8uZ2l0L3dvcmt0cmVlcy9tZmQvcmViYXNlLWFwcGx5L3BhdGNoOjM0OiBpbmRlbnQg
d2l0aCBzcGFjZXMuCiAgICAgICAgICAgIGxlZC0xIHsKL2hvbWUvbGVlL3Byb2plY3RzL2xpbnV4
L2tlcm5lbC8uZ2l0L3dvcmt0cmVlcy9tZmQvcmViYXNlLWFwcGx5L3BhdGNoOjM1OiBpbmRlbnQg
d2l0aCBzcGFjZXMuCiAgICAgICAgICAgICAgICAgICAgbGFiZWwgPSAicGFuZWwiOwp3YXJuaW5n
OiAyIGxpbmVzIGFkZCB3aGl0ZXNwYWNlIGVycm9ycy4KRmFsbGluZyBiYWNrIHRvIHBhdGNoaW5n
IGJhc2UgYW5kIDMtd2F5IG1lcmdlLi4uCkF1dG8tbWVyZ2luZyBEb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvbWZkL2lxczYyeC55YW1sCkNPTkZMSUNUIChjb250ZW50KTogTWVyZ2Ug
Y29uZmxpY3QgaW4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21mZC9pcXM2Mngu
eWFtbApSZWNvcmRlZCBwcmVpbWFnZSBmb3IgJ0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9tZmQvaXFzNjJ4LnlhbWwnCgotLSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9dClNlbmlvciBU
ZWNobmljYWwgTGVhZCAtIERldmVsb3BlciBTZXJ2aWNlcwpMaW5hcm8ub3JnIOKUgiBPcGVuIHNv
dXJjZSBzb2Z0d2FyZSBmb3IgQXJtIFNvQ3MKRm9sbG93IExpbmFybzogRmFjZWJvb2sgfCBUd2l0
dGVyIHwgQmxvZwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9s
aXN0aW5mby9saW51eC1zdG0zMgo=
