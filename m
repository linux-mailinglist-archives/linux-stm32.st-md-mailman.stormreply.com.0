Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E6805C57ADF
	for <lists+linux-stm32@lfdr.de>; Thu, 13 Nov 2025 14:34:04 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AFCA4C628D4;
	Thu, 13 Nov 2025 13:34:04 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 38541C628B7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Nov 2025 13:34:03 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-5943d1d0656so1242992e87.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Nov 2025 05:34:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1763040842; x=1763645642;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YsN4YM2OD91GPnt+6/gPAgCxZS5BYL1HgW1NfsOpFuY=;
 b=L6kpYAxQqqAuUREpEQtQK4laUNX+kG+Hj2zS2alro/O/0nWK8sy/ejCU9fsfSLIOpo
 ZSjI1wP9ZhwjwUWcpvmLkAtvSBrdo4E46HG6LseVroeyIQNPwKfsWs7yNxdDTP+BUfuU
 AAsSS0Vn4EmyhlqW6ftMdHywHZxwzCN+Gh6+4AVriq7/tIpOrXN9tM3HwBKje7MZ2KXp
 XRNy73VFQ9CjmDd3974mXHMVkUO/DT038jP7ZT9hW7fvxkQYV+/ult2p11GEwAZrhZoq
 MzYY7Mo0yucOAxcqB1v9pH0Ggc8CYXhPzDnGzmyXs+Dq1shICxOVq6ywLHYUdcCTawuM
 Ag+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763040842; x=1763645642;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=YsN4YM2OD91GPnt+6/gPAgCxZS5BYL1HgW1NfsOpFuY=;
 b=kK3DTiulGFNo8/0oFZ3UhQT3l+EaGDU8z5ot2vqL1HeTfLsqAVG9lSPPnJpR0AqcMq
 rypc9cDa6D9pQIgbGfylWqqmHJ+t/LRTQ+ynlLPOE0pBXc5BCT7mS/dkPBavLoMrUV7i
 eRMx84QNHScE+heBwjymqXvn8EkfXS2xce3JYHc31kLdkx2PWANiDpUYzJFHr/iGkeb+
 21KWzDh699GRk90zR9ZqRk5x9VPthdo012NXCKsGC/p7bzvUYyi5T8pfsebw7yenCyiV
 SKXlG0vlQok1mFs0SK/2pCZrN5lWOK/wxEOgkLUMnvsO5XxEn+dK30P44amjPmvfW/Hg
 O1rQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVa6qRydqYibBdJfhFb45iOVSBnGq1kP6YlMU31n31DsNHpquDEhn5H2Pchwu3BozqLDcgVJF/5x3+YDg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxkvMrr/W/2VaLEsyxywQpIvMkWcZmpIirYGlUQ7Vqwca2H6ayo
 KrfLRTPHng9Ni//39DzMVDIaJzBp4N9pIvD3xY7DWFt7KdADXW7giY0aw+zdnHTyXUDsQXoUpHU
 CGq/AqVcr3XSAh1xkSG5Wu0KiP9kuLl9kbLJf3HGgwg==
X-Gm-Gg: ASbGncuRVOOxMnOTp2LAcpCxx4bix9eLjM7b5kmI6ql1wrKun6juQYt3hrFsLjVPoSa
 rxNr9Lk5mmgmZYvpg6sKnOWGLPhD5/16+XrPWOy0YWy51ekvaOf+YfB7tj2pqFyA/cLaG3Tw7eh
 uROmqrom+LIjTTf2YQQj3ynbrq6sBublUb62IYiTImL5CP6gYdQqUWsWudNtoUiwyPqgzqK/0iW
 FpBed+6l2gmM4BmQ/NINhTWEmTL9rBk1BoRiYxP9ZA0xrKkN6ZC4tEg9chBKxVgyYllgkcC/9tM
 wmKZgMj3AMaatH5b
X-Google-Smtp-Source: AGHT+IGbk7EKeTNsNxEBH5I9gU0KP7DFoTOQ0KZ1rqq8QfnOf06KK/0zwgmGPB54vhErcQD0MD3GXM8/DDcCgOFKTlQ=
X-Received: by 2002:a05:6512:12c4:b0:595:76d6:26ea with SMTP id
 2adb3069b0e04-59576df8d25mr2057027e87.23.1763040842304; Thu, 13 Nov 2025
 05:34:02 -0800 (PST)
MIME-Version: 1.0
References: <20251107-qcom-sa8255p-emac-v5-0-01d3e3aaf388@linaro.org>
 <20251107-qcom-sa8255p-emac-v5-4-01d3e3aaf388@linaro.org>
 <86df9697-af58-4486-93de-b01df5ba13a6@oss.qualcomm.com>
