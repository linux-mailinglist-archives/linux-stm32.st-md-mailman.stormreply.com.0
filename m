Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wI9FARf3qmlxZAEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 06 Mar 2026 16:47:35 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 875EE2242BC
	for <lists+linux-stm32@lfdr.de>; Fri, 06 Mar 2026 16:47:34 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4848DC8F286;
	Fri,  6 Mar 2026 15:47:34 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 28493C8F272
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Mar 2026 15:47:32 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 626FT6Bo2522584
 for <linux-stm32@st-md-mailman.stormreply.com>; Fri, 6 Mar 2026 15:47:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 y/t0LAapdaxFDy802rA0EzwSzk/87/UWs/UoU9fhqHw=; b=hcDqzWERh1YwUlSX
 0mLHqLb0FBgNbAXJzPPEEEsVRDvMJRoeS3eKlpjKMjt0R9278gFh0jv84RrI+NwW
 SkGonXiI6BZTbT4a8NQffujPwc50phY+tos5pI1aDCv2bXiRpZ54+Q5MR8hNyl1P
 8bO4fo08icbC8OV4s1n0KdjTGfp3OhZrBCk89P66q9aehmev514RekhETO0QAgbg
 roqrTRRoJdDHbYO/zzXM3xFgftaHtm7kEE9DzQqQk3bdkKB0mNd2juPZzEoAQbuf
 bC+hErkC3/3+3fSP9nkMFwIIyrKpzKI9SZSbdXhc2X83/8dfNMSFZXULkUTAfX92
 47pzgw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqfg6brmu-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 06 Mar 2026 15:47:30 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8cb3b6b37d8so4927659085a.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 06 Mar 2026 07:47:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772812049; x=1773416849;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=y/t0LAapdaxFDy802rA0EzwSzk/87/UWs/UoU9fhqHw=;
 b=IcJVM6g0SymTVM//KzoGzdBaqw9LrvdzJuTP+oovmO3EkjrHF+TwyL5FYKphHi0p5y
 Ghe7rwSQunbAJ5hkcCG/7Ma/5I7oj1XkgX9Z4nzuAHs2p0J03dWy1ORW1jeXdh+WpQYT
 wh+ik4qLrIyOne8CdshemBFsBi1njJsA1SFRgbYNwA7U14/1qUmmR8nOYoEeKSGHNyS5
 G0JTEoTpqx5VvrCqu1wTnpOKtDaI4zhqTrO283JqJ3ZW/+Fljkh6rWdLAy7oh1JP1edk
 gYjW9l58jQDyUWCKd6nUuIvQ4kx31efF8Qm3rN6KrizBoNoLItzyL51AOKAL/iyH6Tb2
 YdXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772812049; x=1773416849;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=y/t0LAapdaxFDy802rA0EzwSzk/87/UWs/UoU9fhqHw=;
 b=nhfhMStlAPsATAMmpa5JZpdvw5MdXl0QERdjPFbOIrS4Z3vxjANS46QNncyM5c+eLR
 L3Z6TM3VQvhXKRL+PnJyGQlGFszvmayHhpqHS0vbQ59Sum/QXPiaUuENP823HqkgZ4Ci
 9TgKRAbescPX/9o/1Lsrs2mZzuKxQF4EOD37Jt5uJGK4J8FEgu5bVCwD8KydrJjxLNnJ
 3RpkHcrb9Ev9mI5LZtixbaDAFOMeliVnB1m0YSMylBDPqfcchTB3n4PyBSq+mnrNDyN4
 rHQBJWfrQVMQyzHaVc3zF+4rbhWEqE9G0JKIENOyqIX2+A4bxTuJUrmsNGTrxfegeRlW
 9eBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXE6lAmMYd3/p18LbmVyVcmBQceuBtiidQ6dOh6tKZyFpb8JRRJA/+so4xDu0ZNwyKrXubPeRJwimqZag==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxFlsVjRCnqyDQjvM1q/AAU5LtEy4b5ABi9fvDWYMF3ot30RSYI
 w+Q9QXOXFUWWOzIWFysyo5Mnqk7UqrWiNbLQHytc7qMdgfF8wTOUY4yn9cXy7lWZipyhyiB0ePX
 7pxJbXrAZ5Il1kHfcDohjy1K3OAXNysGL+z0EEXUW/wd6zAl0h4buTxV+O4RjVkLl+canPIthZ7
 VMDajVpjQ=
