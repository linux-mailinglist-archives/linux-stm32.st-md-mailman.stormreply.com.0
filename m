Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2FemFX1ivGmLxwIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 19 Mar 2026 21:54:21 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BF0782D2676
	for <lists+linux-stm32@lfdr.de>; Thu, 19 Mar 2026 21:54:20 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5A25AC87EC9;
	Thu, 19 Mar 2026 20:54:20 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 50671C35E2B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Mar 2026 20:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1773953658;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OspvSUceR9D7FWErEaMeS4pbjFGXhTs0d3vC6fXFa4g=;
 b=i5Da/vfQQUDm2uf3tcOptZL5DQrMwOU6IgvDH0Pauitz+9D5T+97ikCR2+7agzhUNtoyau
 EkkaDSiPmBCq74PTATbRJ5RACQag8VIgjeCDthLR9G6HJm3A097LBpFAl7XGMa26eyggq5
 H0KlMWvFZDeJgXUcqrfHAFpp7i/aLcs=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-621-jx9JPknzN8WTjHiz9RFzdg-1; Thu, 19 Mar 2026 16:54:17 -0400
X-MC-Unique: jx9JPknzN8WTjHiz9RFzdg-1
X-Mimecast-MFC-AGG-ID: jx9JPknzN8WTjHiz9RFzdg_1773953656
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-50b392f53b0so2641501cf.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Mar 2026 13:54:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773953656; x=1774558456;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OspvSUceR9D7FWErEaMeS4pbjFGXhTs0d3vC6fXFa4g=;
 b=JiZj0SD0tfsYh4tmNpj81YIj6DPaUU8BUEgq+xba9O3Xp5r3c/ZvDwVb0tEpKgiqTJ
 H7PU+ukVkjkAquPiayhB0czC0VlAM7vW54tWWAt5Pre4HQ0gQfuHo6v/ct2DjQD9/L6v
 MOrRuhzDsTTdZjbVHyJaNBAlX5sURX5EBBYzGDTuAf46mKDXDzr1w83z30fqgCMhPlA8
 PKSvuZTKCqNKsw6vRfpmFUxd67CldmpSyhv/A+GfaBAY/OFbdvbS6QO2SLA9dXFnIGN0
 7yMgU335kWPhuHO1eoxEaM4FpZVq9Lf4tewRay9GJyA/SPGVXc+inkT+brepWTEyybgO
 AzSA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWW2I7hfNaFe1WyYugYoQxL0Vqe50Un5yaC9ZZ1qL3pVJcWkPC5cEvVV8e3QY41MGv31uqZjHIdmu8WBQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Ywkz4FJVvWM/4Eb6+puGtSA5agcxiyJmVnTQfq/rFR8RzYbWyxj
 uATUaaViPc8WP/rZe2zjOx7bd3ndn+EKuzhAsz9WNT/z/5HPrLloY1/UoB/PWqhIVqNd6EpXxsy
 vapSHNCrW9pupLvEb0tbfjp/hZi4hJhdviVaW8BDKEVoOgkXnYS7MuYGnK/98I6WeXpO83RSZ/B
 LY7P8k9Q==
X-Gm-Gg: ATEYQzxDY8vvLGefMmbWl8SnZJS2eaTaLgJ3q1RQ0kK3TOstCM814rrGw3BQB+mNWht
 5OnzERc/y32wiKnEO1QmUjP2LGVWBVZxM9QT37e4GXIw6Ksql8o/qdxxXy/JLD98Qay8oP1eMtj
 S7GyAM8THGQG9tCBt8crnsUInf3FHCNuGgdptILSLP3BmLU/0U2PlgTugz47kEAruZFRPZIQW7K
 FhcR5KUiSkHuNPcFcHx1pEVp5Dbuka4Pb9L/uZqm3+20Ry1DEBSapp1A157WF8gAEFE+i+xkD5w
 qKoJ7yQeYdqua/7w08l/R8QE+fU+UVkJMRfbEwNGvX09Va9MMXhsBnZ1MoMoYiHKNvfcszg0kye
 zNZCdViJ/g4PMprJENzRQUDIwPGRnj1pGq5fWdewn33hFvUqfbxTSFOh2J0pE5PZyArfioSgzKD
 rW23W3My6A8YmqyA==
