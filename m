Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C1BB9E246
	for <lists+linux-stm32@lfdr.de>; Thu, 25 Sep 2025 10:55:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D6AF6C3F94D;
	Thu, 25 Sep 2025 08:55:08 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BD478C36B2D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Sep 2025 08:44:13 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P0M9Ot017424
 for <linux-stm32@st-md-mailman.stormreply.com>; Thu, 25 Sep 2025 08:44:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 dBT7rTwERo8BHIfakro0N3iM5Q9lW3mzacSjwxIquI8=; b=j6pEScOBZmPw3Rxn
 FdJp3S6HavZlYMK9KkSaGAAgDXJrHL9ucgZw5atdyBSCGtsPElGKT/B+IaJfZEvy
 t0S7L/GjBW+MhJBcDSr27Kr9h9AtfZzRks/Jc4uJg29As3uHgHgZBKszqFCBh2hO
 HdXHYTM6ZlJvuGq4g+GSqnhaPTtyIInJCRexcZm8hI/u7aqDqo7Ho714TSvWDyC/
 GFJ7Fx+54g5vlEJONe+K36IHU9FL11MAf0d6EMELCU/Eum4DsIQhAWMfGn7MLMzl
 3gsDU8/hggDZa/6oeXVu6H3WlQmPlAUem22OCLGxr4DRyF1269b23UgcToAIsMBt
 H9G9NA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bhvk0rku-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Sep 2025 08:44:11 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-24458345f5dso10406775ad.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Sep 2025 01:44:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758789851; x=1759394651;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dBT7rTwERo8BHIfakro0N3iM5Q9lW3mzacSjwxIquI8=;
 b=gzkCakyJymVqX0zvLnrvRBuJjpeJFH1AiJ+Njk7D+Rlj45QhxodqRp3P96phr4M86u
 DaSQCdJp4DceH8Lp+CLvrr8k43R79vrGN4/O0eB+y4bC3Z7/PNXTrLsCqTvhw+Z9B4Ns
 2qrukRRJQ2ms1XcY94haHXMRUnZU1Lv9ehbma8H/DH+5KDEfMJGPX+LHbWj52wtc/K82
 zfBK8SN0Tk+kR+TrU5w2o814rh/FADg3/YoYLAjwSmAVmwA/NPm7T1T+W4rHrnKozMsR
 RB3o40bIYRw5Xwr52QZ2BDtlSIworT4f0oPI4D34yNqftMC/edD7lKeT4tC4Ocux+7O7
 I2VA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6onlYw1Akbxy+wVEa5ro9y5nX67f8wyRnv+IcaWLvIBIktLRCOsiD99h+PjiH/7S3OHfGRXBCEOGs5Q==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yz14qaC6CrKY48+lj8CAt8EFybSRf4E9RzM6OqbMFXZCyYBTM5M
 gI6XpIW7G2AeNg/oghXlrwFoCCS7QaEkk9MbhEDrUODBCSO4oD7K2+CcB/UW/jno921LC1kfykh
 P0J+T5NYq0F55ynz85V4iUIHwKTi6ArJvZ+4hay4A4VmnyHgdC6dqzCpDCKwsmL1BMyO8AALyl5
 dZqQRBeLw=
X-Gm-Gg: ASbGnct11IqLlTr6jele45aAwgJwConG2Qgy02ABy963pzvt+y9wXoIWfHQ+wmMLKgE
 NPvUbr7uaxkB8EX88hyRNFSaxHlBEtJ3wAvUxXIOiHYhppsVH6SjSA4vLNFIq9nW3oybj/9fZyM
 ofr1lwCo0kMnpmCKOcntor8k5ftgEUzOVs/d8VyjvZL9HP0B7Ke7cOqHMXYP7OQbxjdxhGQFhfo
 0vt9Fdllam39bSEmhYFEYmUw/p58jyttivNYt4fv4PQiHZsHNMUmbUjsWM4jBlqaGxM2lLBEbmp
 tgs6M3lUH3MeQRs7QxH+Qy1X1ztPjpv+VhGwNJtavqaSYRmyEzGnoq0FZPCPktaf+as=
