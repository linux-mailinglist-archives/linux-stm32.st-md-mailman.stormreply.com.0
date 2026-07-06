Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4f0zHqyrS2oaYQEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 06 Jul 2026 15:20:44 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C767112C8
	for <lists+linux-stm32@lfdr.de>; Mon, 06 Jul 2026 15:20:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=qualcomm.com header.s=qcppdkim1 header.b=JGdIn+mS;
	dkim=fail ("body hash did not verify") header.d=oss.qualcomm.com header.s=google header.b=hudKwMZS;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=qualcomm.com (policy=reject);
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A3605C8F27F;
	Mon,  6 Jul 2026 13:20:43 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 91A7EC6C859
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 Jul 2026 13:20:41 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 666Ax7sX245521
 for <linux-stm32@st-md-mailman.stormreply.com>; Mon, 6 Jul 2026 13:20:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=S+/dKj/4QSkaC6Y1b0yb4O
 abzlICyIBStrbgJ+vgezg=; b=JGdIn+mSzwbuvFvd3FIrakLHr6yq9g3AK3u3t4
 dt5ddD9yRCYCF9fvCcetIJpc0+BbCncAkFqjHqJedvaabYzHnHWzhnafFUOPEYZJ
 l9JOi6zOiwdjZklD1fWP9n3QVrpSaVWOtq/DWZwGEmcDKM3fRriQAsRM66axz2Gg
 TqdD72zv7R+ApRwvcix0LJKjCQF3pNXNWYQ9o1XXJJVDTOYb74r5Gvp55l9HJxI8
 fSCRmc6iRWhM3f+halyEgjR6bTMRjs3tfZYyDtaGOaZdgo4bnqSLil3Omx+iVMeO
 YuMkcCqUC7+2DGmCoaMHWDfps1AMhD/Zhk3iprmmJr6+Sy8A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a98gqj8-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 06 Jul 2026 13:20:39 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-92e73fc29bfso434087885a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 06 Jul 2026 06:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783344039; x=1783948839;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=S+/dKj/4QSkaC6Y1b0yb4OabzlICyIBStrbgJ+vgezg=;
 b=hudKwMZSp6Yxlh9CyA43/TD+iZp0JLHUWyxz5b8KIBma/uSLmW4xrNM91emuFMGfLO
 WJYw+di1vmRNw394IrM0l8ROa1DAALo3mRkhT/Y7BIWs3fzlxUeKj2RNfCBTMEHVALCN
 S6I21/KPH0kmkTYC1cbRCnvBzCpWv5f9sK6Kd0yalGt5bwTeWv91wUQ30dYYlpUlS2LZ
 rd2uTrY+nB2DTe0oz69pB+E2dm6OLHrsfWTfLKh9EU6Jh+ToWZGkd2j59KG+SpHklXqM
 InVS4pTdCY0pZMmHFaNTaWwZFrFfutg+mI8BFpne1GbBi4uAGkr2lNhVs/RWUB7cUvPf
 EL+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783344039; x=1783948839;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S+/dKj/4QSkaC6Y1b0yb4OabzlICyIBStrbgJ+vgezg=;
 b=CMSx9G6MMxzSoWTgsZ8NJWP9ZQi4hiNUUy8Mio4vBP8efjGn697yq6xlwAYHBI3Bbu
 33SMAMRzGxdLacihfM0AyuzaoO4cA3Po4LqThT3RzNod10r7fPpO5PFWNg9od9HFCq06
 XKqUMWp4+1C1mQ0Nh/o3uXJVbeXQR1wYmjkvLZEcBSMJOM2yz7XPB7mqUTR4xN2Oby7O
 wSUCp311K7fYdMdHlxM/SeTEgsG2po1aT+xyifJjv3YauePiodFl3QarSXAgx88rDXq4
 DO84mmuq2GxpRUKPaq521GH6FUm2jYYsQFDlyqFycwyS5a6KdCVL9AKJXhrmO/EMWfqA
 81eg==
