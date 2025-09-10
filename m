Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 343E4B511A7
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Sep 2025 10:41:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ED0D8C35E00;
	Wed, 10 Sep 2025 08:41:45 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 64C7AC36B35
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Sep 2025 08:41:44 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-45cb5492350so42656195e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Sep 2025 01:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757493704; x=1758098504;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=P3IKUpQfaLekPKjen96M//7ifX26lwnIh4aj6a3++lk=;
 b=nO8H3HZVLp3sq1L2ynfY6M7cd25sTcWPpotlDhOHyrqghK4+8pDSg2plsyn7ruwv6m
 rS1birieZpFWlzj00QqlalyBEzA9CNs+ahzifIJeVhGgglz/E19jGdoeB2ZVmMjnmtfw
 wu50gfVnp6SBAzz8R6n0CKU+3ynGDyywloxBUFYIUkeRwmJiQFDEUU5DDaJihbUN7JUM
 YoQkYIplDlpN9tEo+yz1iE+feVX58cl0AymiNNG9BQE9fBzdzbxmyQIQMQ0V5ibcPEym
 iY6mYEpUWf1UphKEZPe22o9xNE4wz98BKHHMr521Sjh5+tSKCqyM3SyX9VnvSvumuLw2
 +2fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757493704; x=1758098504;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=P3IKUpQfaLekPKjen96M//7ifX26lwnIh4aj6a3++lk=;
 b=PxyF/kQdWTe9BJCdQpmTcgkumhPzJEd45LkmQen+NWq+tcFyX+WkIQ5Vynq4K7aKZO
 bmd8vqPWDFEtsF/aEFvu7Vsdc5Td6PK2Eha8LtUAhv8T31CQCr/Bk+MUmuilLcY/l5Ss
 WDED/oTSFxrpIyTuZ1H6nx9V7B6TQ76ql8WuPtuBM5md6CbtWUZYjqbILAOULpYp8Pto
 Ki3UBd5okZUhScjOp/FXRMAY3OqnnZjPWO68eSTjbkD/ZSeefWILY9/666+Q50Z7b91T
 EcKQw3W+kpiQwSw31/Wh4F55OEU5CMUBUa3FbRxogD8JT3HaKjyPFTHH6zgEvDslFS7V
 bqFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUVHPk0X38Jtq++I0gG7uvytmQvd1j+9n9JWaPqTZLRPHeu82fwfi+zUsiydLaurDG/3E31RFASpEsFaQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzqypU9dqgrEgsJSe6ybkmKy1lIozIq0HGqHMxf8jsVNB/8ilAv
 vj7NmYr9AZSJ5kMwJ1MVkRX53WZiKWskH/xnAC6CrePj0fJYGO2mBwS4
X-Gm-Gg: ASbGncuEgsRJmrECKt4nrUD90BHZo+jeN2osN4iEiXDejPl6MmZ8wEaEBMnc3q9QN2x
 N3PqXn/S3JlMc8KYS2K3JnxLSQM5u5aHFEz2idEOFeCH8djWC/7MSGsiIpreQ8AyohhTRz/ue+x
 tHbYI40wj9MQM5FnQRrm1S/B2gH12B7WBJOJIDnseGBfCE5Bk7yB5Lxo50QCyFXqtfcfVAFI1JY
 KVnBEwPNE+3Ie/hUlQy/zp5hl6DRT63UHmMkvswfFfod17no7YYBAqQSZsQMNTaj4Ww2fn6sjS6
 GTWbU0ydBQcTo5biQB/I9UVk4tfOSWpa3+pdmghAAUKxhAIcTMdHpGk8t1/d9wfiif0Iq+CT8ul
 L/62MlRIpaDqIGjHVo3i79PZ9Ni26qytL0wGDIpdpqbN3gnE5d6y5psLwNw1dN4KOjSddvM7mx0
 BCkIEzMCfPHAXMhuaBtvEOXsVP4dNUpbFCa8aog/LmUbtEEWKXSfrIWaVkfEHglotU3u89x9RhR
 A==
X-Google-Smtp-Source: AGHT+IFAC+KaKdWZCDt0F29FwBEVeFET6FJu2DQLhogXKqRlrNmNAmvGOz7dmZmfwY3vjWPcfaiR9g==
X-Received: by 2002:a05:600c:1387:b0:45b:9c93:d237 with SMTP id
 5b1f17b1804b1-45dddeb93f1mr119978935e9.14.1757493703536; 
 Wed, 10 Sep 2025 01:41:43 -0700 (PDT)
