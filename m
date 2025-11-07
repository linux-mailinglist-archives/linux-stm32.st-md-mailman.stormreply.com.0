Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 58ADEC3F96E
	for <lists+linux-stm32@lfdr.de>; Fri, 07 Nov 2025 11:54:47 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1213FC5F1FF;
	Fri,  7 Nov 2025 10:54:47 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6EDFAC36B12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 Nov 2025 10:54:45 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5A74Im8U557134
 for <linux-stm32@st-md-mailman.stormreply.com>; Fri, 7 Nov 2025 10:54:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 t3IKVzBz5JQK8wTUX7NukAcRSdlW+wFpDRAPikZl4+E=; b=D3ciq7sL0T/1mqDA
 KQOUvXh3Mhxuk859eyTuTtyDlTSts27cCw5jo0Qy/Kqfi0+9EEgGjO78tdJgcjiI
 /ZYPn7i8YLL/cNB3YOhXlcFlNRonkS1KARKEuwJrURUm79wZUJENvHCzLGPw3vJc
 sS2fL7+89HTzvn+w8+6DMz910/EXVZ1KhlcmAk6+G8RfEVGfOiJfWEu9s2rqXdfY
 npR/UpgRmaHsmNeiItvcsNJ4uFfteDzCHsTZdCMFaDW+0I45vW7sXMrAK0mQkULJ
 PcBbv6BEOI8XYuVJ4nEOxTArWjAXQf/S/5TbwBToT9e+cq273Msh3ToXZlizm4UK
 z0AxXw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a8yr9tspe-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 07 Nov 2025 10:54:43 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8906754b823so23251085a.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 07 Nov 2025 02:54:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762512883; x=1763117683;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=t3IKVzBz5JQK8wTUX7NukAcRSdlW+wFpDRAPikZl4+E=;
 b=Yv0rqommG4nt/qyxwesOyn6ZBHHqW8phsCBOcOkNbly4iigs7Cc8LZz8Rq7Oht/ZPA
 pZNJupbA7MSTHquh+glrRzWlu32JJBewQIv1cBiFkWHXsa2DAx573G7DbmKmh+IT/3oi
 3FHhlPTC0lxkSsUOY1co/286kNFIe+88IlsgOzsYQ4Os+S7guld2IMApENxB/UoRHa04
 JQ668U7DjTUwDQl858gpooaMboW8KCywdF5a41bTmrHKJ9jzjI2EwVaiCkvMwGTDKTil
 V5fYyUBFazRiRPUeELD+lTtJqjDLcv1I8AzcUs5FRn3YHXhMHkixZYNSSV+GrueYeVm8
 vp/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762512883; x=1763117683;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=t3IKVzBz5JQK8wTUX7NukAcRSdlW+wFpDRAPikZl4+E=;
 b=PuoCdMu9T0h/Du85stADse5PEKo4oD/hIOIciYtaS5I0bKIWRDrvCM/ZIqhN0aE+aS
 rJ1GtWXViqKBACtnDsImNPuEV6vM19GFJyqZE+3m5B6Y+CyVJVfTVSIcWqlJD70D1Lz/
 Hftw8SviaIwe4UsWNmkAX9WRAuStVKeQlWM+29hdg01xvahURXnxTdThSnxf3M5B5WrU
 bpmrb6GaTyMEa18P7OcxNkv50GOIGBaWvxKbvz9BJaFu5NOZIz5NKLqdwEtfm0ZqUhqY
 ef+jmyramOBpKLNY+pPFbaVlIhtPNkv39OdraEvYYnkFk95keNGnZsWxcgpKV6wLPJPG
 O3fQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/O73wCED2kDC8PqetMO3PGkMRgSn78muLBIrs3VldwMfpiAbledhUxJFMCyXRLQiDv1NwAEjKPnidAA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwDo1iUKdJWJVQY3xQht9qPwR3cfrtDnddcNQwJmV1iNe5UBVUp
 4lmXsEzCbNNN53xiEtdSBy789E4Khs/9bRpD5+aIVYvNNo4+0Nm+pusmIwNWqj8rSiTLyK4fFOk
 3H0onrHEa6n1aomtLwwnHva+0vtlMrKnlD7HNvhFXcXLR8bwdVVcQvKcK2ALTYoSV+y19MCTG1p
 SBmuvzCxw=
