Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EB720BA2FB7
	for <lists+linux-stm32@lfdr.de>; Fri, 26 Sep 2025 10:40:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 91695C3FACC;
	Fri, 26 Sep 2025 08:40:45 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6389BC3FAC9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Sep 2025 08:40:43 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58Q6porf025374
 for <linux-stm32@st-md-mailman.stormreply.com>; Fri, 26 Sep 2025 08:40:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 QJH3H/0kmdW6w7MgCtEBO34/S0w4O3IKZVUmNKMzmxs=; b=TW6ltXRzQyf5A7om
 E18NnxeB03KQyW2HIqMhNtSSpsj8daU4M3DoSJiF+CN8Ob3AOMMvzlM4mN2ls++K
 lrOthPpxhzyxOQbPvBVEBVA0rzWNe2lUaLCuItVXgdQ0/nGr/H9nWkPMR7rmrckJ
 rU+AvuwfmzVhlD/iI39A6TtD2ZIepde1jdDt74ujELry+hgSe/qOnh00kayYDXTb
 prbcPCRSvg8qYjZiAZdnt/stB8QpyxDTHB45bEICq106dailIXO/si7EGsO0SwQa
 r2r70ePAFVD08PQVJW7G6ZCaDH5QvaSakNtEFVKtydxUDFyql70//cVqyXW0NM13
 8PL0pw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0u24g7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Sep 2025 08:40:42 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-277f0ea6fbaso22947625ad.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Sep 2025 01:40:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758876041; x=1759480841;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QJH3H/0kmdW6w7MgCtEBO34/S0w4O3IKZVUmNKMzmxs=;
 b=ipCzr+VVW72QAjhyx8jbfCCXezibRF2DMdaiZTFvgbVkVz/+33eAefT5z0SBZHctlA
 ACxB99hBYRVzSepueDgqv7+NUuiV7n9abYLF7Z7m7dKfi3tOS06jeNmZ2wXhKyGw+KoX
 oha8t5p/eYN2Bu3ppsHiJMagBZhgjK0krovd05n/rKKRBWT3quBymjiLjxZK6v3e8t3M
 SHOk/tQzdDcaXp0I7KK6Bd2N/hkqzUAMSz+rKKhVeIImkUq24IWX1V1UmuWBRKdrcu6U
 KGH0YG6SC8cIm5DjzEBK2+ViKQ6wyTvdqlNbPLvyzGaKVjFVYfjmfII9wj3NhPQUeRDv
 wGtA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXqEmqw6aj0RYzcpdC797pOGYUIFcmj6KWe5IhaFR30rxQC6G7qIMlQYceVuTQ3V8a4181j7t6phdMLGQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzzrCnLn5UPTgfXDXEn4mZ3ASIE7pB89Mc8/npJ3/FcUOAFgTPW
 uu1I77UqwWPcJUOyhr9gGbbRdVAy+NDkbeVyiXm6UkvRn2zfM8KYdBRaoA4hW975bQJcXDMFyR+
 RlVzmLH7Vt4VTTk0jdIvxvFllW7K7tg64Gm4IQcEHNBuy4mgD/4a+nPyJ70F4u76AaNNzML1rBD
 FbTkFfmok=
X-Gm-Gg: ASbGncv9pKMCYyJ866JY9M60leT4TgRNPk1NwFBJZX8L16kKriQ+g3/dcloCG7oPJ7w
 hnq7JfkZvTyZfvZzwJ0etRMFwEF5xxWcEBMrYLJ8vDFqRWNCoV5PAP9d2Qznstwmz9lu7yfOnbu
 gK7KgxxHtj+J2YXNbaDYg+T2El/8RQrJgArCLQTC4z6n1pKo/1xztWml9KmCU+A3j6kExWOVKOA
 +rqJviYjEzwS2k75dXHj1atg6CllH2MkRi9iHBRjtxGNx9U04Zg6tDENBNKc8VHKRwJySi2z/Oj
 cguZJ0sh2eMlL+CtrjBzqnjK/Frr+XFuvS/5GI7LVQ6hEZzc2y3UKNb0HP4x4X2DCnHd
X-Received: by 2002:a17:902:e787:b0:266:e8c3:4731 with SMTP id
 d9443c01a7336-27ed4a4e69fmr57199555ad.23.1758876040425; 
 Fri, 26 Sep 2025 01:40:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGSYjbgxz3ZpRa0D00ZVNPgHg9O0ctAAj1epWv0U96tMdUGtuWmJ8IJY2bgSO3VYP/MfK11Rw==
X-Received: by 2002:a17:902:e787:b0:266:e8c3:4731 with SMTP id
 d9443c01a7336-27ed4a4e69fmr57199205ad.23.1758876039860; 
 Fri, 26 Sep 2025 01:40:39 -0700 (PDT)
