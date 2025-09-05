Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CBA7B457B9
	for <lists+linux-stm32@lfdr.de>; Fri,  5 Sep 2025 14:26:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DD384C35E2E;
	Fri,  5 Sep 2025 12:26:09 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1BE04C35E2B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Sep 2025 12:26:07 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-3dcce361897so1425171f8f.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 05 Sep 2025 05:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757075167; x=1757679967;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pB7S2EtUpEWZ+xx8MbHke+UE3WWH8zMsnHAoeyZ1ARQ=;
 b=VKVWQe4cH8b3Olr2hset84wUw5gLX5jwX8LUVFcjVMYFTNBKaUCbQ5JwCErbcsu0SD
 kFu9zoyhw3y1Ovn8ittX2LtmdxfGD2xuxhFaNPs+zlbD/hqKpnUzRLKtg9nTTJ7f6W2p
 CLHELCxbidrJRO1EwFeIm+QcNt9W6vipHtkZZiogy/O8AOte5s1gk3u7Oj2FnfeHcE2A
 H6c4o0pFMx+oUp0yPvfA2Kip0LkkJAMvBuEinUJFmjd+Fx2K+0R0xJg3UYy/Hr1REXcY
 imPDG7G/xMbr3dDXb+/yrOiqYKEA6vCI+dz/HzPM0JSR1v6igXBh9lHB84dChbsFfGNq
 bfDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757075167; x=1757679967;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pB7S2EtUpEWZ+xx8MbHke+UE3WWH8zMsnHAoeyZ1ARQ=;
 b=weJQx/ZAzdzgem50eN3O1hq8dPiD/sRF6lNKeYHDOl7N9yrcPMI2526KW1Co0JpuAk
 dteBDebk6jbu7LXfGhi66hFxbjdgeSChUkPCNikEfYWPo8B8ifyyASA0N99gOGCJHLyN
 KAwAKdiKZKWb/w/UUATKVrDGvxFqJvA+d5tb4w/tFEwUsBs5onXdEEwlAn1ft1PlBJhp
 U31cVsnVakoWjKaSI6wLAFDLndEQapELfA8tstMdZHz5vC7OtnFcLq86zr5VCbZ63IT5
 iR1Jt9HGLufqOgcitSSyIW6YMzVCfKjsdo25BADa9xHouHuTU8sQImTO54CqSIwq/4fY
 d7LQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWH1sGLK9zOfRaeqXDick/TxnOVbBxTTUJkfeuqtLTklWw9SZ8XIkKY1i0M4Pu4uKh88wQfZ84YyAs8Og==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Ywjf8wFdf62XG6Trb36gL7VICKMm5h5ZjnwxoIML5Y1w3/S2UP1
 385SMqXFEl8eP5IpX0UgGjNcm+fpO6DzROl+sP0pXBy2Qz+PCwPL/Mr3TiLRzFTcusEqHvgUUdv
 g7QK3Qtv+7mShTzRLey2WHCg1HQdv47g=
X-Gm-Gg: ASbGncvr2lFOcp7jIsYzlsMrbaJ+Hzu5zAv6cZLF/Ze/e8H4n/sjs7silI17XV0UQJb
 4sLCo3VGyoHACDVS/Jv3NIfyp9FO4VMf1sl4zeJ5e4iLLHp5VC1B0/jEBiyk+jB0UBzHz3iAINv
 nTn7muwmKCDhPFnRcIQq9GGlpHT3CumNiCzHYJHGF6FFi6N68XE8N0NcoJri0rLZMgubkZjXgvJ
 uIMASCQo12dv73vecAQFMHNe0Sku3xenCgQmZvjf1QFGoLxb8o=
X-Google-Smtp-Source: AGHT+IEu9qio4sf+nY+2VNCn7hdbR1T28beFwadrX0mqCszsq8S28vScNVJA04OVTxp/easlutUPryntBuwX/WyqQQs=
X-Received: by 2002:a05:6000:3111:b0:3dd:6101:4efb with SMTP id
 ffacd0b85a97d-3dd61015026mr8949421f8f.11.1757075167278; Fri, 05 Sep 2025
 05:26:07 -0700 (PDT)
MIME-Version: 1.0
References: <20250904203949.292066-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250904203949.292066-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <aLn7XVnWmHv1Bfe2@shell.armlinux.org.uk>
 <CA+V-a8umpEzwO5XnFVNB-TkDtEh9K48OKqaDE_SwzGfXk+9qEA@mail.gmail.com>
 <aLoFIoqT2A2RmrfR@shell.armlinux.org.uk>
In-Reply-To: <aLoFIoqT2A2RmrfR@shell.armlinux.org.uk>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 5 Sep 2025 13:25:41 +0100
X-Gm-Features: Ac12FXz8sW_rykJvGGWdLFiauLq7H7TD8fJdnQu_wpMQYelqr_sg2nzux9BatIs
Message-ID: <CA+V-a8ssRu=1aX3VkgoRQioewU-VRs-xT6Z=Qp-RknuwJ0o2GQ@mail.gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Eric Dumazet <edumazet@google.com>, linux-stm32@st-md-mailman.stormreply.com,
 Rob Herring <robh@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, Philipp Zabel <p.zabel@pengutronix.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next v2 2/3] net: stmmac:
 dwmac-renesas-gbeth: Use OF data for configuration
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

