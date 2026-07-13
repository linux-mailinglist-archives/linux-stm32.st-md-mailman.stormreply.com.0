Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id n1pKGmXmVGoWgwAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Jul 2026 15:21:41 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AFF474B7F6
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Jul 2026 15:21:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=qualcomm.com header.s=qcppdkim1 header.b=LPTTBmz2;
	dkim=fail ("body hash did not verify") header.d=oss.qualcomm.com header.s=google header.b=Wg0827HV;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=qualcomm.com (policy=reject)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C9EC0C8F275;
	Mon, 13 Jul 2026 13:21:40 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 321E7C8F274
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Jul 2026 13:21:39 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66DCDij31480870
 for <linux-stm32@st-md-mailman.stormreply.com>; Mon, 13 Jul 2026 13:21:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 kZVfYVIvZDWgS16VLGdHQkMZZirnrupFmTaCF7qGBc8=; b=LPTTBmz2tWUvklQZ
 4w8qumFJeCIts8FsDBLzgtgmLmYfaPEXCkAMXr83lS9TifnOO8dfBqTqGLVJZjjE
 EaYmGmv7+ktoqoxELlKoy+2i4vzxFyXaFHbMUCPLts/v1wrGxluhlEHQQHy70nfn
 lGjL46Z2iuMJtbKcWgy6+snBXl62qpzQVPaP1DwTfXtRjPn6iQ6+VxRRWGVZVkTH
 +RthcJQasZ9G+nPUGjZd/L5djbL/UIpdWO8Lhc0X4c+lQfWucvS0tF0f3hDgr7N8
 hohiDIsCwQz4sN7faey4JNeqBMmC4eIfNiQSc6gCGD5z7CznLNbiX6ZihcnaPbYM
 7yGoPA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcwavrvh8-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Jul 2026 13:21:37 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-8f08560ea44so48985746d6.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Jul 2026 06:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783948896; x=1784553696;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=kZVfYVIvZDWgS16VLGdHQkMZZirnrupFmTaCF7qGBc8=;
 b=Wg0827HVPHXXWzXt9IDOLU/Kme1xS/NCueEIx2hwj6nXYTtkyjHsziDUYrVWLpNqaU
 Jsnrjdrb4oEuGpbsaaqseyWUGY8c2rajB21oqvUepWFhGckS27q5F2gKfU2WUmf1uL8n
 ROHo0G/p5Hx3w/ODpF2Rw2teO3xhNOEiQifF5tbsZ9n7ZdQEXJzFF7FoLwCy4kbnS3rA
 S4wO+0yLtZxcMBQVvaW9zlr81eXbdoYTXMlnHhHO0ARcF03YiWbR25GaVNrnKfIBgQo5
 t9n742SGVQXGqi68qCo/Kogqah7ElFqhUP9tUXLFirwQdJcTO66nOMNVbRz0odhWdL18
 RuAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783948896; x=1784553696;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=kZVfYVIvZDWgS16VLGdHQkMZZirnrupFmTaCF7qGBc8=;
 b=G9oL6HXFvD61MLYh/Vme4BY/+L+nrlfVICm9XeX2N5HNc3z7n9yC0EWDzEysnrhwn0
 pPQkIi85iO9RpEAPylZi7/r23Pi1pxhJzutQisW8QiD5ORZiTuGmxAcLCFpcwi4U/my2
 xGUe1NvVZGOxuFiftnBkbsfmvezw/LDkydvwZXTHKDMgheBF55hLl+/FxzJ1Oq40w4k7
 UKwCWG/lpJTJwk4kHO/9zg6s+ZNAeGlcSQuHnrZAOAEi/WgzA7OSHMsbMDhKI9B/7pC2
 Ol8Xze5dEoPc+P2SlM1UtW7Fbi5FVC/d/LJmHC1o3Y74GFSSPXnYn23/jpEnhCY90yzk
 Dwng==
