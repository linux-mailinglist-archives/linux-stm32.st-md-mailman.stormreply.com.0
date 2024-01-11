Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DF0F82B060
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Jan 2024 15:14:06 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AB96AC6DD73;
	Thu, 11 Jan 2024 14:14:05 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com
 [209.85.128.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DF8D3C6B452
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Jan 2024 14:14:04 +0000 (UTC)
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-5ec7a5a4b34so59221537b3.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Jan 2024 06:14:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704982444; x=1705587244;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eQY9zGPEtO1QF2ljEldwAIEPyis1kLrWBuBbYuv032U=;
 b=qFyKEsz9EeLh1zOAMXAsucCpVyaxRJOpfmrQPNWAcxy82t2wNGVK8pFw13a8544aMM
 WU+T9CoO5ZNuHK9lU2whsIpebcChJexrXoxws8Pu7AuxfgeZMC2Oibm9j6EoCFApa+Jj
 9y9iTydyzbWDWsXelct4z7ehK3aWioYVzupJ+zgiR1PBUJe32wocZ+uSQtW7K8ZRObcU
 YxS4pcY3BxWFTwGXzv0+BH65by+ErH+HHZqyYf8b17yjR5WdEUvBNumzXSOypC/0D2XN
 fsLbmpUKYK3uR6kan5xjCX+d4YjFmI6uEoLr5sHakogEThjycLlsuSEHqHPDtlxQq4rm
 11Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704982444; x=1705587244;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eQY9zGPEtO1QF2ljEldwAIEPyis1kLrWBuBbYuv032U=;
 b=Bvl57czharWXmKH2k5bFxzrZZMvc5kFTweuUvDDg1eoSOMOca0BkLHxWEg/30aUbn8
 9by/jjaQBWu7Ggm/UXCGV6jaxoELSHvoJfaH1SR1Arry2wBTHzAL/sAX9+FVjxdpWGFd
 RkLxrHfMRxWy7jhhWOfYlGKBoDCwpSprZd2bqCl/ErnT1mDtzEAQeaAW2gizev1OzGBz
 B0xuqmzqXjEsGQ/bHBcPJZDuFfRhIsG3WGox+Q457lUOK2g4NT4+GSQRDFO9SIfwn8/S
 ZB3IG+gYXCjQ4puISWoKAYrl5zrQaPCD5f6244ZFgSaKuN5jPRA/3CFUgubX9sLphgxA
 rsNw==
X-Gm-Message-State: AOJu0YzAD0GxchxHaxHZFaENqqCQYLr1MAVYQqYLvJCZix4AYI5Mwsdv
 LFpU4K5dNVdkEwUaDJbNsdGVZEWPNHOULyZWC5c2Ys7G9LosJA==
X-Google-Smtp-Source: AGHT+IHbjb9WBJNb7mg6Cf0OKedEBHnlOsptBA2sTAMDxR21dqAolwUjCQy13ZKdOjJSxqEUmo0hzT35aqUzxhvj6QM=
X-Received: by 2002:a81:c60b:0:b0:5d8:5727:80fb with SMTP id
 l11-20020a81c60b000000b005d8572780fbmr537921ywi.84.1704982443677; Thu, 11 Jan
 2024 06:14:03 -0800 (PST)
MIME-Version: 1.0
References: <20240109-prevent_dsa_tags-v4-1-f888771fa2f6@bootlin.com>
In-Reply-To: <20240109-prevent_dsa_tags-v4-1-f888771fa2f6@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 11 Jan 2024 15:13:52 +0100
Message-ID: <CACRpkdYPFBugiM5-TsB0SJ=zE4yvjqCX0XLXE5axxeTp0wVcRQ@mail.gmail.com>
To: Romain Gantois <romain.gantois@bootlin.com>
Cc: Vladimir Oltean <olteanv@gmail.com>,
 Richard Tresidder <rtresidd@electromag.com.au>,
 Pascal EBERHARD <pascal.eberhard@se.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Andrew Lunn <andrew@lunn.ch>,
 netdev@vger.kernel.org, Sylvain Girard <sylvain.girard@se.com>,
 linux-stm32@st-md-mailman.stormreply.com, stable@vger.kernel.org,
 Vladimir Oltean <vladimir.oltean@nxp.com>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4] net: stmmac: Prevent DSA tags from
	breaking COE
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