X-Received: by 2002:a17:902:cecb:b0:269:8d85:2249 with SMTP id
 d9443c01a7336-27ed4a0b73fmr29763515ad.22.1758789850928; 
 Thu, 25 Sep 2025 01:44:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEteYAh52n1ZK6YfsOt/78cpYQ1O0vITDWQG8F1u35YkHePDlHA6DTWb9y/kavs8tH2Xnef9g==
X-Received: by 2002:a17:902:cecb:b0:269:8d85:2249 with SMTP id
 d9443c01a7336-27ed4a0b73fmr29762945ad.22.1758789850210; 
 Thu, 25 Sep 2025 01:44:10 -0700 (PDT)
Received: from [10.217.216.93] ([202.46.22.19])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b57c53db8d2sm1528142a12.24.2025.09.25.01.44.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Sep 2025 01:44:09 -0700 (PDT)
Message-ID: <1c90a127-4b39-4cad-9805-d4449990baa7@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 14:14:01 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bryan O'Donoghue <bod@kernel.org>,
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
 <20250924-knp-mmclk-v1-2-d7ea96b4784a@oss.qualcomm.com>
 <a8ebec72-eee2-4a02-ac6b-57678aa7c50f@kernel.org>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <a8ebec72-eee2-4a02-ac6b-57678aa7c50f@kernel.org>
X-Proofpoint-ORIG-GUID: Wk-Yiao9rHDABRS-sciaRpsH7OzIoPvf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDAxMSBTYWx0ZWRfX7M0i6v30C7Tw
 Kw2zrNgvyDR66plenDSaDfQ4pILaETLeMTQcfTSF/AhXf6IxPgwg1rY824KAOIi6hebNLDfYSNj
 19E9J8i1YQQhcSj0UrCJPEIjX2IRnX1jUi/Hc1hh3lhMVHQ807vyC9G6VHzta92hIRamxKWktab
 bLLnOA1/UIKpbQOx3XVL2ldhm2RqTIfo6bUBw6Kn5r9THH205TmwJyQ5pzaKE8n3QSD4mNhtGme
 pXac1xQjFH9gTjmCy5xhtT3mn2JZ2ipHeFKiKaEVTp0sWfGgFjvlNPb2KCtVLCSkBsFpTIzsFsx
 C1vXFnClJJUTDnHtMqd9R2QbFzCZXn94aGOCYG7CkY9nL9DHWl84mCYaXOWUcKx7pOOO6a3vDxK
 N8WXw/FP
X-Proofpoint-GUID: Wk-Yiao9rHDABRS-sciaRpsH7OzIoPvf
X-Authority-Analysis: v=2.4 cv=Csq/cm4D c=1 sm=1 tr=0 ts=68d500db cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=-DM4tyH-3wswODK-JwcA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0 phishscore=0
 clxscore=1011 spamscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509230011
X-Mailman-Approved-At: Thu, 25 Sep 2025 08:55:07 +0000
Cc: devicetree@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 tingwei.zhang@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 trilok.soni@oss.qualcomm.com
Subject: Re: [Linux-stm32] [PATCH 2/9] dt-bindings: clock: sm8450-camcc:
 Remove sc8280xp camcc to from sm8450 camcc
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

