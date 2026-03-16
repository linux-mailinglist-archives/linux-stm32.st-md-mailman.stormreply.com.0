Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eBKSM3hMuGlHbwEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Mar 2026 19:31:20 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4315029F0E5
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Mar 2026 19:31:20 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DEF72C87EC5;
	Mon, 16 Mar 2026 18:31:19 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 159E8C87EC0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Mar 2026 18:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1773685876;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BNBEVCAdHGNat6EhquVBIDr5xmo+EfnKaRHucm6TIJk=;
 b=GCF00AJCWBZj0OUPqiPEMdeL890VLT/mPqSGORudiJBEWiaXmCBogpjb0wPc64OjiAwluP
 pESnVfD8TrRfO1eyRnVBbk02ol7/aUJMHiE9t1EKwbf6QtufW39nI9qHonUkX+CwzPFcti
 xfa0EQrtfde6c29fny7fZfgI1NwaLiw=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-556-ukHAdrC_MrSfZ9iIMt3HYg-1; Mon, 16 Mar 2026 14:31:14 -0400
X-MC-Unique: ukHAdrC_MrSfZ9iIMt3HYg-1
X-Mimecast-MFC-AGG-ID: ukHAdrC_MrSfZ9iIMt3HYg_1773685874
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-509181cc6ebso64584221cf.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Mar 2026 11:31:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773685874; x=1774290674;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BNBEVCAdHGNat6EhquVBIDr5xmo+EfnKaRHucm6TIJk=;
 b=IUlZn5F3OJTX3S/P6Udc/zXmoC0Y30i9WgT04lf6N4tRdECf11wuvcPMgIDu94VExW
 BUM5pCtiSLk+4ZLy2PuOg5zOvGxP4Skrz0BtA6IX2CkiyQohfK+YLKpUI1cUjnPxgYL/
 DYp0Fu8qZmXjiPVPK5dA628cYDU+OcidPUcMt4Mjgpt3kPIFWnUFBxd7SEE2fwxI9q0L
 QNZ4CbjBylKUyyhE2RlmA7qSrHaSfNnnYyKKvHx1ksj4FJcvwmnuBZNBlrmiVIBoelmj
 te84IbYzQL5OwiDd14dtT2o52XUHLZBCGEiBL/54ORPBPAy1kWz3ZjxXFULxpgvwkiEm
 663w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKySKXATmBq0A2x2UIkpJk96BKyeagelqkfef2Xspnpp7a27qsnW6hrf+UhGAH0Qf4KXLGi76VJ0NYfA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyOT4a1Jt3b7nbSm1noc12OZ5i56qrhAXK8brnBvcAgJE+TFX6m
 Xv01q00wZB0DFJEekR0KjJMdvLwzhK8pImQhNs4TFgA/E+EtIZNuCcHQwUntyS+ooheU117sIfg
 9kOlWVpzxW6Frfg9MsjQ9dJ0UeIzm6jU7Ss8q1mthkbtb0C/YWqp32H0p+qtQolhnRjPzD18ez3
 1xB8166Q==
X-Gm-Gg: ATEYQzyrJsp+mrkh4jTCxel0TiE1TJDx9lQri7csHnuff5GFqBeC3shqqQq68XN9m/W
 h2RmTOdOkx/khnIL43b4+UwwsCIrT7D7sHBs5hJS9E3WYpVitKdVLP/Peav0g1b8j6lMt1SO8jX
 V8de2OQFY/PbsX42XTeI2bX3fdyn8zZn/ZMHp9+XjBUaAmgjJkz/K//25TDfEGeMEH5nBpnyg8I
 q50t9NeBUj8lppCwBlssGV1O9c6gGk3259i+IminoXmYpPBPU8zpzNlIkqXhvhMO8Xdqqc7bEco
 4+/Ga9zJIdyyo/clmJP8q7uQokohNh7ibqKjrUrRt6KtxbXfPdQAoF2EEAf0Qrld9Wp4ndiOPvZ
 aWaZo4+0hxFB/QcDe/qHBxbzaLoePob/qNlHPxaNo9WHobyiJfwmoYpbVjgPmg+Jt78sLl8j+U0
 EaGHO6lWSVPqQ1yA==
