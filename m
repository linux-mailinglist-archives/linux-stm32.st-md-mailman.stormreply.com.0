Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 61DA1B14870
	for <lists+linux-stm32@lfdr.de>; Tue, 29 Jul 2025 08:48:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0F31BC32E8E;
	Tue, 29 Jul 2025 06:48:55 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 22583C30883
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Jul 2025 02:28:09 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56E0KXda027322
 for <linux-stm32@st-md-mailman.stormreply.com>; Mon, 14 Jul 2025 02:28:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 F8OpwaFzraWMloUlXGdAgiuapqHg/Vvr2jLfpvwdlYE=; b=Wz6YCxqkz1Ookwwo
 mwfv8M+KivyoXwwzHCHRR4PEuzJM4R/fuR1WjLum6Q7rwbARYOUeUHzA0x1wXleU
 JNESETe6FMEKAR3SoaAkf2lqHQ1FNQCUihgy2BaZ+zIsg1SoAnVqdcicUzbOZxiS
 zkCa5FP0Lrgz47fDh8KtRMuiu9AOHX1Go8/8QblPasIMYtcJob88q8z2sxlXyIyj
 BjTMhCaW+sD5E94aLdjRFdhuYh4Z+Gij4OLulq+Km+L/R8uy6PoDHdFBkRnAkBfQ
 DuwwyVrUxLriYtggCs1m1uk/lIru/aV26n0nIDIrSo+4M1SZiMTNF6smTYZ0q4G3
 QzjWNA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufvbaxke-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Jul 2025 02:28:08 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-b115fb801bcso4209176a12.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 13 Jul 2025 19:28:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752460087; x=1753064887;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=F8OpwaFzraWMloUlXGdAgiuapqHg/Vvr2jLfpvwdlYE=;
 b=mz6sjRUeWhjJTQ38yFw+M4LrQk4I9hpw3kJqCHbV1iGUnGfeC6DkzraeFEF/m7O8Yt
 6ymyx1ODIp2/v7edMY2XrcTDZjLbi9pAQxbA6yum1Q++ZtwAWMrGM5KG2LY+iHBnjuKW
 RtGs8XueX3jMNiqSVpv90bunsUjqcK4v93nslUEIdvCRfC+X99PH9dgAoLxc/owQygHe
 leAraUYOFRdZwtvdNL6uNhPdu5wo7lMhWMHrV7XXLWbLyKaqufK0hkV8PLoKpaB2w3GN
 8VVSwaIU8JzMgJF2g+QHClN0NB7i2xMHnGMKLUcHB4BgK9rToU2+MQ+FBF8l/SyC3s1s
 ThmA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWrElK+1ZIfTN7+EV6/3ytyBvNgsNWVQwrofrAxeD/TcfNWJqns2r3Xdq5Xub3Q05YEtMxE43Z81bVUMg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyCJSsEa1ZzywF849Qjk/ItxirmUdOaBdurvFKu5cEDdH8H9n1F
 e/iSDE9tZO2loDfCDCze7VMH9qo4WrBaQc6mPKcY//7IGy9krcNlPYyodPFoU9x5TYimHs8l3GN
 EvqWvA6X6kdOAwL/wy+45IXXbzx7LZ2GmBjwW4w2q9DlNZItKcjOyCc/sSZHIZfuw7/V8UFaflP
 GDVr6oGwE=
X-Gm-Gg: ASbGncvrnsWlrxil+6K141uVn1USMHbiziCO64f4jB4E5HOdDd7oo4L8hYjWP9iypYP
 ttq1K4cP4t01gvj4q1M6lNGGwv1A7ZYOLQQVkvIz3+7zEV36Ibgujgyjam9aWSuxynTM8vSWh+C
 mBWtVeQWg+9nFmN7iUkBa9YVVcFwygNT7WULekqDsqYsw29Eg8Uz0+mUtmBHA2AGwCyMtGcsaQh
 nXcm3BSriTm6B0S15Tx6sVX1HuC8L0F1n2HnLAHqyrc8fvCH8GACpEm5Yh+PFXGZtX2pLUkFF6t
 HPrf5dGijUaYyCdXr0k4023usfzRCt6kJ/XZ5ntP4uJH9C5uj6NB2b8NHIln3MzyVXZIl69b6g4
 ccASb+VQDlrcnSxPak+wvIdvPUPNv
X-Received: by 2002:a05:6a20:7491:b0:21f:7430:148a with SMTP id
 adf61e73a8af0-231201fa1f9mr17819869637.28.1752460087285; 
 Sun, 13 Jul 2025 19:28:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IERlTzQAbGBtic0xw9HUW209GmM3H8UeFAoNwCUVrD0zAm95+xPpoXxs/SybzhJTxECUBR7vQ==
X-Received: by 2002:a05:6a20:7491:b0:21f:7430:148a with SMTP id
 adf61e73a8af0-231201fa1f9mr17819826637.28.1752460086833; 
 Sun, 13 Jul 2025 19:28:06 -0700 (PDT)
