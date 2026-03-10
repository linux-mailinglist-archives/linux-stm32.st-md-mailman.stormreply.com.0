Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0Yk/DV4ZsWleqwIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 11 Mar 2026 08:27:26 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B67C525DC56
	for <lists+linux-stm32@lfdr.de>; Wed, 11 Mar 2026 08:27:25 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 547FEC90088;
	Wed, 11 Mar 2026 07:27:25 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1AE24C8F280
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Mar 2026 01:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1773105049;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KTWcRe1uEdBcdV3dSWnFRmmQqhKcuVtF4VSklt2P5Ak=;
 b=dbD6HfYZofQSkCjS5/sPHuH7qID8izBljRHgUoXkIRLTM9ozInJNInbRTdi+jXqKTR/FqO
 f6FtQfLGpsEX+k+FdD58u4uip101yQzCnhH9fQ3aifBC9+2DzV/6NxvDeDfv9PEvoSxceZ
 b3Y1iInSfF5lvpx8O5XT9xEJ7Nj5UzU=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-433-kA_KEQE5OfyOYGOgrlMQ5A-1; Mon, 09 Mar 2026 21:10:47 -0400
X-MC-Unique: kA_KEQE5OfyOYGOgrlMQ5A-1
X-Mimecast-MFC-AGG-ID: kA_KEQE5OfyOYGOgrlMQ5A_1773105047
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-89463017976so858627026d6.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 09 Mar 2026 18:10:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773105047; x=1773709847;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KTWcRe1uEdBcdV3dSWnFRmmQqhKcuVtF4VSklt2P5Ak=;
 b=OPH9Gs7645v4SlTWrg11x2jt2OqGTzGIYaNRwXBEBkZplgpdQoTRrqZOTbjL/vW6I0
 1vSNZZSJg49Ke5XTVNAY5D5ZUAT3cITWUheVdeb9blKUji/auIkIEJGd+tLZolxIfyTe
 je00pquhIghkfcSb/yXtCa3sptMDKkHo49UqZw2u2R1hfRfKB36RlOfJixIrKcjyvm5H
 /1wsXPD4aeLQkFQDW19fo0GHH48Pz2h9WG3XWeYN1/Wi4t7Z6EibpijZ3VoVRC+6a8G1
 qF6cddun0t9vp3cHgZEJ9BzyeIFqI/6KsE+IbZWJOBXG1INFk9FHFq3CKF4EgadjhPmE
 xjSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXEcjQNylC1FWN2r16gUD7NfWcjC7kEqmBFCL3yw0VnbX67bcok5/gnM64oA9aGBH+50PE7/352rGhHLg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxeHX69/+avZrNFO0PfQzi9nSIWeNLJjTKbESqYwIblBH4h9zEv
 gpkdnGqrgdKXCcHdNwvPxCpclcu9U25QrK63Tcg5JkHgJFOKWoDJB8WIv8AmvedfWXc4ORHCVr1
 LKs7pFzi9JcrC4cHxVJBkdjZPnteq9fO6pPJp0WTNNGpHMaENTo8boKvRteNb0hfV9FlyZ2uYiP
 XNMZVxJQ==
X-Gm-Gg: ATEYQzzU18jKOCIklC97gA/DPlP/RTOHPSWLQ4bhPUXWFDNle3w4Ko1t7Gt2ZhatH0C
 6XYMTXhT/gQZPzRkgxItWjyUxnX/Qrn61wktNfCQL7NnmRdm7cdSoV2g1SkSsdWYyYchXCOEtOh
 5iazIvbMzYrk8qdpts/0Y52ZbESOziPW9ZYPisxTUplLtdMRe2HpMDVtxAy8dAZO47gOTcg+mQG
 OrRbdxEZxqHe0QUL7QcoR00GKt2Qe9uqs3jmDdsasvYeYWQEG9hdWf5ZWvwLzKWAz4ucP/GxcVW
 dmzvrG3A8GHDfb1Fcj364a5vK6n3IbqPTlm6XJ2ZTyNPhysAukndwBBRhebd/R4tsA/t6fFMSRS
 zHJlyLiEQ//WzgURP+m1GBMbd85RkJT9s5idF/QgH5cqThesuqWApvTp+ebMzFYuYGr1hs2Rjd0
 9sVsrrpVf5O3e71A==
