Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BCF8AC43FD
	for <lists+linux-stm32@lfdr.de>; Mon, 26 May 2025 21:05:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 24B2CC36B0F;
	Mon, 26 May 2025 19:05:29 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
 [209.85.222.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3C613C36B0F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 May 2025 19:05:27 +0000 (UTC)
Received: by mail-qk1-f180.google.com with SMTP id
 af79cd13be357-7c542ffec37so274477785a.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 May 2025 12:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748286326; x=1748891126;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9zM/XnPPB9BX6DI+X/tdBdbdDGUH15z/crP7yYd1Fx8=;
 b=SUYvSEb8Nc4VdQBvXEihghT/0a7A8s9w9YV2nVsLKhzHoIYBlNWYMqbmWAC0InosKi
 bR+fmZ5ybYyX5Ilnd31oRppD/MDpRnud05NbOVdBkhZq2+rBdZZjrQNmjyAA6Q9iRdna
 7UJaPEH0AKv6uji1+Fcf4PQrGOrzM65/WghE4DlHBQRjrCIkwbZUQpqr70YTC8I/QDwA
 //ugKb3yNokVKlc6gVowxrl9dnogTpkG7gX2wLbhAY0ZsjVHLrIk41mQr3lFUh8IS5MK
 x+pwAgkCYjXDNaUA2s0vVM8G5vuKY+HH8uKwYrOWTS3Toh49/Eg0mciL9uH2mIc9ckqp
 tA7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748286326; x=1748891126;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9zM/XnPPB9BX6DI+X/tdBdbdDGUH15z/crP7yYd1Fx8=;
 b=YEu8z3VgXSRTP9V8NakQbSmt/NosBrIDagn0OY1NEO5MAba/ZkV+2qIGZ4vhupXgYd
 U3fC4uqyQStCYqr1hhETGdDzRL/U5Dlgh7fiA2UUm7tA46Mea02ooeZ8WCiAZlQDiB78
 036uMNeKkfOQdhyQ//2HJeU7FzvtHVmi/TJl7KTLz2gR30MkHe19UD1941jEkX8PlP4n
 t35rg0vmpD8Rt5e1agZ6ZGlEn0FCyCBRph3P1wvHEVdmngussfi6AOn5PW884OpcJSiF
 N81ZfpJNDrO6vg2h+s4I6qMY5Q+PrwtwSSev0XjP9vm7WWM/TCe2Jzx2jOkAiG22IbKx
 9C5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWNMQojQXTdErL6TERiScepvQ4AlsSRHNJb861sxWUwCytbll7yAOwnrgthu7wliyW2pqmARqMieZsfTw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxlUuK5TT1BygUMI97TSzInwk4ooNEQMgce3vnRF7qShTpVAoCB
 YfBPrh7JyyQqVHNIMSbkOolWl6iTeDBj9QvjcxXs7TspLX70P661UEcBIVJ4QtksBkKX8RqkxBJ
 mKSpCJheWvJ3TnljULGWLot7o64BgLio=
X-Gm-Gg: ASbGnctqLHiuUAupcih3er4LlL1V3Rzm/ifdmxosK7mZJxYBsOKN5u7Ue0/B39rk9Mp
 eDl7TNEbodZP1WvXiWfZoRoPnk/iUIdEtAkatxBBxlv8xAW76IFJMxqoh5FrBjXEV1+q8eJLDbh
 bZdN5A9LVpLesvVfAdEmsRBCmp0LNvKri+71lY9RqpnBfz
X-Google-Smtp-Source: AGHT+IEzr1D0xPyVVTqgXnkaxzNsP6OY+ZVcUjK4Q6hjbSAkhccfV9zIJl49kHyZ9kmtGtW7FN9E3h5L1m5LIHvS+oA=
X-Received: by 2002:a05:620a:4505:b0:7c5:a55b:fa6c with SMTP id
 af79cd13be357-7ceecc2b525mr1410143685a.38.1748286326033; Mon, 26 May 2025
 12:05:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250526002924.2567843-1-james.hilliard1@gmail.com>
 <20250526002924.2567843-2-james.hilliard1@gmail.com>
 <aDQgmJMIkkQ922Bd@shell.armlinux.org.uk>
 <4a2c60a2-03a7-43b8-9f40-ea2b0a3c4154@lunn.ch>
In-Reply-To: <4a2c60a2-03a7-43b8-9f40-ea2b0a3c4154@lunn.ch>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 26 May 2025 13:05:14 -0600
X-Gm-Features: AX0GCFufJmB1WnNeY40vi62AOOmldrFuv3uM6nfuatEvw8W1yQgwUxsIUPzPUZI
Message-ID: <CADvTj4qvu+FCP1AzMx6xFsFXVuo=6s0UBCLSt7_ok3War09BNA@mail.gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Huacai Chen <chenhuacai@kernel.org>, Eric Dumazet <edumazet@google.com>,
 linux-stm32@st-md-mailman.stormreply.com, Samuel Holland <samuel@sholland.org>,
 Jinjie Ruan <ruanjinjie@huawei.com>, Yanteng Si <si.yanteng@linux.dev>,
 "Russell King \(Oracle\)" <linux@armlinux.org.uk>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-sunxi@lists.linux.dev, Paul Kocialkowski <paulk@sys-base.io>,
 Yinggang Gu <guyinggang@loongson.cn>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 linux-arm-kernel@lists.infradead.org, Feiyang Chen <chenfeiyang@loongson.cn>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [RFC PATCH 2/2] net: stmmac: dwmac-sun8i: Allow
 runtime AC200/AC300 phy selection
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

T24gTW9uLCBNYXkgMjYsIDIwMjUgYXQgODoxNOKAr0FNIEFuZHJldyBMdW5uIDxhbmRyZXdAbHVu
bi5jaD4gd3JvdGU6Cj4KPiBPbiBNb24sIE1heSAyNiwgMjAyNSBhdCAwOTowNDo0MEFNICswMTAw
LCBSdXNzZWxsIEtpbmcgKE9yYWNsZSkgd3JvdGU6Cj4gPiBPbiBTdW4sIE1heSAyNSwgMjAyNSBh
dCAwNjoyOToyMlBNIC0wNjAwLCBKYW1lcyBIaWxsaWFyZCB3cm90ZToKPiA+ID4gKyAgIGlmICgh
bnZtZW1fY2VsbF9yZWFkX3UxNihkZXYsICJhYzMwMCIsICZ2YWwpKSB7Cj4gPiA+ICsgICAgICAg
ICAgIGNvbnN0IGNoYXIgKnBoeV9uYW1lID0gKHZhbCAmIEFDMzAwX0tFWSkgPyAiYWMzMDAiIDog
ImFjMjAwIjsKPiA+ID4gKyAgICAgICAgICAgaW50IGluZGV4ID0gb2ZfcHJvcGVydHlfbWF0Y2hf
c3RyaW5nKGRldi0+b2Zfbm9kZSwgInBoeS1uYW1lcyIsIHBoeV9uYW1lKTsKPiA+ID4gKyAgICAg
ICAgICAgaWYgKGluZGV4IDwgMCkgewo+ID4gPiArICAgICAgICAgICAgICAgICAgIGRldl9lcnIo
ZGV2LCAiUEhZIG5hbWUgbm90IGZvdW5kIGluIGRldmljZSB0cmVlXG4iKTsKPiA+ID4gKyAgICAg
ICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPiA+ID4gKyAgICAgICAgICAgfQo+ID4gPiAr
Cj4gPiA+ICsgICAgICAgICAgIHBsYXRfZGF0LT5waHlfbm9kZSA9IG9mX3BhcnNlX3BoYW5kbGUo
ZGV2LT5vZl9ub2RlLCAicGh5cyIsIGluZGV4KTsKPiA+ID4gKyAgICAgICAgICAgaWYgKCFwbGF0
X2RhdC0+cGh5X25vZGUpIHsKPiA+ID4gKyAgICAgICAgICAgICAgICAgICBkZXZfZXJyKGRldiwg
IkZhaWxlZCB0byBnZXQgUEhZIG5vZGUgZnJvbSBwaHlzIHByb3BlcnR5XG4iKTsKPiA+ID4gKyAg
ICAgICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPiA+ID4gKyAgICAgICAgICAgfQo+ID4g
PiArICAgfQo+ID4KPiA+IDEuIFlvdSBhcmUgcmUtdXNpbmcgdGhlIGRyaXZlcnMvcGh5IGJpbmRp
bmcgZm9yIGV0aGVybmV0IFBIWXMgZHJpdmVuIGJ5Cj4gPiAgICBwaHlsaWIgaGVyZS4KPiA+IDIu
IFlvdSBuZWVkIHRvIHVwZGF0ZQo+ID4gICAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL25ldC9hbGx3aW5uZXIsc3VuOGktYTgzdC1lbWFjLnlhbWwKPiA+ICAgIGluIGEgc2VwYXJh
dGUgcGF0Y2guCj4KPiBBIHJlYWwgdXNlciwgaS5lLiBhIHBhdGNoIHRvIGEgLmR0cyBmaWxlLCB3
b3VsZCBhbHNvIGJlIGdvb2QuCgpUaGF0IHdpbGwgYmUgYWRkZWQgdGhhdCBkb3duIHRoZSBsaW5l
LCBmb3Igbm93IEkgYWRkZWQgYW4gZXhhbXBsZSBpbiB0aGUgZG9jczoKaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvbmV0ZGV2LzIwMjUwNTI2MTgyOTM5LjI1OTM1NTMtMy1qYW1lcy5oaWxsaWFyZDFA
Z21haWwuY29tLwoKQ3VycmVudGx5IHRoZXJlJ3MgYSBmZXcgb3RoZXIgZHJpdmVycyBuZWVkZWQg
dG8gZnVsbHkgYnJpbmcgdXAgdGhlIGg2MTYgZW1hYzEKd2l0aCBBQzIwMC9BQzMwMCBQSFkncyBz
dWNoIGFzIFBXTSBkcml2ZXIgc3VwcG9ydC4KCmkuZS4gdGhpcyh3aGljaCB3aWxsIGFsc28gbmVl
ZCBhIGZldyBhZGRpdGlvbmFsIHBhdGNoZXMgZm9yIHRoZSBINjE2ClBXTSB2YXJpYW50KToKaHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjUwNDI3MTQyNTAwLjE1MTkyNS0zLXByaXZhdGVz
dWIyQGdtYWlsLmNvbS8KCkknbSBjdXJyZW50bHkgZG9pbmcgbW9zdCBvZiB0aGUgUEhZIGluaXRp
YWxpemF0aW9uIGluIHUtYm9vdCB0byBzaW1wbGlmeSB0ZXN0aW5nCm9mIHRoZSBlZnVzZSBiYXNl
ZCBQSFkgc2VsZWN0aW9uIGxvZ2ljIGluIHRoZSBrZXJuZWwuIEknbSBzZW5kaW5nIHRoaXMKc2Vw
YXJhdGVseSBhcyBhIG51bWJlciBvZiBzdWJzZXF1ZW50IGRyaXZlcnMgZm9yIGtlcm5lbCBzaWRl
IFBIWQppbml0aWFsaXphdGlvbiB3aWxsIGJlIGRlcGVuZGVudCB1cG9uIHNwZWNpZmljIFBIWSdz
IGJlaW5nIGRpc2NvdmVyZWQgYXQKcnVudGltZSB2aWEgdGhlIGFjMzAwIGVmdXNlIGJpdC4KCkkn
dmUgY3VycmVudGx5IHZlcmlmaWVkIHRoaXMgd29ya3Mgb24gQUMyMDAgYW5kIEFDMzAwIGJvYXJk
cyBieSBjaGVja2luZwp0aGF0IHRoZSBhcHByb3ByaWF0ZSBwaHkgYWRkcmVzcyBpcyB1c2VkKGFk
ZHJlc3MgMCBvbiBBQzMwMCBhbmQgYWRkcmVzcyAxCm9uIEFDMjAwKS4KCj4KPiAgIEFuZHJldwpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0z
MiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpo
dHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51
eC1zdG0zMgo=
