Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B09B52D47
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Sep 2025 11:30:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2F5F9C349C1;
	Thu, 11 Sep 2025 09:30:12 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0DC52C36B14
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Sep 2025 09:30:10 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58B2Ik8X031070
 for <linux-stm32@st-md-mailman.stormreply.com>; Thu, 11 Sep 2025 09:30:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 4zEnPzFVE8t3bC1R9rCg0zuwA6Ldkx+mgUvoY3rTxV0=; b=BN8DNZeu+8SuM/Zt
 ubyblklFV4TBsBtcvSlCa3YYL/fKjTtbAxMGIY5EGTx98snDFeQEvNV1uv+fr6U6
 pE7DVv6JRC2n/LgbwTInJ+92NMjiuXmneW+76eFUXw9ogHh4ZxtJ5HK8x4mps8bh
 z/Eq8BX0gkk/M9GHq/c7nuswTXXPKJLyREDUlChhXfgfDzEwz66IP6M5Odndo1n4
 IUws9MYf/twsG1VPSMRdjczq2R0TijdGzDMTsS0L+ni+YF/8JI6riJ5Xc2mj4QIn
 fvotVWT3gBJJ9nI96oy7ujVnaRFK5z+zValRjkgZmEccmDDM3+jWm62mUOfjSP49
 XoKbKA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490dqg6v8h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Sep 2025 09:30:09 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8019bd7af43so18956785a.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Sep 2025 02:30:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757583008; x=1758187808;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4zEnPzFVE8t3bC1R9rCg0zuwA6Ldkx+mgUvoY3rTxV0=;
 b=PnlBNJjpc7HtWu9XsXMS6N9el+ad1HKKx/uRyB0JtleQfWUtclLdgNcBLgKmdD67LB
 kTQ8N2sPnt8wi3pqaaya7p0GsGoKgwFu80De1SR88+joD5hPxwGbZ1zGeB+UMp/sxV5U
 /cBGFNTFtVIHPA4PxrZqkMsKzUbkRfEoVZ97ejv/mR4CO0ySFUtAIuV00RylUhgVVXrS
 6pFx+P3BEhh/iMvlPknITbZU9ddbnC6qKGDMuiWj94E4kCPWUUstH+l6DYzwIhNXRnZR
 jWXcM0lse6I24gDtWdj+k1xRMVJaEXAP+nqTMqhscA30IvA4tVd1uLkZowsyzhm14C31
 OyCw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUtVsI0itWmM9LdguBreshvAF+Iau5pcxXz7591sceOelcMHsJrXEgmves9VrCQXbNDoyYtCvmMXM6eNg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwEJj18pbi8VpVezIG//FQCDfwIzx8sHhvgyQXBZI6ZmXaxDBlx
 AFGOR8rPh0aslUB2zjK1xHlh/6QotldCQIS5dVHVfBUAQ3vIFeyMA1OLPJfIhjukx65BrWyj6Mq
 nmLGfyrtXFmpt/nAdYJ6toj/ZtO4F74pyDBKYTARxP6he0isZlhAwK4rUv7fOVYlP3RlcCSE+ig
 UXrrfHxp8=
X-Gm-Gg: ASbGnctdcDhFZGMGAA5bH3tfT8/KhT4F53lvPEZF0H2rZygjFYameFccvMGYJkoLO/u
 VEM0QWuXRE9YxxfOIZEo7ODTPqc822dwpEBKaHt/KWDvGbuHTvNtY8WhfDz4GLr+ZuriNhkO0nk
 AsC+Dyv50ROMcYYEfoFmrJ1gfgrlpGdY1kAGJT0bURng/FuEGSaqoh6KXOIVVm34OET7eddBK7F
 KYBVGFdWu37k0vkx2CJ72dUkNTwix+PvG4Vk3vOSUL6MrDnsOO5yh3Sd4q2F64qUoPwoSXZwuSv
 Xb1SehOKsqdqEVS2n7MrVmfWanM1RcKxAXoEYnFkP9zZv0QtFUXpVyPr/nCeKZsDUa9MYDa/IRM
 Y8/zkLS5jB6TI/insFiwRtw==
