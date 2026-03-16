Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qA5uKxzyt2mfXQEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Mar 2026 13:05:48 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 580A02991BD
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Mar 2026 13:05:48 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 080D4C3F945;
	Mon, 16 Mar 2026 12:05:48 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C6226C8F261
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Mar 2026 12:05:45 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 62GBkWBt744151
 for <linux-stm32@st-md-mailman.stormreply.com>; Mon, 16 Mar 2026 12:05:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 KMyUU4KR43zZozuK55Bh2YheZBvjhnscd/dIXb/Z85s=; b=bqbKE/TausygwjMR
 pXQ2QX4j3/v27dLfoyVIfPX9g1cYvRop9VAcxVW/zgev2JGsOYMcVUGoqBtVMEp4
 HGvD0rSeQoQZGDPofVKLbhnbD/TdM5zSarJphqPMGtrQ7ud7UkKlglWkGOpVHZDp
 vtZPgvBkGZIL40HP9Mq1bzF/QR50SX4VqKMndn011TqAiaegYylMqbxAWv66M7yR
 G5zxJhBWzlRvmPjIjaMwBbOVcQvEhQx5HoSp6N9B70L9kxStO+M90ZJbS0WYptJH
 z87YxR48Xf6KphArdlCfx1cwCJXC8DxLAuEpEjXZ4dVz8W/R+08ggYxA6Ve851Zg
 vRW8dg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw00bdr25-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Mar 2026 12:05:44 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id
 ada2fe7eead31-5ffba6a4d84so6176302137.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Mar 2026 05:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1773662744; x=1774267544;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=KMyUU4KR43zZozuK55Bh2YheZBvjhnscd/dIXb/Z85s=;
 b=Mw5mga8J9RrEofzdbn/42PSCxYcqJ/eiFE3Zrk6zoGkiDzozqgTOLoP4uAhaAJ+Tbe
 ACJ9so75GII3+exRnNBXMXc3wphFftacy3nYPqCMuMhHBAN2eqdG/XZ3jQO77YumkP+Z
 JQ40XNRsFjF+BoV/ScRT2M6VI3jEwc9I3kEPPjE8crroUSEhSsz0t8vEYzPhyDMiT48g
 C9xvGarHi2BWjuqIw94lPWpdwEUgymBVI7BeY61q3/5GNIlijtrfFS4nA+TfYFVYcFqR
 jwz9JV1lpuU7p7IjtTE6XhVY4BG/WMwWd0JlFaWyvcdFMcRBpuy6yxSR/18x6Tb/CWdb
 lQcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773662744; x=1774267544;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=KMyUU4KR43zZozuK55Bh2YheZBvjhnscd/dIXb/Z85s=;
 b=k7qmY3iR38wdHgLoWHzgaQB7Hzdk6C7jvJqIBQYg/30L4Zf/shKzmIGdvgj+t3O0XX
 en7c+InOjSVkWyaKPkJL6Wd5TPNAZKJaB9xZ4Y8ZbUfgB6fjxc3YB+R/dWQLIS/zFS3H
 lDIh3VlB6zOaPFMsHBgyi21cTQSEAeG5H9JCvhcIOK1B9yfVGN/DCy00tQ49ZZPa9Ccx
 xHLXAT7VBPqFQTovSqY/O3L6DAwR/OiapzShEcPOAgWKCx34nBEfkv/D/PKfm8P1HkHb
 q5kvUo09wLf9aJgivxVVegNDHHyuWLfbSg/2FemP8snY48mwjx4g52GsAy7b7U2dh7Um
 xuQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWrNElGL+sKJuxuE4bvUMx+Tsryb2pCMbWu170e73eZfol+pFkrQJDb/G08rkeKASq3KJULDEMRq5dXYg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwxXI/mgBKZv7L3kzeLd0vg2aXSvh7IXijlcchsISObm/pUd1cn
 j+ZxQcQuXq95k77AJ4d70t+ktOf6NF/Su2QbJxjQ/KQ/01Xs8jBB0RESJ5G5FJgG7TwarkNzexz
 rTaHJJHgET9yUg2/z4g94eVK3hjzdd+DZ6bn4GrOhR/kNdHy3E0KYto1DXt6+q0SZiKGM/KpGRe
 gnK3GGSoc=
