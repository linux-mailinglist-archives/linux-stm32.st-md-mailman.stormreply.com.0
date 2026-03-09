Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MO1nKs2XrmnRGQIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 09 Mar 2026 10:50:05 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD90236855
	for <lists+linux-stm32@lfdr.de>; Mon, 09 Mar 2026 10:50:04 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 937E0C8F27F;
	Mon,  9 Mar 2026 09:50:04 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F091CC0693F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Mar 2026 09:50:02 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6297vxMZ3125277
 for <linux-stm32@st-md-mailman.stormreply.com>; Mon, 9 Mar 2026 09:50:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ZY1KMDG5mEhmybM9QUi64JQp3OjXLAuIqQxIS+L8bEE=; b=lhq0/5i+W9qNegQH
 4iZ2TDv+OYhkmoRgfhmxvPmWSlkpXEIuh5MZQgwo4AM3Ynv3hoJj/umUgQuspVVD
 tJNZB5kVcAKcswPNFCXiLK/XNzXJ6OQ01jnzIGffo+5jm0FuBezCFMl7vQ1REBci
 vtUsoJox3RcSzTnlFKMvPzBjnQX0elu+qzW3D0n+D/pjoeym9h1ZpLfUHM2r4mIc
 RgFO1UtlTnMC8hAPCyX8DNvS3m9eHukz0wUSD1RjkW6kWOUoS2dFLAPpsgq0xU9O
 biw8oZyeI+PGjkxkYiVbuyegRStV5PXmlXJIL/f7rskHcht0q+m+s4i4TrCa+wfe
 fPZ+4w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crc83cuu6-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 09 Mar 2026 09:50:00 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8cd80bea54dso725499585a.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 09 Mar 2026 02:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1773049800; x=1773654600;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=ZY1KMDG5mEhmybM9QUi64JQp3OjXLAuIqQxIS+L8bEE=;
 b=LDMP6QbYnb1vGv+YAM5aNZcQiU33mni/LcHmOCIcpXPCzaPdqkZsNAxECLE84bSc4T
 UFWHD4wN91NmGmeQ7tR6belRi+LK/7ZNVD+93Rkvamre/gUehv4Y8PcHPxnRqTeqIJrj
 ck2ueY+AxosUNyEmiXlil4MCRxOmxnxRfGTWBlGWXeJUWLw111HnV7REndpGT7ZcS+mk
 qkfjPyQ8hr3a1dobKGLz9aCCs990SkrjiulH90lOhF8WNmiakyFnojhwax/iI82Y/HZY
 5H+raojCgfKG/FV7UDlmgEj5MYo6vf/icClZ+siKTplt0BxpH1l7Uq/O8zMQgqTr4NsR
 JGcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773049800; x=1773654600;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZY1KMDG5mEhmybM9QUi64JQp3OjXLAuIqQxIS+L8bEE=;
 b=AI06PxSdfyqKtPIq1946hCLH+xugr04aw9+wIyGhi+Mons21AwUH69AlVLgRmop0HJ
 Di877fcdMbcypAwPgB+OXlWO+z5iO4OAVpvfsxeBhXDzFQ0OFZNd/zK/EZU1eonjEc0c
 RUxi7NstUcD5qpvOTxj+3eh7KQMj3jqW6F9tMn8G/M5+l7Edj/aMEiTeeG6cY+SP9kOf
 HbyXiJiZXG9GRxycqvyqvcaI5KJVJZEHprPDNVORGr/7BhTa5ZhvU1P1mhjx44pVQmxZ
 sf7udu01k46sFtHFFlj+2telRWlff+rRTNA4TCB+mLA9kB9Y0JBOvsfzGdOy/f6UYUPG
 REqw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMGZnUUKzVxzuvg8LgNcUl8kxqXWWNzcjcXnDlx7KLmCQ3C/rKWsscooNCC/BqX8eFHd7u04Ek5i9sKw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw1iQhbGGPoRrjErgTceUh984jo95BihkkyIqTwEOrqYBWMGhsi
 KL/R3eDXtxdVDwmzH8rQKd7XR0c8DV4+oqldFGV9EqpoY+PEjIznImHpGFwQ0/ejxmAWj0F0e30
 hKPexMGParilSH3PGRmdzoCzKxz90j8zH4OcIiOqk9rOcyI14A6DZxHf91ilbgclpnFMSgjHVh/
 CbtXChH2c=
