Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wHBAGwX3qmlxZAEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 06 Mar 2026 16:47:17 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E25224271
	for <lists+linux-stm32@lfdr.de>; Fri, 06 Mar 2026 16:47:17 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D264AC8F283;
	Fri,  6 Mar 2026 15:47:16 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 75519C8F272
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Mar 2026 15:47:15 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 626FVtKD537343
 for <linux-stm32@st-md-mailman.stormreply.com>; Fri, 6 Mar 2026 15:47:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 2NRYH8lzJWLHa5JUwCNp14+Y3Xn6J7jBFL10EVR15BE=; b=blZWVVFdJm5pq2s4
 PO1IoTK0oZUWN8RBadFnYGbAlc3m2nYxCCAZJoeyN8dZ2GzS0bjFpB/+/WRbRyOp
 cZpzJbPQfn7+onkLGvTUQeviugYAqHOq/E6UEdZyavJbNRK4yvXe+mYUOU7QPYb7
 d0JbnJ8/vwP1drmZ8bqjvxRL3p2PFud7Af9xu0yJEOdXGhYQ882xIq3BJHerJ0ya
 OQ6T2xzkQsIWvvryi6uV2qq00vNQNaUvC9TLAdVdndnGw3EonILWJcNmO7I7ippn
 jt1rdjFiMLsOW7gxeD34OZKDaDvhyZit9ACXtl7PpgHj6PU82Ath2n/2lmPJW0Xg
 hjUYFQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqpxdtc0e-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 06 Mar 2026 15:47:13 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8c881d0c617so5049893885a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 06 Mar 2026 07:47:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772812033; x=1773416833;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=2NRYH8lzJWLHa5JUwCNp14+Y3Xn6J7jBFL10EVR15BE=;
 b=J/h9T9RmV8GqAJgrtkcOxPxkkvtBdt32bCQzxR29Z/dkhNqhhZ57BlpWw488P2Ouru
 m3Yndg9VMgwbAQmiA05Nna/+MOVd3gH0GjlWUQSYwg+T7rFgMtyf0RL2USPrctFZfWgX
 RF7aXk9/dw1kqa3XGELG50LcTnnvxACteH298TyjXqveFmKtcSSloRX5O8OZPYSw00SB
 a3MrYCqLcQQ3mEwmeGTy5KwzNF2ApusAFuzSqpZOGKDauMjRaY1Ji1kb93ce+2orRpRK
 mXUbxc0Dh3mCzNfro/Lp4Kh/0bE+GgrGEBdyG3HZO8ONbM4K8IUgiJX9osLYsWnEo5sC
 7qeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772812033; x=1773416833;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=2NRYH8lzJWLHa5JUwCNp14+Y3Xn6J7jBFL10EVR15BE=;
 b=OfGGVSW4wuXqQEWHcq42Nha5EenJCY+VTBHLLRCs+L17Xy7X9lMJ5AkIfxar6PR0dD
 M6zNzg8q5q/mVpgh68l2b/MMiM0A1gt7KlAyN/Xw4CYPIJiDMPgfLIMAm//cifyiyxI8
 /K1t0FqBHOypVuIvDGNqVaOo+9ANBh/N1gX0GjXCDnq6KEi1lDGNIwnLPpn2LS1XBzWd
 a2lD5559dxSXdPz+6WtjSX8Jfvxe1beYeNM6PFqwoNnYrU0wyN2MqTAgQNG1KRY980ft
 gLLKn3EYa67zUEAKDQFd1UXkzcXAdOxfjsp95TGCPFzihkb0xGZW1Dju4x+8S0lzzi4J
 i/cA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWkE2FzBrEqnE4OfZOlgSn26EqCcXDFAJdjwRq/T04tqz4xYC4B68yd4dAxuS5ub/AWXbNmaNnDP514hA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyQEEgW8Nm3mGstoIEg/OLzjh7HFWTeP4xM9/Jhb2trVBLMdnmm
 CnsYF+WBGsbjX0JcHok0UzBB69sL4K5sLC6+z4POyMJOJXJaYp/6IRoCUQurJ7p59noTGA7q4kK
 vdnW3u09qxeHZZSg2aaP12ZPnIkx7sYW9xV77KuMkkRxn63Sp2lx9YHqsgsJY6yqGz3tSUH4E7V
 SAZYFQ9vA=
