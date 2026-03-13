Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2NWiJyHRs2ncbAAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Mar 2026 09:56:01 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D8882800F3
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Mar 2026 09:56:01 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BDCB5C8F29B;
	Fri, 13 Mar 2026 08:56:00 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C62A5C8F299
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Mar 2026 08:55:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id BF6996013C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Mar 2026 08:55:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92A05C2BCB4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Mar 2026 08:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773392158;
 bh=dIPXg2emkEHtVSMn/uiweeN0mkAf0sj6N0jCu1Xxr2I=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=TuNN/sdsSHwP/VHRKKsG1F4YTUS5ZhzO3eF6ZjflRECLSxm52GZn0O+a6DYtw8s9w
 AztRsZ6hwk6mFH9QjMLP6ul2unGjmpkpIqrGCVRM7XJ91lE5qjYrRo421vuqGU+Ips
 dUTvUP2lPwGo6cUpGRPiarN2csB7JvMb0jI/Ci+wBxM0t4CvddwnzhqGPCkq7OZ2uz
 q1FLHibPBhnYDoXHHAzK4gd8xjmC/HbpS/GJkB9AsODxRC/oP9dyHczV035sr3rZQ7
 zhugJAyuq9iyE0d58vLAu0TaPaxVAVMP78UrAtKR75moc4u0qVEPZakARFdazt8gZI
 bL3wWDwmcIB/Q==
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-38a3f6da741so14636161fa.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Mar 2026 01:55:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUxPx9Sf8N48WeJ0FC+MrQZ6yMvChRyay0vkyDW7M0Z4dU/C0BeyMfaAK+DfXNMnGYMiUCZj8yt+uqwhw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxYoUagXdlbm2z10XbF/kHpP4ZqfKD2wqEs9XDECiDcz9FPOi6j
 94HUaw/kSfanpxkn8Xzx6WJ/vIwMnVJDwINt/hZTVhKIg6Wy4w/ayCTDwoCIovhPHiWafY50Rzc
 Q4jjt04M0crMa7HSU/NkRTUJBpgwgtf0LLNV47y9feg==
X-Received: by 2002:a2e:350d:0:b0:38a:878b:b567 with SMTP id
 38308e7fff4ca-38a897de73cmr6682211fa.36.1773392156502; Fri, 13 Mar 2026
 01:55:56 -0700 (PDT)
MIME-Version: 1.0
References: <20260311-qcom-sa8255p-emac-v8-0-58227bcf1018@oss.qualcomm.com>
 <20260312181654.2d9ba69c@kernel.org>
