Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B271AB2A112
	for <lists+linux-stm32@lfdr.de>; Mon, 18 Aug 2025 14:05:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CAEC0C3F93A;
	Mon, 18 Aug 2025 12:05:23 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2FE4AC32EB0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Aug 2025 14:42:48 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-45a1b0c8867so7702155e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Aug 2025 07:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755182567; x=1755787367;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=p2VPK+LGzPHiwIqFk3Ohj/RoTK5gsaz46bIEazLhBRA=;
 b=K0qlmjZGZJ3pVF0P4A14+k0wv1VBVTZwbkqjZ6RZ/hirGYoGzBT1A2UcxRwZhc1wMo
 xZVfmSd2f6SxgA/JjAQEwsMW38RgmfkJ4PBwL0+siDVyQ7URMp0Lv0nNilEBJ8znbIyd
 19Anz1M4oR2Cr1qYDnoYitwm+RbwmRqtDHf2rgQ3C7QQLdoO4xXomAZy85tB6BPBbM0E
 hoiEouvc1pK2hvFcSVzGsL5LKzoNAiE64UnQeWOn8MbFQ32wujBfHXFUTAuvlCq1zGBd
 Xmv/zWlD4wNfO0gcHKNuvwjmdL9iOCXr6x5FMaqEWW/rR8w72IUFG3TWwztj3fWEFCrX
 H/fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755182567; x=1755787367;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=p2VPK+LGzPHiwIqFk3Ohj/RoTK5gsaz46bIEazLhBRA=;
 b=cXsOneOF1mIKzO4RugKFsgys5vyTbujRm4Fb4zV3i34lop35HWqQadtkSclSQ+lIiC
 OGqBeb/w6OQUfKLKKDFHk6x8fRyG02OjQJe54wInSM5zi9kjPl9ObXcBIWh1F0lbNPuG
 yztRkcUKczeD8YesyWiZuCJ2aXHSIVI0z3XSeqw7nCbxtHbXnY2bg6qAvBnJU9y0DK5C
 WXp2R7U6gDqE/M+800CY7trjnCg1bXkVfOOXws5YqQKYJbYwleUdvDA9nNqit/AyWt31
 j14ukolXPKiOLlTagHcElESmYTUEpyydHoWzsNNMQuXcviz+6MResBMUuTw7HMneo5Sn
 Df4g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVq8/Yo7001UrgwkMow/42zLhjfG6l/z77TpzXD4x2GkKYS1pDEQg7VBIdO/Is/TDp7Ygy4O/yHRj509w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx46mQV9qII4+Y6GBTqcMHq3vpUV6HRJ+UR1hy9hp3TqXjtlKYB
 L6ZYwgBlJRYM9AX1CWif9OtNKFxuXgZMHG71cjwMVO3jsJCU1nlgJmZl
X-Gm-Gg: ASbGncsrDebVshUbHBXu4bQ9aUBW9RCNvN1SHDQpvqWSweoatHrvY3uCVpmIEljpxgt
 k0abIhIG6T3Ap6FdVx4p5agts0rCMAnfkcQFjX8y1QrlWSOoSW41AxOdL8npH3KueVp+wGvjKGC
 dupuEbw9gIzgvIyqmvYFlc2xpRg2GnkML1Vf7SyK+HwyOoWpR+gnVHS+AcN+FFvZWTRUCmoCjOM
 Ip9qk8aOhcwsLbhBxpp2W3LmW2JcRoSOVwaAyfSTc083PtzJrbYqpKQBU5ECMN6B8lylX9OinJV
 wXkQOFbqpPys/MWkcN/eHi4MkBlGic6x5HIGX4axlKHP2FEAXWx3zR0EKl0PJRXdsBlWi4yFY4O
 +FWFBkySm2BZq6ZqksDgiEZDQYYk7r3kVw20zeI8ift4zXNli2QHXmEcFCQH/L0YTy7L74SpvVP
 a8kJYIG8OhltfoyytcxI6ZOA4Qsydn6VJUaWAgHfzyqQ5ufFq4pimQY8TIjmBpt02Dnn4BOEFsy
 Wg=
X-Google-Smtp-Source: AGHT+IFhCWJEojvA7i+pME+fago4vJDtFzuQD2e2yOvIROciTuu5CIqY7MvPDw7EgLATDPP7poH6og==
X-Received: by 2002:a05:600c:4f49:b0:440:6a1a:d89f with SMTP id
 5b1f17b1804b1-45a1fe78624mr4900695e9.4.1755182567395; 
 Thu, 14 Aug 2025 07:42:47 -0700 (PDT)
Received: from ?IPV6:2a01:cb08:941b:4c00:f383:4db2:82a:81e9?
 (2a01cb08941b4c00f3834db2082a81e9.ipv6.abo.wanadoo.fr.
 [2a01:cb08:941b:4c00:f383:4db2:82a:81e9])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45a1c718769sm24256305e9.30.2025.08.14.07.42.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Aug 2025 07:42:46 -0700 (PDT)
Message-ID: <da8578ae-3f79-4082-b0fb-760553004c93@gmail.com>
Date: Thu, 14 Aug 2025 16:42:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Rob Herring <robh@kernel.org>,
 =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
References: <20250728-ddrperfm-upstream-v5-0-03f1be8ad396@foss.st.com>
 <20250728-ddrperfm-upstream-v5-6-03f1be8ad396@foss.st.com>
 <20250730211151.GA1749004-robh@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
