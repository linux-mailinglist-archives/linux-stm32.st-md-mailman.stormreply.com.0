Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CEDiBAyYQ2pzcwoAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Jun 2026 12:18:52 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 879B46E2BB5
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Jun 2026 12:18:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3AC57C8F261;
	Tue, 30 Jun 2026 10:18:51 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 39972C7A832
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Jun 2026 10:18:50 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-6983f5c1c52so5377202a12.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Jun 2026 03:18:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782814729; x=1783419529;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=u+1GiMffsMJvBdu44BU50jfVnBubjZ5dimn//DJ5+Rg=;
 b=eQbIETwQoauzw7y+h2M49JMQThmmsmfNgjPZMF+gQWB+djSDyD1OANSM2WLk01Bpl7
 LlAbi1TUA2vCJR0kgC1RCjeiWUJg/hAQtcBxX+khoVtOfAgM/T9ibEEqhwRR0jdfhbOf
 A7vH8vk3ajI8Flxvw2SBym5IktS+gllxJNlRDf9+D+Hw3msWnirAK/JEz19xs5Gjlx3G
 tzv24xvMgCs3zurwgIr3tZ99ITWlZ+xzB/KZirnWaOeuJpwcmKJpeoNuDZyhmySAPU8Y
 VUKPvnNEgC4jnQlSJjFpMIj1d9xdfA+aBa8ogz3SdyZymwPG1PNPnQFPirrDTKMvlZZ9
 WCrA==
X-Forwarded-Encrypted: i=1;
 AHgh+RpsjqVAhZhou+EoUeGEOqnudsQ4lahhoaYL896RE60uRgoiByjEbeo7HkOErKiudKqCEd1sp/4RMCfOCA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyuKfFRGaQIB1gjNX3mu8ih0uh7AasxbdF7wiBF/jvSXqAZvfYb
 LNr55HwUKGhmicZSbp4CvTexpFO4PVELiliq45dPJauJy1Q+HrGuJdxVaFiq48jd4Zs=
X-Gm-Gg: AfdE7cnoAkI2cRtpu1/PoLitIGucOrlxQv6fOYnJ94paC7BDQefVknUwJlpfBYlCboU
 oNmMxSo55JzevGofHUSbxpP/cZIeOdkoXCnKrOotKSoYAGeCfMshCg0qydOdG4BX1rIJWDmRanT
 J0G0PmR8suACE55U99iCsSFdBh6/bTlCwyvHgS2edBDfllGZQWuAQaRPFTuUlLXc+8lfY/ijPh7
 QirtwjsmhI+jIhtBO7HTLCv2MS/580gSM6JZg2Dy3cPewaHr8io248l8hQuPaaqWpT9iz/5pRal
 J/QKT40AC7KnE3j2O9m7o+KZYss6s6gl4YnuspFwZkzCRrsoLXAK38tz2x0iRGcZV60oJBrNzEm
 wTpPzCylZhtmq1pbbMkNFUyUybMOlaeHrIURFqTafatRjyqMfp5SPnxDfGKB+L5o8WEYnjDkOFv
 KrCVlusAOp4aHMGl1GDGy7Y1u9BC1jFEDNNJWD+BkPTWiYIEbQeQ==
X-Received: by 2002:a05:6402:3223:b0:695:f580:a66f with SMTP id
 4fb4d7f45d1cf-69879e3e43bmr1292757a12.21.1782814729510; 
 Tue, 30 Jun 2026 03:18:49 -0700 (PDT)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com.
 [209.85.208.48]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6987c93cad7sm962352a12.19.2026.06.30.03.18.48
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jun 2026 03:18:48 -0700 (PDT)
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-693c69b97e7so8293653a12.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Jun 2026 03:18:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AHgh+RoY+BQViyKeKKqbY4KazacnoatIhR8j34Y1s90sIR9ZYQ3vvtZlhTnDzpOvMXqgr5cX6B1lWF2bHozO5A==@st-md-mailman.stormreply.com
X-Received: by 2002:a05:6402:3223:b0:695:f580:a66f with SMTP id
 4fb4d7f45d1cf-69879e3e43bmr1292708a12.21.1782814728107; Tue, 30 Jun 2026
 03:18:48 -0700 (PDT)
