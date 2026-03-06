Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +LKIKxH3qmlxZAEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 06 Mar 2026 16:47:29 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 741F522429E
	for <lists+linux-stm32@lfdr.de>; Fri, 06 Mar 2026 16:47:29 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 38A67C8F285;
	Fri,  6 Mar 2026 15:47:29 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6B8DAC8F272
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Mar 2026 15:47:27 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 626FT6vg1953637
 for <linux-stm32@st-md-mailman.stormreply.com>; Fri, 6 Mar 2026 15:47:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 eU24ZQ0ifgQhG9aJG91v67vTmeB3MWe3LblPU2fIXH0=; b=Pln1BdJhqoaTMh64
 8pQgktMnqtuBs4y8ovD9LU1rU+wDekWELeUbFc10sB4twI+AgEj0024JrowAMC67
 iMP/frQMERvP1fLHEGWVgs5nETztkOZ36kX2l/lBJLvv4CH3SGRTF5UmmuVCKdjM
 j0HAcfJON4jXroD4ALm0lq6IrFC0MJALzPyEeHLcx0OaeGzqw2WOm1o7Vv0Fv0Tu
 NBh4zAmlNixvCm+wDi3MubHCgSeVx1xnKqUkaskHKlXy5kz47+eWYFefFSFdWr5r
 E8uaAP4PnFcV6F5d/tCpGFyTQcIzNlTsEmNu6d33k2sqz5Y1xXQiHe9Q2fPax8ig
 LuSklQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqv9ah6d6-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 06 Mar 2026 15:47:26 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8cb3d11b913so5146302585a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 06 Mar 2026 07:47:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772812045; x=1773416845;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=eU24ZQ0ifgQhG9aJG91v67vTmeB3MWe3LblPU2fIXH0=;
 b=Q0MkqbKN31NvpRozH/FHsEg3oxBhX0bVp7kYK0NggTPvQxKstviNeIDUBYm9g0+fWk
 HMhtvFHyJJ4EW8OZAlrMih/RN74zwgrxB+ZFJUzLzLCrZOMgkAD3bFA+PoxcVCXBFtan
 F1Tddr9SdZkEs74CLsAtOxjAyXgrRcGzcfTajuoE1P883SMlSCUZl1aufRHA0aP7dwyi
 L/x11Y6XvJh2ocpY4WSgcVaW9qRVVtxGv1rpjT3UHc55DHDg3oTqvPsgX3mDRFptrHWj
 Bk8EvYxanw+VhGOH417yL6R+W2+qLkjuQqwTzUQmVCnmWRG3YMBqQ4mXO9lzogZo7l6u
 Kd8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772812045; x=1773416845;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=eU24ZQ0ifgQhG9aJG91v67vTmeB3MWe3LblPU2fIXH0=;
 b=iQ2PgnOF7RrLYPOZzc5hIV6Zh8nFFtlCigEERYzrxZLk3Ss5nnBb8P/mQ+/rh7JuUv
 lux/SsNaZ57PBBTe7zsJtuBEb7Q7fl+BHGjErrXA+ENotPZFJiCvUCrmUOaI4bbPiKzO
 6KMR9C5kudY4f4h+4K2yPPavE9sSGiuybXOA+nZrAvN3piib6zJ5KgXBFsWIKZOD2FPg
 EhRGVijCEZPG015+zxhTRocIqyXJO71oR1Q4Vws2kczmprpQsHZODrWbMNmlyfUHysAS
 YU69W9ww9sbnOsGMATqYFeQK//YyW4Wbjc2Y8q0rJ7YYJ8YkCmLOanLVpRqVHtVQCfcv
 V7+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUpveIsIjRIjYrKuHWoPWXsIANBRmZ/jl9UjBX5XM/JA4ODsDmi4VoY4y4EE/nPse+UpGIKqWUeDxKMdQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwHWai87scBudCRvGjQ9OTGTHAnTBL9SEkeHfwH7HCjXFLxaaEV
 5tMYIWmuEEA5IzXDpekiTcsuHOh3wP0i4IDDQ0t5HxfPbuMseqdjv5IQGbdcWzKCCrs0B8U+UVf
 ZzvGdPhANmuvVRyDDnjrqkEGAQ5fs2NdKsyxFEjrW+WibO+Gsvj+3bP92Y52us8g7qcpMtST7Cm
 UCbAjLmVQ=
