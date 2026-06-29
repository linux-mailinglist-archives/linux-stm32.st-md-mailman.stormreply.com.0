Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FSYYASZ8QmpX8QkAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Jun 2026 16:07:34 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9053F6DBBE6
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Jun 2026 16:07:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=T2cBdcpB;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=kernel.org (policy=quarantine)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4674DC14541;
	Mon, 29 Jun 2026 14:07:33 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 31CA7C424DB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Jun 2026 14:07:31 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 276EA600C8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Jun 2026 14:07:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D26D81F000E9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Jun 2026 14:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1782742049;
 bh=bbeOSfk9uz1Wrt6J5wAea4CxiJx++/6lvqEjtpLfRco=;
 h=From:In-Reply-To:References:Date:Subject:To:Cc;
 b=T2cBdcpBltZQbc/dS7w2Gl2UqhEoGQ6sdZtr1MrFNY2Gfj4Fw8rJzfCdKmFa9eifU
 QWU8f1v8zuNGrcQVWX5ifehqs0rA4wDyXJA4IlJPuu81HSPqEmIyvSi0reKC7kHHlc
 ydLju7W1RcXkhe2yIGg5qlr8ShNspLlI2Vzx9LP1h8PnkPuWdpKk+T8mQybcO8e3cI
 txMnh5sPsuUr7F7RRH6SxymxmbPs85PPP9e2n2UASI970GaWEEzMMBHMSauWdKugVS
 v/eRkREv5Qmfajz5+IwHjZi7FdEVC5OIywvBkbFlrgzhj66+6mSPly3N9XttVJNe8p
 JnzzBMyZpIvWQ==
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-39b093b42b4so9658791fa.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Jun 2026 07:07:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AHgh+RqiqHxa8aq1wxsl16WmKrKId/oFOgvxoTz5YNaVEx30GlDhqWUDFV1HBasMmb2oU8FWw8N4+I460ep1wA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yz/7IReZlGdmE1nrt7qzZG5NaFB81RShvgvfiY9ZSkJfFJ1e5b+
 b3pWyPR7NtGEgEAFbnEsUCJSghffjaZBajmgDk6PgcVHrSrvn+FWQksa4Ie/PQxj+IG8wQlfBWx
 P7izsCHteQSOSa/OlpPE5+9SOHarfRWyD0FSZruCFjA==
X-Received: by 2002:a05:651c:146c:b0:396:5d0a:765a with SMTP id
 38308e7fff4ca-39acb8ffa66mr33873361fa.21.1782742048596; Mon, 29 Jun 2026
 07:07:28 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 29 Jun 2026 07:07:24 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 29 Jun 2026 07:07:24 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <CAMuHMdXen+E-Ai51aWBa_KV9W8Fz2cQPpT-FG_kQ7akhrrYa_A@mail.gmail.com>
MIME-Version: 1.0
References: <20260629-qcom-sa8255p-emac-v11-0-1b7fb95b51f9@oss.qualcomm.com>
 <20260629-qcom-sa8255p-emac-v11-1-1b7fb95b51f9@oss.qualcomm.com>
 <CAMuHMdXen+E-Ai51aWBa_KV9W8Fz2cQPpT-FG_kQ7akhrrYa_A@mail.gmail.com>
