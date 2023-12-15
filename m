Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A60548167C2
	for <lists+linux-stm32@lfdr.de>; Mon, 18 Dec 2023 08:53:03 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5B1EBC6DD74;
	Mon, 18 Dec 2023 07:53:03 +0000 (UTC)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com
 [209.85.167.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D5F81C6A5EA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Dec 2023 20:59:20 +0000 (UTC)
Received: by mail-oi1-f179.google.com with SMTP id
 5614622812f47-3b9e1a3e3f0so781266b6e.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Dec 2023 12:59:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1702673959; x=1703278759;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lV7l2nTXRo6puPksf2Bwbtc+9l9srdKWeAOzTx3pqZU=;
 b=EIdgvz27xwHvTSamcrelFT2Jf4M+SByXD5robgDNkOxCIYDDUJNNy29XRky0Qrl7Up
 YhvE9LI5MgIJcgN50KNA/VFhP/UCmwtZX57oE7fc9MWOXlaj3abNLEvedcam9YZjbfN1
 UefFygJtWBsQ7ZKFM57f+glbltYJIcvnU1QjtaU26/lCjn+CG7i21xaUXMBIwNuvx9/P
 c3eR7QRaAQz/DBfDrE6iV/TZcRHmOVgW5JGLGHOTkDeMQRpp4A68chT7aunFHMSZV8jG
 en3P9brgbZmD2yCyv+SAYq1PnAjebuxZDs4WmoXAKeLEQJsWT7i9G086ImnaWNPBpg2i
 AGwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702673959; x=1703278759;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lV7l2nTXRo6puPksf2Bwbtc+9l9srdKWeAOzTx3pqZU=;
 b=V9phYjI04YUK8t02dv5+bZQreyeV5aCnbMvPwT6dZkNIDPud13MmawXiwSJKL7vNX/
 vhjYVAgaehfEHBZHKQXVQ+t91RFbW2NU1+cAM0zk5gp2Xx9cEPi5UGnNXZk6JikFjQU2
 a3XPCl9ayAzRCg+EBmwGtUQTxdHWzmuUvQ8rXHDG8VfOg1JtrtwMajE7lNUn+NdCa5SH
 9z/LacNalx8XeAtL6ORX8ifcrrxkqNgmudwl8MjOVnYOt19WLyZwS1lFG2u2QUR0x10y
 0KXfPf6qqZ5f6iVIdiV5o8Q+LeJSpLjrBWwQ0tm1QCSt06GQ3OB6iUWRo5qeYOp+lupV
 NG6w==
X-Gm-Message-State: AOJu0Yxji5er99cN89X7Kc6IYnic6swwL7M9JD8kpMRS59x0YFOCqryu
 M39pVQg19EJEU1WidRNaCeXf0Q==
X-Google-Smtp-Source: AGHT+IEe4Kr9nZGM8rgYvZk36QtswTXFAg2l00r9jHu+UOaHWgP1pqPIoOBpVHQ2/argXUQTanExYw==
X-Received: by 2002:a05:6808:1a0e:b0:3b9:da30:77fa with SMTP id
 bk14-20020a0568081a0e00b003b9da3077famr15925945oib.2.1702673959682; 
 Fri, 15 Dec 2023 12:59:19 -0800 (PST)
Received: from ?IPV6:2600:1700:2000:b002:18ee:711a:b78b:5489?
 ([2600:1700:2000:b002:18ee:711a:b78b:5489])
 by smtp.gmail.com with ESMTPSA id
 v16-20020a0cf910000000b0067a53aa6df2sm7151683qvn.46.2023.12.15.12.59.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Dec 2023 12:59:19 -0800 (PST)
Message-ID: <65fd52f1-6861-42b0-9148-266766d054b1@sifive.com>
Date: Fri, 15 Dec 2023 14:59:17 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Jessica Clarke <jrtc27@jrtc27.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
References: <20231215204050.2296404-1-cristian.ciocaltea@collabora.com>
 <20231215204050.2296404-3-cristian.ciocaltea@collabora.com>
 <A7C96942-07CB-40FD-AAAA-4A8947DEE7CA@jrtc27.com>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <A7C96942-07CB-40FD-AAAA-4A8947DEE7CA@jrtc27.com>
X-Mailman-Approved-At: Mon, 18 Dec 2023 07:52:59 +0000
Cc: Emil Renner Berthing <kernel@esmil.dk>,
 Michael Turquette <mturquette@baylibre.com>,
 Eric Dumazet <edumazet@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, kernel@collabora.com,
 linux-clk@vger.kernel.org, Hal Feng <hal.feng@starfivetech.com>,
 Jose Abreu <joabreu@synopsys.com>, Samin Guo <samin.guo@starfivetech.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Richard Cochran <richardcochran@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 LKML <linux-kernel@vger.kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH v3 2/9] dt-bindings: net: starfive,
 jh7110-dwmac: Add JH7100 SoC compatible
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