X-Forwarded-Encrypted: i=1;
 AHgh+RqOOx4WPzxfrL7sxHp0RTRCbwgR5MUY+XrhUip76TV9pnICRIEu1ZSZ+aZ6CS/RJorFFcNw3ablZ4HXKw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yxyuez/0OrsEYbVe4AB6CDg7DnIV2r/m02tKw1/J6a+PApOIJFB
 Pa+rT6ksPxDMM9pQjqmm/BF/0MepRnMae8ts8k74X6qr/1BzcmOPkHYxNQoU1CYWLrRXhlhLFOi
 3adyrjgs3a94oCn5pkRX8oixlVCInofRJbm0+lHhTHpzjfpoKKftH/3hUJ0C6hLN5HjVAv7fUuf
 iMG2cKiXU=
X-Gm-Gg: AfdE7ckiU6reOLBBVi9+vHCZzQPdJioyOAacFlQl8DwTGEflzqUHyljURgsvavs+Vr0
 3oqmNsBuYX4Q8r+sS1N0w1APcppbnYVMXhSWBm/ilPPJETJw2l2cbIBHfXuXrV8XCN6a6SZcoiy
 tZOVPW39McWJlyWW+gNUO2DEKRQLc43Hfx6tPt+Fhk21ztrxLfoTxqZpLD4b0qCLTkBGQciIJ+k
 Xt1kTA4EGl1vC7Wconp+Qn5K0ZP95oHJ0DWsQGklLMcoDVho/pJT0AnLQuzVSCIYJS5XnRNBI2J
 3EEa9kxGha+Ti1hw8BKIdOXr/eF2ZBqZ7EVRe7w7eQ4brV2AT9SCb15Bv/OHpTjSAZWu1dDi6D2
 /kFDnkPMYsXP9nBLB6xvvJR2mKhkLN/8WMI+vHwU/
X-Received: by 2002:a05:620a:84c2:b0:92e:51ee:7944 with SMTP id
 af79cd13be357-92ebb55e04amr64071185a.34.1783344038212; 
 Mon, 06 Jul 2026 06:20:38 -0700 (PDT)
X-Received: by 2002:a05:620a:84c2:b0:92e:51ee:7944 with SMTP id
 af79cd13be357-92ebb55e04amr64060785a.34.1783344037495; 
 Mon, 06 Jul 2026 06:20:37 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:86f0:c42b:ef4c:d3bb])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47ad69519c2sm25910584f8f.37.2026.07.06.06.20.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jul 2026 06:20:36 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 15:20:15 +0200
Message-Id: <20260706-qcom-sa8255p-emac-v12-0-e3ab1ecf2901@oss.qualcomm.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAJCrS2oC/3XSwW7DIAwA0F+pOC+VbcDATv2PaQdIoI20Jm3SR
 Z2q/vtopK2RSi5IYHjY4JsY49DGUbxvbmKIUzu2fZcnSG8bUR98t49V2+QFQUAaDKjqXPfHavS
 WtD5V8ejryioGktrXGknkc6chpvY6ox+ii5eqi9eL+MyRQzte+uFnvm3COT67DqHgTlhBJckbV
 yeMzHb31XZ+6Lf9sJ+5Sf4TCGRKhMyE0YZNcCTBhxdCPQksVjepTCTDzADW1NG/EHpJFLPQmQB
 sZJTeJ2lfC+EnQehKBGdCWZMQLCnGuOvHcXv+9l9563Gbh8fLZ4ABkdYAy142KpBvrHwF5kzMX
 yYMErgEmQw1GQKU4FQwK5BdQIglyGZIWyIT8v8C2hXILaFiRi5DtbZOqmg4JVqBEBYSyWLHwaN
 fnAQKJK1HXqPwSTEVPwwf3YvBpOB00Jhcgbrf778j1CUzggMAAA==
