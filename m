Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D32D9A8891D
	for <lists+linux-stm32@lfdr.de>; Mon, 14 Apr 2025 18:56:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8345AC78028;
	Mon, 14 Apr 2025 16:56:44 +0000 (UTC)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com
 [209.85.221.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EFF20C6DD9A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Apr 2025 16:56:42 +0000 (UTC)
Received: by mail-vk1-f173.google.com with SMTP id
 71dfb90a1353d-523d8c024dfso1840455e0c.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Apr 2025 09:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744649802; x=1745254602;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=udtwR14oubKebFu5rW6k4e0weoZf4m2R815HfEK738g=;
 b=RCyVD/CDGOAZXzAKDeVUJ+nf48TQ98wQcT0mh6mFLvxPP2zXbLuaxqMuMAFGZrNmDo
 LBomTmCuR4poj5jCo+gl6JwOYhVl2U0kzfOQAwASeQD6yEK+3bzDuIm+mN/Q0WeJo7ti
 UZI7m7XOGiR+46yTg7O4oe+YaVYyC/jBtuZ9uEEjjqDGWRED2vjQk8EGfMKj7CgK0D5P
 cP1sNduBgzihSGdaJd61aGzLfMWRFS+PphBj0Uedo9OcxY9bGvqegPdr8v6Z/+AKueGx
 0LphD5Q7HIqcIeqEHeo9pdKkELZymTskwp8h0riZlttPmHIeKXyqiJINhI43vM7Rbrz4
 8qgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744649802; x=1745254602;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=udtwR14oubKebFu5rW6k4e0weoZf4m2R815HfEK738g=;
 b=rVxUyIibTc/yK6/KsFZnXb43nGVG2+zMr2KgR9wtQhFw6u4u2pkQQ0yMRaYphoncw4
 t7tC95GHHHzurPOWq0R8RpQynVGSs7rnyJeFVIbhsNsJ7zWD7d3RUcV+KAhW4Qh7vcVm
 e7Binvp90jdxIiVtKe1TzPZ0tV0MZxEBumwdDy6+ZtNzCr92JToRnKZlVTxF+bP9C9lk
 srK0pbuxHN4QeumhXj8SQ8/ia2TxdJweRqRjW3zig8dXw/6aaySJPi1XnKjFkLzPBhWk
 J1Se+q8LugTv6HrFXZOpOLjE47iarh9pJc/ln1iYcgTN/zqmsUCYo5s3nfbonK7p18QW
 Ca/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCV5tpdKMi2ODuvbsqQiwWEkmxUMD59IaGIVrCp4+H5VroAgyrlNK5mRIjDgX74g36ut6btLI0xdadNnQw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxwxF2nU/BDuBYWxhaS/98S2xAyRZaO1Vv3+efOyrsWmn+sFsav
 ZsykiOqdWWNxAjdCnpcWjqfCN/8T+qyIEiJbDJ5nnhV2gnGd8zsrs/ljv89yPiUfZUT+2Y07d6B
 /D8tAYlZ2otSJdFIpL6AzlLuIrKY=
X-Gm-Gg: ASbGncvjGQTZlmMTFcz5e8OMIp0EdxHgI30xv73Yz3wifsb674p2UEKe9CzixigMoe4
 lrjZJghWJBFNFr/Kx2yBOqsVsMEzj8zF54yFZE/faIuv1M6J73S500ApxUIiNAOc/EQQk83kvYL
 KLjHZu/d7+Pp28kYP00cFV3BwLNruqTNZ/H2fnTh5I96Kee/bD5tap1A==
X-Google-Smtp-Source: AGHT+IFQpsz/ji8MKcAuYh+qFnh6pm7Cs4klNHHbzk4kp5149hgyDeoWHHM5lEKz3qpRzffoQj33KxW8IfZk7jM+Cro=
X-Received: by 2002:a05:6122:209f:b0:50b:e9a5:cd7b with SMTP id
 71dfb90a1353d-527c35ae10cmr8117351e0c.9.1744649801573; Mon, 14 Apr 2025
 09:56:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250407120317.127056-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250407120317.127056-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <f20e6589-37d9-458b-af82-92fb1ed0db18@bp.renesas.com>
In-Reply-To: <f20e6589-37d9-458b-af82-92fb1ed0db18@bp.renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 14 Apr 2025 17:56:15 +0100
X-Gm-Features: ATxdqUHsvC58AXJcSX9DHfg067ybVtkBeQg9WB3LjBGtUZ7gtnbYUDxCu53XU_M
Message-ID: <CA+V-a8uho8xKikEmSQeDM4Qe5y0jaZfYE3vNc8qehb_NLHGJ6g@mail.gmail.com>
To: Paul Barker <paul.barker.ct@bp.renesas.com>
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
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, Philipp Zabel <p.zabel@pengutronix.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next v5 3/3] net: stmmac: Add DWMAC
 glue layer for Renesas GBETH
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

