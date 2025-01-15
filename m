Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B750A11CF6
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Jan 2025 10:09:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 145E9C78F76;
	Wed, 15 Jan 2025 09:09:22 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1C5E4C6DD6D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Jan 2025 09:09:15 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-216728b1836so113072485ad.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Jan 2025 01:09:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736932154; x=1737536954;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GZu3RRCSZ6fAo+lWLsGDi7lH9XSyk6eapVHs6gKrrgo=;
 b=KgISGIEFVFr9C+JmNaH7JuSdjXdnt2R5kGNrKIR21XEtgs11g4Mw5XbWegBIK/wi0/
 rVsRPV4j0rFPdfceD7hds3CdbEfqf4KJWTLQRIwOW0NC9mFCGB5FYgaBVL+wpJEJ5KCm
 aTiYUXiP/KsMJ3pnMdvPvfHypaDzeeyoP+sKUsEF5fNOZ6pLGj+qrm5h2nfswx+8yXln
 qQucxRoGopA2iqqJeXuyFXhzqZEFcvCGCXZ1BpIPOWQ4qsuWl5HF4N6OMd/sHETaG6DJ
 oNIk5B/kp1izHzztn20ZZ/r5HC8TvaHqv+py7A9q8l0I2FyfVvq9qNj+XNJE61HCbJQb
 6MTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736932154; x=1737536954;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GZu3RRCSZ6fAo+lWLsGDi7lH9XSyk6eapVHs6gKrrgo=;
 b=fVz3XMtXCcbuLcVyKy9Kpgdmu+7Oir9eX67xVpJ2Z26bpONFConFISWhLc9j1twU9s
 4eXmQJcqlk4uuiC7wCXONxY69ms4OuVghJczOqiVZhxy0L6XhVZfgOCh02wvA6Nu6v5j
 xagTG/lgUgVuOEH8vIdMhu2A+RPC85VAz74ZQJaBn/NdTEljqAe1QH8pt9kCTgRx34G8
 OSblBFsOcDCtiZfp0vB0plLZSXV99ypD9B7oN5wMUySupUeP708oWGIzHDnRYr9kZXXb
 IR1zeJmxawKidE9RreID72JH0D5FNkwktNuHZ7ttoTLHUPDsxTxoWsQIzlUzm0OcGRjY
 r9+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCU0xEmqk7M1ARai4DhQHlzeUQgxtthyTZdqIj7/v1zMBQjzSxv34tIgP9WOknBWnAoK+qv8pcjAML8qlg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyuYXCLHhCcILHY4ssgVscW5DXHyPwARY0mijZlV4fABXHAgxuJ
 RjNC1aXQiygBjA3PR5Vj8ocz0S7C/ZR/9Vl/8p5kfYtcbRE8tIdd
X-Gm-Gg: ASbGnctBN2/Ybsb+Dm3G/PaZNjqIU0hJ9lCP4Yj6CJC42KKhheTtwogQQs0vdoL8Gqe
 gcasOT6JymuQjzbU6yhPQ3EdgCGeYpduBkqcJehNabkpTWfCB6iLTU57JKg62Zben1rYUVGDlCH
 YnqVrQRHKszvtyn9IrEvlwioNvwDtu4aeY6QT3r+fB9P12Pv4wvdT0HhYvMVJtnCRJS63znDj2y
 fPxjHqClWxeNPYxHqnieuLpR4SAoyKQSpPoS1ho6p8oYb6AJ5AF0iBTjWFl9EBUov8sO0trK6y7
 UWj+OAnX3g9kLxUoSB1rcmT8c8mth8/v8n0=
X-Google-Smtp-Source: AGHT+IFzyRepggFFHtQT8D4fkFN2tkBOOiPSmaRhjKsx+myOrF3U4xxdVBjzw1AHpDW/+2qMjfDQIg==
X-Received: by 2002:a17:902:e747:b0:216:3c2b:a5d0 with SMTP id
 d9443c01a7336-21a84002a70mr352529525ad.51.1736932153585; 
 Wed, 15 Jan 2025 01:09:13 -0800 (PST)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net.
 [60.250.196.139]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21a9f21a21csm78826285ad.109.2025.01.15.01.09.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jan 2025 01:09:13 -0800 (PST)
Message-ID: <72e993f1-bb8d-43fb-a9cd-210f1f8f02c5@gmail.com>
Date: Wed, 15 Jan 2025 17:09:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jakub Kicinski <kuba@kernel.org>
References: <20250113055434.3377508-1-a0987203069@gmail.com>
 <20250113055434.3377508-4-a0987203069@gmail.com>
 <20250114153323.527d4f63@kernel.org>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <20250114153323.527d4f63@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, ychuang3@nuvoton.com, edumazet@google.com,
 schung@nuvoton.com, yclu4@nuvoton.com,
 linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org,
 openbmc@lists.ozlabs.org, joabreu@synopsys.com, pabeni@redhat.com,
 devicetree@vger.kernel.org, conor+dt@kernel.org, richardcochran@gmail.com,
 peppe.cavallaro@st.com, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch,
 mcoquelin.stm32@gmail.com, krzk+dt@kernel.org, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH net-next v7 3/3] net: stmmac:
 dwmac-nuvoton: Add dwmac glue for Nuvoton MA35 family
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

RGVhciBKYWt1YiwKClRoYW5rIHlvdSBmb3IgdGhlIHJlcGx5LgoKSmFrdWIgS2ljaW5za2kg5pa8
IDEvMTUvMjAyNSA3OjMzIEFNIOWvq+mBkzoKPiBPbiBNb24sIDEzIEphbiAyMDI1IDEzOjU0OjM0
ICswODAwIEpvZXkgTHUgd3JvdGU6Cj4+ICsJcmVnbWFwX3dyaXRlKGJzcF9wcml2LT5yZWdtYXAs
Cj4+ICsJCSAgICAgbWFjaWQgPT0gMCA/IE5WVF9SRUdfU1lTX0dNQUMwTUlTQ1IgOiBOVlRfUkVH
X1NZU19HTUFDMU1JU0NSLCByZWcpOwo+IFRoaXMgaXMgYSBwcmV0dHkgbG9uZyBsaW5lIGFuZCB5
b3UgZG8gaXQgdHdpY2UsIHNvIHNhdmUgdGhlIGFkZHJlc3MKPiB0byBhIHRlbXAgdmFyaWFibGUs
IHBscwpHb3QgaXQhCj4+ICtNT0RVTEVfTElDRU5TRSgiR1BMIHYyIik7Cj4gY2hlY2twYXRjaCBp
bnNpc3RzOgo+Cj4gV0FSTklORzogUHJlZmVyICJHUEwiIG92ZXIgIkdQTCB2MiIgLSBzZWUgY29t
bWl0IGJmN2ZiZWVhZTZkYiAoIm1vZHVsZTogQ3VyZSB0aGUgTU9EVUxFX0xJQ0VOU0UgIkdQTCIg
dnMuICJHUEwgdjIiIGJvZ29zaXR5IikKClVuZGVyc3Rvb2QuIEkgd2lsbCBmaXggdGhlIHdhcm5p
bmcuCgpCUiwKCkpvZXkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