X-Gm-Gg: ATEYQzxS6dn2e9BupgALp4OqbGrMva2Sx3xdfvl2TFP82uaiH6Xgh6a9OjH+h3kUUsA
 iHGllvp1j2Mp+lOTdeQcCmAKg8dkS304n3CmZDf2Idr/lCWwtRdAawzJ6OFnpWCLFTV1uvdcjOc
 hA8oXgkVgqf+RTD09UkSS/0LbZgfg9hEXxTS7WddSr8la1MeW7DixBOzQ/feofF/1J+bYDXQLHC
 fkJA8YDDHHm9ao6mN8TGYYqnrH5zlJdHPuM1/UmesJ3IdmEvLjZpmXHO+Gl3LnUZtWj99xBG9zs
 GFqrT3mEOzOWh5YLub3Jq2celRLyZCZw2QO557xOF0Lx0iq88qPDARGt3eH2DFJ6IzSWV+mwwds
 Z0D3U70hmyKdWKiTSzsAVfWqtV48haZCjaZvxNdlLC5UBo3innfc=
X-Received: by 2002:a05:6102:dd2:b0:5ff:219b:497a with SMTP id
 ada2fe7eead31-6020e1aa7e9mr4589867137.3.1773662743748; 
 Mon, 16 Mar 2026 05:05:43 -0700 (PDT)
X-Received: by 2002:a05:6102:dd2:b0:5ff:219b:497a with SMTP id
 ada2fe7eead31-6020e1aa7e9mr4589815137.3.1773662743239; 
 Mon, 16 Mar 2026 05:05:43 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:45fe:3ba6:f90:d951])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439fe2273d9sm46468513f8f.34.2026.03.16.05.05.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Mar 2026 05:05:42 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 13:05:08 +0100
MIME-Version: 1.0
Message-Id: <20260316-qcom-sa8255p-emac-v9-3-c58934e76ff2@oss.qualcomm.com>
References: <20260316-qcom-sa8255p-emac-v9-0-c58934e76ff2@oss.qualcomm.com>
In-Reply-To: <20260316-qcom-sa8255p-emac-v9-0-c58934e76ff2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5840;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=QEjA6ztNoVJqA2fzdic1acw7AfUASpMj8dS/VFE3Oks=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpt/IGiOkgQG00O6yLrjBHMqTdoAG75F1dhJnlu
 Lzf54ETAY2JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCabfyBgAKCRAFnS7L/zaE
 w/NXD/0WYnQvTwYnvGFZ3tZr0XsqU4FEWJx9KsbJOyfL1o10P2IF+tEBWRR3H+MAqxoQVwNanY6
 hvTBiTIkSuWmeK0hbtihq3ezWr93j3vu6iZSXfCBxjs0eQ6v6FZtHMg6IAhkrne8u9MQCVSopwH
 Rve4qYdPMW2EX0okqbsmSvxK7pG5MnMo0JCrOVs95H4tOzH+Q2qGjQXnhTsaY89//IS4I9BbyW2
 PS+bbn8qDXRLVYu5v1LbS1eQMElYQn6yGoWNGmQ4nZg4DAUSs2oLP85k533GObc2dHy4nHpvyRu
 1mga1B3kSsERLkShcBERg64YOOWxBWUkZZFqIrBjYe5rXiP4zwGs8k9IzsYsDntFMlKX1khQAgm
 WIaxTDbktidDuqkO17AOraRLdCD5dziT+0OAl8oazGrHrbXiyRICbqLQF2aqQGZqEiCzNDE4mNF
 aRo4Mbyvg73vpHCcXKA+URZGgR+orz90M+w8HWPtIumOLT7KuUaxIhrJ8MQ3wqEBcqvdnuJUnmw
 JCFfSzqvHWm3D2jL6Z2Ms0hTXxj7plPjtrSZG3HOm4apQi2vVhebQW6bHVlZoLU2MbcszBf7q6M
 qIpC9Si0bbE6+0bas+VDfiwncRNY997gkgjiAWrNy9KGy8GX/Fvbz1rxy9JZpVf12eHBqlzM2Yd
 1j0Glhm9rpoPZ5w==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=IsATsb/g c=1 sm=1 tr=0 ts=69b7f218 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=fYgtqwV50X64hY7jBhMA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA5MiBTYWx0ZWRfX+V7p2xr5vG8f
 KlzKw2mX57/Ny0YAYg7fgoOa6s4XRKWVqNvh2w1hqNoQ191Je5vrJn8CHoyYirAOkdXCIUQCbjb
 QOQhy8lRhi4Sr4XI9LUc4J7A10Lvg+NvoDfB4jZtuRyenVMNlP1/zVTksB6WdBoSioeHTTroQcE
 L8HL5csPn8jAgi0kJeuLvExM/5uUdWrXJWnhTwjJ50DAw3J3ZSjNVf1rXOZM6xEzGckV78iYpFO
 481Do1N1if4NELzCOw5Man+4+GkTCsUDS9uPSE6VsuMvMBazD7iL/Li1mlRp2WzdSH092ZlsAQW
 8x5DmMZREzSo/34vpHE2EnsFOAm76OuhP54QB7UOZTDBeIOLOGLPJowTfvSnAm27UZ4EQ/CUz4r
 IYoe9QeZcxgRZa4CIJJ4sKZnXOA4NOnlDjoMWtIfID9h8Wdfsa/YeIOZJ4bTcC+3i0ieIZcxW57
 4lkoYAmwpAWPtNa9VzQ==
