Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kFlCH9ujsWn4EAAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 11 Mar 2026 18:18:19 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 23CD5267E77
	for <lists+linux-stm32@lfdr.de>; Wed, 11 Mar 2026 18:18:19 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D3FE0C8F26C;
	Wed, 11 Mar 2026 17:18:18 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9C18FC055F4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Mar 2026 17:18:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 423F942E0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Mar 2026 17:18:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28837C2BCB1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Mar 2026 17:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773249496;
 bh=OE84FjPfiUkC8JcC39aOGaWlIrdgv9W7fbDtR0GeE+o=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=iI3/lJ1AQxBpOoKbjorbok0yM+cC5+ZfVtlCq8Wa75WAnPRUVxfTomE36pME1zAr7
 r052TY9iZh0GoCqL2pamDmeFQJSjB2pwhuZY0PdNBAx3SrN2Wzw/lL0dQWtWJkjI9c
 M2uaUbhYwnyiniJnKGa4WDW3lXldtWVxL5/qkk8VN9fA1kKRfUP3DZW7t+N4XIiPnr
 r+c7hYYO3vf6H9EdlqOFqxu0kMl7CUhnoIKMWJ8pNfGLzvitoFUbQoAlOBtjzCJgAc
 xmifdmJI6zK+T5101InfsaE8XXb3060UDCourC3gX1PEgUOWCxj+zVEN5sdEnAnJs9
 zz0luOwBU3p3w==
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-5a0ff30b240so222035e87.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Mar 2026 10:18:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVkxd4BEKZVCWUJEjARznTeRCL/G0oSn0U0UgwwjyxQDZfx50SpMcYYsIcGVPv6A68IZohpDgFkLO7DXw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzkwFf2caVH11HYZFhrCrbeCAt0MMJrMUokWIXyehLXDXXgw2lI
 4DYnipoE32cgtgEG2xvHw+wnjsscoDUGM6chr3t9SbnBkw8DUB4ACi9i3OSDnDP2h02d0cwMrFt
 1O07igb4B6RmN2qm7Z9rQ92K0Tl6zVmQO5VOlzHMNHw==
X-Received: by 2002:a05:651c:1604:b0:38a:957:a125 with SMTP id
 38308e7fff4ca-38a67e1ba60mr11617111fa.18.1773249494042; Wed, 11 Mar 2026
 10:18:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260311-qcom-sa8255p-emac-v8-0-58227bcf1018@oss.qualcomm.com>
 <20260311-qcom-sa8255p-emac-v8-2-58227bcf1018@oss.qualcomm.com>
 <abGizL-uYnahlcEt@shell.armlinux.org.uk>
