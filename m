Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KFlVGg33qmlxZAEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 06 Mar 2026 16:47:25 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 519D1224280
	for <lists+linux-stm32@lfdr.de>; Fri, 06 Mar 2026 16:47:25 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1887EC8F284;
	Fri,  6 Mar 2026 15:47:25 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AD4B1C8F272
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Mar 2026 15:47:23 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 626FTFZ81131118
 for <linux-stm32@st-md-mailman.stormreply.com>; Fri, 6 Mar 2026 15:47:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 7FZ00ncedK+mL4WvdIiqnQo5Amq5I++OhTfC5QvXt2Q=; b=EH9xO1OCIOWc1zvv
 3lyhYOt9wRBCHpHK8iwerd8cDL8VQIy0CKm5JF8+kO923+ECbVlYud+O1KloukJg
 VzuLR3ba2QFdzSmavfpZtG6OOlJBvQdq99sFVmzs75lQlQ7CfUcZypQdU8hl/cLU
 5EcdC04U0MOU5Qs7WF5y50SzqLqViByyMB75tJgervQVraNyoJRwwlYHtblae7rN
 /bhSkpkZOjQMrDkrZpngKpHqWkpqADPTHrYy+ENP12YnNPYKFxBG468tKwU41JA1
 LnglT1vxOTNZVbQ5qNHNquLSV7LA8gW/BrDtUWTyRanF58ePpavR/m48yiLk8vJC
 mNT4Qg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqj4sb8rf-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 06 Mar 2026 15:47:22 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8cb413d0002so5905239285a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 06 Mar 2026 07:47:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772812041; x=1773416841;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=7FZ00ncedK+mL4WvdIiqnQo5Amq5I++OhTfC5QvXt2Q=;
 b=YPBndpLVxAh/gyJlsXa8rEYhBJlLTSJtSCfBU5+F+8SpqK0pErZv+BY8zNZecjmYvA
 8Vn3+SVYuIFnqvRxw38RQlUDSgVCRJj4SCPKKsVoTLeqeR5U0JVfxkOBpDD4Le16p79Q
 EK/0aSF6ahMnmo+wg8qmlT/L9VtvhG1wOa0anSCskvUa9eFi0EikZU6olnvM5zK2aI6D
 VrJwh2q25mzpcFds7y8sWcGsR8GNUCeiaDB0K4/jlqrNzNeUDFkynKjJaHOo5MterMjF
 6NxRtQO5CK+Ar0lg2k/KxdMcv0dftxi0OqNRDOMIyo2jQYDHo/arSFuT1NRZvS7jWEBV
 Dj6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772812041; x=1773416841;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=7FZ00ncedK+mL4WvdIiqnQo5Amq5I++OhTfC5QvXt2Q=;
 b=fvQO0fKopXD8vN11eB2RGdKLzFiTZYelqJ6vuGpSfGg3oOUd5aWez3CTnFOcB9zKLc
 tcfSdWizeV89czFLcCYDBYrsJkqBBBL1oGm/3LuW/82uE90Sa/9/jT7VuKl4wKeFPCMB
 q0AV+pQcBUduUQVWFP0O5fK4KFHLdlrhaODT345wlsbsVNq07i2J1oTxQkDPHVX6gUCK
 cpC2yjRlBxNBVAmATQPxkzHNkp3Iw6H96cmdDR/lUF7BS0gQ/o14iNwb55e083e76hEq
 ZZCvZSngWcn6ytDawhokxC+u898kEBQhpT0wVJbKvl44RogrnE/cXT8IMOu2J3v9CFF2
 eEtQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV2qhRfXG1n/v44C4mNU6RLy9aAfLk4JiCHEbsCz9T/9AHHdUZuksgOtrVLZxGk+qAMJkbGEkgicWC21w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwruzcmoNp71k5rsAAxW3RN4UGn8RZSXonGDBxZUOU82+xn6K0E
 Cjt9PYcp/ByJS5KSUXpoipJeASfYiP4UIAgYh8QvrIfqlx0wAOek7mDA2aoJtMcRA4Urq/+m7dN
 vaIitlFaVDesXPBS3oYmH2AuIACmD6QhALx4BMcGeCrKIhFbJwUk6T9WdX5ywkBSXPCFgbeonbu
 saZfye1+8=