X-Proofpoint-GUID: vasKbn8dELUWbKwS2kM8WoYi77F9icU4
X-Proofpoint-ORIG-GUID: vasKbn8dELUWbKwS2kM8WoYi77F9icU4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160092
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, devicetree@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 linux-mips@vger.kernel.org, imx@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 brgl@kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, sophgo@lists.linux.dev,
 netdev@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-riscv@lists.infradead.org, Drew Fustini <dfustini@tenstorrent.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v9 3/6] net: stmmac: qcom-ethqos:
 wrap emac driver data in additional structure
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
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:vkoul@kernel.org,m:peppe.cavallaro@st.com,m:wens@kernel.org,m:jernej.skrabec@gmail.com,m:neil.armstrong@linaro.org,m:khilman@baylibre.com,m:jbrunet@baylibre.com,m:shawnguo@kernel.org,m:festevam@gmail.com,m:jan.petrous@oss.nxp.com,m:s32@nxp.com,m:mohd.anwar@oss.qualcomm.com,m:romain.gantois@bootlin.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:mripard@kernel.org,m:christophe.roullier@foss.st.com,m:brgl@kernel.org,m:rrendec@redhat.com,m:konrad.dybcio@oss.qualcomm.com,m:devicetree@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:linux-mips@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-sunxi@lists.linux.dev,m:lin
 ux-renesas-soc@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:bartosz.golaszewski@linaro.org,m:sophgo@lists.linux.dev,m:netdev@vger.kernel.org,m:linux-amlogic@lists.infradead.org,m:linux-riscv@lists.infradead.org,m:dfustini@tenstorrent.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:jernejskrabec@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,lunn.ch,davemloft.net,google.com,redhat.com,gmail.com,foss.st.com,st.com,linaro.org,baylibre.com,oss.nxp.com,nxp.com,oss.qualcomm.com,bootlin.com,glider.be];
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
	NEURAL_HAM(-0.00)[-0.722];
	TAGGED_RCPT(0.00)[linux-stm32,dt,netdev,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:email,stormreply.com:url,linaro.org:email]
X-Rspamd-Queue-Id: 580A02991BD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

As the first step in enabling power domain support in the driver, we'll
split the device match data and runtime data structures into their
general and power-management-specific parts. To allow that: first wrap
the emac driver data in another layer which will later be expanded.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 52 +++++++++++++++-------
 1 file changed, 37 insertions(+), 15 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 66fd2ed2c2c8428694c07d89220d0e1608546791..8fda6c128117d7f5b1dece68c919f2a09a511210 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -97,6 +97,10 @@ struct ethqos_emac_driver_data {
 	bool needs_sgmii_loopback;
 };
 