X-Gm-Gg: ASbGncvnSqRQH5y8FkaCJnj/lRuDB3S3mT+qJ8/QSFZeujm+pFCIfwp97VGXhbHqcgO
 IPAJ0Uib/75qhAX3O48GsskMgwtT/3nb4jdeXN7W+5a0yW5xU0rmGJP6ATpB8vIbKEwsdG9UFtU
 Uu2m0TecBNLEOFGPKiHc8aPdSbggoGDizAO3D7Cy+NMXoHEkvGwFh2N908TXrRSY0/gZnFVMc1s
 fNMp/2J3bJquAGvPReDxrNjgTemf0ROvw3kZSqv4lfw498370tjHU4bi5sqoMDieMHHUgT22NiL
 yA1lmewsnghBFWyR6geg2K60YCuh+2mFRh8ldcWWzt+h/mECbqTaorkZncFG18Vp7lPzj/1dRKY
 r6KZ+DqYBBTZfRnRW72bQxzmSgs17Omk/BXb16k+JD+L3Cg7e8ytCOnKF
X-Received: by 2002:a05:620a:2a08:b0:8a2:a5b2:e3bf with SMTP id
 af79cd13be357-8b245297214mr216403985a.6.1762512882660; 
 Fri, 07 Nov 2025 02:54:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFi7mPq0na085cioUOvqXq74YCfsRc6NxnJgSblNj9scHFLGnEvxVACu852vb4CayQn6idLew==
X-Received: by 2002:a05:620a:2a08:b0:8a2:a5b2:e3bf with SMTP id
 af79cd13be357-8b245297214mr216399685a.6.1762512882057; 
 Fri, 07 Nov 2025 02:54:42 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b72bfa11367sm205508166b.68.2025.11.07.02.54.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Nov 2025 02:54:41 -0800 (PST)
Message-ID: <86df9697-af58-4486-93de-b01df5ba13a6@oss.qualcomm.com>
Date: Fri, 7 Nov 2025 11:54:33 +0100
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
 <20251107-qcom-sa8255p-emac-v5-4-01d3e3aaf388@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251107-qcom-sa8255p-emac-v5-4-01d3e3aaf388@linaro.org>
X-Authority-Analysis: v=2.4 cv=DrpbOW/+ c=1 sm=1 tr=0 ts=690dcff3 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=4r4FsD-561SDv7fJwu0A:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: ExwW9waHCLMmaP_49A3n6SB-Y_EBoa5e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA3MDA4OCBTYWx0ZWRfX13kuvJzPYgdj
 bZK3eAhpfd5Ikbup2apqgEwFeBBTvVYzMUvAhj4uswoj0UNP0GtD16LI7IF6qGhP8sxky+oYCvu
 uysCH3o4WJcGZpNefRyC5bYjJR/HlV2B+Ks31aRa6AvNbGhOngZZximXTrjhuci4abg42CmN/lK
 +FuiZ0P9ePv5/CYXQ+7nyhtccVCPaItohC5Vrtijl4sAlbRTpZSQWnOwfmwqrmF1kXLRrQ4J3X8
 v3QHSRmRB6ANxeQdiW5sAAh+UkjFzQSBiXMEg1zR30FkFiyufH0j6OkvqdlWfOjpS1g/kFVbIq0
 Q/30hTnSwzIB+Iu/Q3v2i11x7OybSJ+PFA9nmTaXJEI15B8rSvUau2ofTTl4xPiEN+jZZUwcppo
 EwiQE5dFQty+dCmest78p+XiFtLOmQ==
X-Proofpoint-GUID: ExwW9waHCLMmaP_49A3n6SB-Y_EBoa5e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-07_02,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511070088
Cc: devicetree@vger.kernel.org, linux-mips@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-msm@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 sophgo@lists.linux.dev, netdev@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-riscv@lists.infradead.org,
 Drew Fustini <dfustini@tenstorrent.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v5 4/8] net: stmmac: qcom-ethqos: wrap
 emac driver data in additional structure
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
> As the first step in enabling power domain support in the driver, we'll
> split the device match data and runtime data structures into their
> general and power-management-specific parts. To allow that: first wrap
> the emac driver data in another layer which will later be expanded.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

[...]

>  static int qcom_ethqos_probe(struct platform_device *pdev)
>  {
> -	const struct ethqos_emac_driver_data *data;
> +	const struct ethqos_emac_driver_data *drv_data;
> +	const struct ethqos_emac_match_data *data;>  	struct plat_stmmacenet_data *plat_dat;
>  	struct stmmac_resources stmmac_res;
>  	struct device *dev = &pdev->dev;
> @@ -801,13 +822,15 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
>  	ethqos->mac_base = stmmac_res.addr;
>  
>  	data = device_get_match_data(dev);

This change could be made much smaller if you kept a drv_data
pointer named 'data' and called the new one match_data

but I don't really care either way

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