T24gMjAyMy0xMi0xNSAyOjQ3IFBNLCBKZXNzaWNhIENsYXJrZSB3cm90ZToKPiBPbiAxNSBEZWMg
MjAyMywgYXQgMjA6NDAsIENyaXN0aWFuIENpb2NhbHRlYSA8Y3Jpc3RpYW4uY2lvY2FsdGVhQGNv
bGxhYm9yYS5jb20+IHdyb3RlOgo+Pgo+PiBUaGUgU3lub3BzeXMgRGVzaWduV2FyZSBNQUMgZm91
bmQgb24gU3RhckZpdmUgSkg3MTAwIFNvQyBpcyBtb3N0bHkKPj4gc2ltaWxhciB0byB0aGUgbmV3
ZXIgSkg3MTEwLCBidXQgaXQgcmVxdWlyZXMgb25seSB0d28gaW50ZXJydXB0cyBhbmQgYQo+PiBz
aW5nbGUgcmVzZXQgbGluZSwgd2hpY2ggaXMgJ2FoYicgaW5zdGVhZCBvZiB0aGUgY29tbW9ubHkg
dXNlZAo+PiAnc3RtbWFjZXRoJy4KPj4KPj4gU2luY2UgdGhlIGNvbW1vbiBiaW5kaW5nICdzbnBz
LGR3bWFjJyBhbGxvd3Mgc2VsZWN0aW5nICdhaGInIG9ubHkgaW4KPj4gY29uanVuY3Rpb24gd2l0
aCAnc3RtbWFjZXRoJywgZXh0ZW5kIHRoZSBsb2dpYyB0byBhbHNvIHBlcm1pdCBleGNsdXNpdmUK
Pj4gdXNhZ2Ugb2YgdGhlICdhaGInIHJlc2V0IG5hbWUuICBUaGlzIGVuc3VyZXMgdGhlIGZvbGxv
d2luZyB1c2UgY2FzZXMgYXJlCj4+IHN1cHBvcnRlZDoKPj4KPj4gIEpINzExMDogcmVzZXQtbmFt
ZXMgPSAic3RtbWFjZXRoIiwgImFoYiI7Cj4+ICBKSDcxMDA6IHJlc2V0LW5hbWVzID0gImFoYiI7
Cj4+ICBvdGhlcjogIHJlc2V0LW5hbWVzID0gInN0bW1hY2V0aCI7Cj4+Cj4+IEFsc28gbm90ZSB0
aGUgbmVlZCB0byB1c2UgYSBkaWZmZXJlbnQgZHdtYWMgZmFsbGJhY2ssIGFzIHY1LjIwIGFwcGxp
ZXMKPj4gdG8gSkg3MTEwIG9ubHksIHdoaWxlIEpINzEwMCByZWxpZXMgb24gdjMuN3guCj4+Cj4+
IFNpZ25lZC1vZmYtYnk6IENyaXN0aWFuIENpb2NhbHRlYSA8Y3Jpc3RpYW4uY2lvY2FsdGVhQGNv
bGxhYm9yYS5jb20+Cj4+IC0tLQo+PiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvc25wcyxk
d21hYy55YW1sICAgfCAgMyArLQo+PiAuLi4vYmluZGluZ3MvbmV0L3N0YXJmaXZlLGpoNzExMC1k
d21hYy55YW1sICAgfCA3NCArKysrKysrKysrKysrLS0tLS0tCj4+IDIgZmlsZXMgY2hhbmdlZCwg
NTUgaW5zZXJ0aW9ucygrKSwgMjIgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0L3NucHMsZHdtYWMueWFtbCBiL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvc25wcyxkd21hYy55YW1sCj4+IGluZGV4
IDVjMjc2OWRjNjg5YS4uYzEzODBmZjFjMDU0IDEwMDY0NAo+PiAtLS0gYS9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvbmV0L3NucHMsZHdtYWMueWFtbAo+PiArKysgYi9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0L3NucHMsZHdtYWMueWFtbAo+PiBAQCAtOTUs
NiArOTUsNyBAQCBwcm9wZXJ0aWVzOgo+PiAgICAgICAgIC0gc25wcyxkd21hYy01LjIwCj4+ICAg
ICAgICAgLSBzbnBzLGR3eGdtYWMKPj4gICAgICAgICAtIHNucHMsZHd4Z21hYy0yLjEwCj4+ICsg
ICAgICAgIC0gc3RhcmZpdmUsamg3MTAwLWR3bWFjCj4+ICAgICAgICAgLSBzdGFyZml2ZSxqaDcx
MTAtZHdtYWMKPj4KPj4gICByZWc6Cj4+IEBAIC0xNDYsNyArMTQ3LDcgQEAgcHJvcGVydGllczoK
Pj4gICByZXNldC1uYW1lczoKPj4gICAgIG1pbkl0ZW1zOiAxCj4+ICAgICBpdGVtczoKPj4gLSAg
ICAgIC0gY29uc3Q6IHN0bW1hY2V0aAo+PiArICAgICAgLSBlbnVtOiBbc3RtbWFjZXRoLCBhaGJd
Cj4+ICAgICAgIC0gY29uc3Q6IGFoYgo+IAo+IEnigJltIG5vdCBzbyB3ZWxsLXZlcnNlZCBpbiB0
aGUgWUFNTCBiaW5kaW5ncywgYnV0IHdvdWxkIHRoaXMgbm90IGFsbG93Cj4gcmVzZXQtbmFtZXMg
PSAiYWhiIiwgImFoYiI/CgpZZXMsIGl0IHdvdWxkLiBZb3UgbmVlZCBzb21ldGhpbmcgbGlrZToK
CnJlc2V0LW5hbWVzOgogIG9uZU9mOgogICAgLSBlbnVtOiBbc3RtbWFjZXRoLCBhaGJdCiAgICAt
IGl0ZW1zOgogICAgICAgIC0gY29uc3Q6IHN0bW1hY2V0aAogICAgICAgIC0gY29uc3Q6IGFoYgoK
UmVnYXJkcywKU2FtdWVsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFp
bG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