X-Gm-Gg: ATEYQzyFs3tlrKxsTnTbr+/9nwR8Vemy2oxS/oz3ZL++bRTWLAByXSGRT11yA10FsrK
 cfxmdRHSneitYHARk6Xfo1jCnIfPWPzRcS0xlk96pHmlukAy1XxIJ/NcDjRSxzVkcVF2uoEB4ev
 qhw3Wdw/NIYS290qyqr/bkbXa7iBGH9rV6RV+C69SuKQlNbATpGaeppBHt9++6HQ47aD+0nC7oW
 4T51WUmOFWeoAAoo9DDl6JzHVdzqIxy6q/+xnxMcj9TrzuHrX6VqX/PMkHWJcdIYr0C6oWkKUHL
 a8u2CPp6LIUWz8ENJQjx5Z5thMKsDMTbP2jjuiTYKnVWibqCds3OCDzCjcfH14XvTjXnQ5Ypm1B
 fG4Fu2sopqENINxOVA9XLQ4YxQXoauRAyfL/QfMrsygCm8rjVCdPk
X-Received: by 2002:a05:620a:4481:b0:8b2:7777:f662 with SMTP id
 af79cd13be357-8cd6d52ca78mr307269285a.64.1772812032579; 
 Fri, 06 Mar 2026 07:47:12 -0800 (PST)
X-Received: by 2002:a05:620a:4481:b0:8b2:7777:f662 with SMTP id
 af79cd13be357-8cd6d52ca78mr307261085a.64.1772812031898; 
 Fri, 06 Mar 2026 07:47:11 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:6d2b:ebde:c946:11eb])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439dae35cf7sm5122767f8f.26.2026.03.06.07.47.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2026 07:47:11 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 06 Mar 2026 16:46:40 +0100
MIME-Version: 1.0
Message-Id: <20260306-qcom-sa8255p-emac-v7-2-d6a3013094b7@oss.qualcomm.com>
References: <20260306-qcom-sa8255p-emac-v7-0-d6a3013094b7@oss.qualcomm.com>
In-Reply-To: <20260306-qcom-sa8255p-emac-v7-0-d6a3013094b7@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Richard Cochran <richardcochran@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Vinod Koul <vkoul@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Jose Abreu <joabreu@synopsys.com>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Matthew Gerlach <matthew.gerlach@altera.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Keguang Zhang <keguang.zhang@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com,
 Romain Gantois <romain.gantois@bootlin.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Heiko Stuebner <heiko@sntech.de>, Chen Wang <unicorn_wang@outlook.com>,
 Inochi Amaoto <inochiama@gmail.com>,
 Emil Renner Berthing <kernel@esmil.dk>,
 Minda Chen <minda.chen@starfivetech.com>,
 Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>,
 Fu Wei <wefu@redhat.com>,
 Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Shuang Liang <liangshuang@eswincomputing.com>,
 Zhi Li <lizhi2@eswincomputing.com>,
 Shangjuan Wei <weishangjuan@eswincomputing.com>,
 "G. Jaya Kumaran" <vineetha.g.jaya.kumaran@intel.com>,
 Clark Wang <xiaoning.wang@nxp.com>, Linux Team <linux-imx@nxp.com>,
 Frank Li <Frank.Li@nxp.com>, David Wu <david.wu@rock-chips.com>,
 Samin Guo <samin.guo@starfivetech.com>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Swathi K S <swathi.ks@samsung.com>, Bartosz Golaszewski <brgl@kernel.org>,
 Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3034;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=u8u/iXjZq36K7RYc1MNw8bxCkqJ95fEzxfvBCtp9cjI=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpqvbryaTIb50mRpj4hrxdrase97KkN9iHxwUJp
 BlJuvI37VWJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaar26wAKCRAFnS7L/zaE
 wzclD/0ZZh4K959JYxRQjHxVfznc7OkBZWgPBrYs8wAo/K3hokNK0WiKMHJZLzn2SMWtqWzVB0C
 lG0CmntJphIJ1AWgN+rXR93gl3L/sk5A6pAGK7SSpHgcKQlf8M1jF5SOdkc3uDgiPPbHCwxhOPV
 jfsOa3iwvidAeWEMmqummdnOf24q3RxuNLVYxiwqK9KQtEssdTXJFhs3HX4WSDrjs/zBKmKvWfn
 JfxMeHdfG7t91xJMf/P5Wp3DVHk5JKSvM5Lw9DE7CpH8hsz4OoZX1BZ9pxQwOeWcTQiPXheDP4H
 2uoOJ4gBkGRVCondWFER/PJsd0MdsXH5KOFfGoxuqaGdgK1Y3qqZ8vVFIxGTJSNkT4w0iZf3V+q
 w534YqTJUi3ZcbICEFTeWEJ0szhN2f2NEjKDqoPq8mJ8/FfC3bW+4fJQEhhxdpdhQWFeAW3sIC1
 Qc4NbVsTYrLkgRdSzSscY2UwVbUcqY2gpTkANq+PSasQaATRxTxNvKS0sINBmqyjUJmZB9tPw0D
 fB7ST1Lzwr8JkoDBdXDhAT3DM0FM3lJs+m8ywJMoOhaQf0+AsZ5IDwxI61znd6YAwLIw8bOQAQg
 Auc4hPSxQt6V6qfOaIm93wh6MAaEr6z5BfcPqlyr68NN61ugGkB2/8dMWzloVwETVtM1dMCmmwV
 DKcCepzLPjDweIw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: _LR-AVXBUnsO855YkJ-3U8yJXSBHrTYy
