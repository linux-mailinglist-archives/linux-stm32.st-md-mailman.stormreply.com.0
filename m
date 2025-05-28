Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 41EC6AC729B
	for <lists+linux-stm32@lfdr.de>; Wed, 28 May 2025 23:14:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E79C4C36B3E;
	Wed, 28 May 2025 21:14:30 +0000 (UTC)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com
 [209.85.217.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 32A9EC36B3D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 May 2025 21:14:29 +0000 (UTC)
Received: by mail-vs1-f47.google.com with SMTP id
 ada2fe7eead31-4e45ebe7ac1so62250137.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 May 2025 14:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748466868; x=1749071668;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bik8tiy9zD4tncn3V/spfXhSHei4QkySdXosKgPMaGo=;
 b=As9qqQcNkeeurT841f41720VdjFh1kZ5VHhV9HSQs/R2+XUYFXpa3BXVEu3V4vrg0g
 V50S58Zx/xmRH9Bfgi1BwQXQZKoNlA+E6qkOWCHAcar/Pdv5yJdXj6oBTX/cDr+aqHFE
 QBEs2fxfB8mqIOPHqdQUuUBLumWEwvtSpJ4St829CCvjLGNay6wbBw1jFnhEFV29pq8u
 TP27EAV12mNfmIQhKazqRoVpB6ep5Sc0BF051dEBu4MCZDGHE47kJXkgfnkrMERbkCy9
 Rbgr1ftYt0m7hMyIu5Px63oU8NYs3cnGAfO/JC/BDneJS+UNNGYXmy/VQjtYVf74cBx/
 BKfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748466868; x=1749071668;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bik8tiy9zD4tncn3V/spfXhSHei4QkySdXosKgPMaGo=;
 b=BnmEaNZhSiuCd34BuzTbEVNB//MgaU2fgL2Dt6N07Vbd8GXtFtjYmvfWk0qdZ58y1+
 NcmOGGe0YP+oEiesBK8Um/UeF7gr9vbpvOnG7IBoSeCLSPeUTt1VAqnpWW2wVkj/czDO
 w5pWdwvf+UeA6cts2oDrDt3ZeUd/Kxnh8H6OTVVbJVktVZsJ0oF8AuUmpbNvQVPXO2md
 ED9hSI9YtItLqq6h0NMIi/ZDRyxTgoVnlE2Bxd2gGS445P/gcuIPahXINwc6eTbUckto
 UwtvYR4jBMifztG07VJ7Rz8SBXSWlF5WPN4ihpOm8Rmf/EYj6EURXIcdZmGYfH46Liz8
 CF3A==
X-Forwarded-Encrypted: i=1;
 AJvYcCX0970df4247N/8gbtVYOGG2IX3TqoRypHDAzJPIB3pQRXWTWDfosa8NsDagMuxAYS6e8VwSDE702vDIw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxtxJDsdcecu/ZDIgf3vXaD+fsriDOqWwTcWavytKrEHVpuZFGX
 UQDnDHiak4adIB34BcimmJG/kRRDpTpNbE4E9P1x9stn8UcIeM6sjvQxX6M9WkqIvOea2SoQZ4T
 UId+1WzmnB/PpGrj1JTcq7gNld3hXQYc=
X-Gm-Gg: ASbGncsKUxWKSAPliu1YZd/lITDOuuEWPSbW+oq6ci7b5zrBorwhioxl0nth9vnW6v8
 SuWbxEuom4fk4p9Jyjw9pJQTl/z2fME91Nv2SjwCmpyruk4QkSdAiFG4V5r/hirgwvcbsV7ZlFp
 XtUV5BBU+GUWdUfOeB8GEFp5x67B27jgcjKg==
X-Google-Smtp-Source: AGHT+IGGLLvtEb730nnh7rC673oR16aeQY2nH92ZW4fGCX/YiQ4QwWrxJP/i3AUVjXlzBuIQT/Ux8cWPw7wSCO4tioo=
X-Received: by 2002:a05:6102:1612:b0:4e5:958d:4962 with SMTP id
 ada2fe7eead31-4e5958d5d03mr7448988137.2.1748466867876; Wed, 28 May 2025
 14:14:27 -0700 (PDT)
MIME-Version: 1.0
References: <CADvTj4oVj-38ohw7Na9rkXLTGEEFkLv=4S40GPvHM5eZnN7KyA@mail.gmail.com>
 <aDbA5l5iXNntTN6n@shell.armlinux.org.uk>
 <CADvTj4qP_enKCG-xpNG44ddMOJj42c+yiuMjV_N9LPJPMJqyOg@mail.gmail.com>
 <f915a0ca-35c9-4a95-8274-8215a9a3e8f5@lunn.ch>
 <CAGb2v66PEA4OJxs2rHrYFAxx8bw4zab7TUXQr+DM-+ERBO-UyQ@mail.gmail.com>
 <CADvTj4qyRRCSnvvYHLvTq73P0YOjqZ=Z7kyjPMm206ezMePTpQ@mail.gmail.com>
 <aDdXRPD2NpiZMsfZ@shell.armlinux.org.uk>
 <CADvTj4pKsAYsm6pm0sgZgQ+AxriXH5_DLmF30g8rFd0FewGG6w@mail.gmail.com>
 <8306dac8-3a0e-4e79-938a-10e9ee38e325@lunn.ch>
 <CADvTj4rWvEaFyOm2HdNonASE4y1qoPoNgP_9n_ZbLCqAo1gGYw@mail.gmail.com>
 <1e6e4a44-9d2b-4af4-8635-150ccc410c22@lunn.ch>
In-Reply-To: <1e6e4a44-9d2b-4af4-8635-150ccc410c22@lunn.ch>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 28 May 2025 15:14:16 -0600
X-Gm-Features: AX0GCFtJbKcSZrV6aI_DEhodkWvBg_0kUSxJMObTitKRlUNU-S1IGzUWOHTLoqc
Message-ID: <CADvTj4r1VvjiK4tj3tiHYVJtLDWtMSJ3GFQgYyteTnLGsQQ2Eg@mail.gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Furong Xu <0x1207@gmail.com>, linux-kernel@vger.kernel.org,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 "Russell King \(Oracle\)" <linux@armlinux.org.uk>, linux-sunxi@lists.linux.dev,
 Andrew Lunn <andrew+netdev@lunn.ch>, wens@csie.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 1/3] net: stmmac: allow drivers to
 explicitly select PHY device
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