X-Gm-Gg: ATEYQzwTHGZyNtvwNhOpE9/oidh1JnsTkDrm9NjB+BwNYfBVfX9WjM/RiRyh5Nf8kms
 FBVeew3cbTtI4qKK0w6PfKJ/ox4sOV46lrSuYfyMW17vwcw4otna4R9XymraMTCUh+yC1tEVTca
 gyRCmD3/+PM0PFv5ch4c8OdI2m3vIuMTTP2uPOq8VbGkzbSwdPfiLMUz1pbOY39vUSjPTC9zhBe
 jweFlJFlari6JLl/9L2hFHGNv2myHxrukIVPW14L2NbLjvQYbJZKsyweSr+OxrUGAcTMIVjKpsK
 Oabk8Ir8zMA42Th27pip4tqrMIyJHST3uzVPIlaQFn+bm3qkXCVtkrRttcz2EkbFsm/3xRgY3h0
 4mWugwUt5dnjKrNxsLQbMHs5oAH55kmKf3QyF+2KXsl7Vp9+S
X-Received: by 2002:a05:620a:470d:b0:8ca:d5cb:6841 with SMTP id
 af79cd13be357-8cd6d4a51a7mr1312880785a.49.1773049799893; 
 Mon, 09 Mar 2026 02:49:59 -0700 (PDT)
X-Received: by 2002:a05:620a:470d:b0:8ca:d5cb:6841 with SMTP id
 af79cd13be357-8cd6d4a51a7mr1312873785a.49.1773049799331; 
 Mon, 09 Mar 2026 02:49:59 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.94])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4852f1964edsm58099595e9.13.2026.03.09.02.49.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Mar 2026 02:49:58 -0700 (PDT)
Message-ID: <3d78694a-6a20-4197-95bb-717ec74c0433@oss.qualcomm.com>
Date: Mon, 9 Mar 2026 10:49:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bartosz Golaszewski <brgl@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>
References: <20260306-qcom-sa8255p-emac-v7-0-d6a3013094b7@oss.qualcomm.com>
 <20260306-qcom-sa8255p-emac-v7-1-d6a3013094b7@oss.qualcomm.com>
 <20260307-boisterous-tuscan-rat-1eb9bb@quoll>
 <CAMRc=MeeHP_ZjhOHu5NNLCU6Cg59EAWQAS0JngEHDQkmcDH3HQ@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <CAMRc=MeeHP_ZjhOHu5NNLCU6Cg59EAWQAS0JngEHDQkmcDH3HQ@mail.gmail.com>
X-Authority-Analysis: v=2.4 cv=R9UO2NRX c=1 sm=1 tr=0 ts=69ae97c8 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=P-IC7800AAAA:8 a=hmWrw1lzc97rlj7zVzYA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=cvBusfyB2V15izCimMoJ:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDA5MCBTYWx0ZWRfXwlSQdm0+M68G
 ko6YsaJrx0awKP9lz4+k3CpbLk7G6lpFa3HI8M1+NZV5UknLwaco21fzeAjxOyTSSfQhRZCMIME
 GiAYTGywyL+ldgorTDCI8MiVAnnYU+tMXuuDSo374vhdGLqsBBQsSyJ7pAimZIcqEIpt8Xg8t+s
 jAsAgKDk1WTnYuiKO/+rklgq35WG17ojkQ3HvlVWZrc5k9+fMpPaBZNzwEuAPC2bDksJzYhD72w
 aO8Gld5bOJJrVio9lUAAz+DjqWoewoZiECq0NiksZobUSOv8GAvo+zG9XuxPdvni4mrifkcUMLD
 dZDVc29ND67LOQiBVZCBD80xIz+7qDP0ho5m9N8QQAUWb1Rlk1neiHPaRhp9i1qhDsQymeb7A5/
 au+B3602U/mcAtsj+cnuEmNlXTkCRB+KVWxdn9+eePIOc0vf7a117ACR4ZkAf4pTuNsPXcUXpa7
 AIFsXHLy4WrlyV97OCQ==
