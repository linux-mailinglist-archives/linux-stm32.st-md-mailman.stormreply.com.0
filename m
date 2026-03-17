Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iOo4CXdhuWlsCwIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 17 Mar 2026 15:13:11 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB7A2AB90C
	for <lists+linux-stm32@lfdr.de>; Tue, 17 Mar 2026 15:13:10 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6BB60C87ED8;
	Tue, 17 Mar 2026 14:13:10 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0236CC7A831
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Mar 2026 14:13:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A848F40D79
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Mar 2026 14:13:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DDE7C2BC86
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Mar 2026 14:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773756787;
 bh=9QDalKJYBUEDUJPFs8n5F17T6oCLIOfRdQADKKa+dtg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=tZAEscpa8SCC5cIZ2JquMfgXyJ2cYbjRRZovEZ4pp9iCwMtzoyZvoUvuYiYMbRTYC
 SnQwovSWExy1qzNu8gKN2Re3kiqbZF6sZmkIooWlWa9EIx1ERfsbgtRs5rZB0SAIxf
 3lPrGMQ4Ue2TuM4ia8nL9lBYQlDl9Z6+Gmi7Vne8vrfCzyTk9J2Ck3dsbBaTLAPSfD
 NPCO+IQ8fm5HTfq9yr/wXF7f1MJldHxMFhyKqH3oTfoTSoTC0Dh5v2G2YRcDRDQgL5
 ObXNTsitNLuKk+KvWrgZ9pPDroH39BoYVIyc5TZiwHYdHQ131NS6aY+w9jvXRnJOfo
 pYQYSw8TEnjrw==
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-38a4234f91dso49317591fa.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Mar 2026 07:13:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVA02gKZnnZhaOELGy86bPGVaTOD41PTW+SB7pRro31D8pA2tFTQL0wppJyelIrB1bDNzfUY3OxScZFtw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwsJMu9iOqKEgCQ7u5dWFNLjDVueZpgdm4msIzDN2mYBdol2/Oh
 lCqcDIBvqeCtO1qXOZtWkghrpG8rkmrDGVBfWJ05QHCYv1iatvhWgYeeQ/sxB0yHCiXUGvLIYqV
 a/st3dllY5KSEvO5VS5zMSnmXQHbcJ2EHC4teTYYwiw==
X-Received: by 2002:a05:651c:2115:b0:37f:c5ca:a6d4 with SMTP id
 38308e7fff4ca-38a89666433mr58706271fa.6.1773756785569; Tue, 17 Mar 2026
 07:13:05 -0700 (PDT)
MIME-Version: 1.0
References: <20260316-qcom-sa8255p-emac-v9-0-c58934e76ff2@oss.qualcomm.com>
 <64d282fd94be1546df75d7df5b47eacc0479797a.camel@redhat.com>
In-Reply-To: <64d282fd94be1546df75d7df5b47eacc0479797a.camel@redhat.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Tue, 17 Mar 2026 15:12:53 +0100
X-Gmail-Original-Message-ID: <CAMRc=MfNcK3MLndik1jy-yhHAph5=amnTGgn-MpXXG0Uv1ifpQ@mail.gmail.com>
X-Gm-Features: AaiRm52mh793CgOH9S8BNXU-tBYi1I-pfEq9XQjt50faEkjR5xH42aEvJgG19dM
Message-ID: <CAMRc=MfNcK3MLndik1jy-yhHAph5=amnTGgn-MpXXG0Uv1ifpQ@mail.gmail.com>
To: Radu Rendec <rrendec@redhat.com>
Cc: imx@lists.linux.dev, s32@nxp.com,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, linux-amlogic@lists.infradead.org,
 linux-riscv@lists.infradead.org, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 Rob Herring <robh@kernel.org>, Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
 Romain Gantois <romain.gantois@bootlin.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Magnus Damm <magnus.damm@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-rockchip@lists.infradead.org, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Konrad Dybcio <konradybcio@kernel.org>,
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Jan Petrous <jan.petrous@oss.nxp.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Maxime Ripard <mripard@kernel.org>, linux-mips@vger.kernel.org,
 Drew Fustini <dfustini@tenstorrent.com>, sophgo@lists.linux.dev,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Chen-Yu Tsai <wens@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
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
Subject: Re: [Linux-stm32] [PATCH net-next v9 0/6] net: stmmac: qcom-ethqos:
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
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:rrendec@redhat.com,m:imx@lists.linux.dev,m:s32@nxp.com,m:geert+renesas@glider.be,m:linux-kernel@vger.kernel.org,m:edumazet@google.com,m:linux-amlogic@lists.infradead.org,m:linux-riscv@lists.infradead.org,m:festevam@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:jbrunet@baylibre.com,m:robh@kernel.org,m:mohd.anwar@oss.qualcomm.com,m:romain.gantois@bootlin.com,m:khilman@baylibre.com,m:bartosz.golaszewski@oss.qualcomm.com,m:magnus.damm@gmail.com,m:jernej.skrabec@gmail.com,m:linux-rockchip@lists.infradead.org,m:kuba@kernel.org,m:pabeni@redhat.com,m:konradybcio@kernel.org,m:linux-sunxi@lists.linux.dev,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:martin.blumenstingl@googlemail.com,m:linux-arm-msm@vger.kernel.org,m:jan.petrous@oss.nxp.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:mripard@kernel.org,m:linux-mips@vger.kernel.org,m:dfustini@tenstorrent.com,m:sophgo@lists.linux.dev,m:peppe.cavallaro@st.com,m:wens@kernel.org,m:linux-arm-kernel@lists.in
 fradead.org,m:konrad.dybcio@oss.qualcomm.com,m:neil.armstrong@linaro.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:netdev@vger.kernel.org,m:andersson@kernel.org,m:bartosz.golaszewski@linaro.org,m:christophe.roullier@foss.st.com,m:linux-renesas-soc@vger.kernel.org,m:andrew+netdev@lunn.ch,m:vkoul@kernel.org,m:mcoquelin.stm32@gmail.com,m:krzk+dt@kernel.org,m:shawnguo@kernel.org,m:davem@davemloft.net,m:geert@glider.be,m:magnusdamm@gmail.com,m:jernejskrabec@gmail.com,m:conor@kernel.org,m:martinblumenstingl@gmail.com,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[brgl@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[lists.linux.dev,nxp.com,glider.be,vger.kernel.org,google.com,lists.infradead.org,gmail.com,st-md-mailman.stormreply.com,baylibre.com,kernel.org,oss.qualcomm.com,bootlin.com,redhat.com,googlemail.com,oss.nxp.com,bp.renesas.com,tenstorrent.com,st.com,linaro.org,foss.st.com,lunn.ch,davemloft.net];
	NEURAL_SPAM(0.00)[0.649];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCPT_COUNT_GT_50(0.00)[50];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,renesas,dt,netdev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:email,stormreply.com:url]