X-Gm-Gg: ATEYQzyKGJJIAhYHEfSgomRzvPj7estyuEaIdYUbUrhTWbydFcKNbIMv0mWK/Q5y2cK
 oczrDE9etsanXKrKdL+1EJhO37kJCgCxDh9UlfjrBCz3gKnvVmRxKqvOEzzAABhCqzTlrkbD/uW
 39r9UBIqEreHFGf2URgskx3sbtb2xa5RoUJCADQS2TJStlz8IL5ratq1AF1PCTa8jFbcwUB6a89
 HOz0FUFQe4x9xOygcjfxu+3USC1ZvdfcaVknijMET7dFN5tIsF+ao277opvss4HKy2Hyuxs7ilj
 GbhD7U0JCl8Rs50/uUGL+ixVMAlLd7SPSqqHMzGdGNWYk4D4STehKBhTctItNREYsmdLM1S9J3C
 QJD/K//G0EY1AL0CCmsoQs5FOZk3d2YpDxS+ZxknkXasb68K41k3H
X-Received: by 2002:a05:620a:460a:b0:89d:b1e7:29e5 with SMTP id
 af79cd13be357-8cd63409440mr729248685a.5.1772812040990; 
 Fri, 06 Mar 2026 07:47:20 -0800 (PST)
X-Received: by 2002:a05:620a:460a:b0:89d:b1e7:29e5 with SMTP id
 af79cd13be357-8cd63409440mr729242985a.5.1772812040433; 
 Fri, 06 Mar 2026 07:47:20 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:6d2b:ebde:c946:11eb])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439dae35cf7sm5122767f8f.26.2026.03.06.07.47.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2026 07:47:19 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 06 Mar 2026 16:46:42 +0100
MIME-Version: 1.0
Message-Id: <20260306-qcom-sa8255p-emac-v7-4-d6a3013094b7@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3515;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=4xdEZ3Xz7FPuhh4TIgOPGYV5mznSWY2Gmb1v1cWPOGU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpqvbtqrbJrglPgvGD4e8XKoLPxkAHqr1h3Nepe
 9UbIf0JqnGJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaar27QAKCRAFnS7L/zaE
 w6aDEAC26/DLAc01J88zpFwROfoamNnM/xgAfAQbvQbU5luOZnh34NX/RcNJ0+nNFwz08EN5X4j
 5/JUw32zLJjd9HwDV1/fuqQezyNR0MnfpDgymbvYx3t2EmMNQa/hIxYER1tZfPvEPNBJ2Wu/y3I
 R57CjTB0NYLVSXoz90wG+F6uMQndZApxjZtk6xPJ3bZYlWkM8LXJydoVqVP86fOs2N4bDpOAiZy
 ud/NsEg7x+jpCSCFPGQbBW4j/VnYBFQnIP972sAfSiQQLA6bISpkzbTj9BYlBAjAf0/g5DUZddC
 GHdOAClK66MCmWlqKdWIQyIxa4CLf5H7ZFXWbfNCXXp7tCeKTJ7KcO8vRVrt0rz49p12/OrPnUE
 +xSwFwp4c3CWOBIe+LQEJVgZvOZNhiT/rFkYHDPqFcXgAU3h/4amGyjTx4GQcV41ouVzJz/d3ZL
 udtbd89DsaMLHJden6imqwwy7J0Cyym9sol9uX6NCus+M/ksJAiGq5ciFaeNqnaXxdx8C9JJOWs
 PC4a+tikzXDLlAaWMKTDDBSaAegMx2hwv/uzGEKhuik1rSI0l37Ot342QCdiijQB67EuWiBmDZ6
 3sfVGr3yhS5XncXXCLDr6Wb5Lnn8jxgliJwhTAthF+9Nrej9nFuX81hPoPs3qVeEXkOv5czbUB5
 fqP35uwnzraR8XA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE0NiBTYWx0ZWRfX7rIgssL31fnn
 3aD3KGQj0QUSCBB/DFZpirdQl7oexJXjNt/VYdooO2rKReA5fqKkIplmoO2XAEF12PZe4Bqcajv
 Q/AhWV4WXl0yANy3xw3Dpgdmc2Yud7kvbmD3ueXHt/911uRfeGXgxtxXx/Jf7xFXdGOi+W5ifW2
 nolAPyWr7FdJy0YXBRQCDhmg9aAl7/hsQzvrzEPObRBNVdvZTPokFdsDKnZp57duSNx4Kuu3Gc1
 vbGYvxGKvovePMMrqHbY8+QydKf1ubheVMNoxEeDvqBT+qqUoKLjemCkjh4Uq0qznngD41C+r5I
 cpx/5Torfj3iRG6vF/U9QUkAAuuga4hVoCOqJSvqz3R4q2kXPRj9JgUqD/9T4QJUt9UF6G0r6Fb
 hHx1r3yhWfRm8zrqAE95dt0bLAp8Tn3VTuW1R578CAqisDuQ9yRI+081fqiCnfXRxk8n6K95enU
 E7DrqLOpVb+FFajN1Tg==
