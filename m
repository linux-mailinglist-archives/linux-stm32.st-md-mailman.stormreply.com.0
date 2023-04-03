Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EE66D6D52A3
	for <lists+linux-stm32@lfdr.de>; Mon,  3 Apr 2023 22:39:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A7962C6A610;
	Mon,  3 Apr 2023 20:39:16 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 200A9C6A60B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Apr 2023 20:39:15 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id x3so122247343edb.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 03 Apr 2023 13:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112; t=1680554354;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ANuyucjG7+IOsm6+PTXTUkVZpuE117uxor/udrQsrHI=;
 b=QBtct7OF544g4KW8FmyicOGj93ZjWlg8zuQv1bJbp8jcg7kZlaoTEPE+ZjM8qK1FvF
 ySiNTF5dDqmcX7CK3V3nXjfCtZyZUPhXWS0tiyg1h2mmI68eIuECf75r+pVgglVEKCkU
 kHoMUTP0p53HT7ROKBpLFzTXIvLXbS7upHKKFV+6T4zuNMqbtyJ5qYvrMPN/aHFSnads
 mcQglHoBkCSFBXGMXHZCZrQSWHcr75YnbjUa66Tunz0FV33dyy00oLs71tZiNRBidtW4
 jtGUBV/KHY62/FaxcVx0/bdUCldUHFYapDx3Da/E+rJH3/2oHbH6x+g4Go250AzETWuH
 eyhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680554354;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ANuyucjG7+IOsm6+PTXTUkVZpuE117uxor/udrQsrHI=;
 b=xso8wkxuwgcb055C5qyBK65gOAcFZ6V+pV+l83CvPQ5iKFhwdy5uxVGt6zWA0h6JmP
 NlZvv8hif5/0/0c0B1eNxr7oMd3e4HIBXcKqZY92HHCFeTmyD+qjeLn/4r74Foaxh2rK
 KmhZW9AWCqIOgjZELXYTQ56HOPC0TWAc+MrGIPgKaA2qtE5JLfxOt3zgTi/BUPunT3uC
 4EIrbqcZkPPNeHZXT+1ZATGFvyKEJ3x4FONhAamGVfc1gjt1FUkHlFmQ+EkURaXyjXB1
 WZvpz7AVWaAJhmmfPKUatggAXJ3uJ03Tj9jY3etrTZzuE4sA2D4+Mei0AcvfekbtUcvi
 A1BA==
X-Gm-Message-State: AAQBX9eayT7RBcil4O9lMAyMp3fvD0Sy8d2vwxJP6bwrrqZe9kjw5ECI
 HPDGIvXfwOonhUX7pXrElo+Xfjk/nma9HKgJAW8=
X-Google-Smtp-Source: AKy350Yxps2lCxD4+gSI3XRR+EKyXbQm+2ZcypH1MgOjQt3rpacSMedZmkVztU2IZX24o5jZNqKukzBRTVyKq2STkzU=
X-Received: by 2002:a05:6402:a47:b0:502:3e65:44f7 with SMTP id
 bt7-20020a0564020a4700b005023e6544f7mr10506548edb.3.1680554354318; Mon, 03
 Apr 2023 13:39:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230402143025.2524443-1-u.kleine-koenig@pengutronix.de>
 <20230402143025.2524443-2-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230402143025.2524443-2-u.kleine-koenig@pengutronix.de>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 3 Apr 2023 22:39:03 +0200
Message-ID: <CAFBinCBX8dQo9898KkXaMaanQ9-LcFA7HHFf+XBM2-f+g8WY7Q@mail.gmail.com>
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Eric Dumazet <edumazet@google.com>, linux-amlogic@lists.infradead.org,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Jerome Brunet <jbrunet@baylibre.com>, Samuel Holland <samuel@sholland.org>,
 Kevin Hilman <khilman@baylibre.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Jose Abreu <joabreu@synopsys.com>,
 NXP Linux Team <linux-imx@nxp.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-sunxi@lists.linux.dev,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Vladimir Zapolskiy <vz@mleia.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-oxnas@groups.io, Shawn Guo <shawnguo@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next 01/11] net: stmmac: Make
 stmmac_pltfr_remove() return void
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

T24gU3VuLCBBcHIgMiwgMjAyMyBhdCA0OjMx4oCvUE0gVXdlIEtsZWluZS1Lw7ZuaWcKPHUua2xl
aW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4gd3JvdGU6Cj4KPiBUaGUgZnVuY3Rpb24gcmV0dXJu
cyB6ZXJvIHVuY29uZGl0aW9uYWxseS4gQ2hhbmdlIGl0IHRvIHJldHVybiB2b2lkIGluc3RlYWQK
PiB3aGljaCBzaW1wbGlmaWVzIHNvbWUgY2FsbGVycyBhcyBlcnJvciBoYW5kaW5nIGJlY29tZXMg
dW5uZWNlc3NhcnkuCj4KPiBUaGUgZnVuY3Rpb24gaXMgYWxzbyB1c2VkIGZvciBzb21lIGRyaXZl
cnMgYXMgcmVtb3ZlIGNhbGxiYWNrLiBTd2l0Y2ggdGhlc2UKPiB0byB0aGUgLnJlbW92ZV9uZXco
KSBjYWxsYmFjay4gRm9yIHNvbWUgb3RoZXJzIG5vIGVycm9yIGNhbiBoYXBwZW4gaW4gdGhlCj4g
cmVtb3ZlIGNhbGxiYWNrIG5vdywgY29udmVydCB0aGVtIHRvIC5yZW1vdmVfbmV3KCksIHRvby4K
Pgo+IFNpZ25lZC1vZmYtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVu
Z3V0cm9uaXguZGU+Cj4gLS0tCj4gIGRyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFj
L2R3bWFjLWFuYXJpb24uYyAgICAgfCAyICstCj4gIGRyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWlj
cm8vc3RtbWFjL2R3bWFjLWdlbmVyaWMuYyAgICAgfCAyICstCj4gIGRyaXZlcnMvbmV0L2V0aGVy
bmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLWlteC5jICAgICAgICAgfCAyICstCj4gIGRyaXZlcnMv
bmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLWluZ2VuaWMuYyAgICAgfCAyICstCj4g
IGRyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLWludGVsLXBsYXQuYyAg
fCA5ICsrKy0tLS0tLQo+ICBkcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21h
Yy1pcHE4MDZ4LmMgICAgIHwgMiArLQo+ICBkcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0
bW1hYy9kd21hYy1scGMxOHh4LmMgICAgIHwgMiArLQo+ICBkcml2ZXJzL25ldC9ldGhlcm5ldC9z
dG1pY3JvL3N0bW1hYy9kd21hYy1tZWRpYXRlay5jICAgIHwgOSArKystLS0tLS0KPiAgZHJpdmVy
cy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtbWVzb24uYyAgICAgICB8IDIgKy0K
PiAgZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtbWVzb244Yi5jICAg
ICB8IDIgKy0KZm9yIGR3bWFjLW1lc29uIGFuZCBkd21hYy1tZXNvbjhiOgpBY2tlZC1ieTogTWFy
dGluIEJsdW1lbnN0aW5nbCA8bWFydGluLmJsdW1lbnN0aW5nbEBnb29nbGVtYWlsLmNvbT4KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIg
bWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0
cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgt
c3RtMzIK