X-Received: by 2002:a05:622a:190f:b0:4b5:f4c0:5fd with SMTP id
 d75a77b69052e-4b5f8531717mr137696261cf.8.1757583007542; 
 Thu, 11 Sep 2025 02:30:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFVS5MMc+bsMDXcW/LDyPpJzdvX7Md47Pa7qu67qrv0jvmEfxL8qsY01l4Lv89+nv+0uNmnfQ==
X-Received: by 2002:a05:622a:190f:b0:4b5:f4c0:5fd with SMTP id
 d75a77b69052e-4b5f8531717mr137695811cf.8.1757583006940; 
 Thu, 11 Sep 2025 02:30:06 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b07b31287a9sm91470866b.41.2025.09.11.02.30.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Sep 2025 02:30:06 -0700 (PDT)
Message-ID: <96f7cd40-e5ef-461b-9dc5-44e23bdb4bfd@oss.qualcomm.com>
Date: Thu, 11 Sep 2025 11:30:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bartosz Golaszewski <brgl@bgdev.pl>
References: <20250910-qcom-sa8255p-emac-v1-0-32a79cf1e668@linaro.org>
 <20250910-qcom-sa8255p-emac-v1-2-32a79cf1e668@linaro.org>
 <175751081352.3667912.274641295097354228.robh@kernel.org>
 <CAMRc=Mfom=QpqTrTSc_NEbKScOi1bLdVDO7kJ0+UQW9ydvdKjQ@mail.gmail.com>
 <20250910143618.GA4072335-robh@kernel.org>
 <CAMRc=McKF1O4KmB=LVX=gTvAmKjBC3oAM3BhTkk77U_MXuMJAA@mail.gmail.com>
 <b83a59f9-16ae-4835-b185-d5209d70a0f6@oss.qualcomm.com>
 <CAMRc=Md83STGFYya5eu4j33=SQ+D6upcP-7fnBwKo2dPdTtX+g@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAMRc=Md83STGFYya5eu4j33=SQ+D6upcP-7fnBwKo2dPdTtX+g@mail.gmail.com>
X-Proofpoint-ORIG-GUID: tWUx85fpoj5T2CTY4YO0uCd8DYSWpQ9z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzNSBTYWx0ZWRfXyLZ7OzbIL023
 jEW31IinSXID7qH8kklEIYfcRk3U9mdjykUvYegy4tiDP9eRy7HLR3oCsGTC/zFt4m/coU3/E7S
 AU3+4UrfO0id1rPf5KuuD5J0AK1NyQVK7zpzEBtyESITGznshX67oKrQZWz4qWaUZVVNHNF+BdW
 mOvkdp0mMnUyXQmoGvGZlE0ps4J2GooE4rczvn0ExNb7fOrblH3esJ9dSjm925gdt8CpbNlDULs
 IIHTJaMcALBA2sLY7FVFujk4aBRaNsbXVjc+FvvV27K9+mRT+cHQnt+T9zdq0uoCjQZswO6i8bo
 MdhXy5aC2w4OC5FuOINorYARxHHUMOx6CEQH2uTjUZFR04Iq93vQcqQ2XrH+AzcGla41oJhZz5I
 tdmt/Bwl
X-Proofpoint-GUID: tWUx85fpoj5T2CTY4YO0uCd8DYSWpQ9z
X-Authority-Analysis: v=2.4 cv=N8UpF39B c=1 sm=1 tr=0 ts=68c296a1 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=KKAkSRfTAAAA:8 a=QdYl_KjyuFFhde6HtdwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060035
Cc: Eric Dumazet <edumazet@google.com>,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Konrad Dybcio <konradybcio@kernel.org>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org, Richard Cochran <richardcochran@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, Vinod Koul <vkoul@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH 2/9] dt-bindings: net: qcom: document the
 ethqos device for SCMI-based systems
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

