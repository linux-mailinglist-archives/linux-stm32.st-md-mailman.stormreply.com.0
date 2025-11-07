Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5678EC3F929
	for <lists+linux-stm32@lfdr.de>; Fri, 07 Nov 2025 11:50:02 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 99F26C5F1FF;
	Fri,  7 Nov 2025 10:50:01 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F07DEC36B12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 Nov 2025 10:49:59 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5A75FrpH568156
 for <linux-stm32@st-md-mailman.stormreply.com>; Fri, 7 Nov 2025 10:49:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Qy4xZjaDaueCuwPTRvX9IC7D9BFWUmRUOg/PJT9rm94=; b=j19zi5vcZvZc+J3h
 eil5EXgb7o+MHafKBi9Slf1MAsHwht9ShJKuhVBN4IuNbfkFvOasu8HUs+laic1i
 ApQFCQDDkr0nR1Z4s/mFsEJRFNaTWW7B62zkTCNyqa8FVCGzmDgnRi4aJaWpx3yo
 7YBrhqEKVuWBhNuAaoE60NFeKFuxZH+p+rn0tyDvgwMCTDDPUaOdyqcmIN20Yni7
 e+FAQn327eA/EMJkdOZ1oKcI5NWQiBeaIRCP9KmnXRYAWj3UM/IlF2kolv1vNI8Y
 9Rr7K9olNJaawFxFkksQTdDzKZOepplYR1QpfkBYS3jwKcxtOTKS7ODirqnsgtuo
 rorS0A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a905qjq07-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 07 Nov 2025 10:49:57 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4ed6317be8cso2044001cf.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 07 Nov 2025 02:49:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762512597; x=1763117397;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Qy4xZjaDaueCuwPTRvX9IC7D9BFWUmRUOg/PJT9rm94=;
 b=DhJyYzRYba5gtt8UVDMe8SlGm9HNPpN2Jjxo7h/GDv4MVAagP34b1H/e7GMpQKTs5A
 TuBPkF4xank4bZJGhGo7/AedSzo12dPeF+Z4UYCnXLXNAskNGM2BhRMBlygz9/JmUD95
 TEyqj7zDwGjzOsqwPamGUoNMaOpm5jWa3MPUZTfnNdHsR5zkzGlb//xvElYMlcmSDzws
 kt5cM9AR4Q6FL3mt/yHBcMD01G4jlVPVRFQ05mvUyZ6lhb8xQLqFwe1EcSsmoYrmvNfb
 7ryY49rjCyfKhQnB4A6wVRBeObZlAWyVnCPEJ3lHwkHF/7/hGus4kVsG7jIdHZK71D6w
 NX0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762512597; x=1763117397;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Qy4xZjaDaueCuwPTRvX9IC7D9BFWUmRUOg/PJT9rm94=;
 b=pdQjLSiJMBWRzsXfrFhNwIhNbXYjsGPdrcZPi+OYGpw5eK3JQuJzVfEO0griiW/qpG
 sgzjlAHn7W9I6ouzc1lCTuE45nTmGOJLqSSQZ2VuAcUPvgoaaSMWi3c1I25SVioGRUqq
 +QNTB+Q8fROVtIMPbOoivouEConAjm368pitgxmwjB3uGtyUq4lWiJFIfdsZqUSYna69
 HOw1eC8FBQnpcDx7kuQAk3eukIznws0RcAemxKW+Yssfep9nYZQKWKMMVerfqpLovjag
 k3vD8GHbRHgRTHJjtIfQQdqS8t7u6kFm0LmQPblPF9+D9molVP89vmxlfrkwWpR6t2BV
 tnGA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXOKyN40DOP5Tdj0RqXAtcbTLHe1n97GpJMkjwtSPiFAaPJbpqrI7+HQfaSWTYl9/bDoL1Zx2JurU1oZQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzthGBa+JxGKdmzQy8cLpWQEr6DBMigwWrptlDUADG96PvYY4wF
 kgdUu4poWxtPIUUaUsA8qDzkYydvEkWJqm01L+Eb1vLgsQqfiH3KXh7JLe8WkcvL/uIYp/aogx6
 MB2L//M+UldDDTfWxtumcq5Gntnldx7AlQC6z7jw8ClK3tr9DgcBEQNk3+839d/YWdnHx47dOb6
 ZE2zJzgHU=
