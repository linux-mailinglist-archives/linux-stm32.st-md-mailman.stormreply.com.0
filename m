Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qEXZKS7dr2kzdAIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 10 Mar 2026 09:58:22 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 41962247C1B
	for <lists+linux-stm32@lfdr.de>; Tue, 10 Mar 2026 09:58:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DF82DC8F269;
	Tue, 10 Mar 2026 08:58:21 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E134AC32EB0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Mar 2026 08:58:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 9B3B6445B9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Mar 2026 08:58:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FB61C2BCB4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Mar 2026 08:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773133098;
 bh=M6JPfbr9d5IciKIoqHHW920nfQtcVt9K8aP07ynrnlo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=tZDQM11qneSYqNndJJ+rDgCWCXaubztC0EU2cNYNl/DrHnKZ5Laa4TpxPCIr1Tr6A
 PCrDcHv6Dr+xwk0QDncYwcPtzLnCmHNdMwjuU0NrvakPKmAKW7k+3L6nvvlJD0ih2/
 PgVHQ6tQTtVwn6bAzDrJCbfg2qQHfwElUiTysHN8dwnn/Q2Rskunb3ViyCzBvLDBOB
 +gh0Ubvtbj7EF+ns8yNPoWO6SsLO0Wg79q7JFUVqTg9W/ek+Cjtdwq3h7GxILDIGiS
 vgWjY4s7SNRl8FPprWwQ3ndAPjFXStqqRlON74Ufj5u74XwPToW4LvPUfh5TVENmZb
 iWWiL4NaGQI4A==
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-38a3fd333eeso31920591fa.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Mar 2026 01:58:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWSya6NZgBjGv5VcO5hTIqoRaSRn9zXl7Ue06PJHO5DPgye0YML2GbS0V5G3Nykt1Oj+JCCHUyYTk+GTQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw4I+R21sx3P9iZ9kRRce81CIuzpkVfPeatkmQbGXNWFsbMo77Z
 dfhbgCV3jS6ioP/YwlX/HpI0E3wT4464A2yjFJxK/izUuH60vS78G5m/VdwHGpWtayoNQe+ZBTm
 RyRwbRi+dfA8xtUDuB/TR0L0G84t0k+z+M3saRYfAkA==
X-Received: by 2002:a2e:b012:0:b0:389:e2e8:4f4c with SMTP id
 38308e7fff4ca-38a5d05131dmr6527231fa.21.1773133095795; Tue, 10 Mar 2026
 01:58:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260306-qcom-sa8255p-emac-v7-0-d6a3013094b7@oss.qualcomm.com>
 <4728554b256f016d9a5f3e019ed831387b0f059b.camel@redhat.com>
In-Reply-To: <4728554b256f016d9a5f3e019ed831387b0f059b.camel@redhat.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Tue, 10 Mar 2026 09:58:03 +0100
X-Gmail-Original-Message-ID: <CAMRc=Me8pw5ROaopJ8bcon_NGR5TEZdkJL-F4H1-8b-U2FU9GQ@mail.gmail.com>
X-Gm-Features: AaiRm50drSEJRzFk2cE1mtMmfBxUomqwHAi_2o4urYZsnhjuUaH2OaO1HdaVg_g
Message-ID: <CAMRc=Me8pw5ROaopJ8bcon_NGR5TEZdkJL-F4H1-8b-U2FU9GQ@mail.gmail.com>
To: Radu Rendec <rrendec@redhat.com>
Cc: Drew Fustini <fustini@kernel.org>, s32@nxp.com,
 Heiko Stuebner <heiko@sntech.de>, Geert Uytterhoeven <geert+renesas@glider.be>,
 imx@lists.linux.dev, Frank Li <Frank.Li@nxp.com>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Swathi K S <swathi.ks@samsung.com>, Eric Dumazet <edumazet@google.com>,
 netdev@vger.kernel.org, Guo Ren <guoren@kernel.org>,
 Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
 linux-amlogic@lists.infradead.org, Shawn Guo <shawnguo@kernel.org>,
 linux-riscv@lists.infradead.org, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Rob Herring <robh@kernel.org>, Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
 Shuang Liang <liangshuang@eswincomputing.com>,
 Samuel Holland <samuel@sholland.org>, sophgo@lists.linux.dev,
 Kevin Hilman <khilman@baylibre.com>, Chen Wang <unicorn_wang@outlook.com>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Magnus Damm <magnus.damm@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-rockchip@lists.infradead.org, Jose Abreu <joabreu@synopsys.com>,
 Clark Wang <xiaoning.wang@nxp.com>, Linux Team <linux-imx@nxp.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Konrad Dybcio <konradybcio@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Emil Renner Berthing <kernel@esmil.dk>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Samin Guo <samin.guo@starfivetech.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Richard Cochran <richardcochran@gmail.com>,
 David Wu <david.wu@rock-chips.com>, Jan Petrous <jan.petrous@oss.nxp.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Maxime Ripard <mripard@kernel.org>, Minda Chen <minda.chen@starfivetech.com>,
 Drew Fustini <dfustini@tenstorrent.com>,
 "G. Jaya Kumaran" <vineetha.g.jaya.kumaran@intel.com>,
 Shangjuan Wei <weishangjuan@eswincomputing.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Chen-Yu Tsai <wens@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-sunxi@lists.linux.dev,
 linux-mips@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Keguang Zhang <keguang.zhang@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Romain Gantois <romain.gantois@bootlin.com>,
 Zhi Li <lizhi2@eswincomputing.com>, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 Vinod Koul <vkoul@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Inochi Amaoto <inochiama@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthew Gerlach <matthew.gerlach@altera.com>,
 "David S. Miller" <davem@davemloft.net>, Fu Wei <wefu@redhat.com>
