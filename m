Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D21CED3BCF2
	for <lists+linux-stm32@lfdr.de>; Tue, 20 Jan 2026 02:34:52 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7BC48C36B3C;
	Tue, 20 Jan 2026 01:34:52 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6A38DC36B2A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Jan 2026 01:34:50 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id
 98e67ed59e1d1-352c5bd2769so73951a91.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Jan 2026 17:34:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768872889; x=1769477689;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RrH9sDwa3QtPj5gSU1d7cy8zDFpQYEGB5vrm976c5QE=;
 b=CeqXmLtNoF1//ZPGtm7BBjGoZYATX89Fx02CX2K7MwJ661btegLP12DminfybYpeeo
 eMraQewRniA/oBIBMst8TXW+ZrpyXg3aFD13fHFMYs6ZDfu9KJA3ss0rwBQxgfNZOXuG
 JYPH4Fno6mzyDtHKvL7zEivh7Yro7WsV1U7dxxI2PUYU/8nD+qAUcPI8Dvda5dT38olC
 q5vAVbKtfpRzAT4MOc2ud0A2HXF6ub3/ew0EOywh/kFv08x1nPckqn0XRG18plIgicbT
 7L3IyLC5tk5pJDWX0to+T8zpVPGsjcKH5y1LTMqGQbxcYDRXtJpbOo9aSMfDrtxczgpg
 mcGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768872889; x=1769477689;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RrH9sDwa3QtPj5gSU1d7cy8zDFpQYEGB5vrm976c5QE=;
 b=su9MD1TCoRhJG/LhgxjtiIvh15cYkYnJWMU1vvYnlFPYxdLjiYt0FZLS+dpIm3Jy9v
 88/Ie++D3UF09g0wV6PGx+z+bOxoA2G+Lu6MYLt0BH+8qn6QRNBSNl6TdE3fmaWDQYnR
 okiCDRqz03sZdfX5VMgxy80DfeVHWJzs/y21+t+ajla54hf2/TdVtjMXFSYMLul1fh4O
 Z0K8wQH1JyjimaKEOhcdFSXLB9HeAtJcw1jovEma3/Xx2mCsLQlcVTXcRG2JqLYwgf1B
 uOi5NjuICvUA+nbI60hucCNmXmEYh5XCFeOTROzhSGOEVwcN/dR8FjuPzooWtrgbej99
 c9Iw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWu7jCy5Ll6KbpMTc58kuBWLEmsZCeAyhKzpwWS/B/goXELtuv+KBx0hqJ31CtnQOxBewvRDOQ/Bo3aiQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwULUAp9ry7U6XEgr2UCRLSCFrXa+UjCO9sbmyEJsZcKMXDCVjK
 nivOmgeFyY6II58Q6XuI3IAHeY5qNwPqaxcALYWRSuWJaxGfzYWg4zp1
X-Gm-Gg: AZuq6aJFwqtVoRh0ssEjooNt5w/AhuJfPbI8Gbk7e81AZG46B1wGhSFpOD+k0/W6E5E
 hnZEn12UE/3N2gKauBopHanHaDMF4wW6bGNVWPZDCnn+MNmLjt7U8RC4Nse8g2JM8x7ikiJfHmj
 sTNiGCsjB+/5osrc1pEA8Ht+yWPjp7yEMDpJ9hoawmdxRgyE1L+1g6XLiEcBI/D3o5u5DDobuwo
 VkxRQOpAjP7/fH/AUxhS65bepA75mH/u0SJqSwyHabYTnZD3Ns+PVjTdbvucFqkrkPTJwzk/749
 E8Pegki89021kTG/aioLyVic9NCCBJXUbP30sCxZHPefx7JXTCWk63NWAzlD6dmcKXo+dsCDgdP
 xy1OZDYqqz3BqePYWYAOoxD+CD2GJhL6qp9zM2kpR1e5Or58Jdm4TMRdasJyGMOVuTBmUV3kqdN
 wXU5IWRJ2c/0a7A9hP58f2e3ris9dC4GYV4NTcUdKDMAl48ckGRywedrhcBXTcZ3N2+nHLhoEzM
 kY=
X-Received: by 2002:a17:90a:c110:b0:336:9dcf:ed14 with SMTP id
 98e67ed59e1d1-352c407a272mr335012a91.23.1768872888766; 
 Mon, 19 Jan 2026 17:34:48 -0800 (PST)
