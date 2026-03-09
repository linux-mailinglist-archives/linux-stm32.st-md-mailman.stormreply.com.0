Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gF9mN0CHrmnKFgIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 09 Mar 2026 09:39:28 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F56235909
	for <lists+linux-stm32@lfdr.de>; Mon, 09 Mar 2026 09:39:27 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 766BCC8F27F;
	Mon,  9 Mar 2026 08:39:27 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 971F4C01FB5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Mar 2026 08:39:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 31A1C44585
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Mar 2026 08:39:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08F40C2BCB4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Mar 2026 08:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773045565;
 bh=lmhRRii9BO7pCks+UXBWncpJDHHvOFHDr/1FU5tS2Dc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=WdSRqv1l9cnLKSFLHhILKBputV3GcYJKALfpBY1JSeYsV8M2DTVAhXvGnFdMIUBoZ
 u1TTqUSFnSchtsJAGRsbe75vRgVGaAhmdhg9HvU74esJIPW2495NanSULupwyeW7PT
 YaCc04FUEFJ+TnyCI7vwqSgqNgUE6uYG7kXhpWsNzBlH62LL0sdi5KV24INW7HWTMS
 DaLkZNI+2flGr4fHuiuuvSJz9dW2rJ7bAYkCMV+MUG0PEE3Cta9uzSWVAyA4AxTN5y
 +F2ndD2lKnvgeVQlJCtt8r0Do8bYMPx5sz1Wz+M9150u6O8SAJpB7oeuzYGd3EgwS/
 7SEvsU49k0Ckw==
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-38a4118c4f7so32324111fa.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 09 Mar 2026 01:39:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXcAqA1Tn/f5Q/PHPI3SYn+K1pF/Cmpk3G7NchzviwJb2p2H5Go6pc0tf1G/KItW3mTLgXbeWY7eqxZBQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwnaxN9KgWoXFTDh+epDw7zbBJE+8GF1H+SCWWMW/bjNo5H6OhW
 O+m47T3Z4Uvv2/p9YuLTzxmKrZ2NGFNfE2aVqeLY7JrbbRrJmKGjSoW/Wp4Ax5OnTAxZa5z0PwT
 qMs07SyiQH0yIUiQD6Argw/dEAbVMz8BeCSKIzX/+Yg==
X-Received: by 2002:a05:651c:892:b0:38a:b18:f41e with SMTP id
 38308e7fff4ca-38a40b4bca5mr35053151fa.6.1773045562416; Mon, 09 Mar 2026
 01:39:22 -0700 (PDT)
MIME-Version: 1.0
References: <20260306-qcom-sa8255p-emac-v7-0-d6a3013094b7@oss.qualcomm.com>
 <20260306-qcom-sa8255p-emac-v7-1-d6a3013094b7@oss.qualcomm.com>
 <20260307-boisterous-tuscan-rat-1eb9bb@quoll>