MIME-Version: 1.0
References: <20260629-qcom-sa8255p-emac-v11-0-1b7fb95b51f9@oss.qualcomm.com>
 <20260629-qcom-sa8255p-emac-v11-1-1b7fb95b51f9@oss.qualcomm.com>
 <CAMuHMdXen+E-Ai51aWBa_KV9W8Fz2cQPpT-FG_kQ7akhrrYa_A@mail.gmail.com>
 <CAMRc=Me3jaZXiXa1sFXr=8Do4sCd+XN1pKTcWC8-0j78SjCkKA@mail.gmail.com>
 <CAMuHMdVUBgG0EFB16OxHisbxx-sBvDKvBPNZdpyDnmBrnX4ptQ@mail.gmail.com>
 <CAMRc=Meb58KCuLXkNSJwUq6KJUzZv0u49FBA2L4C8Vd3NVo8Cg@mail.gmail.com>
In-Reply-To: <CAMRc=Meb58KCuLXkNSJwUq6KJUzZv0u49FBA2L4C8Vd3NVo8Cg@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 30 Jun 2026 12:18:33 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWAPesQWMR4F_dx5axi6EwL+KfwLUmAyctLuYicaGHrkQ@mail.gmail.com>
X-Gm-Features: AVVi8CfDZI-66BCdudtb8k9h_4xIWUPsPqj5BKaSPsoCDQPTdsJgDTc_K9d7_9w
Message-ID: <CAMuHMdWAPesQWMR4F_dx5axi6EwL+KfwLUmAyctLuYicaGHrkQ@mail.gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>
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
X-Spamd-Result: default: False [2.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lists.linux.dev,nxp.com,redhat.com,vger.kernel.org,google.com,lists.infradead.org,gmail.com,st-md-mailman.stormreply.com,baylibre.com,kernel.org,oss.qualcomm.com,bootlin.com,oss.nxp.com,tenstorrent.com,st.com,linaro.org,foss.st.com,lunn.ch,davemloft.net];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_RECIPIENTS(0.00)[m:brgl@kernel.org,m:imx@lists.linux.dev,m:s32@nxp.com,m:rrendec@redhat.com,m:linux-kernel@vger.kernel.org,m:edumazet@google.com,m:linux-amlogic@lists.infradead.org,m:linux-riscv@lists.infradead.org,m:festevam@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:jbrunet@baylibre.com,m:robh@kernel.org,m:mohd.anwar@oss.qualcomm.com,m:romain.gantois@bootlin.com,m:khilman@baylibre.com,m:bartosz.golaszewski@oss.qualcomm.com,m:magnus.damm@gmail.com,m:jernej.skrabec@gmail.com,m:linux-rockchip@lists.infradead.org,m:kuba@kernel.org,m:pabeni@redhat.com,m:konradybcio@kernel.org,m:linux-sunxi@lists.linux.dev,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:jan.petrous@oss.nxp.com,m:mripard@kernel.org,m:linux-mips@vger.kernel.org,m:dfustini@tenstorrent.com,m:sophgo@lists.linux.dev,m:peppe.cavallaro@st.com,m:wens@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:neil.armstrong@linaro.org,m:netdev@vger.kernel.org,m:andersson@kernel.org
 ,m:bartosz.golaszewski@linaro.org,m:christophe.roullier@foss.st.com,m:linux-renesas-soc@vger.kernel.org,m:andrew+netdev@lunn.ch,m:vkoul@kernel.org,m:mcoquelin.stm32@gmail.com,m:krzk+dt@kernel.org,m:shawnguo@kernel.org,m:davem@davemloft.net,m:magnusdamm@gmail.com,m:jernejskrabec@gmail.com,m:conor@kernel.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[46];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,qualcomm.com:email,linux-m68k.org:from_mime,linux-m68k.org:email,st-md-mailman.stormreply.com:rdns,st-md-mailman.stormreply.com:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 879B46E2BB5

SGkgQmFydG9zeiwKCk9uIE1vbiwgMjkgSnVuIDIwMjYgYXQgMTg6NTQsIEJhcnRvc3ogR29sYXN6
ZXdza2kgPGJyZ2xAa2VybmVsLm9yZz4gd3JvdGU6Cj4gT24gTW9uLCBKdW4gMjksIDIwMjYgYXQg
NDo1OOKAr1BNIEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4ay5vcmc+IHdyb3Rl
Ogo+ID4gT24gTW9uLCAyOSBKdW4gMjAyNiBhdCAxNjowNywgQmFydG9zeiBHb2xhc3pld3NraSA8
YnJnbEBrZXJuZWwub3JnPiB3cm90ZToKPiA+ID4gT24gTW9uLCAyOSBKdW4gMjAyNiAxNTo1MToz
MSArMDIwMCwgR2VlcnQgVXl0dGVyaG9ldmVuCj4gPiA+IDxnZWVydEBsaW51eC1tNjhrLm9yZz4g
c2FpZDoKPiA+ID4gPiBPbiBNb24sIDI5IEp1biAyMDI2IGF0IDEzOjI5LCBCYXJ0b3N6IEdvbGFz
emV3c2tpCj4gPiA+ID4gPGJhcnRvc3ouZ29sYXN6ZXdza2lAb3NzLnF1YWxjb21tLmNvbT4gd3Jv
dGU6Cj4gPiA+ID4+IERlc2NyaWJlIHRoZSBTR01JSS9TZXJEZXMgUEhZIHByZXNlbnQgb24gdGhl
IFF1YWxjb21tIHNhODI1NXAgcGxhdGZvcm1zLgo+ID4gPiA+PiBUaGlzIGlzIGVzc2VudGlhbGx5
IHRoZSBzYW1lIGhhcmR3YXJlIGFzIHNhODc3NXAgcmV2MyBidXQgdGhlIFBIWSBpcwo+ID4gPiA+
PiBtYW5hZ2VkIGJ5IGZpcm13YXJlIG92ZXIgU0NNSS4KPiA+ID4gPgo+ID4gPiA+IFNvIHdoeSBj
YW4ndCBpdCBiZSByZXVzZSB0aGUgRFQgYmluZGluZ3MsIGFuZCBiZSBjb21wYXRpYmxlIHdpdGgK
PiA+ID4gPiBxY29tLHNhODc3NXAtZHdtYWMtc2dtaWktcGh5Pwo+ID4gPiA+Cj4gPiA+ID4+IFNp
Z25lZC1vZmYtYnk6IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJhcnRvc3ouZ29sYXN6ZXdza2lAb3Nz
LnF1YWxjb21tLmNvbT4KPiA+ID4gPgo+ID4gPiA+PiAtLS0gL2Rldi9udWxsCj4gPiA+ID4+ICsr
KyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waHkvcWNvbSxzYTgyNTVwLWR3
bWFjLXNnbWlpLXBoeS55YW1sCj4gPiA+ID4KPiA+ID4gPj4gKyAgcG93ZXItZG9tYWluczoKPiA+
ID4gPj4gKyAgICBtYXhJdGVtczogMQo+ID4gPiA+PiArCj4gPiA+ID4+ICsgIHBvd2VyLWRvbWFp
bi1uYW1lczoKPiA+ID4gPj4gKyAgICBpdGVtczoKPiA+ID4gPj4gKyAgICAgIC0gY29uc3Q6IHNl
cmRlcwo+ID4gPiA+Cj4gPiA+ID4+ICtleGFtcGxlczoKPiA+ID4gPj4gKyAgLSB8Cj4gPiA+ID4+
ICsgICAgcGh5QDg5MDEwMDAgewo+ID4gPiA+PiArICAgICAgICBjb21wYXRpYmxlID0gInFjb20s
c2E4MjU1cC1kd21hYy1zZ21paS1waHkiOwo+ID4gPiA+PiArICAgICAgICByZWcgPSA8MHgwODkw
MTAwMCAweGUxMD47Cj4gPiA+ID4+ICsgICAgICAgICNwaHktY2VsbHMgPSA8MD47Cj4gPiA+ID4+
ICsgICAgICAgIHBvd2VyLWRvbWFpbnMgPSA8JnNjbWk3X2R2ZnMgMD47Cj4gPiA+ID4+ICsgICAg
ICAgIHBvd2VyLWRvbWFpbi1uYW1lcyA9ICJzZXJkZXMiOwo+ID4gPiA+Cj4gPiA+ID4gQWgsIHRo
aXMgdXNlcyBwb3dlci1kb21haW5zLCB3aGlsZSB0aGUgZXhpc3RpbmcgYmluZGluZ3MgZm9yCj4g
PiA+ID4gcWNvbSxzYTg3NzVwLWR3bWFjLXNnbWlpLXBoeSB1c2UgYSBjbG9jay4KPiA+ID4gPiBJ
IGd1ZXNzIHRoZSBjbG9jayBpcyB0aGUgY29ycmVjdCBoYXJkd2FyZSBkZXNjcmlwdGlvbj8KPiA+
ID4gPgo+ID4gPiA+IEFkZGluZyB0byBteSBsaXN0IG9mIGV4YW1wbGVzIGZvciBiYWNraW5nIGEg
aGFyZHdhcmUtdG8tU0NNSSByZW1hcHBpbmcKPiA+ID4gPiBkcml2ZXIuLi4KPiA+ID4gPgo+ID4g
Pgo+ID4gPiBSdXNzZWxsIEtpbmcgYXNrZWQgbWUgdG8gcHV0IHRoZSBQSFkgbG9naWMgZm9yIFND
TUkgcG0gZG9tYWlucyBpbnRvIHRoZSBQSFkKPiA+ID4gZHJpdmVyIGluc3RlYWQgb2YgdGhlIE1B
QyBkcml2ZXIgd2hlcmUgaXQgd2FzIHByZXZpb3VzbHkuIEluc3RlYWQgb2YgY3JhbW1pbmcKPiA+
ID4gYm90aCBITE9TIGFuZCBmaXJtd2FyZSBoYW5kbGluZyBpbnRvIHRoZSBzYW1lIGRyaXZlciwg
SSBmaWd1cmVkIGl0IG1ha2VzIG1vcmUKPiA+ID4gc2Vuc2UgdG8gaGF2ZSBhIGRlZGljYXRlZCwg
Y2xlYW5lciBkcml2ZXIgYXMgdGhlIHR3byBzaGFyZSB2ZXJ5IGxpdHRsZSBjb2RlIChpZgo+ID4g
PiBhbnkpLgo+ID4KPiA+IEkgdGhpbmsgeW91IGFyZSBtaXhpbmcgdXAgRFQgYmluZGluZ3MgYW5k
IGRyaXZlciBpbXBsZW1lbnRhdGlvbj8KPgo+IEFoIGluZGVlZCwgYnV0IHRoZSBiaW5kaW5ncyBk
b24ndCBzaGFyZSBhIGxvdCBvZiBjb250ZW50IGVpdGhlci4KClRoYXQncyB0aGUgKG1haW50ZW5h
bmNlKSBwcm9ibGVtOiBpdCBpcyBlc3NlbnRpYWxseSB0aGUgc2FtZSBoYXJkd2FyZSwKYnV0IHRo
ZSBEVCBiaW5kaW5ncyAoYW5kIGRyaXZlcikgYXJlIGRpZmZlcmVudC4gRG9lcyB0aGlzIHNjYWxl
PwoKR3J7b2V0amUsZWV0aW5nfXMsCgogICAgICAgICAgICAgICAgICAgICAgICBHZWVydAoKLS0g
CkdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIg
LS0gZ2VlcnRAbGludXgtbTY4ay5vcmcKCkluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0
ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQKd2hlbiBJJ20gdGFs
a2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcg
bGlrZSB0aGF0LgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZh
bGRzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXN0bTMyCg==