SGkgUnVzc2VsbCwKCk9uIFRodSwgU2VwIDQsIDIwMjUgYXQgMTA6MzHigK9QTSBSdXNzZWxsIEtp
bmcgKE9yYWNsZSkKPGxpbnV4QGFybWxpbnV4Lm9yZy51az4gd3JvdGU6Cj4KPiBPbiBUaHUsIFNl
cCAwNCwgMjAyNSBhdCAxMDoxMDozMlBNICswMTAwLCBMYWQsIFByYWJoYWthciB3cm90ZToKPiA+
IEhpIFJ1c3NlbGwsCj4gPgo+ID4gT24gVGh1LCBTZXAgNCwgMjAyNSBhdCA5OjQ54oCvUE0gUnVz
c2VsbCBLaW5nIChPcmFjbGUpCj4gPiA8bGludXhAYXJtbGludXgub3JnLnVrPiB3cm90ZToKPiA+
ID4KPiA+ID4gT24gVGh1LCBTZXAgMDQsIDIwMjUgYXQgMDk6Mzk6NDhQTSArMDEwMCwgUHJhYmhh
a2FyIHdyb3RlOgo+ID4gPiA+ICAgICAgIHBsYXRfZGF0LT5pbml0ID0gcmVuZXNhc19nYmV0aF9p
bml0Owo+ID4gPiA+ICAgICAgIHBsYXRfZGF0LT5leGl0ID0gcmVuZXNhc19nYmV0aF9leGl0Owo+
ID4gPiA+IC0gICAgIHBsYXRfZGF0LT5mbGFncyB8PSBTVE1NQUNfRkxBR19IV1RTVEFNUF9DT1JS
RUNUX0xBVEVOQ1kgfAo+ID4gPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICBTVE1NQUNfRkxB
R19FTl9UWF9MUElfQ0xLX1BIWV9DQVAgfAo+ID4gPiA+IC0gICAgICAgICAgICAgICAgICAgICAg
ICBTVE1NQUNfRkxBR19TUEhfRElTQUJMRTsKPiA+ID4gPiArICAgICBwbGF0X2RhdC0+ZmxhZ3Mg
fD0gZ2JldGgtPm9mX2RhdGEtPnN0bW1hY19mbGFnczsKPiA+ID4KPiA+ID4gWW91IGluY2x1ZGUg
dGhlIGZpcnN0IHR3byBmbGFncyBpbiB5b3VyIG5ldyBkZXZpY2UuIEkgd291bGQgbGlrZSB0byBz
ZWUKPiA+ID4gYXQgbGVhc3QgU1RNTUFDX0ZMQUdfRU5fVFhfTFBJX0NMS19QSFlfQ0FQIGFsd2F5
cyBiZWluZyBzZXQuIFRoZSBvbmx5Cj4gPiA+IHJlYXNvbiB3ZSBoYXZlIHRoZSBTVE1NQUNfRkxB
R19FTl9UWF9MUElfQ0xLX1BIWV9DQVAgZmxhZyBpcyB0byBhdm9pZAo+ID4gPiBjaGFuZ2luZyBl
eGlzdGluZyBiZWhhdmlvdXIgYW5kIGNhdXNpbmcgcmVncmVzc2lvbnMuIE5ldyBzdHVmZiBzaG91
bGQKPiA+ID4gYWx3YXlzIHNldCB0aGlzLgo+ID4gPgo+ID4gTWUgY29uZnVzZWQsIFNUTU1BQ19G
TEFHX0VOX1RYX0xQSV9DTEtfUEhZX0NBUCBmbGFnIGlzIHNldCBpbiB0aGUgbmV3Cj4gPiBkZXZp
Y2UgWzBdLiBUaGUgcmVhc29uIFNUTU1BQ19GTEFHX1NQSF9ESVNBQkxFIGZsYWcgYmVpbmcgZHJv
cHBlZCBpbgo+ID4gdGhlIG5ldyBkZXZpY2UgaXMgU1BIRU49MSBpbiBNQUMgSFcgZmVhdHVyZSBy
ZWcgZm9yIHRoZSBuZXcgZGV2aWNlLgo+Cj4gV2hhdCBJJ20gc2F5aW5nIGlzIEknZCBsaWtlIHRv
IHNlZToKPgo+ICAgICAgICAgcGxhdF9kYXQtPmZsYWdzIHw9IFNUTU1BQ19GTEFHX0VOX1RYX0xQ
SV9DTEtfUEhZX0NBUCB8Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgZ2JldGgtPm9mX2Rh
dGEtPnN0bW1hY19mbGFnczsKPgo+IGlvdywgaXQgaXMgc2V0IHVuY29uZGl0aW9uYWxseSwgZXZl
biBpZiBmb3Jnb3R0ZW4gaW4gYSBmdXR1cmUgcGF0Y2guCj4KQWggZ290IHlvdS4gVGhhbmsgeW91
IGZvciB0aGUgY2xhcmlmaWNhdGlvbi4KCkNoZWVycywKUHJhYmhha2FyCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlz
dApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