X-Forwarded-Encrypted: i=1;
 AHgh+RqfHC/uXmhnujVyK4ER1MY8kyCyQ2gUpLRniguy4g8jpf6aCtUwItbxbSU5ECF2rmTk1evai4Dm2TmVrw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw84qlvVUuTDBADp0tQdGD6lrwX4rPXSA8n3qaPpqdcEYmNiSEg
 NIdPi9QEI1lL5on+L0W6AujEsKc4TzX4uVCsrjUp2uH21eg3G+uKlA10QEpL0QcMlLW5Q6K1GVl
 e1LZcwQ8timzEXE/OXaay6ZURNqa5nW8c7z2ynnljCAzbbLYpJ/JvWN4cBm0Y6wJWJajmJ61TIs
 wDPSN93wA=
X-Gm-Gg: AfdE7cmEZcddejm/NO0WTWUslGw0WcKts5610QRMQcrCq9YbuB4UTBodQ5YYyh82qmV
 /BN0MGnMDIeO1EaS+mOSLlVgq8B60WwMOClwU7S12Lo6r8gh4bmVPpv13k03qdoaSj9szTk/58w
 be6CYDS9d1X3PAX09MvGyD1vKPo5SBsbcnz6w7G5KVs7cqDLyViwOQvzOWpydJSN9fFB9RjDTy7
 H2qN+pEP8mn5pJJPFeVJsUI1OMdoUfQxyGzAnTGnfkdpb+lPVdoFtDp3SNnFZ619CQonqz8xAhP
 cDkB/sDpvSjtnSnC/ol0iaZCsFFUgCwafhcx+tcCVlqmB2t1xUxwbsuH6XslHtVt/dmLnAoxiLR
 Qc5yDxs77CIMzVy97/F6tWoTNcvg6mQb7OYDe+iE7
X-Received: by 2002:ac8:5cd4:0:b0:51a:8c9b:6499 with SMTP id
 d75a77b69052e-51cbf363dc8mr93366451cf.61.1783948896361; 
 Mon, 13 Jul 2026 06:21:36 -0700 (PDT)
X-Received: by 2002:ac8:5cd4:0:b0:51a:8c9b:6499 with SMTP id
 d75a77b69052e-51cbf363dc8mr93365531cf.61.1783948895804; 
 Mon, 13 Jul 2026 06:21:35 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8881:83b8:89fa:1a2a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493eb6f3dcdsm354561715e9.3.2026.07.13.06.21.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2026 06:21:34 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 15:20:37 +0200