Received: from [10.217.216.188] ([202.46.22.19])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-27ed6733a63sm47601845ad.64.2025.09.26.01.40.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Sep 2025 01:40:39 -0700 (PDT)
Message-ID: <d55b42b6-1b2b-4a52-8eaf-78c4ed78958c@oss.qualcomm.com>
Date: Fri, 26 Sep 2025 14:10:31 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Jagadeesh Kona <quic_jkona@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Konrad Dybcio <konradybcio@kernel.org>
References: <20250924-knp-mmclk-v1-0-d7ea96b4784a@oss.qualcomm.com>
 <20250924-knp-mmclk-v1-7-d7ea96b4784a@oss.qualcomm.com>
 <d18c5196-dd8e-47d6-87bd-de0ac94fbf3b@linaro.org>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <d18c5196-dd8e-47d6-87bd-de0ac94fbf3b@linaro.org>
X-Proofpoint-ORIG-GUID: 1htWa_YUaPN1kA-UTyC0MmqAoXqKK7KR
X-Proofpoint-GUID: 1htWa_YUaPN1kA-UTyC0MmqAoXqKK7KR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX+Kw0aDoibUgU
 37sEMtiaEsDNqWG7ftSEeKSRNXbzXn2kTBUSW4NKQeGg23DzZamW8k2OGQ2Ymi6xe+SQgjvFthf
 YCzbNiWZK+N71nSxBB8wJz/P8xEUXg5xfS4GO0NiaE6TwYEDl6AnclLDMaStBoLOZqQOSGjS/4e
 uM96h15Fs4WUUibJuuwH2Ft6qn7angMJITrmszb5KzDjCi+I9N43VnM+UnKu3XmNaVPrvilv32p
 7NKOR2BeHoOB+RyWvuDhCSiFpU2SeHeN0Xrx+vblCIA6M7R4ZMV6TKf+o2Xh1bVP1By/JNc/g45
 WyqkP9riCs0fYL9p4r2Zl/MqpRUzK1iO2Tiz8FpCg3xGpladS5c+eR24iYcpfYwZuxzmg4Ah9x9
 ilPVho6m24G3Ys5wa0mwmaGfMDMGbg==
X-Authority-Analysis: v=2.4 cv=ZsHg6t7G c=1 sm=1 tr=0 ts=68d6518a cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=txcd_wJ1IAhHlW4x_IwA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_02,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171
Cc: devicetree@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 tingwei.zhang@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 trilok.soni@oss.qualcomm.com
Subject: Re: [Linux-stm32] [PATCH 7/9] clk: qcom: camcc: Add support for
 camera clock controller for Kaanapali
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

CgpPbiA5LzI1LzIwMjUgMjo0MCBQTSwgQnJ5YW4gTydEb25vZ2h1ZSB3cm90ZToKPiBPbiAyNS8w
OS8yMDI1IDAwOjU2LCBKaW5neWkgV2FuZyB3cm90ZToKPj4gK3N0YXRpYyB1MzIgY2FtX2NjX2th
YW5hcGFsaV9jcml0aWNhbF9jYmNyc1tdID0gewo+PiArwqDCoMKgIDB4MjEzOTgsIC8qIENBTV9D
Q19EUlZfQUhCX0NMSyAqLwo+PiArwqDCoMKgIDB4MjEzOTAsIC8qIENBTV9DQ19EUlZfWE9fQ0xL
ICovCj4+ICvCoMKgwqAgMHgyMTM2NCwgLyogQ0FNX0NDX0dEU0NfQ0xLICovCj4+ICvCoMKgwqAg
MHgyMTM2OCwgLyogQ0FNX0NDX1NMRUVQX0NMSyAqLwo+PiArfTsKPiAKPiBIb3cgaXMgdGhpcyBj
cml0aWNhbCBsaXN0IGRlY2lkZWQgPwo+IAoKQnJ5YW4sIHRoZXNlIGFyZSBsaXN0IGJhc2VkIG9u
IGRlc2lnbiByZWNvbW1lbmRhdGlvbnMuCgo+IEZvciBleGFtcGxlIHdoeSBpcyB0aGUgQUhCIGNs
b2NrIGNyaXRpY2FsIGJ1dCB0aGUgQ0FNTk9DIGFuZCBBWEkgY2xvY2tzCj4gbm90IGNyaXRpY2Fs
ID8KPiAKCkFIQiBjbG9jayBpcyByZXF1aXJlZCBmb3IgYWNjZXNzIGFuZCBOT0MgJiBBWEkgbmVl
ZHMgdG8gYmUgbWFuYWdlZCBieQp0aGUgY2xpZW50IFNXIGRyaXZlci4KCj4gLS0tCj4gYm9kCgot
LSAKVGhhbmtzLApUYW5peWEgRGFzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
