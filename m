Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC778ADD99
	for <lists+linux-stm32@lfdr.de>; Tue, 23 Apr 2024 08:44:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BBCABC7128A;
	Tue, 23 Apr 2024 06:44:05 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 78E30C6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Apr 2024 06:44:04 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=ratatoskr.pengutronix.de)
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <s.trumtrar@pengutronix.de>)
 id 1rz9sp-0007P6-Hm; Tue, 23 Apr 2024 08:44:03 +0200
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
To: =?utf-8?Q?S=C3=A9bastien?= Szymanski <sebastien.szymanski@armadeus.com>
In-Reply-To: <f01d49cf-5955-405c-9c2b-05b0c7bb982c@armadeus.com>
 (=?utf-8?Q?=22S=C3=A9bastien?=
 Szymanski"'s message of "Mon, 22 Apr 2024 11:28:08 +0200")
References: <20240422-v6-9-topic-imx93-eqos-rmii-v1-0-30151fca43d2@pengutronix.de>
 <f01d49cf-5955-405c-9c2b-05b0c7bb982c@armadeus.com>
User-Agent: mu4e 1.12.4; emacs 29.3
Date: Tue, 23 Apr 2024 08:43:58 +0200
Message-ID: <87mspkk28h.fsf@pengutronix.de>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.trumtrar@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: imx@lists.linux.dev, Eric Dumazet <edumazet@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Rob Herring <robh@kernel.org>, Jose Abreu <joabreu@synopsys.com>,
 Clark Wang <xiaoning.wang@nxp.com>, Linux Team <linux-imx@nxp.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH 0/3] arm64: mx93: etherrnet: set TX_CLK in
	RMII mode
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

CkhpLAoKT24gMjAyNC0wNC0yMiBhdCAxMToyOCArMDIsIFPDqWJhc3RpZW4gU3p5bWFuc2tpIDxz
ZWJhc3RpZW4uc3p5bWFuc2tpQGFybWFkZXVzLmNvbT4gd3JvdGU6IAogCj4gSGVsbG8sICBPbiA0
LzIyLzI0IDEwOjQ2LCBTdGVmZmVuIFRydW10cmFyIHdyb3RlOiAKPiA+IFRoaXMgc2VyaWVzIGFk
ZHMgc3VwcG9ydCBmb3Igc2V0dGluZyB0aGUgVFhfQ0xLIGRpcmVjdGlvbiBpbiB0aGUgZVFPUyBl
dGhlcm5ldCBjb3JlIG9uIHRoZSBpLk1YOTMgd2hlbiBSTUlJIG1vZGUgaXMgdXNlZC4gIEFjY29y
ZGluZyB0byBBTjE0MTQ5LCB3aGVuIHRoZSBpLk1YOTMgZXRoZXJuZXQgY29udHJvbGxlciBpcyB1
c2VkIGluIFJNSUkgbW9kZSwgdGhlIFRYX0NMSyAqbXVzdCogYmUgc2V0IHRvIG91dHB1dCBtb2Rl
LiAKPiAgTXVzdCA/IEkgZG9uJ3QgdGhpbmsgdGhhdCBpcyB0cnVlLiBEb3duc3RyZWFtIE5YUCBr
ZXJuZWwgaGFzIGFuIG9wdGlvbiB0byBzZXQgVFhfQ0xLIGFzIGFuIGlucHV0OiAKPgoKcmUtcmVh
ZGluZyB0aGF0IHBhc3NhZ2UgYWdhaW4sIGl0IG9ubHkgc2F5cyAib3RoZXIgcmVnaXN0ZXJzIHRo
YXQgbXVzdCBiZSBjb25maWd1cmVkIiBhbmQgdGhhdCB0aGUgRU5FVF9RT1NfQ0xLX1RYX0NMS19T
RUwgYml0ICJpcyAwYjEiIGZvciBSTUlJLiBTbywgbWF5YmUgeW91IGFyZSByaWdodC4gCgoKVGhh
bmtzLApTdGVmZmVuCgo+IGh0dHBzOi8vZ2l0aHViLmNvbS9ueHAtaW14L2xpbnV4LWlteC9ibG9i
L2xmLTYuNi55L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvbnhwJTJDZHdt
YWMtaW14LnlhbWwjTDY5Cj4gCj4gaHR0cHM6Ly9naXRodWIuY29tL254cC1pbXgvbGludXgtaW14
L2NvbW1pdC9mYmMxN2Y2Zjc5MTlkMDNjMjc1ZmM0OGIwNDAwYzIxMjQ3NWI2MGVjCj4gCgotLSAK
UGVuZ3V0cm9uaXggZS5LLiAgICAgICAgICAgICAgICB8IERpcGwuLUluZm9ybS4gU3RlZmZlbiBU
cnVtdHJhciB8ClN0ZXVlcndhbGRlciBTdHIuIDIxICAgICAgICAgICAgfCBodHRwczovL3d3dy5w
ZW5ndXRyb25peC5kZS8gICAgfAozMTEzNyBIaWxkZXNoZWltLCBHZXJtYW55ICAgICAgIHwgUGhv
bmU6ICs0OS01MTIxLTIwNjkxNy0wICAgICAgIHwKQW10c2dlcmljaHQgSGlsZGVzaGVpbSwgSFJB
IDI2ODZ8IEZheDogICArNDktNTEyMS0yMDY5MTctNTU1NSAgICB8Cl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApM
aW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