Received: from [192.168.0.102] (60-250-196-139.hinet-ip.hinet.net.
 [60.250.196.139]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-352677ca9acsm12931529a91.1.2026.01.19.17.34.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Jan 2026 17:34:48 -0800 (PST)
Message-ID: <a5cb949f-34c1-470c-bd04-0b35c249455f@gmail.com>
Date: Tue, 20 Jan 2026 09:34:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Andrew Lunn <andrew@lunn.ch>
References: <20260119073342.3132502-1-a0987203069@gmail.com>
 <20260119073342.3132502-3-a0987203069@gmail.com>
 <04df4909-4fdb-4046-917f-2f2e47832c62@lunn.ch>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <04df4909-4fdb-4046-917f-2f2e47832c62@lunn.ch>
Cc: ychuang3@nuvoton.com, edumazet@google.com, schung@nuvoton.com,
 yclu4@nuvoton.com, linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org,
 openbmc@lists.ozlabs.org, joabreu@synopsys.com, kuba@kernel.org,
 pabeni@redhat.com, devicetree@vger.kernel.org, conor+dt@kernel.org,
 richardcochran@gmail.com, peppe.cavallaro@st.com,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch, mcoquelin.stm32@gmail.com,
 krzk+dt@kernel.org, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH net-next v8 2/3] arm64: dts: nuvoton: Add
	Ethernet nodes
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

RGVhciBBbmRyZXcsCgpUaGFua3MgZm9yIHRoZSBjbGFyaWZpY2F0aW9uLgoKSW4gb3VyIGRlc2ln
biwgdGhlIEV0aGVybmV0IFBIWXMgYXJlIGxvY2F0ZWQgb24gdGhlIGJhc2UgYm9hcmRzLCBub3Qg
b24gCnRoZSBNQTM1RDEgU09NLgoKVGhlIFNPTSBiYXNlIGJvYXJkIHJvdXRlcyB0d28gUkdNSUkg
aW50ZXJmYWNlcyBmcm9tIHRoZSBTT00gdG8gdHdvIApleHRlcm5hbCBQSFlzIG9uIHRoZSBjYXJy
aWVyIGJvYXJkLgoKT24gdGhlIE1BMzVEMSBJb1QgYm9hcmQsIHRoZXJlIGlzIG5vIHNlcGFyYXRl
IFNPTSBhbmQgY2FycmllciBib2FyZCAtIGl0IAppcyBhIHNpbmdsZSBpbnRlZ3JhdGVkIGJvYXJk
LgoKSSB3aWxsIHVwZGF0ZSB0aGUgRFRTIGFjY29yZGluZ2x5IHNvIHRoYXQgbm8gUEhZIG5vZGVz
IGFwcGVhciBpbiAuZHRzaS4KClRoYW5rcyEKCkJlc3QgcmVnYXJkcywKCkpvZXkKCkFuZHJldyBM
dW5uIOaWvCAxLzE5LzIwMjYgMTE6MjIgUE0g5a+r6YGTOgo+IE9uIE1vbiwgSmFuIDE5LCAyMDI2
IGF0IDAzOjMzOjQwUE0gKzA4MDAsIEpvZXkgTHUgd3JvdGU6Cj4+IEFkZCBHTUFDIG5vZGVzIGZv
ciBvdXIgTUEzNUQxIGRldmVsb3BtZW50IGJvYXJkczoKPj4gdHdvIFJHTUlJIGludGVyZmFjZXMg
Zm9yIFNPTSBib2FyZCwgYW5kIG9uZSBSR01JSQo+PiBhbmQgb25lIFJNSUkgaW50ZXJmYWNlIGZv
ciBJb1QgYm9hcmQuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEpvZXkgTHUgPGEwOTg3MjAzMDY5QGdt
YWlsLmNvbT4KPj4gLS0tCj4+ICAgLi4uL2Jvb3QvZHRzL251dm90b24vbWEzNWQxLWlvdC01MTJt
LmR0cyAgICAgIHwgMTIgKysrKysKPj4gICAuLi4vYm9vdC9kdHMvbnV2b3Rvbi9tYTM1ZDEtc29t
LTI1Nm0uZHRzICAgICAgfCAxMCArKysrCj4+ICAgYXJjaC9hcm02NC9ib290L2R0cy9udXZvdG9u
L21hMzVkMS5kdHNpICAgICAgIHwgNTQgKysrKysrKysrKysrKysrKysrKwo+IEknbSBzb21ld2hh
dCBjb25mdXNlZCB3aXRoIHlvdXIgbmFtaW5nIGhlcmUuCj4KPiBBIFNvTSBnZW5lcmFsbHkgbmVl
ZHMgYSBjYXJyaWVyIGJvYXJkLiBTbyB0aGUgU29NIGlzIGRlc2NyaWJlZCBhcyBhCj4gLmR0c2kg
ZmlsZSwgd2hpY2ggdGhlIGNhcnJpZXIgYm9hcmQgLmR0cyBmaWxlIGNhbiB0aGVuIGluY2x1ZGUu
Cj4KPiBXaGVyZSBhcmUgdGhlIFBIWXM/IFNvbWV0aW1lcyB0aGUgUEhZcyBhcmUgb24gdGhlIFNv
TSwgc29tZXRpbWVzIHRoZXkKPiBhcmUgb24gdGhlIGNhcnJpZXIgYm9hcmQuIElmIHRoZXkgYXJl
IG5vdCBhY3R1YWxseSBvbiB0aGUgU29NLCB0aGUKPiBQSFlzIHNob3VsZCBub3QgYmUgbGlzdGVk
IGFzIHBhcnQgb2YgdGhlIFNvTS4KPgo+ICAgICAgIEFuZHJldwpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGlu
dXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