In-Reply-To: <abGizL-uYnahlcEt@shell.armlinux.org.uk>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Wed, 11 Mar 2026 18:18:00 +0100
X-Gmail-Original-Message-ID: <CAMRc=MdOXz6a4+-xNfmHD9insd+UcyF9xvZim7DtptKOj9B70Q@mail.gmail.com>
X-Gm-Features: AaiRm52Tw2Qo9qa62t56mCoewk4vwmQ4zN4g67WY5ySxyBb-ueDnRqCKEIOABSM
Message-ID: <CAMRc=MdOXz6a4+-xNfmHD9insd+UcyF9xvZim7DtptKOj9B70Q@mail.gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: imx@lists.linux.dev, s32@nxp.com,
 Geert Uytterhoeven <geert+renesas@glider.be>, Radu Rendec <rrendec@redhat.com>,
 linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
 linux-amlogic@lists.infradead.org, linux-riscv@lists.infradead.org,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Jerome Brunet <jbrunet@baylibre.com>, Rob Herring <robh@kernel.org>,
 Drew Fustini <dfustini@tenstorrent.com>,
 Romain Gantois <romain.gantois@bootlin.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Magnus Damm <magnus.damm@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-rockchip@lists.infradead.org, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Konrad Dybcio <konradybcio@kernel.org>,
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 Jan Petrous <jan.petrous@oss.nxp.com>, Maxime Ripard <mripard@kernel.org>,
 linux-mips@vger.kernel.org, sophgo@lists.linux.dev,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Chen-Yu Tsai <wens@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 linux-renesas-soc@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 Vinod Koul <vkoul@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next v8 2/6] net: stmmac: qcom-ethqos:
 use generic device properties
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
X-Spamd-Result: default: False [4.89 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux@armlinux.org.uk,m:imx@lists.linux.dev,m:s32@nxp.com,m:geert+renesas@glider.be,m:rrendec@redhat.com,m:linux-kernel@vger.kernel.org,m:edumazet@google.com,m:linux-amlogic@lists.infradead.org,m:linux-riscv@lists.infradead.org,m:festevam@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:jbrunet@baylibre.com,m:robh@kernel.org,m:dfustini@tenstorrent.com,m:romain.gantois@bootlin.com,m:khilman@baylibre.com,m:bartosz.golaszewski@oss.qualcomm.com,m:magnus.damm@gmail.com,m:jernej.skrabec@gmail.com,m:linux-rockchip@lists.infradead.org,m:kuba@kernel.org,m:pabeni@redhat.com,m:konradybcio@kernel.org,m:linux-sunxi@lists.linux.dev,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:jan.petrous@oss.nxp.com,m:mripard@kernel.org,m:linux-mips@vger.kernel.org,m:sophgo@lists.linux.dev,m:peppe.cavallaro@st.com,m:wens@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:neil.armstrong@linaro.org,m:netdev@vger.kernel.org,m:andersson@kernel.o
 rg,m:bartosz.golaszewski@linaro.org,m:christophe.roullier@foss.st.com,m:linux-renesas-soc@vger.kernel.org,m:andrew+netdev@lunn.ch,m:vkoul@kernel.org,m:mcoquelin.stm32@gmail.com,m:krzk+dt@kernel.org,m:shawnguo@kernel.org,m:davem@davemloft.net,m:geert@glider.be,m:magnusdamm@gmail.com,m:jernejskrabec@gmail.com,m:conor@kernel.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[brgl@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[46];
	FREEMAIL_CC(0.00)[lists.linux.dev,nxp.com,glider.be,redhat.com,vger.kernel.org,google.com,lists.infradead.org,gmail.com,st-md-mailman.stormreply.com,baylibre.com,kernel.org,tenstorrent.com,bootlin.com,oss.qualcomm.com,oss.nxp.com,st.com,linaro.org,foss.st.com,lunn.ch,davemloft.net];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[kernel.org:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-stm32,renesas,dt,netdev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,qualcomm.com:email,linaro.org:email,stormreply.com:email,stormreply.com:url,stm-ict-prod-mailman-01.stormreply.prv:helo,armlinux.org.uk:email]
X-Rspamd-Queue-Id: 23CD5267E77
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gV2VkLCBNYXIgMTEsIDIwMjYgYXQgNjoxNOKAr1BNIFJ1c3NlbGwgS2luZyAoT3JhY2xlKQo8
bGludXhAYXJtbGludXgub3JnLnVrPiB3cm90ZToKPgo+IE9uIFdlZCwgTWFyIDExLCAyMDI2IGF0
IDA2OjAzOjM3UE0gKzAxMDAsIEJhcnRvc3ogR29sYXN6ZXdza2kgd3JvdGU6Cj4gPiBGcm9tOiBC
YXJ0b3N6IEdvbGFzemV3c2tpIDxiYXJ0b3N6LmdvbGFzemV3c2tpQGxpbmFyby5vcmc+Cj4gPgo+
ID4gSW4gb3JkZXIgdG8gZHJvcCB0aGUgZGVwZW5kZW5jeSBvbiBDT05GSUdfT0YsIGNvbnZlcnQg
YWxsIGRldmljZSBwcm9wZXJ0eQo+ID4gZ2V0dGVycyBmcm9tIE9GLXNwZWNpZmljIHRvIGdlbmVy
aWMgZGV2aWNlIHByb3BlcnRpZXMgYW5kIHN0b3AgcHVsbGluZwo+ID4gaW4gYW55IGxpbnV4L29m
Lmggc3ltYm9scy4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBCYXJ0b3N6IEdvbGFzemV3c2tpIDxi
YXJ0b3N6LmdvbGFzemV3c2tpQGxpbmFyby5vcmc+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBCYXJ0b3N6
IEdvbGFzemV3c2tpIDxiYXJ0b3N6LmdvbGFzemV3c2tpQG9zcy5xdWFsY29tbS5jb20+Cj4KPiBQ
bGVhc2UgcG9zdHBvbmUgdGhpcyBmb3IgdGhlIHRpbWUgYmVpbmcgLSBJJ20gdHJ5aW5nIHRvIGdl
dCBzdG1tYWMncwo+IHBhaW4taW4tdGhlLWFyc2UgUENTIHN1cHBvcnQgc29ydGVkLCBhbmQgSSd2
ZSBwYXRjaCBzZXJpZXMgb3V0IHRoZXJlCj4gYW5kIHBlbmRpbmcgdGhhdCBtYWtlIGEgbGFyZ2Ug
bnVtYmVyIG9mIGNoYW5nZXMgdG8gdGhpcyBkcml2ZXIuIFRoaXMKPiBpcyBsaWtlbHkgdG8gY29u
ZmxpY3Qgd2l0aCBteSB3b3JrLgo+Cj4gSSdtIGxpbWl0ZWQgYnkgdGhlIHJhdGUgYXQgd2hpY2gg
cGF0Y2hlcyBjYW4gYmUgYXBwbGllZCB0byBuZXQtbmV4dAo+IGFuZCB0aGUgcmF0ZSBhdCB3aGlj
aCBNb2hkIGNhbiBwcm92aWRlIG1lIGZlZWRiYWNrLiBPbiB0aGF0LCBJIG5vdGljZQo+IHlvdSBo
YXZlbid0IENjJ2QgTW9oZCB3aG8gaXMgbm93IGluIE1BSU5UQUlORVJTIGZvciBxY29tLWV0aHFv
cy4KPgoKRG8gdGhlc2UgdHdvIGNoYW5nZXNldHMgaW50ZXJhY3Qgd2l0aCBlYWNoIG90aGVyIGEg
bG90PyBEbyB5b3UgaGF2ZSBhCldJUCBicmFuY2ggSSBjb3VsZCB0YWtlIGEgbG9vayBhdD8gVGhp
cyBoYXMgYmVlbiBwb3N0LXBvbmVkIHNldmVyYWwKdGltZXMgYWxyZWFkeSwgdGhlcmUgYWx3YXlz
IHNlZW0gdG8gYmUgc29tZSBuZXcgY2hhbmdlcyBjb21pbmcgaW4uIDovCgpCYXJ0Cl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxp
bmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8v
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMy
Cg==
