Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B8014C57ACA
	for <lists+linux-stm32@lfdr.de>; Thu, 13 Nov 2025 14:33:06 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 75CAFC628D4;
	Thu, 13 Nov 2025 13:33:06 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 83CE5C628B7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Nov 2025 13:33:04 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AD6i1vR3802201
 for <linux-stm32@st-md-mailman.stormreply.com>; Thu, 13 Nov 2025 13:33:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 wNLEUtImMXvAmjKIRtueCGZIQNgFOT3pJRe5fakSwLQ=; b=dCTchLVV2jAjgWiY
 ICFZIXcCA1dJnIdIViz48q5cmif6mK4Tv0rs91XKwf+WAKqP0coiOozMAqCNtf54
 v6WWSIzwslz5D+1JkALoTwwk/ae6y6C0EuTKEYl1O4rTOgn9jwhIMXqcJKyIBLLY
 GH+s4I/2nY0dwLFEo34gHaWMjv5jNRb9nyCg3ZtM58/JWNfCxxyRH82pTPnFmMUq
 7osKcoZo/tExDV4AhVEQD/W6FWf5rXTVCv2+piy1J93B+Y6hkdoZc9qgOc+61TyO
 XCK3H+LqmC4PnvDoQJ9QUGE62ObKb9yqGEqPJM9kWCxuO1TDgaUYSBWnqQ0cRRAI
 BI+hQg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adaam96xv-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Nov 2025 13:33:03 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4e887bef16aso1203321cf.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Nov 2025 05:33:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763040782; x=1763645582;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wNLEUtImMXvAmjKIRtueCGZIQNgFOT3pJRe5fakSwLQ=;
 b=SsGK459pkOaI1MI6i9OL10drhFjsYd51Mlsx8fcqMwD4bfVm033gaSd80XuWiQc72E
 KP5dAsqjZMX7NPl2ujIpUllry2EZDqGFiEpCSPAI0ESxLBl3n+f6/PjTmhB0hGDPSyzi
 LsO3CT1sNpNr/WVVz7bnVz3vZWPRe37XAK3jBuw33kjZGrmQYy89k9TDgtWDB3T2Sbs+
 vxzZKuUTL0IZ8UUzIElpQmz7pZP6QRcBSB5KvlLJnonRJjxBmp1BMM+nssJvrkCmzX+u
 RiDMKOoCxhVjQelIWMRNVXBvRN/2zpX6VFxR2oQAfxdScL107LqHbOCfAyC3L5m+gxxt
 RAkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763040782; x=1763645582;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wNLEUtImMXvAmjKIRtueCGZIQNgFOT3pJRe5fakSwLQ=;
 b=n1sUDXLN/unwMGWee8/NDH3pOalaecVrr05cU4a6OwxQsuQ9FAkY5SlD8kgEYPcKMi
 jWvnqWDRip8VRPn/qWIh0UJ1fasHzjjI/9FB1nNiwR2ZI62SbtboO4DbiYkNwVsZ0+Fv
 WXjMITDooF6974ym2q5ax+xztwL8vvv0ut61ulkGTEf42caC9c37rQlloQHzzD/8uVKc
 ykUJxyX1Tz0nPK9gh3ag9y4jQq+Qq9FOblRWAfUOnsvCbc0XjOMOZU7yqA1Q/ZZpCk6d
 RDSk3qOLzJ+CyJKelWktCMRKrWlz1hSsAnsXifTla49ruJNaPWwmkK9UCX+yPd/SSmOv
 CTew==
X-Forwarded-Encrypted: i=1;
 AJvYcCVpNyTLfq1rYdKciAVCBhj0w62ml5GgYV+koBA/VrTPT8IXA2SVpt4T+ymtnK5f+qB01fDcrqshwA++QQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyMvjucwuhPPtNVLPle+mLevojNb6sgVGNMoFNbRN1MxvR1mco0
 cgkEaKQALn8iPjJ48Lm/HEVx0v06tQmPlIXzAcFXx0OziR69kutv/sg4ZFc23TrlmQyrWKotaGg
 g2yVdDcnLyHvq5nuh7D2jcUjpFdLRGQVomR53vQkPkRPEwBwYQnO2SVNHS12wjYImYCWY+n/FZI
 /SgS5wxl0=