T24gVHVlLCBKYW4gOSwgMjAyNCBhdCAzOjQy4oCvUE0gUm9tYWluIEdhbnRvaXMKPHJvbWFpbi5n
YW50b2lzQGJvb3RsaW4uY29tPiB3cm90ZToKCj4gU29tZSBEU0EgdGFnZ2luZyBwcm90b2NvbHMg
Y2hhbmdlIHRoZSBFdGhlclR5cGUgZmllbGQgaW4gdGhlIE1BQyBoZWFkZXIKPiBlLmcuICBEU0Ff
VEFHX1BST1RPXyhEU0EvRURTQS9CUkNNL01USy9SVEw0Q19BL1NKQTExMDUpLiBPbiBUWCB0aGVz
ZSB0YWdnZWQKPiBmcmFtZXMgYXJlIGlnbm9yZWQgYnkgdGhlIGNoZWNrc3VtIG9mZmxvYWQgZW5n
aW5lIGFuZCBJUCBoZWFkZXIgY2hlY2tlciBvZgo+IHNvbWUgc3RtbWFjIGNvcmVzLgo+Cj4gT24g
UlgsIHRoZSBzdG1tYWMgZHJpdmVyIHdyb25nbHkgYXNzdW1lcyB0aGF0IGNoZWNrc3VtcyBoYXZl
IGJlZW4gY29tcHV0ZWQKPiBmb3IgdGhlc2UgdGFnZ2VkIHBhY2tldHMsIGFuZCBzZXRzIENIRUNL
U1VNX1VOTkVDRVNTQVJZLgo+Cj4gQWRkIGFuIGFkZGl0aW9uYWwgY2hlY2sgaW4gdGhlIHN0bW1h
YyBUWCBhbmQgUlggaG90cGF0aHMgc28gdGhhdCBDT0UgaXMKPiBkZWFjdGl2YXRlZCBmb3IgcGFj
a2V0cyB3aXRoIGV0aGVydHlwZXMgdGhhdCB3aWxsIG5vdCB0cmlnZ2VyIHRoZSBDT0UgYW5kCj4g
SVAgaGVhZGVyIGNoZWNrcy4KPgo+IEZpeGVzOiA2YjJjNmU0YTkzOGYgKCJuZXQ6IHN0bW1hYzog
cHJvcGFnYXRlIGZlYXR1cmUgZmxhZ3MgdG8gdmxhbiIpCj4gQ2M6ICA8c3RhYmxlQHZnZXIua2Vy
bmVsLm9yZz4KPiBSZXBvcnRlZC1ieTogUmljaGFyZCBUcmVzaWRkZXIgPHJ0cmVzaWRkQGVsZWN0
cm9tYWcuY29tLmF1Pgo+IExpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL25ldGRldi9lNWM2
Yzc1Zi0yZGZhLTRlNTAtYTFmYi02YmY0Y2RiNjE3YzJAZWxlY3Ryb21hZy5jb20uYXUvCj4gUmVw
b3J0ZWQtYnk6IFJvbWFpbiBHYW50b2lzIDxyb21haW4uZ2FudG9pc0Bib290bGluLmNvbT4KPiBM
aW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9uZXRkZXYvYzU3MjgzZWQtNmI5Yi1iMGU2LWVl
MTItNTY1NWMxYzU0NDk1QGJvb3RsaW4uY29tLwo+IFJldmlld2VkLWJ5OiBWbGFkaW1pciBPbHRl
YW4gPHZsYWRpbWlyLm9sdGVhbkBueHAuY29tPgo+IFNpZ25lZC1vZmYtYnk6IFJvbWFpbiBHYW50
b2lzIDxyb21haW4uZ2FudG9pc0Bib290bGluLmNvbT4KClJldmlld2VkLWJ5OiBMaW51cyBXYWxs
ZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+CgpZb3VycywKTGludXMgV2FsbGVpagpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBt
YWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRw
czovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1z
dG0zMgo=