Subject: Re: [Linux-stm32] [PATCH net-next v7 0/7] net: stmmac: qcom-ethqos:
 add support for SCMI power domains
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
X-Rspamd-Queue-Id: 41962247C1B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.89 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:rrendec@redhat.com,m:fustini@kernel.org,m:s32@nxp.com,m:heiko@sntech.de,m:geert+renesas@glider.be,m:imx@lists.linux.dev,m:Frank.Li@nxp.com,m:christophe.roullier@foss.st.com,m:swathi.ks@samsung.com,m:edumazet@google.com,m:netdev@vger.kernel.org,m:guoren@kernel.org,m:nobuhiro.iwamatsu.x90@mail.toshiba,m:linux-amlogic@lists.infradead.org,m:shawnguo@kernel.org,m:linux-riscv@lists.infradead.org,m:festevam@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:jbrunet@baylibre.com,m:bartosz.golaszewski@linaro.org,m:robh@kernel.org,m:mohd.anwar@oss.qualcomm.com,m:liangshuang@eswincomputing.com,m:samuel@sholland.org,m:sophgo@lists.linux.dev,m:khilman@baylibre.com,m:unicorn_wang@outlook.com,m:bartosz.golaszewski@oss.qualcomm.com,m:magnus.damm@gmail.com,m:jernej.skrabec@gmail.com,m:linux-rockchip@lists.infradead.org,m:joabreu@synopsys.com,m:xiaoning.wang@nxp.com,m:linux-imx@nxp.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:konradybcio@kernel.org,m:s.hauer@pengutronix.d
 e,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:kernel@esmil.dk,m:kernel@pengutronix.de,m:samin.guo@starfivetech.com,m:martin.blumenstingl@googlemail.com,m:linux-arm-msm@vger.kernel.org,m:richardcochran@gmail.com,m:david.wu@rock-chips.com,m:jan.petrous@oss.nxp.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:mripard@kernel.org,m:minda.chen@starfivetech.com,m:dfustini@tenstorrent.com,m:vineetha.g.jaya.kumaran@intel.com,m:weishangjuan@eswincomputing.com,m:peppe.cavallaro@st.com,m:wens@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:konrad.dybcio@oss.qualcomm.com,m:neil.armstrong@linaro.org,m:linux-sunxi@lists.linux.dev,m:linux-mips@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:keguang.zhang@gmail.com,m:andersson@kernel.org,m:romain.gantois@bootlin.com,m:lizhi2@eswincomputing.com,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:andrew+netdev@lunn.ch,m:vkoul@kernel.org,m:mcoquelin.stm32@gmail.com,m:inochiama@gmail.com,m:krzk+dt@kernel.org,m:matth
 ew.gerlach@altera.com,m:davem@davemloft.net,m:wefu@redhat.com,m:geert@glider.be,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[brgl@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,nxp.com,sntech.de,glider.be,lists.linux.dev,foss.st.com,samsung.com,google.com,vger.kernel.org,mail.toshiba,lists.infradead.org,gmail.com,st-md-mailman.stormreply.com,baylibre.com,linaro.org,oss.qualcomm.com,eswincomputing.com,sholland.org,outlook.com,synopsys.com,redhat.com,pengutronix.de,esmil.dk,starfivetech.com,googlemail.com,rock-chips.com,oss.nxp.com,bp.renesas.com,tenstorrent.com,intel.com,st.com,bootlin.com,lunn.ch,altera.com,davemloft.net];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[kernel.org:-];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCPT_COUNT_GT_50(0.00)[76];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.989];
	TAGGED_RCPT(0.00)[linux-stm32,renesas,dt,netdev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Action: no action

T24gVHVlLCBNYXIgMTAsIDIwMjYgYXQgMjoxMOKAr0FNIFJhZHUgUmVuZGVjIDxycmVuZGVjQHJl
ZGhhdC5jb20+IHdyb3RlOgo+Cj4gT24gRnJpLCAyMDI2LTAzLTA2IGF0IDE2OjQ2ICswMTAwLCBC
YXJ0b3N6IEdvbGFzemV3c2tpIHdyb3RlOgo+ID4gQWRkIHN1cHBvcnQgZm9yIHRoZSBmaXJtd2Fy
ZS1tYW5hZ2VkIHZhcmlhbnQgb2YgdGhlIERlc2lnbldhcmUgTUFDIG9uCj4gPiB0aGUgc2E4MjU1
cCBwbGF0Zm9ybS4gVGhpcyBzZXJpZXMgY29udGFpbnMgbmV3IERUIGJpbmRpbmdzIGFuZCBkcml2
ZXIKPiA+IGNoYW5nZXMgcmVxdWlyZWQgdG8gc3VwcG9ydCB0aGUgTUFDIGluIHRoZSBTVE1NQUMg
ZHJpdmVyLgo+ID4KPiA+IEl0IGFsc28gcmVvcmdhbml6ZXMgdGhlIGV0aHFvcyBjb2RlIHF1aXRl
IGEgYml0IHRvIG1ha2UgdGhlIGludHJvZHVjdGlvbgo+ID4gb2YgcG93ZXIgZG9tYWlucyBpbnRv
IHRoZSBkcml2ZXIgYSBiaXQgZWFzaWVyIG9uIHRoZSBleWUuCj4gPgo+ID4gVGhlIERUUyBjaGFu
Z2VzIHdpbGwgZ28gaW4gc2VwYXJhdGVseS4KPgo+IEFzIEpha3ViIHBvaW50ZWQgb3V0LCBpdCBj
b25mbGljdHMgd2l0aCB0aGUgbGF0ZXN0IG5ldC1uZXh0LCBidXQgZG9lcwo+IGFwcGx5IGNsZWFu
bHkgb24gdGhlIGxhdGVzdCBtYWlubGluZSwgc28gSSB0ZXN0ZWQgdGhlcmUgKG9uIGEgU0E4Nzc1
UAo+IGJvYXJkIHJ1bm5pbmcgdGhlIFNDTUkgZmlybXdhcmUpLgo+Cj4gVGhlIHR3byBOSUNzIGNv
bWUgdXAgYXMgZXhwZWN0ZWQuIEJhc2ljIGlwZXJmMyB0aHJvdWdocHV0IGFuZCBqaXR0ZXIKPiB0
ZXN0cyBsb29rIGdvb2QuIEkgd291bGQgb2ZmZXIgYSBUZXN0ZWQtYnkgdGFnIGFuZCBhIHN1bW1h
cnkgb2YgdGhlCj4gdGVzdCByZXN1bHRzLCBidXQgSSB0aGluayBpdCdzIGEgbW9vdCBwb2ludCBi
ZWNhdXNlIHlvdSdsbCBoYXZlIHRvCj4gc3VibWl0IGEgbmV3IHZlcnNpb24gYW55d2F5Lgo+Cj4g
SSB3aWxsIHdhaXQgZm9yIHlvdSB0byByZWJhc2UsIHRoZW4gdGVzdCBhZ2FpbiBhbmQgY29tZSBi
YWNrIHdpdGggdGhlCj4gcmVzdWx0cy4KPgoKVGhhbmsgeW91IGZvciB0aGUgdGVzdHMuIFRoZSBy
ZXdvcmsgYWZ0ZXIgdGhlIGNoYW5nZXMgdHVybmVkIG91dCB0byBiZQpxdWl0ZSBleHRlbnNpdmUu
IEkgc2hvdWxkIGhhdmUgaXQgcmVhZHkgYnkgdGhlIGVuZCBvZiB0aGUgd2Vlay4gSSB3aWxsCmFw
cHJlY2lhdGUgaWYgeW91IGNvdWxkIHJldGVzdCBpdCBhZ2FpbiBieSB0aGVuIGFuZCBsZWF2ZSB5
b3VyIHRhZy4KCkJhcnQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxt
YW4vbGlzdGluZm8vbGludXgtc3RtMzIK