SGkgUGF1bCwKCk9uIE1vbiwgQXByIDE0LCAyMDI1IGF0IDI6MTPigK9QTSBQYXVsIEJhcmtlcgo8
cGF1bC5iYXJrZXIuY3RAYnAucmVuZXNhcy5jb20+IHdyb3RlOgo+Cj4gSGkgUHJhYmhha2FyLAo+
Cj4gT24gMDcvMDQvMjAyNSAxMzowMywgUHJhYmhha2FyIHdyb3RlOgo+ID4gRnJvbTogTGFkIFBy
YWJoYWthciA8cHJhYmhha2FyLm1haGFkZXYtbGFkLnJqQGJwLnJlbmVzYXMuY29tPgo+ID4KPiA+
IEFkZCB0aGUgRFdNQUMgZ2x1ZSBsYXllciBmb3IgdGhlIEdCRVRIIElQIGZvdW5kIGluIHRoZSBS
ZW5lc2FzIFJaL1YySChQKQo+ID4gU29DLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IExhZCBQcmFi
aGFrYXIgPHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4KPgo+IFtzbmlw
XQo+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMv
ZHdtYWMtcmVuZXNhcy1nYmV0aC5jIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1t
YWMvZHdtYWMtcmVuZXNhcy1nYmV0aC5jCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+ID4gaW5k
ZXggMDAwMDAwMDAwMDAwLi5hMGY3Y2FjZWE4MTAKPiA+IC0tLSAvZGV2L251bGwKPiA+ICsrKyBi
L2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLXJlbmVzYXMtZ2JldGgu
Ywo+ID4gQEAgLTAsMCArMSwxNjUgQEAKPiA+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjog
R1BMLTIuMCsKPiA+ICsvKgo+ID4gKyAqIGR3bWFjLXJlbmVzYXMtZ2JldGguYyAtIERXTUFDIFNw
ZWNpZmljIEdsdWUgbGF5ZXIgZm9yIFJlbmVzYXMgR0JFVEgKPiA+ICsgKgo+ID4gKyAqIFRoZSBS
eCBhbmQgVHggY2xvY2tzIGFyZSBzdXBwbGllZCBhcyBmb2xsb3dzIGZvciB0aGUgR0JFVEggSVAu
Cj4gPiArICoKPiA+ICsgKiAgICAgICAgICAgICAgICAgICAgICAgICBSeCAvIFR4Cj4gPiArICog
ICAtLS0tLS0tKy0tLS0tLS0tLS0tLS0gb24gLyBvZmYgLS0tLS0tLQo+ID4gKyAqICAgICAgICAg
IHwKPiA+ICsgKiAgICAgICAgICB8ICAgICAgICAgICAgUngtMTgwIC8gVHgtMTgwCj4gPiArICog
ICAgICAgICAgKy0tLS0gbm90IC0tLS0gb24gLyBvZmYgLS0tLS0tLQo+ID4gKyAqCj4gPiArICog
Q29weXJpZ2h0IChDKSAyMDI1IFJlbmVzYXMgRWxlY3Ryb25pY3MgQ29ycG9yYXRpb24KPiA+ICsg
Ki8KPiA+ICsKPiA+ICsjaW5jbHVkZSA8bGludXgvY2xrLmg+Cj4gPiArI2luY2x1ZGUgPGxpbnV4
L2RldmljZS5oPgo+ID4gKyNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4KPiA+ICsjaW5jbHVkZSA8
bGludXgvcGxhdGZvcm1fZGV2aWNlLmg+Cj4gPiArI2luY2x1ZGUgPGxpbnV4L3Jlc2V0Lmg+Cj4g
PiArCj4gPiArI2luY2x1ZGUgImR3bWFjNC5oIgo+Cj4gSSdtIGxvb2tpbmcgYXQgdGhpcyB3aGls
ZSB3b3JraW5nIG9uIFJaL1QySCBFdGhlcm5ldCBzdXBwb3J0LCBjbGFuZ2QKPiBzYXlzIGluY2x1
c2lvbiBvZiBkd21hYzQuaCBpcyBub3QgbmVlZGVkIGhlcmUgYW5kIGNvbXBpbGF0aW9uIHN1Y2Nl
ZWRzCj4gd2l0aCB0aGUgaW5jbHVkZSByZW1vdmVkLgo+CkFncmVlZCwgSSB3aWxsIGRyb3AgdGhp
cy4KCkNoZWVycywKUHJhYmhha2FyCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