X-Change-ID: 20250704-qcom-sa8255p-emac-8460235ac512
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6033;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=r4nzs6Q+Vb/dz3RA3Qk8xYysKrUAYteRCb53IwmKpR0=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqS6uWhtNuvAg/7TbC2mCPqok9Ose0SbrE4DJGN
 YmzDZncOMmJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakurlgAKCRAFnS7L/zaE
 w4uZD/492fkF9KRUF+LhghAa5/B6yl9bIZPy2zmr+NuB1+uJHaG8Hm7kMRTPkhlNyJSB/uNjOyJ
 3rx9WO2dctD2xiQZk2pvLGnQin3nhR8o8cdlI6jzfZU5Nty5YuxTWH+WSqDy8q4YHPLJkW5WrJ/
 cEg8EZ8ZXm91TLT5VPIbq6iUtnTH8sySH/S6i/SB7TOlIeHUkUd7ksKug0gi8UQkmTFR+dNjdUS
 hlMEDyDza6mI51NADNs779EiBIhvvCDTHiOufvj/I3R+f+aswn7ia8ZmBCt6fu8VNVS8VpiMc8O
 qtLik7F9rCndGqr15FPOyH52xLeub9y0ctVr0AA8S4jaKxSIQA3F7tp1jcoLdRLAOck6IOnLm6u
 nOGOFVyHF8GIacisPRWGV4C/tRFDWrkD3EjexAq7l9PfRjz55yyQ1R6w+h5v/syxebW4+llB1ET
 c2IzGDiX1vjnqUp772AHLsVpKfAlm7xlZQMfsCyDi0qwXa0Zs94ts7Mvrpz39Zns98kZSC2b6jm
 Alitu/+XYQnjlosxKtc7ZVaV89r0cMYnPF9lHDa+QOIF4s7cSiSQXFjbz10LFMsDgJWQUO1FSsw
 D/AHRgWBdv6SFHNx1NhhkX6Btid9yv9yzDw3OQraxBv4lnjW+ta7AYdKNXZKGbmmaC734+7tNNO
 xGyF3acpcNwjnag==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=SpigLvO0 c=1 sm=1 tr=0 ts=6a4baba7 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=PHq6YzTAAAAA:8
 a=h8s98YD0dNPsP74th3cA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=FO4_E8m0qiDe52t0p3_H:22 a=cvBusfyB2V15izCimMoJ:22 a=ZKzU8r6zoKMcqsNulkmm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEzNiBTYWx0ZWRfX37fTw2w2YF9l
 RkOmNZGz87W4HtIYxhqmFPGbEAvozKlsodvRwjFGx6NXOqD3sNu6Xw3CfoU5XpnVpHRFRym7iL0
 wb25oAQWGSV88PIhtIGiduOFMmLsat9QbwmrQAa8Sn23V+zQwRZqpAsk/2SG8wquv0mY/X9uGaK
 3bjqpJ8iXMjdflLJD5FSYbBVjcuWocXG5I7A0xbs9FWCHDjx6VycYUp+N50NpSDAlSzJZ8Sr6xD
 y7hXRXKTmmKVj6o/QCyEN/OtpZXYJ4sdes2MMkIZ3SsMpSMks4TfATUat79fIjMRmsNa+47dPna
 jN8heaeVUHdsqI4kP22c9wDTlgETE1Pu9DOr5mTYkR9uJ/K+LAsiKpsrdY3sspdbmpXi+wBrGLU
 6aNhGs0HZAqe3/iI4/3GEONRh4lox8JEK7inj58XCVjKb/reDTeLHW447JMXgVR0O4O8LgcFNMi
 VBo7VQog79MmDv2dTzA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEzNiBTYWx0ZWRfXwr+YatpFycrR
 2NWNrVyQEPHIxpc2TNCGMTOPLSE0Ee5qbomdIBNhfutV3HFNI760Hp8QGk9ZOWEaX4av2/KouY1
 ji8AXLAAJgxcMP/dtC7zrTIv4d0uybs=
X-Proofpoint-GUID: zrwxnwDqPkOT0hHxXRfxVZYo8NMpRA3Q
X-Proofpoint-ORIG-GUID: zrwxnwDqPkOT0hHxXRfxVZYo8NMpRA3Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 phishscore=0
 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060136
