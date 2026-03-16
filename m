Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KCwYGx7yt2mfXQEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Mar 2026 13:05:50 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F302991D3
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Mar 2026 13:05:50 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1675DC8F262;
	Mon, 16 Mar 2026 12:05:50 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B5371C8F261
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Mar 2026 12:05:48 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 62G7n2YC041951
 for <linux-stm32@st-md-mailman.stormreply.com>; Mon, 16 Mar 2026 12:05:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 7uFBMrySSyg762knrQZ8WDLYNBJTFUwiXUIQ+8VU9Pg=; b=pWohj5OkCVNuv7KM
 pcX5zRTmSz08iVsJofRQs6bshQLQOoRtpVo4lt8OkgAS5ytGeomQdtnbgsPIiIjE
 ebJrpv4eUbRhpGq0/3EUn8YCcQ91EVjqhf7ZTrl90Qalv8kApiAh4odcD3x57ZHJ
 Mjq31SyWQ8X1hOGqhwS4sO/S6myNJlE+8H+s7cmrd6r90P9WAQDG1+e9UJsJtWVI
 ktUPr8OwQB25pm0mwGJWu/tWEvISYqHcd4OCSLRPbJd455OKBtz/7JzyJQ69+iSo
 qKmqtxT7zahYK/zpcr4qYMp4NuYoYpLDeUGACcMr5TDyf/wFuXDao1hUUuj10fCy
 rD5kJw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxdt8112u-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Mar 2026 12:05:47 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8cd827a356aso2980079885a.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Mar 2026 05:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1773662747; x=1774267547;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=7uFBMrySSyg762knrQZ8WDLYNBJTFUwiXUIQ+8VU9Pg=;
 b=DxJW5HQX5Pa1b9DNZlgmRGO8FK+1BLlzmttDu2dGGfIvTshXvInoUN5YbpC3+9G4rD
 0g8VlCHugOBF8qzBXC1FfEbkelBLedeKHq4rO8LHbJ9DyjY20e7/sNciLyi/dmKvuy55
 eDpImt5tKzkCFVvACcT6/tXua0IdEbLD5zfCQZQXTkh3HXmdHTfxvz2Gp05zKfZb3NQS
 ZIMitmZSFtd7wRbwmZ8XHFrpNsu7USiYHNd0umKKaOqU3ktxk9QlA/iakwBU8LZtT2Tn
 eF1Iw5jhC/n6O3reeZ7vMaylrWHfcoILQiAfQcsV6tx9iIXmj2CRFCgMheJD2X54xRAi
 IL2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773662747; x=1774267547;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=7uFBMrySSyg762knrQZ8WDLYNBJTFUwiXUIQ+8VU9Pg=;
 b=DLCCUc6yokNiTUo8bBGbVIgT0KaL4YXXSihLnZbcPPG9wvaNuNj+izwF1uRzvZxswD
 FNnZPQJ7cW1g5He3hgPIto2XYpiIsLSTz/HD2afLg9vr86+OCgLX/gUQeGlZGJGJ6R5P
 lHF5S5ZPksBXIGfJQ3lGitHVmOecEvSqIZV4p/Hl3eD4j464uv3EpQod4BLhmCrRUI2G
 yt8U4BAyGsMsxUycZZHUNxPaUJJzTqf5YRlaGDS7mJtEdRqOMvus5U3ZgkB9GM9rsK+K
 g9+TrC+HhvWc56auzGhUMdSTpiLo+6ABI0t8eG4sRC2yBl7JPTPLq6Qlmpn6OBTo87Fo
 GG0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXtJ84/GBBjBZYs78J57zUEeFJy4lYB5GjoArSi4OxiO0vzKkjKP3UoVpvLJCcvYjpnyexjJx/+QWWsXg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxvZ7Fy1IO2AI33V8Ur+TzgQN1iQYr0njfOeKYOp4I3eZ/3KFnO
 A7sKOOUmbUBU3+mXhgZRS8xyKc/SDed2iYXKLcIF9+pSW6UYx7SxHmrIdaTlvmDQNxSz5+U3aw8
 9TF9ZCGrmUib5Za57a6kM2p8OstxUNeMZ8HlP+8O5mKNxwAtRZQkbSBIBCqO7u5nJg+J6o1KClA
 Y6sqgcgOk=
X-Gm-Gg: ATEYQzw+TtC8m9yVdU/PA9kxvZzk7Ts0XBCGKJo/ZPosCJxaL7ViMtRzGCvKXc9RJod
 MUuqHav0+LHuXBxgANebOKUUh0xNEk82zWhHLDEqK4/PNkcFX1V5N80QT+xbC/lsgwBsU5fywYd
 3qLZARRw6E9xfFQF3oyk64x7Pma5efB4DW8e+bt+WhW4ONIiQfJHghiNIPW9WvrzKivoCcHLLFD
 3LV0nF/heEZtvutu0OEu53TvQPXMaPfnqXjeDYKw5kZQRikkXDPn5nV3kUwS0QPr4koDCqw6Ya3
 dPXKxaTZxltkiA58ZX+42prqzBPzsCQ8fnXZWv3ySl8o6v1SutSIU+ILkFKN+Ms/fTM0qaifblu
 po/h4jTaplHFOOQy9NfMYy23qmJaFdQz0Y6qu6HlAckfqyHw4cvo=
