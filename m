Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 56336B31A73
	for <lists+linux-stm32@lfdr.de>; Fri, 22 Aug 2025 16:00:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D7566C3F95B;
	Fri, 22 Aug 2025 13:59:59 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1D8A4C3F95A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Aug 2025 13:59:57 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-afcb7ace3baso356506066b.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Aug 2025 06:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755871197; x=1756475997;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=V014dFiaSCDPs2i3+HfkIg6rp9m74x/8h2rQVVO+dUk=;
 b=b+TrcIRSV/tDr99W34c65c2IMqZRnlZVk3Apc9FVq/eG9Jmgta3y4ZbjE4OqzFMPn/
 8YmphWwNfKLgb/0AiD80tgjT+/yXcdlmWUZciPUYxGyolca2l2ymbGvrUq2G4e7JEi3N
 Ff7Ve/L3E1OG1RsmrArsp4m8UrkMLjqDPTmC4abXmnnwRvgwwaq0d3f4znhsNjL9HzDv
 Oznlbs77NuZMddVwbmRT6h9C/rLQ0LamTnWzq1CyTwgNFTXbxYA3Gxgf2kkA0ZTb3em0
 kCXWTbBHnnPcnBJY799o/U9wOn6MUs7dbu4h5gD7KKoESXoWVh06t/2bMAqyWc1ocEva
 59Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755871197; x=1756475997;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=V014dFiaSCDPs2i3+HfkIg6rp9m74x/8h2rQVVO+dUk=;
 b=LlG8CsvpxlQkD/OISMPIHKtRXyFEA8k/RrzVsqTbnJUZxsJrWL4RKDazZl6Pn13xIS
 iCSX1z00Xu9OlmQPSIKG42jsYP4jlIxJYz26yUu2MDNieaklU18FBQZVZE/a010pn0I4
 1wF+S3b+1EDIaVK39qnYW0/PHy8229E3/HfFoNVkUy3wLQ8DT22MdBr2GsoSAcwW7bOM
 YuyL5vZaLo/K8TAhxyeu6VBI3DYV6YdJSbTidYHgFvukn8xeP5/UlkgwtPBvQdTFQMs5
 VDmPaUz45m2a+NFUeD408queMaJDhqsO7tCj5jdBEoqDuGVhghb+CGfaoAsuk0lDesIN
 gDXA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWkI3t1fH3F9IbQM7dNcO5A6V+aEKiStsu8NMvSy2rcmyURHYGME73KMp+pc1uyMHWgMhIbJKZjSTesuQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yxbywc2fbXPtHkmf95JPpdznlCzDgTQ3SNa12CEqykNavO4fu6c
 TpxOR7s5axnIXMqqJ/cGN1UjNVOnw0QNVweWi3Fm99HXhK1KqNVrjEwr
X-Gm-Gg: ASbGncuRcobEwwQV/pDPRi1QNpgfFCzQ7TNN5WLATCkxMV6Lxo2to38HGsGs7tL9l9D
 cek0pCBbzMDmjI3cyyZWHoSQ0ECqcehAIPkQyWbgkrK/0G6kBGm/Dm2bEIP+80wW08gtqK0sy/U
 zjA1a+8PVqeIADKo3v0eDOLnJ6nXSLdqPGYM+LRbfqJaFgYTu8MLW3kysbDadj2XQzSRbAIiXE5
 NXIrKHmvr/7uMowkChk6ie/Yc0mX2pxG97K+lrlRLubP/gyKAph0FSX1ynXtB1oF1j5DmdpU+eO
 Y/CLvU4J2GAaO+UqOnrTC2kVFM0C5IvgimRWHVSuERHAD5p16t9YqTGn7ObZterTslJ4d73CGaV
 7yOP3emt9+YyeT/e2wLL4vEjyU4cYjH3k6PG7J7U+gwuWLYTcnRSvG//qIwpUTNrDWyBzJVXFvw
 uDO+cHIiOUvtiuj8EJOJccMOaL9wM3Tdrr3KOTOkqLESAPvRGIegV8c8wueTYFAYXrB79a8UPJ+
 EZW
