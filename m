Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D526B5DAA
	for <lists+linux-stm32@lfdr.de>; Sat, 11 Mar 2023 17:11:11 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A2EC7C6A608;
	Sat, 11 Mar 2023 16:11:11 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 473E4C6A5F6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 11 Mar 2023 16:11:10 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id q16so7707676wrw.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 11 Mar 2023 08:11:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678551070;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=wTwVrHUwJuxo2nAv8WcWBTbXbikVuPU2S0IixEuBaf4=;
 b=NjrXETXbZlcsvTNNCs9yzV/6PY+CmmQAxqPMkiNPO7QnMj6ytAX2MO60sgp2paNr9c
 Hj4btjqwVQYF5lLso0uID3MzUxTkZWfLMIEk6fajBsPgnH07UIpVWC04WKT6L+qzzwUq
 2eXh/JXic2jrLs7bRYweE2xFP9A4hvZVloIFsATIbYE4tZvjdNUE217s5/7sS8Ayn3zb
 4y5cNUEUaXO/9Dhavli5sH+hB6hWTXJUzqrvs4t9pQSV8bj/6cuUmzVIvHIr6ii3bG3z
 GHvtgjEuloh0lGRfs2aBA6ScgOF2GeGe5cr4k2ApsqReCT35clKNcoVw3C+8ofih80pf
 cBug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678551070;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wTwVrHUwJuxo2nAv8WcWBTbXbikVuPU2S0IixEuBaf4=;
 b=dRsizpmq5QGERm2ke+mswTdy71hQq4Z5eFhOPqhxxHD+eqc3gjwlpGdPAE5P10ZZcu
 ym36/KzP8RmsQBLYGAdRFaCn/NrLU+0VmvkhqCzyTJXZZWJ53COgTh4F1y3pb0lE3K6D
 g/LuFsGd7QEnTbbD7TnENRmuUfy3FAL3dts4vaOtKPtXdrSTKaafOHvPNhNOYct8hmzj
 J9a/9S+9KSQC65nZntsTrfErvl8Mk9PDs3yEaAeHJ7Aw1kupavAONB0KjgtYd2tXHObD
 ey4GODg5JT1fTd/iLEGhK8cvUqlcZh0mT+yG6YCchmdlPi0cM8AR70mDTvlGpw8jiV0c
 NzRQ==
X-Gm-Message-State: AO0yUKV/z+jKAmDaY5tMYFsHZqKjw02cZkJtGk6HX1Zw/E27qE90jVMZ
 fHc3xGz//m32DwCS/3rYNc0=
X-Google-Smtp-Source: AK7set9VyJg+v0ZGE7y65i5aFyOLU9IOZOR0GJb9hHZKpkI2ykj3H4fHVqW+NtUo6nKqBhqI6frrGw==
X-Received: by 2002:adf:e302:0:b0:2c7:851:c0bf with SMTP id
 b2-20020adfe302000000b002c70851c0bfmr19781176wrj.0.1678551069607; 
 Sat, 11 Mar 2023 08:11:09 -0800 (PST)
Received: from ?IPv6:2a02:168:6806:0:cb1:a328:ee29:2bd6?
 ([2a02:168:6806:0:cb1:a328:ee29:2bd6])
 by smtp.gmail.com with ESMTPSA id
 b18-20020a05600010d200b002cea8f07813sm346294wrx.81.2023.03.11.08.11.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Mar 2023 08:11:09 -0800 (PST)
Message-ID: <2f64385a350359c5755eb4d2479e2efef7a96216.camel@gmail.com>
From: Klaus Kudielka <klaus.kudielka@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Date: Sat, 11 Mar 2023 17:11:08 +0100
In-Reply-To: <a57a216d-ff5a-46e6-9780-e53772dcefc8@lunn.ch>
References: <100c439a-2a4d-4cb2-96f2-5bf273e2121a@lunn.ch>
 <712bc92ca6d576f33f63f1e9c2edf0030b10d3ae.camel@gmail.com>
 <db6b8a09-b680-4baa-8963-d355ad29eb09@lunn.ch>
 <0e10aa8492eadb587949d8744b56fccaabbd183b.camel@gmail.com>
 <72530e86-9ba9-4a01-9cd2-68835ecae7a0@lunn.ch>
 <09d65e1ee0679e1e74b4f3a5a4c55bd48332f043.camel@gmail.com>
 <70f5bca0-322c-4bae-b880-742e56365abe@lunn.ch>
 <10da10caea22a8f5da8f1779df3e13b948e8a363.camel@gmail.com>
 <4abd56aa-5b9f-4e16-b0ca-11989bb8c764@lunn.ch>
 <bff0e542b8c04980e9e3af1d3e6bf739c87eb514.camel@gmail.com>
 <a57a216d-ff5a-46e6-9780-e53772dcefc8@lunn.ch>