Received: from [10.133.33.227] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74eb9dd598csm10053918b3a.17.2025.07.13.19.28.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Jul 2025 19:28:06 -0700 (PDT)
Message-ID: <465b60e7-fe68-407c-add4-856178f4cb7c@oss.qualcomm.com>
Date: Mon, 14 Jul 2025 10:28:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yijie Yang <quic_yijiyang@quicinc.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Richard Cochran <richardcochran@gmail.com>
References: <20250121-dts_qcs615-v3-0-fa4496950d8a@quicinc.com>
Content-Language: en-US
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
In-Reply-To: <20250121-dts_qcs615-v3-0-fa4496950d8a@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDAxMSBTYWx0ZWRfXweh3Nf3zyqTh
 PKl8arkfojl9+6n4ayVt88JB60akuH7t6oV1NGaVDWr7IT+ERU21dl8Qx2TX49MBunjVyjH9Qd/
 rUeg0cF/HgweweYx6+tzQ/NEpCA862SLEofaRU1PB0aV7oAGv+yNu4hvDJ68A7elAK7XZ8MDWm3
 zbFvg+e4dVkQXgsv5X8A6BUuSX+x4b+JPBR4E/QG+N5JjnTiMkOsURT2Kq5Xmk3qUUtAD5X4t0f
 N/mu9Xni6eNKd/5Bp4Ga0CU7lbYjmxiA4btUz9rftPewq0oNXftMRlPabvNeqV2iNxOj/InQOkk
 eUVzxz3avR/EMZKnewrA/qWWoOQo6/JSFGm90HfiNI/JaLU7wL/ceC06RM1PqtyplUJYEIe+wFt
 Q9e2AP6YK9g0aVL/IyY98V0VDvjHfVc3AK0iwnVqDsxth9Vff2imtuMQ8C5cfwReDqNayyRy
X-Proofpoint-GUID: sfhw7yX8n7Fmy38iul01StmZUu1H2fxP
X-Authority-Analysis: v=2.4 cv=RPSzH5i+ c=1 sm=1 tr=0 ts=68746b38 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=mTSKI_wBhsZyk7PTtHgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: sfhw7yX8n7Fmy38iul01StmZUu1H2fxP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_01,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=999 spamscore=0
 clxscore=1011 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507140011
X-Mailman-Approved-At: Tue, 29 Jul 2025 06:48:52 +0000
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 0/4] Enable ethernet on qcs615
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