X-Received: by 2002:a05:620a:40ca:b0:8c6:abc5:f169 with SMTP id
 af79cd13be357-8cdb5ba0d89mr1602660885a.73.1773662746686; 
 Mon, 16 Mar 2026 05:05:46 -0700 (PDT)
X-Received: by 2002:a05:620a:40ca:b0:8c6:abc5:f169 with SMTP id
 af79cd13be357-8cdb5ba0d89mr1602654885a.73.1773662746194; 
 Mon, 16 Mar 2026 05:05:46 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:45fe:3ba6:f90:d951])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439fe2273d9sm46468513f8f.34.2026.03.16.05.05.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Mar 2026 05:05:45 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 13:05:09 +0100
MIME-Version: 1.0
Message-Id: <20260316-qcom-sa8255p-emac-v9-4-c58934e76ff2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3509;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=hJGGsrAtahyuAplrTDgGRPmhh8bkkO/cgS9bRedR9Qk=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpt/IH7+UzksxcBqpQnoVfm94yesTehZL6KZa/o
 zJAXvOazA6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCabfyBwAKCRAFnS7L/zaE
 w0DvD/4kVc12bfMNOItY55yvgMugKA5cgssCjAAELIhilzqsOtLF+QTcauo3L1I4XkAxCeu8HnT
 YLVxoD5YyVO1KrDNdPN/7uMPGxXLeHm4YFHm56SH134R5E35bQmIJQphjvYQ4rPyafNHeIocA+M
 gTNt5zmtV9Lgg+dKckIxkmpgzdM5u7IeAONHtRFKLUK96ZdEJeqqx4qUq0x0RNMayO5tg4B/tyb
 qPozJZ0U0fzmcKSUV+vaNUgjWVw87V+bRr1UmREmSNLBjUxehepEZr8meRGeGbL2lZPcyovttRK
 YPgjYDgYAs1nqUbvw3SEW4h9pYidZpJR5x+rNeLZLJ4hkd5ranw/yW4/aHyJKNfYzS+NnXkR2nj
 AMUO0C/1KBeZ5/9Ij0f7zR5jVSCA0142W2M6reVXXATjqjnmfwYrplfZHqkhQ31cGReOb+/+rhH
 2SO/4iApf3mkTtyd9q/vNkisn3oyvw7aonZ0zIrVOYSeo+EiCPPC3cFe6biaAl6QQwWSVOR1Q4h
 fTlX8TjeiplK96fSAqsISmDmbgtxtfjj+4ZG2Fa5cloAnl6uW3rT/AXDzEvU9rxosWdvI/R7QWz
 O1Y5TdzAK9dlH/v3NPiseZjs31VVohvZU4FQdkq8oPp5+SUaFvTBjgLGoCfbdY3eNpCl0O4aayy
 Y7sbsvP+AHLWnMA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: uuBGz-aiw1JITaatAC8mByOtGCVE92B_
X-Authority-Analysis: v=2.4 cv=CKInnBrD c=1 sm=1 tr=0 ts=69b7f21b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=KCp3k1edx3YIq9yPN_4A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: uuBGz-aiw1JITaatAC8mByOtGCVE92B_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA5MiBTYWx0ZWRfXxZB7eRQOR3zb
 Iv6JU4LXKPO4yRYhxVnJptNEkSgMA7KSHq6eh+KbCExkX6LIk+ZJBDfk9ynFWsbvZdIIlnFc19s
 MXpFqR2DrkNjUU6ey05IhuQaR7SCqyn0m//NcafsFW4GG0udkm9cJszHALkGq53rosKUjHROMpj
 tS2wTLmd9RpA6M8K2OOqBezbNe9Bt9WqWT/TPnBe5vnCHxay+vU5NDJkl/EMFtm+lv5CrCXogbY
 ryQ4gO0rd0kvcFrTPjqrdrti+DAjRi9i/bxQdMWeAG80NWkOHjBCnXvtiG3uRxFBy2RWEYpAX1G
 SYMnejygypwiQPlK+TCzVoZ7VQK+jusLdRSTEtrqLF4YR5j1/XZudM08UBQg9zYWPkOAwZLMp6m
 8ZKXB198iB1vKuAlqqSFsaUqM1XtsxVX0fBamwvG319sQAKTxRdiPo3RFhtmtqZ//LCX2sTVWfI
 N35wUmhE0MNM/A7B7mA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160092