X-Gm-Gg: ASbGnctXsNgnlYmgeALep+TSbqcUDGNj5Y/6fi7xNl1o4lH/K3OwjSxtoalrdsQvrum
 rLEEV+f77hkDTxQrudFWAjxpgrck7aHPBR9vKbV49I4i1f1mqstPbBzzsy6f4C892aSkVofHZHa
 YOBYPlFlqW7QoiywelLMnBnHILofVRVcqVXwiW5c41Ex566RWhmtUgMw2zy0byRRa/eMsgaepnQ
 Z78rt0+o3aLqbpQhXqVLhIo+LSw+xQYUUqZFtBYTvcRthLWlT5tiaaS2deP7xQSphvNjyA7DppT
 ilT0+EK6g/E64E+l1WxYFX7g0ZdsOdifcHM0NKEDq5coTp3l+kkRtzMyYQUUQsHawXdFbaVt7l5
 1cKRMVG99++k57EcoDI9d3tX5BE6RdA27AWkr5Wr4qAjlP/ksIsTlTOET
X-Received: by 2002:ac8:5a51:0:b0:4e8:966b:459b with SMTP id
 d75a77b69052e-4ed949bb0f9mr18063321cf.5.1762512596821; 
 Fri, 07 Nov 2025 02:49:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFb3Xbou/G0Zzd63eLA+eutWoqm0V75Q2RL/wdtW4sHDSzQGKhPaQSn2W6oLQojU83FQkCi9A==
X-Received: by 2002:ac8:5a51:0:b0:4e8:966b:459b with SMTP id
 d75a77b69052e-4ed949bb0f9mr18062921cf.5.1762512596362; 
 Fri, 07 Nov 2025 02:49:56 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b72bf9bc2fcsm204678566b.50.2025.11.07.02.49.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Nov 2025 02:49:55 -0800 (PST)
Message-ID: <21a3d269-76e6-4da9-aa25-bfd1fb6dfb07@oss.qualcomm.com>
Date: Fri, 7 Nov 2025 11:49:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bartosz Golaszewski <brgl@bgdev.pl>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Richard Cochran <richardcochran@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>,
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
 Swathi K S <swathi.ks@samsung.com>
References: <20251107-qcom-sa8255p-emac-v5-0-01d3e3aaf388@linaro.org>
 <20251107-qcom-sa8255p-emac-v5-2-01d3e3aaf388@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251107-qcom-sa8255p-emac-v5-2-01d3e3aaf388@linaro.org>
X-Proofpoint-ORIG-GUID: j01hh8U23wjGRmN7u3O-SgL321yYgzJj
X-Proofpoint-GUID: j01hh8U23wjGRmN7u3O-SgL321yYgzJj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA3MDA4NyBTYWx0ZWRfX49YjrFx4cSV2
 Np0vOwma5l4YYl5+yKPn+gYPArfCAzEQ5qkKPMHptMq7V8n1brf6IO/AP1dBMxFrIkmU99Vvplu
 MPE6+N0ZxGXDtfuMmvBtaQnWj0wfTv7T+2Tqvllz47R9Jnnttoc7FSM6vtCsOTQ1ZvUuxRHyts3
 ePk5hpDH5VQZtlXhfGZr92CKPhqBTLuv/1ppxVwcvQd1z/Uhm9Z2fEfsTPQkxDw3lnjlLqDYYSJ
 Fx4YMUQ+J49+ftnrVcbPrHS7FR4t6Al30X1xxnERo5AMZjEtXsyg0qOLtR4qfIpvUeXEcTUl1fn
 m85voJk5klJYcDlUQIftWrSWQ//9MXYqM7/Z7PGMD0F1hYWbOC2+99r9bT54U3q2dhxTjImYoxU
 FqXum8pOwxsmFX7c1hQGzUMuY3vHVA==
X-Authority-Analysis: v=2.4 cv=D6lK6/Rj c=1 sm=1 tr=0 ts=690dced6 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=xTS94RJRWet4TjKJq7QA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-07_02,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511070087
Cc: devicetree@vger.kernel.org, linux-mips@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-msm@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 sophgo@lists.linux.dev, netdev@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-riscv@lists.infradead.org,
 Drew Fustini <dfustini@tenstorrent.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v5 2/8] net: stmmac: qcom-ethqos: use
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

On 11/7/25 11:29 AM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> In order to drop the dependency on CONFIG_OF, convert all device property
> getters from OF-specific to generic device properties and stop pulling
> in any linux/of.h symbols.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

[...]

> -	if (of_property_read_bool(np, "snps,tso"))
> +	if (device_property_present(dev, "snps,tso"))

This is a change in behavior - "snps,tso = <0>" would have previously
returned false, it now returns true

although it seems like it's the plat driver clunkily working around
not including the common compatible and inlining parts of the common
probe functions..

Konrad

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
