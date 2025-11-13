Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 365FCC58054
	for <lists+linux-stm32@lfdr.de>; Thu, 13 Nov 2025 15:47:23 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C92FDC628D4;
	Thu, 13 Nov 2025 14:47:22 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6DE8EC1A977
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Nov 2025 14:47:21 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5ADEi22Z3801194
 for <linux-stm32@st-md-mailman.stormreply.com>; Thu, 13 Nov 2025 14:47:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 c/j8O4OMZ/iO6ANHgdWOttUeORFw+6paoVM6GB+aNhc=; b=b/JRKlQaoXhQbjBg
 7mm9S/5h3Fp/qe27uSlmDQXdKJyVelTPms9TAYlDvBXVpwrx7Y/JPF42qOoJETR1
 cZsoxMoudkiU5Xx0VLidAV4Vf4PHDod433Ykxn74s+LsoMkTrwjARIl3IDm/A+Rr
 grUZjvJu70AF5w6jwH7l4Aq5Be8BuM4nP6pt3KJhqDbJ+xtwdCLznzo3aNk/9SZu
 F6Qj+Ub89gKav1oigAckmv9WKdjgeoUN7Q2qgBe471l3GyeBKiIxCveVSXs/+XGB
 RXI/WhEDsA6qtDMbbTNJWwMSedDbYI2Id5NJthr9QY3IvsFmN+3HmL11WKKwX00L
 cTlHdQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adaam9euv-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Nov 2025 14:47:19 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8b222111167so25703085a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Nov 2025 06:47:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763045238; x=1763650038;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=c/j8O4OMZ/iO6ANHgdWOttUeORFw+6paoVM6GB+aNhc=;
 b=Awg1KhAoDGVq0Ub51jXWh16SYZhHFYeZfGa25CIOtXgL/vIXl76f5Kac3DqEr24IOn
 cI1BW77XKUHO4BQrWf2JZ4AQifbHX2TZUR5iwTYb5YaSvo0OzT6u03l4IfjBFIalBYdn
 s2R/XlJvBtMZDVsAB4wFiZXky/2yMfMw/gtcBQDAPBdMCH9UCp3LsHaqq+WybscIT+j8
 3La1rgVOdC5ADONz70XgC15JneKe2eDP38KyGpyj94cNY3skusYdaZ9O7W1sTFTb6o2D
 3Z369YU7NnGVXxQUSQ2qGIlX3xJSKdUJxAUtPq3GvrpvE77SFviJVyD1yTDcOOXHrUlD
 JrRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763045238; x=1763650038;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=c/j8O4OMZ/iO6ANHgdWOttUeORFw+6paoVM6GB+aNhc=;
 b=lSKrw69e+wFxNu9Nv8wFkJiJRW/PVgFrtPN6WizGwNMbDgs7FaEr+ZEYKwPCVatjAN
 IELgeldjfMpqFNej26L+hkyG+JTyO8D+l4NPYVVLiKlLbOZYJJKkytpdicAzOY/Iu3jt
 VtyjW686/aedYC22UcnbcenMdxz/kNve1RmN1QefM3su+JGYpj7j9wr0ONPxm6VxKHVW
 eSdV7DzZkQx2GgoDgn661+PMqSMNQGGa6aYy8HLiyEBGRuTbgHqULRiWRDxzm1SEuY5H
 ZE0Agf3e95JTT842AUKlSee54r/xfDrLtZZqfBgSDGYuQxK5EzyDHKnAe7DeVo1hNj/p
 9Hvw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJ6g7IqngQsUyRkvuBp2DfBtyG/e+sEo8qsRDx2/C1hKaQN9o/c1s/tjd8lq4TGa2VqliX282nX637Vg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzYCvwj6X44TQgk1BD56KXiuGacbykR39dEnlUIUQZcwY4gqBLC
 UoBGFUB4pBAPcT2XwGa+/CyjlfxN4eiS+mkhDf2LRYjzbYV/Y4bgqJVnRuaYwpqFRUINdpsF43O
 ALfOBRZfXkYw/n/Q8ZrD6jlv/0au1ZDKY1kEdcXoZk33v7XX8tVVcDtcxMERcii5r1tyY1hlRLy
 BC0is+hxg=