CgpPbiAyMDI1LTAxLTIxIDE1OjU0LCBZaWppZSBZYW5nIHdyb3RlOgo+IENvcnJlY3QgdGhlIGRl
ZmluaXRpb24gYW5kIHVzYWdlIG9mIHBoeS1tb2RlIGluIGJvdGggdGhlIERUIGJpbmRpbmcgYW5k
Cj4gZHJpdmVyIGNvZGUuCj4gQWRkIGR0cyBub2RlcyBhbmQgRU1BQyBkcml2ZXIgZGF0YSB0byBl
bmFibGUgZXRoZXJuZXQgaW50ZXJmYWNlIG9uCj4gcWNzNjE1LXJpZGUgcGxhdGZvcm0uCj4gVGhl
IEVNQUMgdmVyc2lvbiBjdXJyZW50bHkgaW4gdXNlIG9uIHRoaXMgcGxhdGZvcm0gaXMgdGhlIHNh
bWUgYXMgdGhhdCBpbgo+IHFjczQwNC4gVGhlIEVQSFkgbW9kZWwgaXMgTWljcmVsIEtTWjkwMzEu
Cj4gCj4gU2lnbmVkLW9mZi1ieTogWWlqaWUgWWFuZyA8cXVpY195aWppeWFuZ0BxdWljaW5jLmNv
bT4KPiAtLS0KPiBDaGFuZ2VzIGluIHYzOgo+IC0gQ29ycmVjdCB0aGUgZGVmaW5pdGlvbiBvZiAn
cmdtaWknIGluIGV0aGVybmV0LWNvbnRyb2xsZXIueWFtbC4KPiAtIFJlbW92ZSB0aGUgcmVkdW5k
YW50IG1heC1zcGVlZCBsaW1pdCBpbiB0aGUgZHRzIGZpbGUuCj4gLSBVcGRhdGUgdGhlIGRlZmlu
aXRpb24gb2YgJ3JnbWlpJyB0byBwcmV2ZW50IGFueSBmdXJ0aGVyIG1pc3VuZGVyc3RhbmRpbmdz
Lgo+IC0gVXBkYXRlIHRoZSBwaHktbW9kZSBpbiB0aGUgZHRzIGZpbGUgZnJvbSByZ21paSB0byBy
Z21paS1pZC4KPiAtIE1hc2sgdGhlIFBIWSBtb2RlIHBhc3NlZCB0byB0aGUgZHJpdmVyIHRvIGFs
bG93IHRoZSBNQUMgdG8gYWRkIHRoZSBkZWxheS4KPiAtIFVwZGF0ZSB0aGUgbG93IHBvd2VyIG1v
ZGUgZXhpdCBpbnRlcnJ1cHQgZnJvbSA2NjIgdG8gNjYxLgo+IC0gVXBkYXRlIHRoZSBjb21wYXRp
YmxlIHN0cmluZyB0byBmYWxsYmFjayB0byBxY3M0MDQgc2luY2UgdGhleSBzaGFyZSB0aGUgc2Ft
ZSBoYXJkd2FyZS4KPiAtIFVwZGF0ZSBiYXNlIGNvbW1pdCB0byBuZXh0LTIwMjUwMTIwLgo+IC0g
TGluayB0byB2MjogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI0MTExOC1kdHNfcWNzNjE1
LXYyLTAtZTYyYjkyNGEzY2JkQHF1aWNpbmMuY29tCj4gCj4gLS0tCj4gWWlqaWUgWWFuZyAoNCk6
Cj4gICAgICAgIGR0LWJpbmRpbmdzOiBuZXQ6IGV0aGVybmV0LWNvbnRyb2xsZXI6IENvcnJlY3Qg
dGhlIGRlZmluaXRpb24gb2YgcGh5LW1vZGUKPiAgICAgICAgbmV0OiBzdG1tYWM6IGR3bWFjLXFj
b20tZXRocW9zOiBNYXNrIFBIWSBtb2RlIGlmIGNvbmZpZ3VyZWQgd2l0aCByZ21paS1pZAo+ICAg
ICAgICBhcm02NDogZHRzOiBxY29tOiBxY3M2MTU6IGFkZCBldGhlcm5ldCBub2RlCj4gICAgICAg
IGFybTY0OiBkdHM6IHFjb206IHFjczYxNS1yaWRlOiBFbmFibGUgZXRoZXJuZXQgbm9kZQo+IAo+
ICAgLi4uL2JpbmRpbmdzL25ldC9ldGhlcm5ldC1jb250cm9sbGVyLnlhbWwgICAgICAgICAgfCAg
IDIgKy0KPiAgIGFyY2gvYXJtNjQvYm9vdC9kdHMvcWNvbS9xY3M2MTUtcmlkZS5kdHMgICAgICAg
ICAgIHwgMTA0ICsrKysrKysrKysrKysrKysrKysrKwo+ICAgYXJjaC9hcm02NC9ib290L2R0cy9x
Y29tL3FjczYxNS5kdHNpICAgICAgICAgICAgICAgfCAgMzQgKysrKysrKwo+ICAgLi4uL2V0aGVy
bmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLXFjb20tZXRocW9zLmMgICAgfCAgMTggKysrLQo+ICAg
NCBmaWxlcyBjaGFuZ2VkLCAxNTIgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKPiAtLS0K
PiBiYXNlLWNvbW1pdDogOTQyNGQ5YWNhZGE2NDYxMzQ0YzcxYWMwMmYyZjNmYmNkZDc3NTQ5OAo+
IGNoYW5nZS1pZDogMjAyNDEyMjQtZHRzX3FjczYxNS05NjEyZWZlYTAyY2IKPiBwcmVyZXF1aXNp
dGUtbWVzc2FnZS1pZDogPDIwMjUwMTIwLXNjaGVtYV9xY3M2MTUtdjQtMS1kOWQxMjJmODllNjRA
cXVpY2luYy5jb20+Cj4gcHJlcmVxdWlzaXRlLXBhdGNoLWlkOiBiOTdmMzYxMTZjODcwMzZhYmU2
NmUwNjFkYjgyNTg4ZWIxYmJhYTlhCj4gCj4gQmVzdCByZWdhcmRzLAoKClNpbmNlIG15IGxhc3Qg
c3VibWlzc2lvbiwgSeKAmXZlIGJlZW4gd29ya2luZyBvbiBhbiB1cGRhdGVkIHZlcnNpb24gb2Yg
dGhlIApwYXRjaCB0aGF0IGluY29ycG9yYXRlcyB0aGUgZmVlZGJhY2sgcmVjZWl2ZWQgYW5kIGlt
cHJvdmVzIHRoZSBvdmVyYWxsIAppbXBsZW1lbnRhdGlvbi4gSSBwbGFuIHRvIHN1Ym1pdCB0aGUg
cmV2aXNlZCB2ZXJzaW9uIHNob3J0bHkuCgpQbGVhc2UgbGV0IG1lIGtub3cgaWYgdGhlcmUgYXJl
IGFueSBhZGRpdGlvbmFsIGNvbmNlcm5zIG9yIGNoYW5nZXMgaW4gCmRpcmVjdGlvbiBJIHNob3Vs
ZCBiZSBhd2FyZSBvZi4gSeKAmWQgcmVhbGx5IGFwcHJlY2lhdGUgYW55IGd1aWRhbmNlIHRvIApl
bnN1cmUgdGhlIHBhdGNoIGFsaWducyB3ZWxsIHdpdGggdGhlIGN1cnJlbnQgZ29hbHMgb2YgdGhl
IHN1YnN5c3RlbS4KCgotLSAKQmVzdCBSZWdhcmRzLApZaWppZQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0Ckxp
bnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