X-Gm-Gg: ASbGncuEwHkGR3aeRUXCYsOXkgcgNzEe2I5FqWxbATO/u+3LV65EsXtdikEuJaK1WTZ
 XyvRPmhxT88h7r/hN9568hBjamzS+Ftbw2GymYhO5aQfdhFEA1VByN3KYvJM0cNnKuUUjG9Rr9+
 RcedOtDuvYmJ+xDyT4gwFc5Vsss9jtFQAmpeZrAWx6/5Fxh23EMCPVlxxG1ecUQ6qsdSPOVvSHG
 sLuRd2/MlHK4Xqgb93tE/Hri7Q+fQZUc5tXThCF0oiqTgDwe+o/afgD21Q22F9mJ3He2Q35HnDt
 aTnErKnfE8wcZnMxthrgh8ODoWhn7QhNOq2E2Ybn/3ybYbh44K4xJUC4Q2WfS8QKaK3A0RI7DAp
 +ZvFAOgeuDDOj/3qDAGtu8wvk8cdpW94o3kZYO6dhbj0z6SmV1FbRaF7c
X-Received: by 2002:ac8:5d8e:0:b0:4ed:b9ee:3ce2 with SMTP id
 d75a77b69052e-4eddbdae8demr64144881cf.11.1763040782422; 
 Thu, 13 Nov 2025 05:33:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGrzhJHhVjwGaQu/IkcGeYInBcpQOo8PGlB0mVpgZ0Fcc+3wNub2niPYVso88lX2dAHMTacPQ==
X-Received: by 2002:ac8:5d8e:0:b0:4ed:b9ee:3ce2 with SMTP id
 d75a77b69052e-4eddbdae8demr64144061cf.11.1763040781802; 
 Thu, 13 Nov 2025 05:33:01 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fd80a11sm162333266b.39.2025.11.13.05.32.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Nov 2025 05:33:01 -0800 (PST)
Message-ID: <cd7c0490-a2d6-4885-aa36-ee1492f107b8@oss.qualcomm.com>
Date: Thu, 13 Nov 2025 14:32:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bartosz Golaszewski <brgl@bgdev.pl>
References: <20251107-qcom-sa8255p-emac-v5-0-01d3e3aaf388@linaro.org>
 <20251107-qcom-sa8255p-emac-v5-2-01d3e3aaf388@linaro.org>
 <21a3d269-76e6-4da9-aa25-bfd1fb6dfb07@oss.qualcomm.com>
 <CAMRc=MexMn_GSC2EtMek5hDRLjGYA5HKM8ge9vrxw1pYDqPJgw@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAMRc=MexMn_GSC2EtMek5hDRLjGYA5HKM8ge9vrxw1pYDqPJgw@mail.gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDEwMyBTYWx0ZWRfXwO/GznS/I47I
 wTlYJWz8IgsO5YKPuzpm4MStnF5zVeErq1RQBDBhJpykfh09G+VyI2iIC9uJnqUEOeh7UmtkXWZ
 0YsXe+7d8QzHiL6EJiH4MTRiLcnqqM6AP6xYMfVd3eRYxxFuDGzHG9Hu3m5Gw+Wj1Et3isN6FME
 fGquZcN0ySepViX/jtZ6RKHTswqUuXWa8gx74fD14Fu+7bEAnLK2D5As8bNc5XGxWuMZAmTwoi8
 QxhL5TDqiGMTtGCQasymr96Y9kABWAdIcr7oYSU8n3lbDiApdZWk+CNUJqBQV6+P3KYfHitB1ha
 IQfVzZR6629VOmw8dlv8hMw1erSFqzAc3IAA5zcuw6XU+Kqe3LwjDa8ymNcOMCINCO+RwRFzcIv
 MuuJrYRJVXnQlIwFC1wCIxwGO9H3cg==