In-Reply-To: <20260307-boisterous-tuscan-rat-1eb9bb@quoll>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Mon, 9 Mar 2026 09:39:10 +0100
X-Gmail-Original-Message-ID: <CAMRc=MeeHP_ZjhOHu5NNLCU6Cg59EAWQAS0JngEHDQkmcDH3HQ@mail.gmail.com>
X-Gm-Features: AaiRm50wcU1Efh35HOluVCqu3-5afwUUXiIKPiOPr6mPL4PpMSQ1J-X9POGllS8
Message-ID: <CAMRc=MeeHP_ZjhOHu5NNLCU6Cg59EAWQAS0JngEHDQkmcDH3HQ@mail.gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
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
Subject: Re: [Linux-stm32] [PATCH net-next v7 1/7] dt-bindings: net: qcom:
 document the ethqos device for SCMI-based systems
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
X-Rspamd-Queue-Id: 36F56235909
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
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:fustini@kernel.org,m:s32@nxp.com,m:heiko@sntech.de,m:geert+renesas@glider.be,m:imx@lists.linux.dev,m:Frank.Li@nxp.com,m:christophe.roullier@foss.st.com,m:swathi.ks@samsung.com,m:edumazet@google.com,m:netdev@vger.kernel.org,m:guoren@kernel.org,m:nobuhiro.iwamatsu.x90@mail.toshiba,m:linux-amlogic@lists.infradead.org,m:shawnguo@kernel.org,m:linux-riscv@lists.infradead.org,m:festevam@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:jbrunet@baylibre.com,m:bartosz.golaszewski@linaro.org,m:robh@kernel.org,m:mohd.anwar@oss.qualcomm.com,m:liangshuang@eswincomputing.com,m:samuel@sholland.org,m:sophgo@lists.linux.dev,m:khilman@baylibre.com,m:unicorn_wang@outlook.com,m:bartosz.golaszewski@oss.qualcomm.com,m:magnus.damm@gmail.com,m:jernej.skrabec@gmail.com,m:linux-rockchip@lists.infradead.org,m:joabreu@synopsys.com,m:xiaoning.wang@nxp.com,m:linux-imx@nxp.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:konradybcio@kernel.org,m:s.hauer@pengutronix.de,m
 :devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:kernel@esmil.dk,m:kernel@pengutronix.de,m:samin.guo@starfivetech.com,m:martin.blumenstingl@googlemail.com,m:linux-arm-msm@vger.kernel.org,m:richardcochran@gmail.com,m:david.wu@rock-chips.com,m:jan.petrous@oss.nxp.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:mripard@kernel.org,m:minda.chen@starfivetech.com,m:dfustini@tenstorrent.com,m:vineetha.g.jaya.kumaran@intel.com,m:weishangjuan@eswincomputing.com,m:peppe.cavallaro@st.com,m:wens@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:neil.armstrong@linaro.org,m:linux-sunxi@lists.linux.dev,m:linux-mips@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:keguang.zhang@gmail.com,m:andersson@kernel.org,m:romain.gantois@bootlin.com,m:lizhi2@eswincomputing.com,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:andrew+netdev@lunn.ch,m:vkoul@kernel.org,m:mcoquelin.stm32@gmail.com,m:inochiama@gmail.com,m:krzk+dt@kernel.org,m:matthew.gerlach@altera.com,m:davem@daveml
 oft.net,m:wefu@redhat.com,m:geert@glider.be,s:lists@lfdr.de];
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
	RCPT_COUNT_GT_50(0.00)[75];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	TAGGED_RCPT(0.00)[linux-stm32,renesas,dt,netdev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,linaro.org:email,stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Action: no action

T24gU2F0LCBNYXIgNywgMjAyNiBhdCAxMToyNeKAr0FNIEtyenlzenRvZiBLb3psb3dza2kgPGty
emtAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBGcmksIE1hciAwNiwgMjAyNiBhdCAwNDo0Njoz
OVBNICswMTAwLCBCYXJ0b3N6IEdvbGFzemV3c2tpIHdyb3RlOgo+ID4gRnJvbTogQmFydG9zeiBH
b2xhc3pld3NraSA8YmFydG9zei5nb2xhc3pld3NraUBsaW5hcm8ub3JnPgo+ID4KPiA+IERlc2Ny
aWJlIHRoZSBmaXJtd2FyZS1tYW5hZ2VkIHZhcmlhbnQgb2YgdGhlIFFDb20gRGVzaWduV2FyZSBN
QUMuIEFzIHRoZQo+ID4gcHJvcGVydGllcyBoZXJlIGRpZmZlciBhIGxvdCBmcm9tIHRoZSBITE9T
LW1hbmFnZWQgdmFyaWFudCwgbGV0cyBwdXQgaXQKPiA+IGluIGEgc2VwYXJhdGUgZmlsZS4gU2lu
Y2Ugd2UgbmVlZCB0byB1cGRhdGUgdGhlIG1heGltdW0gbnVtYmVyIG9mIHBvd2VyCj4gPiBkb21h
aW5zLCBsZXQncyB1cGRhdGUgZXhpc3RpbmcgYmluZGluZ3MgcmVmZXJlbmNpbmcgdGhlIHRvcC1s
ZXZlbAo+ID4gc25wcyxkd21hYy55YW1sIGFuZCBsaW1pdCB0aGVpciBtYXhJdGVtcyBmb3IgcG93
ZXItZG9tYWlucyB0byAxLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEJhcnRvc3ogR29sYXN6ZXdz
a2kgPGJhcnRvc3ouZ29sYXN6ZXdza2lAbGluYXJvLm9yZz4KPiA+IFJldmlld2VkLWJ5OiBSb21h
aW4gR2FudG9pcyA8cm9tYWluLmdhbnRvaXNAYm9vdGxpbi5jb20+ICMgRm9yIFJaL04xCj4KPiBD
YW4gd2UgZHJvcCBoYWxmLWJha2VkIHJldmlld3M/IFJldmlld2luZyBvbmx5IHRoYXQgcGllY2Ug
aXMgbm90IGV2ZW4KPiBwb3NzaWJsZSwgYmVjYXVzZSBpdCBtYWtlcyBubyBzZW5zZSBvdXRzaWRl
IG9mIG1haW4gY2hhbmdlIGNvbnRleHQuIElPVywKPiBpdCdzIHBvaW50bGVzcyByZXZpZXcgb2Yg
bm90aGluZywgaWYgeW91IGRvIG5vdCBhY3R1YWxseSByZXZpZXcgdGhlIG1haW4KPiBjaGFuZ2Ug
aW1wYWN0aW5nIFJaL04xLgo+CgpUaGlzIGlzIHRoZSBmaXJzdCB0aW1lIEknbSBoZWFyaW5nIHdl
IGNhbid0IHJldmlldyBpbmRpdmlkdWFsIHBhcnRzIG9mCmNoYW5nZXNldHM/IEkgc2VlIHlvdXIg
cG9pbnQgYWJvdXQgdGhpcyBwYXJ0aWN1bGFyIHBhdGNoIGFuZCB0aGUgZmFjdAppdCBvbmx5IG1h
a2VzIHNlbnNlIGFzIGEgd2hvbGUgYnV0IGlzIHRoaXMgdGhlIG9mZmljaWFsIHBvbGljeSBmb3IK
cGFydHMgb2YgbGFyZ2VyIERUUyBwYXRjaGVzPwoKQmFydAoKPiBBbHNvIHN1Ym1pdHRpbmcgcGF0
Y2hlcyBkbyBub3QgcmVhbGx5IGFsbG93IHRvIGFwcGx5IHJldmlld2VyJ3MKPiBzdGF0ZW1lbnQg
b2Ygb3ZlcnNpZ2h0IHRvIGlubHkgcGFydCBvZiB0aGUgcGF0Y2guCj4KPiBJdCdzIGNhbGxlZCBB
Y2sgdGhlbi4gVXNlIHByb3BlciB0YWdzIGlmIG9uZSBkb2VzIG5vdCBhY3R1YWxseSByZXZpZXcK
PiB0aGUgcGF0Y2guCj4KCkkgbmVlZCB0byByZXNlbmQgYW55d2F5IHNvIEknbGwgZHJvcCBpdC4g
SSBtYXkgYWxzbyBkcm9wIHRoZSB0d28KaHVuZHJlZCBhZGRyZXNzZXMgZnJvbSBDYyBiNCBhZGRl
ZC4gOikKCkJhcnQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4v
bGlzdGluZm8vbGludXgtc3RtMzIK