MIME-Version: 1.0
Message-Id: <20260713-qcom-sa8255p-emac-v13-8-119f8699ef8e@oss.qualcomm.com>
References: <20260713-qcom-sa8255p-emac-v13-0-119f8699ef8e@oss.qualcomm.com>
In-Reply-To: <20260713-qcom-sa8255p-emac-v13-0-119f8699ef8e@oss.qualcomm.com>
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
 Bartosz Golaszewski <brgl@kernel.org>, Radu Rendec <radu@rendec.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5580;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=6sLA5MwnRnvx5ahGg42dP42VZ5Uj0hEZ80jvCL+QkJs=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqVOY7WoNWK1fKVT3AeUhvoZN7mOQTGCailFb2O
 0U8Uq1MWjyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCalTmOwAKCRAFnS7L/zaE
 w1bJD/9rL0/b5pecDupw06V5+gDcMleg47Bp4Mj7c0bklOTgY38+9tAIEY1SLjLB7HwKOq1nqO1
 dq4hv8Fzi1RD++rxkUrQold1tLfhGWfOD7AWhFokRPSl3ebXb4UJJqBLEUpybGawZXGb83TjRQp
 TqQuY/OFOse9hQpLrXmnjRa7HhD3bpWH03G/U0OrEuJgSkZTKivy9x9EBTukzmONTUI4CDKI5B7
 06IMnO8pk62ZFboVjxTYIkcE33flA06idPLRtgn+TLMo0HUbjS9ev9F66IQUB0Wf2oI6cj2F9HQ
 bT0Vo879IpyBDA3UI8/bUeT5ZpHpMnag47OsAvtCie56SMBsYzQlpx252so7ZAYKsYZAAKndTCt
 02Gsy7+tuMhxZLaWxu25gb+eQVAcPjjeGVKfXRDRQ2llgESiKBZ1suHws8QKRO7a/ou3vEcbSvY
 TkjQzAmNmDN/31aYfD9yGiPkwzuCc3iN4Cm2svIMRR59VtUGdi+das4vQZ4AbF28v3ka7RtPJQ3
 tutb3bPvbrnMITPys1sJm0UN1M6xGLJFAky2b/TtJFqs8IYm7ABoVAMDEi73Z4+qePbfSVhsJO7
 b94O6zEbexT8kdm6o+6NRK4c6kovWN6IfUrXXTeK57CoDiEsf4wzC81a33bYQvAkDNk6St8CbHB
 bp1Zor92Ha8l7uw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: AzR8ZvsQ8-RCDaVktXQT99kRnD3nz6tF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEzOSBTYWx0ZWRfXwwSpApHNz4z2
 XKu8UVrupbzrs47E3orJRoMmt5jNjtwZD7Ldbm0urmDJT+E9pCyX1zD9/pYR4pKHFpd7sxJYqaV
 kTKAFRdiKah5swvTeL87dvnLaYQjxZs0D2U0PreAVi5/Y0+8llvsjZXu51tBdQqzYm3E/p4Z4J5
 O4v7k/wrqecV7MF8KvifyP/RFDOJL3FIHeUOMSkuYAMpccRHueia5cqFgPsCipUTJs0qOjzwZWU
 dbJ5g8G6Ag4f4u/WZ5OQroQWvlC0MLKAVZidQVQ3HEkAYNWobaebeKl+Fv5fd5ltNcQjFjTUDuQ
 64rlf018kMgBpY1OrurKtkRbS0qilRPDFxAGKIqErzGi8lYWINDoH1CBZJtTEUVXvD7jbbTDj/s
 QDr+nrKWPrs48Dc44lFvMRb+j+0qgz2bABkr1rAX2TxM44saounql2MbX6JheRiR1pUYaIBx4sH
 2S478Zglz7DinSoMPPw==
X-Proofpoint-ORIG-GUID: AzR8ZvsQ8-RCDaVktXQT99kRnD3nz6tF
X-Authority-Analysis: v=2.4 cv=dZSwG3Xe c=1 sm=1 tr=0 ts=6a54e661 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=fhsz3KazkzAS9s_vSxIA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEzOSBTYWx0ZWRfX8lv5gXuE3O53
 uacKLoTHiabxcm0yDYifUw7wzalqjKKmf/zP4+hnCGWeQWPXQJM8GuxwXKMdcfAiwwJTyA5mFJX
 fdBN65soy1h4PtGVtLsdhXtA8FVKuE0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 adultscore=0 malwarescore=0 spamscore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130139
Cc: devicetree@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 linux-mips@vger.kernel.org, imx@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 brgl@kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, sophgo@lists.linux.dev,
 netdev@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-riscv@lists.infradead.org, Drew Fustini <dfustini@tenstorrent.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v13 08/10] net: stmmac: qcom-ethqos:
 reuse the address of ethqos_emac_driver_data
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
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[49];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:vkoul@kernel.org,m:peppe.cavallaro@st.com,m:wens@kernel.org,m:jernej.skrabec@gmail.com,m:neil.armstrong@linaro.org,m:khilman@baylibre.com,m:jbrunet@baylibre.com,m:shawnguo@kernel.org,m:festevam@gmail.com,m:jan.petrous@oss.nxp.com,m:s32@nxp.com,m:mohd.anwar@oss.qualcomm.com,m:romain.gantois@bootlin.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:mripard@kernel.org,m:christophe.roullier@foss.st.com,m:brgl@kernel.org,m:radu@rendec.net,m:devicetree@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:linux-mips@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-sunxi@lists.linux.dev,m:linux-renesas-soc@vger.kernel.org,m:lin
 ux-rockchip@lists.infradead.org,m:bartosz.golaszewski@linaro.org,m:sophgo@lists.linux.dev,m:netdev@vger.kernel.org,m:linux-amlogic@lists.infradead.org,m:linux-riscv@lists.infradead.org,m:dfustini@tenstorrent.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:jernejskrabec@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	GREYLIST(0.00)[pass,meta];
	FREEMAIL_TO(0.00)[kernel.org,lunn.ch,davemloft.net,google.com,redhat.com,gmail.com,foss.st.com,st.com,linaro.org,baylibre.com,oss.nxp.com,nxp.com,oss.qualcomm.com,bootlin.com,glider.be,rendec.net];
	DKIM_TRACE(0.00)[qualcomm.com:-,oss.qualcomm.com:-];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt,netdev,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:email,stormreply.com:url,st-md-mailman.stormreply.com:rdns,st-md-mailman.stormreply.com:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:mid,stm-ict-prod-mailman-01.stormreply.prv:helo,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0AFF474B7F6

