Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0811E9D417D
	for <lists+linux-stm32@lfdr.de>; Wed, 20 Nov 2024 18:49:45 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BC148C7A83C;
	Wed, 20 Nov 2024 17:49:44 +0000 (UTC)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com
 [209.85.167.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8EA68C7803D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Nov 2024 09:17:57 +0000 (UTC)
Received: by mail-oi1-f172.google.com with SMTP id
 5614622812f47-3e60825aa26so2529568b6e.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Nov 2024 01:17:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731316676; x=1731921476;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SgzDV6XTYtXT/ZAEBGBUP7h48Bysqg7RCg25yVB5U/k=;
 b=Jx6KfdPpV2MFc7OdUPrk6lwXUUbyBrrJJGOnlKlj/+kmtWkza1coOkPFayq89Q8J4u
 sKHEC5NLu39kDmTVZGUuPJPoBk3NXvIPQaANkVYA0DHlLwOI9MZpy4K6Sxx+sanwsOlB
 SkgD7iO875o0o4VwKApV6UUM/oObJs+NhefN0W+xkSjm9NRNWHirP+7zMcIF/2dmRksZ
 FeE2jeOl9l0x0uopnD5Mec38uBnDCYauI6QfTeK7Jez8Pa7kaStGPG/d9r26veiC8Ybo
 0LxdIH94voqNhIYqKYdaoMrTBtuiTtLPdqxAwR41/P2q8HDcOALIk6ipfsZOEAtsVZ86
 4eOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731316676; x=1731921476;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SgzDV6XTYtXT/ZAEBGBUP7h48Bysqg7RCg25yVB5U/k=;
 b=RZXl65rYWnxpej8w6jIlh34caLyDr/VhewE6jq/LOlKfQhFGdAJfJQndwZC/meuKZE
 H2x98Tr+JBOm0+awn0fgzIk7nYrb9e0ouPdLB0JRw/pHcWjXRtSVfTn5efyiq0LqWnN1
 C7xWF1Qe4Tbavou87HrnpL9leoayeHbp4l3wnFUG1RothZiSen4x6zCmdA5mSCe9dTDz
 58fedA/ADe+75cbE29IBs5k+hnG0hvagUPz1qEuqpKNM1uMZrrDni7T5v6NnuOKBaXGR
 wH8kyUGA0mGjVQpRsJUp/af3mJqpJwqSbB6qgA1sAkOj0LavNF3pHrT8rXuP3Rp02A6h
 j71Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUGBYGsRHcwfGds6UD6pXDs521TtZjfhppS/KTRVbs2SNubaTdHT91QZ7fd3okz3ASTPaaWekAMV1QK7A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzipUwap9imXaXO/cIhZ6UpTIfdUict3zHGd8Rd0fJ+NDYVnVbi
 ojPLD2+2pq6YeWKFhAQibSEhO9i3K+4WyFkyQbw3bX+VGnmzIRva
X-Google-Smtp-Source: AGHT+IH5XF4fHujuj+ksffR1RtxhphO0REZBT78S9uIbUEfLxCgT7hRETIpEKjykIRYtuUK5CY8I6Q==
X-Received: by 2002:a05:6808:16ab:b0:3e7:5af4:f8e7 with SMTP id
 5614622812f47-3e794680de1mr10057389b6e.1.1731316676277; 
 Mon, 11 Nov 2024 01:17:56 -0800 (PST)
Received: from [192.168.0.101] (60-250-192-107.hinet-ip.hinet.net.
 [60.250.192.107]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7f41f5bab50sm6863158a12.25.2024.11.11.01.17.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Nov 2024 01:17:55 -0800 (PST)
Message-ID: <cb718d0f-75a5-4720-b0c1-d8fb1f1c653b@gmail.com>
Date: Mon, 11 Nov 2024 17:17:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Andrew Lunn <andrew@lunn.ch>
References: <20241106111930.218825-1-a0987203069@gmail.com>
 <20241106111930.218825-2-a0987203069@gmail.com>
 <f3c6b67f-5c15-43e2-832e-28392fbe52ec@lunn.ch>
 <21a00f02-7f2f-46da-a67f-be3e64019303@gmail.com>
 <9455e2f6-b41d-476e-bda9-fc01958e48d5@lunn.ch>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <9455e2f6-b41d-476e-bda9-fc01958e48d5@lunn.ch>
X-Mailman-Approved-At: Wed, 20 Nov 2024 17:49:43 +0000
Cc: robh@kernel.org, conor+dt@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, devicetree@vger.kernel.org,
 openbmc@lists.ozlabs.org, netdev@vger.kernel.org, richardcochran@gmail.com,
 ychuang3@nuvoton.com, linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch,
 edumazet@google.com, joabreu@synopsys.com,
 linux-arm-kernel@lists.infradead.org, mcoquelin.stm32@gmail.com,
 schung@nuvoton.com, kuba@kernel.org, krzk+dt@kernel.org, pabeni@redhat.com,
 davem@davemloft.net, yclu4@nuvoton.com
Subject: Re: [Linux-stm32] [PATCH 1/3] dt-bindings: net: nuvoton: Add schema
 for Nuvoton MA35 family GMAC
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Ck9uIDExLzcvMjQgMjE6MTgsIEFuZHJldyBMdW5uIHdyb3RlOgo+IE9uIFRodSwgTm92IDA3LCAy
MDI0IGF0IDA2OjMxOjI2UE0gKzA4MDAsIEpvZXkgTHUgd3JvdGU6Cj4+IERlYXIgQW5kcmV3LAo+
Pgo+PiBUaGFuayB5b3UgZm9yIHlvdXIgcmVwbHkuCj4+Cj4+IEFuZHJldyBMdW5uIOaWvCAxMS83
LzIwMjQgMjoxMyBBTSDlr6vpgZM6Cj4+Pj4gKyAgcGh5LW1vZGU6Cj4+Pj4gKyAgICBlbnVtOgo+
Pj4+ICsgICAgICAtIHJtaWkKPj4+PiArICAgICAgLSByZ21paS1pZAo+Pj4gVGhlIHBoeS1tb2Rl
IGRlZXBlbmVkIG9uIHRoZSBib2FyZCBkZXNpZ24uIEFsbCBmb3VyIHJnbWlpIHZhbHVlcyBhcmUK
Pj4+IHZhbGlkLgo+PiBJIHdpbGwgYWRkIHRoZW0uCj4+Pj4gKwo+Pj4+ICsgIHR4X2RlbGF5Ogo+
Pj4+ICsgICAgbWF4SXRlbXM6IDEKPj4+PiArICAgIGRlc2NyaXB0aW9uOgo+Pj4+ICsgICAgICBD
b250cm9sIHRyYW5zbWl0IGNsb2NrIHBhdGggZGVsYXkgaW4gbmFub3NlY29uZHMuCj4+Pj4gKwo+
Pj4+ICsgIHJ4X2RlbGF5Ogo+Pj4+ICsgICAgbWF4SXRlbXM6IDEKPj4+PiArICAgIGRlc2NyaXB0
aW9uOgo+Pj4+ICsgICAgICBDb250cm9sIHJlY2VpdmUgY2xvY2sgcGF0aCBkZWxheSBpbiBuYW5v
c2Vjb25kcy4KPj4+IElmIHlvdSBhYnNvbHV0ZWx5IHJlYWxseSBuZWVkIHRoZXNlLCBrZWVwIHRo
ZW0sIGJ1dCBpIHN1Z2dlc3QgeW91IGRyb3AKPj4+IHRoZW0uIFRoZXkganVzdCBjYXVzZSBjb25m
dXNpb24sIHdoZW4gaWRlYWxseSB3ZSB3YW50IHRoZSBQSFkgdG8gYmUKPj4+IGFkZGluZyBSR01J
SSBkZWxheXMsIG5vdCB0aGUgTUFDLgo+Pj4KPj4+IElmIHlvdSBkbyBuZWVkIHRoZW0sIHRoZW4g
dGhleSBzaG91bGQgYmUgaW4gcFMuCj4+IEkgd2lsbCBmaXggaXQuCj4+Cj4+IFdlIGhhdmUgY3Vz
dG9tZXJzIHdobyB1c2UgYSBmaXhlZCBsaW5rIGluc3RlYWQgb2YgYSBQSFksIHNvIHRoZXNlIHBy
b3BlcnRpZXMKPj4gbWF5IGJlIG5lY2Vzc2FyeS4KPiBUaGF0IGlzIGEgbGVnaXRpbWF0ZSB1c2Ug
Y2FzZSB3aGljaCBjYW4gcmVxdWlyZSB0aGUgTUFDIHRvIGFkZCBkZWxheXMsCj4gYnV0IGkgZ2Vu
ZXJhbGx5IHRyeSB0byBnZXQgdGhlIHN3aXRjaCBvbiB0aGUgb3RoZXIgZW5kIHRvIGFkZCB0aGUK
PiBkZWxheXMsIGp1c3QgdG8ga2VlcCB3aXRoIHRoZSB1bmlmb3JtIHNldHVwLgo+Cj4gQWxzbywg
cGxlYXNlIHRha2UgYSBsb29rIGF0IGV0aGVybmV0LWNvbnRyb2xsZXIueWFtbCwgdGhlc2Ugc2hv
dWxkIGJlCj4gY2FsbGVkIHJ4LWludGVybmFsLWRlbGF5LXBzICYgdHgtaW50ZXJuYWwtZGVsYXkt
cHMuCj4KPiAJQW5kcmV3CgpUaGFuayB5b3UsIHNpci4gSSB3aWxsIHVzZSByeC1pbnRlcm5hbC1k
ZWxheS1wcyBhbmQgdHgtaW50ZXJuYWwtZGVsYXktcHMgCmluc3RlYWQuCgogwqDCoMKgIMKgwqDC
oCDCoMKgwqAgwqDCoMKgIEpvZXkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