Cc: devicetree@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 linux-mips@vger.kernel.org, imx@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 brgl@kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, sophgo@lists.linux.dev,
 netdev@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-riscv@lists.infradead.org, Drew Fustini <dfustini@tenstorrent.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v9 4/6] net: stmmac: qcom-ethqos:
 split power management fields into a separate structure
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
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:vkoul@kernel.org,m:peppe.cavallaro@st.com,m:wens@kernel.org,m:jernej.skrabec@gmail.com,m:neil.armstrong@linaro.org,m:khilman@baylibre.com,m:jbrunet@baylibre.com,m:shawnguo@kernel.org,m:festevam@gmail.com,m:jan.petrous@oss.nxp.com,m:s32@nxp.com,m:mohd.anwar@oss.qualcomm.com,m:romain.gantois@bootlin.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:mripard@kernel.org,m:christophe.roullier@foss.st.com,m:brgl@kernel.org,m:rrendec@redhat.com,m:devicetree@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:linux-mips@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-sunxi@lists.linux.dev,m:linux-renesas-soc@vger.kernel.org,m:
 linux-rockchip@lists.infradead.org,m:bartosz.golaszewski@linaro.org,m:sophgo@lists.linux.dev,m:netdev@vger.kernel.org,m:linux-amlogic@lists.infradead.org,m:linux-riscv@lists.infradead.org,m:dfustini@tenstorrent.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:jernejskrabec@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[49];
	FREEMAIL_TO(0.00)[kernel.org,lunn.ch,davemloft.net,google.com,redhat.com,gmail.com,foss.st.com,st.com,linaro.org,baylibre.com,oss.nxp.com,nxp.com,oss.qualcomm.com,bootlin.com,glider.be];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[qualcomm.com:-,oss.qualcomm.com:-];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.685];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt,netdev,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:email,stormreply.com:url,linaro.org:email,qualcomm.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 50F302991D3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Now that we have a separate wrapper for device match data, let's extend
this structure with a pointer to the structure containing fields related
to power-management only. This is done because a device may have the
same device settings but different power management mode (e.g.: firmware
vs manual).

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 .../net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c   | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 8fda6c128117d7f5b1dece68c919f2a09a511210..cbfae18773c1193cd640f07824f5a66d68f9634b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -92,13 +92,17 @@ struct ethqos_emac_driver_data {
 	bool rgmii_config_loopback_en;
 	bool has_emac_ge_3;
 	u8 dma_addr_width;
-	const char *link_clk_name;
 	struct dwmac4_addrs dwmac4_addrs;
 	bool needs_sgmii_loopback;
 };
 
+struct ethqos_emac_pm_data {
+	const char *link_clk_name;
+};
+
 struct ethqos_emac_match_data {
 	const struct ethqos_emac_driver_data *drv_data;
+	const struct ethqos_emac_pm_data *pm_data;
 };
 
 struct qcom_ethqos {
@@ -301,7 +305,6 @@ static const struct ethqos_emac_driver_data emac_v4_0_0_data = {
 	.num_rgmii_por = ARRAY_SIZE(emac_v4_0_0_por),
 	.rgmii_config_loopback_en = false,
 	.has_emac_ge_3 = true,
-	.link_clk_name = "phyaux",
 	.needs_sgmii_loopback = true,
 	.dma_addr_width = 36,
 	.dwmac4_addrs = {
@@ -322,8 +325,13 @@ static const struct ethqos_emac_driver_data emac_v4_0_0_data = {
 	},
 };
 
+static const struct ethqos_emac_pm_data emac_sa8775p_pm_data = {
+	.link_clk_name = "phyaux",
+};
+
 static const struct ethqos_emac_match_data emac_sa8775p_data = {
 	.drv_data = &emac_v4_0_0_data,
+	.pm_data = &emac_sa8775p_pm_data,
 };
 
 static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
@@ -749,11 +757,13 @@ static void ethqos_ptp_clk_freq_config(struct stmmac_priv *priv)
 static int qcom_ethqos_probe(struct platform_device *pdev)
 {
 	const struct ethqos_emac_driver_data *drv_data;
+	const struct ethqos_emac_pm_data *pm_data;
 	const struct ethqos_emac_match_data *data;
 	struct plat_stmmacenet_data *plat_dat;
 	struct stmmac_resources stmmac_res;
 	struct device *dev = &pdev->dev;
 	struct qcom_ethqos *ethqos;
+	const char *clk_name;
 	int ret, i;
 
 	ret = stmmac_get_platform_resources(pdev, &stmmac_res);
@@ -800,13 +810,16 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 
 	data = device_get_match_data(dev);
 	drv_data = data->drv_data;
+	pm_data = data->pm_data;
+	clk_name = pm_data && pm_data->link_clk_name ? pm_data->link_clk_name : "rgmii";
+
 	ethqos->rgmii_por = drv_data->rgmii_por;
 	ethqos->num_rgmii_por = drv_data->num_rgmii_por;
 	ethqos->rgmii_config_loopback_en = drv_data->rgmii_config_loopback_en;
 	ethqos->has_emac_ge_3 = drv_data->has_emac_ge_3;
 	ethqos->needs_sgmii_loopback = drv_data->needs_sgmii_loopback;
 
-	ethqos->link_clk = devm_clk_get(dev, drv_data->link_clk_name ?: "rgmii");
+	ethqos->link_clk = devm_clk_get(dev, clk_name);
 	if (IS_ERR(ethqos->link_clk))
 		return dev_err_probe(dev, PTR_ERR(ethqos->link_clk),
 				     "Failed to get link_clk\n");

-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
