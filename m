Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D25A0380E
	for <lists+linux-stm32@lfdr.de>; Tue,  7 Jan 2025 07:38:18 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BC142C78018;
	Tue,  7 Jan 2025 06:38:17 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3954DC78013
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Jan 2025 06:38:11 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-2163dc5155fso217277385ad.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 06 Jan 2025 22:38:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736231890; x=1736836690;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=orCDsDNFA6uclIQ3/usGvXWL2lE5OsemzFx60WJJZsA=;
 b=Jntd4iNjmdekOKLpJ8wYlGRvtUBVOAkSTzD4aiWpQdE9Xm2qkZWg8r2gc3Facwgfe6
 PaxDRUb5Ud1mw5pzEnE1t2NmrEAeGz5r6N8mg9HkjmE9ARTUNqmnVs7zgwyyoub3YPbJ
 aVxPdFpmwCrkKhj+Rzk/UGJN8092NxnwwmR4mtBq+nmA+0oDiW6mw/QNQMyf2lMiykFo
 5NMpYWP5pVbIL+vNTOuv8haixwQwv6oYLzFJqVwJw7oHi6JTmX9r/Qce+tIFd/MPWJom
 vce0kpaInKl75mB0zGNppIlvWu0czJDP3LWB8JSbrHAEdWN/zDPJNdqn6wd4eM2tIN46
 1hYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736231890; x=1736836690;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=orCDsDNFA6uclIQ3/usGvXWL2lE5OsemzFx60WJJZsA=;
 b=fHvMkro1KKG52WI+TLk4hITmHmGHwk64cuYZ4dsFFo8RgGqL0ctQvl2fMQUd3hRv1t
 Qb9lOewYrhoimO5Fnj3O0j6S6jI+J/PaqrbFl0gMPdsBs7ueglYtkUzwrDWb3Cp/eFtC
 lD6BaaE8PxX4EnEooJT2iWM+liJwEtYrjaYVkjXO8mRbZUbSKFW3bF1J5FPzlJSmrLsQ
 hmpyL/GZYyUdBoDVq87bsjHSn/XgHdwh+pRQGelAnOWQ0w3DjB2JR/A8M5bCg5BstanD
 H8iKH2qCLww8YmfgUsAIbn2fBLfqftUkCubx4LYtCRXmmkOYWwicCQPI7lXxEUT8LSAD
 smxA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWAN5Hs1CiGNhqeNdM6vgVkfD30wACXDt0qsAxE0Cuv5EURr/c6LhsauW3Z8gJPmzf3jS6oM8T66Cy/Gg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwJ/7KrJPDg96i4f2RCMydxqq46NSg/5bWzTVYMVhbIg5b4/dDs
 oIEJ/gcPGh3cydd4VNTXV6dG2QBGmpEr73EvkalVoVOn9/az1ScV
X-Gm-Gg: ASbGncvjeOxfwNzuwBHgOEoqdkquGgwcIBihnGYGNTdSaUF331PpzuQ3Iq6m48l/TTo
 x0i22u/wlKjIqaxl0+JZVCHT6EwdXW5nokeQ54B3IOCklDkliR7xqn0Xvm91jidwK2PSbM3hgrF
 9iJ7zesB1iK/qOGv7Rh89vt3jGi7/xOySK8pljm4NvrC3eCGtQrz1rDx0pu0CKdNIl3t0rR02N2
 wkvKMj/nIAr4aR0raaZaq/datSW04zrXkEvnLz54l68YrQqXW1cfEHClMoi8x5DEi/+VJqbEEJF
 IVsqkN+t2fAeAUOEhdejjfzWem6n0EnfgdI=
X-Google-Smtp-Source: AGHT+IGWjFIAveI9yo5Dqy+7qm6ujTkxPVuxedvySkpkmuvq5Mxo0g2bGXtAvQZqm2ic1gDjzturbQ==
X-Received: by 2002:a17:902:d2c9:b0:216:4c88:d939 with SMTP id
 d9443c01a7336-219e6f133b6mr907204635ad.38.1736231889846; 
 Mon, 06 Jan 2025 22:38:09 -0800 (PST)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net.
 [60.250.196.139]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-219dc9f5227sm305467095ad.185.2025.01.06.22.38.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jan 2025 22:38:09 -0800 (PST)
Message-ID: <39e559f4-375b-4e4e-8c81-3d1d8858e839@gmail.com>
Date: Tue, 7 Jan 2025 14:38:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jakub Kicinski <kuba@kernel.org>
References: <20250103063241.2306312-1-a0987203069@gmail.com>
 <20250106163054.79cdd533@kernel.org>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <20250106163054.79cdd533@kernel.org>
Cc: robh@kernel.org, conor+dt@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, devicetree@vger.kernel.org,
 openbmc@lists.ozlabs.org, netdev@vger.kernel.org, richardcochran@gmail.com,
 ychuang3@nuvoton.com, linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch,
 edumazet@google.com, joabreu@synopsys.com,
 linux-arm-kernel@lists.infradead.org, mcoquelin.stm32@gmail.com,
 schung@nuvoton.com, peppe.cavallaro@st.com, krzk+dt@kernel.org,
 pabeni@redhat.com, davem@davemloft.net, yclu4@nuvoton.com
Subject: Re: [Linux-stm32] [PATCH net-next v6 0/3] Add support for Nuvoton
	MA35D1 GMAC
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

Ckpha3ViIEtpY2luc2tpIOaWvCAxLzcvMjAyNSA4OjMwIEFNIOWvq+mBkzoKPiBPbiBGcmksICAz
IEphbiAyMDI1IDE0OjMyOjM4ICswODAwIEpvZXkgTHUgd3JvdGU6Cj4+IFRoaXMgcGF0Y2ggc2Vy
aWVzIGlzIHN1Ym1pdHRlZCB0byBhZGQgR01BQyBzdXBwb3J0IGZvciBOdXZvdG9uIE1BMzVEMQo+
PiBTb0MgcGxhdGZvcm0uIFRoaXMgd29yayBpbnZvbHZlcyBpbXBsZW1lbnRpbmcgYSBHTUFDIGRy
aXZlciBnbHVlIGxheWVyCj4+IGJhc2VkIG9uIFN5bm9wc3lzIERXTUFDIGRyaXZlciBmcmFtZXdv
cmsgdG8gbGV2ZXJhZ2UgTUEzNUQxJ3MgZHVhbCBHTUFDCj4+IGludGVyZmFjZSBjYXBhYmlsaXRp
ZXMuCj4gV291bGQgYmUgZ29vZCBpZiB5b3UgY291bGQgcmVwbHkgdG8gQ2hyaXN0b3BoZSdzIHF1
ZXN0aW9uLgo+Cj4gVGhlbiBwbGVhc2UgcmViYXNlIG9uIHRvcCBvZiBuZXQtbmV4dC9tYWluIGFu
ZCByZXBvc3QuCj4gVGhlIGZpcnN0IHBhdGNoIGRvZXNuJ3QgY3VycmVudGx5IGFwcGx5IGNsZWFu
bHkuCj4gUGxlYXNlIGxlYXZlIG91dCB0aGUgc2Vjb25kIHBhdGNoLCBpdCBoYXMgdG8gZ28gdmlh
Cj4gdGhlIGFwcHJvcHJpYXRlIHBsYXRmb3JtIHRyZWUsIHJhdGhlciB0aGFuIHRoZSBuZXR3b3Jr
aW5nCj4gdHJlZS4KCkkgZ290IGl0LiBUaGFuayB5b3UhCgpCUiwKCkpvZXkKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcg
bGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