T24gV2VkLCBNYXkgMjgsIDIwMjUgYXQgMzowNeKAr1BNIEFuZHJldyBMdW5uIDxhbmRyZXdAbHVu
bi5jaD4gd3JvdGU6Cj4KPiBPbiBXZWQsIE1heSAyOCwgMjAyNSBhdCAwMTo0NTo0MFBNIC0wNjAw
LCBKYW1lcyBIaWxsaWFyZCB3cm90ZToKPiA+IE9uIFdlZCwgTWF5IDI4LCAyMDI1IGF0IDE6Mjfi
gK9QTSBBbmRyZXcgTHVubiA8YW5kcmV3QGx1bm4uY2g+IHdyb3RlOgo+ID4gPgo+ID4gPiA+IEkg
dGhpbmsgYSBsb3Qgb2YgZXRoZXJuZXQgZHJpdmVycyB1c2UgcGh5X2ZpbmRfZmlyc3QoKSBmb3Ig
cGh5IHNjYW5uaW5nCj4gPiA+ID4gYXMgd2VsbCBzbyBpdCdzIG5vdCBsaW1pdGVkIHRvIGp1c3Qg
c3RtbWFjIEFGQUlVLgo+ID4gPgo+ID4gPiBZb3UgbmVlZCB0byBkaWZmZXJlbnRpYXRlIGJ5IHRp
bWUuIEl0IGhhcyBiZWNvbWUgYSBsb3QgbGVzcyB1c2VkIGluCj4gPiA+IHRoZSBsYXN0IGRlY2Fk
ZS4gRFQgZGVzY3JpYmVzIHRoZSBQSFksIHNvIHRoZXJlIGlzIG5vIG5lZWQgdG8gaHVudAo+ID4g
PiBhcm91bmQgZm9yIGl0LiBUaGUgb25seSByZWFsIHVzZSBjYXNlIG5vdyBhIGRheXMgaXMgVVNC
IGRvbmdsZXMsIHdoaWNoCj4gPiA+IGRvbid0IGhhdmUgRFQsIGFuZCBtYXliZSBQQ0llIGRldmlj
ZXMgd2l0aG91dCBBQ1BJIHN1cHBvcnQuCj4gPgo+ID4gSSBtZWFuLCBoYXJkd2FyZSBwcm9iaW5n
IGZlYXR1cmVzIGZvciB0aGlzIHNvcnQgb2YgdXNlIGNhc2UgaGF2ZSBiZWVuCj4gPiBnZXR0aW5n
IGFkZGVkIG91dHNpZGUgdGhlIG5ldHdvcmsgc3Vic3lzdGVtIHNvIEknbSBub3Qgc3VyZSB3aGF0
IHRoZQo+ID4gaXNzdWUgd2l0aCB0aGlzIGlzIGFzIHRob3NlIHVzZSBjYXNlcyBkb24ndCBhcHBl
YXIgdG8gYmUgbWVhbmluZ2Z1bGx5Cj4gPiBkaWZmZXJlbnQuCj4gPgo+ID4gPiBJIHN1Z2dlc3Qg
eW91IGdpdmUgdXAgcHVzaGluZyB0aGlzLiBZb3UgaGF2ZSB0d28gTWFpbnRhaW5lcnMgc2F5aW5n
IG5vCj4gPiA+IHRvIHRoaXMsIHNvIGl0IGlzIHZlcnkgdW5saWtlbHkgeW91IGFyZSBnb2luZyB0
byBzdWNjZWVkLgo+ID4KPiA+IFNvIHdoYXQgc2hvdWxkIEkgYmUgZG9pbmcgaW5zdGVhZD8KPgo+
IERlc2NyaWJlIHRoZSBvbmUgUEhZIHdoaWNoIGFjdHVhbGx5IGV4aXN0cyBpbiBkZXZpY2UgdHJl
ZSBmb3IgdGhlCj4gYm9hcmQsIGFuZCBwb2ludCB0byBpdCB1c2luZyBwaHktaGFuZGxlLiBObyBy
dW50aW1lIGRldGVjdGlvbiwganVzdAo+IGNvcnJlY3RseSBkZXNjcmliZSB0aGUgaGFyZHdhcmUu
CgpCdXQgdGhlIGJvYXJkcyByYW5kb21seSBjb250YWluIFNvQydzIHdpdGggZGlmZmVyZW50IFBI
WSdzIHNvIHdlCmhhdmUgdG8gc3VwcG9ydCBib3RoIHZhcmlhbnRzLgoKPiBEbyB5b3UgaGF2ZSBl
eGFtcGxlcyBvZiBib2FyZHMgd2hlcmUgdGhlIFNvQyB2YXJpYW50IGNoYW5nZWQgZHVyaW5nCj4g
dGhlIGJvYXJkcyBwcm9kdWN0aW9uIGxpZmU/CgpZZXMsIHRoZSBib2FyZHMgSSdtIHdvcmtpbmcg
Zm9yIGV4YW1wbGUsIGJ1dCB0aGlzIGlzIGxpa2VseSBhbiBpc3N1ZSBmb3IKb3RoZXIgYm9hcmRz
IGFzIHdlbGwodmVuZG9yIEJTUCBhdXRvIGRldGVjdHMgUEhZIHZhcmlhbnRzKToKaHR0cHM6Ly93
d3cuemV1c2J0Yy5jb20vQVNJQy1NaW5lci1SZXBhaXIvUGFydHMtVG9vbHMtRGV0YWlscy5hc3A/
SUQ9MTEzOQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0
aW5mby9saW51eC1zdG0zMgo=