X-Gm-Gg: ATEYQzwyNgLJtCdcKnc46GnW0LRaO5dfgE9gB+XhVVRFbpTSIN5VsZ92mDmijp7Mbcz
 kr/SA0Pa04i/w/styIHmDC5y3AvIXgfLfV+txW0Elc84IKc1q08edOaCFZ/eBEToSfha/9Wmq8A
 eNmPeWoZZUQ0zwVrxHJEM44oH+qmd7eg6570PNZ3ysC2kj5ABafqhVPkXRqDtGYMsBL+ueAYOtQ
 WXwVOIE7eZ6xrw2V+dBvaRHmuakJVBUyrtC0L7ZEL6LYG1zpHU8rH8nZ/QNMeUVuMYGYoEyZxWk
 bK1o175P3Dar6YiYzCBAZ+CjXEvAVrqBkgfCXR8oDwf23RAXwQMRGifWOjcwXdfpl4KSbpxDCB4
 BLnYOd4BLjLEy+rTAO/aweRMpmGj+CDQ4T3MQ/k9jwzKSdJR/KLB1
X-Received: by 2002:a05:620a:4481:b0:8ca:3175:cc67 with SMTP id
 af79cd13be357-8cd6d38622dmr324184585a.21.1772812045336; 
 Fri, 06 Mar 2026 07:47:25 -0800 (PST)
X-Received: by 2002:a05:620a:4481:b0:8ca:3175:cc67 with SMTP id
 af79cd13be357-8cd6d38622dmr324174885a.21.1772812044636; 
 Fri, 06 Mar 2026 07:47:24 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:6d2b:ebde:c946:11eb])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439dae35cf7sm5122767f8f.26.2026.03.06.07.47.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2026 07:47:23 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 06 Mar 2026 16:46:43 +0100
MIME-Version: 1.0
Message-Id: <20260306-qcom-sa8255p-emac-v7-5-d6a3013094b7@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5268;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=LDFkKLv5ARuhq8/x6VcnVxHsdoIAj567yL2jxG3u5d0=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpqvbudisJuUs+uzQuYM4kwbULpnT70fI+O6Ked
 MgQRpkYVrWJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaar27gAKCRAFnS7L/zaE
 w6M5D/4tV9bjNIrL3KQS5L1RPY0/RnRpsXk/UL/QTV+vb9mlGIr7BCzakEYstEI9GDNBWC//pmB
 67b/OET8ZTz9SjGa3wQ99qew4tSaOVsJ9dH1Z+SKDcrCxx+sdhhQt4WybjsIUJY3yJKIQOeXcX3
 7AIj7lKbbQotXliu0sN38h8SzaxIGnbtiWUzLm23bYLzfymlzw8Y1BuLlqmPHDz0+qv4qOaqg68
 /tVJSXH9oBNQqTy8ifrZtdr+BeGUfbYM4cecQeEV+lsBitnHcNQkN6G79K89rtFAXqrvpTveXaT
 tvqk6EUif/YwW7WplcDUOBKkqeRilATWiOLcVKgSwvoHrcxT8flq9KIwOo38IRVirZkR/KMmzPw
 5Wa+oZ2AIrsR3+z4vxMfms2TrUi9oeYFqajTKjKw3juefjCdWvdu4GaVO+aWq4P4eRV7OXNwZIQ
 TZKq0JY3fNLDb59nA4vdbck+OmGWRvj416W8pHrNYLNL/xPku7O184pClqFQ+FKbDvHsE3rLxcS
 9oAUeasvbuAjCU+Jugw1wcX8JVhmiG0f0YbFHvIqVZ8N6qPokAL9I+SFF583aGhMbZZenoC4IDO
 yRhML39/OFBPiK8PDUJzZtSwujwF+oe4IfxTWDpcyAL7Jz8XRyAPhiqfY/RQedA5YfVsOhzX84l
 mYhh7X8Yw7HRvJg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: _fwManasFOGNeuWfwGakx3YTTEmu-RTa