X-Proofpoint-ORIG-GUID: a_aRFlT37LLbvl0vcIyXsGNMkYPQKJNH
X-Proofpoint-GUID: a_aRFlT37LLbvl0vcIyXsGNMkYPQKJNH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090090
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
 Rob Herring <robh@kernel.org>, Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
 Shuang Liang <liangshuang@eswincomputing.com>,
 Samuel Holland <samuel@sholland.org>, sophgo@lists.linux.dev,
 Kevin Hilman <khilman@baylibre.com>, Chen Wang <unicorn_wang@outlook.com>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
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
 Drew Fustini <dfustini@tenstorrent.com>,
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
Subject: Re: [Linux-stm32] [PATCH net-next v7 1/7] dt-bindings: net: qcom:
 document the ethqos device for SCMI-based systems
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
X-Rspamd-Queue-Id: 4FD90236855
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [5.39 / 15.00];
	DMARC_POLICY_REJECT(2.00)[qualcomm.com : SPF not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:brgl@kernel.org,m:krzk@kernel.org,m:fustini@kernel.org,m:s32@nxp.com,m:heiko@sntech.de,m:geert+renesas@glider.be,m:imx@lists.linux.dev,m:Frank.Li@nxp.com,m:christophe.roullier@foss.st.com,m:swathi.ks@samsung.com,m:edumazet@google.com,m:netdev@vger.kernel.org,m:guoren@kernel.org,m:nobuhiro.iwamatsu.x90@mail.toshiba,m:linux-amlogic@lists.infradead.org,m:shawnguo@kernel.org,m:linux-riscv@lists.infradead.org,m:festevam@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:jbrunet@baylibre.com,m:bartosz.golaszewski@linaro.org,m:robh@kernel.org,m:mohd.anwar@oss.qualcomm.com,m:liangshuang@eswincomputing.com,m:samuel@sholland.org,m:sophgo@lists.linux.dev,m:khilman@baylibre.com,m:unicorn_wang@outlook.com,m:bartosz.golaszewski@oss.qualcomm.com,m:magnus.damm@gmail.com,m:jernej.skrabec@gmail.com,m:linux-rockchip@lists.infradead.org,m:joabreu@synopsys.com,m:xiaoning.wang@nxp.com,m:linux-imx@nxp.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:konradybcio@kernel.org,m:s.haue
 r@pengutronix.de,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:kernel@esmil.dk,m:kernel@pengutronix.de,m:samin.guo@starfivetech.com,m:martin.blumenstingl@googlemail.com,m:linux-arm-msm@vger.kernel.org,m:richardcochran@gmail.com,m:david.wu@rock-chips.com,m:jan.petrous@oss.nxp.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:mripard@kernel.org,m:minda.chen@starfivetech.com,m:dfustini@tenstorrent.com,m:vineetha.g.jaya.kumaran@intel.com,m:weishangjuan@eswincomputing.com,m:peppe.cavallaro@st.com,m:wens@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:neil.armstrong@linaro.org,m:linux-sunxi@lists.linux.dev,m:linux-mips@vger.kernel.org,m:keguang.zhang@gmail.com,m:andersson@kernel.org,m:romain.gantois@bootlin.com,m:lizhi2@eswincomputing.com,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:andrew+netdev@lunn.ch,m:vkoul@kernel.org,m:mcoquelin.stm32@gmail.com,m:inochiama@gmail.com,m:krzk+dt@kernel.org,m:matthew.gerlach@altera.com,m:davem@davemloft.net,m:wefu@redhat
 .com,m:geert@glider.be,s:lists@lfdr.de];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_SENDER(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[qualcomm.com:-,oss.qualcomm.com:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_GT_50(0.00)[75];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[kernel.org,nxp.com,sntech.de,glider.be,lists.linux.dev,foss.st.com,samsung.com,google.com,vger.kernel.org,mail.toshiba,lists.infradead.org,gmail.com,st-md-mailman.stormreply.com,baylibre.com,linaro.org,oss.qualcomm.com,eswincomputing.com,sholland.org,outlook.com,synopsys.com,redhat.com,pengutronix.de,esmil.dk,starfivetech.com,googlemail.com,rock-chips.com,oss.nxp.com,bp.renesas.com,tenstorrent.com,intel.com,st.com,bootlin.com,lunn.ch,altera.com,davemloft.net];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,renesas,dt,netdev];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo,linaro.org:email,oss.qualcomm.com:mid,st-md-mailman.stormreply.com:rdns,bootlin.com:email]