X-Received: by 2002:a05:622a:15d3:b0:509:17e4:ceed with SMTP id
 d75a77b69052e-50957cb5a7amr187473291cf.9.1773685873592; 
 Mon, 16 Mar 2026 11:31:13 -0700 (PDT)
X-Received: by 2002:a05:622a:15d3:b0:509:17e4:ceed with SMTP id
 d75a77b69052e-50957cb5a7amr187471881cf.9.1773685872774; 
 Mon, 16 Mar 2026 11:31:12 -0700 (PDT)
Received: from thinkpad-p1.localdomain
 (pool-174-112-193-187.cpe.net.cable.rogers.com. [174.112.193.187])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-5093a0ea244sm124136001cf.16.2026.03.16.11.31.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Mar 2026 11:31:12 -0700 (PDT)
Message-ID: <64d282fd94be1546df75d7df5b47eacc0479797a.camel@redhat.com>
From: Radu Rendec <rrendec@redhat.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Bjorn
 Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski	 <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Andrew Lunn	 <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet	
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni	
 <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>, Vinod Koul <vkoul@kernel.org>,
 Giuseppe Cavallaro	 <peppe.cavallaro@st.com>, Chen-Yu Tsai
 <wens@kernel.org>, Jernej Skrabec	 <jernej.skrabec@gmail.com>, Neil
 Armstrong <neil.armstrong@linaro.org>,  Kevin Hilman
 <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Shawn Guo
 <shawnguo@kernel.org>,  Fabio Estevam <festevam@gmail.com>, Jan Petrous
 <jan.petrous@oss.nxp.com>, s32@nxp.com, Mohd Ayaan Anwar	
 <mohd.anwar@oss.qualcomm.com>, Romain Gantois <romain.gantois@bootlin.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm
 <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,  Christophe
 Roullier <christophe.roullier@foss.st.com>, Bartosz Golaszewski
 <brgl@kernel.org>
Date: Mon, 16 Mar 2026 14:31:08 -0400
In-Reply-To: <20260316-qcom-sa8255p-emac-v9-0-c58934e76ff2@oss.qualcomm.com>
References: <20260316-qcom-sa8255p-emac-v9-0-c58934e76ff2@oss.qualcomm.com>
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: L1_FAyY7DNmfDaMc0e7vMZoxJMv9s_TrbWmQDeqORn4_1773685874
X-Mimecast-Originator: redhat.com
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, devicetree@vger.kernel.org,
 linux-mips@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 imx@lists.linux.dev, Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 sophgo@lists.linux.dev, netdev@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-riscv@lists.infradead.org,
 Drew Fustini <dfustini@tenstorrent.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
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
	DMARC_POLICY_QUARANTINE(1.50)[redhat.com : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[redhat.com:s=mimecast20190719];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:bartosz.golaszewski@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:vkoul@kernel.org,m:peppe.cavallaro@st.com,m:wens@kernel.org,m:jernej.skrabec@gmail.com,m:neil.armstrong@linaro.org,m:khilman@baylibre.com,m:jbrunet@baylibre.com,m:shawnguo@kernel.org,m:festevam@gmail.com,m:jan.petrous@oss.nxp.com,m:s32@nxp.com,m:mohd.anwar@oss.qualcomm.com,m:romain.gantois@bootlin.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:mripard@kernel.org,m:christophe.roullier@foss.st.com,m:brgl@kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:devicetree@vger.kernel.org,m:linux-mips@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:imx@lists.linux.dev,m:martin.blumenstingl@googlemail.com,m:linux-arm-msm@vger.kernel.org,m:prabhakar
 .mahadev-lad.rj@bp.renesas.com,m:bartosz.golaszewski@linaro.org,m:linux-kernel@vger.kernel.org,m:linux-sunxi@lists.linux.dev,m:linux-renesas-soc@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:sophgo@lists.linux.dev,m:netdev@vger.kernel.org,m:linux-amlogic@lists.infradead.org,m:linux-riscv@lists.infradead.org,m:dfustini@tenstorrent.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:jernejskrabec@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,m:martinblumenstingl@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[rrendec@redhat.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,lunn.ch,davemloft.net,google.com,redhat.com,gmail.com,foss.st.com,st.com,linaro.org,baylibre.com,oss.nxp.com,nxp.com,bootlin.com,glider.be];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,vger.kernel.org,lists.linux.dev,googlemail.com,bp.renesas.com,linaro.org,lists.infradead.org,tenstorrent.com,st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCPT_COUNT_GT_50(0.00)[51];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[rrendec@redhat.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:-];
	NEURAL_HAM(-0.00)[-0.400];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32,dt,netdev,renesas];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,qualcomm.com:email,msgid.link:url]