T24gOS8xMS8yNSAxMToyMiBBTSwgQmFydG9zeiBHb2xhc3pld3NraSB3cm90ZToKPiBPbiBUaHUs
IFNlcCAxMSwgMjAyNSBhdCAxMDo1M+KAr0FNIEtvbnJhZCBEeWJjaW8KPiA8a29ucmFkLmR5YmNp
b0Bvc3MucXVhbGNvbW0uY29tPiB3cm90ZToKPj4KPj4gT24gOS8xMC8yNSA0OjQyIFBNLCBCYXJ0
b3N6IEdvbGFzemV3c2tpIHdyb3RlOgo+Pj4gT24gV2VkLCBTZXAgMTAsIDIwMjUgYXQgNDozNuKA
r1BNIFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+IHdyb3RlOgo+Pj4+Cj4+Pj4gT24gV2Vk
LCBTZXAgMTAsIDIwMjUgYXQgMDM6NDM6MzhQTSArMDIwMCwgQmFydG9zeiBHb2xhc3pld3NraSB3
cm90ZToKPj4+Pj4gT24gV2VkLCBTZXAgMTAsIDIwMjUgYXQgMzozOOKAr1BNIFJvYiBIZXJyaW5n
IChBcm0pIDxyb2JoQGtlcm5lbC5vcmc+IHdyb3RlOgo+Pj4+Pj4KPj4+Pj4+Cj4+Pj4+PiBPbiBX
ZWQsIDEwIFNlcCAyMDI1IDEwOjA3OjM5ICswMjAwLCBCYXJ0b3N6IEdvbGFzemV3c2tpIHdyb3Rl
Ogo+Pj4+Pj4+IEZyb206IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJhcnRvc3ouZ29sYXN6ZXdza2lA
bGluYXJvLm9yZz4KPj4+Pj4+Pgo+Pj4+Pj4+IERlc2NyaWJlIHRoZSBmaXJtd2FyZS1tYW5hZ2Vk
IHZhcmlhbnQgb2YgdGhlIFFDb20gRGVzaWduV2FyZSBNQUMuIEFzIHRoZQo+Pj4+Pj4+IHByb3Bl
cnRpZXMgaGVyZSBkaWZmZXIgYSBsb3QgZnJvbSB0aGUgSExPUy1tYW5hZ2VkIHZhcmlhbnQsIGxl
dHMgcHV0IGl0Cj4+Pj4+Pj4gaW4gYSBzZXBhcmF0ZSBmaWxlLgo+Pj4+Pj4+Cj4+Pj4+Pj4gU2ln
bmVkLW9mZi1ieTogQmFydG9zeiBHb2xhc3pld3NraSA8YmFydG9zei5nb2xhc3pld3NraUBsaW5h
cm8ub3JnPgo+Pj4+Pj4+IC0tLQo+Pgo+PiBbLi4uXQo+Pgo+Pj4+PiBUaGVzZSBzZWVtIHRvIGJl
IGEgZmFsc2UtcG9zaXRpdmVzIHRyaWdnZXJlZCBieSBtb2RpZnlpbmcgdGhlCj4+Pj4+IGhpZ2gt
bGV2ZWwgc25wcy5kd21hYy55YW1sIGZpbGU/Cj4+Pj4KPj4+PiBOby4gWW91IGp1c3QgbWFkZSAz
IHBvd2VyLWRvbWFpbnMgcmVxdWlyZWQgZm9yIGV2ZXJ5b25lLgo+Pj4+Cj4+Pgo+Pj4gV2l0aCBh
IG1heEl0ZW1zOiAzPwo+Pgo+PiBJbiB0aGUgY29tbW9uIGRlZmluaXRpb246Cj4+Cj4+IG1pbkl0
ZW1zOiBuCj4+IG1heEl0ZW1zOiAzCj4+Cj4gCj4gSnVzdCB0byBtYWtlIGl0IGNsZWFyOiBpZiBJ
IGhhdmUgYSBtYXhJdGVtcyBidXQgbm8gbWluSXRlbXMsIGRvZXMgdGhpcwo+IG1ha2UgbWF4SXRl
bXMgZWZmZWN0aXZlbHkgd29yayBhcyBhIHN0cmljdC1udW1iZXItb2YtaXRlbXM/CgpZZXMKCktv
bnJhZApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5m
by9saW51eC1zdG0zMgo=