Cc: devicetree@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 linux-mips@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 imx@lists.linux.dev, Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, brgl@kernel.org,
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, sophgo@lists.linux.dev,
 netdev@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-riscv@lists.infradead.org, Drew Fustini <dfustini@tenstorrent.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v12 0/7] net: stmmac: qcom-ethqos:
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [5.29 / 15.00];
	DMARC_POLICY_REJECT(2.00)[qualcomm.com : SPF not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,lunn.ch,davemloft.net,google.com,redhat.com,gmail.com,foss.st.com,st.com,linaro.org,baylibre.com,oss.nxp.com,nxp.com,oss.qualcomm.com,bootlin.com,glider.be];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:vkoul@kernel.org,m:peppe.cavallaro@st.com,m:wens@kernel.org,m:jernej.skrabec@gmail.com,m:neil.armstrong@linaro.org,m:khilman@baylibre.com,m:jbrunet@baylibre.com,m:shawnguo@kernel.org,m:festevam@gmail.com,m:jan.petrous@oss.nxp.com,m:s32@nxp.com,m:mohd.anwar@oss.qualcomm.com,m:romain.gantois@bootlin.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:mripard@kernel.org,m:christophe.roullier@foss.st.com,m:brgl@kernel.org,m:rrendec@redhat.com,m:devicetree@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:linux-mips@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:imx@lists.linux.dev,m:martin.blumenstingl@googlemail.com,m:linux-arm-msm@vger.kernel.org,m:prabhakar.mahadev-lad
 .rj@bp.renesas.com,m:linux-kernel@vger.kernel.org,m:linux-sunxi@lists.linux.dev,m:linux-renesas-soc@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:bartosz.golaszewski@linaro.org,m:sophgo@lists.linux.dev,m:netdev@vger.kernel.org,m:linux-amlogic@lists.infradead.org,m:linux-riscv@lists.infradead.org,m:dfustini@tenstorrent.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:jernejskrabec@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,m:martinblumenstingl@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[qualcomm.com:-,oss.qualcomm.com:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_GT_50(0.00)[52];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,oss.qualcomm.com,lists.linux.dev,googlemail.com,bp.renesas.com,kernel.org,lists.infradead.org,linaro.org,tenstorrent.com,st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt,netdev,renesas];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:from_smtp,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 00C767112C8

Add support for the firmware-managed variant of the DesignWare MAC on
the sa8255p platform. This series contains new DT bindings and driver
changes required to support the MAC in the STMMAC driver.

It also reorganizes the ethqos code quite a bit to make the introduction
of power domains into the driver a bit easier on the eye.

The DTS changes will go in separately.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v12:
- Drop the power-domain-names from the SGMII PHY DT bindings
- Add missing Kconfig dependency on PM for the new SGMII PHY driver
- Link to v11: https://patch.msgid.link/20260629-qcom-sa8255p-emac-v11-0-1b7fb95b51f9@oss.qualcomm.com

Changes in v11:
- Take a new approach: add a dedicated driver for the firmware-managed
  SGMII PHY and simplify changes made to the MAC driver
- Link to v10: https://patch.msgid.link/20260323-qcom-sa8255p-emac-v10-0-79302b238a16@oss.qualcomm.com

Changes in v10:
- Fix unit address in DT example
- Link to v9: https://patch.msgid.link/20260316-qcom-sa8255p-emac-v9-0-c58934e76ff2@oss.qualcomm.com

Changes in v9:
- Rebase on top of current linux-next again
- Link to v8: https://patch.msgid.link/20260311-qcom-sa8255p-emac-v8-0-58227bcf1018@oss.qualcomm.com

Changes in v8:
- Rebase on top of recent changes in linux-next which required an
  extensive rework
- Drop partial R-b tags
- Link to v7: https://patch.msgid.link/20260306-qcom-sa8255p-emac-v7-0-d6a3013094b7@oss.qualcomm.com

Changes in v7:
- Restored the correct authorship after learning git uses .mailmap for
  the --author switch
- Rebased on top of changes from Russell
- Fixed resource management issues in error paths
- Link to v6: https://lore.kernel.org/r/20260112-qcom-sa8255p-emac-v6-0-86a3d4b2ad83@oss.qualcomm.com

Changes in v6:
- Fix $id value in the bindings
- Drop patch 3/8 from the series
- Update init/exit callback signatures
- Link to v5: https://lore.kernel.org/r/20251107-qcom-sa8255p-emac-v5-0-01d3e3aaf388@linaro.org
- Link to v6: https://lore.kernel.org/r/20251219-qcom-sa8255p-emac-v6-0-487f1082461e@oss.qualcomm.com

Changes in v5:
- Name the DT binding document after the new compatbile
- Add missing space
- Make the power-domains limits stricter
- Link to v4: https://lore.kernel.org/r/20251104-qcom-sa8255p-emac-v4-0-f76660087cea@linaro.org