X-Received: by 2002:a05:6214:d8b:b0:89a:258:c1d1 with SMTP id
 6a1803df08f44-89a30ad1c78mr197364616d6.42.1773105047044; 
 Mon, 09 Mar 2026 18:10:47 -0700 (PDT)
X-Received: by 2002:a05:6214:d8b:b0:89a:258:c1d1 with SMTP id
 6a1803df08f44-89a30ad1c78mr197364236d6.42.1773105046575; 
 Mon, 09 Mar 2026 18:10:46 -0700 (PDT)
Received: from thinkpad-p1.localdomain
 (pool-174-112-193-187.cpe.net.cable.rogers.com. [174.112.193.187])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-89a57a18252sm10681656d6.10.2026.03.09.18.10.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Mar 2026 18:10:45 -0700 (PDT)
Message-ID: <4728554b256f016d9a5f3e019ed831387b0f059b.camel@redhat.com>
From: Radu Rendec <rrendec@redhat.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Bjorn
 Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski	 <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Richard Cochran	
 <richardcochran@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>,  Paolo Abeni <pabeni@redhat.com>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue	
 <alexandre.torgue@foss.st.com>, Vinod Koul <vkoul@kernel.org>, Giuseppe
 Cavallaro <peppe.cavallaro@st.com>, Jose Abreu <joabreu@synopsys.com>,
 Chen-Yu Tsai <wens@kernel.org>,  Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Matthew Gerlach	
 <matthew.gerlach@altera.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl	 <martin.blumenstingl@googlemail.com>, Keguang Zhang
 <keguang.zhang@gmail.com>,  Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team	 <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Jan Petrous	 <jan.petrous@oss.nxp.com>,
 s32@nxp.com, Romain Gantois	 <romain.gantois@bootlin.com>, Lad Prabhakar	
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Heiko Stuebner
 <heiko@sntech.de>,  Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto
 <inochiama@gmail.com>, Emil Renner Berthing	 <kernel@esmil.dk>, Minda Chen
 <minda.chen@starfivetech.com>, Drew Fustini	 <fustini@kernel.org>, Guo Ren
 <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,  Nobuhiro Iwamatsu
 <nobuhiro.iwamatsu.x90@mail.toshiba>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Magnus Damm	 <magnus.damm@gmail.com>, Maxime
 Ripard <mripard@kernel.org>, Shuang Liang	
 <liangshuang@eswincomputing.com>, Zhi Li <lizhi2@eswincomputing.com>, 
 Shangjuan Wei <weishangjuan@eswincomputing.com>, "G. Jaya Kumaran"
 <vineetha.g.jaya.kumaran@intel.com>,  Clark Wang <xiaoning.wang@nxp.com>,
 Linux Team <linux-imx@nxp.com>, Frank Li <Frank.Li@nxp.com>, David Wu	
 <david.wu@rock-chips.com>, Samin Guo <samin.guo@starfivetech.com>, 
 Christophe Roullier <christophe.roullier@foss.st.com>, Swathi K S
 <swathi.ks@samsung.com>, Bartosz Golaszewski	 <brgl@kernel.org>, Mohd Ayaan
 Anwar <mohd.anwar@oss.qualcomm.com>