X-Proofpoint-ORIG-GUID: _fwManasFOGNeuWfwGakx3YTTEmu-RTa
X-Authority-Analysis: v=2.4 cv=G4wR0tk5 c=1 sm=1 tr=0 ts=69aaf70e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=i9KiLjVrthbrk1TKfJAA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE0NiBTYWx0ZWRfXygUzXGUzRga0
 pQY71FhokIJL50Tfrxj4XaDs6c/E+xhxcNCS4kGXVwmfv19g6SO7mJ+I7QwIATNS/MGARJ3USgm
 atD+Vl0Zeyv/YzQzjlzBqYJWTze4jOf5AcM1Lz5Pmd+K/cvRY8RvG63uP0clf3FDc+P7tIcEdYn
 AxL2LN9cjvESve3/gLWLFtMiJE4ln/QhMYke+gzX8/RRGvfWjwwvz1IPZuPe1tXiOnYDxGUBZFI
 humJTZyoF30vEwbhm9nuzaTJynC1VGQu5Cr0pt8Em1LtydYqEHbDfQzsztcxYS4lV92sVf/cVAX
 yK+KXbzvA29hyI2v72e2PEdZh0GxksHeneCNzB7Wx4/wKy3ULixNevemf0OsCw8OZXaA8m3VieK
 oRpPkv91a8I6izrcE5lFnuKscYVOtTOK6pEF8sXGBbBhR2yAfP9zSRTWML9W4JoB2rZPjc8YaNo
 nkh1UUDmKMD84jfoUbw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_04,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 bulkscore=0 impostorscore=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
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
Subject: [Linux-stm32] [PATCH net-next v7 5/7] net: stmmac: qcom-ethqos:
 split power management context into a separate struct
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
X-Rspamd-Queue-Id: 741F522429E
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
	NEURAL_HAM(-0.00)[-0.477];
	TAGGED_RCPT(0.00)[linux-stm32,dt,netdev,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:url,stormreply.com:email,qualcomm.com:email,linaro.org:email,oss.qualcomm.com:mid]
X-Rspamd-Action: no action

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

With match data split into general and power-management sections, let's
now do the same with runtime device data.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 52 ++++++++++++----------
 1 file changed, 28 insertions(+), 24 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index f9a3741b692665b5acce34487f7fc2aaf557f0cb..b88de56d372c370aaf4929d05138f3744c54b1f1 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -105,16 +105,20 @@ struct ethqos_emac_match_data {
 	const struct ethqos_emac_pm_data *pm_data;
 };
 
+struct ethqos_emac_pm_ctx {
+	struct clk *link_clk;
+	unsigned int link_clk_rate;
+	struct phy *serdes_phy;
+};
+
 struct qcom_ethqos {
 	struct platform_device *pdev;
 	void __iomem *rgmii_base;
 	int (*configure_func)(struct qcom_ethqos *ethqos, int speed);
 
-	unsigned int link_clk_rate;
-	struct clk *link_clk;
-	struct phy *serdes_phy;
-	int serdes_speed;
+	struct ethqos_emac_pm_ctx pm;
 	phy_interface_t phy_mode;
+	int serdes_speed;
 
 	const struct ethqos_emac_por *por;
 	unsigned int num_por;
@@ -192,9 +196,9 @@ ethqos_update_link_clk(struct qcom_ethqos *ethqos, int speed)
 
 	rate = rgmii_clock(speed);
 	if (rate > 0)
-		ethqos->link_clk_rate = rate * 2;
+		ethqos->pm.link_clk_rate = rate * 2;
 
-	clk_set_rate(ethqos->link_clk, ethqos->link_clk_rate);
+	clk_set_rate(ethqos->pm.link_clk, ethqos->pm.link_clk_rate);
 }
 
 static void
@@ -615,7 +619,7 @@ static int ethqos_configure_rgmii(struct qcom_ethqos *ethqos, int speed)
 static void ethqos_set_serdes_speed(struct qcom_ethqos *ethqos, int speed)
 {
 	if (ethqos->serdes_speed != speed) {
-		phy_set_speed(ethqos->serdes_phy, speed);
+		phy_set_speed(ethqos->pm.serdes_phy, speed);
 		ethqos->serdes_speed = speed;
 	}
 }