X-Authority-Analysis: v=2.4 cv=E83AZKdl c=1 sm=1 tr=0 ts=69aaf701 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=AGkLNbZTeN-MX8W9OO4A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE0NiBTYWx0ZWRfX4gj0CmpjcLyB
 WDydmQfRvOgWjYdwMSe6HNpjnxTJqP/+iVJvi2/bQZCZ2Hz7mfEEu9YGpnrZxVEEmFXxWNa5jx8
 UG/oNQySu5TKBmkLcUG/To+TMQn6gLQUW0SUOH/O9gvAEKnUMjjNsMskvoI3csrYMIn3mIFimPo
 YGzS0+mDf/AXeZFoUB7fA2t1MMwOim6B3TO6xbgKAiAP6p08VszxqM83BLtevAMLLq02Lj4rENA
 oqy4KC8GqzbJNHeS4eAs0xYZeTJQjS57ajJjENjrmOzrMnGu6HMpuLelnSzH5wEvwGcfCe0UL3e
 LsevqPGAi0hosFQYQnQzB+J/zJpyQyA5N6MqW/LYzg+C8mpo/ewkoVHd6v4PjJhbiFMH88zz8B9
 Z65Giv78z1niSfClQDaZ1yBBdcntHnE3v3TQP/JWx1hnIHuIs+qaa2MwySui7R8aScyhVMS7o+Z
 7PGU1ho/EFEIy/vPuUA==