X-Gm-Gg: ASbGncudG/imdKbNzlC0vidZDu/dsPv3QkZSLyGHD106JHieaR65cXrM/m2pNoy3BhE
 vwfkIDiDyaR6whM10QOsc/tdt3zug1ZWkKo3g4ucCd4JtfjNB96ezzYWtlBvY6nV1cRiHI5nej4
 zdUxx7m0wQ34mTyP7R8fic9/1+qrKQASBtxmzE/5HTLfOMRfhSR326iK6NAkCw/ny2mVBmdEHhu
 COvCr2UMAbj2pz1U/QjqaYYXaACCbm4JKMJBIRsw8zmRYyF+fVQTSNhJc3PtuF3XX2n33r5f51j
 cUYuAbs/6PEGfKiVtQ3Mk/KdrwjvTGFiC/Tps2Ko3O7xWmLevn6hQD/X5I/zlnnLzyjSn6Ubr0u
 5sdeQ08PRIlYTepuDC8cwZ7lHSivu2WHTMic7oV4rta1CLu5IfxuFpTOB
X-Received: by 2002:ac8:5f10:0:b0:4ed:7ca:5f33 with SMTP id
 d75a77b69052e-4eddbc9256dmr60354511cf.5.1763045238248; 
 Thu, 13 Nov 2025 06:47:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFM7YamsAo7x44iby6/PzuNKLIab4wveVf6S4JQ4cd4mg9yAzxbvu88BKH+RnT7m5FWyF+0JA==
X-Received: by 2002:ac8:5f10:0:b0:4ed:7ca:5f33 with SMTP id
 d75a77b69052e-4eddbc9256dmr60354251cf.5.1763045237576; 
 Thu, 13 Nov 2025 06:47:17 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fdaf6dasm176196266b.63.2025.11.13.06.47.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Nov 2025 06:47:17 -0800 (PST)
Message-ID: <45915f40-caa1-417b-95bb-deb7363a2ffc@oss.qualcomm.com>
Date: Thu, 13 Nov 2025 15:47:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bartosz Golaszewski <brgl@bgdev.pl>
References: <20251107-qcom-sa8255p-emac-v5-0-01d3e3aaf388@linaro.org>
 <20251107-qcom-sa8255p-emac-v5-2-01d3e3aaf388@linaro.org>
 <21a3d269-76e6-4da9-aa25-bfd1fb6dfb07@oss.qualcomm.com>
 <CAMRc=MexMn_GSC2EtMek5hDRLjGYA5HKM8ge9vrxw1pYDqPJgw@mail.gmail.com>
 <cd7c0490-a2d6-4885-aa36-ee1492f107b8@oss.qualcomm.com>
 <CAMRc=MeuByh=N_-F2+zPiqnh+Qp9u97kiMheLJ-xxcSZSy+_tw@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAMRc=MeuByh=N_-F2+zPiqnh+Qp9u97kiMheLJ-xxcSZSy+_tw@mail.gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDExNCBTYWx0ZWRfX+AhHDPXXjlpg
 GsoDDgsBjvK6G9KCYKdQJcAshKN42752PfaZ/1w0vQ2IEqHbjL/0pN1M560nxbMmXfWnIJTPGyd
 62N3/2nj2H5eN5y2EGRmGlPork6oApXLN8nBkZdWtr7E6VoblzI08pSdcfdHRDl7I8IK3EzIhx5
 lYeHPtyOYExmVV/1tOVDeSocuDJV9X1Slp4O856rO2Ek9nn02QWw4Mnn0z8pzIj535Fofr8uC/c
 zuniD3py8W5VCekxLgbQtqnUDt6/Zxr3lk5Pts5I19jC8Wwj6F2n5ER4NAAgpy3GczxBZ2o8PHu
 srve7HMZkX376b8GPiGp13w4Ot3KW2oQlaW2Lj61o3o99q1CpnU39YJ+gEwsDUJDtKqHPVbgnVO
 zoRVjOzaWVSWUYJJXbErz1Cknl+fHQ==
X-Authority-Analysis: v=2.4 cv=d4f4CBjE c=1 sm=1 tr=0 ts=6915ef77 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=IegXRtMujPCPvfbY5ZIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 6peblmX1EdBXoKBL52SimlzlhEL3E-pk
X-Proofpoint-GUID: 6peblmX1EdBXoKBL52SimlzlhEL3E-pk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_02,2025-11-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 phishscore=0 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511130114
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

