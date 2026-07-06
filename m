Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id E9AkIK2rS2obYQEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 06 Jul 2026 15:20:45 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 14CC67112CB
	for <lists+linux-stm32@lfdr.de>; Mon, 06 Jul 2026 15:20:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=qualcomm.com header.s=qcppdkim1 header.b=Of8SDNd8;
	dkim=fail ("body hash did not verify") header.d=oss.qualcomm.com header.s=google header.b=Jtg07Rg3;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=qualcomm.com (policy=reject);
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D38FEC8F29E;
	Mon,  6 Jul 2026 13:20:44 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 51A5BC6C859
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 Jul 2026 13:20:43 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 666AxPWh369525
 for <linux-stm32@st-md-mailman.stormreply.com>; Mon, 6 Jul 2026 13:20:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 EswjIYLr1e96wvciUd6ySjqcZdj8RdoKtvkdKwUdjN0=; b=Of8SDNd8nSgjJ/b5
 fAMXAah/f8yVIsJxTIQZN4IS2TX1ZZhDbCRfkHtS8STKVwFNOX8hJ6rtZjjNUEWk
 ra1QRqhWhwEJuEuVJmIkKEjCyGnYRMyRouN4tOaQAL7WKGtLf6pMWd3jpTt3Y2mH
 yIB97QBgecowYhAqufxukVzcuFZFwM+XGvXOXPI7akvWbXSao/JQePT7AfyhqsKl
 TBlSuuWv5ZI5egv8hAhp+bNRuAmFql5cHMa4v59zda0oprUQ6QKaXhc46VcuwXqD
 ZXNRNv/BvaRTphCiqzmfQNUHvh356ktFDDX9m+0cmqfA2hO64P63QMAfeXoDLHrX
 zbhaew==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88h9983x-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 06 Jul 2026 13:20:42 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-92e695a3b28so391985085a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 06 Jul 2026 06:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783344041; x=1783948841;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=EswjIYLr1e96wvciUd6ySjqcZdj8RdoKtvkdKwUdjN0=;
 b=Jtg07Rg3PxXhIAdong/NQlswziM7DXgUM672qTjRRnH4i4Qkwa5/P1DmmpbfKFqGWV
 EaZrAvD1SmhAK8KU+PYzhS4LM+CCNaebmWYHNl4tdJT7O5+6+1+TlODSxjHpDxIHVAgh
 OeHRRnqg1emOtNrRCx0pfkL8yIpa2UIRbGccnqkdqGnIP/jM4/87Q3WUNz+nDP9QUUpU
 OPPX4twrxQB7rnDh38cKvt/zCPs2YbHDCkd0DXrzdWLc9Wb+Y+8UTQTsEsLCAmyXq3ja
 lyA72VCDhLWZ+8M63/hknMU8nNpsslysXm6HhtBxndbmaeDmOixCyJ9bN5TedmNg+xfl
 p+eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783344041; x=1783948841;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=EswjIYLr1e96wvciUd6ySjqcZdj8RdoKtvkdKwUdjN0=;
 b=onGiQTBOEkPmMrDtE7bj3YxXNE9ZeD1iFaZjj5kaQt6jorwH4qLPNXjRM40zEGXzeb
 sJdOdcaMRxgNUns8x99JvQ9iC8BI5R/C2HzUAWToBpItK9nIhhGpzYJOdyXa5OKrmjhM
 Z7s7TSUfeE1ewFKepomVRt0i9B2rQqIr3vu+yJmDnXDc7FIDLuhGCbrlFY0cw7LV0Zy+
 TzAQ/Dkrcdy3OV7XjhGR2I04qGV+i6N+pP4k6bOGat5X3EKg7TjeYWzEJQiO/vLc0dsC
 J6MUTXCx/nFpkXKXJ2on7ovvJnFR+Y+qVdSFMPpIEJKNwda2tgz8n0ovsfcjI9RfLMS4
 wj6A==
X-Forwarded-Encrypted: i=1;
 AHgh+RqxIW177YlCbF9mEWtwKcr61A4GHVgUrGPhvt6xXTkInCdKUhk2Dmj4qCiI6iBY+tY8NpAbDVnLaQjQ1Q==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxfruyEmojAbNxUObrOszXuqp7KtOsqkKWQKUndbkrvkbVono4a
 47qeVZ9oDJ7op1i2/EMz6SFKbZZbxYjegsx1NITDgMBP4E0dTSVbjju216h7UzHyXW1vqgi1GUb
 HDvPZ+/kFr7R4g3w6x4MYJBhWb6J2x0VMqQtIiJno0G8sANkt7C+OupdS6PWQod0HTFNabk7Qi2
 GwHqAOuW8=
