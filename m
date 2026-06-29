Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id i3i9Gz6jQmo//AkAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Jun 2026 18:54:22 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EE1576DD885
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Jun 2026 18:54:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=UtH5gwa+;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=kernel.org (policy=quarantine)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A4AD1C0693D;
	Mon, 29 Jun 2026 16:54:21 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7155FC424DB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Jun 2026 16:54:19 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 3231743E20
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Jun 2026 16:54:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0C411F01563
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Jun 2026 16:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1782752058;
 bh=nrtvzAHL3u6/v5L5E9Co3P0QE5xowtwOQFIomSwMWjk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc;
 b=UtH5gwa+U1zvJ6MiDKihq7fz1abrI92vBGcYoq95X9rWwvz5W22oGlu4vG8sTBX+v
 lZvuZzP6DS79zjdwBazFvkl6XvoQbUodjizsh/Y5t56PyS2oiOkfYCx7wkLk7cdr+q
 2NhTOPmDU9hdWHEJWT+FaK8smDYBGn2B+2GOFurQSd53ujUwxlBKe0UjPhBCgGA3QX
 k22qz2Jmw2cBhPjOS+8yx0ottM8TY6XGd5Ka/4VbWDj5PV4d5a2kNIQXOJuCPPFOrx
 MdEVXZTxj/5NUCsyS7s46Ae8fQuMQf8DXRbIUUrciT9U9mcW4df21f2qy+RvS22A4/
 JmKSNxfAR6eag==
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-39adb9a103aso26185851fa.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Jun 2026 09:54:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AHgh+Rq+CP8E+DQzvqzQ1svWStAuZPvlmXibunuvgZU8fsaUIQGtV7Fi5yQqAXUUCChmXLXi7wkaqe9ih1E10A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yxy3LCKc5SYMgDR40J0ZmXEWM6FIJfU1eInkhmjGXdASQSzo3AY
 O0SVe7EYgBHju3E+2T/H6aD29LTSI7/a/gocsWyGA7XgTEtFiWuGdBkr8SEgDvHM/lMkvvl9HG4
 kzHNvpDEfvBo1NJIUWh/Ku1+pOCth+WDH4o0J7P5aMQ==
X-Received: by 2002:a05:6512:3d19:b0:5ae:b97b:f75a with SMTP id
 2adb3069b0e04-5aebdbbc205mr24885e87.55.1782752056582; Mon, 29 Jun 2026
 09:54:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260629-qcom-sa8255p-emac-v11-0-1b7fb95b51f9@oss.qualcomm.com>
 <20260629-qcom-sa8255p-emac-v11-1-1b7fb95b51f9@oss.qualcomm.com>
 <CAMuHMdXen+E-Ai51aWBa_KV9W8Fz2cQPpT-FG_kQ7akhrrYa_A@mail.gmail.com>
 <CAMRc=Me3jaZXiXa1sFXr=8Do4sCd+XN1pKTcWC8-0j78SjCkKA@mail.gmail.com>
 <CAMuHMdVUBgG0EFB16OxHisbxx-sBvDKvBPNZdpyDnmBrnX4ptQ@mail.gmail.com>