Instead of needlessly copying the fields of ethqos_emac_driver_data into
struct qcom_ethqos, just use the address of the former as a reference.
It's .rodata after all. This is done in order to avoid having either two
calls to of_device_get_match_data() or having to extend the latter with
another field when adding support for SCMI.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 37 ++++++++--------------
 1 file changed, 14 insertions(+), 23 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index e083d7d55782ec8310e9375e466be00213667457..43384960278b87a95f14f23c45442d2bbf75d882 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -103,12 +103,7 @@ struct qcom_ethqos {
 	struct clk *link_clk;
 	struct phy *serdes_phy;
 	phy_interface_t phy_mode;
-
-	const struct ethqos_emac_por *rgmii_por;
-	unsigned int num_rgmii_por;
-	bool rgmii_config_loopback_en;
-	bool has_emac_ge_3;
-	bool needs_sgmii_loopback;
+	const struct ethqos_emac_driver_data *data;
 };
 
 static u32 rgmii_readl(struct qcom_ethqos *ethqos, unsigned int offset)
@@ -189,7 +184,7 @@ static int ethqos_set_clk_tx_rate(void *bsp_priv, struct clk *clk_tx_i,
 static void
 qcom_ethqos_set_sgmii_loopback(struct qcom_ethqos *ethqos, bool enable)
 {
-	if (!ethqos->needs_sgmii_loopback ||
+	if (!ethqos->data->needs_sgmii_loopback ||
 	    (ethqos->phy_mode != PHY_INTERFACE_MODE_2500BASEX &&
 	     ethqos->phy_mode != PHY_INTERFACE_MODE_SGMII))
 		return;
@@ -323,7 +318,7 @@ static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
 	/* Set DLL_EN */
 	rgmii_setmask(ethqos, SDCC_DLL_CONFIG_DLL_EN, SDCC_HC_REG_DLL_CONFIG);
 
-	if (!ethqos->has_emac_ge_3) {
+	if (!ethqos->data->has_emac_ge_3) {
 		rgmii_clrmask(ethqos, SDCC_DLL_MCLK_GATING_EN,
 			      SDCC_HC_REG_DLL_CONFIG);
 
@@ -353,7 +348,7 @@ static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
 	rgmii_setmask(ethqos, SDCC_DLL_CONFIG2_DDR_CAL_EN,
 		      SDCC_HC_REG_DLL_CONFIG2);
 
-	if (!ethqos->has_emac_ge_3) {
+	if (!ethqos->data->has_emac_ge_3) {
 		rgmii_clrmask(ethqos, SDCC_DLL_CONFIG2_DLL_CLOCK_DIS,
 			      SDCC_HC_REG_DLL_CONFIG2);
 
@@ -433,7 +428,7 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 	rgmii_clrmask(ethqos, RGMII_CONFIG2_RSVD_CONFIG15,
 		      RGMII_IO_MACRO_CONFIG2);
 
-	if (speed == SPEED_1000 || ethqos->has_emac_ge_3)
+	if (speed == SPEED_1000 || ethqos->data->has_emac_ge_3)
 		rgmii_setmask(ethqos, RGMII_CONFIG2_RX_PROG_SWAP,
 			      RGMII_IO_MACRO_CONFIG2);
 	else
@@ -457,7 +452,7 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 		 * in practice this becomes PRG_RCLK_DLY = 52 * 4 /
 		 *  (2 * RX delay ns)
 		 */
-		if (ethqos->has_emac_ge_3) {
+		if (ethqos->data->has_emac_ge_3) {
 			/* 0.9 ns */
 			prg_rclk_dly = 115;
 		} else {
@@ -473,7 +468,7 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 			      SDCC_HC_REG_DDR_CONFIG);
 	}
 
-	if (ethqos->rgmii_config_loopback_en)
+	if (ethqos->data->rgmii_config_loopback_en)
 		loopback = RGMII_CONFIG_LOOPBACK_EN;
 	else
 		loopback = 0;
@@ -496,9 +491,9 @@ static void ethqos_fix_mac_speed_rgmii(void *bsp_priv,
 	dev = &ethqos->pdev->dev;
 
 	/* Reset to POR values and enable clk */
-	for (i = 0; i < ethqos->num_rgmii_por; i++)
-		rgmii_writel(ethqos, ethqos->rgmii_por[i].value,
-			     ethqos->rgmii_por[i].offset);
+	for (i = 0; i < ethqos->data->num_rgmii_por; i++)
+		rgmii_writel(ethqos, ethqos->data->rgmii_por[i].value,
+			     ethqos->data->rgmii_por[i].offset);
 
 	ethqos_set_func_clk_en(ethqos);
 
@@ -512,7 +507,7 @@ static void ethqos_fix_mac_speed_rgmii(void *bsp_priv,
 	rgmii_setmask(ethqos, SDCC_DLL_CONFIG_PDN,
 		      SDCC_HC_REG_DLL_CONFIG);
 
-	if (ethqos->has_emac_ge_3) {
+	if (ethqos->data->has_emac_ge_3) {
 		if (speed == SPEED_1000) {
 			rgmii_writel(ethqos, 0x1800000, SDCC_TEST_CTL);
 			rgmii_writel(ethqos, 0x2C010800, SDCC_USR_CTL);
@@ -539,7 +534,7 @@ static void ethqos_fix_mac_speed_rgmii(void *bsp_priv,
 			      SDCC_HC_REG_DLL_CONFIG);
 
 		/* Set USR_CTL bit 26 with mask of 3 bits */
-		if (!ethqos->has_emac_ge_3)
+		if (!ethqos->data->has_emac_ge_3)
 			rgmii_updatel(ethqos, GENMASK(26, 24), BIT(26),
 				      SDCC_USR_CTL);
 
@@ -750,11 +745,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 				     "Failed to map rgmii resource\n");
 
 	data = of_device_get_match_data(dev);
-	ethqos->rgmii_por = data->rgmii_por;
-	ethqos->num_rgmii_por = data->num_rgmii_por;
-	ethqos->rgmii_config_loopback_en = data->rgmii_config_loopback_en;
-	ethqos->has_emac_ge_3 = data->has_emac_ge_3;
-	ethqos->needs_sgmii_loopback = data->needs_sgmii_loopback;
+	ethqos->data = data;
 
 	ethqos->link_clk = devm_clk_get(dev, data->link_clk_name ?: "rgmii");
 	if (IS_ERR(ethqos->link_clk))
@@ -791,7 +782,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	plat_dat->dump_debug_regs = rgmii_dump;
 	plat_dat->ptp_clk_freq_config = ethqos_ptp_clk_freq_config;
 	plat_dat->core_type = DWMAC_CORE_GMAC4;
-	if (ethqos->has_emac_ge_3)
+	if (data->has_emac_ge_3)
 		plat_dat->dwmac4_addrs = &data->dwmac4_addrs;
 	plat_dat->pmt = true;
 	if (of_property_read_bool(np, "snps,tso"))

-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