X-Rspamd-Queue-Id: BEB7A2AB90C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gTW9uLCBNYXIgMTYsIDIwMjYgYXQgNzozMeKAr1BNIFJhZHUgUmVuZGVjIDxycmVuZGVjQHJl
ZGhhdC5jb20+IHdyb3RlOgo+Cj4gT24gTW9uLCAyMDI2LTAzLTE2IGF0IDEzOjA1ICswMTAwLCBC
YXJ0b3N6IEdvbGFzemV3c2tpIHdyb3RlOgo+ID4gQWRkIHN1cHBvcnQgZm9yIHRoZSBmaXJtd2Fy
ZS1tYW5hZ2VkIHZhcmlhbnQgb2YgdGhlIERlc2lnbldhcmUgTUFDIG9uCj4gPiB0aGUgc2E4MjU1
cCBwbGF0Zm9ybS4gVGhpcyBzZXJpZXMgY29udGFpbnMgbmV3IERUIGJpbmRpbmdzIGFuZCBkcml2
ZXIKPiA+IGNoYW5nZXMgcmVxdWlyZWQgdG8gc3VwcG9ydCB0aGUgTUFDIGluIHRoZSBTVE1NQUMg
ZHJpdmVyLgo+ID4KPiA+IEl0IGFsc28gcmVvcmdhbml6ZXMgdGhlIGV0aHFvcyBjb2RlIHF1aXRl
IGEgYml0IHRvIG1ha2UgdGhlIGludHJvZHVjdGlvbgo+ID4gb2YgcG93ZXIgZG9tYWlucyBpbnRv
IHRoZSBkcml2ZXIgYSBiaXQgZWFzaWVyIG9uIHRoZSBleWUuCj4gPgo+ID4gVGhlIERUUyBjaGFu
Z2VzIHdpbGwgZ28gaW4gc2VwYXJhdGVseS4KPgo+IEknbSBzZWVpbmcgc29tZSB3ZWlyZCBiZWhh
dmlvciB3aXRoIHRoaXMgdmVyc2lvbi4gVGhlIHByb2JlIHBhcnQgbG9va3MKPiBnb29kIChidXQg
c2VlIGJlbG93KSwgYnV0IHdoZW4gSSB0cnkgdG8gYnJpbmcgYW4gaW50ZXJmYWNlIHVwLCBpdCBm
YWlscwo+IHdpdGggRVRJTUVET1VULiBUaGUgcmVsZXZhbnQgcGFydCBvZiB0aGUgc3RhY2sgdHJh
Y2UgbGVhZGluZyB0byB0aGUKPiBlcnJvciBpcyB0aGlzOgo+Cj4gZHdtYWM0X2RtYV9yZXNldCsw
eDIwOC8weDIyMCBbc3RtbWFjXQo+IHN0bW1hY19yZXNldCsweDJjLzB4NjggW3N0bW1hY10KPiBz
dG1tYWNfaW5pdF9kbWFfZW5naW5lKzB4MTA4LzB4NDAwIFtzdG1tYWNdCj4gc3RtbWFjX2h3X3Nl
dHVwKzB4NWMvMHg1MzggW3N0bW1hY10KPiBfX3N0bW1hY19vcGVuKzB4YzgvMHgyYTAgW3N0bW1h
Y10KPiBzdG1tYWNfb3BlbisweGNjLzB4MjM4IFtzdG1tYWNdCj4gX19kZXZfb3BlbisweDEzOC8w
eDJhOAo+Cj4gTm93IGR3bWFjNF9kbWFfcmVzZXQoKSBpcyB2ZXJ5IHNpbXBsZS4gSXQgc2V0cyB0
aGUgc29mdCByZXNldCBiaXQgaW4KPiB0aGUgRE1BX0JVU19NT0RFIHJlZ2lzdGVyLCB0aGVuIHdh
aXRzIGZvciB0aGUgaGFyZHdhcmUgdG8gY2xlYXIgaXQsIGFuZAo+IHRoYXQgbmV2ZXIgaGFwcGVu
cy4KPgo+IE5vdywgZ2V0dGluZyBiYWNrIHRvIHRoZSBwcm9iZSBwYXJ0LCB0aGVyZSBpcyBvbmUg
ZXh0cmEgbWVzc2FnZQo+IChjb21wYXJlZCB0byBteSBwcmV2aW91cyBzdWNjZXNzZnVsIHRlc3Qg
b24gdjcpLCB3aGljaCBJIHNlZSBhdCB0aGUKPiB2ZXJ5IGVuZCBvZiB0aGUgcHJvYmluZzoKPgo+
ICAgcWNvbS1ldGhxb3MgMjMwNDAwMDAuZXRoZXJuZXQ6IGNsa19jc3IgdmFsdWUgb3V0IG9mIHJh
bmdlICgweGZmZmZmZjAwCj4gICBleGNlZWRzIG1hc2sgMHgwMDAwMGYwMCksIHRydW5jYXRpbmcK
Pgo+IFRoaXMgaXMgYSBzYTg3NzVwIHJpZGUgYm9hcmQsIHNvIHRoZXJlIGFyZSB0d28gc3RtbWFj
IGRldmljZXMuIEkgb25seQo+IHNlZSB0aGF0IG1lc3NhZ2UgZm9yIHRoZSAybmQgb25lLCB3aGlj
aCBpcyBhbHNvIHRoZSBvbmUgSSdtIHRyeWluZyB0bwo+IGVuYWJsZSwgYW5kIHdoaWNoIGZhaWxz
Lgo+Cj4gSSByZWFsaXplIHRoaXMgbWF5IG9yIG1heSBub3QgYmUgcmVsYXRlZCB0byB5b3VyIGNo
YW5nZXMuIEJ1dCB0aGVyZSBpcwo+IG5vIHdheSB0byB0ZXN0IG9uIGEgU0NNSS1wZCBib2FyZCB3
aXRob3V0IHRoZW0uIEknbSBub3Qgc3VyZSBob3cKPiByZWxldmFudCBpdCB3b3VsZCBiZSB0byB0
ZXN0IG9uIHRoZSBub24tU0NNSSB2YXJpYW50LiBJJ20gYXNzdW1pbmcgdGhlCj4gRE1BIHBhcnQg
c2hvdWxkIHdvcmsgdGhlIHNhbWUgd2F5IChyZWdhcmRsZXNzIG9mIFNDTUktcGQpLCBzbyBpZiBJ
IGNhbgo+IHJlcHJvZHVjZSBpdCB0aGVyZSwgYW5kIHNpbmNlIEkga25vdyBpdCB3b3JrcyBvbiBt
YWlubGluZSBMaW51eCAodGhhdCdzCj4gd2hlcmUgSSB0ZXN0ZWQgdjcpLCBJIGNvdWxkIGJpc2Vj
dCBhbmQgc2VlIHdoaWNoIGNvbW1pdCBpbiBuZXQtbmV4dAo+IGJyZWFrcyBpdC4gSWYgeW91IGRv
bid0IGhhdmUgYW55IGJldHRlciBpZGVhLCBsZXQgbWUga25vdyBhbmQgSSBjYW4KPiB0cnkuIE1l
YW53aGlsZSwgSSdsbCBrZWVwIHBva2luZyBhdCB2OS4KPgoKRG9lcyBjdXJyZW50IG5ldC1uZXh0
IG9uIGl0cyBvd24gc3RpbGwgd29yaz8gT3IgaXMgdGhlIHNlY29uZAppbnRlcmZhY2UgYnJva2Vu
IGV2ZW4gd2l0aG91dCB0aGlzIHNlcmllcz8KCkJhcnQKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0
bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