X-Received: by 2002:ac8:7f54:0:b0:509:4e1e:1b9a with SMTP id
 d75a77b69052e-50b37586c7cmr10125771cf.54.1773953656322; 
 Thu, 19 Mar 2026 13:54:16 -0700 (PDT)
X-Received: by 2002:ac8:7f54:0:b0:509:4e1e:1b9a with SMTP id
 d75a77b69052e-50b37586c7cmr10124851cf.54.1773953655634; 
 Thu, 19 Mar 2026 13:54:15 -0700 (PDT)
Received: from thinkpad-p1.localdomain
 (pool-174-112-193-187.cpe.net.cable.rogers.com. [174.112.193.187])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-50b36e350c3sm6518601cf.19.2026.03.19.13.54.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Mar 2026 13:54:15 -0700 (PDT)
Message-ID: <cf908b20e5f6237c887f6d751be82670d7cbd7b7.camel@redhat.com>
From: Radu Rendec <rrendec@redhat.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Date: Thu, 19 Mar 2026 16:54:12 -0400
In-Reply-To: <CAMRc=MfNcK3MLndik1jy-yhHAph5=amnTGgn-MpXXG0Uv1ifpQ@mail.gmail.com>
References: <20260316-qcom-sa8255p-emac-v9-0-c58934e76ff2@oss.qualcomm.com>
 <64d282fd94be1546df75d7df5b47eacc0479797a.camel@redhat.com>
 <CAMRc=MfNcK3MLndik1jy-yhHAph5=amnTGgn-MpXXG0Uv1ifpQ@mail.gmail.com>
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 2rdZK_Y80FAMOv-7889Of71wds7hK2QjdkrJyUQZVJQ_1773953656
X-Mimecast-Originator: redhat.com
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
	DMARC_POLICY_QUARANTINE(1.50)[redhat.com : SPF not aligned (relaxed),quarantine];
	R_DKIM_REJECT(1.00)[redhat.com:s=mimecast20190719];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[rrendec@redhat.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:brgl@kernel.org,m:imx@lists.linux.dev,m:s32@nxp.com,m:geert+renesas@glider.be,m:linux-kernel@vger.kernel.org,m:edumazet@google.com,m:linux-amlogic@lists.infradead.org,m:linux-riscv@lists.infradead.org,m:festevam@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:jbrunet@baylibre.com,m:robh@kernel.org,m:mohd.anwar@oss.qualcomm.com,m:romain.gantois@bootlin.com,m:khilman@baylibre.com,m:bartosz.golaszewski@oss.qualcomm.com,m:magnus.damm@gmail.com,m:jernej.skrabec@gmail.com,m:linux-rockchip@lists.infradead.org,m:kuba@kernel.org,m:pabeni@redhat.com,m:konradybcio@kernel.org,m:linux-sunxi@lists.linux.dev,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:martin.blumenstingl@googlemail.com,m:linux-arm-msm@vger.kernel.org,m:jan.petrous@oss.nxp.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:mripard@kernel.org,m:linux-mips@vger.kernel.org,m:dfustini@tenstorrent.com,m:sophgo@lists.linux.dev,m:peppe.cavallaro@st.com,m:wens@kernel.org,m:linux-arm-kernel@lists.infra
 dead.org,m:konrad.dybcio@oss.qualcomm.com,m:neil.armstrong@linaro.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:netdev@vger.kernel.org,m:andersson@kernel.org,m:bartosz.golaszewski@linaro.org,m:christophe.roullier@foss.st.com,m:linux-renesas-soc@vger.kernel.org,m:andrew+netdev@lunn.ch,m:vkoul@kernel.org,m:mcoquelin.stm32@gmail.com,m:krzk+dt@kernel.org,m:shawnguo@kernel.org,m:davem@davemloft.net,m:geert@glider.be,m:magnusdamm@gmail.com,m:jernejskrabec@gmail.com,m:conor@kernel.org,m:martinblumenstingl@gmail.com,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[lists.linux.dev,nxp.com,glider.be,vger.kernel.org,google.com,lists.infradead.org,gmail.com,st-md-mailman.stormreply.com,baylibre.com,kernel.org,oss.qualcomm.com,bootlin.com,redhat.com,googlemail.com,oss.nxp.com,bp.renesas.com,tenstorrent.com,st.com,linaro.org,foss.st.com,lunn.ch,davemloft.net];
	NEURAL_SPAM(0.00)[0.195];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCPT_COUNT_GT_50(0.00)[50];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[rrendec@redhat.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:-];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,renesas,dt,netdev];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:email,stormreply.com:url]
