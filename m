Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A1567C57BBD
	for <lists+linux-stm32@lfdr.de>; Thu, 13 Nov 2025 14:41:59 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5CDC4C628D4;
	Thu, 13 Nov 2025 13:41:59 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7B8F7C628B7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Nov 2025 13:41:57 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-5957f0218a1so803010e87.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Nov 2025 05:41:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1763041316; x=1763646116;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e6YFPbYQaXtcm5LdD7/GneIOXBdjWXCgrgn8VVQE3So=;
 b=b7GXZ5YhtTMNOrrJNMv4S6aPeqWO43EETc9m9II7+RDZAQoo6dDcGOCzXA9JtxEdkQ
 yy7el9TlVDhFRob0VpeEjLfk0o8AmXNr2gm6Z7CnQV47sriX52sakYCOwx7/LWxHiw3/
 DrjZUzn5+gh24768Yt7xQIzJctxXt32F2nIpQ/LsXsxy5LfsmFxcKeQm+1ohqUOGqtsu
 1CfV9T5xdXKM4CYtGRqzOtV8t77yQpcw8zdxejdpv5xe+D+O57MEKKZraYr/IG8JuLvB
 x/1ECVFLeGx2CBE8vJvFEXdRwTAqjoDU+OzKSuf+TovhSZNmHbwvMfuXTFqPo3UrFVjb
 t0gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763041316; x=1763646116;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=e6YFPbYQaXtcm5LdD7/GneIOXBdjWXCgrgn8VVQE3So=;
 b=EVkkHu/IsI+Or/TaeOoWYekns6wnlA7sbYDoJJZfQaSzUZyvAyGL77GgcVCaW8W7vU
 XgpGX0ibke7ZISrBHhtSKQITmUNcdZ5HzVh98f/oYT3JCb0n9esteFP0v8V3NaF9aLxm
 YG8WH0Q2S2Wn08DvXs6o2NkjDgfDurodWSnUJgqaVFhP54lgMoEjwASmK5pFxRDOZYX0
 6rUhxXi+RGCczqmJxH32Pz3vK2Bt/qGEG8S8sqybEwNkU2emevBL2BI96bCzNpiWLESw
 ljwD/NDwaAdTkYms38wrAuqC2lA0RrQLC0eKZ/v3dFVMNjzlRepRMLI4PQHZDR3pc7md
 X7MQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+rKIhKt+dBP2mxmC6tupWQPCJ3nX4Izt+4cEg8WEn+AKSTyXSysoMwRFRNrw8ZSDrSbpiUnjRBq6/nw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxxriH0kcePfk/LbxzceOg0V/IoRqi+UQzjsM9CxrkWaszYN7Sp
 5EdFAkz9QtgDRT4wqYh4UHPbngrqANaNh30/W32GtUCb6Zz5SnYyuLN3y61NUIZpqwBX2BtAl4y
 Pl7bA2IQ8NjUpbppytLbsog8ekjOi/cyoxpwuci5QNg==
X-Gm-Gg: ASbGncvvHGf3PAj+p2o2RzJ+rqEKEJkxF5AdY1zC6YLHSt27eXoc9acPc02V07o+saz
 FgKYpkKhlUXJ5NJev/C0m6w79df4wBupBHo69QR/9ITBDewSUkLt2MPcX3q0PZmK4JV9+gsydCi
 S6R7k1FpmxjGXUcdZl8eEKen5/xOEqsLbXMbFUYljTwpyZta3NdQbDyUUVvTdm5N5G9BQdyT1ob
 311KlZakUZfovkvWYGHKGvL7ILb6PjXIicrSxyesb/M1mhUan2E5vLqi6Q7TBi1rBd/X9SASUDs
 WH5iuM2bRw6i2i3s
X-Google-Smtp-Source: AGHT+IGgWlCG9kIv5RM7lpIk9LC7ddziZ8QniI5XBDNtHyHFdpWvdUKYxGgON08x+t3awJ+Cz4M6eIo1aCJcpUc2eyg=
X-Received: by 2002:a05:6512:3c8c:b0:594:2fde:a159 with SMTP id
 2adb3069b0e04-59576e552camr2521011e87.43.1763041316428; Thu, 13 Nov 2025
 05:41:56 -0800 (PST)
MIME-Version: 1.0
References: <20251107-qcom-sa8255p-emac-v5-0-01d3e3aaf388@linaro.org>
 <20251107-qcom-sa8255p-emac-v5-2-01d3e3aaf388@linaro.org>
 <21a3d269-76e6-4da9-aa25-bfd1fb6dfb07@oss.qualcomm.com>
 <CAMRc=MexMn_GSC2EtMek5hDRLjGYA5HKM8ge9vrxw1pYDqPJgw@mail.gmail.com>
 <cd7c0490-a2d6-4885-aa36-ee1492f107b8@oss.qualcomm.com>