Changes in v4:
- Remove the phys property from the SCMI bindings
- Mark the power-domain-names property as required
- Set maxItems for power-domains to 1 for all existing bindings to
  maintain the current requirements after modifying the value in the
  top-level document
- Link to v3: https://lore.kernel.org/r/20251027-qcom-sa8255p-emac-v3-0-75767b9230ab@linaro.org

Changes in v3:
- Drop 'power' and 'perf' prefixes from power domain names
- Rebase on top of Russell's changes to dwmac
- Rebase on top of even more changes from Russell that are not yet
  in next (E1vB6ld-0000000BIPy-2Qi4@rmk-PC.armlinux.org.uk)
- Link to v2: https://lore.kernel.org/all/20251008-qcom-sa8255p-emac-v2-0-92bc29309fce@linaro.org/

Changes in v2:
- Fix the power-domains property in DT bindings
- Rework the DT bindings example
- Drop the DTS patch, it will go upstream separately
- Link to v1: https://lore.kernel.org/r/20250910-qcom-sa8255p-emac-v1-0-32a79cf1e668@linaro.org

---
Bartosz Golaszewski (7):
      dt-bindings: phy: document the serdes PHY on sa8255p
      phy: qcom: add the SGMII SerDes PHY driver for SCMI systems
      dt-bindings: net: qcom: document the ethqos device for SCMI-based systems
      net: stmmac: qcom-ethqos: set serdes mode before powerup
      net: stmmac: qcom-ethqos: reuse the address of ethqos_emac_driver_data
      net: stmmac: qcom-ethqos: factor out linux-level setup into a separate function
      net: stmmac: qcom-ethqos: add support for sa8255p

 .../bindings/net/allwinner,sun7i-a20-gmac.yaml     |   3 +
 .../bindings/net/altr,socfpga-stmmac.yaml          |   3 +
 .../bindings/net/amlogic,meson-dwmac.yaml          |   3 +
 .../devicetree/bindings/net/eswin,eic7700-eth.yaml |   3 +
 .../devicetree/bindings/net/intel,dwmac-plat.yaml  |   3 +
 .../bindings/net/loongson,ls1b-gmac.yaml           |   3 +
 .../bindings/net/loongson,ls1c-emac.yaml           |   3 +
 .../devicetree/bindings/net/nxp,dwmac-imx.yaml     |   3 +
 .../devicetree/bindings/net/nxp,lpc1850-dwmac.yaml |   3 +
 .../devicetree/bindings/net/nxp,s32-dwmac.yaml     |   3 +
 .../devicetree/bindings/net/qcom,ethqos.yaml       |   3 +
 .../bindings/net/qcom,sa8255p-ethqos.yaml          | 107 ++++++++++
 .../devicetree/bindings/net/renesas,rzn1-gmac.yaml |   3 +
 .../bindings/net/renesas,rzv2h-gbeth.yaml          |   3 +
 .../devicetree/bindings/net/rockchip-dwmac.yaml    |   3 +
 .../devicetree/bindings/net/snps,dwmac.yaml        |   5 +-
 .../bindings/net/sophgo,cv1800b-dwmac.yaml         |   3 +
 .../bindings/net/sophgo,sg2044-dwmac.yaml          |   3 +
 .../bindings/net/starfive,jh7110-dwmac.yaml        |   3 +
 .../devicetree/bindings/net/stm32-dwmac.yaml       |   3 +
 .../devicetree/bindings/net/tesla,fsd-ethqos.yaml  |   3 +
 .../devicetree/bindings/net/thead,th1520-gmac.yaml |   3 +
 .../bindings/net/toshiba,visconti-dwmac.yaml       |   3 +
 .../bindings/phy/qcom,sa8255p-dwmac-sgmii-phy.yaml |  50 +++++
 MAINTAINERS                                        |   1 +
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 230 ++++++++++++++++-----
 drivers/phy/qualcomm/Kconfig                       |  11 +
 drivers/phy/qualcomm/Makefile                      |   1 +
 drivers/phy/qualcomm/phy-qcom-sgmii-eth-scmi.c     | 161 +++++++++++++++
 29 files changed, 573 insertions(+), 56 deletions(-)
---
base-commit: ca70e9a43a66435fda3a9d37f90c9c3b7bf211f6
change-id: 20250704-qcom-sa8255p-emac-8460235ac512

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