@@ -682,20 +686,20 @@ static int qcom_ethqos_serdes_powerup(struct net_device *ndev, void *priv)
 	struct qcom_ethqos *ethqos = priv;
 	int ret;
 
-	ret = phy_init(ethqos->serdes_phy);
+	ret = phy_init(ethqos->pm.serdes_phy);
 	if (ret)
 		return ret;
 
-	ret = phy_power_on(ethqos->serdes_phy);
+	ret = phy_power_on(ethqos->pm.serdes_phy);
 	if (ret) {
-		phy_exit(ethqos->serdes_phy);
+		phy_exit(ethqos->pm.serdes_phy);
 		return ret;
 	}
 
-	ret = phy_set_speed(ethqos->serdes_phy, ethqos->serdes_speed);
+	ret = phy_set_speed(ethqos->pm.serdes_phy, ethqos->serdes_speed);
 	if (ret) {
-		phy_power_off(ethqos->serdes_phy);
-		phy_exit(ethqos->serdes_phy);
+		phy_power_off(ethqos->pm.serdes_phy);
+		phy_exit(ethqos->pm.serdes_phy);
 	}
 
 	return ret;
@@ -705,8 +709,8 @@ static void qcom_ethqos_serdes_powerdown(struct net_device *ndev, void *priv)
 {
 	struct qcom_ethqos *ethqos = priv;
 
-	phy_power_off(ethqos->serdes_phy);
-	phy_exit(ethqos->serdes_phy);
+	phy_power_off(ethqos->pm.serdes_phy);
+	phy_exit(ethqos->pm.serdes_phy);
 }
 
 static int ethqos_clks_config(void *priv, bool enabled)
@@ -715,7 +719,7 @@ static int ethqos_clks_config(void *priv, bool enabled)
 	int ret = 0;
 
 	if (enabled) {
-		ret = clk_prepare_enable(ethqos->link_clk);
+		ret = clk_prepare_enable(ethqos->pm.link_clk);
 		if (ret) {
 			dev_err(&ethqos->pdev->dev, "link_clk enable failed\n");
 			return ret;
@@ -728,7 +732,7 @@ static int ethqos_clks_config(void *priv, bool enabled)
 		 */
 		ethqos_set_func_clk_en(ethqos);
 	} else {
-		clk_disable_unprepare(ethqos->link_clk);
+		clk_disable_unprepare(ethqos->pm.link_clk);
 	}
 
 	return ret;
@@ -821,9 +825,9 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	ethqos->has_emac_ge_3 = drv_data->has_emac_ge_3;
 	ethqos->needs_sgmii_loopback = drv_data->needs_sgmii_loopback;
 
-	ethqos->link_clk = devm_clk_get(dev, clk_name);
-	if (IS_ERR(ethqos->link_clk))
-		return dev_err_probe(dev, PTR_ERR(ethqos->link_clk),
+	ethqos->pm.link_clk = devm_clk_get(dev, clk_name);
+	if (IS_ERR(ethqos->pm.link_clk))
+		return dev_err_probe(dev, PTR_ERR(ethqos->pm.link_clk),
 				     "Failed to get link_clk\n");
 
 	ret = ethqos_clks_config(ethqos, true);
@@ -834,9 +838,9 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ethqos->serdes_phy = devm_phy_optional_get(dev, "serdes");
-	if (IS_ERR(ethqos->serdes_phy))
-		return dev_err_probe(dev, PTR_ERR(ethqos->serdes_phy),
+	ethqos->pm.serdes_phy = devm_phy_optional_get(dev, "serdes");
+	if (IS_ERR(ethqos->pm.serdes_phy))
+		return dev_err_probe(dev, PTR_ERR(ethqos->pm.serdes_phy),
 				     "Failed to get serdes phy\n");
 
 	ethqos->serdes_speed = SPEED_1000;
@@ -858,7 +862,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	if (drv_data->dma_addr_width)
 		plat_dat->host_dma_width = drv_data->dma_addr_width;
 
-	if (ethqos->serdes_phy) {
+	if (ethqos->pm.serdes_phy) {
 		plat_dat->serdes_powerup = qcom_ethqos_serdes_powerup;
 		plat_dat->serdes_powerdown  = qcom_ethqos_serdes_powerdown;
 	}

-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