X-Gm-Gg: ATEYQzzCZmU/supkKv3uLmAQXGAAMbIVegIeSIE8QocPyJHBm6b0jUCbzPIPPZ8pbEW
 j9NeG9DOkKvbfllnbKXlswScUaftdVM5zSFbgO8XB1a9JBaj36GKkOIRttnQBIRtovimFXISMPf
 ENtzR00eXgBVYh2AcV9Fq1E6FhvZyWgQOY1LUbocWV9VvfDvp840VrJu/HFomm8xFZTkWc4q0rp
 q1/Dk/YDdi//JMZcXgqCt9qGXl7RUtpWDKxTFpwipHOKZjezeMSeWVdTzI3v9qZmTQ5d5hS+CIb
 RixXgHLiOxkMh+VVBZ1kXSgTwlkyaLDRWV5N/0Tk4s2y7a+vOSKjxtMr/jw1xgIqnvWzAdQh2eZ
 k55nJy7fudvujuJmqpfd5KY6BIMcC+b/gtjNvuiv7p/3ZDsrw6cWc
X-Received: by 2002:a05:620a:4589:b0:8cb:4ad6:6aa0 with SMTP id
 af79cd13be357-8cd6d514b2dmr337841685a.68.1772812049317; 
 Fri, 06 Mar 2026 07:47:29 -0800 (PST)
X-Received: by 2002:a05:620a:4589:b0:8cb:4ad6:6aa0 with SMTP id
 af79cd13be357-8cd6d514b2dmr337832385a.68.1772812048763; 
 Fri, 06 Mar 2026 07:47:28 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:6d2b:ebde:c946:11eb])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439dae35cf7sm5122767f8f.26.2026.03.06.07.47.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2026 07:47:28 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 06 Mar 2026 16:46:44 +0100
MIME-Version: 1.0
Message-Id: <20260306-qcom-sa8255p-emac-v7-6-d6a3013094b7@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1989;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Bz6/Hr6N/rEPerZKq1+bTvk1x+ewErg9P0amGNZT72Y=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpqvbwFVICzo2tr1z/2IvJF2RamjaFEbJ3iPkje
 6PT7sJJVXOJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaar28AAKCRAFnS7L/zaE
 w+txD/9F2WX4OEqjZx/mkaQtwCJT4URVHThB5tZh3U96w9/QhL0ahuE54CXTnRio9xqzuW3TOz/
 DB5lVS7sPFVkaZyTgnT4UcCQMbeD2iDkSF/03/ldFyWCMSbZW++hxfJTsuF+sl5S1eSfz3rdfjR
 7PLeDU599Hf7K05uypwdjdMknTkGJIxKcYFyIJBH612vq8bD369ugOwR4c7Jv5ZtFbyBohzNAlK
 3oVTiJL1X85OykK67R5QreXZ2PgAm1UFP7lO29HttbssnGmHeOCIo2oESCahiQf1juZaHaz56fr
 xVz7Nz2a2lDElolZZR94K3sPRtNhN/8fPbpaVqZbSkgncrxQkl1Jtkmx93k1kAsyVeYFIGTrvZU
 7hdo1O7lYOlziI1POq6TsG4Na7irnbcnQSS9E3nK/dwPAlPkJIj87UIkkINTZou48tczQHIlulM
 KkgMje1xw06xe3zzl81sRKeKTmYQcrRgf9CPA6vUS7yliVZ84k6xaOrCMoTljmo3uw5wQn9SxA4
 ZZSHoV84qrni0piZgFEPrnBfQyiGf89U+7Xue/83jlkVgiU2jBrfb+aKtrhXql2V1JdK6mtztb6
 Zx9NpawD0TXPpx1ym3Vsre2lCLAZ+oI+78jFhKtA8J45ESShZbFG0RCvrrJ/6I9dYYCszuMYNNm
 Tn7kOYWiciMO1PA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: s3aksIZuqZvvFKhmqTOiHL1stunOB0dE