X-Proofpoint-GUID: _LR-AVXBUnsO855YkJ-3U8yJXSBHrTYy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_04,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060146
Cc: devicetree@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 linux-mips@vger.kernel.org, imx@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 brgl@kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, sophgo@lists.linux.dev,
 netdev@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-riscv@lists.infradead.org, Drew Fustini <dfustini@tenstorrent.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v7 2/7] net: stmmac: qcom-ethqos: use
 generic device properties
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
X-Rspamd-Queue-Id: 20E25224271
X-Rspamd-Server: lfdr
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
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:richardcochran@gmail.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:vkoul@kernel.org,m:peppe.cavallaro@st.com,m:joabreu@synopsys.com,m:wens@kernel.org,m:jernej.skrabec@gmail.com,m:samuel@sholland.org,m:matthew.gerlach@altera.com,m:neil.armstrong@linaro.org,m:khilman@baylibre.com,m:jbrunet@baylibre.com,m:martin.blumenstingl@googlemail.com,m:keguang.zhang@gmail.com,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:jan.petrous@oss.nxp.com,m:s32@nxp.com,m:romain.gantois@bootlin.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:heiko@sntech.de,m:unicorn_wang@outlook.com,m:inochiama@gmail.com,m:kernel@esmil.dk,m:minda.chen@starfivetech.com,m:fustini@kernel.org,m:guoren@kernel.org,m:wefu@redhat
 .com,m:nobuhiro.iwamatsu.x90@mail.toshiba,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:mripard@kernel.org,m:liangshuang@eswincomputing.com,m:lizhi2@eswincomputing.com,m:weishangjuan@eswincomputing.com,m:vineetha.g.jaya.kumaran@intel.com,m:xiaoning.wang@nxp.com,m:linux-imx@nxp.com,m:Frank.Li@nxp.com,m:david.wu@rock-chips.com,m:samin.guo@starfivetech.com,m:christophe.roullier@foss.st.com,m:swathi.ks@samsung.com,m:brgl@kernel.org,m:mohd.anwar@oss.qualcomm.com,m:devicetree@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:linux-mips@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-sunxi@lists.linux.dev,m:linux-renesas-soc@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:bartosz.golaszewski@linaro.org,m:sophgo@lists.linux.dev,m:netdev@vger.kernel.org,m:linux-amlogic@lists.infradead.org,m:linux-riscv@lists.infradead.org,m:dfustini@tenstorrent.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@li
 sts.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,lunn.ch,davemloft.net,google.com,redhat.com,foss.st.com,st.com,synopsys.com,sholland.org,altera.com,linaro.org,baylibre.com,googlemail.com,pengutronix.de,oss.nxp.com,nxp.com,bootlin.com,bp.renesas.com,sntech.de,outlook.com,esmil.dk,starfivetech.com,mail.toshiba,glider.be,eswincomputing.com,intel.com,rock-chips.com,samsung.com,oss.qualcomm.com];
	DKIM_TRACE(0.00)[qualcomm.com:-,oss.qualcomm.com:-];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[76];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.493];
	TAGGED_RCPT(0.00)[linux-stm32,dt,netdev,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,linaro.org:email,stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns,qualcomm.com:email,oss.qualcomm.com:mid]
X-Rspamd-Action: no action

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

In order to drop the dependency on CONFIG_OF, convert all device property
getters from OF-specific to generic device properties and stop pulling
in any linux/of.h symbols.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/Kconfig             | 2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 9 ++++-----
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
index 07088d03dbab5bd1abf66e9460613b839c1d565e..e2af4fdd654340d618477ed87d3889dbb9aab456 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
+++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
@@ -135,7 +135,7 @@ config DWMAC_MESON
 config DWMAC_QCOM_ETHQOS
 	tristate "Qualcomm ETHQOS support"
 	default ARCH_QCOM
-	depends on OF && (ARCH_QCOM || COMPILE_TEST)
+	depends on ARCH_QCOM || COMPILE_TEST
 	help
 	  Support for the Qualcomm ETHQOS core.
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index af8204c0e188ca8eaa9f31abeddda607f273b4a3..219ea36fe01e6d41299649defe569de034859288 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -1,8 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0
 // Copyright (c) 2018-19, Linaro Limited
 
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/of_net.h>
 #include <linux/platform_device.h>
 #include <linux/phy.h>
@@ -730,7 +730,6 @@ static void ethqos_ptp_clk_freq_config(struct stmmac_priv *priv)
 
 static int qcom_ethqos_probe(struct platform_device *pdev)
 {
-	struct device_node *np = pdev->dev.of_node;
 	const struct ethqos_emac_driver_data *data;
 	struct plat_stmmacenet_data *plat_dat;
 	struct stmmac_resources stmmac_res;
@@ -779,7 +778,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(ethqos->rgmii_base),
 				     "Failed to map rgmii resource\n");
 
-	data = of_device_get_match_data(dev);
+	data = device_get_match_data(dev);
 	ethqos->por = data->por;
 	ethqos->num_por = data->num_por;
 	ethqos->rgmii_config_loopback_en = data->rgmii_config_loopback_en;
@@ -816,9 +815,9 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	if (ethqos->has_emac_ge_3)
 		plat_dat->dwmac4_addrs = &data->dwmac4_addrs;
 	plat_dat->pmt = 1;
-	if (of_property_read_bool(np, "snps,tso"))
+	if (device_property_present(dev, "snps,tso"))
 		plat_dat->flags |= STMMAC_FLAG_TSO_EN;
-	if (of_device_is_compatible(np, "qcom,qcs404-ethqos"))
+	if (device_is_compatible(dev, "qcom,qcs404-ethqos"))
 		plat_dat->flags |= STMMAC_FLAG_RX_CLK_RUNS_IN_LPI;
 	if (data->dma_addr_width)
 		plat_dat->host_dma_width = data->dma_addr_width;

-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