X-Rspamd-Queue-Id: 4315029F0E5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gTW9uLCAyMDI2LTAzLTE2IGF0IDEzOjA1ICswMTAwLCBCYXJ0b3N6IEdvbGFzemV3c2tpIHdy
b3RlOgo+IEFkZCBzdXBwb3J0IGZvciB0aGUgZmlybXdhcmUtbWFuYWdlZCB2YXJpYW50IG9mIHRo
ZSBEZXNpZ25XYXJlIE1BQyBvbgo+IHRoZSBzYTgyNTVwIHBsYXRmb3JtLiBUaGlzIHNlcmllcyBj
b250YWlucyBuZXcgRFQgYmluZGluZ3MgYW5kIGRyaXZlcgo+IGNoYW5nZXMgcmVxdWlyZWQgdG8g
c3VwcG9ydCB0aGUgTUFDIGluIHRoZSBTVE1NQUMgZHJpdmVyLgo+IAo+IEl0IGFsc28gcmVvcmdh
bml6ZXMgdGhlIGV0aHFvcyBjb2RlIHF1aXRlIGEgYml0IHRvIG1ha2UgdGhlIGludHJvZHVjdGlv
bgo+IG9mIHBvd2VyIGRvbWFpbnMgaW50byB0aGUgZHJpdmVyIGEgYml0IGVhc2llciBvbiB0aGUg
ZXllLgo+IAo+IFRoZSBEVFMgY2hhbmdlcyB3aWxsIGdvIGluIHNlcGFyYXRlbHkuCgpJJ20gc2Vl
aW5nIHNvbWUgd2VpcmQgYmVoYXZpb3Igd2l0aCB0aGlzIHZlcnNpb24uIFRoZSBwcm9iZSBwYXJ0
IGxvb2tzCmdvb2QgKGJ1dCBzZWUgYmVsb3cpLCBidXQgd2hlbiBJIHRyeSB0byBicmluZyBhbiBp
bnRlcmZhY2UgdXAsIGl0IGZhaWxzCndpdGggRVRJTUVET1VULiBUaGUgcmVsZXZhbnQgcGFydCBv
ZiB0aGUgc3RhY2sgdHJhY2UgbGVhZGluZyB0byB0aGUKZXJyb3IgaXMgdGhpczoKCmR3bWFjNF9k
bWFfcmVzZXQrMHgyMDgvMHgyMjAgW3N0bW1hY10Kc3RtbWFjX3Jlc2V0KzB4MmMvMHg2OCBbc3Rt
bWFjXQpzdG1tYWNfaW5pdF9kbWFfZW5naW5lKzB4MTA4LzB4NDAwIFtzdG1tYWNdCnN0bW1hY19o
d19zZXR1cCsweDVjLzB4NTM4IFtzdG1tYWNdCl9fc3RtbWFjX29wZW4rMHhjOC8weDJhMCBbc3Rt
bWFjXQpzdG1tYWNfb3BlbisweGNjLzB4MjM4IFtzdG1tYWNdCl9fZGV2X29wZW4rMHgxMzgvMHgy
YTgKCk5vdyBkd21hYzRfZG1hX3Jlc2V0KCkgaXMgdmVyeSBzaW1wbGUuIEl0IHNldHMgdGhlIHNv
ZnQgcmVzZXQgYml0IGluCnRoZSBETUFfQlVTX01PREUgcmVnaXN0ZXIsIHRoZW4gd2FpdHMgZm9y
IHRoZSBoYXJkd2FyZSB0byBjbGVhciBpdCwgYW5kCnRoYXQgbmV2ZXIgaGFwcGVucy4KCk5vdywg
Z2V0dGluZyBiYWNrIHRvIHRoZSBwcm9iZSBwYXJ0LCB0aGVyZSBpcyBvbmUgZXh0cmEgbWVzc2Fn
ZQooY29tcGFyZWQgdG8gbXkgcHJldmlvdXMgc3VjY2Vzc2Z1bCB0ZXN0IG9uIHY3KSwgd2hpY2gg
SSBzZWUgYXQgdGhlCnZlcnkgZW5kIG9mIHRoZSBwcm9iaW5nOgoKICBxY29tLWV0aHFvcyAyMzA0
MDAwMC5ldGhlcm5ldDogY2xrX2NzciB2YWx1ZSBvdXQgb2YgcmFuZ2UgKDB4ZmZmZmZmMDAKICBl
eGNlZWRzIG1hc2sgMHgwMDAwMGYwMCksIHRydW5jYXRpbmcKClRoaXMgaXMgYSBzYTg3NzVwIHJp
ZGUgYm9hcmQsIHNvIHRoZXJlIGFyZSB0d28gc3RtbWFjIGRldmljZXMuIEkgb25seQpzZWUgdGhh
dCBtZXNzYWdlIGZvciB0aGUgMm5kIG9uZSwgd2hpY2ggaXMgYWxzbyB0aGUgb25lIEknbSB0cnlp
bmcgdG8KZW5hYmxlLCBhbmQgd2hpY2ggZmFpbHMuCgpJIHJlYWxpemUgdGhpcyBtYXkgb3IgbWF5
IG5vdCBiZSByZWxhdGVkIHRvIHlvdXIgY2hhbmdlcy4gQnV0IHRoZXJlIGlzCm5vIHdheSB0byB0
ZXN0IG9uIGEgU0NNSS1wZCBib2FyZCB3aXRob3V0IHRoZW0uIEknbSBub3Qgc3VyZSBob3cKcmVs
ZXZhbnQgaXQgd291bGQgYmUgdG8gdGVzdCBvbiB0aGUgbm9uLVNDTUkgdmFyaWFudC4gSSdtIGFz
c3VtaW5nIHRoZQpETUEgcGFydCBzaG91bGQgd29yayB0aGUgc2FtZSB3YXkgKHJlZ2FyZGxlc3Mg
b2YgU0NNSS1wZCksIHNvIGlmIEkgY2FuCnJlcHJvZHVjZSBpdCB0aGVyZSwgYW5kIHNpbmNlIEkg
a25vdyBpdCB3b3JrcyBvbiBtYWlubGluZSBMaW51eCAodGhhdCdzCndoZXJlIEkgdGVzdGVkIHY3
KSwgSSBjb3VsZCBiaXNlY3QgYW5kIHNlZSB3aGljaCBjb21taXQgaW4gbmV0LW5leHQKYnJlYWtz
IGl0LiBJZiB5b3UgZG9uJ3QgaGF2ZSBhbnkgYmV0dGVyIGlkZWEsIGxldCBtZSBrbm93IGFuZCBJ
IGNhbgp0cnkuIE1lYW53aGlsZSwgSSdsbCBrZWVwIHBva2luZyBhdCB2OS4KClJhZHUKCj4gU2ln
bmVkLW9mZi1ieTogQmFydG9zeiBHb2xhc3pld3NraSA8YmFydG9zei5nb2xhc3pld3NraUBsaW5h
cm8ub3JnPgo+IFNpZ25lZC1vZmYtYnk6IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJhcnRvc3ouZ29s
YXN6ZXdza2lAb3NzLnF1YWxjb21tLmNvbT4KPiAtLS0KPiBDaGFuZ2VzIGluIHY5Ogo+IC0gUmVi
YXNlIG9uIHRvcCBvZiBjdXJyZW50IGxpbnV4LW5leHQgYWdhaW4KPiAtIExpbmsgdG8gdjg6IGh0
dHBzOi8vcGF0Y2gubXNnaWQubGluay8yMDI2MDMxMS1xY29tLXNhODI1NXAtZW1hYy12OC0wLTU4
MjI3YmNmMTAxOEBvc3MucXVhbGNvbW0uY29tCj4gCj4gQ2hhbmdlcyBpbiB2ODoKPiAtIFJlYmFz
ZSBvbiB0b3Agb2YgcmVjZW50IGNoYW5nZXMgaW4gbGludXgtbmV4dCB3aGljaCByZXF1aXJlZCBh
bgo+IMKgIGV4dGVuc2l2ZSByZXdvcmsKPiAtIERyb3AgcGFydGlhbCBSLWIgdGFncwo+IC0gTGlu
ayB0byB2NzogaHR0cHM6Ly9wYXRjaC5tc2dpZC5saW5rLzIwMjYwMzA2LXFjb20tc2E4MjU1cC1l
bWFjLXY3LTAtZDZhMzAxMzA5NGI3QG9zcy5xdWFsY29tbS5jb20KPiAKPiBDaGFuZ2VzIGluIHY3
Ogo+IC0gUmVzdG9yZWQgdGhlIGNvcnJlY3QgYXV0aG9yc2hpcCBhZnRlciBsZWFybmluZyBnaXQg
dXNlcyAubWFpbG1hcCBmb3IKPiDCoCB0aGUgLS1hdXRob3Igc3dpdGNoCj4gLSBSZWJhc2VkIG9u
IHRvcCBvZiBjaGFuZ2VzIGZyb20gUnVzc2VsbAo+IC0gRml4ZWQgcmVzb3VyY2UgbWFuYWdlbWVu
dCBpc3N1ZXMgaW4gZXJyb3IgcGF0aHMKPiAtIExpbmsgdG8gdjY6IGh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL3IvMjAyNjAxMTItcWNvbS1zYTgyNTVwLWVtYWMtdjYtMC04NmEzZDRiMmFkODNAb3Nz
LnF1YWxjb21tLmNvbQo+IAo+IENoYW5nZXMgaW4gdjY6Cj4gLSBGaXggJGlkIHZhbHVlIGluIHRo
ZSBiaW5kaW5ncwo+IC0gRHJvcCBwYXRjaCAzLzggZnJvbSB0aGUgc2VyaWVzCj4gLSBVcGRhdGUg
aW5pdC9leGl0IGNhbGxiYWNrIHNpZ25hdHVyZXMKPiAtIExpbmsgdG8gdjU6IGh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL3IvMjAyNTExMDctcWNvbS1zYTgyNTVwLWVtYWMtdjUtMC0wMWQzZTNhYWYz
ODhAbGluYXJvLm9yZwo+IC0gTGluayB0byB2NjogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8y
MDI1MTIxOS1xY29tLXNhODI1NXAtZW1hYy12Ni0wLTQ4N2YxMDgyNDYxZUBvc3MucXVhbGNvbW0u
Y29tCj4gCj4gQ2hhbmdlcyBpbiB2NToKPiAtIE5hbWUgdGhlIERUIGJpbmRpbmcgZG9jdW1lbnQg
YWZ0ZXIgdGhlIG5ldyBjb21wYXRiaWxlCj4gLSBBZGQgbWlzc2luZyBzcGFjZQo+IC0gTWFrZSB0
aGUgcG93ZXItZG9tYWlucyBsaW1pdHMgc3RyaWN0ZXIKPiAtIExpbmsgdG8gdjQ6IGh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL3IvMjAyNTExMDQtcWNvbS1zYTgyNTVwLWVtYWMtdjQtMC1mNzY2NjAw
ODdjZWFAbGluYXJvLm9yZwo+IAo+IENoYW5nZXMgaW4gdjQ6Cj4gLSBSZW1vdmUgdGhlIHBoeXMg
cHJvcGVydHkgZnJvbSB0aGUgU0NNSSBiaW5kaW5ncwo+IC0gTWFyayB0aGUgcG93ZXItZG9tYWlu
LW5hbWVzIHByb3BlcnR5IGFzIHJlcXVpcmVkCj4gLSBTZXQgbWF4SXRlbXMgZm9yIHBvd2VyLWRv
bWFpbnMgdG8gMSBmb3IgYWxsIGV4aXN0aW5nIGJpbmRpbmdzIHRvCj4gwqAgbWFpbnRhaW4gdGhl
IGN1cnJlbnQgcmVxdWlyZW1lbnRzIGFmdGVyIG1vZGlmeWluZyB0aGUgdmFsdWUgaW4gdGhlCj4g
wqAgdG9wLWxldmVsIGRvY3VtZW50Cj4gLSBMaW5rIHRvIHYzOiBodHRwczovL2xvcmUua2VybmVs
Lm9yZy9yLzIwMjUxMDI3LXFjb20tc2E4MjU1cC1lbWFjLXYzLTAtNzU3NjdiOTIzMGFiQGxpbmFy
by5vcmcKPiAKPiBDaGFuZ2VzIGluIHYzOgo+IC0gRHJvcCAncG93ZXInIGFuZCAncGVyZicgcHJl
Zml4ZXMgZnJvbSBwb3dlciBkb21haW4gbmFtZXMKPiAtIFJlYmFzZSBvbiB0b3Agb2YgUnVzc2Vs
bCdzIGNoYW5nZXMgdG8gZHdtYWMKPiAtIFJlYmFzZSBvbiB0b3Agb2YgZXZlbiBtb3JlIGNoYW5n
ZXMgZnJvbSBSdXNzZWxsIHRoYXQgYXJlIG5vdCB5ZXQKPiDCoCBpbiBuZXh0IChFMXZCNmxkLTAw
MDAwMDBCSVB5LTJRaTRAcm1rLVBDLmFybWxpbnV4Lm9yZy51aykKPiAtIExpbmsgdG8gdjI6IGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI1MTAwOC1xY29tLXNhODI1NXAtZW1hYy12Mi0w
LTkyYmMyOTMwOWZjZUBsaW5hcm8ub3JnLwo+IAo+IENoYW5nZXMgaW4gdjI6Cj4gLSBGaXggdGhl
IHBvd2VyLWRvbWFpbnMgcHJvcGVydHkgaW4gRFQgYmluZGluZ3MKPiAtIFJld29yayB0aGUgRFQg
YmluZGluZ3MgZXhhbXBsZQo+IC0gRHJvcCB0aGUgRFRTIHBhdGNoLCBpdCB3aWxsIGdvIHVwc3Ry
ZWFtIHNlcGFyYXRlbHkKPiAtIExpbmsgdG8gdjE6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3Iv
MjAyNTA5MTAtcWNvbS1zYTgyNTVwLWVtYWMtdjEtMC0zMmE3OWNmMWU2NjhAbGluYXJvLm9yZwo+
IAo+IC0tLQo+IEJhcnRvc3ogR29sYXN6ZXdza2kgKDYpOgo+IMKgwqDCoMKgwqAgZHQtYmluZGlu
Z3M6IG5ldDogcWNvbTogZG9jdW1lbnQgdGhlIGV0aHFvcyBkZXZpY2UgZm9yIFNDTUktYmFzZWQg
c3lzdGVtcwo+IMKgwqDCoMKgwqAgbmV0OiBzdG1tYWM6IHFjb20tZXRocW9zOiB1c2UgZ2VuZXJp
YyBkZXZpY2UgcHJvcGVydGllcwo+IMKgwqDCoMKgwqAgbmV0OiBzdG1tYWM6IHFjb20tZXRocW9z
OiB3cmFwIGVtYWMgZHJpdmVyIGRhdGEgaW4gYWRkaXRpb25hbCBzdHJ1Y3R1cmUKPiDCoMKgwqDC
oMKgIG5ldDogc3RtbWFjOiBxY29tLWV0aHFvczogc3BsaXQgcG93ZXIgbWFuYWdlbWVudCBmaWVs
ZHMgaW50byBhIHNlcGFyYXRlIHN0cnVjdHVyZQo+IMKgwqDCoMKgwqAgbmV0OiBzdG1tYWM6IHFj
b20tZXRocW9zOiBzcGxpdCBwb3dlciBtYW5hZ2VtZW50IGNvbnRleHQgaW50byBhIHNlcGFyYXRl
IHN0cnVjdAo+IMKgwqDCoMKgwqAgbmV0OiBzdG1tYWM6IHFjb20tZXRocW9zOiBhZGQgc3VwcG9y
dCBmb3Igc2E4MjU1cAo+IAo+IMKgLi4uL2JpbmRpbmdzL25ldC9hbGx3aW5uZXIsc3VuN2ktYTIw
LWdtYWMueWFtbMKgwqDCoMKgIHzCoMKgIDMgKwo+IMKgLi4uL2JpbmRpbmdzL25ldC9hbHRyLHNv
Y2ZwZ2Etc3RtbWFjLnlhbWzCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgMyArCj4gwqAuLi4vYmlu
ZGluZ3MvbmV0L2FtbG9naWMsbWVzb24tZHdtYWMueWFtbMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDC
oCAzICsKPiDCoC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9lc3dpbixlaWM3NzAwLWV0aC55
YW1sIHzCoMKgIDMgKwo+IMKgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0L2ludGVsLGR3bWFj
LXBsYXQueWFtbMKgIHzCoMKgIDMgKwo+IMKgLi4uL2JpbmRpbmdzL25ldC9sb29uZ3NvbixsczFi
LWdtYWMueWFtbMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDMgKwo+IMKgLi4uL2JpbmRpbmdz
L25ldC9sb29uZ3NvbixsczFjLWVtYWMueWFtbMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDMg
Kwo+IMKgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0L254cCxkd21hYy1pbXgueWFtbMKgwqDC
oMKgIHzCoMKgIDMgKwo+IMKgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0L254cCxscGMxODUw
LWR3bWFjLnlhbWwgfMKgwqAgMyArCj4gwqAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvbnhw
LHMzMi1kd21hYy55YW1swqDCoMKgwqAgfMKgwqAgMyArCj4gwqAuLi4vZGV2aWNldHJlZS9iaW5k
aW5ncy9uZXQvcWNvbSxldGhxb3MueWFtbMKgwqDCoMKgwqDCoCB8wqDCoCAzICsKPiDCoC4uLi9i
aW5kaW5ncy9uZXQvcWNvbSxzYTgyNTVwLWV0aHFvcy55YW1swqDCoMKgwqDCoMKgwqDCoMKgIHzC
oCA5OCArKysrKwo+IMKgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0L3JlbmVzYXMscnpuMS1n
bWFjLnlhbWwgfMKgwqAgMyArCj4gwqAuLi4vYmluZGluZ3MvbmV0L3JlbmVzYXMscnp2MmgtZ2Jl
dGgueWFtbMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCAzICsKPiDCoC4uLi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL25ldC9yb2NrY2hpcC1kd21hYy55YW1swqDCoMKgIHzCoMKgIDMgKwo+IMKgLi4uL2Rl
dmljZXRyZWUvYmluZGluZ3MvbmV0L3NucHMsZHdtYWMueWFtbMKgwqDCoMKgwqDCoMKgIHzCoMKg
IDUgKy0KPiDCoC4uLi9iaW5kaW5ncy9uZXQvc29waGdvLGN2MTgwMGItZHdtYWMueWFtbMKgwqDC
oMKgwqDCoMKgwqAgfMKgwqAgMyArCj4gwqAuLi4vYmluZGluZ3MvbmV0L3NvcGhnbyxzZzIwNDQt
ZHdtYWMueWFtbMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCAzICsKPiDCoC4uLi9iaW5kaW5ncy9u
ZXQvc3RhcmZpdmUsamg3MTEwLWR3bWFjLnlhbWzCoMKgwqDCoMKgwqDCoCB8wqDCoCAzICsKPiDC
oC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9zdG0zMi1kd21hYy55YW1swqDCoMKgwqDCoMKg
IHzCoMKgIDMgKwo+IMKgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0L3Rlc2xhLGZzZC1ldGhx
b3MueWFtbMKgIHzCoMKgIDMgKwo+IMKgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0L3RoZWFk
LHRoMTUyMC1nbWFjLnlhbWwgfMKgwqAgMyArCj4gwqAuLi4vYmluZGluZ3MvbmV0L3Rvc2hpYmEs
dmlzY29udGktZHdtYWMueWFtbMKgwqDCoMKgwqDCoCB8wqDCoCAzICsKPiDCoE1BSU5UQUlORVJT
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDEgKwo+IMKgZHJpdmVycy9uZXQvZXRoZXJuZXQv
c3RtaWNyby9zdG1tYWMvS2NvbmZpZ8KgwqDCoMKgwqDCoMKgIHzCoMKgIDIgKy0KPiDCoC4uLi9l
dGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1xY29tLWV0aHFvcy5jwqDCoMKgIHwgNDAxICsr
KysrKysrKysrKysrKysrLS0tLQo+IMKgMjYgZmlsZXMgY2hhbmdlZCwgNDk4IGluc2VydGlvbnMo
KyksIDcyIGRlbGV0aW9ucygtKQo+IC0tLQo+IGJhc2UtY29tbWl0OiBkYWMxMzE1YmY1NThlNDg5
NTY2NWFhMWMyNzhmZDMwMTEzY2ExMTlkCj4gY2hhbmdlLWlkOiAyMDI1MDcwNC1xY29tLXNhODI1
NXAtZW1hYy04NDYwMjM1YWM1MTIKPiAKPiBCZXN0IHJlZ2FyZHMsCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QK
TGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