In-Reply-To: <20250730211151.GA1749004-robh@kernel.org>
X-Mailman-Approved-At: Mon, 18 Aug 2025 12:05:23 +0000
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Jonathan Corbet <corbet@lwn.net>, Stephen Boyd <sboyd@kernel.org>,
 linux-kernel@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 linux-doc@vger.kernel.org, linux-clk@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>,
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

SGkgUm9iLAoKT24gMzAvMDcvMjAyNSAyMzoxMSwgUm9iIEhlcnJpbmcgd3JvdGU6Cj4gT24gTW9u
LCBKdWwgMjgsIDIwMjUgYXQgMDU6Mjk6MzdQTSArMDIwMCwgQ2zDqW1lbnQgTGUgR29mZmljIHdy
b3RlOgo+PiBJbnRyb2R1Y2UgSkVERUMgY29tcGxpYW50IEREUiBiaW5kaW5ncywgdGhhdCB1c2Ug
bmV3IG1lbW9yeS1wcm9wcyBiaW5kaW5nLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBM
ZSBHb2ZmaWMgPGNsZW1lbnQubGVnb2ZmaWNAZm9zcy5zdC5jb20+Cj4+IC0tLQo+PiAgIC4uLi9t
ZW1vcnktY29udHJvbGxlcnMvZGRyL2plZGVjLGRkcjQueWFtbCAgICAgICAgIHwgMzQgKysrKysr
KysrKysrKysrKysrKysrKwo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAzNCBpbnNlcnRpb25zKCspCj4+
Cj4+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVtb3J5
LWNvbnRyb2xsZXJzL2Rkci9qZWRlYyxkZHI0LnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvbWVtb3J5LWNvbnRyb2xsZXJzL2Rkci9qZWRlYyxkZHI0LnlhbWwKPj4gbmV3
IGZpbGUgbW9kZSAxMDA2NDQKPj4gaW5kZXggMDAwMDAwMDAwMDAwLi5mNDU3MDY2YTJmOGIKPj4g
LS0tIC9kZXYvbnVsbAo+PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
bWVtb3J5LWNvbnRyb2xsZXJzL2Rkci9qZWRlYyxkZHI0LnlhbWwKPj4gQEAgLTAsMCArMSwzNCBA
QAo+PiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAtb25seSBPUiBCU0QtMi1D
bGF1c2UpCj4+ICslWUFNTCAxLjIKPj4gKy0tLQo+PiArJGlkOiBodHRwOi8vZGV2aWNldHJlZS5v
cmcvc2NoZW1hcy9tZW1vcnktY29udHJvbGxlcnMvZGRyL2plZGVjLGRkcjQueWFtbCMKPj4gKyRz
Y2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIwo+PiAr
Cj4+ICt0aXRsZTogRERSMyBTRFJBTSBjb21wbGlhbnQgdG8gSkVERUMgSkVTRDc5LTRECj4+ICsK
Pj4gK21haW50YWluZXJzOgo+PiArICAtIEtyenlzenRvZiBLb3psb3dza2kgPGtyemtAa2VybmVs
Lm9yZz4KPj4gKwo+PiArYWxsT2Y6Cj4+ICsgIC0gJHJlZjogamVkZWMsc2RyYW0tcHJvcHMueWFt
bCMKPj4gKwo+PiArcHJvcGVydGllczoKPj4gKyAgY29tcGF0aWJsZToKPj4gKyAgICBpdGVtczoK
Pj4gKyAgICAgIC0gcGF0dGVybjogIl5kZHI0LVswLTlhLWZdezJ9LFswLTlhLWZdezF9JCIKPiAK
PiBTaG91bGRuJ3QgdGhpcyBiZSAnamVkZWMsZGRyNC0uLi4nCgpUaGF0J3Mgbm90IHRoZSBjYXNl
IGZvciBscGRkciBiaW5kaW5ncywgSSB3YW50ZWQgYm90aCBscGRkciBhbmQgZGRyIApiaW5kaW5n
cyB0byBiZSBzaW1pbGFyIGJ1dCB0aGlzIGNhbiBjaGFuZ2UuCgo+IAo+PiArICAgICAgLSBjb25z
dDogamVkZWMsZGRyNAo+PiArCj4+ICtyZXF1aXJlZDoKPj4gKyAgLSBjb21wYXRpYmxlCj4+ICsg
IC0gZGVuc2l0eQo+PiArICAtIGlvLXdpZHRoCj4+ICsKPj4gK3VuZXZhbHVhdGVkUHJvcGVydGll
czogZmFsc2UKPj4gKwo+PiArZXhhbXBsZXM6Cj4+ICsgIC0gfAo+PiArICAgIGRkciB7Cj4+ICsg
ICAgICAgIGNvbXBhdGlibGUgPSAiZGRyNC1mZixmIiwgImplZGVjLGRkcjQiOwo+PiArICAgICAg
ICBkZW5zaXR5ID0gPDgxOTI+Owo+PiArICAgICAgICBpby13aWR0aCA9IDw4PjsKPj4gKyAgICB9
Owo+Pgo+PiAtLSAKPj4gMi40My4wCj4+CgpCZXN0IHJlZ2FyZHMsCkNsw6ltZW50Cl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxp
bmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8v
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMy
Cg==