In-Reply-To: <86df9697-af58-4486-93de-b01df5ba13a6@oss.qualcomm.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 13 Nov 2025 14:33:48 +0100
X-Gm-Features: AWmQ_bmy5PXcBPeRnFHjyddkz8qETTfAAx4qoRDDnDLUNs7204p7vqOqHs_5gtY
Message-ID: <CAMRc=MfMQ3P-BK239953S9sTAe1_qSc_miWEFDNu83frE3aSqA@mail.gmail.com>
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
Subject: Re: [Linux-stm32] [PATCH v5 4/8] net: stmmac: qcom-ethqos: wrap
 emac driver data in additional structure
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

T24gRnJpLCBOb3YgNywgMjAyNSBhdCAxMTo1NOKAr0FNIEtvbnJhZCBEeWJjaW8KPGtvbnJhZC5k
eWJjaW9Ab3NzLnF1YWxjb21tLmNvbT4gd3JvdGU6Cj4KPiBPbiAxMS83LzI1IDExOjI5IEFNLCBC
YXJ0b3N6IEdvbGFzemV3c2tpIHdyb3RlOgo+ID4gRnJvbTogQmFydG9zeiBHb2xhc3pld3NraSA8
YmFydG9zei5nb2xhc3pld3NraUBsaW5hcm8ub3JnPgo+ID4KPiA+IEFzIHRoZSBmaXJzdCBzdGVw
IGluIGVuYWJsaW5nIHBvd2VyIGRvbWFpbiBzdXBwb3J0IGluIHRoZSBkcml2ZXIsIHdlJ2xsCj4g
PiBzcGxpdCB0aGUgZGV2aWNlIG1hdGNoIGRhdGEgYW5kIHJ1bnRpbWUgZGF0YSBzdHJ1Y3R1cmVz
IGludG8gdGhlaXIKPiA+IGdlbmVyYWwgYW5kIHBvd2VyLW1hbmFnZW1lbnQtc3BlY2lmaWMgcGFy
dHMuIFRvIGFsbG93IHRoYXQ6IGZpcnN0IHdyYXAKPiA+IHRoZSBlbWFjIGRyaXZlciBkYXRhIGlu
IGFub3RoZXIgbGF5ZXIgd2hpY2ggd2lsbCBsYXRlciBiZSBleHBhbmRlZC4KPiA+Cj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBCYXJ0b3N6IEdvbGFzemV3c2tpIDxiYXJ0b3N6LmdvbGFzemV3c2tpQGxpbmFy
by5vcmc+Cj4gPiAtLS0KPgo+IFsuLi5dCj4KPiA+ICBzdGF0aWMgaW50IHFjb21fZXRocW9zX3By
b2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gPiAgewo+ID4gLSAgICAgY29uc3Qg
c3RydWN0IGV0aHFvc19lbWFjX2RyaXZlcl9kYXRhICpkYXRhOwo+ID4gKyAgICAgY29uc3Qgc3Ry
dWN0IGV0aHFvc19lbWFjX2RyaXZlcl9kYXRhICpkcnZfZGF0YTsKPiA+ICsgICAgIGNvbnN0IHN0
cnVjdCBldGhxb3NfZW1hY19tYXRjaF9kYXRhICpkYXRhOz4gICAgIHN0cnVjdCBwbGF0X3N0bW1h
Y2VuZXRfZGF0YSAqcGxhdF9kYXQ7Cj4gPiAgICAgICBzdHJ1Y3Qgc3RtbWFjX3Jlc291cmNlcyBz
dG1tYWNfcmVzOwo+ID4gICAgICAgc3RydWN0IGRldmljZSAqZGV2ID0gJnBkZXYtPmRldjsKPiA+
IEBAIC04MDEsMTMgKzgyMiwxNSBAQCBzdGF0aWMgaW50IHFjb21fZXRocW9zX3Byb2JlKHN0cnVj
dCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gPiAgICAgICBldGhxb3MtPm1hY19iYXNlID0gc3Rt
bWFjX3Jlcy5hZGRyOwo+ID4KPiA+ICAgICAgIGRhdGEgPSBkZXZpY2VfZ2V0X21hdGNoX2RhdGEo
ZGV2KTsKPgo+IFRoaXMgY2hhbmdlIGNvdWxkIGJlIG1hZGUgbXVjaCBzbWFsbGVyIGlmIHlvdSBr
ZXB0IGEgZHJ2X2RhdGEKPiBwb2ludGVyIG5hbWVkICdkYXRhJyBhbmQgY2FsbGVkIHRoZSBuZXcg
b25lIG1hdGNoX2RhdGEKPgoKSSBwcmVmZXIgdG8gbWFrZSBhIGNsZWFyIGRpc3RpbmN0aW9uIGJl
dHdlZW4gdGhlIHR3by4KCkJhcnQKCj4gYnV0IEkgZG9uJ3QgcmVhbGx5IGNhcmUgZWl0aGVyIHdh
eQo+Cj4gUmV2aWV3ZWQtYnk6IEtvbnJhZCBEeWJjaW8gPGtvbnJhZC5keWJjaW9Ab3NzLnF1YWxj
b21tLmNvbT4KPgo+IEtvbnJhZApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20v
bWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