+struct ethqos_emac_match_data {
+	const struct ethqos_emac_driver_data *drv_data;
+};
+
 struct qcom_ethqos {
 	struct platform_device *pdev;
 	void __iomem *rgmii_base;
@@ -223,6 +227,10 @@ static const struct ethqos_emac_driver_data emac_v2_3_0_data = {
 	.has_emac_ge_3 = false,
 };
 
+static const struct ethqos_emac_match_data emac_qcs404_data = {
+	.drv_data = &emac_v2_3_0_data,
+};
+
 static const struct ethqos_emac_por emac_v2_1_0_por[] = {
 	{ .offset = RGMII_IO_MACRO_CONFIG,	.value = 0x40C01343 },
 	{ .offset = SDCC_HC_REG_DLL_CONFIG,	.value = 0x2004642C },
@@ -239,6 +247,10 @@ static const struct ethqos_emac_driver_data emac_v2_1_0_data = {
 	.has_emac_ge_3 = false,
 };
 
+static const struct ethqos_emac_match_data emac_sm8150_data = {
+	.drv_data = &emac_v2_1_0_data,
+};
+
 static const struct ethqos_emac_por emac_v3_0_0_por[] = {
 	{ .offset = RGMII_IO_MACRO_CONFIG,	.value = 0x40c01343 },
 	{ .offset = SDCC_HC_REG_DLL_CONFIG,	.value = 0x2004642c },
@@ -271,6 +283,10 @@ static const struct ethqos_emac_driver_data emac_v3_0_0_data = {
 	},
 };
 
+static const struct ethqos_emac_match_data emac_sc8280xp_data = {
+	.drv_data = &emac_v3_0_0_data,
+};
+
 static const struct ethqos_emac_por emac_v4_0_0_por[] = {
 	{ .offset = RGMII_IO_MACRO_CONFIG,	.value = 0x40c01343 },
 	{ .offset = SDCC_HC_REG_DLL_CONFIG,	.value = 0x2004642c },
@@ -306,6 +322,10 @@ static const struct ethqos_emac_driver_data emac_v4_0_0_data = {
 	},
 };
 
+static const struct ethqos_emac_match_data emac_sa8775p_data = {
+	.drv_data = &emac_v4_0_0_data,
+};
+
 static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
 {
 	struct device *dev = &ethqos->pdev->dev;
@@ -728,7 +748,8 @@ static void ethqos_ptp_clk_freq_config(struct stmmac_priv *priv)
 
 static int qcom_ethqos_probe(struct platform_device *pdev)
 {
-	const struct ethqos_emac_driver_data *data;
+	const struct ethqos_emac_driver_data *drv_data;
+	const struct ethqos_emac_match_data *data;
 	struct plat_stmmacenet_data *plat_dat;
 	struct stmmac_resources stmmac_res;
 	struct device *dev = &pdev->dev;
@@ -778,13 +799,14 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 				     "Failed to map rgmii resource\n");
 
 	data = device_get_match_data(dev);
-	ethqos->rgmii_por = data->rgmii_por;
-	ethqos->num_rgmii_por = data->num_rgmii_por;
-	ethqos->rgmii_config_loopback_en = data->rgmii_config_loopback_en;
-	ethqos->has_emac_ge_3 = data->has_emac_ge_3;
-	ethqos->needs_sgmii_loopback = data->needs_sgmii_loopback;
-
-	ethqos->link_clk = devm_clk_get(dev, data->link_clk_name ?: "rgmii");
+	drv_data = data->drv_data;
+	ethqos->rgmii_por = drv_data->rgmii_por;
+	ethqos->num_rgmii_por = drv_data->num_rgmii_por;
+	ethqos->rgmii_config_loopback_en = drv_data->rgmii_config_loopback_en;
+	ethqos->has_emac_ge_3 = drv_data->has_emac_ge_3;
+	ethqos->needs_sgmii_loopback = drv_data->needs_sgmii_loopback;
+
+	ethqos->link_clk = devm_clk_get(dev, drv_data->link_clk_name ?: "rgmii");
 	if (IS_ERR(ethqos->link_clk))
 		return dev_err_probe(dev, PTR_ERR(ethqos->link_clk),
 				     "Failed to get link_clk\n");
@@ -815,14 +837,14 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	plat_dat->ptp_clk_freq_config = ethqos_ptp_clk_freq_config;
 	plat_dat->core_type = DWMAC_CORE_GMAC4;
 	if (ethqos->has_emac_ge_3)
-		plat_dat->dwmac4_addrs = &data->dwmac4_addrs;
+		plat_dat->dwmac4_addrs = &drv_data->dwmac4_addrs;
 	plat_dat->pmt = true;
 	if (device_property_present(dev, "snps,tso"))
 		plat_dat->flags |= STMMAC_FLAG_TSO_EN;
 	if (device_is_compatible(dev, "qcom,qcs404-ethqos"))
 		plat_dat->flags |= STMMAC_FLAG_RX_CLK_RUNS_IN_LPI;
-	if (data->dma_addr_width)
-		plat_dat->host_dma_width = data->dma_addr_width;
+	if (drv_data->dma_addr_width)
+		plat_dat->host_dma_width = drv_data->dma_addr_width;
 
 	if (ethqos->serdes_phy) {
 		plat_dat->serdes_powerup = qcom_ethqos_serdes_powerup;
@@ -837,10 +859,10 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id qcom_ethqos_match[] = {
-	{ .compatible = "qcom,qcs404-ethqos", .data = &emac_v2_3_0_data},
-	{ .compatible = "qcom,sa8775p-ethqos", .data = &emac_v4_0_0_data},
-	{ .compatible = "qcom,sc8280xp-ethqos", .data = &emac_v3_0_0_data},
-	{ .compatible = "qcom,sm8150-ethqos", .data = &emac_v2_1_0_data},
+	{ .compatible = "qcom,qcs404-ethqos", .data = &emac_qcs404_data},
+	{ .compatible = "qcom,sa8775p-ethqos", .data = &emac_sa8775p_data},
+	{ .compatible = "qcom,sc8280xp-ethqos", .data = &emac_sc8280xp_data},
+	{ .compatible = "qcom,sm8150-ethqos", .data = &emac_sm8150_data},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, qcom_ethqos_match);

-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