Date: Mon, 29 Jun 2026 07:07:24 -0700
X-Gmail-Original-Message-ID: <CAMRc=Me3jaZXiXa1sFXr=8Do4sCd+XN1pKTcWC8-0j78SjCkKA@mail.gmail.com>
X-Gm-Features: AVVi8CfgGr0R3g5nrNxVwL-t6-jaKI4wsgAKUpj-c_HwbEC7_gerPUuikt96dHI
Message-ID: <CAMRc=Me3jaZXiXa1sFXr=8Do4sCd+XN1pKTcWC8-0j78SjCkKA@mail.gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
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
 Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 linux-arm-msm@vger.kernel.org, Jan Petrous <jan.petrous@oss.nxp.com>,
 Maxime Ripard <mripard@kernel.org>, linux-mips@vger.kernel.org,
 Drew Fustini <dfustini@tenstorrent.com>, sophgo@lists.linux.dev,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Chen-Yu Tsai <wens@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [4.79 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20260515];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lists.linux.dev,nxp.com,redhat.com,vger.kernel.org,google.com,lists.infradead.org,gmail.com,st-md-mailman.stormreply.com,baylibre.com,kernel.org,oss.qualcomm.com,bootlin.com,oss.nxp.com,tenstorrent.com,st.com,linaro.org,foss.st.com,lunn.ch,davemloft.net];
	RCPT_COUNT_TWELVE(0.00)[47];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[brgl@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	GREYLIST(0.00)[pass,meta];
	FORGED_RECIPIENTS(0.00)[m:geert@linux-m68k.org,m:imx@lists.linux.dev,m:s32@nxp.com,m:rrendec@redhat.com,m:linux-kernel@vger.kernel.org,m:edumazet@google.com,m:linux-amlogic@lists.infradead.org,m:linux-riscv@lists.infradead.org,m:festevam@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:jbrunet@baylibre.com,m:robh@kernel.org,m:mohd.anwar@oss.qualcomm.com,m:romain.gantois@bootlin.com,m:khilman@baylibre.com,m:bartosz.golaszewski@oss.qualcomm.com,m:magnus.damm@gmail.com,m:jernej.skrabec@gmail.com,m:linux-rockchip@lists.infradead.org,m:kuba@kernel.org,m:pabeni@redhat.com,m:konradybcio@kernel.org,m:linux-sunxi@lists.linux.dev,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:brgl@kernel.org,m:linux-arm-msm@vger.kernel.org,m:jan.petrous@oss.nxp.com,m:mripard@kernel.org,m:linux-mips@vger.kernel.org,m:dfustini@tenstorrent.com,m:sophgo@lists.linux.dev,m:peppe.cavallaro@st.com,m:wens@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:neil.armstrong@linaro.org,m:netdev@vger.kernel.org
 ,m:andersson@kernel.org,m:bartosz.golaszewski@linaro.org,m:christophe.roullier@foss.st.com,m:linux-renesas-soc@vger.kernel.org,m:andrew+netdev@lunn.ch,m:vkoul@kernel.org,m:mcoquelin.stm32@gmail.com,m:krzk+dt@kernel.org,m:shawnguo@kernel.org,m:davem@davemloft.net,m:magnusdamm@gmail.com,m:jernejskrabec@gmail.com,m:conor@kernel.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:-];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,qualcomm.com:email,mail.gmail.com:mid,stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:rdns,st-md-mailman.stormreply.com:from_smtp];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt,netdev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9053F6DBBE6

On Mon, 29 Jun 2026 15:51:31 +0200, Geert Uytterhoeven
<geert@linux-m68k.org> said:
> Hi Bartosz,
>
> Thanks for your patch!
>
> On Mon, 29 Jun 2026 at 13:29, Bartosz Golaszewski
> <bartosz.golaszewski@oss.qualcomm.com> wrote:
>> Describe the SGMII/SerDes PHY present on the Qualcomm sa8255p platforms.
>> This is essentially the same hardware as sa8775p rev3 but the PHY is
>> managed by firmware over SCMI.
>
> So why can't it be reuse the DT bindings, and be compatible with
> qcom,sa8775p-dwmac-sgmii-phy?
>
>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/phy/qcom,sa8255p-dwmac-sgmii-phy.yaml
>
>> +  power-domains:
>> +    maxItems: 1
>> +
>> +  power-domain-names:
>> +    items:
>> +      - const: serdes
>
>> +examples:
>> +  - |
>> +    phy@8901000 {
>> +        compatible = "qcom,sa8255p-dwmac-sgmii-phy";
>> +        reg = <0x08901000 0xe10>;
>> +        #phy-cells = <0>;
>> +        power-domains = <&scmi7_dvfs 0>;
>> +        power-domain-names = "serdes";
>
> Ah, this uses power-domains, while the existing bindings for
> qcom,sa8775p-dwmac-sgmii-phy use a clock.
> I guess the clock is the correct hardware description?
>
> Adding to my list of examples for backing a hardware-to-SCMI remapping
> driver...
>

Russell King asked me to put the PHY logic for SCMI pm domains into the PHY
driver instead of the MAC driver where it was previously. Instead of cramming
both HLOS and firmware handling into the same driver, I figured it makes more
sense to have a dedicated, cleaner driver as the two share very little code (if
any).

Bart
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