Date: Mon, 09 Mar 2026 21:10:41 -0400
In-Reply-To: <20260306-qcom-sa8255p-emac-v7-0-d6a3013094b7@oss.qualcomm.com>
References: <20260306-qcom-sa8255p-emac-v7-0-d6a3013094b7@oss.qualcomm.com>
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: r9kc2tmy_D6E90OoNBgNg5knR_2_M0Vzb_Xj23VikXI_1773105047
X-Mimecast-Originator: redhat.com
X-Mailman-Approved-At: Wed, 11 Mar 2026 07:27:22 +0000
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, devicetree@vger.kernel.org,
 linux-mips@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 imx@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 sophgo@lists.linux.dev, netdev@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-riscv@lists.infradead.org,
 Drew Fustini <dfustini@tenstorrent.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v7 0/7] net: stmmac: qcom-ethqos:
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Rspamd-Queue-Id: B67C525DC56
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [5.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[redhat.com : SPF not aligned (relaxed),quarantine];
	R_DKIM_REJECT(1.00)[redhat.com:s=mimecast20190719];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	DATE_IN_PAST(1.00)[30];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,lunn.ch,davemloft.net,google.com,redhat.com,foss.st.com,st.com,synopsys.com,sholland.org,altera.com,linaro.org,baylibre.com,googlemail.com,pengutronix.de,oss.nxp.com,nxp.com,bootlin.com,bp.renesas.com,sntech.de,outlook.com,esmil.dk,starfivetech.com,mail.toshiba,glider.be,eswincomputing.com,intel.com,rock-chips.com,samsung.com];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:bartosz.golaszewski@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:richardcochran@gmail.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:vkoul@kernel.org,m:peppe.cavallaro@st.com,m:joabreu@synopsys.com,m:wens@kernel.org,m:jernej.skrabec@gmail.com,m:samuel@sholland.org,m:matthew.gerlach@altera.com,m:neil.armstrong@linaro.org,m:khilman@baylibre.com,m:jbrunet@baylibre.com,m:martin.blumenstingl@googlemail.com,m:keguang.zhang@gmail.com,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:jan.petrous@oss.nxp.com,m:s32@nxp.com,m:romain.gantois@bootlin.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:heiko@sntech.de,m:unicorn_wang@outlook.com,m:inochiama@gmail.com,m:kernel@esmil.dk,m:minda.chen@starfivetech.com,m:fustini@kerne
 l.org,m:guoren@kernel.org,m:wefu@redhat.com,m:nobuhiro.iwamatsu.x90@mail.toshiba,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:mripard@kernel.org,m:liangshuang@eswincomputing.com,m:lizhi2@eswincomputing.com,m:weishangjuan@eswincomputing.com,m:vineetha.g.jaya.kumaran@intel.com,m:xiaoning.wang@nxp.com,m:linux-imx@nxp.com,m:Frank.Li@nxp.com,m:david.wu@rock-chips.com,m:samin.guo@starfivetech.com,m:christophe.roullier@foss.st.com,m:swathi.ks@samsung.com,m:brgl@kernel.org,m:mohd.anwar@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:devicetree@vger.kernel.org,m:linux-mips@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:imx@lists.linux.dev,m:linux-arm-msm@vger.kernel.org,m:bartosz.golaszewski@linaro.org,m:linux-kernel@vger.kernel.org,m:linux-sunxi@lists.linux.dev,m:linux-renesas-soc@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:sophgo@lists.linux.dev,m:netdev@vger.kernel.org,m:linux-amlogic@lists.infradead.org,m:linux-riscv@lists.infradead.org,m:dfustini@tenstorr
 ent.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[rrendec@redhat.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:-];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCPT_COUNT_GT_50(0.00)[77];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[rrendec@redhat.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.961];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt,netdev,renesas];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Action: no action

On Fri, 2026-03-06 at 16:46 +0100, Bartosz Golaszewski wrote:
> Add support for the firmware-managed variant of the DesignWare MAC on
> the sa8255p platform. This series contains new DT bindings and driver
> changes required to support the MAC in the STMMAC driver.
> 
> It also reorganizes the ethqos code quite a bit to make the introduction
> of power domains into the driver a bit easier on the eye.
> 
> The DTS changes will go in separately.

As Jakub pointed out, it conflicts with the latest net-next, but does
apply cleanly on the latest mainline, so I tested there (on a SA8775P
board running the SCMI firmware).

The two NICs come up as expected. Basic iperf3 throughput and jitter
tests look good. I would offer a Tested-by tag and a summary of the
test results, but I think it's a moot point because you'll have to
submit a new version anyway.

I will wait for you to rebase, then test again and come back with the
results.

-- 
Best regards,
Radu

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