X-Rspamd-Queue-Id: BF0782D2676
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gVHVlLCAyMDI2LTAzLTE3IGF0IDE1OjEyICswMTAwLCBCYXJ0b3N6IEdvbGFzemV3c2tpIHdy
b3RlOgo+IE9uIE1vbiwgTWFyIDE2LCAyMDI2IGF0IDc6MzHigK9QTSBSYWR1IFJlbmRlYyA8cnJl
bmRlY0ByZWRoYXQuY29tPiB3cm90ZToKPiA+IAo+ID4gT24gTW9uLCAyMDI2LTAzLTE2IGF0IDEz
OjA1ICswMTAwLCBCYXJ0b3N6IEdvbGFzemV3c2tpIHdyb3RlOgo+ID4gPiBBZGQgc3VwcG9ydCBm
b3IgdGhlIGZpcm13YXJlLW1hbmFnZWQgdmFyaWFudCBvZiB0aGUgRGVzaWduV2FyZSBNQUMgb24K
PiA+ID4gdGhlIHNhODI1NXAgcGxhdGZvcm0uIFRoaXMgc2VyaWVzIGNvbnRhaW5zIG5ldyBEVCBi
aW5kaW5ncyBhbmQgZHJpdmVyCj4gPiA+IGNoYW5nZXMgcmVxdWlyZWQgdG8gc3VwcG9ydCB0aGUg
TUFDIGluIHRoZSBTVE1NQUMgZHJpdmVyLgo+ID4gPiAKPiA+ID4gSXQgYWxzbyByZW9yZ2FuaXpl
cyB0aGUgZXRocW9zIGNvZGUgcXVpdGUgYSBiaXQgdG8gbWFrZSB0aGUgaW50cm9kdWN0aW9uCj4g
PiA+IG9mIHBvd2VyIGRvbWFpbnMgaW50byB0aGUgZHJpdmVyIGEgYml0IGVhc2llciBvbiB0aGUg
ZXllLgo+ID4gPiAKPiA+ID4gVGhlIERUUyBjaGFuZ2VzIHdpbGwgZ28gaW4gc2VwYXJhdGVseS4K
PiA+IAo+ID4gSSdtIHNlZWluZyBzb21lIHdlaXJkIGJlaGF2aW9yIHdpdGggdGhpcyB2ZXJzaW9u
LiBUaGUgcHJvYmUgcGFydCBsb29rcwo+ID4gZ29vZCAoYnV0IHNlZSBiZWxvdyksIGJ1dCB3aGVu
IEkgdHJ5IHRvIGJyaW5nIGFuIGludGVyZmFjZSB1cCwgaXQgZmFpbHMKPiA+IHdpdGggRVRJTUVE
T1VULiBUaGUgcmVsZXZhbnQgcGFydCBvZiB0aGUgc3RhY2sgdHJhY2UgbGVhZGluZyB0byB0aGUK
PiA+IGVycm9yIGlzIHRoaXM6Cj4gPiAKPiA+IGR3bWFjNF9kbWFfcmVzZXQrMHgyMDgvMHgyMjAg
W3N0bW1hY10KPiA+IHN0bW1hY19yZXNldCsweDJjLzB4NjggW3N0bW1hY10KPiA+IHN0bW1hY19p
bml0X2RtYV9lbmdpbmUrMHgxMDgvMHg0MDAgW3N0bW1hY10KPiA+IHN0bW1hY19od19zZXR1cCsw
eDVjLzB4NTM4IFtzdG1tYWNdCj4gPiBfX3N0bW1hY19vcGVuKzB4YzgvMHgyYTAgW3N0bW1hY10K
PiA+IHN0bW1hY19vcGVuKzB4Y2MvMHgyMzggW3N0bW1hY10KPiA+IF9fZGV2X29wZW4rMHgxMzgv
MHgyYTgKPiA+IAo+ID4gTm93IGR3bWFjNF9kbWFfcmVzZXQoKSBpcyB2ZXJ5IHNpbXBsZS4gSXQg
c2V0cyB0aGUgc29mdCByZXNldCBiaXQgaW4KPiA+IHRoZSBETUFfQlVTX01PREUgcmVnaXN0ZXIs
IHRoZW4gd2FpdHMgZm9yIHRoZSBoYXJkd2FyZSB0byBjbGVhciBpdCwgYW5kCj4gPiB0aGF0IG5l
dmVyIGhhcHBlbnMuCj4gPiAKPiA+IE5vdywgZ2V0dGluZyBiYWNrIHRvIHRoZSBwcm9iZSBwYXJ0
LCB0aGVyZSBpcyBvbmUgZXh0cmEgbWVzc2FnZQo+ID4gKGNvbXBhcmVkIHRvIG15IHByZXZpb3Vz
IHN1Y2Nlc3NmdWwgdGVzdCBvbiB2NyksIHdoaWNoIEkgc2VlIGF0IHRoZQo+ID4gdmVyeSBlbmQg
b2YgdGhlIHByb2Jpbmc6Cj4gPiAKPiA+IMKgIHFjb20tZXRocW9zIDIzMDQwMDAwLmV0aGVybmV0
OiBjbGtfY3NyIHZhbHVlIG91dCBvZiByYW5nZSAoMHhmZmZmZmYwMAo+ID4gwqAgZXhjZWVkcyBt
YXNrIDB4MDAwMDBmMDApLCB0cnVuY2F0aW5nCj4gPiAKPiA+IFRoaXMgaXMgYSBzYTg3NzVwIHJp
ZGUgYm9hcmQsIHNvIHRoZXJlIGFyZSB0d28gc3RtbWFjIGRldmljZXMuIEkgb25seQo+ID4gc2Vl
IHRoYXQgbWVzc2FnZSBmb3IgdGhlIDJuZCBvbmUsIHdoaWNoIGlzIGFsc28gdGhlIG9uZSBJJ20g
dHJ5aW5nIHRvCj4gPiBlbmFibGUsIGFuZCB3aGljaCBmYWlscy4KPiA+IAo+ID4gSSByZWFsaXpl
IHRoaXMgbWF5IG9yIG1heSBub3QgYmUgcmVsYXRlZCB0byB5b3VyIGNoYW5nZXMuIEJ1dCB0aGVy
ZSBpcwo+ID4gbm8gd2F5IHRvIHRlc3Qgb24gYSBTQ01JLXBkIGJvYXJkIHdpdGhvdXQgdGhlbS4g
SSdtIG5vdCBzdXJlIGhvdwo+ID4gcmVsZXZhbnQgaXQgd291bGQgYmUgdG8gdGVzdCBvbiB0aGUg
bm9uLVNDTUkgdmFyaWFudC4gSSdtIGFzc3VtaW5nIHRoZQo+ID4gRE1BIHBhcnQgc2hvdWxkIHdv
cmsgdGhlIHNhbWUgd2F5IChyZWdhcmRsZXNzIG9mIFNDTUktcGQpLCBzbyBpZiBJIGNhbgo+ID4g
cmVwcm9kdWNlIGl0IHRoZXJlLCBhbmQgc2luY2UgSSBrbm93IGl0IHdvcmtzIG9uIG1haW5saW5l
IExpbnV4ICh0aGF0J3MKPiA+IHdoZXJlIEkgdGVzdGVkIHY3KSwgSSBjb3VsZCBiaXNlY3QgYW5k
IHNlZSB3aGljaCBjb21taXQgaW4gbmV0LW5leHQKPiA+IGJyZWFrcyBpdC4gSWYgeW91IGRvbid0
IGhhdmUgYW55IGJldHRlciBpZGVhLCBsZXQgbWUga25vdyBhbmQgSSBjYW4KPiA+IHRyeS4gTWVh
bndoaWxlLCBJJ2xsIGtlZXAgcG9raW5nIGF0IHY5Lgo+ID4gCj4gCj4gRG9lcyBjdXJyZW50IG5l
dC1uZXh0IG9uIGl0cyBvd24gc3RpbGwgd29yaz8gT3IgaXMgdGhlIHNlY29uZAo+IGludGVyZmFj
ZSBicm9rZW4gZXZlbiB3aXRob3V0IHRoaXMgc2VyaWVzPwoKSSBkb24ndCB0aGluayB0aGVyZSBp
cyBhIHdheSB0byB0ZXN0IG5ldC1uZXh0IG9uIGl0cyBvd24gKHdpdGhvdXQgeW91cgpzZXJpZXMp
IG9uIGEgYm9hcmQgd2l0aCBTQ01JLXBkIGZpcm13YXJlLiBJdCB3b3VsZCByZXF1aXJlIHRoZQpx
Y29tLWV0aHFvcyBkcml2ZXIgdG8gaGF2ZSBkaXJlY3QgYWNjZXNzIHRvIHRoZSBjbG9ja3MsIGJ1
dCB0aGUgY2xvY2tzCndvdWxkIG5vdCBiZSB0aGVyZS4KCldoYXQgSSBjb3VsZCB0ZXN0IHRob3Vn
aCBpcyBhIGJvYXJkIHdpdGggdGhlICJvdGhlciIgZmlybXdhcmUgKHdpdGhvdXQKU0NNSS1wZCku
IEFuZCBvbiB0aGF0IGJvYXJkLCBJIGRvICpub3QqIHNlZSB0aGUgcHJvYmxlbSBldmVuIHdpdGgg
eW91cgpzZXJpZXMgYXBwbGllZC4gSW4gZmFjdCwgSSB0ZXN0ZWQgdGhlIGV4YWN0IHNhbWUga2Vy
bmVsIGJ1aWxkIEkgaGFkCnByZXZpb3VzbHkgdGVzdGVkIG9uIHRoZSBTQ01JLXBkIGJvYXJkLgoK
SSdtIG5vdCBzdXJlIHdoYXQgdG8gbWFrZSBvZiB0aGF0IG9yIHdoYXQgZWxzZSBJIGNvdWxkIHRy
eS4KCkZXSVcsIHRoZSAiY2xrX2NzciB2YWx1ZSBvdXQgb2YgcmFuZ2UiIG1lc3NhZ2UgSSBtZW50
aW9uZWQgYmVmb3JlIGlzCnN0aWxsIHRoZXJlIG9uIHRoZSBib2FyZCB3aGVyZSBldmVyeXRoaW5n
IHdvcmtzLCBzbyBpdCdzIHByb2JhYmx5IGEKcmVkIGhlcnJpbmcuCgotLSAKUmFkdQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFp
bGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6
Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3Rt
MzIK