T24gMTEvMTMvMjUgMjo0MSBQTSwgQmFydG9zeiBHb2xhc3pld3NraSB3cm90ZToKPiBPbiBUaHUs
IE5vdiAxMywgMjAyNSBhdCAyOjMz4oCvUE0gS29ucmFkIER5YmNpbwo+IDxrb25yYWQuZHliY2lv
QG9zcy5xdWFsY29tbS5jb20+IHdyb3RlOgo+Pgo+PiBPbiAxMS8xMy8yNSAyOjE4IFBNLCBCYXJ0
b3N6IEdvbGFzemV3c2tpIHdyb3RlOgo+Pj4gT24gRnJpLCBOb3YgNywgMjAyNSBhdCAxMTo0OeKA
r0FNIEtvbnJhZCBEeWJjaW8KPj4+IDxrb25yYWQuZHliY2lvQG9zcy5xdWFsY29tbS5jb20+IHdy
b3RlOgo+Pj4+Cj4+Pj4gT24gMTEvNy8yNSAxMToyOSBBTSwgQmFydG9zeiBHb2xhc3pld3NraSB3
cm90ZToKPj4+Pj4gRnJvbTogQmFydG9zeiBHb2xhc3pld3NraSA8YmFydG9zei5nb2xhc3pld3Nr
aUBsaW5hcm8ub3JnPgo+Pj4+Pgo+Pj4+PiBJbiBvcmRlciB0byBkcm9wIHRoZSBkZXBlbmRlbmN5
IG9uIENPTkZJR19PRiwgY29udmVydCBhbGwgZGV2aWNlIHByb3BlcnR5Cj4+Pj4+IGdldHRlcnMg
ZnJvbSBPRi1zcGVjaWZpYyB0byBnZW5lcmljIGRldmljZSBwcm9wZXJ0aWVzIGFuZCBzdG9wIHB1
bGxpbmcKPj4+Pj4gaW4gYW55IGxpbnV4L29mLmggc3ltYm9scy4KPj4+Pj4KPj4+Pj4gU2lnbmVk
LW9mZi1ieTogQmFydG9zeiBHb2xhc3pld3NraSA8YmFydG9zei5nb2xhc3pld3NraUBsaW5hcm8u
b3JnPgo+Pj4+PiAtLS0KPj4+Pgo+Pj4+IFsuLi5dCj4+Pj4KPj4+Pj4gLSAgICAgaWYgKG9mX3By
b3BlcnR5X3JlYWRfYm9vbChucCwgInNucHMsdHNvIikpCj4+Pj4+ICsgICAgIGlmIChkZXZpY2Vf
cHJvcGVydHlfcHJlc2VudChkZXYsICJzbnBzLHRzbyIpKQo+Pj4+Cj4+Pj4gVGhpcyBpcyBhIGNo
YW5nZSBpbiBiZWhhdmlvciAtICJzbnBzLHRzbyA9IDwwPiIgd291bGQgaGF2ZSBwcmV2aW91c2x5
Cj4+Pj4gcmV0dXJuZWQgZmFsc2UsIGl0IG5vdyByZXR1cm5zIHRydWUKPj4+Pgo+Pj4KPj4+IFRo
aXMgcHJvcGVydHkgaXMgYSBib29sZWFuIGZsYWcsIGl0IGNhbm5vdCBoYXZlIGEgdmFsdWUuCj4+
Cj4+IEV2ZXJ5IERUIHByb3BlcnR5IG1heSBoYXZlIGEgdmFsdWUsIHNvIHRoaXMgaXMgbm90IGFz
IG9idmlvdXMgYXMgd2UnZAo+PiBsaWtlIGl0IHRvIGJlIChJSVVDIC0gdW5sZXNzIHRoYXQgY2hh
bmdlZCByZWNlbnRseSkKPj4KPiAKPiBUaGF0J3MgbmV3IHRvIG1lLiBJIHRob3VnaHQgdGhhdCBp
ZiBhIHByb3BlcnR5IGlzIGEKPiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy9mbGFn
IHRoZW4gb25seSBpdHMgYm9vbGVhbiBmb3JtIGlzCj4gYWxsb3dlZC4gVGhlIGZhY3QgdGhhdCB0
aGUgZHRjIGNhbiBjb21waWxlIGl0IHdpdGggYSB2YWx1ZSBkb2Vzbid0Cj4gbWF0dGVyIGFzIHRo
ZSBiaW5kaW5ncyBhcmUgdGhlIGhpZ2hlciBhdXRob3JpdHkgZm9yIERUIHNvdXJjZXM/CgpZb3Un
cmUgcmlnaHQsIEkgbWlzcmVwcmVzZW50ZWQgdGhlIGlzc3VlLiByZWFkX2Jvb2woKSB3YXMgaGlz
dG9yaWNhbGx5CnVzZWQgZm9yIG1ha2luZyBzdXJlIGEgcHJvcGVydHkgaXMgcHJlc2VudCBhbmQg
dGhpcyB3YXMgYSBwcm9ibGVtCndoZW4gdGhlIHR5cGUgd2FzICE9IGZsYWcuCgpQbGVhc2UgZGlz
Y2FyZCBteSBjb21tZW50CgpLb25yYWQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
