Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sJOML0MmAmpooQEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 11 May 2026 20:56:03 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D24514BAE
	for <lists+linux-stm32@lfdr.de>; Mon, 11 May 2026 20:56:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 06A78C8F288;
	Mon, 11 May 2026 18:56:03 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B518CC87EC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 May 2026 18:56:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 778CA44471
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 May 2026 18:56:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C6C8C2BCB0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 May 2026 18:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1778525760;
 bh=zIB79Xk6boPPhMmzQH/JqpB68ofRCBiWIY7ln6Jka+I=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=gsXWUjbyow7NEAQM0X0NALFGmQpalpbS9xBt2Q8RvtDLJbAfXJJkychRH7mExvXH3
 wLvWHyJefAS26wLfKstTSKg4fpYzXUzP9z8dBvpeunIG7OR8L+kw39IhzmarZrdw/h
 btm81FfGDWtRy7mD9/ufgpqgi4b5BojlFQrrwerXbOl2YVC1Ogd4soD3R18nrQrEhG
 nDr0emt/gHeMqaLpCF0fBYUdU7KS4/fQWh/w8yFK16D23lmWQHLQ/HbuI5h5SUrqtG
 w7slVsBwfjrHsBXY80jeoLoXsCFsndGoqWJdNItHUlKljlND4E3ff8s1IBMBD4kXtw
 okmwUrKGPyRTw==
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-5a86c1fe573so5103702e87.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 May 2026 11:56:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AFNElJ8X/+b7mfqzDuM9QFFrATvCEJB7tfyfA0tUMO8/+IESl0Cy3leMdB6wkEDB4XZPhBqDp4KaWLwFdLaeyw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwEWZWIsWfDsLVxRQ6o+0AAl0eCIqgaetWgIMHt34ckjHf/A4J6
 4ea9LxIpQ6RU5aJluffW6WBsCuOBSCRNeL+JDFUsa8lVsi5lA42BLP0YCVU7svFDcdAjAbdhFLG
 XPCUaaqBzUHN4+aYHJPKQc3jX4lamCYI=
X-Received: by 2002:a05:6512:3ba4:b0:5a8:63e0:cd92 with SMTP id
 2adb3069b0e04-5a8b709be01mr3083162e87.33.1778525758018; Mon, 11 May 2026
 11:55:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260511165942.2774868-1-robh@kernel.org>