X-Rspamd-Action: no action

T24gMDkvMDMvMjAyNiAwOTozOSwgQmFydG9zeiBHb2xhc3pld3NraSB3cm90ZToKPiBPbiBTYXQs
IE1hciA3LCAyMDI2IGF0IDExOjI14oCvQU0gS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6a0BrZXJu
ZWwub3JnPiB3cm90ZToKPj4KPj4gT24gRnJpLCBNYXIgMDYsIDIwMjYgYXQgMDQ6NDY6MzlQTSAr
MDEwMCwgQmFydG9zeiBHb2xhc3pld3NraSB3cm90ZToKPj4+IEZyb206IEJhcnRvc3ogR29sYXN6
ZXdza2kgPGJhcnRvc3ouZ29sYXN6ZXdza2lAbGluYXJvLm9yZz4KPj4+Cj4+PiBEZXNjcmliZSB0
aGUgZmlybXdhcmUtbWFuYWdlZCB2YXJpYW50IG9mIHRoZSBRQ29tIERlc2lnbldhcmUgTUFDLiBB
cyB0aGUKPj4+IHByb3BlcnRpZXMgaGVyZSBkaWZmZXIgYSBsb3QgZnJvbSB0aGUgSExPUy1tYW5h
Z2VkIHZhcmlhbnQsIGxldHMgcHV0IGl0Cj4+PiBpbiBhIHNlcGFyYXRlIGZpbGUuIFNpbmNlIHdl
IG5lZWQgdG8gdXBkYXRlIHRoZSBtYXhpbXVtIG51bWJlciBvZiBwb3dlcgo+Pj4gZG9tYWlucywg
bGV0J3MgdXBkYXRlIGV4aXN0aW5nIGJpbmRpbmdzIHJlZmVyZW5jaW5nIHRoZSB0b3AtbGV2ZWwK
Pj4+IHNucHMsZHdtYWMueWFtbCBhbmQgbGltaXQgdGhlaXIgbWF4SXRlbXMgZm9yIHBvd2VyLWRv
bWFpbnMgdG8gMS4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBCYXJ0b3N6IEdvbGFzemV3c2tpIDxi
YXJ0b3N6LmdvbGFzemV3c2tpQGxpbmFyby5vcmc+Cj4+PiBSZXZpZXdlZC1ieTogUm9tYWluIEdh
bnRvaXMgPHJvbWFpbi5nYW50b2lzQGJvb3RsaW4uY29tPiAjIEZvciBSWi9OMQo+Pgo+PiBDYW4g
d2UgZHJvcCBoYWxmLWJha2VkIHJldmlld3M/IFJldmlld2luZyBvbmx5IHRoYXQgcGllY2UgaXMg
bm90IGV2ZW4KPj4gcG9zc2libGUsIGJlY2F1c2UgaXQgbWFrZXMgbm8gc2Vuc2Ugb3V0c2lkZSBv
ZiBtYWluIGNoYW5nZSBjb250ZXh0LiBJT1csCj4+IGl0J3MgcG9pbnRsZXNzIHJldmlldyBvZiBu
b3RoaW5nLCBpZiB5b3UgZG8gbm90IGFjdHVhbGx5IHJldmlldyB0aGUgbWFpbgo+PiBjaGFuZ2Ug
aW1wYWN0aW5nIFJaL04xLgo+Pgo+IAo+IFRoaXMgaXMgdGhlIGZpcnN0IHRpbWUgSSdtIGhlYXJp
bmcgd2UgY2FuJ3QgcmV2aWV3IGluZGl2aWR1YWwgcGFydHMgb2YKPiBjaGFuZ2VzZXRzPyBJIHNl
ZSB5b3VyIHBvaW50IGFib3V0IHRoaXMgcGFydGljdWxhciBwYXRjaCBhbmQgdGhlIGZhY3QKCk9m
IGNvdXJzZSB5b3UgY2FuIHJldmlldy4gQW5kIHRoYXQgd2lsbCBiZSBBY2ssIG5vdCByZXZpZXdl
cidzIHN0YXRlbWVudApvZiBvdmVyc2lnaHQuCgo+IGl0IG9ubHkgbWFrZXMgc2Vuc2UgYXMgYSB3
aG9sZSBidXQgaXMgdGhpcyB0aGUgb2ZmaWNpYWwgcG9saWN5IGZvcgo+IHBhcnRzIG9mIGxhcmdl
ciBEVFMgcGF0Y2hlcz8KCgoiQWNrZWQtYnkuLi4uIHVzZXIgbWF5IG5vdCBoYXZlIGNhcnJpZWQg
b3V0IGEgdGVjaG5pY2FsIHJldmlldyBvZiB0aGUKcGF0Y2gseWV0IHRoZXkgbWF5IGJlIHNhdGlz
ZmllZCAuLi4iCgoiUmV2aWV3ZWQtYnk6LCBpbnN0ZWFkLCBpbmRpY2F0ZXMgdGhhdCB0aGUgcGF0
Y2ggaGFzIGJlZW4gcmV2aWV3ZWQgYW5kCmZvdW5kIGFjY2VwdGFibGUgYWNjb3JkaW5nIHRvIHRo
ZSBSZXZpZXdlcidzIFN0YXRlbWVudDoiCgpBYm92ZSBpbXBvcnRhbnQ6ICJUSEUgUEFUQ0giCgpJ
dCBpcyBub3QgInRoZSBwYXRjaCBvciBpdHMgcGFydHMiCgpGdXJ0aGVyOgoKIkkgc3RhdGUgdGhh
dDoKKGEpIEkgaGF2ZSBjYXJyaWVkIG91dCBhIHRlY2huaWNhbCByZXZpZXcgb2YgKnRoaXMqIHBh
dGNoIHRvIGV2YWx1YXRlCml0cyBhcHByb3ByaWF0ZW5lc3MgYW5kIHJlYWRpbmVzcyBmb3IgaW5j
bHVzaW9uIGludG8gIHRoZSBtYWlubGluZSBrZXJuZWwuIgoKQW5kIGZ1cnRoZXI6CgoiQSBSZXZp
ZXdlZC1ieSB0YWcgaXMgYSBzdGF0ZW1lbnQgb2Ygb3BpbmlvbiB0aGF0ICp0aGUgcGF0Y2gqIGlz
IGFuIgoKQW5kIHJlYWxseSwgcmVhbGx5IHJldmlld2luZyBvbmx5IFJlbmVzYXMgcGFydCBpbiB0
aGlzIHBhdGNoIGlzIE5PVCBhCnJldmlldy4gSXQgY2FyaWVzIHplcm8gbWVhbmluZyB3aGV0aGVy
IHRoaXMgcGF0Y2ggaXMgY29ycmVjdC4gSXQgY2FyaWVzCm9ubHkgYWNrbm93bGVkZ21lbnQgdGhh
dCBSZW5lc2FzIHBhcnQgc2VlbXMgZmluZSwgYnV0IGlmIG1haW4gYmluZGluZyBpcwp3cm9uZyBi
eSBtaXN0YWtlIChiZWNhdXNlIGl0IHdhcyB1bnJldmlld2VkKSwgdGhlbiBSZW5lc2FzIHBhcnQg
aXMgbm90CmZpbmUgZWl0aGVyLgoKSU9XLCBJIGJlbGlldmUsIHlvdSBjYW5ub3QgZ2l2ZSBhIGNv
cnJlY3QsICptZWFuaW5nZnVsKiByZXZpZXcgb2YgdGhpcwpiaW5kaW5nIHBhdGNoIHdpdGhvdXQg
cmV2aWV3aW5nIHRoZSByZWZlcmVuY2VkIHNjaGVtYS4KClRoYXQncyBub3QgYSBvZmZpY2lhbCBw
b3NpdGlvbiwgdGhhdCdzIG15IGludGVycHJldGF0aW9uIG9mIHN1Ym1pdHRpbmcKcGF0Y2hlcyBk
b2N1bWVudCBhbmQgbXkgZmVlbGluZyBvZiBsb2dpYyBiZWhpbmQgcGVyZm9ybWluZyBhbnkgcmV2
aWV3LgoKQmVzdCByZWdhcmRzLApLcnp5c3p0b2YKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMy
QHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