X-Authority-Analysis: v=2.4 cv=d4f4CBjE c=1 sm=1 tr=0 ts=6915de0f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=Pp6BL5jzwldociJZjw0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: yUyAWv9495Z3LNsSYSYSyXRmWtwLuYLL
X-Proofpoint-GUID: yUyAWv9495Z3LNsSYSYSyXRmWtwLuYLL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_02,2025-11-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 phishscore=0 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511130103
Cc: Drew Fustini <fustini@kernel.org>, s32@nxp.com,
 Heiko Stuebner <heiko@sntech.de>, Geert Uytterhoeven <geert+renesas@glider.be>,
 imx@lists.linux.dev, Frank Li <Frank.Li@nxp.com>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Swathi K S <swathi.ks@samsung.com>, Eric Dumazet <edumazet@google.com>,
 netdev@vger.kernel.org, Guo Ren <guoren@kernel.org>,
 Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
 linux-amlogic@lists.infradead.org, Shawn Guo <shawnguo@kernel.org>,
 linux-riscv@lists.infradead.org, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Rob Herring <robh@kernel.org>, Drew Fustini <dfustini@tenstorrent.com>,
 Shuang Liang <liangshuang@eswincomputing.com>,
 Samuel Holland <samuel@sholland.org>, sophgo@lists.linux.dev,
 Kevin Hilman <khilman@baylibre.com>, Chen Wang <unicorn_wang@outlook.com>,
 Magnus Damm <magnus.damm@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-rockchip@lists.infradead.org, Jose Abreu <joabreu@synopsys.com>,
 Clark Wang <xiaoning.wang@nxp.com>, Linux Team <linux-imx@nxp.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Konrad Dybcio <konradybcio@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Emil Renner Berthing <kernel@esmil.dk>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Samin Guo <samin.guo@starfivetech.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Richard Cochran <richardcochran@gmail.com>,
 David Wu <david.wu@rock-chips.com>, Jan Petrous <jan.petrous@oss.nxp.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Maxime Ripard <mripard@kernel.org>, Minda Chen <minda.chen@starfivetech.com>,
 "G. Jaya Kumaran" <vineetha.g.jaya.kumaran@intel.com>,
 Shangjuan Wei <weishangjuan@eswincomputing.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Chen-Yu Tsai <wens@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-sunxi@lists.linux.dev,
 linux-mips@vger.kernel.org, Keguang Zhang <keguang.zhang@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Romain Gantois <romain.gantois@bootlin.com>,
 Zhi Li <lizhi2@eswincomputing.com>, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 Vinod Koul <vkoul@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Inochi Amaoto <inochiama@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthew Gerlach <matthew.gerlach@altera.com>,
 "David S. Miller" <davem@davemloft.net>, Fu Wei <wefu@redhat.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

T24gMTEvMTMvMjUgMjoxOCBQTSwgQmFydG9zeiBHb2xhc3pld3NraSB3cm90ZToKPiBPbiBGcmks
IE5vdiA3LCAyMDI1IGF0IDExOjQ54oCvQU0gS29ucmFkIER5YmNpbwo+IDxrb25yYWQuZHliY2lv
QG9zcy5xdWFsY29tbS5jb20+IHdyb3RlOgo+Pgo+PiBPbiAxMS83LzI1IDExOjI5IEFNLCBCYXJ0
b3N6IEdvbGFzemV3c2tpIHdyb3RlOgo+Pj4gRnJvbTogQmFydG9zeiBHb2xhc3pld3NraSA8YmFy
dG9zei5nb2xhc3pld3NraUBsaW5hcm8ub3JnPgo+Pj4KPj4+IEluIG9yZGVyIHRvIGRyb3AgdGhl
IGRlcGVuZGVuY3kgb24gQ09ORklHX09GLCBjb252ZXJ0IGFsbCBkZXZpY2UgcHJvcGVydHkKPj4+
IGdldHRlcnMgZnJvbSBPRi1zcGVjaWZpYyB0byBnZW5lcmljIGRldmljZSBwcm9wZXJ0aWVzIGFu
ZCBzdG9wIHB1bGxpbmcKPj4+IGluIGFueSBsaW51eC9vZi5oIHN5bWJvbHMuCj4+Pgo+Pj4gU2ln
bmVkLW9mZi1ieTogQmFydG9zeiBHb2xhc3pld3NraSA8YmFydG9zei5nb2xhc3pld3NraUBsaW5h
cm8ub3JnPgo+Pj4gLS0tCj4+Cj4+IFsuLi5dCj4+Cj4+PiAtICAgICBpZiAob2ZfcHJvcGVydHlf
cmVhZF9ib29sKG5wLCAic25wcyx0c28iKSkKPj4+ICsgICAgIGlmIChkZXZpY2VfcHJvcGVydHlf
cHJlc2VudChkZXYsICJzbnBzLHRzbyIpKQo+Pgo+PiBUaGlzIGlzIGEgY2hhbmdlIGluIGJlaGF2
aW9yIC0gInNucHMsdHNvID0gPDA+IiB3b3VsZCBoYXZlIHByZXZpb3VzbHkKPj4gcmV0dXJuZWQg
ZmFsc2UsIGl0IG5vdyByZXR1cm5zIHRydWUKPj4KPiAKPiBUaGlzIHByb3BlcnR5IGlzIGEgYm9v
bGVhbiBmbGFnLCBpdCBjYW5ub3QgaGF2ZSBhIHZhbHVlLgoKRXZlcnkgRFQgcHJvcGVydHkgbWF5
IGhhdmUgYSB2YWx1ZSwgc28gdGhpcyBpcyBub3QgYXMgb2J2aW91cyBhcyB3ZSdkCmxpa2UgaXQg
dG8gYmUgKElJVUMgLSB1bmxlc3MgdGhhdCBjaGFuZ2VkIHJlY2VudGx5KQoKS29ucmFkCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1h
aWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBz
Oi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0
bTMyCg==