In-Reply-To: <20260511165942.2774868-1-robh@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 11 May 2026 20:55:46 +0200
X-Gmail-Original-Message-ID: <CAD++jLkmoN3iY=d5TgkLswgEt4Dgx_j3BAJPX-ASL+VnF_EzHw@mail.gmail.com>
X-Gm-Features: AVHnY4LWa20oUaE1F0JxYrIcNTXFA3pQESxY2XotgaPrY2W88xHdQsN2xv93t9I
Message-ID: <CAD++jLkmoN3iY=d5TgkLswgEt4Dgx_j3BAJPX-ASL+VnF_EzHw@mail.gmail.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>, linux-remoteproc@vger.kernel.org,
 Heiko Stuebner <heiko@sntech.de>, imx@lists.linux.dev,
 Tanmay Shah <tanmay.shah@amd.com>, Frank Li <Frank.Li@nxp.com>,
 dri-devel@lists.freedesktop.org, Mirela Rabulea <mirela.rabulea@nxp.com>,
 Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Mohan Reddy Putluru <pmohan@couthit.com>, Suman Anna <s-anna@ti.com>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Jerome Brunet <jbrunet@baylibre.com>, Simona Vetter <simona@ffwll.ch>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, David Airlie <airlied@gmail.com>,
 Jackson Lee <jackson.lee@chipsnmedia.com>,
 Parvathi Pudi <parvathi@couthit.com>, Nas Chung <nas.chung@chipsnmedia.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Ben Levinsky <ben.levinsky@amd.com>, Michal Simek <michal.simek@amd.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Hussain Khaja <basharath@couthit.com>, Paolo Abeni <pabeni@redhat.com>,
 Konrad Dybcio <konradybcio@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Neil Armstrong <neil.armstrong@linaro.org>, Liu Ying <victor.liu@nxp.com>,
 linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-spi@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Roger Quadros <rogerq@kernel.org>, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-amlogic@lists.infradead.org,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Sean Paul <sean@poorly.run>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Roger Quadros <rogerq@ti.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 MD Danish Anwar <danishanwar@ti.com>, "Andrew F. Davis" <afd@ti.com>,
 Jessica Zhang <jesszhan0024@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>, dmaengine@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, freedreno@lists.freedesktop.org,
 "David S. Miller" <davem@davemloft.net>, Felix Fietkau <nbd@nbd.name>
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: Consolidate "sram" property
	definition
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
X-Rspamd-Queue-Id: 55D24514BAE
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
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:akhilpo@oss.qualcomm.com,m:linux-remoteproc@vger.kernel.org,m:heiko@sntech.de,m:imx@lists.linux.dev,m:tanmay.shah@amd.com,m:Frank.Li@nxp.com,m:dri-devel@lists.freedesktop.org,m:mirela.rabulea@nxp.com,m:edumazet@google.com,m:netdev@vger.kernel.org,m:marijn.suijten@somainline.org,m:pmohan@couthit.com,m:s-anna@ti.com,m:festevam@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:jbrunet@baylibre.com,m:simona@ffwll.ch,m:detlev.casanova@collabora.com,m:andrew+netdev@lunn.ch,m:airlied@gmail.com,m:jackson.lee@chipsnmedia.com,m:parvathi@couthit.com,m:nas.chung@chipsnmedia.com,m:martin.blumenstingl@googlemail.com,m:ben.levinsky@amd.com,m:michal.simek@amd.com,m:ezequiel@vanguardiasur.com.ar,m:basharath@couthit.com,m:pabeni@redhat.com,m:konradybcio@kernel.org,m:khilman@baylibre.com,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:tzimmermann@suse.de,m:neil.armstrong@linaro.org,m:victor.liu@nxp.com,m:linux-arm-msm@
 vger.kernel.org,m:s.hauer@pengutronix.de,m:linux-spi@vger.kernel.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:abhinav.kumar@linux.dev,m:rogerq@kernel.org,m:broonie@kernel.org,m:linux-mediatek@lists.infradead.org,m:kuba@kernel.org,m:matthias.bgg@gmail.com,m:linux-amlogic@lists.infradead.org,m:robin.clark@oss.qualcomm.com,m:mchehab@kernel.org,m:sean@poorly.run,m:kernel@pengutronix.de,m:linux-arm-kernel@lists.infradead.org,m:angelogioacchino.delregno@collabora.com,m:mcoquelin.stm32@gmail.com,m:rogerq@ti.com,m:lumag@kernel.org,m:mathieu.poirier@linaro.org,m:lorenzo@kernel.org,m:andersson@kernel.org,m:linux-rockchip@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:danishanwar@ti.com,m:afd@ti.com,m:jesszhan0024@gmail.com,m:vkoul@kernel.org,m:p.zabel@pengutronix.de,m:hugues.fruchet@foss.st.com,m:dmaengine@vger.kernel.org,m:krzk+dt@kernel.org,m:freedreno@lists.freedesktop.org,m:davem@davemloft.net,m:nbd@nbd.name,m:andrew@lunn.ch,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[linusw@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,vger.kernel.org,sntech.de,lists.linux.dev,amd.com,nxp.com,lists.freedesktop.org,google.com,somainline.org,couthit.com,ti.com,gmail.com,st-md-mailman.stormreply.com,baylibre.com,ffwll.ch,collabora.com,lunn.ch,chipsnmedia.com,googlemail.com,vanguardiasur.com.ar,redhat.com,kernel.org,suse.de,linaro.org,pengutronix.de,linux.intel.com,linux.dev,lists.infradead.org,poorly.run,foss.st.com,davemloft.net,nbd.name];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[kernel.org:-];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCPT_COUNT_GT_50(0.00)[75];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.670];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,stormreply.com:email,stormreply.com:url,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Action: no action

T24gTW9uLCBNYXkgMTEsIDIwMjYgYXQgNjo1OeKAr1BNIFJvYiBIZXJyaW5nIChBcm0pIDxyb2Jo
QGtlcm5lbC5vcmc+IHdyb3RlOgoKPiBUaGUgInNyYW0iIHByb3BlcnR5IGhhcyBiZWNvbWUgYSBk
ZSBmYWN0byBzdGFuZGFyZCBwcm9wZXJ0eSwgc28gY3JlYXRlIGEKPiBjb21tb24gc2NoZW1hIGZv
ciBpdCBhbmQgZHJvcCBhbGwgdGhlIGR1cGxpY2F0ZWQgZGVmaW5pdGlvbnMuCj4KPiBTaWduZWQt
b2ZmLWJ5OiBSb2IgSGVycmluZyAoQXJtKSA8cm9iaEBrZXJuZWwub3JnPgoKSSBsaWtlIGl0LgpS
ZXZpZXdlZC1ieTogTGludXMgV2FsbGVpaiA8bGludXN3QGtlcm5lbC5vcmc+CgpZb3VycywKTGlu
dXMgV2FsbGVpagpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9s
aXN0aW5mby9saW51eC1zdG0zMgo=