In-Reply-To: <CAMuHMdVUBgG0EFB16OxHisbxx-sBvDKvBPNZdpyDnmBrnX4ptQ@mail.gmail.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Mon, 29 Jun 2026 18:54:04 +0200
X-Gmail-Original-Message-ID: <CAMRc=Meb58KCuLXkNSJwUq6KJUzZv0u49FBA2L4C8Vd3NVo8Cg@mail.gmail.com>
X-Gm-Features: AVVi8CdXDDErrbJGCmrBnsO12t_UfV9Z0jI02dBWCQjihPCNNCZY7ROJGiFNTUI
Message-ID: <CAMRc=Meb58KCuLXkNSJwUq6KJUzZv0u49FBA2L4C8Vd3NVo8Cg@mail.gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: imx@lists.linux.dev, s32@nxp.com, Radu Rendec <rrendec@redhat.com>,
 linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
 linux-amlogic@lists.infradead.org, linux-riscv@lists.infradead.org,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Jerome Brunet <jbrunet@baylibre.com>, Rob Herring <robh@kernel.org>,
 Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
 Romain Gantois <romain.gantois@bootlin.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Magnus Damm <magnus.damm@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-rockchip@lists.infradead.org, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Konrad Dybcio <konradybcio@kernel.org>,
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 Jan Petrous <jan.petrous@oss.nxp.com>, Maxime Ripard <mripard@kernel.org>,
 linux-mips@vger.kernel.org, Drew Fustini <dfustini@tenstorrent.com>,
 sophgo@lists.linux.dev, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Chen-Yu Tsai <wens@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 linux-renesas-soc@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 Vinod Koul <vkoul@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next v11 1/7] dt-bindings: phy:
 document the serdes PHY on sa8255p
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [4.89 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20260515];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[46];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:geert@linux-m68k.org,m:imx@lists.linux.dev,m:s32@nxp.com,m:rrendec@redhat.com,m:linux-kernel@vger.kernel.org,m:edumazet@google.com,m:linux-amlogic@lists.infradead.org,m:linux-riscv@lists.infradead.org,m:festevam@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:jbrunet@baylibre.com,m:robh@kernel.org,m:mohd.anwar@oss.qualcomm.com,m:romain.gantois@bootlin.com,m:khilman@baylibre.com,m:bartosz.golaszewski@oss.qualcomm.com,m:magnus.damm@gmail.com,m:jernej.skrabec@gmail.com,m:linux-rockchip@lists.infradead.org,m:kuba@kernel.org,m:pabeni@redhat.com,m:konradybcio@kernel.org,m:linux-sunxi@lists.linux.dev,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:jan.petrous@oss.nxp.com,m:mripard@kernel.org,m:linux-mips@vger.kernel.org,m:dfustini@tenstorrent.com,m:sophgo@lists.linux.dev,m:peppe.cavallaro@st.com,m:wens@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:neil.armstrong@linaro.org,m:netdev@vger.kernel.org,m:andersson@kerne
 l.org,m:bartosz.golaszewski@linaro.org,m:christophe.roullier@foss.st.com,m:linux-renesas-soc@vger.kernel.org,m:andrew+netdev@lunn.ch,m:vkoul@kernel.org,m:mcoquelin.stm32@gmail.com,m:krzk+dt@kernel.org,m:shawnguo@kernel.org,m:davem@davemloft.net,m:magnusdamm@gmail.com,m:jernejskrabec@gmail.com,m:conor@kernel.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[brgl@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	GREYLIST(0.00)[pass,meta];
	FREEMAIL_CC(0.00)[lists.linux.dev,nxp.com,redhat.com,vger.kernel.org,google.com,lists.infradead.org,gmail.com,st-md-mailman.stormreply.com,baylibre.com,kernel.org,oss.qualcomm.com,bootlin.com,oss.nxp.com,tenstorrent.com,st.com,linaro.org,foss.st.com,lunn.ch,davemloft.net];
	DKIM_TRACE(0.00)[kernel.org:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt,netdev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,mail.gmail.com:mid,stormreply.com:url,stormreply.com:email,linux-m68k.org:email,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EE1576DD885

T24gTW9uLCBKdW4gMjksIDIwMjYgYXQgNDo1OOKAr1BNIEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2Vl
cnRAbGludXgtbTY4ay5vcmc+IHdyb3RlOgo+Cj4gSGkgQmFydG9zeiwKPgo+IE9uIE1vbiwgMjkg
SnVuIDIwMjYgYXQgMTY6MDcsIEJhcnRvc3ogR29sYXN6ZXdza2kgPGJyZ2xAa2VybmVsLm9yZz4g
d3JvdGU6Cj4gPiBPbiBNb24sIDI5IEp1biAyMDI2IDE1OjUxOjMxICswMjAwLCBHZWVydCBVeXR0
ZXJob2V2ZW4KPiA+IDxnZWVydEBsaW51eC1tNjhrLm9yZz4gc2FpZDoKPiA+ID4gT24gTW9uLCAy
OSBKdW4gMjAyNiBhdCAxMzoyOSwgQmFydG9zeiBHb2xhc3pld3NraQo+ID4gPiA8YmFydG9zei5n
b2xhc3pld3NraUBvc3MucXVhbGNvbW0uY29tPiB3cm90ZToKPiA+ID4+IERlc2NyaWJlIHRoZSBT
R01JSS9TZXJEZXMgUEhZIHByZXNlbnQgb24gdGhlIFF1YWxjb21tIHNhODI1NXAgcGxhdGZvcm1z
Lgo+ID4gPj4gVGhpcyBpcyBlc3NlbnRpYWxseSB0aGUgc2FtZSBoYXJkd2FyZSBhcyBzYTg3NzVw
IHJldjMgYnV0IHRoZSBQSFkgaXMKPiA+ID4+IG1hbmFnZWQgYnkgZmlybXdhcmUgb3ZlciBTQ01J
Lgo+ID4gPgo+ID4gPiBTbyB3aHkgY2FuJ3QgaXQgYmUgcmV1c2UgdGhlIERUIGJpbmRpbmdzLCBh
bmQgYmUgY29tcGF0aWJsZSB3aXRoCj4gPiA+IHFjb20sc2E4Nzc1cC1kd21hYy1zZ21paS1waHk/
Cj4gPiA+Cj4gPiA+PiBTaWduZWQtb2ZmLWJ5OiBCYXJ0b3N6IEdvbGFzemV3c2tpIDxiYXJ0b3N6
LmdvbGFzemV3c2tpQG9zcy5xdWFsY29tbS5jb20+Cj4gPiA+Cj4gPiA+PiAtLS0gL2Rldi9udWxs
Cj4gPiA+PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGh5L3Fjb20s
c2E4MjU1cC1kd21hYy1zZ21paS1waHkueWFtbAo+ID4gPgo+ID4gPj4gKyAgcG93ZXItZG9tYWlu
czoKPiA+ID4+ICsgICAgbWF4SXRlbXM6IDEKPiA+ID4+ICsKPiA+ID4+ICsgIHBvd2VyLWRvbWFp
bi1uYW1lczoKPiA+ID4+ICsgICAgaXRlbXM6Cj4gPiA+PiArICAgICAgLSBjb25zdDogc2VyZGVz
Cj4gPiA+Cj4gPiA+PiArZXhhbXBsZXM6Cj4gPiA+PiArICAtIHwKPiA+ID4+ICsgICAgcGh5QDg5
MDEwMDAgewo+ID4gPj4gKyAgICAgICAgY29tcGF0aWJsZSA9ICJxY29tLHNhODI1NXAtZHdtYWMt
c2dtaWktcGh5IjsKPiA+ID4+ICsgICAgICAgIHJlZyA9IDwweDA4OTAxMDAwIDB4ZTEwPjsKPiA+
ID4+ICsgICAgICAgICNwaHktY2VsbHMgPSA8MD47Cj4gPiA+PiArICAgICAgICBwb3dlci1kb21h
aW5zID0gPCZzY21pN19kdmZzIDA+Owo+ID4gPj4gKyAgICAgICAgcG93ZXItZG9tYWluLW5hbWVz
ID0gInNlcmRlcyI7Cj4gPiA+Cj4gPiA+IEFoLCB0aGlzIHVzZXMgcG93ZXItZG9tYWlucywgd2hp
bGUgdGhlIGV4aXN0aW5nIGJpbmRpbmdzIGZvcgo+ID4gPiBxY29tLHNhODc3NXAtZHdtYWMtc2dt
aWktcGh5IHVzZSBhIGNsb2NrLgo+ID4gPiBJIGd1ZXNzIHRoZSBjbG9jayBpcyB0aGUgY29ycmVj
dCBoYXJkd2FyZSBkZXNjcmlwdGlvbj8KPiA+ID4KPiA+ID4gQWRkaW5nIHRvIG15IGxpc3Qgb2Yg
ZXhhbXBsZXMgZm9yIGJhY2tpbmcgYSBoYXJkd2FyZS10by1TQ01JIHJlbWFwcGluZwo+ID4gPiBk
cml2ZXIuLi4KPiA+ID4KPiA+Cj4gPiBSdXNzZWxsIEtpbmcgYXNrZWQgbWUgdG8gcHV0IHRoZSBQ
SFkgbG9naWMgZm9yIFNDTUkgcG0gZG9tYWlucyBpbnRvIHRoZSBQSFkKPiA+IGRyaXZlciBpbnN0
ZWFkIG9mIHRoZSBNQUMgZHJpdmVyIHdoZXJlIGl0IHdhcyBwcmV2aW91c2x5LiBJbnN0ZWFkIG9m
IGNyYW1taW5nCj4gPiBib3RoIEhMT1MgYW5kIGZpcm13YXJlIGhhbmRsaW5nIGludG8gdGhlIHNh
bWUgZHJpdmVyLCBJIGZpZ3VyZWQgaXQgbWFrZXMgbW9yZQo+ID4gc2Vuc2UgdG8gaGF2ZSBhIGRl
ZGljYXRlZCwgY2xlYW5lciBkcml2ZXIgYXMgdGhlIHR3byBzaGFyZSB2ZXJ5IGxpdHRsZSBjb2Rl
IChpZgo+ID4gYW55KS4KPgo+IEkgdGhpbmsgeW91IGFyZSBtaXhpbmcgdXAgRFQgYmluZGluZ3Mg
YW5kIGRyaXZlciBpbXBsZW1lbnRhdGlvbj8KPgoKQWggaW5kZWVkLCBidXQgdGhlIGJpbmRpbmdz
IGRvbid0IHNoYXJlIGEgbG90IG9mIGNvbnRlbnQgZWl0aGVyLgoKQmFydG9zegpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5n
IGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