X-Google-Smtp-Source: AGHT+IEf+0iTczeJWYRvKTzbPjuHcrR0Q/vZbiX0S4rQLygBrUblykK/q9qnm/yelo9JpR8nUFhBWw==
X-Received: by 2002:a17:907:60d3:b0:af9:e3d3:a450 with SMTP id
 a640c23a62f3a-afe28f77734mr245587666b.6.1755871197072; 
 Fri, 22 Aug 2025 06:59:57 -0700 (PDT)
Received: from ?IPV6:2a02:8440:714a:ca26:61e9:f2d7:67f6:fe9d?
 (2a02-8440-714a-ca26-61e9-f2d7-67f6-fe9d.rev.sfr.net.
 [2a02:8440:714a:ca26:61e9:f2d7:67f6:fe9d])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afded4796f3sm607923666b.61.2025.08.22.06.59.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Aug 2025 06:59:56 -0700 (PDT)
Message-ID: <6a10616b-3234-4336-aff6-4e60047ebcb6@gmail.com>
Date: Fri, 22 Aug 2025 15:59:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
References: <20250728-ddrperfm-upstream-v5-0-03f1be8ad396@foss.st.com>
 <20250728-ddrperfm-upstream-v5-6-03f1be8ad396@foss.st.com>
 <20250730211151.GA1749004-robh@kernel.org>
 <da8578ae-3f79-4082-b0fb-760553004c93@gmail.com>
 <fb5083ff-4bee-4a0f-8774-54b492cd9a6d@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
In-Reply-To: <fb5083ff-4bee-4a0f-8774-54b492cd9a6d@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Jonathan Corbet <corbet@lwn.net>, Stephen Boyd <sboyd@kernel.org>,
 linux-kernel@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 linux-doc@vger.kernel.org, linux-clk@vger.kernel.org,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 linux-perf-users@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Julius Werner <jwerner@chromium.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Will Deacon <will@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v5 06/20] dt-bindings: memory: introduce
	DDR4
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