X-Gm-Gg: AfdE7cl+YizfI9TPnwrbS9Jvkj2FqmKudNG1LwzasOWsk3DQBk2duTn5JAFCekFW5eh
 wVx1NLO3Fp9aiHhA6hj7hFAamYnZZQWL5pxwFe+zEw4Db3WTrRsO7xo5vO2qFCqJ8I52Qp7H+vV
 ADw+TqzurOpyPCX1unTAJLyjUcrBHnS7EKk1ncvm/Nf5594eFcxMrbbLuXxRs1/0/ep9NbTv+tV
 ChQqIpVurkNpaPVWYGdica73z4ldHIR5KpG1VcxzSXfEtjVzl4RwULnQUvub7XkoV7uwOho9FWF
 NkemGGeO1FDfc4uI13/P/fYOMpSIwy/cgT24NQP+iLXdvybmGPcrIEeYmUx1sEdLNccrXV4aGUh
 m9+kTgHTaRBj8xdkd5VhykGNrycYcHq9OdcB+0odM
X-Received: by 2002:a05:620a:688f:b0:92e:5f7e:3089 with SMTP id
 af79cd13be357-92e8b4bd907mr1698931185a.19.1783344040788; 
 Mon, 06 Jul 2026 06:20:40 -0700 (PDT)
X-Received: by 2002:a05:620a:688f:b0:92e:5f7e:3089 with SMTP id
 af79cd13be357-92e8b4bd907mr1698924685a.19.1783344040264; 
 Mon, 06 Jul 2026 06:20:40 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:86f0:c42b:ef4c:d3bb])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47ad69519c2sm25910584f8f.37.2026.07.06.06.20.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jul 2026 06:20:39 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 15:20:16 +0200
MIME-Version: 1.0
Message-Id: <20260706-qcom-sa8255p-emac-v12-1-e3ab1ecf2901@oss.qualcomm.com>
References: <20260706-qcom-sa8255p-emac-v12-0-e3ab1ecf2901@oss.qualcomm.com>
In-Reply-To: <20260706-qcom-sa8255p-emac-v12-0-e3ab1ecf2901@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Vinod Koul <vkoul@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Shawn Guo <shawnguo@kernel.org>,
 Fabio Estevam <festevam@gmail.com>,
 Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com,
 Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
 Romain Gantois <romain.gantois@bootlin.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Bartosz Golaszewski <brgl@kernel.org>, Radu Rendec <rrendec@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1956;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=BfrbL1Fwh6l+Z6nIdrB6wR8juwiurOHR3kGeK2lY/yQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqS6ubiXdhUge3ye8k09h+7C2wjU8OFOs2+lRmu
 FCvxgxqyhyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakurmwAKCRAFnS7L/zaE
 w9S3D/0WsPuArRuolQJdGz26v9pT9Wt0u35Mgl6MOyqF8MpFHp1lFyjsAjDjk4AncmfnUl8tvC6
 PVNRwP4pwlRWfAsOg7ipKdd01pTeZ4FZss0kgxwsyhwvDYpCC9olobyevp+eDaonoGUFpbCe+mI
 IeoyE856odq0d7waceNBYKbUKPNM1Wn0rJwKYyNrOmp4srgyyo0ZZ64s7uIKF1dZFtpCRsd36FU
 +WK3Nc2BfpdGf0aJnTEx6WQ5dWwLf/g5nbOgU7Wz3lcHRKSkIBwUfBx7faOER/Cm99qiDp3+9Tr
 dMQWNkO7DDcZ5/2d6vJOQcnRiAUuJN6iKoYwaqaqYKIlSO1aoW//LHz/m+mD0zYciPYhazP0xKy
 eEp5FcB5PhL1n/Xb0XFnuYxJSfh1bWvVuPK+o0gS6NHanHquydjKhJ5QkIi7OsuJ5b63LU3wWmG
 Cu/MfIMUnEpiHZw9KbEV077HhSipqMXzxdG07s4sOJAOW2TwwH7igsRy+0EywCQ+LP7TSxBvaLG
 INjs00fu3a9KB1BL2O2kfmpZRawHyXgdKtMqMTRW/pPkp72D0F4KGm0iDReGqocgixQAGKSr9eX
 vKMbfamjR9j820ac19f2q34B0tVxvUosuSTcPQ+vHIwvd9S/uXcsDT0tRs2FwWTxH4xjIEFgPmv
 iYb2sLD5F8kSxfw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: 5y-b5A4dXIyyyuT1emjnEB8LZXgSVKdp
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEzNiBTYWx0ZWRfX1P0MM3kycuHd
 +Mvm2femctkMPAsWhdVAgEFl0LIIRl8LjzhX0yQ1+OW2B42crYkAiKWWG26KhOGyefRWW1qSgDM
 ukOzih+wMGFPH2Mo8qXsHiwWNL6uufA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEzNiBTYWx0ZWRfX9pL7RSuj/m7U
 BY2hO35emFKrPi8tOSUjSGS5TVv5d0vL/H1fWQWmVans4n/uIC9DIAHQvZYpAc2ozsgba1l27SB
 wHmaQ92jj46bsAu/py963lmmb1zcnMOPbO5gsnipshEB/H6CT739dryhJ3YGnDMQSu2qYRMCTVq
 YAjoy9vWYuUs2jcNUT/75tZlIihgN/aXtGRedHQyFLO8kMtod/sBo/vhIpOABJxCEP4hzrnxnT6
 VTFwS5Xwnr6v0bb/Mv+jYvb/P4PPX3C3fSHMDh0HDB+Yj35Vj5f39b+g75SbRJbq9igtOPR+XDP
 GtasnXJMOYFZuTFHaj4k2MCJ4dwpPZ7dEDClcQDhyjZgsAILJ2c/Bv5xoKnuEjzxMvdVwxeHNQt
 Bt6iTNAWq+YpDiIvUNiyXj+U8ic5mYtnlfVN5NRaA+F7gpxiacF5xL7koeUqh+6AKyiplktZhg6
 07r0dpkcxVOOKOa8kgg==