In-Reply-To: <cd7c0490-a2d6-4885-aa36-ee1492f107b8@oss.qualcomm.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 13 Nov 2025 14:41:44 +0100
X-Gm-Features: AWmQ_bk13TVZ2MEYPAt7pfoLg7e0lkaPcfsA9km-tpYIh11AXtLgw1MABlXNgK4
Message-ID: <CAMRc=MeuByh=N_-F2+zPiqnh+Qp9u97kiMheLJ-xxcSZSy+_tw@mail.gmail.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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
 Rob Herring <robh@kernel.org>, Drew Fustini <dfustini@tenstorrent.com>,
 Shuang Liang <liangshuang@eswincomputing.com>,
 Samuel Holland <samuel@sholland.org>, sophgo@lists.linux.dev,
 Kevin Hilman <khilman@baylibre.com>, Chen Wang <unicorn_wang@outlook.com>,
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
 "G. Jaya Kumaran" <vineetha.g.jaya.kumaran@intel.com>,
 Shangjuan Wei <weishangjuan@eswincomputing.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Chen-Yu Tsai <wens@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-sunxi@lists.linux.dev,
 linux-mips@vger.kernel.org, Keguang Zhang <keguang.zhang@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Romain Gantois <romain.gantois@bootlin.com>,
 Zhi Li <lizhi2@eswincomputing.com>, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 Vinod Koul <vkoul@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Inochi Amaoto <inochiama@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthew Gerlach <matthew.gerlach@altera.com>,
 "David S. Miller" <davem@davemloft.net>, Fu Wei <wefu@redhat.com>
Subject: Re: [Linux-stm32] [PATCH v5 2/8] net: stmmac: qcom-ethqos: use
	generic device properties
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

T24gVGh1LCBOb3YgMTMsIDIwMjUgYXQgMjozM+KAr1BNIEtvbnJhZCBEeWJjaW8KPGtvbnJhZC5k
eWJjaW9Ab3NzLnF1YWxjb21tLmNvbT4gd3JvdGU6Cj4KPiBPbiAxMS8xMy8yNSAyOjE4IFBNLCBC
YXJ0b3N6IEdvbGFzemV3c2tpIHdyb3RlOgo+ID4gT24gRnJpLCBOb3YgNywgMjAyNSBhdCAxMTo0
OeKAr0FNIEtvbnJhZCBEeWJjaW8KPiA+IDxrb25yYWQuZHliY2lvQG9zcy5xdWFsY29tbS5jb20+
IHdyb3RlOgo+ID4+Cj4gPj4gT24gMTEvNy8yNSAxMToyOSBBTSwgQmFydG9zeiBHb2xhc3pld3Nr
aSB3cm90ZToKPiA+Pj4gRnJvbTogQmFydG9zeiBHb2xhc3pld3NraSA8YmFydG9zei5nb2xhc3pl
d3NraUBsaW5hcm8ub3JnPgo+ID4+Pgo+ID4+PiBJbiBvcmRlciB0byBkcm9wIHRoZSBkZXBlbmRl
bmN5IG9uIENPTkZJR19PRiwgY29udmVydCBhbGwgZGV2aWNlIHByb3BlcnR5Cj4gPj4+IGdldHRl
cnMgZnJvbSBPRi1zcGVjaWZpYyB0byBnZW5lcmljIGRldmljZSBwcm9wZXJ0aWVzIGFuZCBzdG9w
IHB1bGxpbmcKPiA+Pj4gaW4gYW55IGxpbnV4L29mLmggc3ltYm9scy4KPiA+Pj4KPiA+Pj4gU2ln
bmVkLW9mZi1ieTogQmFydG9zeiBHb2xhc3pld3NraSA8YmFydG9zei5nb2xhc3pld3NraUBsaW5h
cm8ub3JnPgo+ID4+PiAtLS0KPiA+Pgo+ID4+IFsuLi5dCj4gPj4KPiA+Pj4gLSAgICAgaWYgKG9m
X3Byb3BlcnR5X3JlYWRfYm9vbChucCwgInNucHMsdHNvIikpCj4gPj4+ICsgICAgIGlmIChkZXZp
Y2VfcHJvcGVydHlfcHJlc2VudChkZXYsICJzbnBzLHRzbyIpKQo+ID4+Cj4gPj4gVGhpcyBpcyBh
IGNoYW5nZSBpbiBiZWhhdmlvciAtICJzbnBzLHRzbyA9IDwwPiIgd291bGQgaGF2ZSBwcmV2aW91
c2x5Cj4gPj4gcmV0dXJuZWQgZmFsc2UsIGl0IG5vdyByZXR1cm5zIHRydWUKPiA+Pgo+ID4KPiA+
IFRoaXMgcHJvcGVydHkgaXMgYSBib29sZWFuIGZsYWcsIGl0IGNhbm5vdCBoYXZlIGEgdmFsdWUu
Cj4KPiBFdmVyeSBEVCBwcm9wZXJ0eSBtYXkgaGF2ZSBhIHZhbHVlLCBzbyB0aGlzIGlzIG5vdCBh
cyBvYnZpb3VzIGFzIHdlJ2QKPiBsaWtlIGl0IHRvIGJlIChJSVVDIC0gdW5sZXNzIHRoYXQgY2hh
bmdlZCByZWNlbnRseSkKPgoKVGhhdCdzIG5ldyB0byBtZS4gSSB0aG91Z2h0IHRoYXQgaWYgYSBw
cm9wZXJ0eSBpcyBhCi9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL2ZsYWcgdGhlbiBv
bmx5IGl0cyBib29sZWFuIGZvcm0gaXMKYWxsb3dlZC4gVGhlIGZhY3QgdGhhdCB0aGUgZHRjIGNh
biBjb21waWxlIGl0IHdpdGggYSB2YWx1ZSBkb2Vzbid0Cm1hdHRlciBhcyB0aGUgYmluZGluZ3Mg
YXJlIHRoZSBoaWdoZXIgYXV0aG9yaXR5IGZvciBEVCBzb3VyY2VzPwoKSSBkb24ndCBtaW5kIGNo
YW5naW5nIGl0IHRvIGRldmljZV9wcm9wZXJ0eV9yZWFkX2Jvb2woKSBidXQgSSdtIG5vdApzdXJl
IGlmIHdlIHJlYWxseSBzaG91bGQuCgpCYXJ0b3N6Cl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0z
MkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