X-Proofpoint-ORIG-GUID: s3aksIZuqZvvFKhmqTOiHL1stunOB0dE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE0NiBTYWx0ZWRfX/XLRNE2CWtIo
 sPHFcH8t0icrWLfd+DL2ymAAsoBoPZnWKp0Or0PZLFDIjwXd8+O/mn2nRsS5YAJfQjEpvs4zQrU
 TYj9gdTAGoJIVYBemzRBmVZ3iUwJ2sM3hTFcgEGulUQWMEYgMiWG5ySgfFbbihYghuikMv1kCBk
 F6thdaKwXYSQucawrtD0gLHWP7vioS566QsLnoDdjc39qNskbhJsp1XSz+wNz4qilWxzrZPaw2o
 btBm4TR1BT2BGw9gP9ICngAsMDGpLzI1LP4k/m3E+9FcZh3gvLzbUFHEClp4RaE39EuMaRtqlj2
 5uaMNcvh1c0U4qeUotUpVL+xDqBUzDRO6A48KKaj/QE2i5c4x+QlyFA3M5IqBFOMKBygzt8MIiV
 SxtxvOGBSWCACDfkhfjO3I4qlPvSRiPmBgiMg0TkvHJWMS8CFxlZa+fLZjRwZIobi3x88ttqOR1
 9QC3hvKF2cFEWX/ZlZA==
X-Authority-Analysis: v=2.4 cv=XKg9iAhE c=1 sm=1 tr=0 ts=69aaf712 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=0aI5G4bYpHrJQa0XwroA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_04,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
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
Subject: [Linux-stm32] [PATCH net-next v7 6/7] net: stmmac: qcom-ethqos:
 define a callback for setting the serdes speed
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
X-Rspamd-Queue-Id: 875EE2242BC
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
	NEURAL_HAM(-0.00)[-0.475];
	TAGGED_RCPT(0.00)[linux-stm32,dt,netdev,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,linaro.org:email,stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns,qualcomm.com:email,oss.qualcomm.com:mid]
X-Rspamd-Action: no action

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Ahead of adding support for firmware driven power management, let's
allow different ways of setting the PHY speed. To that end create a
callback with a single implementation for now, that will be extended
later.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index b88de56d372c370aaf4929d05138f3744c54b1f1..038ca4da3cff4eaac1d1255573f32e0c87701e78 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -119,6 +119,7 @@ struct qcom_ethqos {
 	struct ethqos_emac_pm_ctx pm;
 	phy_interface_t phy_mode;
 	int serdes_speed;
+	int (*set_serdes_speed)(struct qcom_ethqos *ethqos);
 
 	const struct ethqos_emac_por *por;
 	unsigned int num_por;
@@ -616,11 +617,16 @@ static int ethqos_configure_rgmii(struct qcom_ethqos *ethqos, int speed)
 	return 0;
 }
 
+static int ethqos_set_serdes_speed_phy(struct qcom_ethqos *ethqos)
+{
+	return phy_set_speed(ethqos->pm.serdes_phy, ethqos->serdes_speed);
+}
+
 static void ethqos_set_serdes_speed(struct qcom_ethqos *ethqos, int speed)
 {
 	if (ethqos->serdes_speed != speed) {
-		phy_set_speed(ethqos->pm.serdes_phy, speed);
 		ethqos->serdes_speed = speed;
+		ethqos->set_serdes_speed(ethqos);
 	}
 }
 
@@ -843,6 +849,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(ethqos->pm.serdes_phy),
 				     "Failed to get serdes phy\n");
 
+	ethqos->set_serdes_speed = ethqos_set_serdes_speed_phy;
 	ethqos->serdes_speed = SPEED_1000;
 	ethqos_update_link_clk(ethqos, SPEED_1000);
 	ethqos_set_func_clk_en(ethqos);

-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