In-Reply-To: <20260312181654.2d9ba69c@kernel.org>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Fri, 13 Mar 2026 09:55:43 +0100
X-Gmail-Original-Message-ID: <CAMRc=Md8i6oCAqOBB_3q9PkkbaUxrCftum+WBjvac2O+Hk8kTg@mail.gmail.com>
X-Gm-Features: AaiRm5311s8a1dkokfIWdxBu9dTaoHy4sXAtnoSYnP4jjneoiOLY-XItyfiRHlE
Message-ID: <CAMRc=Md8i6oCAqOBB_3q9PkkbaUxrCftum+WBjvac2O+Hk8kTg@mail.gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
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
 linux-rockchip@lists.infradead.org, Paolo Abeni <pabeni@redhat.com>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Jan Petrous <jan.petrous@oss.nxp.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Maxime Ripard <mripard@kernel.org>, linux-mips@vger.kernel.org,
 sophgo@lists.linux.dev, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Chen-Yu Tsai <wens@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 netdev@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 linux-renesas-soc@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 Vinod Koul <vkoul@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next v8 0/6] net: stmmac: qcom-ethqos:
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
X-Spamd-Result: default: False [4.89 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:kuba@kernel.org,m:imx@lists.linux.dev,m:s32@nxp.com,m:geert+renesas@glider.be,m:rrendec@redhat.com,m:linux-kernel@vger.kernel.org,m:edumazet@google.com,m:linux-amlogic@lists.infradead.org,m:linux-riscv@lists.infradead.org,m:festevam@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:jbrunet@baylibre.com,m:robh@kernel.org,m:dfustini@tenstorrent.com,m:romain.gantois@bootlin.com,m:khilman@baylibre.com,m:bartosz.golaszewski@oss.qualcomm.com,m:magnus.damm@gmail.com,m:jernej.skrabec@gmail.com,m:linux-rockchip@lists.infradead.org,m:pabeni@redhat.com,m:konradybcio@kernel.org,m:linux-sunxi@lists.linux.dev,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:martin.blumenstingl@googlemail.com,m:linux-arm-msm@vger.kernel.org,m:jan.petrous@oss.nxp.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:mripard@kernel.org,m:linux-mips@vger.kernel.org,m:sophgo@lists.linux.dev,m:peppe.cavallaro@st.com,m:wens@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:konrad.dybcio@os
 s.qualcomm.com,m:neil.armstrong@linaro.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:netdev@vger.kernel.org,m:andersson@kernel.org,m:bartosz.golaszewski@linaro.org,m:christophe.roullier@foss.st.com,m:linux-renesas-soc@vger.kernel.org,m:andrew+netdev@lunn.ch,m:vkoul@kernel.org,m:mcoquelin.stm32@gmail.com,m:krzk+dt@kernel.org,m:shawnguo@kernel.org,m:davem@davemloft.net,m:geert@glider.be,m:magnusdamm@gmail.com,m:jernejskrabec@gmail.com,m:conor@kernel.org,m:martinblumenstingl@gmail.com,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[brgl@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[49];
	FREEMAIL_CC(0.00)[lists.linux.dev,nxp.com,glider.be,redhat.com,vger.kernel.org,google.com,lists.infradead.org,gmail.com,st-md-mailman.stormreply.com,baylibre.com,kernel.org,tenstorrent.com,bootlin.com,oss.qualcomm.com,googlemail.com,oss.nxp.com,bp.renesas.com,st.com,linaro.org,foss.st.com,lunn.ch,davemloft.net];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 1D8882800F3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gRnJpLCBNYXIgMTMsIDIwMjYgYXQgMjoxNuKAr0FNIEpha3ViIEtpY2luc2tpIDxrdWJhQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gV2VkLCAxMSBNYXIgMjAyNiAxODowMzozNSArMDEwMCBC
YXJ0b3N6IEdvbGFzemV3c2tpIHdyb3RlOgo+ID4gQWRkIHN1cHBvcnQgZm9yIHRoZSBmaXJtd2Fy
ZS1tYW5hZ2VkIHZhcmlhbnQgb2YgdGhlIERlc2lnbldhcmUgTUFDIG9uCj4gPiB0aGUgc2E4MjU1
cCBwbGF0Zm9ybS4gVGhpcyBzZXJpZXMgY29udGFpbnMgbmV3IERUIGJpbmRpbmdzIGFuZCBkcml2
ZXIKPiA+IGNoYW5nZXMgcmVxdWlyZWQgdG8gc3VwcG9ydCB0aGUgTUFDIGluIHRoZSBTVE1NQUMg
ZHJpdmVyLgo+ID4KPiA+IEl0IGFsc28gcmVvcmdhbml6ZXMgdGhlIGV0aHFvcyBjb2RlIHF1aXRl
IGEgYml0IHRvIG1ha2UgdGhlIGludHJvZHVjdGlvbgo+ID4gb2YgcG93ZXIgZG9tYWlucyBpbnRv
IHRoZSBkcml2ZXIgYSBiaXQgZWFzaWVyIG9uIHRoZSBleWUuCj4KPiBOb3QgZW50aXJlbHkgc3Vy
ZSB3aGF0IHRoZSBjb25jbHVzaW9uIHdhcyBpbiB0aGUgc3ViLXRocmVhZCB3aXRoIFJ1c3NlbGwK
PiBidXQgRldJVyB0aGlzIGRvZXNuJ3QgYXBwbHkgdG8gbmV0LW5leHQgYXMgcG9zdGVkIHNvIHJl
c3BpbiB3aWxsIGJlCj4gbmVlZGVkIGVpdGhlciB3YXkuCgpuZXQtbmV4dCBpcyBxdWl0ZSB0aGUg
bW92aW5nIHRhcmdldCwgaXNuJ3QgaXQ/IEkgZGlkIGp1c3QgdGhhdCBiZXR3ZWVuCnY3IGFuZCB2
OC4gOikKCkFzIGZvciBSdXNzZWxsJ3MgcmVzcG9uc2U6IEkgdGhpbmsgdGhpcyBpcyB0aGUgdGhp
cmQgdGltZSB3ZSdyZSBkb2luZwp0aGlzIGZvciB0aGlzIGRyaXZlci4gOiggVGhpcyBzZXJpZXMg
aXMgbm90IHRvdWNoaW5nIHRoZSBleGlzdGluZwpmdW5jdGlvbmFsaXR5IGFuZCByZWJhc2luZyBv
ZiBSdXNzZWxsJ3MgY2hhbmdlcyBvbiB0b3Agb2YgdGhpcyBzaG91bGQKZm9yIG1vc3QgcGFydCBi
ZSB0cml2aWFsLiBUaGUgY29yZSBvZiB0aGUgY2hhbmdlc2V0IGlzIHRvIGFkZCBzdXBwb3J0CmZv
ciBwb3dlciBkb21haW5zIHRvIGVuYWJsZSBldGhlcm5ldCBvbiBTQ01JIGRyaXZlbiBTb0NzLiBJ
IHdvdWxkCnJlYWxseSBhcHByZWNpYXRlIGl0IGlmIHdlIGNvdWxkIGdldCBpdCB1cHN0cmVhbSBh
bmQgdGhlbiBhbnkKc3Vic2VxdWVudCByZXdvcmsgY2FuIHRha2UgaW50byBhY2NvdW50IHRoZSB0
d28gdHlwZXMgb2Ygc3lzdGVtcyB3ZQpzdXBwb3J0LgoKUnVzc2VsbDogSSBzZWUgeW91ciBwb2lu
dCBhbmQgZGlkbid0IG1pbmQgdGhlIGZpcnN0IHR3byB0aW1lcyBidXQgaXQncwpiZWVuIHdheSB0
b28gbG9uZyBzaW5jZSBJIHBvc3RlZCB2MS4KCkJhcnRvc3oKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4
LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