Received: from ?IPV6:2a02:8440:7135:4f4c:9000:7072:695b:3ef?
 (2a02-8440-7135-4f4c-9000-7072-695b-03ef.rev.sfr.net.
 [2a02:8440:7135:4f4c:9000:7072:695b:3ef])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45df81d3ee4sm19382275e9.6.2025.09.10.01.41.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Sep 2025 01:41:43 -0700 (PDT)
Message-ID: <899eb863-6b6d-42f0-9e7c-e2020ee45f4d@gmail.com>
Date: Wed, 10 Sep 2025 10:41:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Krzysztof Kozlowski <krzk@kernel.org>
References: <20250909-b4-ddrperfm-upstream-v6-0-ce082cc801b5@gmail.com>
 <20250909-b4-ddrperfm-upstream-v6-5-ce082cc801b5@gmail.com>
 <20250910-flat-raptor-of-temperance-5e8c7c@kuoka>
Content-Language: en-US
From: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
In-Reply-To: <20250910-flat-raptor-of-temperance-5e8c7c@kuoka>
Cc: Mark Rutland <mark.rutland@arm.com>, linux-doc@vger.kernel.org,
 Michael Turquette <mturquette@baylibre.com>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Will Deacon <will@kernel.org>, linux-clk@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 linux-stm32@st-md-mailman.stormreply.com, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>, Julius Werner <jwerner@chromium.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v6 05/20] dt-bindings: memory: factorise
 LPDDR props into SDRAM props
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

T24gMTAvMDkvMjAyNSAwOTo1NCwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPiBPbiBUdWUs
IFNlcCAwOSwgMjAyNSBhdCAxMjoxMjoxMlBNICswMjAwLCBDbMOpbWVudCBMZSBHb2ZmaWMgd3Jv
dGU6Cj4+IEZyb206IENsw6ltZW50IExlIEdvZmZpYyA8Y2xlbWVudC5sZWdvZmZpY0Bmb3NzLnN0
LmNvbT4KPj4KPj4gTFBERFIgYW5kIEREUiBiaW5kaW5ncyBhcmUgU0RSQU0gdHlwZXMgYW5kIGFy
ZSBsaWtlbHkgdG8gc2hhcmUgdGhlIHNhbWUKPj4gcHJvcGVydGllcyAoYXQgbGVhc3QgZm9yIGRl
bnNpdHksIGlvLXdpZHRoIGFuZCByZWcpLgo+PiBUbyBhdm9pZCBiaW5kaW5ncyBkdXBsaWNhdGlv
biwgZmFjdG9yaXNlIHRoZSBwcm9wZXJ0aWVzLgo+Pgo+PiBUaGUgY29tcGF0aWJsZSBkZXNjcmlw
dGlvbiBoYXMgYmVlbiB1cGRhdGVkIGJlY2F1c2UgdGhlIE1SIChNb2RlCj4+IHJlZ2lzdGVycykg
dXNlZCB0byBnZXQgbWFudWZhY3R1cmVyIElEIGFuZCByZXZpc2lvbiBJRCBhcmUgbm90IHByZXNl
bnQKPj4gaW4gY2FzZSBvZiBERFIuCj4+IFRob3NlIGluZm9ybWF0aW9uIHNob3VsZCBiZSBpbiBh
IFNQRCAoU2VyaWFsIFByZXNlbmNlIERldGVjdCkgRUVQUk9NIGluCj4+IGNhc2Ugb2YgRElNTSBt
b2R1bGUgb3IgYXJlIGtub3duIGluIGNhc2Ugb2Ygc29sZGVyZWQgbWVtb3J5IGNoaXBzIGFzCj4+
IHRoZXkgYXJlIGluIHRoZSBkYXRhc2hlZXQgb2YgdGhlIG1lbW9yeSBjaGlwcy4KPj4KPj4gU2ln
bmVkLW9mZi1ieTogQ2zDqW1lbnQgTGUgR29mZmljIDxjbGVtZW50LmxlZ29mZmljQGZvc3Muc3Qu
Y29tPgo+IAo+IElzIHRoaXMgZW1haWwgZGVmdW5jdCBub3csIHRoYXQgeW91IGFkZCBzZWNvbmQg
U29CPwoKWWVzLCBidXQgSSBzdGlsbCB3YW50IHRvIHVwc3RyZWFtIGl0IGFuZCB3YXMgdGhpbmtp
bmcgdG8ga2VlcCB0aGUgCiJvcmlnaW5hbCIgYXV0aG9yIGV2ZW4gaWYgaXQgaXMgbWUuCkFtIEkg
d3JvbmcgaGVyZSA/IFdoYXQgc2hvdWxkIEkgZG8gPwoKPj4gU2lnbmVkLW9mZi1ieTogQ2zDqW1l
bnQgTGUgR29mZmljIDxsZWdvZmZpYy5jbGVtZW50QGdtYWlsLmNvbT4KCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxp
c3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