X-Proofpoint-ORIG-GUID: XV_roUKICF9AyfOpQGki8SN69iqgWkUl
X-Proofpoint-GUID: XV_roUKICF9AyfOpQGki8SN69iqgWkUl
X-Authority-Analysis: v=2.4 cv=T8uBjvKQ c=1 sm=1 tr=0 ts=69aaf70a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=fthQcs0maGYz3WdgJrEA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_04,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 bulkscore=0
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
Subject: [Linux-stm32] [PATCH net-next v7 4/7] net: stmmac: qcom-ethqos:
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
X-Rspamd-Queue-Id: 519D1224280
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
	NEURAL_HAM(-0.00)[-0.487];
	TAGGED_RCPT(0.00)[linux-stm32,dt,netdev,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,linaro.org:email,stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns,qualcomm.com:email,oss.qualcomm.com:mid]
X-Rspamd-Action: no action

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
index ae7e088b122753fefa24fd2ca715151fd56e6376..f9a3741b692665b5acce34487f7fc2aaf557f0cb 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -91,14 +91,18 @@ struct ethqos_emac_driver_data {
 	unsigned int num_por;
 	bool rgmii_config_loopback_en;
 	bool has_emac_ge_3;
-	const char *link_clk_name;
 	u32 dma_addr_width;
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
@@ -302,7 +306,6 @@ static const struct ethqos_emac_driver_data emac_v4_0_0_data = {
 	.num_por = ARRAY_SIZE(emac_v4_0_0_por),
 	.rgmii_config_loopback_en = false,
 	.has_emac_ge_3 = true,
-	.link_clk_name = "phyaux",
 	.needs_sgmii_loopback = true,
 	.dma_addr_width = 36,
 	.dwmac4_addrs = {
@@ -323,8 +326,13 @@ static const struct ethqos_emac_driver_data emac_v4_0_0_data = {
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
@@ -751,11 +759,13 @@ static void ethqos_ptp_clk_freq_config(struct stmmac_priv *priv)
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
@@ -801,6 +811,9 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 
 	data = device_get_match_data(dev);
 	drv_data = data->drv_data;
+	pm_data = data->pm_data;
+	clk_name = pm_data && pm_data->link_clk_name ?
+				pm_data->link_clk_name : "rgmii";
 
 	ethqos->por = drv_data->por;
 	ethqos->num_por = drv_data->num_por;
@@ -808,7 +821,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
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