SGkgS3J6eXN6dG9mLAoKT24gMTcvMDgvMjAyNSAwOToxOSwgS3J6eXN6dG9mIEtvemxvd3NraSB3
cm90ZToKPiBPbiAxNC8wOC8yMDI1IDE2OjQyLCBDbMOpbWVudCBMZSBHb2ZmaWMgd3JvdGU6Cj4+
IEhpIFJvYiwKPj4KPj4gT24gMzAvMDcvMjAyNSAyMzoxMSwgUm9iIEhlcnJpbmcgd3JvdGU6Cj4+
PiBPbiBNb24sIEp1bCAyOCwgMjAyNSBhdCAwNToyOTozN1BNICswMjAwLCBDbMOpbWVudCBMZSBH
b2ZmaWMgd3JvdGU6Cj4+Pj4gSW50cm9kdWNlIEpFREVDIGNvbXBsaWFudCBERFIgYmluZGluZ3Ms
IHRoYXQgdXNlIG5ldyBtZW1vcnktcHJvcHMgYmluZGluZy4KPj4+Pgo+Pj4+IFNpZ25lZC1vZmYt
Ynk6IENsw6ltZW50IExlIEdvZmZpYyA8Y2xlbWVudC5sZWdvZmZpY0Bmb3NzLnN0LmNvbT4KPj4+
PiAtLS0KPj4+PiAgICAuLi4vbWVtb3J5LWNvbnRyb2xsZXJzL2Rkci9qZWRlYyxkZHI0LnlhbWwg
ICAgICAgICB8IDM0ICsrKysrKysrKysrKysrKysrKysrKysKPj4+PiAgICAxIGZpbGUgY2hhbmdl
ZCwgMzQgaW5zZXJ0aW9ucygrKQo+Pj4+Cj4+Pj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9tZW1vcnktY29udHJvbGxlcnMvZGRyL2plZGVjLGRkcjQueWFt
bCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZW1vcnktY29udHJvbGxlcnMv
ZGRyL2plZGVjLGRkcjQueWFtbAo+Pj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4+Pj4gaW5kZXgg
MDAwMDAwMDAwMDAwLi5mNDU3MDY2YTJmOGIKPj4+PiAtLS0gL2Rldi9udWxsCj4+Pj4gKysrIGIv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lbW9yeS1jb250cm9sbGVycy9kZHIv
amVkZWMsZGRyNC55YW1sCj4+Pj4gQEAgLTAsMCArMSwzNCBAQAo+Pj4+ICsjIFNQRFgtTGljZW5z
ZS1JZGVudGlmaWVyOiAoR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkKPj4+PiArJVlBTUwg
MS4yCj4+Pj4gKy0tLQo+Pj4+ICskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL21l
bW9yeS1jb250cm9sbGVycy9kZHIvamVkZWMsZGRyNC55YW1sIwo+Pj4+ICskc2NoZW1hOiBodHRw
Oi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMKPj4+PiArCj4+Pj4gK3Rp
dGxlOiBERFIzIFNEUkFNIGNvbXBsaWFudCB0byBKRURFQyBKRVNENzktNEQKPj4+PiArCj4+Pj4g
K21haW50YWluZXJzOgo+Pj4+ICsgIC0gS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6a0BrZXJuZWwu
b3JnPgo+Pj4+ICsKPj4+PiArYWxsT2Y6Cj4+Pj4gKyAgLSAkcmVmOiBqZWRlYyxzZHJhbS1wcm9w
cy55YW1sIwo+Pj4+ICsKPj4+PiArcHJvcGVydGllczoKPj4+PiArICBjb21wYXRpYmxlOgo+Pj4+
ICsgICAgaXRlbXM6Cj4+Pj4gKyAgICAgIC0gcGF0dGVybjogIl5kZHI0LVswLTlhLWZdezJ9LFsw
LTlhLWZdezF9JCIKPj4+Cj4+PiBTaG91bGRuJ3QgdGhpcyBiZSAnamVkZWMsZGRyNC0uLi4nCj4+
Cj4+IFRoYXQncyBub3QgdGhlIGNhc2UgZm9yIGxwZGRyIGJpbmRpbmdzLCBJIHdhbnRlZCBib3Ro
IGxwZGRyIGFuZCBkZHIKPj4gYmluZGluZ3MgdG8gYmUgc2ltaWxhciBidXQgdGhpcyBjYW4gY2hh
bmdlLgo+IAo+IEZvciBMUEREUiBKdWxpdXMgaW50cm9kdWNlZCBpbiBjb21taXQgNjg2ZmU2M2Iy
MjgwICgiZHQtYmluZGluZ3M6Cj4gbWVtb3J5OiBBZGQgbnVtZXJpYyBMUEREUiBjb21wYXRpYmxl
IHN0cmluZyB2YXJpYW50IikgZGRyNC1WRU5ET1JJRAo+IHBhdHRlcm4gdG8gZGlzdGluZ3Vpc2gg
aW5kaXZpZHVhbCBtYW51ZmFjdHVyZXJzLgo+IAo+IEplZGVjIGlzIG5vdCByZWFsbHkgdGhlIHZl
bmRvciBoZXJlLgo+IAo+IElzIGl0IHRoZSBzYW1lIGNhc2UgaW4gRERSPyBZb3UgaGF2ZSBhIGRl
ZmluZWQgbGlzdCBvZiB2ZW5kb3IgSURzIChhbHNvCj4gMSBieXRlKT8KClRoZXJlIGlzIG5vIGRl
ZmluZWQgbGlzdCBvZiB2ZW5kb3IgSURzLgpUaGUgd2F5IHRoZSBjb21wYXRpYmxlIHN0cmluZyBp
cyBjcmVhdGVkIGlzIGV4cGxhaW5lZCBpbgpqZWRlYyxzZHJhbS1wcm9wcy55YW1sIGZpbGUgd2hp
Y2ggaXMgY3JlYXRlZCBpbiBwYXRjaCA1IG9mIHRoaXMgc2VyaWVzLgoKQmVzdCByZWdhcmRzLApD
bMOpbWVudApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0
aW5mby9saW51eC1zdG0zMgo=