User-Agent: Evolution 3.46.4-1 
MIME-Version: 1.0
Cc: linux-aspeed@lists.ozlabs.org,
 Jesse Brandeburg <jesse.brandeburg@intel.com>,
 Eric Dumazet <edumazet@google.com>, linux-stm32@st-md-mailman.stormreply.com,
 Russell King <linux@armlinux.org.uk>, Jose Abreu <joabreu@synopsys.com>,
 Joel Stanley <joel@jms.id.au>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Mark Lee <Mark-MC.Lee@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 linux-mediatek@lists.infradead.org, John Crispin <john@phrozen.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, Andrew Jeffery <andrew@aj.id.au>,
 Bryan Whitehead <bryan.whitehead@microchip.com>, linux-kernel@vger.kernel.org,
 UNGLinuxDriver@microchip.com, Michael Walle <michael@walle.cc>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Heiner Kallweit <hkallweit1@gmail.com>, "David S.
 Miller" <davem@davemloft.net>, Felix Fietkau <nbd@nbd.name>
Subject: Re: [Linux-stm32] [PATCH net-next v2 4/6] net: mdio: scan bus based
 on bus capabilities for C22 and C45
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

T24gU2F0LCAyMDIzLTAzLTExIGF0IDE2OjM5ICswMTAwLCBBbmRyZXcgTHVubiB3cm90ZToKPiAK
PiBJIGhhdmUgb25lIG1vcmUgaWRlYSB3aGljaCBjYW4gc3BlZWQgdGhpbmdzIHVwLiBUaGUgc2Nh
bm5pbmcgb2YgdGhlCj4gTURJTyBidXMgd29ya3MgaW4gdHdvIGRpZmZlcmVudCB3YXlzIGRlcGVu
ZGluZyBvbiBpZiB0aGVyZSBpcyBhIERUCj4gbm9kZSwgZGVzY3JpYmluZyB3aGF0IHNob3VsZCBi
ZSBmb3VuZCBvbiB0aGUgYnVzLiBGb3IgbXY4OGU2eHh4LCB1c2luZwo+IERUIGlzIG9wdGlvbmFs
LiBTb21lIGJvYXJkcyBkbywgc29tZSBkb24ndC4KPiAKPiBJZiB0aGVyZSBpcyBhIERUIG5vZGUs
IG9ubHkgdGhlIGFkZHJlc3NlcyBsaXN0ZWQgaW4gRFQgYXJlIHNjYW5uZWQuCgpIZXJlJ3MgdGhl
IGRlZmluaXRpb24gb2YgdGhlIHN3aXRjaCBpbiB0aGUgVHVycmlzIE9tbmlhIGRldmljZSB0cmVl
LgoKCS8qIFN3aXRjaCBNVjg4RTYxNzYgYXQgYWRkcmVzcyAweDEwICovCglzd2l0Y2hAMTAgewoJ
CXBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7CgkJcGluY3RybC0wID0gPCZzd2ludF9waW5zPjsK
CQljb21wYXRpYmxlID0gIm1hcnZlbGwsbXY4OGU2MDg1IjsKCQkjYWRkcmVzcy1jZWxscyA9IDwx
PjsKCQkjc2l6ZS1jZWxscyA9IDwwPjsKCgkJZHNhLG1lbWJlciA9IDwwIDA+OwoJCXJlZyA9IDww
eDEwPjsKCgkJaW50ZXJydXB0LXBhcmVudCA9IDwmZ3BpbzE+OwoJCWludGVycnVwdHMgPSA8MTMg
SVJRX1RZUEVfTEVWRUxfTE9XPjsKCgkJcG9ydHMgewoJCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsK
CQkJI3NpemUtY2VsbHMgPSA8MD47CgoJCQlwb3J0c0AwIHsKCQkJCXJlZyA9IDwwPjsKCQkJCWxh
YmVsID0gImxhbjAiOwoJCQl9OwoKCQkJcG9ydHNAMSB7CgkJCQlyZWcgPSA8MT47CgkJCQlsYWJl
bCA9ICJsYW4xIjsKCQkJfTsKCgkJCXBvcnRzQDIgewoJCQkJcmVnID0gPDI+OwoJCQkJbGFiZWwg
PSAibGFuMiI7CgkJCX07CgoJCQlwb3J0c0AzIHsKCQkJCXJlZyA9IDwzPjsKCQkJCWxhYmVsID0g
ImxhbjMiOwoJCQl9OwoKCQkJcG9ydHNANCB7CgkJCQlyZWcgPSA8ND47CgkJCQlsYWJlbCA9ICJs
YW40IjsKCQkJfTsKCgkJCXBvcnRzQDUgewoJCQkJcmVnID0gPDU+OwoJCQkJbGFiZWwgPSAiY3B1
IjsKCQkJCWV0aGVybmV0ID0gPCZldGgxPjsKCQkJCXBoeS1tb2RlID0gInJnbWlpLWlkIjsKCgkJ
CQlmaXhlZC1saW5rIHsKCQkJCQlzcGVlZCA9IDwxMDAwPjsKCQkJCQlmdWxsLWR1cGxleDsKCQkJ
CX07CgkJCX07CgoJCQlwb3J0c0A2IHsKCQkJCXJlZyA9IDw2PjsKCQkJCWxhYmVsID0gImNwdSI7
CgkJCQlldGhlcm5ldCA9IDwmZXRoMD47CgkJCQlwaHktbW9kZSA9ICJyZ21paS1pZCI7CgoJCQkJ
Zml4ZWQtbGluayB7CgkJCQkJc3BlZWQgPSA8MTAwMD47CgkJCQkJZnVsbC1kdXBsZXg7CgkJCQl9
OwoJCQl9OwoJCX07Cgo+IAo+IElmIHRoZXJlIGlzIG5vIERUIG5vZGUsIGJ5IGRlZmF1bHQsIGFs
bCAzMiBhZGRyZXNzZXMgb24gdGhlIGJ1cyBhcmUKPiBzY2FubmVkLiBIb3dldmVyLCBEU0EgbWFr
ZXMgYW5vdGhlciBhc3N1bXB0aW9uLiBUaGVyZSBpcyBhIG9uZSB0byBvbmUKPiBtYXBwaW5nIGJl
dHdlZW4gcG9ydCBudW1iZXIgYW5kIFBIWSBhZGRyZXNzIG9uIHRoZSBNRElPIGJ1cy4gUG9ydCAw
Cj4gdXNlcyBNRElPIGFkZHJlc3MgMC4gUG9ydCA3IHVzZXMgTURJTyBhZGRyZXNzIDcgZXRjLiBJ
ZiB5b3UgaGF2ZSBhbiA4Cj4gcG9ydCBzd2l0Y2gsIHRoZXJlIGlzIG5vIHBvaW50IHNjYW5uaW5n
IGFkZHJlc3NlcyA4IHRvIDMxLCB0aGV5IHdpbGwKPiBuZXZlciBiZSB1c2VkLgo+IAo+IFRoZSBt
ZGlvIGJ1cyBzdHJ1Y3R1cmUgaGFzIGEgbWVtYmVyIHBoeV9tYXNrLiBUaGlzIGlzIGEgYml0bWFw
LiBJZiBiaXQKPiBOIGlzIHNldCwgYWRkcmVzcyBOIGlzIG5vdCBzY2FubmVkLiBTbyBpIHN1Z2dl
c3QgeW91IGV4dGVuZAo+IG12ODhlNnh4eF9tZGlvX3JlZ2lzdGVyKCkgdG8gc2V0IHBoeV9tYXNr
IGJhc2VkIG9uCj4gbXY4OGU2eHh4X251bV9wb3J0cyhjaGlwKS4KPiAKCldoYXQgeW91IGFyZSBw
cm9wb3NpbmcgaGVyZSB3b3VsZCBub3Qgc2hvdyBhbnkgaW1wcm92ZW1lbnQgb24gdGhlCk9tbmlh
LCBhcyBvbmx5IHRoZSA2IHBvcnRzIHdvdWxkIGJlIHNjYW5uZWQgLSByaWdodD8gCgo+IMKgwqDC
oMKgwqDCoMKgwqBBbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