X-Proofpoint-GUID: 5y-b5A4dXIyyyuT1emjnEB8LZXgSVKdp
X-Authority-Analysis: v=2.4 cv=GulyPE1C c=1 sm=1 tr=0 ts=6a4babaa cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=wENndLYK2PIMvs9AUu4A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060136
Cc: devicetree@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 linux-mips@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 imx@lists.linux.dev, linux-arm-msm@vger.kernel.org, brgl@kernel.org,
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, sophgo@lists.linux.dev,
 netdev@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-riscv@lists.infradead.org, Drew Fustini <dfustini@tenstorrent.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v12 1/7] dt-bindings: phy: document
 the serdes PHY on sa8255p
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
X-Spamd-Result: default: False [5.29 / 15.00];
	DMARC_POLICY_REJECT(2.00)[qualcomm.com : SPF not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:vkoul@kernel.org,m:peppe.cavallaro@st.com,m:wens@kernel.org,m:jernej.skrabec@gmail.com,m:neil.armstrong@linaro.org,m:khilman@baylibre.com,m:jbrunet@baylibre.com,m:shawnguo@kernel.org,m:festevam@gmail.com,m:jan.petrous@oss.nxp.com,m:s32@nxp.com,m:mohd.anwar@oss.qualcomm.com,m:romain.gantois@bootlin.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:mripard@kernel.org,m:christophe.roullier@foss.st.com,m:brgl@kernel.org,m:rrendec@redhat.com,m:devicetree@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:linux-mips@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:imx@lists.linux.dev,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-sunxi@lists.linux.dev
 ,m:linux-renesas-soc@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:bartosz.golaszewski@linaro.org,m:sophgo@lists.linux.dev,m:netdev@vger.kernel.org,m:linux-amlogic@lists.infradead.org,m:linux-riscv@lists.infradead.org,m:dfustini@tenstorrent.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:jernejskrabec@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,lunn.ch,davemloft.net,google.com,redhat.com,gmail.com,foss.st.com,st.com,linaro.org,baylibre.com,oss.nxp.com,nxp.com,oss.qualcomm.com,bootlin.com,glider.be];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[qualcomm.com:-,oss.qualcomm.com:-];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[50];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt,netdev,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:email,devicetree.org:url,stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:from_smtp,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 14CC67112CB

Describe the SGMII/SerDes PHY present on the Qualcomm sa8255p platforms.
This is essentially the same hardware as sa8775p rev3 but the PHY is
managed by firmware over SCMI.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 .../bindings/phy/qcom,sa8255p-dwmac-sgmii-phy.yaml | 50 ++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sa8255p-dwmac-sgmii-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sa8255p-dwmac-sgmii-phy.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..9e846e381555514bb32177f884abf0cf2c942948
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/qcom,sa8255p-dwmac-sgmii-phy.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/qcom,sa8255p-dwmac-sgmii-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SerDes/SGMII ethernet PHY controller (firmware managed)
+
+maintainers:
+  - Bartosz Golaszewski <brgl@kernel.org>
+
+description:
+  The SerDes PHY sits between the MAC and the external PHY and provides
+  separate Rx Tx lines.
+
+properties:
+  compatible:
+    const: qcom,sa8255p-dwmac-sgmii-phy
+
+  reg:
+    items:
+      - description: serdes
+
+  power-domains:
+    maxItems: 1
+
+  power-domain-names:
+    maxItems: 1
+
+  "#phy-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - "#phy-cells"
+  - power-domains
+  - power-domain-names
+
+additionalProperties: false
+
+examples:
+  - |
+    phy@8901000 {
+        compatible = "qcom,sa8255p-dwmac-sgmii-phy";
+        reg = <0x08901000 0xe10>;
+        #phy-cells = <0>;
+        power-domains = <&scmi7_dvfs 0>;
+        power-domain-names = "serdes";
+    };

-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