CgpPbiA5LzI1LzIwMjUgMTo1OSBQTSwgQnJ5YW4gTydEb25vZ2h1ZSB3cm90ZToKPiBPbiAyNS8w
OS8yMDI1IDAwOjU2LCBKaW5neWkgV2FuZyB3cm90ZToKPj4gRnJvbTogVGFuaXlhIERhcyA8dGFu
aXlhLmRhc0Bvc3MucXVhbGNvbW0uY29tPgo+Pgo+PiBTQzgyODBYUCBjYW1jYyBvbmx5IHJlcXVp
cmVzIHRoZSBNTUNYIHBvd2VyIGRvbWFpbiwgdW5saWtlIFNNODQ1MCBjYW1jYwo+PiB3aGljaCBu
b3cgc3VwcG9ydHMgYm90aCBNTUNYIGFuZCBNWEMgcG93ZXIgZG9tYWlucy4gSGVuY2UgbW92ZSBT
QzgyODBYUAo+PiBjYW1jYyBmcm9tIFNNODQ1MC4KPj4KPj4gRml4ZXM6IDg0MmZhNzQ4MjkxNSAo
ImR0LWJpbmRpbmdzOiBjbG9jazogcWNvbSxzbTg0NTAtY2FtY2M6IE1vdmUKPj4gc2M4MjgweHAg
Y2FtY2MgdG8gc2E4Nzc1cCBjYW1jYyIpCj4+IFNpZ25lZC1vZmYtYnk6IFRhbml5YSBEYXMgPHRh
bml5YS5kYXNAb3NzLnF1YWxjb21tLmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogSmluZ3lpIFdhbmcg
PGppbmd5aS53YW5nQG9zcy5xdWFsY29tbS5jb20+Cj4+IC0tLQo+PiDCoCBEb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvY2xvY2svcWNvbSxzbTg0NTAtY2FtY2MueWFtbCB8IDEgLQo+
PiDCoCAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Nsb2NrL3Fjb20sc204NDUwLQo+PiBjYW1j
Yy55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Nsb2NrL3Fjb20sc204
NDUwLQo+PiBjYW1jYy55YW1sCj4+IGluZGV4IGMxZTA2ZjM5NDMxZS4uZGJmY2MzOTlmMTBiIDEw
MDY0NAo+PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvY2xvY2svcWNv
bSxzbTg0NTAtY2FtY2MueWFtbAo+PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvY2xvY2svcWNvbSxzbTg0NTAtY2FtY2MueWFtbAo+PiBAQCAtNjMsNyArNjMsNiBAQCBh
bGxPZjoKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGNvbXBhdGlibGU6Cj4+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgY29udGFpbnM6Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGVudW06Cj4+
IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtIHFjb20sc2M4MjgweHAtY2FtY2MKPj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0gcWNvbSxzbTg0NTAtY2FtY2MKPj4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0gcWNvbSxzbTg1NTAtY2FtY2MKPj4gwqDCoMKgwqDC
oCB0aGVuOgo+Pgo+IAo+IFRoaXMgaXMgbm90IGEgcmV2ZXJ0Lgo+IAo+IFdoZXJlIGRvZXMgdGhl
IGNvbXBhdCBzdHJpbmcgZ28gPwo+IAoKVGhlIGNvbXBhdCBpcyBub3cgcGFydCBvZgpEb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvY2xvY2svcWNvbSxzYTg3NzVwLWNhbWNjLnlhbWwg
YXMgcGFydApvZiB0aGlzIGNvbW1pdCAiODQyZmE3NDgyOTE1Ii4KCj4gWW91IGFyZSBtaXNzaW5n
IHRoZSBwYXJ0IHdoZXJlIHlvdSBtb3ZlIHRoZSBjb21wYXQgc3RyaW5nIHRvIHdoZXJlIHlvdQo+
IHRoaW5rIGl0IHNob3VsZCBiZS4uLgo+IAoKSXQgd2FzIGFscmVhZHkgbW92ZWQgYXMgbWVudGlv
bmVkIGFib3ZlLgoKPiBBbHNvIHdoeSBpcyB0aGlzIHBhdGNoIGFwcGVhcmluZyBpbiBhIHNlcmll
cyBhYm91dCBfYWRkaW5nXyBLYW5hYXBhbGkgdG8KPiBDQU1DQyA/Cj4gCgpUaGlzIHdhcyB0byBy
ZWR1Y2UgbGVzcyBkZXBlbmRlbmN5IG9uIHRoZSBzZXJpZXMuCgo+IE5BSwo+IAo+IC0tLQo+IGJv
ZAo+IAoKLS0gClRoYW5rcywKVGFuaXlhIERhcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMy
QHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
